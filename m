Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86CD27C94
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 19:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62DC10E233;
	Thu, 15 Jan 2026 18:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1KCB4Ad";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZ8S3BKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE05910E225
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:51:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYLEv2701859
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MwvMaN+xjoWX7LctT9cvIp+N
 AYlffABN5Q6gMAayBvc=; b=U1KCB4Ad/GLaaHCvGY5yn/ZWgHOCVvrQ7EpZluHH
 aMxE67GjFWi3AkL+xa3eILtWKW0fR1+jL52e2d0rpEWCL/Um9QIhBNVw+J/mFtT0
 Xk2rXWYRelP38Ysj2UDq35bCUAyBX4sWUOJXRSlJGI39uioIroc6zjh6YMsIVwNf
 ONr3X/SA6OwjHdoa0U/ZQJnwX2lgxl0TiRR2JZCUR6r+UXzahfmUkjFgzAB9L+Ph
 puyGiqvgchWTDe6cfQjweOiL8TN5zbl5mkkbquftAUxNxnmpo5nWLheMs7h6vBm3
 n2WdayelmbvKgqVr3Nffx9WpKTZ7KzL/2uHQhyxNPXiWUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pun11-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:51:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a69b7813so20816385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768503098; x=1769107898;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MwvMaN+xjoWX7LctT9cvIp+NAYlffABN5Q6gMAayBvc=;
 b=GZ8S3BKmG/z5vUE7vbX0TKq6YIHbeyq7lrDq+jLunEavZ2cYNm2JgiVoblV4SmRC+8
 OOAblOn5dNsWtEmMASOnDv8EXp5wIsXYP8QysNQL0NnwH3cBUAGxhTUtlF2aSgSLsMXV
 3I++x3QIdluZccMWNNch8JnY9Wx7eepRqEV560zobPfWhuRh71j65LkquRdfACUItnhx
 vexf0Ag+o16Nh63UTS1ZJZZj/QfwwqoCKbjMnv7OxTZXqaNMbddqEBm2LNSv0AopibBR
 PNegrIMAe5Cs9g8bVrrCQu5VMofIlwa6humvAOZDfpOIDQQksJbloFuG6ZuoTfDiHTTZ
 LA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768503098; x=1769107898;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwvMaN+xjoWX7LctT9cvIp+NAYlffABN5Q6gMAayBvc=;
 b=TnmPvALOWK3mGRQ/YMtvLm8PS/M6syKj8n7uWICqYoyO1sbQ71zK03ohhNfiECxGfl
 Rf0ruSNHC70R35oAJ5TzxdiBGzNq9tgpzYl2OYss8vKn7VZW8M4t6ScHkRRRZ3qVMyHe
 jZH/Tlx6k7RyBbZCbagOYlyGCmVmso1FQ6xtZkKn7ZQv6fnUXYhfYEpcRO6JqyQm4nJH
 mWQj1axw3XTiMYn8BpZUGrxgVRsx6qUur7hdodNcCglF4QQYuRhkU0TnT074IWAnq/9V
 ZUx1a+BLIhRUbyHZ8hSLdvFzo390PgseFPVLElrnwXgQ3VdHXj6Km+NuKJtQlce5GGn9
 dudg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTU8lMRAW7xQ26lfyyqLOMNFceTFeV2+cFQewd0Yzg+OSLhz+ajybJ/ALaHBg2kYAtvwS/XpXjaL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX8eGxG6pOaQ33ZhBWPNG8F6hLw+a6otU4o0T/9Iyy6UHx4N4y
 j7j+LvnOEBaBEP7JHVSpOcH5H8lVEQfKNWy398yEvAwR/ATqnuMY37kZNsfLFOeacREdnzbKJXv
 NiMAF4N3v7aQhdbTjY46j5pWn8N/uYjkkt6iYohDMX+h/u4MARKNDY2U5Fgvl0Oqu0iq1nTU=
X-Gm-Gg: AY/fxX4IGTi6xvdjhF4+V3FhTtTasitPkIT4Oz7d4lw2OW+acMAY2ZnaL+iVqnCbZAS
 w/wXo2ofZ9aVhbSIqedRiyW2eLzfBxRHkXm3yTp1J3aE92LwyQQ3Q99daVEQbf+A6rzyCwBBuG9
 3ZBKuT+jCfKIq7UdCzNizPSgIPDTg7PsN+bNhuA4sbdo37u1CLSNcqQxODhD0MP7MmwL2tW8wzw
 m/of4BM0NJkH8b+OBlTHdd6qQ2tnues9GPGbN6hWKuuiYThJWPAV5TIBRmMYQL1R2RFU04t27Lm
 txSubtyUcxVp17jJUiSBv4+m2a+WcbzDh6HM8sobhhx6fwL1jqzSVDVghRWDQISKFsICNFRKXcv
 egrp+RpiuMeagJMBVe7gcPG4r5faoWTKcpkRa65vXPa/LDCRiGIR3G8kgTVZCkaEYCOmPUzwAqE
 umISSqHzfGbDQtjlF0892yplk=
X-Received: by 2002:a05:620a:40c7:b0:8c6:a5f1:7954 with SMTP id
 af79cd13be357-8c6a68efa1emr57945185a.38.1768503097752; 
 Thu, 15 Jan 2026 10:51:37 -0800 (PST)
X-Received: by 2002:a05:620a:40c7:b0:8c6:a5f1:7954 with SMTP id
 af79cd13be357-8c6a68efa1emr57940685a.38.1768503097263; 
 Thu, 15 Jan 2026 10:51:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397712sm70984e87.52.2026.01.15.10.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 10:51:36 -0800 (PST)
Date: Thu, 15 Jan 2026 20:51:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <rwxrhtnft7xb2geu6sbyhkw7n6bu6em4aiag2glyhudmbt5cxa@wylxybjpfhkl>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
 <x72w6pys3ph7sfcpp2drowkv7wkis2vf2z72eokgo2m3mpiod5@ykuxvtdfcnpf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x72w6pys3ph7sfcpp2drowkv7wkis2vf2z72eokgo2m3mpiod5@ykuxvtdfcnpf>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX66tAAx0Gr5IE
 XSM6OVMI9pnC82I4nHaA1yNzR51iip9Wjip8k0uc/MLsecfxDsQk3R43bg6bVBMR/bk7zAXiRrq
 rgh8Oc2WUcZXESAGtGcf+2pZtNusaRN/1t1wGdeJkpGrBbFOBj7r70NM1zdqoMPvXybWa7zv4at
 ssjJWSFiO3U8fLqkbvmmkKOWUTO0epGnNtRzOOPW0oPPS+y5BzS+1tT6gIDyGEN840bgVBsL+BW
 p/P+mbw4t6pJyQ4gXvmiWiVjisP0zsCH0P+QlZ8GErpAPJ/cq03/dTHihQOPP6HKB2vTSYcwgzJ
 2a2Sj+igfzhpMhRKkxUH6bfVIpAknKKG9I/uq+i/en/WBLQHIzkbVvnMkruzdxzErqDgu2uYCTr
 ADoqhKQK5nIG4J259vHy4Sf5SoVJGJxenFJ2bQpkbgHucl15Vyq4yZTDQajSoPD8lw+FA4+HyAI
 fjTRinHf83YQv1SeOJg==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6969373a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qZx5eA-RdBno99Z2FmUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Cc7jIKWX-F2JFLQcCXJ2iyYZoK1I8eEM
X-Proofpoint-ORIG-GUID: Cc7jIKWX-F2JFLQcCXJ2iyYZoK1I8eEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150144
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

On Thu, Jan 15, 2026 at 09:30:22AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 15, 2026 at 09:29:09AM +0200, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Currently, the DP link training is being done during HPD. Move
> > link training to atomic_enable() in accordance with the atomic_enable()
> > documentation.
> > 
> > Link disabling is already done in atomic_post_disable() (as part of the
> > dp_ctrl_off_link_stream() helper).
> > 
> > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > of queueing them in the event thread so that they aren't preempted by
> > other events.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index a05144de3b93..3184066adb15 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >  
> >  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> 
> I think unrelated to this patch (and series), but do we really want to
> keep the v_level and p_level settings until the user reconnects the
> cable?

Yes (or unless DP RX requires a full retraining). It's a part of the
standard.

> 
> Regards,
> Bjorn
> 
> > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > -	if (rc) {
> > -		DRM_ERROR("failed to complete DP link training\n");
> > -		goto end;
> > -	}
> >  
> >  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> >  
> > @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> >  		force_link_train = true;
> >  	}
> >  
> > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > +	if (rc) {
> > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> > +	}
> > +
> >  	msm_dp_display_enable(msm_dp_display, force_link_train);
> >  
> >  	rc = msm_dp_display_post_enable(dp);
> > 
> > -- 
> > 2.47.3
> > 
> > 

-- 
With best wishes
Dmitry
