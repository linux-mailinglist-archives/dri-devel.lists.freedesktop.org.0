Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24939B1F1AD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDE210E98F;
	Sat,  9 Aug 2025 00:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdaISzC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB1A10E204
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:38:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NH7aP009137
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PTg6UPUR4TJzotk+aFNe0dYyDOUiRVQtN/7jSRoavTs=; b=LdaISzC6Mk0H1f3L
 7wMT0DTVRifFjawkSDKdtlKTtj9B5XZw3HSXv3Qh036YEhFB9Gk6oRvW9wDquURO
 opBBDh8NxQOpZinl0H7xKsxepoD8guczKynrt0ZcqcOdWLA0bz1qlru7VV5X4ggR
 XAAdsAW/428KfD22FTODzhwf4ugbT3kl2aXmzPaoKkBFCfVQRpabZcB/NyZqCdog
 6GuYU7Ia+UgQ06g2Kre+QDz7pB3BsiVxTDYg/N63eBkpU8f5ncGBoJwLBjEUfBu1
 GgaA34FlsmBS43Y2UVpaZDHBxwLrTB2VFFvMlYUFAiGTrVqIvEuJyNs9NY6uxzvg
 XYQYBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw3bcc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:38:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b08b271095so71529971cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699908; x=1755304708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PTg6UPUR4TJzotk+aFNe0dYyDOUiRVQtN/7jSRoavTs=;
 b=Rnz7+9b9wm9aPMABeOqBqCNmWRywGF9WgJC+LPucGaXGOm6p3EFZ+y0OQ00p7x87Fs
 4Y5+q7J5U9b2OZEfecRXq4u25G90D/1C30421FYZWpzO/MHR8InCaEa/pnSASjSV8qu8
 +yOSprPVd2TzXwbN/a7DRl/aAOtSOnvnEKLIKTuO6T/m20zEMz5f7l7H3eUugLnz0TMx
 tozbZMwc5Lhpn1CiZSnigKb0AnYU3GJGDiRksoQAEgfZaHSTk9mVLb+wspp4IuMOt4Ho
 3Cv3E1TjIqMrrBUlQgSV9/+UsnY/C0zP8IAMmteI5VfldHRj2wn2jsOgwO3M9tTg5+oO
 IXgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqBa8gRLaAHDTsn3yGoUXvsUO7XJLhChSwwJRP/uHJGg8fy8ptnxwYn6ck1KCairqOYNxhALQRbj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVuNRFwhADecHCSY0IfO7lwZksQV197/4uDqH4nU5kofAGvhjL
 Q1jDUMJGdwoHkVHGAZfvsPyOVRDiDoyQ3Th+cmWnxeU5DQlH7DSR2NTP8Gh8xGXxio/YI+mVPrP
 htvBMMGoZRH32a/Quh9bcLKhNnmfwO50eStLr9Pu67OU73GETbfB1G4JFnNZwFKeT7xXeoAs=
X-Gm-Gg: ASbGnct+cMAEpfXOBzfFSyWrrOEPM8OKG1rq/FJPtWlre3+cNJxSkVas398fi8mRkUN
 IG/IuYcoGqPZrclQjRRTsRHz2JQEr2wWHsdRoadzPDWsvTP8jHBiOYDaZXnZVKnRx3dPJzrJjx9
 24x248fW2szEZSpNYsCQygNhlDvkD47b1pOlLqRYWsQ03JHV+jXQMJR62RK07lrvkDWrD8H2NnQ
 nYgWnhcMe3FvPD2PK+cWtt9hxpamI0A7yQdCwV32wOkg4Rx4BAsPAu7Y8M0GjbSzRy1q029sQfk
 TjHdkZuuzu2u3mEKS466dt9g0y4//OEnPhTYsdsQNrJwifMY4ej2iVxjWWgFA11Sk/LNqrqoMS0
 T1+06OnGeKHJicqBNoOySujKZwhT9Bho3rBESB5EcW2M=
X-Received: by 2002:a05:622a:4088:b0:4b0:8e0a:f095 with SMTP id
 d75a77b69052e-4b0aed6b5a1mr75846311cf.26.1754699907723; 
 Fri, 08 Aug 2025 17:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt0Zzzi3J4BDnMVp/K7JP6Y2aCQjHuVGq6KrsN8qluameirnzlp9r1HdWb2M0KJC5/NMX4mA==
X-Received: by 2002:a05:622a:4088:b0:4b0:8e0a:f095 with SMTP id
 d75a77b69052e-4b0aed6b5a1mr75845831cf.26.1754699907027; 
 Fri, 08 Aug 2025 17:38:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cc9af8413sm13671e87.28.2025.08.08.17.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:38:24 -0700 (PDT)
Message-ID: <200ee7f2-ac66-4619-9401-220dc578f8d4@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:38:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] drm/msm/dp: fix HPD state status bit shift value
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXxn7aqM7nbbGD
 JNsU/qePEk/d/dQoP+y/6h93Pay0cGQzMe6Cab9YQbqVOQ3uwExSFL6WhUrbWcT9U0rRVhJt0kB
 2dJ4xo30qtotK5emU36cpBooNofcQMUfgqFa4V2jb+Z+ezcFFoY3woUro0dhpKk6js6dAy4oFle
 L6MdR5SLKz2fqXtAc06xEvyANJK6QZMqc+Ym8FSVJsL8nhu7HZItyE2W+PsZjn9f2ARl/YOXMiZ
 9INUB4GY9KNoMnEv0eHYVhjEtvTi16yF1RQYMdzOemzzTXT0meCMupgKPsjMloFjlP7VCaCEqCh
 KJEwTBkdll/NmQ6uW4PWxc7f+TmfyGsvPBRqXmkISpJQEiFW2vG/oHGyrgkTbBcaf+ML5qiIIED
 TsJdf92N
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=68969884 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tINfiVESruKu4bDgj1EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xmFs_iq5BSkbFr7tq09xkd5_nKLtUgPX
X-Proofpoint-ORIG-GUID: xmFs_iq5BSkbFr7tq09xkd5_nKLtUgPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
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

On 09/08/2025 03:35, Jessica Zhang wrote:
> The HPD state status is the last 3 bits, not 4 bits of the
> HPD_INT_STATUS register.

Then the mask is incorrect too. Also, I'd suggest using 'most 
significant' instead of 'last'. The latter one might be confusing.

> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_reg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 7c44d4e2cf13..b851efc132ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -69,7 +69,7 @@
>   #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
>   #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
>   #define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
> -#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
> +#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
>   
>   #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
>   #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)
> 


-- 
With best wishes
Dmitry
