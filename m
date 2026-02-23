Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDq0I8XTnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:25:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F262717E48A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4548010E31C;
	Mon, 23 Feb 2026 22:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlNaGhn1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcACmyNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607F810E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:25:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NGva0a3478743
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4t4vMCyeh5FO8jHV4Nz0hUoW
 U7ZCESWTx0v5D054J3c=; b=NlNaGhn1KhBjgV9mj/VYdOuU5ehV1qao8RrvyFtR
 zExj38kIV0zWDm18pJGvUwLfN6wyNUWJ0IFpc1fxavo7aNESt99sIkVzsBUgJnCe
 DtmbrMykIPEaWOw3+hHEb5Zx0PRP76gidoainjQqZT8VENFUGVubnn+4YXe3Atva
 HAdUbM4MvYcDVGIhfHjgt5+W423EZIwsNzjzMyHVqyj39/ifQyrMju7P2HHNDdJQ
 G2i0gn4V72P8glMZ+V4M0OOeHcXKV8pa/ud9ZJOXhycGqtZxcfx/BLylq7WdFuOP
 p9x4sCFuEFRfdlmXYyI/WJaHS2iU7AjJ8a8MhG6T7TMt0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9rx4h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:25:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb706313beso688602285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771885505; x=1772490305;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4t4vMCyeh5FO8jHV4Nz0hUoWU7ZCESWTx0v5D054J3c=;
 b=UcACmyNADk7aAOkqeYQrAy+jcnNzjN/Ln3xlPY9DP/tAZqTEwS8ym5Yssn7Utsskru
 +NtALBA8RW2/dw7CYdOtedN2p0ON9FibI8JdaIPMRyyV11GdlkHAZBNalWH8Qrmz+4Iu
 ibVxK8P6obfuMiNft8xN9dgXFrPne28p6HNbSU6JYUcYyIqJ++5lzrISM4hbjTSuK4y9
 ULx212T7QrHJcSxkDdFJrXfrRRZKNAVTgIK6nIDpUwzKnaSz3ilIydVd3F2pdNrqsTxf
 COfu3QbW0GoQz4+uuxhKzMCgjKiwlkqjVIRVasDm1E758o0n4bZs2My5IMRpyOFj5PfE
 6z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771885505; x=1772490305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4t4vMCyeh5FO8jHV4Nz0hUoWU7ZCESWTx0v5D054J3c=;
 b=IHhqv7Hsb9QkamZkaHW6ALTb/T9J6C1j6PXpJytGUA8Pxu7VffhFlg1FNEk59257Xp
 dvnGmC4klRLCoCPx+mtXJIF+nvaDKCsKZs4oiEoLdYnawSmTAmIlYwDd01Y651OD2Utb
 NWEiD7GTtRumKpbGAdp/1dNhneHD80K8kAQ7rDoM8kIEOeyVY2lIE42Gj79ZaLPcv5Jg
 h0w6qSng8KtlTjD/ab0zJN5333NDHjPiLn8c5lfGMD0u6yzFns+bTB+3wo3zVviSonEK
 lOTpaGmj/s2CDP9y+bq/cf0twbwOziSi2HpYxbztKfe88oPk7U4u9nVG1nhlZS6bLa0c
 PgUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGQV5AVd8V56hNz+lgDSETXp5ptjRIp2RavDBMHCYGnKcqRjNBxbnYAxcWMEzYjO6rMHszU4MZB6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdYq5Yq/JE69x/zSZrvqoi2ZeyyRx3UUXm/FCFN1iQb3RQb2dw
 VBHUwvltehU/T5azeULzPc1KWDLUcbkNuo3zazRn/RkoN3lHZ2tzZOodkFIjKPRSBkJgJUISgCJ
 feCofvbVVzx9A5v6hNRj5xt3yrdDiFp+eORlW6fODBJqcPgXc3ZafJZUlb70CxlG6TcOKHQg=
X-Gm-Gg: AZuq6aLczQLGDuKZQ/EHGOw5tFrBxP02x+wF97EL0v6oM6XT2A129v87dLarRe2/Wfs
 heGMYK7VJ7A7r7oeXehtFSJhmQsM2W4Xbdx2SyJy/tnGzF75PLxPuOa47ey9k7+1AymtZRv5DIP
 2G4UdzmIk4vgvFopYPysohPf5yjJWQ4geg+3wnxGVaOeyHH71oGTAkQbv1IP8MM8Akku77g27Fx
 H16Dget9CpWsvBBgiOYjGGhq3JuduOd6cBmc5K8YZyOsi6lIkjSMJBuVMXCbGBhi5XyA797AUkj
 7yHCgoC/Av9KaHwqiqrFz52YqpACDAq1GrdbcfSVO0MFBsL+20gZTR7EKuKJIs1va8Ixv5GShfR
 vMu67NGPs+l35kAsUuq0oopVeuJzCb9oSAS8vILZZ1LZKDhpjuKOuexweEutNz+ZUdJvpYNHlr+
 PlIXb7Qsq8JvSDPn5eh219sq1K5uuzwwxDLfs=
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id
 af79cd13be357-8cb8ca65f6emr1222850485a.51.1771885499782; 
 Mon, 23 Feb 2026 14:24:59 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id
 af79cd13be357-8cb8ca65f6emr1222846085a.51.1771885499171; 
 Mon, 23 Feb 2026 14:24:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb1541asm1818660e87.33.2026.02.23.14.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:24:58 -0800 (PST)
Date: Tue, 24 Feb 2026 00:24:56 +0200
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
Subject: Re: [PATCH RFC 09/18] accel/qda: Add QUERY IOCTL and basic QDA UAPI
 header
Message-ID: <fzfuaeninr7lfbn74reoare7y2zoflddcvvnvyifnriw26swjc@igixj73zawrv>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699cd3c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=AzVrm9-Iib0IivHGxGkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NSBTYWx0ZWRfXw5R9P3rpHKEA
 LFmsKpEAe0MsGy5Vd/9tY9eN1/FcKZaVB4UfA54HW7DGivJq2hYnzBdbo8w0OM/Q2pUT7fddAe7
 WEvfiiE55H1GbrsZO2CH6RfU7oxLyWdy9NQJIu/IR606yX9cFsNCnZI9ySbO9DH9KyHch0w0+av
 g02BLqryhFhWfVaG1RRyn42WkIxMw2aJoLi7uUqqFn8Xp+Ts8XvBxm2Hn8z/vlm5qRETiA7XLrA
 Ezn+YFkxemzRxBjAzJMCFiL6CYGYWmiSHC/ZNAakvck7lb4l2++EkQIGfihVAax4ti1ggGcN7Pw
 WHF8ggX+7ERGbfNnuCOAAIsONtpssQ7w5QY+cdQKQiqAOjl8BY23R71piGgFRUfjpogde5R6Asp
 Q/SmViOW9W+dqZesqjvuhciILGj1XHItXuhXkyyYyzHzp4+6nBxiz/nJrAiGBKw17zjqTxiYhnK
 EA31Il5hUiG442/mOpg==
X-Proofpoint-ORIG-GUID: eqOdysQuF5KFxl-roeJvUHdp7mGr5CfW
X-Proofpoint-GUID: eqOdysQuF5KFxl-roeJvUHdp7mGr5CfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230195
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: F262717E48A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:03AM +0530, Ekansh Gupta wrote:
> Introduce a basic UAPI for the QDA accelerator driver along with a
> DRM IOCTL handler to query DSP device identity. A new UAPI header
> include/uapi/drm/qda_accel.h defines DRM_QDA_QUERY, the corresponding
> DRM_IOCTL_QDA_QUERY command, and struct drm_qda_query, which contains
> a DSP name string.
> 
> On the kernel side, qda_ioctl_query() validates the per-file context,
> resolves the qda_dev instance from dev->dev_private, and copies the
> DSP name from qdev->dsp_name into the query structure. The new
> qda_ioctls[] table wires this IOCTL into the QDA DRM driver so
> userspace can call it through the standard DRM command interface.
> 
> This IOCTL provides a simple and stable way for userspace to discover
> which DSP a given QDA device node represents and serves as the first
> building block for a richer QDA UAPI in subsequent patches.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |  1 +
>  drivers/accel/qda/qda_drv.c   |  9 +++++++++
>  drivers/accel/qda/qda_ioctl.c | 45 +++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_ioctl.h | 26 ++++++++++++++++++++++++
>  include/uapi/drm/qda_accel.h  | 47 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 128 insertions(+)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 7e96ddc40a24..f547398e1a72 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -10,5 +10,6 @@ qda-y := \
>  	qda_rpmsg.o \
>  	qda_cb.o \
>  	qda_memory_manager.o \
> +	qda_ioctl.o \

Keep the list sorted, please.

>  
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index bf95fc782cf8..86758a9cd982 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -9,7 +9,10 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/qda_accel.h>
> +
>  #include "qda_drv.h"
> +#include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
>  
>  static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
> @@ -128,11 +131,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>  
>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>  
> +static const struct drm_ioctl_desc qda_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
> +};
> +
>  static struct drm_driver qda_drm_driver = {
>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>  	.fops			= &qda_accel_fops,
>  	.open			= qda_open,
>  	.postclose		= qda_postclose,
> +	.ioctls = qda_ioctls,

Please select one style. Either you indent all assignments or you don't.

> +	.num_ioctls = ARRAY_SIZE(qda_ioctls),
>  	.name = DRIVER_NAME,
>  	.desc = "Qualcomm DSP Accelerator Driver",
>  };
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> new file mode 100644
> index 000000000000..9fa73ec2dfce
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_gem.h>
> +#include <drm/qda_accel.h>
> +#include "qda_drv.h"
> +#include "qda_ioctl.h"
> +
> +static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
> +					struct qda_dev **qdev, struct qda_user **qda_user)
> +{
> +	struct qda_drm_priv *drm_priv = dev->dev_private;
> +	struct qda_file_priv *qda_file_priv;
> +
> +	if (!drm_priv)
> +		return -EINVAL;
> +
> +	*qdev = drm_priv->qdev;
> +	if (!*qdev)
> +		return -EINVAL;

Can this actually happen or is it (un)wishful thinking?

> +
> +	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
> +	if (!qda_file_priv || !qda_file_priv->qda_user)
> +		return -EINVAL;

What are you protecting against?

> +
> +	*qda_user = qda_file_priv->qda_user;
> +
> +	return 0;
> +}
> +
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
> +{
> +	struct qda_dev *qdev;
> +	struct qda_user *qda_user;
> +	struct drm_qda_query *args = data;
> +	int ret;
> +
> +	ret = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
> +	if (ret)
> +		return ret;
> +
> +	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> new file mode 100644
> index 000000000000..6bf3bcd28c0e
> --- /dev/null
> +++ b/drivers/accel/qda/qda_ioctl.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QDA_IOCTL_H
> +#define _QDA_IOCTL_H
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <drm/drm_ioctl.h>
> +#include "qda_drv.h"
> +
> +/**
> + * qda_ioctl_query - Query DSP device information and capabilities
> + * @dev: DRM device structure
> + * @data: User-space data containing query parameters and results
> + * @file_priv: DRM file private data
> + *
> + * This IOCTL handler queries information about the DSP device.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
> +
> +#endif /* _QDA_IOCTL_H */
> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
> new file mode 100644
> index 000000000000..0aad791c4832
> --- /dev/null
> +++ b/include/uapi/drm/qda_accel.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_ACCEL_H__
> +#define __QDA_ACCEL_H__
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/*
> + * QDA IOCTL command numbers
> + *
> + * These define the command numbers for QDA-specific IOCTLs.
> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
> + */
> +#define DRM_QDA_QUERY	0x00
> +/*
> + * QDA IOCTL definitions
> + *
> + * These macros define the actual IOCTL numbers used by userspace applications.
> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
> + * data structure and direction (read/write) for each IOCTL.
> + */
> +#define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
> +
> +/**
> + * struct drm_qda_query - Device information query structure
> + * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
> + *
> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
> + * allowing userspace to identify which DSP a device node represents. The
> + * kernel provides the DSP name directly as a null-terminated string.
> + */
> +struct drm_qda_query {
> +	__u8 dsp_name[16];
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* __QDA_ACCEL_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
