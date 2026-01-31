Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGczISq/fWkATgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 09:36:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359DC1481
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 09:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466010E16C;
	Sat, 31 Jan 2026 08:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jz8lh9ei";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fukd9q1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA47F10E16C
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 08:36:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60V4e2l1392587
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 08:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XC2TPSUzWPcQTzNqmQCvXpWj
 +IbAM0Jw8/jSDMDyfkk=; b=jz8lh9eigTiUTQ12dHtnHHgZJme/cGSVjFXigD7W
 lhAl8gg8omKrbR8U9eD2NqfMazIo6s2dj6lit+90YIUYjFiILVmG+IyQSWJRH5bv
 VHSJ7bOXlk7nqtl2M4fuO90pmIXwisNxHQFTTWUiXncYBUuquglIMWQyvicYayHa
 xfa4jZk+OVZrtWjNPzQdNwhWC84XyHgX2IisG3V0jdlmIz6vbuAeiJ+KAjwQ5+Yj
 vqsbN0rAablBVoXwHZSch98l2TJ0F7dnyO6clg1OwUoKBDJT2T63KXZxpW/jANzA
 DaUHdxxNbmZ1CuiQXGqAfSuCf0yfJ9hfds/VT/96YwSYng==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnrfae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 08:36:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5ef31a7a2b1so7413053137.3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 00:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769848612; x=1770453412;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XC2TPSUzWPcQTzNqmQCvXpWj+IbAM0Jw8/jSDMDyfkk=;
 b=Fukd9q1rT2VFuQeEtpHFU0fZYdjMwhr/KmPL6nIhjZz0J+EZdbV7+MnuQAV91Z6auf
 E8OrP9EMWu5itVCNrnXqPxJeaff8nPjiJA9dRJ+O/Pft+IdkYe7VKMHBqr423D8YKSnG
 W/j80tBMGakR9drPdrWab76gLyOysEbq3xg5wVpxcLwxZRfOTKshbLUfgzS4wTT9fl3N
 PkRrYRdmPnCj2fjQZPSzsbnS0XXBV/5tATxCwF5RlWFyLpjYn3CpEDxaZYnHE15BSUDr
 MWPxk9EvodntgPIR5n3CjsburGOjFqbBoqVrun9S3RbvVhOWCmRDUFuiesl0abilZt1w
 orbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769848612; x=1770453412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XC2TPSUzWPcQTzNqmQCvXpWj+IbAM0Jw8/jSDMDyfkk=;
 b=SfLsWQf8my0LR7Mxb22V6MkrmDaSoTI8r44s0atUCsCVIcDnqKfAdlFKnARW8u5sex
 9geCv686SZ9ReGUZheSd65pq9+hj5rKtX3QBYg1q8NBRVjQQAmHSy6OvXENf7hMy+l6X
 VwX8mXGBWrG2R6Q1ANUQXhmGIpEsEIbf/SsdHFoNAYgudHEU8xMNKomT+0muUlFJ9S3r
 yHRvUqiSOj9toiaY4k+jM4hiS2S9YHo26cs4wZZBFJUo5mJ/gWA7mb4M8MVnf9iomLZT
 2S2fWLKcRnsAYqZqJCWo01gQxUrlI5u5Z51+QXKQuhlfOqcFbM8laoLK9yx5YIUQ38gD
 nBtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf7uGamnWManKf7WAFj4bl0hDzYkfLPcgqmza1XUrIbxSe2agiqWWQZ+H1YI0sicdR1k5FGyR1jm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlZ1TmITB91I3y+hbjS6WqNLmp5njrT9DQU8zL1UCLTYm15fWh
 Fy+CShLQs1nuZBvYevaYVIp13xfwevlvl/2bs16iq3GHm+EjrFR421vSyM3vitJM3s/LRMfSLMS
 hkx/MFuWxxslaQygRN4phyuesv/FpAJJmtg47GcJ2rI7YTQKn5LpDkV97MbPJFOv8PW1c6k4=
X-Gm-Gg: AZuq6aLVxDlQTMJx6WuTuhRQVFmjprkH3qEI+8CV/mCzkwSIrzYn9vN1nlZOzQmiX/h
 kGbLr1oFn1OR0e6l/0CFU6Y9H2dOGGC2+0oKsdrry5t0aCc0sRN57j1IKiTBNPowIteGRh3hYeS
 +snTcjk4U3vZvvz5ao+HvwqY+Upnhp0fKTyWoyrawtevRP8pYyWIhiuW4J6uNANS0BOakQ/sItB
 1+wBgU/i0LvYgrHSTjQnQmVsEyJ80LZrh0nak99aXGjD1lkc2EqvKmSszDXmklMw7tKixtfQEPh
 +1+Nkkyx91DYxqHD+i4YZ9BmRdgFXJ6bTi0yA+abwnlqNkparkAZ/lOwqe4hay92iEKH6sI/XGl
 ikidcy1FkyK3h3WIhrxOSyR7NvHWuTcBFrV0AjdjM9M+7C7in52Vc8yzC/vpuHaEM5ySfrxpir+
 LGGhvNtr7u/Xt2uDRxL1THR0E=
X-Received: by 2002:a05:6102:dd1:b0:5f5:5c93:8733 with SMTP id
 ada2fe7eead31-5f8e246ea45mr1636994137.6.1769848611976; 
 Sat, 31 Jan 2026 00:36:51 -0800 (PST)
X-Received: by 2002:a05:6102:dd1:b0:5f5:5c93:8733 with SMTP id
 ada2fe7eead31-5f8e246ea45mr1636975137.6.1769848611592; 
 Sat, 31 Jan 2026 00:36:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074b2e9bsm2241641e87.54.2026.01.31.00.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 00:36:49 -0800 (PST)
Date: Sat, 31 Jan 2026 10:36:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <lji2aqv3hqrhbacnugbawzft7t4o5dvvh6fwbc2sydapqfk22c@bfcauuyklstm>
References: <20260130053615.24886-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130053615.24886-1-sunliming@linux.dev>
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697dbf24 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=zk_b8o_FbLgx-YkRIm4A:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Ne9SdTwasZBc6Bc5IvtVXZVt02WBU-Vx
X-Proofpoint-ORIG-GUID: Ne9SdTwasZBc6Bc5IvtVXZVt02WBU-Vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA3MCBTYWx0ZWRfX2QnA7NN0fkVL
 os13xaChASvBXUuZxeMH0HUjVuIi/Q7lgEGbnpcuqpx4BWs+HgOv0Jo3z/w3B2gByY4LZY9J8qQ
 2zJC6GFKymKRHfj+qEF3d5ccZ2tscr7SdIpvsfamNttEL9FdyjOifiAIR3Ir6qxAmnMIjk5MeSY
 tzjlrjUagtPs6IE8CZKHrMHcEyjpb3TYKYCgaQcpYdi51ftZ+MGrQdwWnke+HRc7chib93BrM4m
 oAiPCN69VEt/paqZ0sJdIaUUqDaxsl8K/VYkl9hORcG6E4ZcuFPrg/vm8/GaoKoGV8JZonUae9/
 xgzshraNK1y/Xv/2NNyqs8b2mkf18Hn0RzoSo/jcEIcKlW7/Ebuicg3A9cyirZQspboIK9GbDmI
 2DoerQkHt+AY28Dw2vpdQff+67vm1BB+tNrOiygmONgAJgetxH0OAPw5fW5nOqZ0S/xdbU5KjUv
 V/XEGPPiw5UA4BHQhxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310070
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,kylinos.cn:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,intel.com:email,linux.dev:email]
X-Rspamd-Queue-Id: 3359DC1481
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:36:15PM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
> v2: Fix error code

Which error code?

> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> index e65f1fc026fd..312ee6597ab1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> @@ -156,11 +156,13 @@ static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
>  	u8 color;
>  	u32 lr_pe[4], tb_pe[4];
>  	const u32 bytemask = 0xff;
> -	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
> +	u32 offset;
>  
>  	if (!ctx || !pe_ext)
>  		return;
>  
> +	offset = ctx->cap->sblk->sspp_rec0_blk.base;
> +
>  	c = &ctx->hw;
>  	/* program SW pixel extension override for all pipes*/
>  	for (color = 0; color < DPU_MAX_PLANES; color++) {
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
