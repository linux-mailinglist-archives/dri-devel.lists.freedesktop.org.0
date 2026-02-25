Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM9ODvQ3n2m5ZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:57:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5919BDA1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F58410E7E1;
	Wed, 25 Feb 2026 17:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="arfaW0Tf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADsYem9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612CD10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:57:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PB3RRh1512073
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mvsIZr9qVQn4O36RmaOABy93+YNGrflCz5PAS8IaKgM=; b=arfaW0TfHpQRAiB3
 YUxT/Mpf4RJwDwolsP9sX29dPvyxychIKRB9uk3QWcvfIvPnf76Au4Ap0J0MtKmp
 Ze9/v68hrjcyQXPrUuBM6LMvUf0y+jhkpgjL3BfNPmM1etkC2bFeEh0xtXHYs3Iw
 KbYZLJ9kKLbzaHkzQ6bCZkaBF1JuEJYxE4aIHwo+TLG5D+2ilhXVbKenaa+9Op6b
 86VmMxFX5qs9EYajYu8sptVauXO6ZYMx5Gtw/gXYrN0GG1MGybh6Uz/fTKUCFeKF
 tc+h+u7qxTLLtxON7DNtQlwXa+TsD3HBcXyEpXIqQMRQ2ynyjb4DUyoBxq1JiH4O
 miUARA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf196c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:57:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2adda5a44d8so8641085ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772042222; x=1772647022;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mvsIZr9qVQn4O36RmaOABy93+YNGrflCz5PAS8IaKgM=;
 b=ADsYem9ZdsNEdONoCjvFtnn+SC/QSCF9z1RiKODzGSwRCZrp/uiYRN5gB7ReV+YuLv
 yY/3Trc4b32MKJLp+MdhTDbOQQbOIgPQjm9wtSi3gGZGF58BLWm5mcucMQ5fhV2jUZSL
 QydIRboCDOvb0tivwafEvCzu9whYRrhImpdg/L/vsf1Cyxv/hxQO412YWesCdMGVrt74
 c0f20W3jnhm+0/IKw/TQPz9UhjTz451Ne5MaqnfaJpaRs/F9GYjviO5/sNcf8u28FGpx
 dHwzIfeBgwBAilU8qGB8BqFGmOGonHXKjLOPe3dCtUUjwkgV1BkDVjWtsiRYCK1bkOMz
 u1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772042222; x=1772647022;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mvsIZr9qVQn4O36RmaOABy93+YNGrflCz5PAS8IaKgM=;
 b=Wp6pgWpU8VSck3frl0FjpoYpIMRe2PJpcvwCkLih/mAuE/sEvxQV+YVdNM+fVYMZld
 Qgk40ZA+dL9aNoGB7kpSF/LJ2uib940A+2t0C2Chv6pTBq4aLr69ov48xK6gvMTMhY2i
 SmfCI7OQ0dlwbFI3dSjp97i2Ojyve0A7vxYjt0+cqyadqOvWycyjOqG7LlFXNwjBBvvF
 3zBOLFOK8PVnQrzV7U7QaN3t8nY1VNmOJBWqSQhr+DLHHeXMp8rQNkt8/lXSxZr3KwAP
 IxEvuj4x2UuD6EElHcmL8GnKnSZo7KJ/BaU8k/5dB4Ugqf/rphHpmBePI/74aq3vBkdz
 54Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Xcmzf3ktHoPCaP/j5fVxuSGak0C0c+AMZZXARRzp8PLMp101v8Fhmms3VNm7PBgBkEBDdN1//ow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/mOVHgDobsaPJ9ylaxoOO+0X91lFdYUeZgKcsotHlQhJUkfKb
 JSzPw2cCLgxe6T1rWI2wVSw6uAVw6iTq4mN9U+4thQ01W86mnKPjhnX4AjVykTFChAU1AOR//fD
 i8c/lqKd5TGwl2dl3/WxZZlKo3TbO0LudzmPy8bEeVSF5UuwPtK1iBYM3LkxgTlkiZ5Ufq20=
X-Gm-Gg: ATEYQzxJtPSCw3pIzFBPidXhm+3GQLFg7FYcpTy3YpnyeKRuyKXJPGE/0fhnKQAlxIm
 XeUcM49WGl4dJ9l4pPNWK0RcQUGCE6QWUioPX1YYLhpW+9bcaqJrpvZa2eABJzzHSuXHi8d1qQf
 MQIWltJkCqG3CMzF8CyVXU1OY8XGRJqOvOkXZWBq4yjrsLQfFBrjayW0PxQr0qOyMRvU9rZWPEn
 j2sSAz6ytroU5Nm/+oyrjZlWqrG2hW7BOKcUt9TmZJ0gPT5u+/Vqil7ZibgcKLeIEWZv2FIMtz9
 gnrLPHJFOGP2UcxOqMsdXRsy7KAZMSjWncSHgZ+2JK7VTFz2B1uEzbzQlv0knv29cyurY/W3kcz
 w0VPSBaFOgUZC7GGOlkntW8lfVWLnEJz37nBqubIUGhlbldb8xCM=
X-Received: by 2002:a17:902:e80c:b0:2a1:388d:8ef3 with SMTP id
 d9443c01a7336-2ad7444e7fcmr172411675ad.18.1772042222022; 
 Wed, 25 Feb 2026 09:57:02 -0800 (PST)
X-Received: by 2002:a17:902:e80c:b0:2a1:388d:8ef3 with SMTP id
 d9443c01a7336-2ad7444e7fcmr172411335ad.18.1772042221493; 
 Wed, 25 Feb 2026 09:57:01 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74f5daf5sm135513705ad.24.2026.02.25.09.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 09:57:00 -0800 (PST)
Message-ID: <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 23:26:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
 <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _CxeFsJPx5K8rbMTHSGqFpdfUtKFGOWn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE3MiBTYWx0ZWRfX87y/lsQXsexW
 hcC3WnAmaqrclARTBR9b5FrFV418HOcusxG/8zkmmRIZQs2inwHWiguUu0V4Np1W0pt6J547UAD
 qlZ1+j1q+P4tQJukjbSocTQ1zF/2+cnDWF2cchDeIYNCfJtM0GwJXdDps73XhHORlEut2iHo4fh
 RkHj836q5asKt2uz6BHDfQvtfJ8KdCBNoewz/ny11MBGKH1lwFcl948dJiLmM5/CZLllgMeMAYW
 BEZHez7bG3cj6yrTVGja75afh0g3uJ3L7RAF12ZdTZvuYYpQtJkxnYUZ3cOr0rf8sr08kR/T+zI
 Wg9FOXB9bDJO2aE+F0KgDaZ07n2ojv/ZvE5hM8ea75A1Ckdpya2PYZg36lqZTeiZpd3F4+fITo+
 gyI/48BpQGPOBs1UQhD9VTRecth18z1HbNioQGNvl2ZVbAVteL2tUhH2PZB7+FPhpWO/ThmnA/G
 oJs5Z77Gg2IXyjJGVsQ==
X-Proofpoint-GUID: _CxeFsJPx5K8rbMTHSGqFpdfUtKFGOWn
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699f37ef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_kSkizocug0RL_Hz-QYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250172
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 83C5919BDA1
X-Rspamd-Action: no action



On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
>> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
>> DSP accelerator (QDA) driver to represent DSP CB devices that require
>> IOMMU configuration. This separates the CB bus from the QDA driver and
>> allows QDA to remain a loadable module while the bus is always built-in.
> Why? What is the actual problem that you are trying to solve?
Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.
>
>> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
> Don't describe the patch contents. Please.
Ack.
>
>> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
>> updated to descend into the QDA directory for both built-in and module
>> builds so that the CB bus is compiled into vmlinux while the driver
>> remains modular.
>>
>> The CB bus is registered at postcore_initcall() time and is exposed to
>> the IOMMU core through iommu_buses[] in the same way as the Tegra
>> host1x context-bus. This enables later patches to create CB devices on
>> this bus and obtain IOMMU domains for them.
> Note, there is nothing QDA-specific in this patch. Please explain, why
> the bus is QDA-specific? Can we generalize it?
I needed a custom bus here to use for the compute cb devices for iommu
configurations, I don't see any reason to keep it QDA-specific. The only requirement
is that this should be enabled built in whenever QDA is enabled.

But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?

>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/Makefile              |  1 +
>>  drivers/accel/qda/Kconfig           |  5 +++++
>>  drivers/accel/qda/Makefile          |  2 ++
>>  drivers/accel/qda/qda_compute_bus.c | 23 +++++++++++++++++++++++
>>  drivers/iommu/iommu.c               |  4 ++++
>>  include/linux/qda_compute_bus.h     | 22 ++++++++++++++++++++++
>>  6 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 58c08dd5f389..9ed843cd293f 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>>  obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
>> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
>>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
>> \ No newline at end of file
>> diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
>> index 484d21ff1b55..ef1fa384efbe 100644
>> --- a/drivers/accel/qda/Kconfig
>> +++ b/drivers/accel/qda/Kconfig
>> @@ -3,11 +3,16 @@
>>  # Qualcomm DSP accelerator driver
>>  #
>>  
>> +
>> +config DRM_ACCEL_QDA_COMPUTE_BUS
>> +	bool
>> +
>>  config DRM_ACCEL_QDA
>>  	tristate "Qualcomm DSP accelerator"
>>  	depends on DRM_ACCEL
>>  	depends on ARCH_QCOM || COMPILE_TEST
>>  	depends on RPMSG
>> +	select DRM_ACCEL_QDA_COMPUTE_BUS
>>  	help
>>  	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
>>  	  This driver provides a standardized interface for offloading computational
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index e7f23182589b..242684ef1af7 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  qda-y := \
>>  	qda_drv.o \
>>  	qda_rpmsg.o \
>> +
>> +obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
>> new file mode 100644
>> index 000000000000..1d9c39948fb5
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_compute_bus.c
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/device.h>
>> +#include <linux/init.h>
>> +
>> +struct bus_type qda_cb_bus_type = {
>> +	.name = "qda-compute-cb",
>> +};
>> +EXPORT_SYMBOL_GPL(qda_cb_bus_type);
>> +
>> +static int __init qda_cb_bus_init(void)
>> +{
>> +	int err;
>> +
>> +	err = bus_register(&qda_cb_bus_type);
>> +	if (err < 0) {
>> +		pr_err("qda-compute-cb bus registration failed: %d\n", err);
>> +		return err;
>> +	}
>> +	return 0;
>> +}
>> +
>> +postcore_initcall(qda_cb_bus_init);
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 4926a43118e6..5dee912686ee 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -33,6 +33,7 @@
>>  #include <trace/events/iommu.h>
>>  #include <linux/sched/mm.h>
>>  #include <linux/msi.h>
>> +#include <linux/qda_compute_bus.h>
>>  #include <uapi/linux/iommufd.h>
>>  
>>  #include "dma-iommu.h"
>> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
>>  #ifdef CONFIG_CDX_BUS
>>  	&cdx_bus_type,
>>  #endif
>> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
>> +	&qda_cb_bus_type,
>> +#endif
>>  };
>>  
>>  /*
>> diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
>> new file mode 100644
>> index 000000000000..807122d84e3f
>> --- /dev/null
>> +++ b/include/linux/qda_compute_bus.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_COMPUTE_BUS_H__
>> +#define __QDA_COMPUTE_BUS_H__
>> +
>> +#include <linux/device.h>
>> +
>> +/*
>> + * Custom bus type for QDA compute context bank (CB) devices
>> + *
>> + * This bus type is used for manually created CB devices that represent
>> + * IOMMU context banks. The custom bus allows proper IOMMU configuration
>> + * and device management for these virtual devices.
>> + */
>> +#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
>> +extern struct bus_type qda_cb_bus_type;
>> +#endif
>> +
>> +#endif /* __QDA_COMPUTE_BUS_H__ */
>>
>> -- 
>> 2.34.1
>>

