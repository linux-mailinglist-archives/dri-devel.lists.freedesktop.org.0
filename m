Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGMyLa3rdGng+wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 16:56:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A187E105
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 16:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C4310E12A;
	Sat, 24 Jan 2026 15:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPWJPsnu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzYmNhN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA91710E172
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60OC951b1256961
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kFuOXEbgChpXVrko/J+lG6Z+
 AySCv/eG/jHBiZiGWJs=; b=EPWJPsnuGVi3JfCfKaQXs7DtuTIRP8NUQMCLtIYF
 wyOUHWvDEkBl2DXR9F9aidKnRU7fO8QY5wzJKshwp+RAEmuJXjg34mVAnjrQyZox
 wH/W8c59J1vOQQVpqc6W6ZW8CAtvl7wnQHlmRL44faVbk1OHtchuUuJddMIAF3zv
 iMUk+XK9YKhWaW8vJj612itE5muD97bYjvODyX4cZz1vx6Bj5BPIfjBa6dNt5jyW
 ZHE6RCdGOYKO3Pa/3EbfDhKythGY/CfCCUz8hbpc+u0x02E9NHlu14TAd+0oTEfE
 +gNrivex5p9AY0yGeiGIPxlPD0i6gXfTbt7ce74oUqNP4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwty8881-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:56:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so1202861685a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 07:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769270184; x=1769874984;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kFuOXEbgChpXVrko/J+lG6Z+AySCv/eG/jHBiZiGWJs=;
 b=QzYmNhN2fEgOcsFplGJslePGDNI7Qm4vhTl4TYiLEq6JoIGyBldkiSQ6xsA7r1f0Nz
 FxVfMrG33JY9+8uO2hpeYD3X5AD54u/GHGXDRNTi8VRBasQMAK5axZw65t1Vo+ZjHG0M
 5V8qlF7bGK3Ns4YrSgTJx9+BaD+wLUFG7hz5VedlzAgI7g2Z5BsAJoN4uJxecPnk5vJS
 F+NZPdCGOJU4I7q0SOrFf3Y/tQD4Vs4S1rJVrEajKyChsLAV/11sGBAdIHJDQ8z8+fYv
 1DHuYh3X0DATcbFxsw0n3PgKSSjPI1jsJ0kl+8RzFMBShBEUQ9wxn6u+xleX0jMl6Whx
 ytHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769270184; x=1769874984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFuOXEbgChpXVrko/J+lG6Z+AySCv/eG/jHBiZiGWJs=;
 b=FK7Uo4w7H8Mi6lOXxnpu6+qheGyjbpfSfDzW28uHSX7MwRV/p97S7q446WpO4GvcFm
 ZZJp3sEFMczlUFQilC8H43ywcbORbpqbZzLWbs/FASoBzDIPUYavcdKQVGQPFXCytKJQ
 YQT6NndUs3Oe3Fi68q5AvdyIO73w3NQ7x9WGPDyVrQluYbl1+O7vB6mQ9TbWSluPMSBx
 qKDjaZjFFVKx7FlzPd2j8rdu//zhGXa0K/GgoNEGX6D3jfO13XLzXCBAOrdHLB2OsH8e
 2SIYKINq+r+bFyRJ28CMZ79F9CdHnw7wWcq8qCMZOLdegD86wxqJrv1stWpdtneg+NUw
 h9IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+rYdDWiYBUl4qnnfD61C+71iS9aVTk0gWLgvl9kzLqG7rCNIk5pxm0bUN4iLNIfNekLl6yZU+YY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGvInWFt4rW6HaOmTL/Pnz/2s7dx8ghVdB1mv4+Cz49T5u6vNM
 ZcOikPitargk7Xve8vIxjssnMCN2mgXXq1jo+GWIp8hziAA8Xy90WesUofhdjtpD07zCw73AVWv
 A4P8UmoEQ3TWKa2vEPbvEGpAX5K1MkUb58FLAXgEwbUKsej4qzALZ0fHyh4Ri8otVUrrTmWc=
X-Gm-Gg: AZuq6aK+59h95Yb0wu6Nj63ttNdFSTRmXm7BvkqpGNNPWpX5xGTLJeTRgf/MlXuVRDM
 g8DOYqGGkxU5Z5vze9w41EiDJTJICwo/TPJVrbirYS+5mu6LoTIjET0VS/unDuLJ7MdDFB3mC/v
 A6hioklcmRlRfzAWBxPcgl7jKJbLLrRPUhPdtwmK3tQxHossnFQD9q8In+cVVN9+im25yNSFlqU
 V2sNZciQwjxHehVHw9QH/QFRr9dEMnTTjoOGy8AOFeLbHeBaAhc1jqLH/a5y/2p1Jk9sNBR5gfm
 JVyy4XMNaG8q4udYvtktMTPT2wSiIRahCYeODYypCzvfnwbfUKvNdO0YumUo7wB9aW4lgA12Zwc
 sEMBTw0gr0lTmmE86gMB9jQbJYXRIXY2f/mbmvERopkqHj28O/7zYHTbMq5VqjNHUmnDLb65AZe
 6WN+mg3UwNEQqvG39eanCqcxY=
X-Received: by 2002:a05:620a:3727:b0:8b2:ef2d:f74b with SMTP id
 af79cd13be357-8c6e2d93ff5mr814468485a.29.1769270183993; 
 Sat, 24 Jan 2026 07:56:23 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8b2:ef2d:f74b with SMTP id
 af79cd13be357-8c6e2d93ff5mr814464785a.29.1769270183501; 
 Sat, 24 Jan 2026 07:56:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da1fda63sm12775071fa.49.2026.01.24.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:56:22 -0800 (PST)
Date: Sat, 24 Jan 2026 17:56:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
Message-ID: <7k3szb7kxuhyhir6t52aqwkfxah4ah4pa7vzbnqdl5sovatxqd@vbx33srndwso>
References: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
X-Proofpoint-GUID: QMdqMnknt4F9-Df67WD3QeWvYefNS0PX
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6974eba9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OED-BgaD9Yn4RF6Et8QA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QMdqMnknt4F9-Df67WD3QeWvYefNS0PX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDEyOCBTYWx0ZWRfX9vymbWh+VBKQ
 ifgyC+/+GhGCllzTAj4KCdVRQyo28Tx4Lxn45ueeHrl5VuPpCnzf4EIbvr0cCBeLUfOpPxxi6JL
 7r5HOv9AvszC4tcmMx0U7tPu0dFvLSUMYpDGFzT00HNGmbCJ/0CUbddKyN4clBSe+wCV8c/psVw
 5p7BWoYBynr8kQ/rtS7F5K54NVumkMaAUdM7bkNnAb5ztvBhKy2mDN7q567tps9cHMKAN5RA6sc
 8Ye8yE3WD9LgT1MGNWtEyL+xgwI7Gz0XyNt5gkOQjQUWiuf35kDVAlSjI53YkB3pBgiXs2UEHIo
 KbGwV3xvGEr+EUuN5jgLbBD19s25nVOFJ819ks6gDjW34FJbmFDMkCru9UZMQPm5YdJKTqbUwVC
 ArDznndWummlOpN1UKVuI5e98GUOeeGPErgaGAZPrRa8bs5GePPJX9ngZfa4nV3eDx+F/n7dDfl
 KBhkLb3LkD1Qb5XZfdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 68A187E105
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 03:34:23AM +0800, Felix Gu wrote:
> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
> resulting in a reference leak.
> Fix this by using the __free(device_node) cleanup handler to
> release the reference when the variable goes out of scope.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Explicitly add header file.
> - Link to v1: https://lore.kernel.org/r/20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
