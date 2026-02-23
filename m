Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCb8DonenGm4LwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:11:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2E17EF1A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 00:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A3F10E324;
	Mon, 23 Feb 2026 23:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBXLf8Bi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4YYQgBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117E10E324
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:11:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NHrHq5322186
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lRbhlI+X+C8SmlSdJaBzOExh
 KR0OP/6AiGSM8L0TCJc=; b=RBXLf8BiegXOkwPWtRQtYtFfyJL0qhEWs0+qc8Ho
 lKN8iHF1+NSMTDLibV+MzhQakKa8rdbj4QhiPBEmIMROjSxAdg1XXXUZSSzrIJkr
 UdMrE/uhwR7ZR3igzg1Dx5IMolK0jXdR4a2WNHo4wzP0mGEGAquUCev4V98a85n1
 1emQXUWMOSE4bdTsdE3UooCiyJnSlcFLv73nLZ7CBtQrQes04NnWlWstwELTYOoC
 j0bkyDlleB3TdsVrrcF+qi0tguBcCJ2V+CU1ta6f7Myx9eb56Wg6vKDSXGO2VnWr
 nOnhXQxbw0hlPe/Dct0K42W5mqmAvoFzn2zRusRosOzgzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y26d9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:10:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso5594310185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771888259; x=1772493059;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lRbhlI+X+C8SmlSdJaBzOExhKR0OP/6AiGSM8L0TCJc=;
 b=e4YYQgBXB9zaayGG2az8N9nSvbbktBEgDBXzIvfNzoDAW3ZaFTzccNkbvOluC5VESO
 wrFOD8rIpxPikwbCJZCiS20DnAUd40Bc2+qIewlEG9BhxdaaBzTEGW/IyH7PTowP+30C
 H7zj/yf7xlD3SA44+VTBAtYXfiSIQwDZ5QUzYLXgYsyoz2dwnwCzM4L/E+0Ly2jB8AQY
 xYzgwCzrWoUQ6NrJ4/jWEAm5Yfq4wsMUZvgSZL5mi6ZLd4Nfo8/oUYBcHQgobwgUd5tU
 HmP04bIP9ykaQ94Zf/dZQFF+Lu8LXuVpImEmCQ84KLNff4nVPn2tPdvBlgyHzn9FKDLx
 bWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771888259; x=1772493059;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lRbhlI+X+C8SmlSdJaBzOExhKR0OP/6AiGSM8L0TCJc=;
 b=Erd1lWhVSYtqA34nzuD7a+bZ6OJ4rnK9VhXbzMLxrJjxjCDHxwZ3CoUa1VC7J6kbPe
 ObuapTSEYuQ0+I8314fKXiI6m07jhyIlWAVNl4Qz/k/nFofcq6c370AJKalnYe3IAhLM
 GiuFhY9Wmh/Q7uzu23SdLFsUQfpLLKhthaRSVYiHZ33gjg6GL6gSAul4A6eS8qb7scua
 WU/I2afe/CJimJoSbOicltMfXCvvrMw9HWCJ2zgD0FRC7sUfFieJ7AONThjs0Q9xZwFX
 G5coCtyGBN/BRE1tlccYtcbmi2Zv5AiWo1JbH+x1DmYI0HBEnjAAitXDFNRBZwwsqsR9
 aKug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQeqBk4xztzw2+KcWJRaRDH2EFnMwcBV+L5DR4rTuAgv3ImGYcN/3PvMU9MBUyho/Wkojkx9pSiPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6pn6yWeHVTKR4uMpSbDnRV/Nb62NExQ5iRQMuonoRtFZ0wMgs
 m/P5R7Qir1l8hZUUK45OOKmn9VoAP9Y7etj+ZqfQ0jI3pklB4ulBpuUd3nm8yP66EOTN/nkievV
 4DD12qKBN2ZZbA2VJDIzyyg4XOLLWx6XgGPLZlTb714ewT0JsNINdynRKnn6Mn+XSEsjBL6c=
X-Gm-Gg: AZuq6aLpB+63hA/NdczrkJgQxe2eUjE07DDXETW8INzCjjZ4MBiDWa5QBwx15ILerdJ
 gASphVw98gjKAs03IseQapB9Sys73Wkgn5kFYJ4OQ8npTRolS/3DcmKbkj0usPziTY+d72RpYYm
 5b5VCpLQwVa7IAQEvQxyfQXnyVYTgpYuER16r65aTyCrM7Kkzy5/+wl6al7gK+ZAcPpwBDFfcHm
 AhYMI+lJkkLyUgM58JR45JUf3eHftqNTe/KrTYt8JxdV71IMKe2RRIVXxPdkyixLAw0ScQ4jTyl
 YI5HuXtE2TxeY8FCh0bzq6hLCQPfVGsPZC+owrzwXOiBzHWCi7DdA9UHtpSEJEUeeUwxA2sdKQb
 dWS6ey2GOsXOG64StHQcv74ZDCz+aOnLcF0jqHOI6klMLkH8jhe28ksGiUKjlhll5D1sbzNAoaq
 8IHs61xf3eS46n0alBP+QjWXH5JjCnwD6IEk4=
X-Received: by 2002:a05:620a:f04:b0:8cb:3a1d:79fa with SMTP id
 af79cd13be357-8cb8ca76abemr1403756585a.58.1771888258870; 
 Mon, 23 Feb 2026 15:10:58 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:8cb:3a1d:79fa with SMTP id
 af79cd13be357-8cb8ca76abemr1403750985a.58.1771888258310; 
 Mon, 23 Feb 2026 15:10:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4760csm1835383e87.77.2026.02.23.15.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 15:10:57 -0800 (PST)
Date: Tue, 24 Feb 2026 01:10:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 14/18] accel/qda: Add FastRPC dynamic invocation
 support
Message-ID: <57we5xzyxvctwzgggqpemlqf7q524mbaqnczqxua6eaehqv6vw@bq4raxwkbava>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-14-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-14-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwMiBTYWx0ZWRfX8FAfN7DENBww
 T13ElgZN+DxQ7oMbw4ptolUUV2t0bDazy03o5yZfhP4QR1VnMvDYrTdio0HXLmwrQa3ZFwmJDeW
 YygMhxMIsivhKiB1xjafq5iowUJRhm1aDZbsmhvTB0cteCgTmbk+chbvcLeuzUwkcE1dZpjKFdo
 ojQ9AZ3/gWN/H0/5ZNuBhpaFGV/NabaFEuTXRtyFVZVJFG7k/BGIEBkNlwu0wUpfZ8dHf5oVmRq
 icyDlEKkvwN30kB/goJRRx1AglTeb1i4R4b42cP0zWbEkYziKwvhedelB2v4RNjLqFJBilIXoJc
 x4cTH0rDAuvqRaTaCFad3+Qen26SuClCEv9gV4UGBUlLu1CIvD2P4UmHXeYs5JcdG/HWt3aPtbw
 p/D/LvkYw4yzXg3YnGiAVixvVAbMwb0vt+YGW2e4lzxGK20+I2t6iW/WxsRH4gtSgyrKa5+IyOq
 pfa2PI+m5RLNCGwos9g==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699cde83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nKshNOZNSeXGH1bP4e4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5T2WIQhPxzWTTR8BJlQmcaWcWZkVtmzD
X-Proofpoint-ORIG-GUID: 5T2WIQhPxzWTTR8BJlQmcaWcWZkVtmzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230202
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
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,inv.sc:url]
X-Rspamd-Queue-Id: 96E2E17EF1A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:08AM +0530, Ekansh Gupta wrote:
> Extend the QDA FastRPC implementation to support dynamic remote
> procedure calls from userspace. A new DRM_QDA_INVOKE ioctl is added,
> which accepts a qda_invoke_args structure containing a remote handle,
> FastRPC scalars value and a pointer to an array of fastrpc_invoke_args
> describing the individual arguments. The driver copies the scalar and
> argument array into a fastrpc_invoke_context and reuses the existing
> buffer overlap and packing logic to build a GEM-backed message buffer
> for transport.
> 
> The FastRPC core gains a FASTRPC_RMID_INVOKE_DYNAMIC method type and a
> fastrpc_prepare_args_invoke() helper that reads the qda_invoke_args
> header and argument descriptors from user or kernel memory using a
> copy_from_user_or_kernel() helper. The generic fastrpc_prepare_args()
> path is updated to handle the dynamic method alongside the existing
> INIT_ATTACH and INIT_RELEASE control calls, deriving the number of
> buffers and scalars from the provided FastRPC scalars encoding.
> 
> On the transport side qda_ioctl_invoke() simply forwards the request
> to fastrpc_invoke() with the dynamic method id, allowing the RPMsg
> transport and context lookup to treat dynamic calls in the same way as
> the existing control methods. This patch establishes the basic FastRPC
> invoke mechanism on top of the QDA GEM and RPMsg infrastructure so
> that future patches can wire up more complex DSP APIs.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c     |  1 +
>  drivers/accel/qda/qda_fastrpc.c | 48 +++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_fastrpc.h |  1 +
>  drivers/accel/qda/qda_ioctl.c   |  5 +++++
>  drivers/accel/qda/qda_ioctl.h   | 13 +++++++++++
>  include/uapi/drm/qda_accel.h    | 21 ++++++++++++++++++
>  6 files changed, 89 insertions(+)
> 
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 3034ea660924..f94f780ea50a 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -162,6 +162,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>  	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>  	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
> +	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
>  };
>  
>  static struct drm_driver qda_drm_driver = {
> diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
> index eda7c90070ee..a48b255ffb1b 100644
> --- a/drivers/accel/qda/qda_fastrpc.c
> +++ b/drivers/accel/qda/qda_fastrpc.c
> @@ -12,6 +12,16 @@
>  #include "qda_gem.h"
>  #include "qda_memory_manager.h"
>  
> +static int copy_from_user_or_kernel(void *dst, const void __user *src, size_t size)
> +{
> +	if ((unsigned long)src >= PAGE_OFFSET) {
> +		memcpy(dst, src, size);
> +		return 0;
> +	} else {
> +		return copy_from_user(dst, src, size) ? -EFAULT : 0;
> +	}

Nah, it's a direct route to failure. __user is for user pointers, it
can't be a kernel data. Define separate functions and be 100% sure
whether the data is coming from the user (and thus needs to be
sanitized) or of it is coming from the kernel. Otherwise a funny user
can pass kernel pointer and get away with your code copying data from or
writing data to the kernel buffer.

> +}
> +
>  static int copy_to_user_or_kernel(void __user *dst, const void *src, size_t size)
>  {
>  	if ((unsigned long)dst >= PAGE_OFFSET) {
> @@ -509,6 +519,41 @@ static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *c
>  	return 0;
>  }
>  
> +static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
> +{
> +	struct fastrpc_invoke_args *args = NULL;
> +	struct qda_invoke_args inv;
> +	int err = 0;
> +	int nscalars;
> +
> +	if (!argp)
> +		return -EINVAL;
> +
> +	err = copy_from_user_or_kernel(&inv, argp, sizeof(inv));
> +	if (err)
> +		return err;
> +
> +	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
> +
> +	if (nscalars) {
> +		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
> +		if (!args)
> +			return -ENOMEM;
> +
> +		err = copy_from_user_or_kernel(args, (const void __user *)(uintptr_t)inv.args,
> +					       nscalars * sizeof(*args));

So... You are allowing users to specify the address in the kernel
address space? Are you... sure?

> +		if (err) {
> +			kfree(args);
> +			return err;
> +		}
> +	}
> +	ctx->sc = inv.sc;
> +	ctx->args = args;
> +	ctx->handle = inv.handle;
> +
> +	return 0;
> +}
> +
>  int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
>  {
>  	int err;
> @@ -521,6 +566,9 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
>  	case FASTRPC_RMID_INIT_RELEASE:
>  		err = fastrpc_prepare_args_release_process(ctx);
>  		break;
> +	case FASTRPC_RMID_INVOKE_DYNAMIC:
> +		err = fastrpc_prepare_args_invoke(ctx, argp);
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
> index 744421382079..bcadf9437a36 100644
> --- a/drivers/accel/qda/qda_fastrpc.h
> +++ b/drivers/accel/qda/qda_fastrpc.h
> @@ -237,6 +237,7 @@ struct fastrpc_invoke_context {
>  /* Remote Method ID table - identifies initialization and control operations */
>  #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
>  #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
> +#define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
>  
>  /* Common handle for initialization operations */
>  #define FASTRPC_INIT_HANDLE		0x1
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> index 1066ab6ddc7b..e90aceabd30d 100644
> --- a/drivers/accel/qda/qda_ioctl.c
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -192,3 +192,8 @@ int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *f
>  {
>  	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, qdev->drm_dev, NULL, file_priv);
>  }
> +
> +int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	return fastrpc_invoke(FASTRPC_RMID_INVOKE_DYNAMIC, dev, data, file_priv);
> +}
> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> index 044c616a51c6..e186c5183171 100644
> --- a/drivers/accel/qda/qda_ioctl.h
> +++ b/drivers/accel/qda/qda_ioctl.h
> @@ -63,4 +63,17 @@ int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_p
>   */
>  int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
>  
> +/**
> + * qda_ioctl_invoke - Invoke a remote procedure on the DSP
> + * @dev: DRM device structure
> + * @data: User-space data containing invocation parameters
> + * @file_priv: DRM file private data
> + *
> + * This IOCTL handler initiates a remote procedure call on the DSP,
> + * marshalling arguments, executing the call, and returning results.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
>  #endif /* _QDA_IOCTL_H */
> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> index 4d3666c5b998..01072a9d0a91 100644
> --- a/include/uapi/drm/qda_accel.h
> +++ b/include/uapi/drm/qda_accel.h
> @@ -22,6 +22,9 @@ extern "C" {
>  #define DRM_QDA_GEM_CREATE		0x01
>  #define DRM_QDA_GEM_MMAP_OFFSET	0x02
>  #define DRM_QDA_INIT_ATTACH		0x03
> +/* Indexes 0x04 to 0x06 are reserved for other requests */
> +#define DRM_QDA_INVOKE			0x07
> +
>  /*
>   * QDA IOCTL definitions
>   *
> @@ -35,6 +38,8 @@ extern "C" {
>  #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>  						 struct drm_qda_gem_mmap_offset)
>  #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
> +#define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
> +						 struct qda_invoke_args)
>  
>  /**
>   * struct drm_qda_query - Device information query structure
> @@ -95,6 +100,22 @@ struct fastrpc_invoke_args {
>  	__u32 attr;
>  };
>  
> +/**
> + * struct qda_invoke_args - User-space IOCTL arguments for invoking a function
> + * @handle: Handle identifying the remote function to invoke
> + * @sc: Scalars parameter encoding buffer counts and attributes

Encoding... how?

> + * @args: User-space pointer to the argument array

Which is defined at...?


Can you actually write the user code by looking at your uapi header?

> + *
> + * This structure is passed from user-space to invoke a remote function
> + * on the DSP. The scalars parameter encodes the number and types of
> + * input/output buffers.
> + */
> +struct qda_invoke_args {
> +	__u32 handle;
> +	__u32 sc;
> +	__u64 args;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
