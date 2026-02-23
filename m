Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHQSLNHRnGllKQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:16:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A34C17E230
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1CC10E31A;
	Mon, 23 Feb 2026 22:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqnUO0Vn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O13Q7yA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5824510E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:16:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NH4cmH910641
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7va14BLOKUzsh75bZFAJzVRf
 4H4OIi1hkRGWKQdCG8M=; b=jqnUO0VnxouOlpzyWXInGXYr5DzwjgLFsroPbF5L
 Y0uoJUmnyV5M2ebDEF9jFaAzcqGMmDXMi2Ohsu20iMPwfpDmIdUTMOFAAgDKtBQt
 v/ts8dQ60FWd1poWlN+DFr+gn3yGafMurNmYJIw92t7RCQH285CcZgQv5cez/sT8
 VWnJ85O2ICGQg4ZkIKgufVgnrINPgeBw3GU9yWrUuMHZ/JJlCxlQyWwen6wjJ66E
 eQ7M9Md1c7UA5Rph+FUvX7GTWrN00BKrospt32O2f2oD5UQ3RZaM+5hbAwg3nyIJ
 /j3XInLOdijzH51ateYwHoXJQmd0zI1kbwm+bRoSxuI0Gg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj8us4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:16:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-896fa0fcf27so627072136d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771885003; x=1772489803;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7va14BLOKUzsh75bZFAJzVRf4H4OIi1hkRGWKQdCG8M=;
 b=O13Q7yA6Y87Xe4dIpY+3+9BYWAKMt8qnP+JER+tX5cYQlmrPPwFE/YFvr6M5ONnEY1
 GAetApYVe7jyMscN5MxQnt+M6Ms/x8CicbHQYO84dTzN6MLV6hIc9KlrJ2p3mSYXnO1B
 0+5/Q8sJJpdCuuardCjs5SdR+QAep5UYoLfiGRWyIbJ+T0AO2kpfjSSBUNZaKzkr9GTz
 xrFMTBaZ+LgCF+zm8D0z0Yq0u8qDUo1Kx0Kz/V5RSpVCLv1lus+Fg/BpVIMlFvtthMhd
 SexRiZBU2XK603yzO6eyv5I5/OVa6VGCKJ+OXa/6thkQ5dRL3rCWd+GJg0gVSGkUTSHQ
 Kuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771885003; x=1772489803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7va14BLOKUzsh75bZFAJzVRf4H4OIi1hkRGWKQdCG8M=;
 b=cEmQKBtkjsQRgxBonBa2VdxQVkxrM2u5c25iL78Nvzqdj07rXnaWa/aSX9oGmCRq5k
 4IagrXTrssTQwXtqLrUXSt0jLRbAO+KM7DBhU/ro5qw3c3GNnh56dsdZeftkBnk9jcLd
 IR1NKm2D9e1tVX7EVc/hV4HIK+z44+zJkSaxfEf1ZB6viQtb2YgHu929omnhn5K4314P
 77dIEdVmnfE17z9o17mN2+oeR/QsbPOVoOK4XwPvuKWKeUX5i84L+ZKJ2IwBXkxm+i1n
 oaa8mdU6/bTOzZtBU0NyZ1P6/lvdzjx1TZZ49HiE4suraz8drbeFKqDYm+aQam3d7OAP
 EwnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfJijQZDLR0AaIbgrP8HneKvF9d6WpLocHaWDYYiTlFchxbej/XaO9Ud/fpqhsUarLkjSD3CouSnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfnuFR3W03s1LrT2Wa3N85Syd4b82yhGxcYJUztT8qIvw0dRkv
 rPdODaeSuSphJsk+T/KBejkXIr+TBVtrctXHF2QmKaFzQ1DWH3DMFJRp6euJq/GroUBGZ8PVlSJ
 rq72ajv9A2Rc/mIdGAHb16yX5TzwcOFnBRwh69HAiW6bUEw40BefHcW8FLS0RSNNvxjQSEZM=
X-Gm-Gg: AZuq6aI/l+up2BjbdJdmcG9NVGMZujY3Aof3nE0dDN4raNrC371NFffWbO8PdcHhgEv
 ju26e1HdI0HMIcYGWt3p52ltTygofMkstla4xcBqX126UDPsyguhkQ5oUAL7g4kQ2AqICQfV1+V
 yhcRW+IESBWm4+euu1FcZnJrVCT0ts3ch/87vqOrapXa83iUUyYZWeY8fI2Dru2KNAbSpb9uMwC
 t62zaQcfGdCopSOYie2ArqM7M0G8feZxBN7L+qH/lKsEKrb5VuHu38z9sh/zOdseuJar4yfWyVD
 TPXIohEdlDC9VC4f7tCufi1P1VhEtdr0YPKR0yo7CEwt3LrP2N5Lb6Beo9ZiGCZC7qUQD+ZUZKJ
 dHN+vB/KmrRbqRbsx9InJo06q1+S0bMLxCay4LAnmU1R6PK3oNJDYAJlBu5rsZCXuoxw2nwQ70W
 TrmiEepEj6Bk5e77M4vlVfDG560OhNRNLdCkQ=
X-Received: by 2002:a05:620a:4482:b0:8c6:f414:3ba8 with SMTP id
 af79cd13be357-8cb8ca65b37mr1186747485a.49.1771885003359; 
 Mon, 23 Feb 2026 14:16:43 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8c6:f414:3ba8 with SMTP id
 af79cd13be357-8cb8ca65b37mr1186742585a.49.1771885002701; 
 Mon, 23 Feb 2026 14:16:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb3eaa4sm1837408e87.46.2026.02.23.14.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:16:41 -0800 (PST)
Date: Tue, 24 Feb 2026 00:16:40 +0200
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
Subject: Re: [PATCH RFC 07/18] accel/qda: Add DRM accel device registration
 for QDA driver
Message-ID: <jjj5b2says6y2sk4lokcxslzcwlsg3gj7rme34lqmhufqc7eam@x256mqlsuvet>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-7-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-7-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699cd1cc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2N0wBCc5_LywspELBZUA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ETFPLZlPDD0cBrun4CXgVPlto5hOodi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NCBTYWx0ZWRfX5jpjP4Or9tH5
 NzZ7n7C7C0MJuoWW8qgcYYOFQNqcKV4TIzAUqeDGjt8AbGw2lgDI6wc4ii4Va6btBpq/R82qwh3
 UwTGET8E5+5ZZPSv92BSrmbWnF24TMO9p+Rqbxrpf3ki87xrtie5Kzd7hqRH0olFkorWYfc6U8u
 M5i1dhHe1F50lfZc5KpnkVmk86Voftl/O2arsXVsrbThuMHropffNsK0E5oOKDh+V2OstX0UCqj
 72Ym2R9RPX4uJuva9qIzzmszNls4yG4GKYXSFtaZoRYgABh1WST0cMw5H3cyzksGyS8CKGkgOKH
 pOADNE0Ss+1PIJQo3zuLrxXYDahW5+cHn7coUYokbRB4pz7JhtsRs0Nyy0B7T3kZMhLJ5B77Z5d
 tXsYm+uFhssIsMZHZpsuBt99cLlX7G8Jj7C+pe3WWm9R55QeFGTXSmKkMYNoHmoIZDDHg2/p6YF
 YzT7ILa65ncA/gYXBjQ==
X-Proofpoint-GUID: ETFPLZlPDD0cBrun4CXgVPlto5hOodi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230194
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1A34C17E230
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:01AM +0530, Ekansh Gupta wrote:
> Add DRM accel integration for the QDA DSP accelerator driver. A new
> qda_drm_priv structure is introduced to hold per-device DRM state,
> including a pointer to the memory manager and the parent qda_dev
> instance. The driver now allocates a drm_device, initializes
> driver-private state, and registers the device via the DRM accel
> infrastructure.
> 
> qda_register_device() performs allocation and registration of the DRM
> device, while qda_unregister_device() handles device teardown and
> releases references using drm_dev_unregister() and drm_dev_put().
> Initialization and teardown paths are updated so DRM resources are
> allocated after IOMMU/memory-manager setup and cleaned during RPMsg
> remove.
> 
> This patch lays the foundation for adding GEM buffer support and IOCTL
> handling in later patches as part of the compute accelerator interface.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c   | 103 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_drv.h   |  33 +++++++++++++-
>  drivers/accel/qda/qda_rpmsg.c |   8 ++++
>  3 files changed, 142 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 69132737f964..a9113ec78fa2 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -4,9 +4,31 @@
>  #include <linux/kernel.h>
>  #include <linux/atomic.h>
>  #include <linux/slab.h>
> +#include <drm/drm_accel.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_ioctl.h>
>  #include "qda_drv.h"
>  #include "qda_rpmsg.h"
>  
> +DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
> +
> +static struct drm_driver qda_drm_driver = {
> +	.driver_features = DRIVER_COMPUTE_ACCEL,
> +	.fops			= &qda_accel_fops,

Strange indentation in the middle. Please drop it.

> +	.name = DRIVER_NAME,
> +	.desc = "Qualcomm DSP Accelerator Driver",
> +};
> +
> +static void cleanup_drm_private(struct qda_dev *qdev)
> +{
> +	if (qdev->drm_priv) {
> +		qda_dbg(qdev, "Cleaning up DRM private data\n");
> +		kfree(qdev->drm_priv);
> +	}
> +}
> +
>  static void cleanup_iommu_manager(struct qda_dev *qdev)
>  {
>  	if (qdev->iommu_mgr) {
> @@ -24,6 +46,7 @@ static void cleanup_device_resources(struct qda_dev *qdev)
>  
>  void qda_deinit_device(struct qda_dev *qdev)
>  {
> +	cleanup_drm_private(qdev);
>  	cleanup_iommu_manager(qdev);
>  	cleanup_device_resources(qdev);
>  }
> @@ -59,6 +82,18 @@ static int init_memory_manager(struct qda_dev *qdev)
>  	return 0;
>  }
>  
> +static int init_drm_private(struct qda_dev *qdev)
> +{
> +	qda_dbg(qdev, "Initializing DRM private data\n");
> +
> +	qdev->drm_priv = kzalloc_obj(*qdev->drm_priv, GFP_KERNEL);
> +	if (!qdev->drm_priv)
> +		return -ENOMEM;
> +
> +	qda_dbg(qdev, "DRM private data initialized successfully\n");
> +	return 0;
> +}
> +
>  int qda_init_device(struct qda_dev *qdev)
>  {
>  	int ret;
> @@ -71,14 +106,82 @@ int qda_init_device(struct qda_dev *qdev)
>  		goto err_cleanup_resources;
>  	}
>  
> +	ret = init_drm_private(qdev);
> +	if (ret) {
> +		qda_err(qdev, "DRM private data initialization failed: %d\n", ret);
> +		goto err_cleanup_iommu;
> +	}
> +
>  	qda_dbg(qdev, "QDA device initialized successfully\n");
>  	return 0;
>  
> +err_cleanup_iommu:
> +	cleanup_iommu_manager(qdev);
>  err_cleanup_resources:
>  	cleanup_device_resources(qdev);
>  	return ret;
>  }
>  
> +static int setup_and_register_drm_device(struct qda_dev *qdev)
> +{
> +	struct drm_device *ddev;
> +	int ret;
> +
> +	qda_dbg(qdev, "Setting up and registering DRM device\n");
> +
> +	ddev = drm_dev_alloc(&qda_drm_driver, qdev->dev);

devm_drm_dev_alloc() please. Move this patch to the front of the series,
making everything else depend on the allocated data structure.

> +	if (IS_ERR(ddev)) {
> +		ret = PTR_ERR(ddev);
> +		qda_err(qdev, "Failed to allocate DRM device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	qdev->drm_priv->drm_dev = ddev;
> +	qdev->drm_priv->iommu_mgr = qdev->iommu_mgr;
> +	qdev->drm_priv->qdev = qdev;
> +
> +	ddev->dev_private = qdev->drm_priv;
> +	qdev->drm_dev = ddev;
> +
> +	ret = drm_dev_register(ddev, 0);
> +	if (ret) {
> +		qda_err(qdev, "Failed to register DRM device: %d\n", ret);
> +		drm_dev_put(ddev);
> +		return ret;
> +	}
> +
> +	qda_dbg(qdev, "DRM device registered successfully\n");
> +	return 0;
> +}
> +
> +int qda_register_device(struct qda_dev *qdev)
> +{
> +	int ret;
> +
> +	ret = setup_and_register_drm_device(qdev);
> +	if (ret) {
> +		qda_err(qdev, "DRM device setup failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	qda_dbg(qdev, "QDA device registered successfully\n");
> +	return 0;
> +}
> +
> +void qda_unregister_device(struct qda_dev *qdev)
> +{
> +	qda_info(qdev, "Unregistering QDA device\n");
> +
> +	if (qdev->drm_dev) {
> +		qda_dbg(qdev, "Unregistering DRM device\n");
> +		drm_dev_unregister(qdev->drm_dev);
> +		drm_dev_put(qdev->drm_dev);
> +		qdev->drm_dev = NULL;
> +	}
> +
> +	qda_dbg(qdev, "QDA device unregistered successfully\n");
> +}
> +
>  static int __init qda_core_init(void)
>  {
>  	int ret;
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index 2cb97e4eafbf..2b80401a3741 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -11,13 +11,35 @@
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
>  #include <linux/xarray.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_accel.h>
>  #include "qda_memory_manager.h"
>  
>  /* Driver identification */
>  #define DRIVER_NAME "qda"
>  
> +/**
> + * struct qda_drm_priv - DRM device private data for QDA device
> + *
> + * This structure serves as the DRM device private data (stored in dev_private),
> + * bridging the DRM device context with the QDA device and providing access to
> + * shared resources like the memory manager during buffer operations.
> + */
> +struct qda_drm_priv {

Shared between what and what? Why do you need a separate structure
instead of using qda_dev?

> +	/* DRM device structure */
> +	struct drm_device *drm_dev;
> +	/* Global memory/IOMMU manager */
> +	struct qda_memory_manager *iommu_mgr;
> +	/* Back-pointer to qda_dev */
> +	struct qda_dev *qdev;
> +};
> +
>  /* struct qda_dev - Main device structure for QDA driver */
>  struct qda_dev {
> +	/* DRM device for accelerator interface */
> +	struct drm_device *drm_dev;

Drop the pointer here.

>  	/* RPMsg device for communication with remote processor */
>  	struct rpmsg_device *rpdev;
>  	/* Underlying device structure */
> @@ -26,6 +48,8 @@ struct qda_dev {
>  	struct mutex lock;
>  	/* IOMMU/memory manager */
>  	struct qda_memory_manager *iommu_mgr;
> +	/* DRM device private data */
> +	struct qda_drm_priv *drm_priv;
>  	/* Flag indicating device removal in progress */
>  	atomic_t removing;
>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
> @@ -39,8 +63,8 @@ struct qda_dev {
>   * @qdev: QDA device structure
>   *
>   * Returns the most appropriate device structure for logging messages.
> - * Prefers qdev->dev, or returns NULL if the device is being removed
> - * or invalid.
> + * Prefers qdev->dev, falls back to qdev->drm_dev->dev, or returns NULL
> + * if the device is being removed or invalid.
>   */
>  static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>  {
> @@ -50,6 +74,9 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>  	if (qdev->dev)
>  		return qdev->dev;
>  
> +	if (qdev->drm_dev)
> +		return qdev->drm_dev->dev;
> +
>  	return NULL;
>  }
>  
> @@ -93,5 +120,7 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>   */
>  int qda_init_device(struct qda_dev *qdev);
>  void qda_deinit_device(struct qda_dev *qdev);
> +int qda_register_device(struct qda_dev *qdev);
> +void qda_unregister_device(struct qda_dev *qdev);
>  
>  #endif /* __QDA_DRV_H__ */
> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
> index 5a57384de6a2..b2b44b4d3ca8 100644
> --- a/drivers/accel/qda/qda_rpmsg.c
> +++ b/drivers/accel/qda/qda_rpmsg.c
> @@ -80,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>  	qdev->rpdev = NULL;
>  	mutex_unlock(&qdev->lock);
>  
> +	qda_unregister_device(qdev);
>  	qda_unpopulate_child_devices(qdev);
>  	qda_deinit_device(qdev);
>  
> @@ -123,6 +124,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return ret;
>  	}
>  
> +	ret = qda_register_device(qdev);
> +	if (ret) {
> +		qda_deinit_device(qdev);
> +		qda_unpopulate_child_devices(qdev);
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
