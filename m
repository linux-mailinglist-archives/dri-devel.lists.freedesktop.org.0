Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FZPAqVnl2nfxwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:42:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7F162193
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A3E10E742;
	Thu, 19 Feb 2026 19:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sz1AkQez";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVaRcHcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600F010E742
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:42:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61JH3PEv1009132
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sqVevzHA5yFYdbn4seYcAEFxgZSYb3dH9h1uQYK5+vc=; b=Sz1AkQez6keY1MSh
 QwO1Th8Who8Gg/x7ChJPUMx2HZCqpHAtvNmHavqJcKyzzCL8LoHZLm5Q58l7tPOo
 L1RgQ6b/rcW1h1l0t6xv3c+CrLB5CFL5zqOihuSldE3Ae/kUmZOw7k8oWDyJyc0R
 r5hC0SzLt1YSTtHakD07f6idnMkpe7wS65H2LcgkJqBsKjVr1Ilc80lmXtEgNSz9
 BedTN5BjFnQ5uvPYVOafSaZ5vtuSHzMI1Np6KrmpYtVNvBMJ9qGqp945Zj+ozR7W
 sC1OSqVaiSmWypVIsShtjbSq23FxrrFCUidQpBcTGNwMX0tg5YQkkbrUrPYpbzA3
 Vy6yIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2gehe32-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:42:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2aad5fc5b2fso11452645ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 11:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771530143; x=1772134943;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sqVevzHA5yFYdbn4seYcAEFxgZSYb3dH9h1uQYK5+vc=;
 b=TVaRcHcjvPtszomZgWm5hQiD55xffi5C5zVmzBXeZPy333kw52uGHNAOCnHEKZfcQg
 t3SDytBQrdJZQzoAWfGJi/kkS3BDLJ6jI/W2teb3QiunGD9yFeFnKe6d6I7vlKwSxzWr
 l2cxfvVnoLEQ10p1x4zDTyC66dNxEokl60CmBtjefih8Bir/tjr/a5A+5ptJqOBD7MDX
 ETD3fQvxGomJ67+1NsUPXjBK/PUzzqC8wQRcXGATv00uP0hXO7vjcWA8dh7ldUpGIKTf
 JSyEIY7Jsc968VEustoLTHK8J67BjPIY4u4SsE+ll92Irdyi8Oms6gFicpdG/6FUuvhH
 nNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771530143; x=1772134943;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sqVevzHA5yFYdbn4seYcAEFxgZSYb3dH9h1uQYK5+vc=;
 b=VAuCGCEuCxScTvApC8wIBqWLpIqy2LzeLOgKfV1mZ0QHPj9izibS+5IamCFx5BxpD9
 pQ+ivPsN5iTiyOQs5e0NgP9LrX9/h7xM0wLRrHxkzTLOY1fB/zEjeDGvJRhyaBpAuHwx
 o00gupDdEWoNH8N6hdhS89gFRmrjIU+3J+iInY22IWm/AbuDmjdi7K0AQve+eFJCoxmH
 kQvTDGGWHHb/efxuFF/8V5Wl4080AHehJFYQm9cvFcHVNHwkfa8Zf+CWaqppaCfCP07b
 8lyOU9EHa+NFai9Il4kDdaIOQhZW+4PK9YrHrrdHMBJ5XaVPKUk/4wlHAC6rTzbgFjMm
 Ny3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWatl+YHLKEPPCC3HIy9Knzzd9Ey3EAYjrfXzP4bwhy7JPu/MkduonolMlsEp1yYjCBGN/dBzLwuSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4tmxkKVGahaX9+6OIBNc3jStv6Az4Wq9n/JOVkebMSa7TVegv
 uAPgvafCGBZtZ4JcGXVF1sx38Aw5+Dc+LjMsd24AfDlXNu+d/qMy7s5/L1kDB2nMMQoxQO5mw3c
 fmD9ahMsyLSaR4v/aD9kyAA5S5KzC97ejUrKz5psoUIba7AmfvIyJgqKSubuwAW0zqEDgP7k=
X-Gm-Gg: AZuq6aLde2Wq+lHDiWhJ+OnX7IHfO0tY/CzuDPzXUPsJm3nqYMexGygyM2B5e5hUOgz
 UtgUwPw48nXxkBztGITY8NUCbsA8TK1GzeiA8i63UvzXcdW3nu3dE33F7+/xNtvm5i4InYVI6yd
 X4dTINwyy5mMzJkVrxkEVrDF21mfZStWllKctwsZQeRp7j7E9N9Cvqo2iXN0qWaxKz9gmh17lta
 oelAPVuY0qpCvnRiP9MxGGYnc3ESrLFU2zJKl7ZHJsaXIh6J12oVG/UDtf/O2N7NoxR2+4gK36F
 bxKjVSMJe/Z4zBr7GN2MwekYaX/dcT0R1hGQC/BbqN3fOTZwjIonMckFNST8kXgh6n5blRs1qaA
 3hbwM9XVh70ODYYAiEzwVNxW8dOMxruCx90td+XAJMRTdzQ==
X-Received: by 2002:a17:903:286:b0:2ab:2633:d986 with SMTP id
 d9443c01a7336-2ad50f9fcf5mr59629735ad.49.1771530142879; 
 Thu, 19 Feb 2026 11:42:22 -0800 (PST)
X-Received: by 2002:a17:903:286:b0:2ab:2633:d986 with SMTP id
 d9443c01a7336-2ad50f9fcf5mr59629445ad.49.1771530142357; 
 Thu, 19 Feb 2026 11:42:22 -0800 (PST)
Received: from [192.168.1.6] ([106.222.231.214])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a6fa229sm169698005ad.18.2026.02.19.11.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 11:42:22 -0800 (PST)
Message-ID: <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 01:12:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: add missing MODULE_DEVICE_ID definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Lo=C3=AFc_Minier?= <loic.minier@oss.qualcomm.com>
References: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z5/h3XRA c=1 sm=1 tr=0 ts=6997679f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ak1KJoLj4JlN8czLuyNMyw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fs4y5QUGM0Q0NtUbLCQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 5yZQchBiVDbho0Vtj_6IsBRjWcbUkRUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX+vxAmTwWbtJi
 ZuqagIC5Gvl2/6KUbCBNakqvn8s/d+HojJFPzSSsouGjKEoYAd/KWfjgExT30Ci/YhV6v5R/mcV
 cSu9hg0Ff54oiMpFB/31ulIx2jM6EsUfLU7rDupi4wSsJ1kDtvOZzlDr5+Zae3t+ibrFVHIsPK/
 32GZjRe7z/ff/2c8dUm9yvZxIQmfszS4aq1WHn0Do999hdAppuwY43JUpxhDaYZk9lwJlMhNk8q
 25247lN4LW5bhWSm7zvUtNRO7ooT1l7EYzq24Y+Y64U+cg9iLq2H6gFdi69Rl3iVahKVsn1n/jl
 WtFQtwaUetRjumgp7LlF5IDXmDy+lMOkMydsZOZsWyBAlmFDO43y2GiqA8vbIq5JDMt4baL5ABQ
 tpPN4aucOwyqfSZZV27q/w2bRQjc9/wN9PyoBoRQ6/71bqqHbFbCk/46t3lMve5j5kadLLHGj0V
 XVP/Ru0Ped6h/SBdzCA==
X-Proofpoint-ORIG-GUID: 5yZQchBiVDbho0Vtj_6IsBRjWcbUkRUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190179
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:loic.minier@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A0B7F162193
X-Rspamd-Action: no action

On 2/19/2026 5:49 PM, Dmitry Baryshkov wrote:
> The drm/msm module bundles several drivers, each of them having a
> separate OF match table, however only MDSS (subsystem) and KMS devices
> had corresponding MODULE_DEVICE_ID tables. Thus, if the platform has
> enabled only the GPU device (without enabling display counterparts), the
> module will not be picked up and loaded by userspace.
> 
> Add MODULE_DEVICE_ID to the GPU driver and to all other drivers in this
> module.
> 
> Fixes: 55459968176f ("drm/msm: add a330/apq8x74")
> Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> The Fixes tag points to the first commit introducing OF-based GPU
> matching (and thus possibility for the headless GPU binding). Other
> are not usable without the main MDP4 / MDP5 / DPU drivers, so they
> didn't get the Fixes tags of their own.
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
>  drivers/gpu/drm/msm/dsi/dsi.c              | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c            | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 1 +
>  6 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 554d746f115b..4edfe80c5be7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,kgsl-3d0" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, dt_match);
>  
>  static int adreno_runtime_resume(struct device *dev)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 476848bf8cd1..d2124d625485 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
>  
>  static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
>  {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index d8bb40ef820e..3c9f01ed6271 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, dt_match);
>  
>  static const struct dev_pm_ops dsi_pm_ops = {
>  	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7937266de1d2..c59375aaae19 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  #endif
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
>  
>  /*
>   * Currently, we only support one SoC for each PHY type. When we have multiple
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 5afac09c0d33..d5ef5089c9e9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
>  	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
>  
>  static struct platform_driver msm_hdmi_driver = {
>  	.probe = msm_hdmi_dev_probe,
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 667573f1db7c..f726555bb681 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
>  	  .data = &msm_hdmi_phy_8998_cfg },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
>  
>  static struct platform_driver msm_hdmi_phy_platform_driver = {
>  	.probe      = msm_hdmi_phy_probe,
> 

https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
fwiw, there was a related patch that I posted recently. We can drop that.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> ---
> base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
> change-id: 20260219-msm-device-id-84b95d22c0b0
> 
> Best regards,

