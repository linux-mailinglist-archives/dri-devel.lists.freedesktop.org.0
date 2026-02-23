Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJM+F3XYnGkFLwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:45:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B962317E872
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADE610E45C;
	Mon, 23 Feb 2026 22:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxwZI8N7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjlGIU3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F0010E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:45:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NDsVJB185750
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4uwG+VSOUPiQWFQC4n/buq2e
 c1Jxta6TBA66E35NxDU=; b=RxwZI8N7h8IyqIggGJxquVH3UCDbV1q5LiSJ+ilt
 DdciWWZZ87rygoZLFTX7IFnxwhjw3a2NekubPTReBbZdvT5/4SSjyEZb+WDNYh8A
 WQ8gdZL650EWkFAtysqxYKeuW8qApHFcT2N74xuR4TKihkr/XGpCrAqdNYDAxs/1
 NT49p75lSokhEFFtzG1AVZFQmoeq3548hEiK7Iw7IhrArm4kDLXTLXWIURFHHJWi
 f4G+rooV2wwz+HpS0+nJec8gygbF88Xa8UpYvzXt/UceJ+BeoiwcqyxKG4b6W0ho
 FxvSAPylmmsj5J5FZAGJVokXdrAbR8YEUY10TUTO78Pghg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69hhs5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:45:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8947d47793fso553185386d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771886702; x=1772491502;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4uwG+VSOUPiQWFQC4n/buq2ec1Jxta6TBA66E35NxDU=;
 b=OjlGIU3KCM0EwT5JvGEp3Hndu+elhXhdbeWvdwASMDQO+2+ME1c0L2DDx+aXUahlyI
 E6eYq8rDNxBN3ghy7YtH3pD1zaM8X3KH6uuUCIo9OsHCjMdVoTCfAtv6JRbhAIEjrnUm
 HadGXkEkzby73s3ZcNf6EliVgfPTePKd6qL68JJ5POBRW+GEND9/IHbCwS7UnVW/OCU9
 3q+GY9cG5LXzMf8n9G9JZJeFstk5LSWOR9XGNr5FXho47Ln4qd8z6JEsgQXYVBbZr9qP
 tV4TNH+fk9Tfa0WrPeelE9eETWoCIqNE7M6FiEgHoTOCRelgKh1Sfmhxmc96DHmAR2jR
 HC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771886702; x=1772491502;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4uwG+VSOUPiQWFQC4n/buq2ec1Jxta6TBA66E35NxDU=;
 b=EwAN7cCRmikQX0SNRekMuxWF2bNwl234hDjpZjCN4+8Q16UDaEutdPEKuwgBkE9usI
 qvji5Ilr28/jy5dUdUyWRvvo/8AhuZ7+I2j5uJzvltM4md25FRfBIMV/0NwUfpeDmHBC
 vX+gK4nrHbWlufTuqEsRgpAy3ZsioKD6DLMZRbyH944N2SHderL58W/1SD6Y8vwIpMLl
 vkF5eSbuPLPnaOYeThAMjvz3kDVWovpRRznPI1SB+Tw3ctH7MY+Pgb18oAtTNL2AFHd9
 1oSaqqHOxQBBtZRfKhq8Ouewb4X8lGLC84aiCBoy+AjnYeFXepKOPvIlLDRfwCpMJUQ8
 Z2yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcxW88UVEcuJsr3PxCYwv55KRZpzUJBfLmjypU0VaYGuHjKXSvJzLsvE/C3/GaANqrXmoeUgBfGHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymAZ2vGa/63Lp598d/HIM6Qgz99e5NbuvqCe6CajUJlUjPaYBp
 AOD16vliyIAxDESFWQocqFCVe6k3GtosZfHpq18VOYox+o67WDxDUFLg7ZlhZkldRgmagqCY8KC
 HScwPf44JIVWilaWXkPKVYdnnj8iGOL7vBK7feL5CixpAz6EnPLNqdJaP1DiXUgKnd2qrYbk=
X-Gm-Gg: AZuq6aKDqUnCbK7Iow9Av+eWo51tII2gYvBoy3ARORt7VHouvClCkTUFRp0GqbesIHJ
 Imrptxlke+tJtwgzPg3wAbulyox+WCTrrikxcGaocxqtvcl05nPH/UF7mgB038q+xYog6AdAecb
 smcPoCmZSqUW3QqYYaL3nSZ0rSPUalNl4A+QQJVYy1uagk3UrZPNdoVO5YfJ3Vg5918leQ6QmqT
 fKdkIWVOSdBRxnGNEuvNtzOc0Gtlh0HnhiH/qeFmFb6S0ed9AQZ6yWbExXJBnQvENX/dqJkIgsJ
 D+6Cq9edcDeX3IIsEMQyFENsiJLXIt3ndtbdz+73DL461iKPnxDjoR56YEofJcYFm/dZnhIqEmH
 0pOszn41kjwuYKlbl7IFKwUjNZyjin5dJKOJc88FWU+fT7DCKk5o+EMMPc44g+EEJF1IZg7Ait+
 bHsk7kDaBRYPFrP12TNSTBDbXlMByPML98k/o=
X-Received: by 2002:a05:620a:4727:b0:8ca:2bab:a0f9 with SMTP id
 af79cd13be357-8cb8c9dfd2bmr1406786485a.1.1771886702342; 
 Mon, 23 Feb 2026 14:45:02 -0800 (PST)
X-Received: by 2002:a05:620a:4727:b0:8ca:2bab:a0f9 with SMTP id
 af79cd13be357-8cb8c9dfd2bmr1406783685a.1.1771886701837; 
 Mon, 23 Feb 2026 14:45:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb3e9a2sm1832057e87.55.2026.02.23.14.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:45:01 -0800 (PST)
Date: Tue, 24 Feb 2026 00:44:58 +0200
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
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
Message-ID: <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699cd86f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=m81VUDHjpZwfiQc3ckkA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: b2ZgN7jbch-U3FGaGp3oSTHFPfHXcruu
X-Proofpoint-GUID: b2ZgN7jbch-U3FGaGp3oSTHFPfHXcruu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NyBTYWx0ZWRfX+WKXE67RNZUm
 ld15U56XN+hWJrIdKsjyhiomweqN1TSUzm2fs25TtrCEhZj5FYhkb4oVloJbcAOWvOlpOR3nkiH
 SUK2mrUtn22xEQzAFCv592acRy2Tw1qxZ5VtoEyAUMAj4/fsI6oavcxHWDbf7sTno68vwf4YN5+
 NNx1n6eKutFjMkGv5WjwSp28vs2Xjo+VGvnSQVqkH+eeEZy0lZ5U9yuQbjECHPs+me0XUHIvIZS
 XwmQSEbNMdap+L0/nWtqnfz7lpxxTEAf6XO+92sCaCjrXG/LqAwkWQ9oVkkiUTpsVy2PFKqXq4F
 +qAnuDPYxh1RI+fKzxqcK7wd2vIO04o9KF0Lbt+LIpmPMlNab2gOSTtjqGb5WFDXmrcjw68bgT6
 P+Y7VxqhDCd+u8iQ9ZPGxL6KIsmyrITmPQUtLsEmnlmddISA5VnzKZXib1/t7LxtBWK6EwYrcZl
 fNNPqCo9JD7M1NI6qxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230197
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: B962317E872
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
> DSP accelerator (QDA) driver to represent DSP CB devices that require
> IOMMU configuration. This separates the CB bus from the QDA driver and
> allows QDA to remain a loadable module while the bus is always built-in.

Why? What is the actual problem that you are trying to solve?

> 
> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is

Don't describe the patch contents. Please.

> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
> updated to descend into the QDA directory for both built-in and module
> builds so that the CB bus is compiled into vmlinux while the driver
> remains modular.
> 
> The CB bus is registered at postcore_initcall() time and is exposed to
> the IOMMU core through iommu_buses[] in the same way as the Tegra
> host1x context-bus. This enables later patches to create CB devices on
> this bus and obtain IOMMU domains for them.

Note, there is nothing QDA-specific in this patch. Please explain, why
the bus is QDA-specific? Can we generalize it?

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/Makefile              |  1 +
>  drivers/accel/qda/Kconfig           |  5 +++++
>  drivers/accel/qda/Makefile          |  2 ++
>  drivers/accel/qda/qda_compute_bus.c | 23 +++++++++++++++++++++++
>  drivers/iommu/iommu.c               |  4 ++++
>  include/linux/qda_compute_bus.h     | 22 ++++++++++++++++++++++
>  6 files changed, 57 insertions(+)
> 
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 58c08dd5f389..9ed843cd293f 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>  obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
> index 484d21ff1b55..ef1fa384efbe 100644
> --- a/drivers/accel/qda/Kconfig
> +++ b/drivers/accel/qda/Kconfig
> @@ -3,11 +3,16 @@
>  # Qualcomm DSP accelerator driver
>  #
>  
> +
> +config DRM_ACCEL_QDA_COMPUTE_BUS
> +	bool
> +
>  config DRM_ACCEL_QDA
>  	tristate "Qualcomm DSP accelerator"
>  	depends on DRM_ACCEL
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on RPMSG
> +	select DRM_ACCEL_QDA_COMPUTE_BUS
>  	help
>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>  	  This driver provides a standardized interface for offloading computational
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index e7f23182589b..242684ef1af7 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>  qda-y := \
>  	qda_drv.o \
>  	qda_rpmsg.o \
> +
> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
> new file mode 100644
> index 000000000000..1d9c39948fb5
> --- /dev/null
> +++ b/drivers/accel/qda/qda_compute_bus.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/device.h>
> +#include <linux/init.h>
> +
> +struct bus_type qda_cb_bus_type = {
> +	.name = "qda-compute-cb",
> +};
> +EXPORT_SYMBOL_GPL(qda_cb_bus_type);
> +
> +static int __init qda_cb_bus_init(void)
> +{
> +	int err;
> +
> +	err = bus_register(&qda_cb_bus_type);
> +	if (err < 0) {
> +		pr_err("qda-compute-cb bus registration failed: %d\n", err);
> +		return err;
> +	}
> +	return 0;
> +}
> +
> +postcore_initcall(qda_cb_bus_init);
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 4926a43118e6..5dee912686ee 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -33,6 +33,7 @@
>  #include <trace/events/iommu.h>
>  #include <linux/sched/mm.h>
>  #include <linux/msi.h>
> +#include <linux/qda_compute_bus.h>
>  #include <uapi/linux/iommufd.h>
>  
>  #include "dma-iommu.h"
> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
> +	&qda_cb_bus_type,
> +#endif
>  };
>  
>  /*
> diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
> new file mode 100644
> index 000000000000..807122d84e3f
> --- /dev/null
> +++ b/include/linux/qda_compute_bus.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_COMPUTE_BUS_H__
> +#define __QDA_COMPUTE_BUS_H__
> +
> +#include <linux/device.h>
> +
> +/*
> + * Custom bus type for QDA compute context bank (CB) devices
> + *
> + * This bus type is used for manually created CB devices that represent
> + * IOMMU context banks. The custom bus allows proper IOMMU configuration
> + * and device management for these virtual devices.
> + */
> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
> +extern struct bus_type qda_cb_bus_type;
> +#endif
> +
> +#endif /* __QDA_COMPUTE_BUS_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
