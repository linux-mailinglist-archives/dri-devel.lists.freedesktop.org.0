Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HlbM0Qhq2mPaAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 19:47:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CE226D67
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 19:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6FB10EDFB;
	Fri,  6 Mar 2026 18:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVAjrCY5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aog//4g9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F44D10EDDB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 18:47:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626H1fmj1343666
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 18:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xUscRt9PkJfXclN0l0QtK+rE
 L2+xLTOFDpKgHRcpxBA=; b=RVAjrCY5rpNslW9GVgCRo31k0oo0n3frulR0LfeO
 6HtgKl3pBCq0JNF9c0YeQeR1StLG/7/nZi1jp3FOx/SQuhj6CIYIWfK/LHeONkof
 JSk3XX1bI5EWcHNbIiqE7Ux8sI6hxW7i045Hc/3oD0TwWsiKOGYO8e+qUnQQ0SIX
 qx6x/0oDpGZzTglb+eGWr/E7x3RNps01g/fQbVqDs5pG4w9MbR8HNHAbsyAiY7wK
 /DHOalIkXoGFohizLcu4qpeBTN4pepA7Ai70IWWPQBZA0AXi6AorjlRVu6Zs/J3c
 OiZbvv/ucEimaeG44Zt7i4Y8f48yShJSYcXnDFdaX1Zztg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2uqre2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 18:47:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb4d191ef1so1287294985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 10:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772822846; x=1773427646;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xUscRt9PkJfXclN0l0QtK+rEL2+xLTOFDpKgHRcpxBA=;
 b=Aog//4g9O4MvAl6TCDEjPx6rNY7Gs6mG6jaNmPHyfOK3C/XrHeqnBuVce2xwJIospi
 3a5f0NSZYYqfs0PRnvEBukyfqnY45A3ExG4Exy7sTcxGqUTP/bHIAFEOchepFTALjyPH
 awKqvMcp6oHf1Ipwj7GJT/6xpGFsdjTc8NAL+ibGH6TcGMK2hn0aPXh88PoGg9vxCTRB
 HvOUUtzJGJYyYBT+UxRZi1afFnMHFSVRrkWfL6mgCnVGYNpSgobWc48Ql/yIxU6+Kwp9
 losiRJ0ub6C9sIbATvyBgiLobtg/zsVmveJhnYrN0DuUW3f0XdkP2TT5yf3TEZjCBEp9
 7xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772822846; x=1773427646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xUscRt9PkJfXclN0l0QtK+rEL2+xLTOFDpKgHRcpxBA=;
 b=VsSvs2RDfeOjNfqqw9w9jSUjViK8Q26X1ej4jEowoUogDGi1CBgzzbiMpHaJnkjlKl
 iBX5sQIQi3H2owq59YGM75IjfNmA9FI0bF6SVB56kmNeVxTT9k/UXqwstJsac0GdjCRf
 +hpY8NOUhOOP9TXKZkda3eSw1M4ihP9RjK5wHg+yy/JxtyMuoPub5DsW604X8vJFCenx
 FmeRmnaP0bNHYPfPxxFaGD/FRS48MPHmupge2u9Bj0Cw7SLbzOVAhIoh3GM2vXf/bPpI
 umoXKdfgtvUbTw58VHkTmEi+11SSNTJM/tV0To+ecPBhZ6ICD7jLEoGKFZcT1vl97YbR
 kzcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdm7d13v5pS7ODZQUv10k4TAfdmWJHMC6KhYJfLYYAFji8I8yardxJOhx6zgqKp+eb3YdVsgS3JvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLgXPrWTA/cNUXQjNxtQ3JNZqEha3bCU19G1G0TTTlO0ThI4dE
 1M3DIkFWd80ujlRK87L0jYaiTb00z+hACWnCZzykr4P6KtZnv/q1HdVlhkSBEs4LIIDUtyhfEyD
 tQL+94nl66+Ie6fYj4kk55FtNZECfZl1BN0USkmawPTcxKoDC4gtsnsHoDZ808nr4jwG1inc=
X-Gm-Gg: ATEYQzwIUIr1LXwE7dPTGndso5+uBvgA69BpGzDAssoZvS8Ce+ghJqU1luLFYFFXwh9
 mBiACbz3Qv+u1fwsjghrzd4xrkTChg1IP/73vysiBzqspr/D054P9LiFWfaFWLe3S/OjJzjDBwm
 njp+YcFbS6A8JS+sq5z1cs5wVXsBidMM+gvAnhmuhN2WtUzI1lf7On35F+h1O13Dzjr8Ldw8j9g
 4eYoJ5M60uhDWP0OYtMTtTl2IIp7jhhUhMxHvpSCj+l2YeD1RnKGFIELwwDOB4AWgTSpr1jP86I
 dmB+1/n5uF7MHXimaW+4SkO8gcCJnzOfEPABa83RwsyNL+/TA4CsTQP+HwclWDahaJP65JtsQmh
 inQ7DylOSVeSFx8RNdau9YWExTxSKDHXl1O6xEVeqBQZCWWqzIL3YezaatvAuoYoixiKpaosyDC
 Mc9B6r/bv+JbfimHyNIRXgs3y2KFe1WQ/TwYA=
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id
 af79cd13be357-8cd6d494e49mr390657785a.77.1772822846519; 
 Fri, 06 Mar 2026 10:47:26 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id
 af79cd13be357-8cd6d494e49mr390654585a.77.1772822845978; 
 Fri, 06 Mar 2026 10:47:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38a41fa7bd5sm3212991fa.15.2026.03.06.10.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 10:47:24 -0800 (PST)
Date: Fri, 6 Mar 2026 20:47:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Eugene Lepshy <fekz115@gmail.com>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Eugene Lepshy <fekz115@gmail.com>,
 Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
Message-ID: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306092518.37849-1-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NyBTYWx0ZWRfX43k7K74T7GEg
 SIK4yPW9z65+o/oI2QpCTsDmTPaIeKFvBDFk/vcVohiq1T/wIpqSNd3MJZjCDcWueUJeofoOASc
 bvws5LtnvmHLhjnxeHIfw9luKicAxB/jlaTedg7zkHmvE1Qkqm+fxLGMoUkBSzVhiquCimcn3/h
 24Bu4NuQQPTusvrxvlGEhGffyTfUjf6bw8+oOp//tzki9tBvIpavZgZYzDQMtdOelRo9WJomXoD
 gwUDvAEGbvfYRpt4NdILUHVuFqIuoxgd0OioFRX5l2b0V7a9f0U/tTq2T7Sf4VPlTe4yt3TNIkW
 XjxU+W+xFWqzr8Ru9QJG6x4eZRjjnuOyui+VzJZJbxoIJt0KN7dl90n4UMH9iGmax/yXsmeHIjo
 q/vvCS6+BZqboMEY+gC12l17+I/yTH+05XRskLUPzRO7d6jCpLCC/5nMPldeMW4RYEjjOsDcvjx
 Vbplxd8r/VPVTzeMhQg==
X-Proofpoint-GUID: -kSnMlErybnO_f9ssc96pc3XgeLFcJ5_
X-Proofpoint-ORIG-GUID: -kSnMlErybnO_f9ssc96pc3XgeLFcJ5_
X-Authority-Analysis: v=2.4 cv=Q+HfIo2a c=1 sm=1 tr=0 ts=69ab213f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=pi0S-Vlqv1HzeT5xHfUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060177
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
X-Rspamd-Queue-Id: 463CE226D67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:fekz115@gmail.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,jiaxyga.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,jiaxyga.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> In upstream the msm, for bpc greater than 8 are not supported yet,
> although the hardware block supports this. Remove them until we
> support them.
> 
> Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

I hope Marijn, Danila or Eugeny can comment. The patch series with this
patchset added 10 bpc panel and used it for one of the phones.

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e8e83ee61e..b60b26ddb0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  
>  	switch (dsc->bits_per_component) {
>  	case 8:
> -	case 10:
> -	case 12:
>  		/*
> -		 * Only 8, 10, and 12 bpc are supported for DSC 1.1 block.
> -		 * If additional bpc values need to be supported, update
> -		 * this quard with the appropriate DSC version verification.
> +		 * In the upstream msm, only 8 bpc is supported for DSC 1.1/1.2
> +		 * block.
>  		 */
>  		break;
>  	default:
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
