Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06665973466
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A363610E742;
	Tue, 10 Sep 2024 10:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="uOp0QWS1";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="OSq8RLgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740FC10E742
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 10:40:22 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A7SvwI005848;
 Tue, 10 Sep 2024 11:40:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=B9GdAE9yQNqBqeXGLekVY/V4B
 7jfEjXvj/cannr30k0=; b=uOp0QWS1NAfDcZYBh89ZxOhySePMX+irrteZh+veR
 LE4wIZp1YBVc1KwAbt+DUbtBYMI2MhsbwUbsk6OXT3hdhNNxxTNlvansNKcpfYJk
 H9enS4Jwzzqo1hdc6PXg6DZqSNY+EzkbLmiMmMWDe/cxQoJrexbe/zyAOZNj9LnC
 haHC4Pz/ekORt1oI6R7VJicoSFIRixZqTSels3fHDx2yC3/xaMf/Joea0MNiMqcI
 LAcPiJ50eL2MohTJNB2luR74rgu6P/iMFJZpWNTu4WZFbfHb0v59L3mScmuhrNsw
 xGdnxdqU8RWMWldejPK0ErlJtjswM08b4Qo6wIh1CKWYQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 41gewwabgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Sep 2024 11:40:05 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 10 Sep 2024 11:40:04 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.107)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Tue, 10 Sep 2024 11:40:04 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF9FmxXCNFbEVioaDmKyjoyeKJHtxrKDfguUyJE2Vbg3mNdUNWZ8ehNyWaEOP2Cg2VGT1+Wxva+al9pAd+7wfOPD98tlUvO+mJ+Z2MZ0s9/qdeAh5d48Y92dLEsirmMm3QIN7+8/cyluVK0nPYxw8UfG7NHldn/WNYfAAMM4XmFNHr0BgrBPru2kOYxKfyqtvjOUVDR2Y+Hx257PDTPYTHVSFVBXYcfcCs0Y8Sk0KglM1n3XQ2T4obSRTuJarYXnXC0kfrT65eNQCK0azz1vGnGWRpWiqdaLbxXIkE/kzorL6VRs7o/KxVIdOqrnnF4KIQUelXSgRwJaNywwwuHKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9GdAE9yQNqBqeXGLekVY/V4B7jfEjXvj/cannr30k0=;
 b=fgUjQF0fzYnj1oI2o2Hp7vLSlijgsQqJOi+9S+936fGOyvW43f3xWg3IbA8p0rV11rxdGIz35Uy2Z/L24d3rslWmx6DxmD/Q1x7DOPagd/AKyDZhRz8PtbaDr2jyaRVCEBgAEP/oHvVzTbh0m8gkvI1QRqAp6hjGPFchQ7uuAvfCUKjEGdZYLlpQYYh8oHm8gqX9MYN90P9IpB8MXWXDbfWIUbtLFS+jeMsa/mtQPR1IAyU1DokYPLRf8DImN+LobVWPTd27dhZN0FbY9sjsnjvtaPC20oxsmBibIt73+zf/VY4vD4s3xPRocVay4o1pxjyLEw3zcaM7qwfSFdOqAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9GdAE9yQNqBqeXGLekVY/V4B7jfEjXvj/cannr30k0=;
 b=OSq8RLgm9LYzj/aF008Hs7yrhlmT2IKCrNHP+HMoJ81ywxxG78TuMjV0CG2HbLiVh9mqvUBlBxn/Xn8+zMktYMhsl7W5bD4ajBHeL6X/OPE7OVdX3tBGlWelg/oBM3vKKA+5m5hyp011bBx3b3Fhngrc+Z0UEVOICtg20FlNVMM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5697.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1fe::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Tue, 10 Sep 2024 10:40:02 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 10:40:02 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Jani Nikula <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Frank Binns <Frank.Binns@imgtec.com>
Subject: Re: [PATCH 5/8] drm/imagination: annotate pvr_fw_version_packed()
 with __maybe_unused
Thread-Topic: [PATCH 5/8] drm/imagination: annotate pvr_fw_version_packed()
 with __maybe_unused
Thread-Index: AQHbA23KvX+RYyZXwEKUTfrn3C0bMg==
Date: Tue, 10 Sep 2024 10:40:02 +0000
Message-ID: <8c97287c-732d-475a-83d6-1c470ad68109@imgtec.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <190e4eefef6c5e62052a01af0084c69361e216ef.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <190e4eefef6c5e62052a01af0084c69361e216ef.1725962479.git.jani.nikula@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5697:EE_
x-ms-office365-filtering-correlation-id: 3306d2a3-6b8e-4a9b-6b71-08dcd184ed1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aklkT3o1RGwzWTJrczdFT2daNm4xMnAvM2Z6SWo1WnZub3FoOWRqMmRETHZR?=
 =?utf-8?B?TWlDaFNlL1ZvcnJJTWJkb1BLUHVYL1RkclVRclJKKzJjUUNJcUU0S1kySVNX?=
 =?utf-8?B?SjI0R053aDVGSFA3a3M1cVF6bjNaTmNPZ3hhNEtWUUMwNStsRTBySVkrUEIv?=
 =?utf-8?B?bTdzcnNJQnpiK1Exd3dOZzdTbTZmQmUwRTlManVENHpXWldPTlhVTFU3SUtX?=
 =?utf-8?B?SXo3NDVtSjRIUng3eER4MzlIL1hMMlpOczhtNFAxNEJzY3hsa2d1QWVTTnB5?=
 =?utf-8?B?dkw1V0FJaW55S0NwWWxqZjgrWVFmMkM5Ukx3OEdWL3U1WmhqcERzN0xEL2ZC?=
 =?utf-8?B?NXJGRFovR09uN0d6bVUzRUY5S3VDLzR1amM0UFptUVNEaG1mc09HdEE4bDJ6?=
 =?utf-8?B?TitPOXpFVE9CVFNsMVVqM2VYVG9KOHhYNUNRbVo2am9kTGFtZWh2OXZ6WlVz?=
 =?utf-8?B?d2tHOHlYVTlTaEJ6WHJWSUU3ZitneHpaNHFMcllta0R2OFBORG5PVHFZUWEx?=
 =?utf-8?B?VW55cTZGTmMvV0xuRXVKcXdqZStaRUoyWVZyTXdtL2lTRThrTll2eUMrM2dx?=
 =?utf-8?B?WGlpTnZtTDhrZVhmQkpBdUdicmVTODNacGdTL3pqMzNtQ3o1c3RxVWdYV1ZP?=
 =?utf-8?B?QjlOd3hzc1oyNWVIandJdlJMbWRMT2ZvY0N6bE1ONzVsY0dGejFlZW9BQWtP?=
 =?utf-8?B?Z1VMYXN0dEswcDZ5eWJOSzg1bld4aG1mUytOeS9JU2RWNVFNVTdzRk53NzIv?=
 =?utf-8?B?Vzh0YmtoWFNjRkNvd0pLbEFnTTd2bXpJSSt3VVQ1N0dsbG4vQ2VWNzNDUU5r?=
 =?utf-8?B?WS9qOGQzVDRmbzVwcEtPcjFxdWJzd3VMRkVlVmFlck1MWVVMWFl5RHBSK2hX?=
 =?utf-8?B?OWZvc3NzUk8yTHEvREN4Mm5yT1U2RkJaaExGVy9uNFd2bGdMQ05WY2Z4RTFr?=
 =?utf-8?B?SmVmRlVUNHBkQWp4d012Rlo0L2RGNG1YeHVyZVpXQmRDRlV2b3pOMUhPTGc0?=
 =?utf-8?B?d05VWW9GRUo1LzY2elhRZDBVTlhrZXh3Nm45dnl2UGxEckFrNHBDekJlTEFD?=
 =?utf-8?B?RU53ZGpOZWJ3dGJQQlhLcG53N2NsU1F3dFFJbUZWT0IrTHVGK3JJM1Vud2Ni?=
 =?utf-8?B?WE9nZkp0QWFSSDNOT2V2ZTBtaHFUNFo5dnh0THUxbFZKdzYzdjJMSXh6MVlG?=
 =?utf-8?B?QjE3WHczM1ZkM2dBYUZ0TDhSS2EyNHkreFFkS05SWFRKS1JHbXNrd3g1a0R4?=
 =?utf-8?B?bGF1cGw1NVpvZWgxTFM2UWJodHdzRUloTFNIZUhZWGh4R253T0gyQTMzUTRB?=
 =?utf-8?B?bzRPMlB3QWE2VjQra1NOeFEzY2lWbDVrcUNnVGE5TngrSkQ4TTZmMmxpMklv?=
 =?utf-8?B?aGt0ZHRNWXlWSlY1K0F2NmMxZkZKZkFLTGhBMFAra1dJZ2FrVXNsVVFyMCtW?=
 =?utf-8?B?VDdScHlTUFZkWERXWGJ4dTJTN3lUS1c0aGZPcDNxQTVuSG9UNWlxNVpnYUlz?=
 =?utf-8?B?NXJaS2x4NkhqSW1IZWpHZkF5bFlVcUJCRk1WRHI3cFZEaGhZZkRhMmsyNWN1?=
 =?utf-8?B?TUZiUVVldjJvcW5FMFo5RjN0S1NxbzgxS2Vwc1JaVmMvb0lmclpmamNJVjE1?=
 =?utf-8?B?SEkvazVmRFdyVVEvSGVibmVWRnhtN1c0RUxKWTVPeWhiaGRLcVZnMnN4cy9m?=
 =?utf-8?B?cWY0RWxtS0w4TlBrRlhCQ3lwaWU4REdLSnRER2NzMU1xVGpJaUxvbG1ocENr?=
 =?utf-8?B?Y1QwdmoranQwVHYvSUo4elhUZWRnSy9OSjNFbCtMekY4Uzk0d3hFVWJ6OVlR?=
 =?utf-8?B?TjdsSHZXOUxRM1RiN2RiM084cGtWKzhUTVhTTnByYVEybDJkc1lOZGM1ekVo?=
 =?utf-8?B?Mm9SMGZLakNhQW1GQUJ5UVZ4dnBnSjU4R3Rpc0lmWU5xcHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDVRWlNhMEhmWmxtZDRMeXBMa2VpT3dnOENZZkNmOWJjcExZVWcrVlA2SWkw?=
 =?utf-8?B?TmFBR1M3dTdYTDlhMUk4OGg2Qk1OdlF2NEhiaTl0N2YvV2ZCdDFySG43M24y?=
 =?utf-8?B?WEViU3F3UUFLcEJFVndpRkJMcmNOUUFYWTlCRFJJV3EyVnVraUU0YS9wNDJp?=
 =?utf-8?B?UVVhOGphSnZyRWJkSnNRUnNUU25sS3FvV0RYYjhUdGt0V2hGUG4vbWlhb3Bl?=
 =?utf-8?B?NDl0UXBWWmtnTDZRb2NzTS9kL3RMM2xJTkNwOGpPc3hYZzA3SkR5UHgxRHhp?=
 =?utf-8?B?RDhwY0c2WEdOWmZXMEkxM21Bbm5FalNGR1JYcmZMTXM3Sm5kb3pDYUwweXMy?=
 =?utf-8?B?MFRIZlN4bTdRa0plaGtWOTBtOXlZNUgzaTF5KzZhTUEzQVM1OVMxdFp5Slg5?=
 =?utf-8?B?RkhhN2RpK3Q5N29tcmdDYTh3aHNNWU1KYitDUGErZFdUVnhUWGJLdlFsMVRu?=
 =?utf-8?B?elZBOUlIKzREQXVUai9GTklTUmhvbGlXSDVqMTY5bnZnWXU0ZmNIRHF2Y0h6?=
 =?utf-8?B?RldGMmZ2anhXNDNpR1lrVEVCenZUR3ZCbWJRNFpiQXdWRlB5UGJxL011ODFw?=
 =?utf-8?B?T3E0QkxyR0FISFVuTmtTQyt4THZIYkYrYk9CUjRYdHczN3FYSlM5RklsTUFK?=
 =?utf-8?B?T0VhTkVXWllNOFhXVG4yL0hqUUhEY0RGVGQvRmg1MU9KUjJhTldUVEFlRjFh?=
 =?utf-8?B?Z0Y1UVZOSldzODE5VnJTeDN3MSs2TGNkMFpDR0E2MnBaWjA2MUdGeEhyOG0w?=
 =?utf-8?B?VVBCOEhhaVZ0SHdYaEhaMmlvT09MREh4RzhGT0RleDR1cS9tNWRyL3AvbUcv?=
 =?utf-8?B?bmlaeHNBVi9KWFN4a0VhT2svQzRES1BuVWgwU3hpVCtrVW82ZEVYME91WDJ1?=
 =?utf-8?B?REFhVjNFL0c5c042ZURCcmxJVW1Cb1d6Qkl6ZE8rcXNDWWZJOC85TWl0Rmlj?=
 =?utf-8?B?WEdFWW5HWW1vVWUxa014MFBtREgvcy8wbTlkN1lMcVA2K2VQYlJnSzFkeGRG?=
 =?utf-8?B?SnFVUUlkVzUzSXBYNHlpTGhLWm1QQVhvOGZVdENCV2UvcHdnYVdRK2JQOTNl?=
 =?utf-8?B?SVEzV1RlZlZDUkhKZVdtbGVyL3BhOW9yU3pDVjdXU1JjVnR0d25odk95NVJK?=
 =?utf-8?B?aTdQaDJDNThnVlVnYUtYRHhCYldFNTIvS1RCMVNWNzVweGZRZ0pLRTFid20x?=
 =?utf-8?B?VTRjd2llam45SDIrQ0ZLbEo5Z3pZTy8xblcxN2p0MmRHTStnZDdUZ1RudTls?=
 =?utf-8?B?WG55SjUvTWo2R3dpU2VJN2lGbTN6R0Nvd0hRRzJYaVNNVVRPR2FFMmdtcFFD?=
 =?utf-8?B?VlJhOGxNLytvZ2RRNUVWYTNGTVVhZjIzSHpGalNUNFNQazJsNXM2SHNDLy91?=
 =?utf-8?B?Lyt3Nm1XRGZDODFpbEp3aTFlQUgyZkkyMUpxV2hMaEVPam5YSnZZdkR6aU9k?=
 =?utf-8?B?d01YSjR3S1NkS1Yxa0ZYd1k3K05EWjZsb0NzYU5sdGQycFJuLzlMUHFjRm12?=
 =?utf-8?B?aDhFTzBDL3hYMHNybzI3bkMwMElwWHB5MDc0ZzczQ3VkMWhHcGlxNmF2dEtW?=
 =?utf-8?B?aU93L1I0NWNRdHJILys4S2hNYWN3SDFLRTZXc1JOYSt4TnRNckVxTzFGZ0Fl?=
 =?utf-8?B?Y0NyejdTeE4vaTg4Y3RFc1VIT0hkdnRvOXRDTXp6MXBRU1dRMXdmbG8yUlg3?=
 =?utf-8?B?OFJ1aEFSYWtaWERucWVyYm51SVI0dUltT2xlOW16Z1dDSHVvZXZYS3Z5UlJO?=
 =?utf-8?B?eHNKTkdWenl2R3NiNVpuZWhCNHpSWjM3SVpnNG9SVGFLS3BpOStpLzNRdWIx?=
 =?utf-8?B?eVkwbmFVTW01aFJrdGdIWWE2bXFkWHByVnJJM0svL0tRMm5iT2h5ODRRMDFI?=
 =?utf-8?B?SU5VU1NqRXVBUmUxeGpaVUZIWS9ISHJ0eWpTRHFUUXdsc25sRkg0YzcyZy9y?=
 =?utf-8?B?aHRVTFZhRFRxaUNmM0d6RXZHUXcyUHhRZWNRRUlRMmROcGUvQkQrYnpsQklw?=
 =?utf-8?B?cnd0ck81cHdnZTNrNkRMWEVLTFlvVEVSYWNBUTlhVUwxR0xkalQ3cWFRSFVs?=
 =?utf-8?B?WGRyNkU3ZlFJa0I3YnIvTW4waWhDQkV0WVk0Z1RzVmZpOEFjNUlHaWNUSXl0?=
 =?utf-8?B?SjlGTUNla0NxOGdRREhNNjJDTHBVaUQvYjdWa3hOV0ZOeGMwaGUyRzhkZm1y?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vL3F212kV9TigKA0CZP8jh0e"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3306d2a3-6b8e-4a9b-6b71-08dcd184ed1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 10:40:02.3170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yCH1Ob9hvOzsu7by8E0WTorR70bUhmimHNRXHcPjSdjCMPKcjAfXNAaKJdA61Y5lzDBxayi1pBCtYCw7AxbWYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5697
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=V7Ev0vni c=1 sm=1 tr=0 ts=66e02206 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=QyXUC8HyAAAA:8 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=6yA1hpWKoi7xqb4FPsAA:9
 a=QEXdDO2ut3YA:10 a=9l0g2W810TjqxB7eWSIA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: _ik_llxwqbJX97vTqYT4SvkjLIOPF2cd
X-Proofpoint-GUID: _ik_llxwqbJX97vTqYT4SvkjLIOPF2cd
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

--------------vL3F212kV9TigKA0CZP8jh0e
Content-Type: multipart/mixed; boundary="------------X4Eb0Acu78FucKurAYcX0ibF";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Frank Binns <frank.binns@imgtec.com>
Message-ID: <8c97287c-732d-475a-83d6-1c470ad68109@imgtec.com>
Subject: Re: [PATCH 5/8] drm/imagination: annotate pvr_fw_version_packed()
 with __maybe_unused
References: <cover.1725962479.git.jani.nikula@intel.com>
 <190e4eefef6c5e62052a01af0084c69361e216ef.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <190e4eefef6c5e62052a01af0084c69361e216ef.1725962479.git.jani.nikula@intel.com>

--------------X4Eb0Acu78FucKurAYcX0ibF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/09/2024 11:03, Jani Nikula wrote:
> Building with clang and and W=3D1 leads to warning about unused
> pvr_fw_version_packed(). Fix by annotating it with __maybe_unused.
>=20
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused stati=
c
> inline functions for W=3D1 build").
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I've been meaning to do something about this for a while, thanks!

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

> ---
>=20
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/imagination/pvr_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> index 1a0cb7aa9cea..684a9b9a2247 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -220,7 +220,7 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm=
_dev, void *raw_args,
>  	return ret;
>  }
> =20
> -static __always_inline u64
> +static __always_inline __maybe_unused u64
>  pvr_fw_version_packed(u32 major, u32 minor)
>  {
>  	return ((u64)major << 32) | minor;

--------------X4Eb0Acu78FucKurAYcX0ibF--

--------------vL3F212kV9TigKA0CZP8jh0e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZuAiAQUDAAAAAAAKCRB5vBnz2d5qsH0i
AQD2w9xYhBUP7xLdBpjgns81zbN7kkyQIZO3xsLQxJ4vawEA8JlVVkADb2wxX2crTHYNFvtKFXbv
R0gsqqckaA3NgQI=
=qaDu
-----END PGP SIGNATURE-----

--------------vL3F212kV9TigKA0CZP8jh0e--
