Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MElHJsV/rmlfFQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:07:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0382E2354C0
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 09:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD70C10E4A1;
	Mon,  9 Mar 2026 08:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuAMJwsD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSP2rGeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0F410E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 08:07:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6296Q5gh2245269
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Mar 2026 08:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +eohagC17wyTUw9Qrm49C+RUGjm3ynIkPUJ2iQskYLo=; b=cuAMJwsDq3of/1MR
 Xrhe2whXDqiq8iwzw5TYlQexS2I7eDEfJfkx3+XqQkiAkhyNEOhj2yEizDVG2Jpd
 Z/5/mYA2Lanw2Mur89hq055gW8i+dsi51l/rJ3fK9Jlt+EJ+jZA06L0b85VjRm9w
 lEi9TefGDQ1PxwpTLTa9wLYA+5ktH/xT29a2cgXVqnjCuobHhK5H8vwZ8IvW4tC5
 KafZKIjzRN5g7QNhRXGuKXkG1rrxv4/N/KJTkK8bfAW1UXxRiawFO4f79RKD4jA8
 lSvRMhYa8az1Gq4q6XQ04SbC/3F40G62j4Wbm6O4Y39fGyZHkcHpKTue9xTisPv3
 /AwN1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83cf78-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 08:07:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-358df8fbd1cso11115696a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773043648; x=1773648448;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+eohagC17wyTUw9Qrm49C+RUGjm3ynIkPUJ2iQskYLo=;
 b=aSP2rGeBsD6AcFdBeEc9DNmAGInGxYS0a8/da1fKXC0YUArOT9tBQiT28ejbxHx1TD
 FnYraxNcY0vZAe4cMRT7deXHrqrkLbxFa1Gu87GzT4H9dinAj74hlbl283AVvCSlIjj1
 3t3NZvXb+94ckPwln6jvRjytzd1T3OipL7Lwu5n2Nw/Xv3aZjrJ1kQeqZeDHgMvSWA21
 7PfhkRAQk15JUFBuqd09r7GA2GYXhJujrhitnmzDZZbtdcbhjy1SW+c8/VHzwXtCdCtC
 3dDlW06UAAujOBS9rkuj0ftuoYtlT1p5X/aPc9wobzMzmVFaKn+yxNQM+AyjgnBaw3Co
 87LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773043648; x=1773648448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+eohagC17wyTUw9Qrm49C+RUGjm3ynIkPUJ2iQskYLo=;
 b=OsE2D20Mifi/nXs+azZ87hX5ON4DBSX40bkzOvIsZ2+/yzDo7QRdt8SA46DY3ZJZvU
 zDnOL+dxN66UbUVSDzU6nkNaJ/Bo4sL7WAWHP5+Az/vnmKJLLulsFEkJH7qStwb2d/EM
 j52h4yC0meN0ovFrMzTCVgB88LtMMr9rzYl2VDNdXa6Q0INVN2PH1p+JalKubZIkx5qX
 +X7cPLzCbWO9hqh3tBG8FR/91Z3fkyK303cniOMhur2D+tFoQCrf87xZ6EVmP2Vbzl2p
 mrWI+ZOy18o9VXFMq/nDMnyNvsfNQJjTsd+TZhS8r8EEDSG/JHM5oWJGRADrmpqQ6ZoF
 CACA==
X-Gm-Message-State: AOJu0Yxov7tkNdXYx2DqY/XF5Jee/svKfWQMUxAn3jTSPmg/Rv7LwRAx
 Iaau8aiq3vedUCrNPgp8cqpW7oNkb4WIS9HrxRPBmAjd0WaDjs0ZlIEC7uIQBcl7fUKnUoIiJxM
 OX4eza6sv5JOfYuh3Aibe8labBq9QYaQYcFsa561JmPQSyJeikYYdqda2azh5Am9dk39YNw8=
X-Gm-Gg: ATEYQzzMKnJJTt+hjrbfbLxNvoMetdRK9uz6Vfq7DwVVWpumeyRrpmrevKJ3Cfu1MsR
 MtmTqPz+kLipH9feykXHxp2+30efKtve90L2UQ0o0+nzK2fm4LHEImoepNqG7Fvpfq/EOeqM0tB
 DplEMAC31vA8yfG8dJlGLPJrOzFt1lH0Eg3e81LSgms/YZT0IbjTls8RS64cw0b69WfCiu25t9/
 kVrzd38erM7VQs7P+llhlHYmn/HNsVs5ZLM/vIpnh34X1Px1MmVlFIcSBwBica7NJznplTEAzU1
 JuboZsua1KjVRe2kSxW4Ep7p2/AWcBhPgZz97oUYTW3/iCF7B51rGja+SS6dwGwNxfWPPkoNlo0
 xoB+0dCbyIDLgp8xLWCv1tQjWWBVnUKqD3IwagiuUG8XnTWk3Ow==
X-Received: by 2002:a17:90b:498b:b0:359:8dfd:64c8 with SMTP id
 98e67ed59e1d1-359be34f6a3mr9759157a91.24.1773043647516; 
 Mon, 09 Mar 2026 01:07:27 -0700 (PDT)
X-Received: by 2002:a17:90b:498b:b0:359:8dfd:64c8 with SMTP id
 98e67ed59e1d1-359be34f6a3mr9759131a91.24.1773043646911; 
 Mon, 09 Mar 2026 01:07:26 -0700 (PDT)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f74e4fsm108035235ad.58.2026.03.09.01.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 01:07:26 -0700 (PDT)
Message-ID: <f7b789c9-052f-4b5d-89e8-59dceda6b847@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:37:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ae7fc0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D19gQVrFAAAA:8
 a=9DV_eOp41SfxLb3a3r4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA3MyBTYWx0ZWRfX5cfD06qv3++L
 QDOBmGcPfwe7S6ILFBUwpPn3td8PIaB/9ntYXVOX1aU+dwG2WG1mTrHKaOugXaER84WMw3ucklx
 VdM67zCVDeDk5hVjqTetNyzMQG+apecnK+2BdF1z6hFv7zYLOe9nrImnYgpen5kB/gleDPxrZL4
 /oLsFde7hF1hRWG2Ri0AJo1HmRI7JwZx3wdAhxmMwKbDUpU+DTyYfka5OkQEwgX0f1hf3pbkfR2
 xoltS9DUx/jA6tb/gYJeDlRzUYAno5ioSBElkIVYnnnJMrUr6RNuroBU/pXuVgsvz/d9pMsGfSd
 Zte2Zmu4cmN/7lFPTD7YjgAr/JtheKJ0y6HSY0M4w/+aRawbsfb736uXtnLFdycPM9XbX41Aut9
 LbnvEUjlB5zuiJJ/kzr6+NNiEh8ZZQRD8Qa55zR24F+Px9mB5naQD1fcOXzaxX6uj0AAAeVNL7U
 7WEqjXAOGqRPniV9faw==
X-Proofpoint-ORIG-GUID: UrYBg0RALDhq1hJK9_IK4GLh1OkUef1B
X-Proofpoint-GUID: UrYBg0RALDhq1hJK9_IK4GLh1OkUef1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090073
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
X-Rspamd-Queue-Id: 0382E2354C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
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
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,lkml.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action



On 2/24/2026 12:38 AM, Ekansh Gupta wrote:
> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
> a modern DRM-based accelerator implementation for Qualcomm Hexagon DSPs.
> The driver provides a standardized interface for offloading computational
> tasks to DSPs found on Qualcomm SoCs, supporting all DSP domains (ADSP,
> CDSP, SDSP, GDSP).
>
> The QDA driver is designed as an alternative for the FastRPC driver
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
Hi all, I'm seeking guidance for this open item. I wanted some conclusion on this before
I send out the next version. This requirement is because any malicious application should
not attach to privileged DSP PDs and it's might impact the functionality of the PD by not
providing proper file-operation framework.
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

