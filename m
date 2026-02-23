Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNzaKOelnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6717C041
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E410E41E;
	Mon, 23 Feb 2026 19:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTjldB41";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMdn2ZBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFA110E41E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NITRTp561293
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=TvF6VK4oxjuFL6LNyQstH1
 ImQ9tkF3SQZlGOX1aTU3Q=; b=dTjldB41+wHzfWAlQA1sSmChKx7Z6JXOK9ClZr
 MrgQqIXj1j6lir0zy7lSoUkYUpJUMi9yjF+TJE/SLH6tIPYaQOpanPSgK6ZjCCgH
 a/YRhM5dD2P719nVmCoa8Pe6t+VS+HrG9cUXE7NT6aJ31nQU2XxcFKQ/knp27vp1
 zdOJpsZ9PkIC8ESBeChiu1WLUsmAjayIf1vX1xPYTQbt6jQ7U9nVBVe8IU88dZl8
 XrOl8LIHdMvk+WxwkSo5kXpgVyVLaOc4fZihBADw421K5XYTXQYb/lt39GPJYarS
 NmC1btIDV3tCFBfmj2Kc+cU1Fgggx/+Mn3qa+3X/P9fCl2rQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r9jv3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a9638b0422so25034785ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873762; x=1772478562;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TvF6VK4oxjuFL6LNyQstH1ImQ9tkF3SQZlGOX1aTU3Q=;
 b=DMdn2ZBm98Kts7bQ2pcIQDLBBrA7V4T8FzBpPDDHwjC71jFfTHlMaVr89Sg0VTl5rL
 ZqJhUWx3cUxaQHbg3UuT6LoSeHTSMFqyDm/WtQG9PL5YL2zbipWPokGvtegr40pNtWTo
 NO+JdoBUxwuQ609xWRlZq7PMLMDvuwct1rVacqU6JShBiGS1HXyMa1jIUK6QGpovGmXi
 kMXPYZrQvuTgEZicHL3htDVcWMuSm3KRZtE3ZFhN2vvkIV4OVM5dEHXYVZOnTg/CODcJ
 RoZ6vplyniK6ZtK/V26i3tUiw8cKvziCOBsA73skTRfSv3l54QiowIrs7jhCL0ZYMBaC
 e1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873762; x=1772478562;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvF6VK4oxjuFL6LNyQstH1ImQ9tkF3SQZlGOX1aTU3Q=;
 b=Yqu0XgCPlPK/hny2Ooa78rg5PR9tzbaYjKJIx0Ff/++JLPLQ6TJVFT6S+t3zd+uzYu
 TtFLo+hp4c/4E9r9wkP6WG1o+Uld8nyFeimiPNf5RgpDancAEFpUCl0tbpW782Gf2vTV
 RLRq28FcLDLUS/BBFsA51zgzamBGbgdpOjL/t0I0oKhk+jL7bpR3DCslpcDLuIFDywd2
 ERKXJfY8OCpSRpIihcwiu85wVkKUtfJKeJ8UtUGGw1eC7LrnSd9vcC5Qeb3uBApy2+6E
 eElPbcYQGPhptX1gWjJ4ymLzpQLRics54Ln8PwwdbtZmS3OXMbdI22pKF7XUaF1StMz5
 slVA==
X-Gm-Message-State: AOJu0YwWiOdz3d1PkFg+9yALsBfbO3QM984CRNIEr4MVpWlN4FCAPBGF
 aVmWEWhRL1dpePHc7Y38NUtuHeVMobk1UuTJWwSKC8LNBui396ChjOTZ6ozOqB8HTuUcducDjZL
 EoCSQkyY+lB27gUqdb1Wxj/IGKYS+qpqM2KcEYEefgSAnKWFnkw9B+FfnkdAmzRVkam1oj1o=
X-Gm-Gg: ATEYQzyCsZctjVBgzLSp9iWi4b3mjjIvou5iNejzKoSMUbuvRqh5e+tcgsES1mnAPCi
 IgY5bhQU7gIi+asQgCMS87ZqgPLbpGbNUYxjZhZ+6vPailqYXdvcnvSci2gUmbLu13GrC0BZ+JM
 hJlbt1IJ5DlpI+6loHJBPGGzr1GchC1E2x38kmw7nYUASE0+7sPwTSDc3lwTS+bdqdFgQ2x15Dm
 UGsFLmM5JK67AY/KZ+iLrOAAolh9TzMwm/VvUufIhn/W2CsKzR1EHqTuZWskqBwL2h2tTtz8mbd
 UhJILEeRxPY1E/bxEBphNPN3U+n9bFltqxY/fZmmWO2xZ6LTyQtdoBJbTyzFgiN/N9dqCwKoXKt
 IhKvTIBhZ2MsCOhlyqzIQkn1AC9YF3jOpHlhf9hRbxOoQypYGP5LYxg==
X-Received: by 2002:a17:903:2bcb:b0:2a9:5e25:46f6 with SMTP id
 d9443c01a7336-2ad7449f6bbmr87069895ad.17.1771873761666; 
 Mon, 23 Feb 2026 11:09:21 -0800 (PST)
X-Received: by 2002:a17:903:2bcb:b0:2a9:5e25:46f6 with SMTP id
 d9443c01a7336-2ad7449f6bbmr87069625ad.17.1771873761120; 
 Mon, 23 Feb 2026 11:09:21 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:09:20 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator driver
Date: Tue, 24 Feb 2026 00:38:54 +0530
Message-Id: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMalnGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3cKURN20zKLikoL84hJdk8QkA1MjE8tUo+RkJaCegqLUtMwKsHn
 RSkFuzkqxtbUAHlWAZWQAAAA=
X-Change-ID: 20260223-qda-firstpost-4ab05249e2cc
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=11158;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=D//kaqpwCmT40rsG5cKJ+7z0DZfDBbgSAfyZIlvB0A8=;
 b=lK/DmO5cl5PDlIdldx+QTx4Kw45T1SHEvRcIXseha9NM9kCesb2auejxvWSkASz7wrYw4z7T9
 NQyYDgWSO04Cp1D+dZISVB/jL7DdT+TnyQwVOWw5tRXVYJKW8G/UIIg
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: OivzhbATluDEKDncENu8fQglqiOqqyvX
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699ca5e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D19gQVrFAAAA:8
 a=B-WXDzf3NZ75i5Zg2PoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX6gFhT9p8WxnN
 7RVYKYT2qAW402q2cHn1QJ9OQFapU5jHncoQoPQLQlsza15XoKndUQX0HropQkpx3QP/B0C9pTk
 uuO2Yv08W0Nu7gLxpXR3FDt0I+j9kWAKevMKbZE24h6AGYohhgSXXoUAv11ngZZgZYT7v4DxidM
 3YWGfbQlZZA8sFaae47u1CRElqHy65f+GrzZieN0HyOT7YYLfCauGaL0rfRnaV0YMc4tWY101x7
 WK7qkE9d2W37IC3l76ivO3nrQW7oyGIOS2azcNnv+hDHGRKGGeaRBDIMfbmlQWRU8kAD3csFhQO
 o+NWujBtoyxbXjtQukWia+j19SRw4KsM/Kj7bEUHXDDVbcq2FLm4rS0nJyCFmuPwAyTqxEznJ62
 qrQJeBiL1XmzCZL0PRvombiFw/uFCpLsJVU2p8NVt30zywDFNd9mCMSAV3rn70prYTH/2OwdvYp
 Xj+qS6eMO9h0FiEVX5w==
X-Proofpoint-GUID: OivzhbATluDEKDncENu8fQglqiOqqyvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
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
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,lkml.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: F2D6717C041
X-Rspamd-Action: no action

This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
a modern DRM-based accelerator implementation for Qualcomm Hexagon DSPs.
The driver provides a standardized interface for offloading computational
tasks to DSPs found on Qualcomm SoCs, supporting all DSP domains (ADSP,
CDSP, SDSP, GDSP).

The QDA driver is designed as an alternative for the FastRPC driver
in drivers/misc/, offering improved resource management, better integration
with standard kernel subsystems, and alignment with the Linux kernel's
Compute Accelerators framework.

User-space staging branch
============
https://github.com/qualcomm/fastrpc/tree/accel/staging

Key Features
============

* Standard DRM accelerator interface via /dev/accel/accelN
* GEM-based buffer management with DMA-BUF import/export support
* IOMMU-based memory isolation using per-process context banks
* FastRPC protocol implementation for DSP communication
* RPMsg transport layer for reliable message passing
* Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
* Comprehensive IOCTL interface for DSP operations

High-Level Architecture Differences with Existing FastRPC Driver
=================================================================

The QDA driver represents a significant architectural departure from the
existing FastRPC driver (drivers/misc/fastrpc.c), addressing several key
limitations while maintaining protocol compatibility:

1. DRM Accelerator Framework Integration
  - FastRPC: Custom character device (/dev/fastrpc-*)
  - QDA: Standard DRM accel device (/dev/accel/accelN)
  - Benefit: Leverages established DRM infrastructure for device
    management.

2. Memory Management
  - FastRPC: Custom memory allocator with ION/DMA-BUF integration
  - QDA: Native GEM objects with full PRIME support
  - Benefit: Seamless buffer sharing using standard DRM mechanisms

3. IOMMU Context Bank Management
  - FastRPC: Direct IOMMU domain manipulation, limited isolation
  - QDA: Custom compute bus (qda_cb_bus_type) with proper device model
  - Benefit: Each CB device is a proper struct device with IOMMU group
    support, enabling better isolation and resource tracking.
  - https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/

4. Memory Manager Architecture
  - FastRPC: Monolithic allocator
  - QDA: Pluggable memory manager with backend abstraction
  - Benefit: Currently uses DMA-coherent backend, easily extensible for
    future memory types (e.g., carveout, CMA)

5. Transport Layer
  - FastRPC: Direct RPMsg integration in core driver
  - QDA: Abstracted transport layer (qda_rpmsg.c)
  - Benefit: Clean separation of concerns, easier to add alternative
    transports if needed

8. Code Organization
  - FastRPC: ~3000 lines in single file
  - QDA: Modular design across multiple files (~4600 lines total)
    * qda_drv.c: Core driver and DRM integration
    * qda_gem.c: GEM object management
    * qda_memory_manager.c: Memory and IOMMU management
    * qda_fastrpc.c: FastRPC protocol implementation
    * qda_rpmsg.c: Transport layer
    * qda_cb.c: Context bank device management
  - Benefit: Better maintainability, clearer separation of concerns

9. UAPI Design
  - FastRPC: Custom IOCTL interface
  - QDA: DRM-style IOCTLs with proper versioning support
  - Benefit: Follows DRM conventions, easier userspace integration

10. Documentation
  - FastRPC: Minimal in-tree documentation
  - QDA: Comprehensive documentation in Documentation/accel/qda/
  - Benefit: Better developer experience, clearer API contracts

11. Buffer Reference Mechanism
  - FastRPC: Uses buffer file descriptors (FDs) for all book-keeping
    in both kernel and DSP
  - QDA: Uses GEM handles for kernel-side management, providing better
    integration with DRM subsystem
  - Benefit: Leverages DRM GEM infrastructure for reference counting,
    lifetime management, and integration with other DRM components

Key Technical Improvements
===========================

* Proper device model: CB devices are real struct device instances on a
  custom bus, enabling proper IOMMU group management and power management
  integration

* Reference-counted IOMMU devices: Multiple file descriptors from the same
  process share a single IOMMU device, reducing overhead

* GEM-based buffer lifecycle: Automatic cleanup via DRM GEM reference
  counting, eliminating many resource leak scenarios

* Modular memory backends: The memory manager supports pluggable backends,
  currently implementing DMA-coherent allocations with SID-prefixed
  addresses for DSP firmware

* Context-based invocation tracking: XArray-based context management with
  proper synchronization and cleanup

Patch Series Organization
==========================

Patches 1-2:   Driver skeleton and documentation
Patches 3-6:   RPMsg transport and IOMMU/CB infrastructure
Patches 7-9:   DRM device registration and basic IOCTL
Patches 10-12: GEM buffer management and PRIME support
Patches 13-17: FastRPC protocol implementation (attach, invoke, create,
               map/unmap)
Patch 18:      MAINTAINERS entry

Open Items
===========

The following items are identified as open items:

1. Privilege Level Management
  - Currently, daemon processes and user processes have the same access
    level as both use the same accel device node. This needs to be
    addressed as daemons attach to privileged DSP PDs and require
    higher privilege levels for system-level operations
  - Seeking guidance on the best approach: separate device nodes,
    capability-based checks, or DRM master/authentication mechanisms

2. UAPI Compatibility Layer
  - Add UAPI compat layer to facilitate migration of client applications
    from existing FastRPC UAPI to the new QDA accel driver UAPI,
    ensuring smooth transition for existing userspace code
  - Seeking guidance on implementation approach: in-kernel translation
    layer, userspace wrapper library, or hybrid solution

3. Documentation Improvements
  - Add detailed IOCTL usage examples
  - Document DSP firmware interface requirements
  - Create migration guide from existing FastRPC

4. Per-Domain Memory Allocation
  - Develop new userspace API to support memory allocation on a per
    domain basis, enabling domain-specific memory management and
    optimization

5. Audio and Sensors PD Support
  - The current patch series does not handle Audio PD and Sensors PD
    functionalities. These specialized protection domains require
    additional support for real-time constraints and power management

Interface Compatibility
========================

The QDA driver maintains compatibility with existing FastRPC infrastructure:

* Device Tree Bindings: The driver uses the same device tree bindings as
  the existing FastRPC driver, ensuring no changes are required to device
  tree sources. The "qcom,fastrpc" compatible string and child node
  structure remain unchanged.

* Userspace Interface: While the driver provides a new DRM-based UAPI,
  the underlying FastRPC protocol and DSP firmware interface remain
  compatible. This ensures that DSP firmware and libraries continue to
  work without modification.

* Migration Path: The modular design allows for gradual migration, where
  both drivers can coexist during the transition period. Applications can
  be migrated incrementally to the new UAPI with the help of the planned
  compatibility layer.

References
==========

Previous discussions on this migration:
- https://lkml.org/lkml/2024/6/24/479
- https://lkml.org/lkml/2024/6/21/1252

Testing
=======

The driver has been tested on Qualcomm platforms with:
- Basic FastRPC attach/release operations
- DSP process creation and initialization
- Memory mapping/unmapping operations
- Dynamic invocation with various buffer types
- GEM buffer allocation and mmap
- PRIME buffer import from other subsystems

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Ekansh Gupta (18):
      accel/qda: Add Qualcomm QDA DSP accelerator driver docs
      accel/qda: Add Qualcomm DSP accelerator driver skeleton
      accel/qda: Add RPMsg transport for Qualcomm DSP accelerator
      accel/qda: Add built-in compute CB bus for QDA and integrate with IOMMU
      accel/qda: Create compute CB devices on QDA compute bus
      accel/qda: Add memory manager for CB devices
      accel/qda: Add DRM accel device registration for QDA driver
      accel/qda: Add per-file DRM context and open/close handling
      accel/qda: Add QUERY IOCTL and basic QDA UAPI header
      accel/qda: Add DMA-backed GEM objects and memory manager integration
      accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET IOCTLs
      accel/qda: Add PRIME dma-buf import support
      accel/qda: Add initial FastRPC attach and release support
      accel/qda: Add FastRPC dynamic invocation support
      accel/qda: Add FastRPC DSP process creation support
      accel/qda: Add FastRPC-based DSP memory mapping support
      accel/qda: Add FastRPC-based DSP memory unmapping support
      MAINTAINERS: Add MAINTAINERS entry for QDA driver

 Documentation/accel/index.rst          |    1 +
 Documentation/accel/qda/index.rst      |   14 +
 Documentation/accel/qda/qda.rst        |  129 ++++
 MAINTAINERS                            |    9 +
 arch/arm64/configs/defconfig           |    2 +
 drivers/accel/Kconfig                  |    1 +
 drivers/accel/Makefile                 |    2 +
 drivers/accel/qda/Kconfig              |   35 ++
 drivers/accel/qda/Makefile             |   19 +
 drivers/accel/qda/qda_cb.c             |  182 ++++++
 drivers/accel/qda/qda_cb.h             |   26 +
 drivers/accel/qda/qda_compute_bus.c    |   23 +
 drivers/accel/qda/qda_drv.c            |  375 ++++++++++++
 drivers/accel/qda/qda_drv.h            |  171 ++++++
 drivers/accel/qda/qda_fastrpc.c        | 1002 ++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h        |  433 ++++++++++++++
 drivers/accel/qda/qda_gem.c            |  211 +++++++
 drivers/accel/qda/qda_gem.h            |  103 ++++
 drivers/accel/qda/qda_ioctl.c          |  271 +++++++++
 drivers/accel/qda/qda_ioctl.h          |  118 ++++
 drivers/accel/qda/qda_memory_dma.c     |   91 +++
 drivers/accel/qda/qda_memory_dma.h     |   46 ++
 drivers/accel/qda/qda_memory_manager.c |  382 ++++++++++++
 drivers/accel/qda/qda_memory_manager.h |  148 +++++
 drivers/accel/qda/qda_prime.c          |  194 +++++++
 drivers/accel/qda/qda_prime.h          |   43 ++
 drivers/accel/qda/qda_rpmsg.c          |  327 +++++++++++
 drivers/accel/qda/qda_rpmsg.h          |   57 ++
 drivers/iommu/iommu.c                  |    4 +
 include/linux/qda_compute_bus.h        |   22 +
 include/uapi/drm/qda_accel.h           |  224 +++++++
 31 files changed, 4665 insertions(+)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-qda-firstpost-4ab05249e2cc

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

