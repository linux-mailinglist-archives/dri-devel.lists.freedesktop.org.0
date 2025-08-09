Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C943B1F1C3
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C83A10E99F;
	Sat,  9 Aug 2025 00:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjDZdxC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400EA10E99C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:51:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NHjZA010237
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hoY+FkRGPvkEWeTlAjY+LGALIacEK+UKYHyKEaey/U0=; b=SjDZdxC1B2ihfoPV
 zJAtoPipUXkKb9YvMUdmfZBd2sq8xucQF1NTwsjKMkMVf0fV5kwBpGW0A/CQ3176
 kQ7cKSeB10YCLn0QYM9H2lhzJhinXEOq+PIocIugDPcCO6qS3TSccJqkGDqtrQTP
 fqeDz4OR+5Ih7n6reDWAK4e+ts4LdA+mkqL6xeZ3YqgeekY9rjretjbHRREnbZgb
 rTTGDjAcJ1l0DaRxBwMRcy8qlXRa6WJihdvoaMXV7lSYjYWPCE4NbnIph4DzmnS8
 Z69XxojM+rCFAhHfWXrMXhrKP70vNfBHnwAVGOZ6P5reSlqPozzsisDW/9V6s2pG
 2lU+Aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw3bd0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:51:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e686308729so656291085a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754700680; x=1755305480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hoY+FkRGPvkEWeTlAjY+LGALIacEK+UKYHyKEaey/U0=;
 b=IsAWzWge/J5Z94x+CaqpEDie8blQFkqq47glVfNuvgCiW53CEode9Id1jyvuF4epAe
 b7XKZVozh5ITqniWskaJRp9kQ9Ekz5mF9yIktG3nk39lGjgQDDMckHqgMk/TDCp7ljfl
 ERGVENXrJDz1pCIwnPFKB02073Z40Ck7UBa64TaQiyc+k5wwf0xerP/AoIctHa8hAP8N
 tTlv+3lnAoXb9NxBreoQC6RgkCQne3Oj5VtUy/GGfRubsZzqbCjsfw4BY4YgAGYLKmBr
 BId0M7QXa1rpW9Gvqt1SAYhywbr5KmZJJ//UhH/2Q+doNnS4J+kkF0BgnhDrWVuT6O/2
 NF0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD78I5qqZ0KNc3n+Fr4GNqfL2Z5MH+usJgG7C/29ZICbWGvZHPUlP6no1bytkYJ67MugyJx1nkmU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzwJCnZ+kD9SnYqT0cxFzMwVcZvjsD3ygtLWiq36ln205Np4WU
 XmGbgGmVPeMqIeE5G0aYj0Y7tTMm5F3UPyZftbIEiwaoZFvpqjGXdAn0d9FH/fNVDTmnCIV4tgs
 gfVKvtZefunSdwgQb8G9gTflwK27X72Z1yaeg6s470PtNyIVOT0NVFkjY1hX8zooFcydLKxo=
X-Gm-Gg: ASbGncsZ3PCj4opE8ZfKlHxIWvhoa1g2y6JuI6Vps+hCI5aPFc4cf63EridcRmu/f8s
 dtkg8hu53lWdO8wTbMcBBopPW/1Jaa+sSGKsmGE3K2kFeJ6+FhXtyset3en0GaQ9y3GBpmhPGU4
 OOB9tPk+swxgTJtI8I09dXa6TPFAGk+DTwFPXrmQW6L99vTgtVQx9UY//Iyucd0d6Cx6SCb+CDx
 8AaXYj0ysTLorDLqRunmiD24oSrm0zcjPRKHYkF3OBgjIu/Y23Ou/yzCyxg6772BgPbKgtyB10D
 4fQ93ttbLkB9PRBrxriDkfh9A/PT/cSNZXNF4FqBle+ZV6UvPgNbuSdLvKHSzesEQQHVHpc+ZG2
 YT8e4qk5cEdlOs4QDpIDDrXTloD0pTLKbUhYDVLcSlsk=
X-Received: by 2002:a05:620a:25ce:b0:7e6:2f6a:5bae with SMTP id
 af79cd13be357-7e82c7e299fmr653882285a.62.1754700680415; 
 Fri, 08 Aug 2025 17:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPoGDX+jX9Hh/iCn+TDzNM/k/SOiIlgU5Ry8cmMIkFdfpBCLAzWw1Nb92a+F2Yl2/QRzGpgg==
X-Received: by 2002:a05:620a:25ce:b0:7e6:2f6a:5bae with SMTP id
 af79cd13be357-7e82c7e299fmr653879285a.62.1754700679888; 
 Fri, 08 Aug 2025 17:51:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238272dd4sm31445181fa.17.2025.08.08.17.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:51:17 -0700 (PDT)
Message-ID: <8f59ad23-4f86-4006-8163-a1feca3ae346@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:51:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/msm/dp: Move link training to atomic_enable()
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
 <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-4-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX2/Ts2jrurICc
 BS9ypcJ+OsXbUr1iEmrAvweVTl4Aeuq3eIrg/Yrf0BxOZYRA7At5DsaGS3uNtkKjU1E1hcYEH5T
 BsqpEREQ+yGSjIRDy31CmyVy0tAltEMFP9WTaBzednO9AAgxJs+eBKbXI7hNX4EiXDIJl3wc0eY
 3f91k/xcdO5P6qGBl7EWX7VgUyYZlVVSa9+lH4gEOSIryot3duQITAZnWGTXL4Tkrv0Z5O9jlbZ
 OAvQvy873IIfmd6Q9s/+tqYhmAYLLqHHdoJOpm3ceLtnFB0LaH/t4kv+RSKLgU/i1VwEqN3JOzK
 yzIxfm4jmRLmsG821l5r1eitYoEw/vC3CkRnp91OgWGcIHYK/D+OIORluvCs8mPzvFyEEgCtHGj
 eSGriulY
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=68969b89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tir8h9pnGiVj9xZly-MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2uM1Ao6TCyebtpudGUwPGbRKDN0PfGOt
X-Proofpoint-ORIG-GUID: 2uM1Ao6TCyebtpudGUwPGbRKDN0PfGOt
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
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e2556de99894..c849befe58f0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -427,11 +427,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>   
>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>   
>   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);

Also at this point we enqueue event, which will set link_ready to true 
(which is obviously incorrect).

>   
> @@ -1680,6 +1675,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   		force_link_train = true;
>   	}
>   
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;

Add a comment why it's set directly rather than through 
drm_connector_set_link_status_property().


> +	}
> +
>   	msm_dp_display_enable(msm_dp_display, force_link_train);
>   
>   	rc = msm_dp_display_post_enable(dp);
> @@ -1839,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>   		return;
>   
>   	if (!msm_dp_display->link_ready && status == connector_status_connected)
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		msm_dp_hpd_plug_handle(dp, 0);
>   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		msm_dp_hpd_unplug_handle(dp, 0);
>   }
> 


-- 
With best wishes
Dmitry
