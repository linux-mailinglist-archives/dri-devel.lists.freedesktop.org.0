Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9AAD2144
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547A810E3BD;
	Mon,  9 Jun 2025 14:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzHTThpB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547310E3BD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:47:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Lcji016705
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tuaiCNKngsyuTcrXO4lY5lHn
 ox8s7k7WOsTYEjpg4UY=; b=UzHTThpBROAclNP4kYRtw2hgs+cIFI+Ns8+D06xI
 2QX19W3nKhoQWqy+lhNiHpBbDVoMipsjLpj7usoMWLcn/0bAqXMpFwe9eY5TBaQU
 KSQd4Jk0NohfT5IJ96bEScFkG3ScRjuMv5WXw6swSMH1JGel7zcNYx/dx8pPnisD
 8Yw2EBWFUk8JptUvUjAYZfOd9v2DQig5RKZYtVsuKrXVMVh3/lM4Supzl3rmqVv4
 1pjbyp8o9HTOwPFt1rsrEGIAFoyCly13F+2ANap7BuQyle9gHh0RsiGJsuknGBaF
 zxyvCkn31MtVaCDx45FVe2yoVRYnFXpxXLexOQCmuG4M3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6694p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:47:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c790dc38b4so753611685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480470; x=1750085270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuaiCNKngsyuTcrXO4lY5lHnox8s7k7WOsTYEjpg4UY=;
 b=Ms/bAYOifomSArMTv1KNKkJxi+STvx5XPs+bsyL5hUvln271B5a0BfYzHBHMp7p6F4
 iGCzh424Pix0wvPED3fxiTkmFDGVDXQP5qXaX0rR7mqciyrjBSBM/b90pVkaAK+1g2TQ
 Uc5hnSuuIaL1A1G/1tI4Phg5+tL9qheLUPQVW+Y2tkCso6XQ7W6mEw0gAPJ4XLTr3ywL
 XvdfLMRa/GRToy1C8u/QoKSBrW/wym+8P4EawE1HQ/X9PFWAMdv91X1hEF2k7l9Ene7i
 rb+urh3Q5cq3Hrwj1//B9vVhQZcm2Pr/vUkkDS/ae93mbl5s6RIcjO+fmZZUl3zOXWFd
 yDjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyEyWleT1gUNKSmt8PH7HLsn7NsJ0U01MXm3jqNLVtb2pVN8v46FotUBNjHhbxZKvwmGuzGXewQ0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnaU/O6Wwdak6l5634k5306JS2ytDMtQeUSUHKxO2kFMDPO8fs
 w76sVXMhRoRcPJozl1uSJh5rNw9IL7+ZHLtxd4IKDetRPFLkQvY7IxyDrK1ApPmvt0KpMZmsVHj
 vYNtZQu9VXKKE5YZFAkHPvhD17aZSiDPCZ4dDv6qiwbglai3cBNqYRqW+DjxQWQ9BkHfRFdM=
X-Gm-Gg: ASbGncthWCeC1d9+F0ZvKRReuB1aqydMkYZhLKdd+cw46QNi7iZo4oaLyz3AGg3W4KX
 VIt5KOK57U3wh/4oj5QeiRee6Wh/ySJXz56P7xdY00XaI92SYFaDddl6beq5oVEo0vxwjK1jVZK
 6cP4VeZskJi3JSeRpit/sJc9kJxXnps/nInB5B+z5+JQ1pvrBi5Xgd4GYchvmmKti37GKMlhc9s
 gmiRcnmFzFtpOFhiOc8t1qLw77JmeJsFCUAaWAUjGtcb/TcomItVvfsSLW/8i8SWMfUhIMv4New
 VWTVqjlNzVMSrUbuLIeyJmNszq3hYp3TM3iZZ5QKIjbDEGii5LEFIO2+3Wvt2++JARiDp+8achX
 4Qr7WII/uzg==
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id
 af79cd13be357-7d39d155b1amr16768785a.19.1749480470633; 
 Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1IE11ont/nfDyhFTaWdajrMX3DfUNne8k9aK+3myxAzvAYnGnjtSxABOB2Bn0WlsuVIf9WQ==
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id
 af79cd13be357-7d39d155b1amr16765785a.19.1749480470260; 
 Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1cab5c1sm11928561fa.54.2025.06.09.07.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:47:49 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:47:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 38/38] drm/msm/dp: Add MST stream support for SA8775P
 DP controller 0 and 1
Message-ID: <xx6v4lfd5cv24ce2kqtt7kverk36snydypeaq7h2hgjti5iadq@japcugke524t>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX59acg2kyZXUV
 ydpY05bNmphYhhzxsn5q6ENAjQ+gEhMbKxOdbp4OW5ZyiPpYfe/pIL7Fr098r5rwrYQEGcIiRh1
 qlue7JNZMR+oVJSjc9l8CDUTVJOMsU/WHcIaATOYt9zN5XafezHQV2fyhvix6tDfvh0Ca3ffD8H
 LUOlk9XZle0uOF060rtxUzLXFFw1BIVHaRO+ZWWHIc7Hl438l73I6rfDhkA/grXamEEFkUD2ugB
 mNGupyJcsu5UMgsrf5QjIZ1tCQsQ23sEbEvj1n60SaeLuJFeLQwn4n2FA2g4hexpHCh9ulpyGkx
 D1kTU9inqo6O4rX9u3UGvifClvgINExP6kt6ZPVPLOjWhcP4FE2fxp3RpJEDrTaOZvQFX5u+DU8
 iM8cSd6zvMlYfTgVGMl/cb4ID/Z9zod6d/QplwAT+OXf8+keotKASs6UUe8y7rk3ow8c3pot
X-Proofpoint-GUID: LSXn-ErkgOm2Y5wb4thgq6JQhwSnJrxL
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6846f417 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=xwcYTDe4h3asnKb2uucA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LSXn-ErkgOm2Y5wb4thgq6JQhwSnJrxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090108
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 09, 2025 at 08:21:57PM +0800, Yongxing Mou wrote:
> This change enables support for Multi-Stream Transport (MST), allowing
> each controller to handle up to two DisplayPort streams. As all
> necessary code for MST support was already implemented in the previous
> series of patches.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 75f2fd7c75eae81e5c843f8ae2d1ce12ad0cad7e..16196dcc9ff4ac6a35b6bcd8d433b08f7d18fe5b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -127,8 +127,10 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2},

I thought few patches ago you wrote that this controller should support
4 MST streams.

> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
