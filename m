Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97EAD134D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 18:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B8F10E06C;
	Sun,  8 Jun 2025 16:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkEbE8E1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BC610E06C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 16:28:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558DWS3s028873
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 16:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jWRkmGUO0Z0naTDE1aGeIyoD
 ro0cg0ulqAjDzhrEvgI=; b=TkEbE8E1hyFCztL3ybV4bvCjY+k5ELgHFw/NBdCt
 dSEUUCCWxZK2E0R0yKdjLvtca2stAL6U8Bd3nJE0tzwgr5P+61TfIWquqfTppFiR
 nuixxSSsQp92Wxh/7H6NOJ5mbsbRZD341RJX/2H6MdqPrVPU50sfx4qlyaLO66fQ
 fvPpwvty1YghSIWOEMg5u61aL5keBiUEPakmDbLRUp5dshsRr4jZGNDNbC7KEV9o
 ehI6tKnkzU6vlDWF+DX2tfMTpONYXABjmNK5Q1DZE48yIQvieonSj3RZP+O7Aq+n
 gM5i27zBSkvu3DUVIazd0Oo7TZgb4Qok+ZlPGSlYPvwRQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9kdjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 16:28:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso729374285a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 09:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749400111; x=1750004911;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWRkmGUO0Z0naTDE1aGeIyoDro0cg0ulqAjDzhrEvgI=;
 b=bGD1gSL6it8BtdA9oAYFYVbw0rMvrBa5pVM2kfEkyFC3ibEywz53jmLChv7hRxxzLw
 bJ20974iylC3pdEcl94F0xTaaphx3ADH3A6vgmZGznIH5gT1R3zAllO2QgyMNQqJHN8M
 u0axGlppU6KpQWFhlZjO16eRLPWER357do1u5U1PGyGsJ4BgdhiNt9LbWzp66+1LfrRy
 CvyDjeya+1tiIye/9Yw6U5q6pq9JhYh/iKexa39pUZaVHX0dLsPcjwEa/GbJkAQaWN0V
 HJ2Q/5pYXDEiBMN3JuafWQsc6FrWpRYB0Z6PiEZcgWgkkNa3TqKCwlyYV/M/OEq3TTee
 OEDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbICng20STNFxTUMiXSw5vm8d39CGQVjwVxrZHNHyT9YZnFe6c6DJ7SwmZdT4QNLodDun4wbi6EiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1Pv2hBn2hb+y3iVeRuYh2lAMyj06v++zyH12EWmzmlBzmhP5d
 nBFety3HmStH4xsvcTuQULutu/zYY0Qa9tq7L+VzcgZTCWdAHbSjp9eBXnj2YvHQmkvtjD6pmxl
 XDFklUV/UfQUJojmuvlquvIKpuTc/QjQpeU7f3socvbAVe2lo9Kqlwy7p0OARMMB6lPDtxzU=
X-Gm-Gg: ASbGncuyGiltRV/IQUAbrt2fSLzIlrIaKRv9oGk1uwJXG6QbZirqQyb71bcs37ECdm5
 AGQAZDO6/bJFepebSvOMReeQXVqMZoYKuvp8mtVLUkWhOUVmCBMJw/maxMxPifaJ/Vs/5nT/+ey
 zQ48BwgOrGFi8hWdw722WegZvGoWpJBFHBgljnxnRDsEqjXStiFtPS9dsioBFolr8hhVSkE77Lc
 TFC/9Uxeb7fmQlA9ZulBC0lwKOg4dB63qwmb9aSa2e1Ql4etx8QKBYuQOlGMD/KmaJxM3yzlOos
 CFylKlKg0wYVyAHRnt5XPi22oYMLdaQtCrOE++hI+wxb1zAGAu80E8BpU3Ist2xkpTTdxzKpxXb
 1pzk3FgqKdA==
X-Received: by 2002:a05:620a:6002:b0:7d2:15e:1f9d with SMTP id
 af79cd13be357-7d2298e09camr1663712685a.53.1749400111676; 
 Sun, 08 Jun 2025 09:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWEVhJTgeAz6GkYxg5OuHTjWCXP5unAZCBf7CnVI5/FdXNXAgyPWDZnu1N/SSMsH+pLdql6A==
X-Received: by 2002:a05:620a:6002:b0:7d2:15e:1f9d with SMTP id
 af79cd13be357-7d2298e09camr1663709485a.53.1749400111341; 
 Sun, 08 Jun 2025 09:28:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b0cdddsm7492251fa.21.2025.06.08.09.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 09:28:30 -0700 (PDT)
Date: Sun, 8 Jun 2025 19:28:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/bridge: analogix_dp: Move
 &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
Message-ID: <a7elluf2tvemsrvdomzb7mfiztpjcsqjlruorcf4ua63rzq4ut@4dwnqdv3qins>
References: <20250526120742.3195812-1-damon.ding@rock-chips.com>
 <20250526120742.3195812-3-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526120742.3195812-3-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=6845ba30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=cGmNtDV8R6BPqPJYracA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: el_Jqn_DX_GH0hLmOqUt5IC2-Znu2-u3
X-Proofpoint-ORIG-GUID: el_Jqn_DX_GH0hLmOqUt5IC2-Znu2-u3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEzMSBTYWx0ZWRfX/5DagQw03XDW
 uQJ/lk9UUhoVI7r7Yv3CbBfickbbThV3MJGfoDox7KpzneU0ZCzm4yTbPfslmdeWBYFslevHpc6
 dSCD0UgmES41Jmt4QUnIbGCo60gdzfWEAYOYoQevWH9dvJuOlM7vucEpkYnikQ3aC2TDJdg2cxq
 4Z0FWBwCzUzrn5wzrsZlBC4xhGC4rrU20CQlqYFShthKOMCODlu9ebeT93nr+nB/mQlATr2e1UD
 raNiLpNrkzlDlxOy5X5PnKIDoSiJyYtKNxU1Ug7GCk8TXT1HYXnKxcx5Zst4tWt4hMpH88CsLJc
 Tkhu8jaLDCXshcKQECTDedEbDBznDA/iyVnqh+2KTIEpw8B7If6FfXPZl3wxkRpuwPs7E8+xyFx
 lh+qRd7h2u7qcVoUCvPCkTYPyN7tlv0FiFNfNg5qhaaIdnw4vJcRYy0vXAiNAzSOM0kOKnNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080131
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

On Mon, May 26, 2025 at 08:07:41PM +0800, Damon Ding wrote:
> According to the include/drm/drm_bridge.h, the callback
> &drm_bridge_funcs.mode_set is deprecated and it should be better to
> include the mode setting in the &drm_bridge_funcs.atomic_enable instead.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 161 +++++++++---------
>  1 file changed, 82 insertions(+), 79 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
