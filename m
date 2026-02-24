Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCUpOuccnWmuMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:37:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8661816BB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B803110E0B1;
	Tue, 24 Feb 2026 03:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkItp+hZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iK0sC5uS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFACF10E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:37:05 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3VHuU1144006
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e2l9aRmZj0T3UtEEuTkL5ERwtdDS5Px9+WLhMqRSs00=; b=GkItp+hZuCm7WH05
 9p964bScqVkdP7mpzqpRQLQpf6CKx9M6RASUUONCZqsfXbXjSLY/wugfcwq25HhN
 GJr8i5wbmron6tpNfiCF1I5DahUpqDmzP2dmecvuqESQXN11VWXOiwmE7k5swyQ5
 bL3ZGB02wgHrrW9vjmixmHXiiHZUHNX8TINyPjDBmQl9KJX2BDnO/zk1sH0OCYLC
 EU4qe5eOClK3cB/QgD7xTsQ3Wjr8tGHNNLCtBpPYqr8+WgmVgQiO3GujLr71Wxol
 H5QcqwC/FGetiJ5KEdKbJC4Tx5aS4glANr33tMSKfhOe0Yxg9ZlShES6wyYEnKb7
 0bSg8Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch45680f6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:37:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-124a95b6f61so1154278c88.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771904224; x=1772509024;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2l9aRmZj0T3UtEEuTkL5ERwtdDS5Px9+WLhMqRSs00=;
 b=iK0sC5uSUpVHudW5rbGfCdtOSM97e03QcwWuLsnmaUguf3t8i2L+cxvMuAtjXjl/qy
 eYX1g/Z+rs4OiEaSpFdSKVsx+gHAm+Ix01ZioN7lKlWrFA4wW0NCMuckt1sWfFMdqvve
 SUy6Pbo8jUsPsAnqxK7VIscnpK2V0rra8LdEP7FVPtbQ5JRL3N39fF3gsjJE02fL1Sep
 WJTFAZs0B9SeGfT+AKjHner+fXr4aydyJhEH91/7sgZhkQn0b+8n8QfJFwCoNgjD7yBq
 J+fjASFgsjdAEgeYzqhyJETW9ZQK7sDsGBvgGv8KmGB80IMRmNc1hc5o3TvJM7Le1URp
 SEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771904224; x=1772509024;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e2l9aRmZj0T3UtEEuTkL5ERwtdDS5Px9+WLhMqRSs00=;
 b=A1Wj9ZvDdcnUrEZkvjfOLqlE3ry1K5T15G6/4o3D3+LbIxrK5BkeeU6LRARh0lppLA
 rQeEa2t6B3ebfGVhVAFO3feEkR+csGYhcMoclhEuXK76XRPv4x6TSXrBbKNrDQdtfFVC
 EZjL0/PmMB6j9FRwmYIlPexP7kyg6NiezBAYKSuS/I7xRxhGxo8y+vADJS1415yod1wg
 KnFH16ZlLb95wJJMnJm2ciZUiMb3QERSjOA05c/IUGC2Dt2d0emOJB5Xwfhz1JeS9ICy
 Z3HF8noyabzcWJS0JGcOKL+Wom/4ctSFKkCXfocdxlhiPmsZDSgfrouk3vSJiHrOp5VI
 vxGw==
X-Gm-Message-State: AOJu0YxGWQ4/TJK8l4W7kTMbmlNdE6tl1Y5sZvc0QUe+SX5K/CwhGANN
 2yLKx4mCkUWCT+DnqFMZfZ83+p9TNq9tdB/Og7HQ1TDmop90rD+P5eR2z7A2lVDcUZ1EU6+GZMj
 GqW18GXNeQUJpxETZlPgOeeUd9KZlHRsD57LMSFMfmVdzzVV8PpsIib2WqUjthL2LhGdYLFA=
X-Gm-Gg: AZuq6aLvYq2QIUa6I1pp8XVlFgWsZsELhCTj74jim7hvQGVreg3+jVD+JZmb5inPlNx
 mA7wCk2b6542Mmv7TZRNPdIssSuUIXUxohgtxhqfcBDkpgKeUcQWZp8AIl4YP1MrAd9LZ2hj88e
 wkhrXgGSx4OsBcijRt97bAte+UaAEbzQCvCsK4Mzj+ZnbCbgN1wuz+PSsIbe3tZh3APKOQzrurD
 FrShdm+fdG6hzwcAKb/AM2viTvDfc7GaMJHHLVSQzb73G1igLkhImKaUJzyvzLJVJ0rTPaIm7gn
 z0tqo538fVGx3j+QiG+TDJ469WY+QN/+i7FRmNfYOBCc+VRikA4vTSt1ZwvLXstC8hnYYgAyuhu
 i2rkl2Ls85Hw+VhdiWRLMcPU9U6ewKh9GEbzUtxquAgcbv/SCZy472rE=
X-Received: by 2002:a05:7022:50b:b0:123:3461:99be with SMTP id
 a92af1059eb24-1276ad1a7e6mr5039308c88.21.1771904223571; 
 Mon, 23 Feb 2026 19:37:03 -0800 (PST)
X-Received: by 2002:a05:7022:50b:b0:123:3461:99be with SMTP id
 a92af1059eb24-1276ad1a7e6mr5039276c88.21.1771904222879; 
 Mon, 23 Feb 2026 19:37:02 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1276af2edd7sm10169712c88.8.2026.02.23.19.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 19:37:02 -0800 (PST)
Message-ID: <333632f8-7cb5-419c-ba46-4dbe4d21ea60@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:37:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FqbiyaRENqMTcea969ajqeZ2c9w4DbUE
X-Proofpoint-ORIG-GUID: FqbiyaRENqMTcea969ajqeZ2c9w4DbUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOCBTYWx0ZWRfX3WhDR5Yr+V5o
 J8CdyTGV3I+bG8GlV0iAc4w1TmvZYMDiOHSYLjPA1c10GeMiDV6MfsA+lwjdfSnWiaMLbm/dLtk
 eBledBJbBx4IK5YsiaLiz7vXhNduhfVgSn10zw6EAbaxk2h3vzdMhTRQy+VYvatACFYc3waK3M1
 RSKc/SKIiZxL7cN2hIdxkEkEkjg73NIO4IYl+0gkMP7edALiJYZ477gMlD3Ay6wki6LiBTORtMD
 M11tEcbzUDytNbGXAkaWgMHPjh1h5i4XvD+oGfaZohLyH3I+Dkoo5NQBELpn2T+FOWVJPaMl1qM
 wdhfLXjWYgwyVmpYpZa5APG9L64L9IDIH5sBSdlR6Ga0i9eXdkWCVc7GGUyKQLB3obAlwFIGS2i
 Ej4tjs7qNXU+aFGAHUTI6pt36DaCs95VBD2WnwL6YF0Huq9+uBoeTpcj6hloOUwHc7snWLFEcLO
 QCOEzhxMoaW7YGSmx9g==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d1ce0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D19gQVrFAAAA:8
 a=hgqkG84HdUBTOHwo2Y0A:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240028
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[trilokkumar.soni@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3C8661816BB
X-Rspamd-Action: no action

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
> a modern DRM-based accelerator implementation for Qualcomm Hexagon DSPs.
> The driver provides a standardized interface for offloading computational
> tasks to DSPs found on Qualcomm SoCs, supporting all DSP domains (ADSP,
> CDSP, SDSP, GDSP).
> 
> The QDA driver is designed as an alternative for the FastRPC driver

alternative or replacement? are you going to keep both drivers? 

> in drivers/misc/, offering improved resource management, better integration
> with standard kernel subsystems, and alignment with the Linux kernel's
> Compute Accelerators framework.
> 
> User-space staging branch
> ============
> https://github.com/qualcomm/fastrpc/tree/accel/staging
> 
> Key Features
> ============
> 
> * Standard DRM accelerator interface via /dev/accel/accelN
> * GEM-based buffer management with DMA-BUF import/export support
> * IOMMU-based memory isolation using per-process context banks
> * FastRPC protocol implementation for DSP communication
> * RPMsg transport layer for reliable message passing
> * Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
> * Comprehensive IOCTL interface for DSP operations
> 
> High-Level Architecture Differences with Existing FastRPC Driver
> =================================================================
> 
> The QDA driver represents a significant architectural departure from the
> existing FastRPC driver (drivers/misc/fastrpc.c), addressing several key
> limitations while maintaining protocol compatibility:
> 
> 1. DRM Accelerator Framework Integration
>   - FastRPC: Custom character device (/dev/fastrpc-*)
>   - QDA: Standard DRM accel device (/dev/accel/accelN)
>   - Benefit: Leverages established DRM infrastructure for device
>     management.
> 
> 2. Memory Management
>   - FastRPC: Custom memory allocator with ION/DMA-BUF integration
>   - QDA: Native GEM objects with full PRIME support
>   - Benefit: Seamless buffer sharing using standard DRM mechanisms
> 
> 3. IOMMU Context Bank Management
>   - FastRPC: Direct IOMMU domain manipulation, limited isolation
>   - QDA: Custom compute bus (qda_cb_bus_type) with proper device model
>   - Benefit: Each CB device is a proper struct device with IOMMU group
>     support, enabling better isolation and resource tracking.
>   - https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
> 
> 4. Memory Manager Architecture
>   - FastRPC: Monolithic allocator
>   - QDA: Pluggable memory manager with backend abstraction
>   - Benefit: Currently uses DMA-coherent backend, easily extensible for
>     future memory types (e.g., carveout, CMA)
> 
> 5. Transport Layer
>   - FastRPC: Direct RPMsg integration in core driver
>   - QDA: Abstracted transport layer (qda_rpmsg.c)
>   - Benefit: Clean separation of concerns, easier to add alternative
>     transports if needed
> 
> 8. Code Organization
>   - FastRPC: ~3000 lines in single file
>   - QDA: Modular design across multiple files (~4600 lines total)
>     * qda_drv.c: Core driver and DRM integration
>     * qda_gem.c: GEM object management
>     * qda_memory_manager.c: Memory and IOMMU management
>     * qda_fastrpc.c: FastRPC protocol implementation
>     * qda_rpmsg.c: Transport layer
>     * qda_cb.c: Context bank device management
>   - Benefit: Better maintainability, clearer separation of concerns
> 
> 9. UAPI Design
>   - FastRPC: Custom IOCTL interface
>   - QDA: DRM-style IOCTLs with proper versioning support
>   - Benefit: Follows DRM conventions, easier userspace integration
> 
> 10. Documentation
>   - FastRPC: Minimal in-tree documentation
>   - QDA: Comprehensive documentation in Documentation/accel/qda/
>   - Benefit: Better developer experience, clearer API contracts
> 
> 11. Buffer Reference Mechanism
>   - FastRPC: Uses buffer file descriptors (FDs) for all book-keeping
>     in both kernel and DSP
>   - QDA: Uses GEM handles for kernel-side management, providing better
>     integration with DRM subsystem
>   - Benefit: Leverages DRM GEM infrastructure for reference counting,
>     lifetime management, and integration with other DRM components
> 
> Key Technical Improvements
> ===========================
> 
> * Proper device model: CB devices are real struct device instances on a
>   custom bus, enabling proper IOMMU group management and power management
>   integration
> 
> * Reference-counted IOMMU devices: Multiple file descriptors from the same
>   process share a single IOMMU device, reducing overhead
> 
> * GEM-based buffer lifecycle: Automatic cleanup via DRM GEM reference
>   counting, eliminating many resource leak scenarios
> 
> * Modular memory backends: The memory manager supports pluggable backends,
>   currently implementing DMA-coherent allocations with SID-prefixed
>   addresses for DSP firmware
> 
> * Context-based invocation tracking: XArray-based context management with
>   proper synchronization and cleanup
> 
> Patch Series Organization
> ==========================
> 
> Patches 1-2:   Driver skeleton and documentation
> Patches 3-6:   RPMsg transport and IOMMU/CB infrastructure
> Patches 7-9:   DRM device registration and basic IOCTL
> Patches 10-12: GEM buffer management and PRIME support
> Patches 13-17: FastRPC protocol implementation (attach, invoke, create,
>                map/unmap)
> Patch 18:      MAINTAINERS entry
> 
> Open Items
> ===========
> 
> The following items are identified as open items:
> 
> 1. Privilege Level Management
>   - Currently, daemon processes and user processes have the same access
>     level as both use the same accel device node. This needs to be
>     addressed as daemons attach to privileged DSP PDs and require
>     higher privilege levels for system-level operations
>   - Seeking guidance on the best approach: separate device nodes,
>     capability-based checks, or DRM master/authentication mechanisms
> 
> 2. UAPI Compatibility Layer
>   - Add UAPI compat layer to facilitate migration of client applications
>     from existing FastRPC UAPI to the new QDA accel driver UAPI,
>     ensuring smooth transition for existing userspace code
>   - Seeking guidance on implementation approach: in-kernel translation
>     layer, userspace wrapper library, or hybrid solution
> 
> 3. Documentation Improvements
>   - Add detailed IOCTL usage examples
>   - Document DSP firmware interface requirements
>   - Create migration guide from existing FastRPC
> 
> 4. Per-Domain Memory Allocation
>   - Develop new userspace API to support memory allocation on a per
>     domain basis, enabling domain-specific memory management and
>     optimization
> 
> 5. Audio and Sensors PD Support
>   - The current patch series does not handle Audio PD and Sensors PD
>     functionalities. These specialized protection domains require
>     additional support for real-time constraints and power management
> 
> Interface Compatibility
> ========================
> 
> The QDA driver maintains compatibility with existing FastRPC infrastructure:
> 
> * Device Tree Bindings: The driver uses the same device tree bindings as
>   the existing FastRPC driver, ensuring no changes are required to device
>   tree sources. The "qcom,fastrpc" compatible string and child node
>   structure remain unchanged.
> 
> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>   the underlying FastRPC protocol and DSP firmware interface remain
>   compatible. This ensures that DSP firmware and libraries continue to
>   work without modification.
> 
> * Migration Path: The modular design allows for gradual migration, where
>   both drivers can coexist during the transition period. Applications can
>   be migrated incrementally to the new UAPI with the help of the planned
>   compatibility layer.
> 
> References
> ==========
> 
> Previous discussions on this migration:
> - https://lkml.org/lkml/2024/6/24/479
> - https://lkml.org/lkml/2024/6/21/1252
> 
> Testing
> =======
> 
> The driver has been tested on Qualcomm platforms with:
> - Basic FastRPC attach/release operations
> - DSP process creation and initialization
> - Memory mapping/unmapping operations
> - Dynamic invocation with various buffer types
> - GEM buffer allocation and mmap
> - PRIME buffer import from other subsystems
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Ekansh Gupta (18):
>       accel/qda: Add Qualcomm QDA DSP accelerator driver docs
>       accel/qda: Add Qualcomm DSP accelerator driver skeleton
>       accel/qda: Add RPMsg transport for Qualcomm DSP accelerator
>       accel/qda: Add built-in compute CB bus for QDA and integrate with IOMMU
>       accel/qda: Create compute CB devices on QDA compute bus
>       accel/qda: Add memory manager for CB devices
>       accel/qda: Add DRM accel device registration for QDA driver
>       accel/qda: Add per-file DRM context and open/close handling
>       accel/qda: Add QUERY IOCTL and basic QDA UAPI header
>       accel/qda: Add DMA-backed GEM objects and memory manager integration
>       accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET IOCTLs
>       accel/qda: Add PRIME dma-buf import support
>       accel/qda: Add initial FastRPC attach and release support
>       accel/qda: Add FastRPC dynamic invocation support
>       accel/qda: Add FastRPC DSP process creation support
>       accel/qda: Add FastRPC-based DSP memory mapping support
>       accel/qda: Add FastRPC-based DSP memory unmapping support
>       MAINTAINERS: Add MAINTAINERS entry for QDA driver
> 
>  Documentation/accel/index.rst          |    1 +
>  Documentation/accel/qda/index.rst      |   14 +
>  Documentation/accel/qda/qda.rst        |  129 ++++
>  MAINTAINERS                            |    9 +
>  arch/arm64/configs/defconfig           |    2 +
>  drivers/accel/Kconfig                  |    1 +
>  drivers/accel/Makefile                 |    2 +
>  drivers/accel/qda/Kconfig              |   35 ++
>  drivers/accel/qda/Makefile             |   19 +
>  drivers/accel/qda/qda_cb.c             |  182 ++++++
>  drivers/accel/qda/qda_cb.h             |   26 +
>  drivers/accel/qda/qda_compute_bus.c    |   23 +
>  drivers/accel/qda/qda_drv.c            |  375 ++++++++++++
>  drivers/accel/qda/qda_drv.h            |  171 ++++++
>  drivers/accel/qda/qda_fastrpc.c        | 1002 ++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_fastrpc.h        |  433 ++++++++++++++
>  drivers/accel/qda/qda_gem.c            |  211 +++++++
>  drivers/accel/qda/qda_gem.h            |  103 ++++
>  drivers/accel/qda/qda_ioctl.c          |  271 +++++++++
>  drivers/accel/qda/qda_ioctl.h          |  118 ++++
>  drivers/accel/qda/qda_memory_dma.c     |   91 +++
>  drivers/accel/qda/qda_memory_dma.h     |   46 ++
>  drivers/accel/qda/qda_memory_manager.c |  382 ++++++++++++
>  drivers/accel/qda/qda_memory_manager.h |  148 +++++
>  drivers/accel/qda/qda_prime.c          |  194 +++++++
>  drivers/accel/qda/qda_prime.h          |   43 ++
>  drivers/accel/qda/qda_rpmsg.c          |  327 +++++++++++
>  drivers/accel/qda/qda_rpmsg.h          |   57 ++
>  drivers/iommu/iommu.c                  |    4 +
>  include/linux/qda_compute_bus.h        |   22 +
>  include/uapi/drm/qda_accel.h           |  224 +++++++
>  31 files changed, 4665 insertions(+)
> ---
> base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
> change-id: 20260223-qda-firstpost-4ab05249e2cc
> 
> Best regards,

