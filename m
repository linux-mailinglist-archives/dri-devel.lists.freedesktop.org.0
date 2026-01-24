Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIHTMrzrdGng+wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 16:56:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA77E116
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 16:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A590910E112;
	Sat, 24 Jan 2026 15:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SG12+DI5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsraFdxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9310E112
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60O4dtQQ1660051
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PD/+4Tv/QlJ9os4hleObvuo3
 vPxWZDiHtIkn/geyQaY=; b=SG12+DI58KAP2XZnxvPaJA5caCKX6CGBs0GGHypy
 gpMNt3t0b2LoKHoRk4vDdS8d6HWSOQn4/NuSv8SMra7Zo53M7J3RI59C30oEC6Xr
 S7/j6X/2H3oZXhe9Yuk+ByDRU+gmXdFKdWX7TPEGinuhye36PIro5lzwhEzu4yJg
 IddLiD/jh8rqIXEg/JwbAl0jZiqZxCZVD4MnGxWgCeDOx2sclhNSexoNTtj6Ce6/
 /SNTtCJPLgEOgOyaNn4VuukzrJrdaGCMiFDEzjpyFocZgzoX5oP5V+C/WYmh1nGg
 +7iR4ZwkNncGzJj9jC8j1AKmgQnNn1pKn2SwM3xk4IIbrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dgtb6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5014e3becdfso144816301cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 07:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769270200; x=1769875000;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PD/+4Tv/QlJ9os4hleObvuo3vPxWZDiHtIkn/geyQaY=;
 b=IsraFdxmcXCSjd/7ROStFWS6MwrWQgx5UVCC76d6KxhLKKLyzUp2ygf4EvvpHWMuzi
 oKCt1/5diZQswFeunQ8O9MtdJRFJ4cVjPMAv5kZUQqL4kkRilZEZ3FaBysELz3DPz9bD
 L5iR6jz6KiOd5x7Zr2/4KOM+lqlBIitmiY673UqqvUiXRS8hZgtoRN+KDfoD5i8w49Lg
 NdVKKLrjFcm8xTn7vRdIzmrsv7J8WtMXirflLwn73VyDPEOXanBbFRkxkOQD28MpaoC8
 cPpgPAqDMpoaekmtai4D22hwNwzD0N1k36+s4L5XCxXdmfum/CAEm0QrX9qECehg9/9s
 DZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769270200; x=1769875000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PD/+4Tv/QlJ9os4hleObvuo3vPxWZDiHtIkn/geyQaY=;
 b=ZE1njUWNjsvqlxIYMACUVxs8j9dJYR7XA+dW8upUlNxVCFXQa0brENmcsIvLyRM5nV
 IJIWMXQz+bICrL7lp/hq2f2xyAhi8m1ZyipQS6ak1dV9OLyVY5oGytucMeoGH+mXG1K2
 G5DgWI4sa1/AjvJP9t55WnzcyqNtOfwSai1T7reuN4MLwO1q1tfPyIkmX2/fT7YnfLNH
 ZXZuSkP3lGCje6kb7ZHdad+9fKDhUUheB/EqfWJrtEInEBh4f1zG/0RYmOUsVvUjJhcR
 M2hrJk0Q6YvCMRLgb5hzjPtgwT0NOdwNy9218K/EQ9Lm43kqdFUOELYvWDQMVsERRl1w
 1Jtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKPeUVeb+KYUhM4Dv1XJ+nG5LpaABD9S0jsRClo/ppIlrlXA1HM1BFw4mrokVWWmG6BzHyizoShVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywua0q/YPaKJ+HxCP4YZ5X1A0yGuvhPjmKkDqdSI1oEpUD8D7PT
 0x8oOkYn+ZKTQ5Q3mgPfGJMHXSCYngXH8z2M6m23H8g/HjSNbBc3QxWinFsaozbg+WfcthmZX1S
 CrZTojzhr3goHMZpxbTCMmzvswCDu636FpxdBgS7yHMWFzQbXrkLxW4apJtTllD3Mpfvyuco=
X-Gm-Gg: AZuq6aIbt0RZWKAXol1Eya9e4/S3KSU+mWQSEuYzKPz9H6n64xMjpy9xSxM1CZmrMs+
 IgdgNe5A1I6gvIkFkv8rOJBC5+NkH/9apUV+SW0tDhopAEVFvS+MgHM/C/3iJTCMS/y+hMxgP2a
 YAnTaJbRSqNzvYDKQN9OvLrdoq/oyL/LlLsz5ZYC178K9jHVjWjWE6upGOlUxlWM8EGVuKZ+e87
 2853yeKbhufjkgpseuJfSmMTmvrXPfpgipS9vvkpGe/UmrfOph+XsDWbjaRIKafvqQaQ6jxJ4+/
 oVECKFMdE4yiWs9t62tvSqdymf5yFb4COfEjl0taeisyqxnU8A8uFWq9De4JNSczyCZcG08k+rw
 zlYz8aEuD3ICqdgOwKU6zy6gUxF884e5dSoOeGYhu9z6CVM1q9a4POWUqppAORW3LS/G9ER4m7A
 AZRonpjlWH23b7VnicCLtZgzs=
X-Received: by 2002:a05:620a:6c86:b0:8c6:a8a6:e164 with SMTP id
 af79cd13be357-8c6e2e34264mr811834285a.45.1769270200330; 
 Sat, 24 Jan 2026 07:56:40 -0800 (PST)
X-Received: by 2002:a05:620a:6c86:b0:8c6:a8a6:e164 with SMTP id
 af79cd13be357-8c6e2e34264mr811830185a.45.1769270199769; 
 Sat, 24 Jan 2026 07:56:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da200503sm12996901fa.50.2026.01.24.07.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:56:39 -0800 (PST)
Date: Sat, 24 Jan 2026 17:56:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
Message-ID: <ai2yoizqkpx5f6n4y3v7p6im7wy4xwsgstpj3z2sbludaat5wv@i6gpuqwg73yi>
References: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDEyOCBTYWx0ZWRfX5vYNZuWYXRcu
 H8ri72bHwpEkNAv3ciGKLtavltzlK0z/zAlMTu762J9v/XAoFieSTSUAMd5oSJdWqAP1Syh3U1U
 r/loTCCJbsqhia3AM0FEn/EDq7ny/kqEZfgjJS/orwKuFKpKLXIv9+9D762wUZACAsRUf6AMoi4
 AbwrKspqOP9tXBTNm2C8X3Bea/+bV+UQINt1Nuc7edU/R01E/OS+gGwuZVuyf1yJkAU++mcQD4A
 bUBgTCCwy/SJQFpHEe2v73Wpqw1s0jiYBNJAxwcaaw39yV01g+qKOV6ItRbLh0QFvAR0M8tDkPl
 lIlRC8h9UOZxxuEiGtmzeFEukR3SiyAc/Pk/SCKOVqnDNOfOuPie+HOYQy5W1TQ7dRvMeKPNYer
 WAbRm7RdDC60gUSnNo54Q5Kln4FIc/Ky3uwRMXmNGV2v0dbrs8oV3MfnjCImjFvsyLDybkIG9aK
 p7DwxPwLUz1oL7A2sSQ==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=6974ebb9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YWtLmMpjZNbrRuJAT3gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: DwiGg_rFokm3kuw9Ngoxu-pC3m97t2A9
X-Proofpoint-GUID: DwiGg_rFokm3kuw9Ngoxu-pC3m97t2A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240128
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 50BA77E116
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 06:32:56AM +0530, Akhil P Oommen wrote:
> Since it is possible to independently probe Adreno GPU, add GPU match
> table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
