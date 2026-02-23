Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N22KHHZnGkFLwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:49:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20F17E922
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C910E325;
	Mon, 23 Feb 2026 22:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgYaXKe1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPmGBX2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31E510E325
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:49:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NH4c8P910666
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IxyS7IiUwnZk4M8j2FTACcTO
 tmYuJKogn0322cRLchI=; b=jgYaXKe10ei+VDIUlMgJn/SRuxKYMLLJ1Di2YX+t
 9A6aHUl10WOftpULKAemW2iVpnmTkQ1cfUZ2PcmezxdBD3LZuGLnSHIaRYWyhiPg
 oAZmP2884fWE8AuFgScfFKLzKWYuD41FtJonDi7eYJ7Z4BJZUjLotVeI5Ng9epzt
 PuX5ZsT0W8oBtSqxKwhgnnoGH3hUicFk93ZVMsBSFwHqi+apPEXbPzSBiCP+vlKu
 PME6V/b7h2MvEKFuUCTcuf7bml1Qh3vcynTvhKVssxhVjGTKXY/fbT1MfjqfcBtI
 xSm/NCR3THrDIi83cfrr3/2qPzc+nwJEElJwRWmTAWWQEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj8x87-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:49:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso5587199985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771886955; x=1772491755;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IxyS7IiUwnZk4M8j2FTACcTOtmYuJKogn0322cRLchI=;
 b=kPmGBX2rGFVvjNX3URETgI3hH9qnTlEVGy106omrvs7GQOfmaqsshg9Atjempxfyu9
 ULaorfmw4DVFmsG8ZwhsYnSdOoTr9gPTgELmjf5NplEYtYqhhcbRHO+HG/mWqYEOjq2S
 5/QgoVy21pEc4dfraAdb1IC4JQO7ZQPwYiVixwjvVbvEIJOFSDMpohFuGDY9JZDs63DW
 5OkGW2m2nf4UhaUXwC2yEC4O2iA8ZWzUcVOzTSPNeaCZgwaBafJpqMkwfq1I97lIz0rJ
 SL5wAcWyCubL7YxkAAzFh4Iy2LaLJ5pydX9ZTIFt9e7ngoBrTjEBFm44z5T5NdDVFLys
 01gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771886955; x=1772491755;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxyS7IiUwnZk4M8j2FTACcTOtmYuJKogn0322cRLchI=;
 b=cnvhnjQ7enKA0SYTcjsrWdsn2Kedy7l/MOQyqvyrLAdJZ/CdHV0KjA8Q38OZxtyNie
 wXz6giBa5NwO9l0WNJZNbqW7dyxqvfH9bRH723I+oFzGLtUMPXXv6m0BLiIcTD3pq3Zs
 76dsZmAB52+6i9QCfqXoqce9CBQmLb9pAQ7VHBKRtUieRllt7M5sdCX6NJiTQ32CsXwC
 /s0VqfFM3fqLQIlzYT5/l/NXwl/XyJjH4/161XiF/soTvIdLfevCGSLMU42EigKoJqPs
 8yrxonE3gghOAm9K3LhbPovhA2RXIBw3o/AZrYm582nw1PIavlNNF/+PcR871zH7Hzn+
 rGuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtxk2JZtrgt/8jXvYep6DrPBaJKts+4NhB/TJbfeNzF9XVLWPZnqviEV050GYXJH85/uiVN7UcZUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGHvWEHTFfjt3A13qx8XidvSH6keny0uJJ5wI/6qTAO/8gKFVw
 feIE1dgRy0IjkQv0Wd5jlTuECM6Ng3dPjS2zgHspRlMW2UkIjYa6ktlrpGHUu8K1+i1Gzsg+C5u
 cqfzNBdvToMAVRZ2VajHyLfdpH62Gv8PR3mu7/6OeXcko9PO7YteifNczWIz1r34Lp+IausY=
X-Gm-Gg: AZuq6aJZjeZ4iqRFQ4Sk1WlCDXl6pjmFVyKGj1TCOIXUuvhSgslvystkwCtYA8t8F+n
 yd22LUgiaQiClKDzl693u53eg3tkhTKLoCMEl0GEOX4p1+OOKgMPw9eeF33jnpLVdhZi3TROnW5
 IVPfcnWSD/PC0cMukSiipUKNftQHH+ukEQL9OwH2xD2cSO5eUu8fxa8a1PwFuwV6CUAxvCP/qQZ
 U3yaLXi7DDX3dFtU1sqnlqaiZgM4VbbcmXi2XjKC+ELKuQXoxwi/G15okAA1ctlemoOCaV6LM1S
 RHZp1Xi1IMk1XAFiS7KcYx8stTrZ91GglZoktJlNHOFZ9aw3yLxVXvdqtqkdMIZ7NER6hMMHKn0
 hueMd1lMcnywlcjAmhPLoxUuxcghf3kn+kg9LDRGNJ25jupf4dPMKx9YZ/hwD2rtvZunX5Nokzz
 oFgkDmwS4v6lzEtEI7H2O3j6gaTo7JpUMugKg=
X-Received: by 2002:a05:620a:1921:b0:8c7:f62:21c7 with SMTP id
 af79cd13be357-8cb8c9ebdc6mr1299798685a.20.1771886954697; 
 Mon, 23 Feb 2026 14:49:14 -0800 (PST)
X-Received: by 2002:a05:620a:1921:b0:8c7:f62:21c7 with SMTP id
 af79cd13be357-8cb8c9ebdc6mr1299793585a.20.1771886954113; 
 Mon, 23 Feb 2026 14:49:14 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb45c38sm1807487e87.73.2026.02.23.14.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:49:13 -0800 (PST)
Date: Tue, 24 Feb 2026 00:49:11 +0200
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
Subject: Re: [PATCH RFC 05/18] accel/qda: Create compute CB devices on QDA
 compute bus
Message-ID: <x3s26yr7oy2dokp4plsp67yndr7o4ps6nuj7i4zjze77ifljux@ap537se6npfg>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-5-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699cd96b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cz5CYKkr5BOHp3dh53AA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wgVq1ZaxpqjgjkDnH56-uYbVRKgv23GA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5OSBTYWx0ZWRfX/YLXE9izzRp9
 hM+Nr7z/Z76qsLBO1Oef0g3R4fIwB0Zv6yDmNIa1zC3eJ84fsdLFdMWA/c0H1UKpy/7s8FWidL0
 z3sd6977NJGh2a7O0lhupFqQ2fdhWvPj7rDD6PsOpuU6Y6uydVB+iGPmSlE599tA+rFkg30d16f
 Be8chs/SQZGcsRqlcegXvdpjPw7+CYlW7/ZZRQk5sfC8m5yC+oKLXBfdSUhSoE/W/AUMrM/2+H/
 NPiMc8FXGo0A5Xv2yrbNKGUK9PHJ8xKsE2K3UI0NWics72hFpJpSfXrGUUsPRvOqYWZ+FapGzJ/
 R+sRbgbGPbUW6nrwd/XSFnMCAyBf/Lm0ctgRjdKFMSnB4WaRKSjQEyYfHP9PPIZA8mL7P8Q3GU0
 2+FN3GwSDmjgFxLI7wb2UlE0I3Ei0B2Drx3Zvur+8xI70hEFe5sOELbT4QuHWr3m7K9/9wiOXBR
 3zN0s7OKH21EFbDvxmA==
X-Proofpoint-GUID: wgVq1ZaxpqjgjkDnH56-uYbVRKgv23GA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230199
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0B20F17E922
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:59AM +0530, Ekansh Gupta wrote:
> Add support for creating compute context-bank (CB) devices under
> the QDA compute bus based on child nodes of the FastRPC RPMsg
> device tree node. Each DT child with compatible
> "qcom,fastrpc-compute-cb" is turned into a QDA-owned struct
> device on qda_cb_bus_type.
> 
> A new qda_cb_dev structure and cb_devs list in qda_dev track these
> CB devices. qda_populate_child_devices() walks the DT children
> during QDA RPMsg probe, creates CB devices, configures their DMA
> and IOMMU settings using of_dma_configure(), and associates a SID
> from the "reg" property when present.
> 
> On RPMsg remove, qda_unpopulate_child_devices() tears down all CB
> devices, removing them from their IOMMU groups if present and
> unregistering the devices. This prepares the ground for using CB
> devices as IOMMU endpoints for DSP compute workloads in later
> patches.

Are we loosing the nsessions support?

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile    |   1 +
>  drivers/accel/qda/qda_cb.c    | 150 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_cb.h    |  26 ++++++++
>  drivers/accel/qda/qda_drv.h   |   3 +
>  drivers/accel/qda/qda_rpmsg.c |  40 +++++++++++
>  5 files changed, 220 insertions(+)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 242684ef1af7..4aded20b6bc2 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_drv.o \
>  	qda_rpmsg.o \
> +	qda_cb.o \
>  
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> new file mode 100644
> index 000000000000..77a2d8cae076
> --- /dev/null
> +++ b/drivers/accel/qda/qda_cb.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/dma-mapping.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/iommu.h>
> +#include <linux/slab.h>
> +#include "qda_drv.h"
> +#include "qda_cb.h"
> +
> +static void qda_cb_dev_release(struct device *dev)
> +{
> +	kfree(dev);

Do you need to put the reference on the OF node?

> +}
> +
> +static int qda_configure_cb_iommu(struct device *cb_dev, struct device_node *cb_node)
> +{
> +	int ret;
> +
> +	qda_dbg(NULL, "Configuring DMA/IOMMU for CB device %s\n", dev_name(cb_dev));
> +
> +	/* Use of_dma_configure which handles both DMA and IOMMU configuration */
> +	ret = of_dma_configure(cb_dev, cb_node, true);
> +	if (ret) {
> +		qda_err(NULL, "of_dma_configure failed for %s: %d\n", dev_name(cb_dev), ret);
> +		return ret;
> +	}
> +
> +	qda_dbg(NULL, "DMA/IOMMU configured successfully for CB device %s\n", dev_name(cb_dev));
> +	return 0;
> +}
> +
> +static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev)
> +{
> +	int rc;
> +	u32 sid, pa_bits = 32;
> +
> +	qda_dbg(qdev, "Setting up CB device %s\n", dev_name(cb_dev));
> +
> +	if (of_property_read_u32(cb_dev->of_node, "reg", &sid)) {
> +		qda_dbg(qdev, "No 'reg' property found, defaulting SID to 0\n");
> +		sid = 0;

Don't do the job of the schema validator. Are there nodes without reg?
No.

> +	}
> +
> +	rc = dma_set_mask(cb_dev, DMA_BIT_MASK(pa_bits));
> +	if (rc) {
> +		qda_err(qdev, "%d bit DMA enable failed: %d\n", pa_bits, rc);
> +		return rc;
> +	}
> +
> +	qda_dbg(qdev, "CB device setup complete - SID: %u, PA bits: %u\n", sid, pa_bits);
> +
> +	return 0;
> +}
> +
> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
> +{
> +	struct device *cb_dev;
> +	int ret;
> +	u32 sid = 0;
> +	struct qda_cb_dev *entry;
> +
> +	qda_dbg(qdev, "Creating CB device for node: %s\n", cb_node->name);
> +
> +	of_property_read_u32(cb_node, "reg", &sid);
> +
> +	cb_dev = kzalloc_obj(*cb_dev, GFP_KERNEL);
> +	if (!cb_dev)
> +		return -ENOMEM;
> +
> +	device_initialize(cb_dev);
> +	cb_dev->parent = qdev->dev;
> +	cb_dev->bus = &qda_cb_bus_type; /* Use our custom bus type for IOMMU handling */
> +	cb_dev->release = qda_cb_dev_release;
> +	dev_set_name(cb_dev, "qda-cb-%s-%u", qdev->dsp_name, sid);
> +
> +	qda_dbg(qdev, "Initialized CB device: %s\n", dev_name(cb_dev));
> +
> +	cb_dev->of_node = of_node_get(cb_node);
> +
> +	cb_dev->dma_mask = &cb_dev->coherent_dma_mask;
> +	cb_dev->coherent_dma_mask = DMA_BIT_MASK(32);
> +
> +	dev_set_drvdata(cb_dev->parent, qdev);
> +
> +	ret = device_add(cb_dev);
> +	if (ret) {
> +		qda_err(qdev, "Failed to add CB device for SID %u: %d\n", sid, ret);
> +		goto cleanup_device_init;
> +	}
> +
> +	qda_dbg(qdev, "CB device added to system\n");
> +
> +	ret = qda_configure_cb_iommu(cb_dev, cb_node);
> +	if (ret) {
> +		qda_err(qdev, "IOMMU configuration failed: %d\n", ret);
> +		goto cleanup_device_add;
> +	}
> +
> +	ret = qda_cb_setup_device(qdev, cb_dev);
> +	if (ret) {
> +		qda_err(qdev, "CB device setup failed: %d\n", ret);
> +		goto cleanup_device_add;
> +	}
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry) {
> +		ret = -ENOMEM;
> +		goto cleanup_device_add;
> +	}
> +
> +	entry->dev = cb_dev;
> +	list_add_tail(&entry->node, &qdev->cb_devs);
> +
> +	qda_dbg(qdev, "Successfully created CB device for SID %u\n", sid);
> +	return 0;
> +
> +cleanup_device_add:
> +	device_del(cb_dev);
> +cleanup_device_init:
> +	of_node_put(cb_dev->of_node);
> +	put_device(cb_dev);
> +	return ret;
> +}
> +
> +void qda_destroy_cb_device(struct device *cb_dev)
> +{
> +	struct iommu_group *group;
> +
> +	if (!cb_dev) {
> +		qda_dbg(NULL, "NULL CB device passed to destroy\n");
> +		return;
> +	}
> +
> +	qda_dbg(NULL, "Destroying CB device %s\n", dev_name(cb_dev));
> +
> +	group = iommu_group_get(cb_dev);
> +	if (group) {
> +		qda_dbg(NULL, "Removing %s from IOMMU group\n", dev_name(cb_dev));
> +		iommu_group_remove_device(cb_dev);
> +		iommu_group_put(group);
> +	}
> +
> +	of_node_put(cb_dev->of_node);
> +	cb_dev->of_node = NULL;
> +	device_unregister(cb_dev);
> +
> +	qda_dbg(NULL, "CB device %s destroyed\n", dev_name(cb_dev));
> +}
> diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
> new file mode 100644
> index 000000000000..a4ae9fef142e
> --- /dev/null
> +++ b/drivers/accel/qda/qda_cb.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_CB_H__
> +#define __QDA_CB_H__
> +
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/list.h>
> +#include <linux/qda_compute_bus.h>
> +#include "qda_drv.h"
> +
> +struct qda_cb_dev {
> +	struct list_head node;
> +	struct device *dev;
> +};
> +
> +/*
> + * Compute bus (CB) device management
> + */
> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node);
> +void qda_destroy_cb_device(struct device *cb_dev);
> +
> +#endif /* __QDA_CB_H__ */
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index bec2d31ca1bb..eb732b7d8091 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -7,6 +7,7 @@
>  #define __QDA_DRV_H__
>  
>  #include <linux/device.h>
> +#include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
>  #include <linux/xarray.h>
> @@ -26,6 +27,8 @@ struct qda_dev {
>  	atomic_t removing;
>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>  	char dsp_name[16];
> +	/* Compute context-bank (CB) child devices */
> +	struct list_head cb_devs;
>  };
>  
>  /**
> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
> index a8b24a99ca13..5a57384de6a2 100644
> --- a/drivers/accel/qda/qda_rpmsg.c
> +++ b/drivers/accel/qda/qda_rpmsg.c
> @@ -7,6 +7,7 @@
>  #include <linux/of_device.h>
>  #include "qda_drv.h"
>  #include "qda_rpmsg.h"
> +#include "qda_cb.h"
>  
>  static int qda_rpmsg_init(struct qda_dev *qdev)
>  {
> @@ -25,11 +26,42 @@ static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
>  
>  	qdev->dev = &rpdev->dev;
>  	qdev->rpdev = rpdev;
> +	INIT_LIST_HEAD(&qdev->cb_devs);
>  
>  	qda_dbg(qdev, "Allocated and initialized qda_dev\n");
>  	return qdev;
>  }
>  
> +static void qda_unpopulate_child_devices(struct qda_dev *qdev)
> +{
> +	struct qda_cb_dev *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
> +		list_del(&entry->node);
> +		qda_destroy_cb_device(entry->dev);
> +		kfree(entry);

Why can't you embed struct device into a structure together with the
list_node (and possibly some other data?)?

> +	}
> +}
> +
> +static int qda_populate_child_devices(struct qda_dev *qdev, struct device_node *parent_node)
> +{
> +	struct device_node *child;
> +	int count = 0, success = 0;
> +
> +	for_each_child_of_node(parent_node, child) {
> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb")) {
> +			count++;
> +			if (qda_create_cb_device(qdev, child) == 0) {
> +				success++;
> +				qda_dbg(qdev, "Created CB device for node: %s\n", child->name);
> +			} else {
> +				qda_err(qdev, "Failed to create CB device for: %s\n", child->name);

Don't loose the error code. Instead please return it to the caller.

> +			}
> +		}
> +	}
> +	return success > 0 ? 0 : (count > 0 ? -ENODEV : 0);
> +}
> +
>  static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>  {
>  	/* Dummy function for rpmsg driver */
> @@ -48,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>  	qdev->rpdev = NULL;
>  	mutex_unlock(&qdev->lock);
>  
> +	qda_unpopulate_child_devices(qdev);
>  	qda_deinit_device(qdev);
>  
>  	qda_info(qdev, "RPMsg device removed\n");
> @@ -83,6 +116,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = qda_populate_child_devices(qdev, rpdev->dev.of_node);
> +	if (ret) {
> +		qda_err(qdev, "Failed to populate child devices: %d\n", ret);
> +		qda_deinit_device(qdev);
> +		return ret;
> +	}
> +
>  	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
