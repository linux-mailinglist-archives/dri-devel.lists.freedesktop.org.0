Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723A8AE903
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 16:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F9E10FC72;
	Tue, 23 Apr 2024 14:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="OqlZUDbN";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Padl8vfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6358510FC72
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 14:03:49 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N5VuoK027304;
 Tue, 23 Apr 2024 15:02:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=rDYvfZ2PiFxMYx3aRJFY2
 O1VmY5HHcBwaJWRi8wh2V0=; b=OqlZUDbN2+TQdt9DYkgz9IN5ljVyrJc+2m2Qw
 3Ew9R5RRPFAZfdLvWnxc8HWYR3dOdx9KZb/GzMRNFgNrED9AZuiBgrUr3KSaFxnh
 lPPnKNlR/ReBVTOIjAjcLIfPhfrliV35IBYKWb9P1o34S5/mj00zPNW78MOoXVIX
 AAn44j+BXorioM+AtqndQJNatsvPpcpKRLKy8cxG0rasWkq9YaxwHbsVrfE1nmrP
 4C08HYLXUA118kT3Ok9UdFMYh6qcauewLwi0t2oph4Yc7ptF9+BJmgoJEkl80/K/
 46QkNU6jo4MHeH7sjmAFMl1EJ1iuc5rLnDczRoI5gs/2QK1sw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3xm5ssktg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Apr 2024 15:02:39 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 23 Apr 2024 15:02:38 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Tue, 23 Apr 2024 15:02:38 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtXlDU0qhW6HFKotiskgQM+geGMj9+MZuVkDaGxdLFg4iwOOCBPGPXbXQLSmfvd5LNZAuhqQY0xGWuKEjonhEXNtfJwHmqX+VDCeN7Vg5W6V9Rs2SkLRWqwuU6K4mii9B7aDV9DdUmPUE7fXFhqoiBqOHyYlqUCb6B9VPRCBN0dxmfjHGfSXO8IIp9WMVT9e/wqvF/q2iOeqA22gym9RunLrTB3E0PTMvF+TufNyxPakAme5bIL9y0deqAbw5FfMn3y70HF2FrpuPPB9z16SQKF7zcl0qoIlDK63faanoX8U3aaEoqt1+MlUFl1eu4+fMIj+YwT1OoYMBarhn9J+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDYvfZ2PiFxMYx3aRJFY2O1VmY5HHcBwaJWRi8wh2V0=;
 b=iWebxUuqcnYY3SPid48Tx9PLrvbqGKWNEp84EQTeltoi+3VB29zmdao2ZwRRZ4rtMwUWw+HQMhxRR1ZLXiag3L/CNcpLsQptsX7ddVUnOThb2ql2GDr4oVvLcgRaW4taTcFqsIBf5h3jmrxvnyt+04hlKoPE3VdWTFrt/600mGlRg5sy8iJhyKi+4EHEZ5GbCVRB67tHwVZlrdijmL8zU2XTKB7gnkpdTKXVf4wC8ezujZO/yhajxjyJawnCcFVdmlp/z5hfqUMuQyeKZBo34OAyxHELninTV69J32o66JzqUY9rSZFeEJGxvLXYlEvOLbmSqOYbT6/QjIkqZQykKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDYvfZ2PiFxMYx3aRJFY2O1VmY5HHcBwaJWRi8wh2V0=;
 b=Padl8vfClckeQX9QRLLUNzwjJmuSV9Uo7wdvnH8K/8KgN6llpYrRUWH12snlZ9gvthL8ZviKdCkIZhSTvhRU1eGPDS1P+lCoEFbHcXJAXHaauTn8SesUvkQIPzdmpXZHqsBgB2swn1ipfbCI+v53Vj+0mF8j6D7Lro4pP2OO3vA=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB6243.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.44; Tue, 23 Apr 2024 14:02:36 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 14:02:36 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Jani Nikula <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard
 <mripard@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Russell King <linux@armlinux.org.uk>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Frank Binns <Frank.Binns@imgtec.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 "Huang Rui" <ray.huang@amd.com>, Zack Rusin <zack.rusin@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
Thread-Topic: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
Thread-Index: AQHalYbkozT6WAMDO0iNRHXY6G8YNg==
Date: Tue, 23 Apr 2024 14:02:35 +0000
Message-ID: <1e44ed70-52ed-4213-83c1-b5e409579080@imgtec.com>
References: <20240422121011.4133236-1-jani.nikula@intel.com>
In-Reply-To: <20240422121011.4133236-1-jani.nikula@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB6243:EE_
x-ms-office365-filtering-correlation-id: 19547198-93d5-43f3-4f4e-08dc639e0759
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?S1hoM0hrUXh3VG04a0g1aFZ0Ri8xdFNzRjRUcWg5aFpCLzRVTldOREpuNUZC?=
 =?utf-8?B?V2RmTHVNZlJFV0RiZ0ZvVkVzaVo1NDd0dlVKRjEwWmZReFBKcHB5dUYwWVdX?=
 =?utf-8?B?Ty9PS0pSVWh6S2hTSEswSzlTMXR2dDlEK2xtemg1SndmSExSdEQ1VkRRRktJ?=
 =?utf-8?B?Zy9VMHp2RWlkNjV6OEpTTXU1OXNZZU94Y0xvcEZyeVdLTzBqam5sUWJlaHRp?=
 =?utf-8?B?VnhMVUJUWndmdzdSUnJycnl6dEFwUzdqRmFlRWQ3eXhTVnpTbURISVAyK1d2?=
 =?utf-8?B?QjV0bjZ2OXhaRFVXQm1BeVl3OFBMeHVKVzhzdnQyYzdiVjRPOXlxTlYzcXhm?=
 =?utf-8?B?TW5hZkRpdmZLVDVTZW1mdjQ2dXJtKzF1dWZxdzNNTnBiZm1yYmd5OFAxY3BN?=
 =?utf-8?B?SDJIbC9UVFZOU2RCSXc1R2UwZFgySWp5SVBOZ2ZRTzBMRkliUXR1Sm5qeDJS?=
 =?utf-8?B?VDRxdmFwUERmMWlqS0gvUTZkeEJtRGVTSmNLMnJqaXVBdlNCSWlsakRDdU56?=
 =?utf-8?B?b3ZZdWw1L2VWTlAvY1lENmJIa0lqazM1ejJOWlY2U21vdklEeStEMlRXYTIw?=
 =?utf-8?B?UStRSHVrYWNtN2JPc1lKejROSjJXa3RJM29IbWNzak5kL2FrYlExN1k5S2w2?=
 =?utf-8?B?bW41VFZzS3dCOVlOQXNJeFI3a3FlWFpZd2VzOUJrRzJUSnAva0I2NEJzUDNp?=
 =?utf-8?B?ZEt6bkJWamJIU0pnTytkQU83SXk1RHlUVldaM2txT3Jmd2Y2dUZOYkQyVWdY?=
 =?utf-8?B?QnMvcHp2eGIrS3Y3b1E0eEZaK0huVFZQMXZwSmpSV0Z2U3d2aW43c09qbWtL?=
 =?utf-8?B?eGI5RDVWSVhZem5TYnFld1c1VDRBeHRPTWNiZkJzdk9ZUHZodThRWFpGUDk0?=
 =?utf-8?B?SzMrdjJaVG9uR1hrK1dLa1VRYmdmVFpHUVF0NUtoT1F3TlN4Ni83blEzREUw?=
 =?utf-8?B?L1BXNFh5TVhxUDZFaFNWK2s5OTU0ZTU1UUdUVUYzbmFLVkJURVU4eDJMNmhp?=
 =?utf-8?B?Vng5aEZocnZTR2VEQlV2Zml4T1BuRVhqU3k5TW5IazRPYm9QN0JUdFhxalVq?=
 =?utf-8?B?U0NqamVmaEtBcU9LeWFzSmN4M1NWajhOWFN2VlhxeTVacmNCMFZ1YXNBL2ZX?=
 =?utf-8?B?QUxpZGpxekhjamhsYlBLSTR2ZjFVR0Fpb0h1alFxcytwMmpNQVZ1OXdMQUpv?=
 =?utf-8?B?MmJYNXF4RzRQazJMWDBXMkJObG1UUFJhTXUrOTUwczIxNmV2K24ydnRVNEIz?=
 =?utf-8?B?MXF3cUxjbmNiNjVNMFM4Q2Q5OGxnN0VVeG1xcHo4UlhvNk53bER4VVZ2Y1Z2?=
 =?utf-8?B?Y2lJWVgzeEoxK0ZtU3ZPUmo2dlFZQnVmUkVHTldvU2F1NkF0d2Y0R0xqNGdz?=
 =?utf-8?B?SlRZNy92RUgzd2Y0VUh1M2dleUtCdE1HcllJUXZmSmk3YUVrd21hSnF3OTNi?=
 =?utf-8?B?NmU5RktpeEFMNkRLZkd4bG9RSTVFVUVFa2xLZUx6b2hCWUhsWEd6WDZBcUNB?=
 =?utf-8?B?ZDhRdER6dGJ2ZFhJMXFFMU1XdXBHUUdSMXU2cGhGM00xdWJSS0wwcWwreG5Z?=
 =?utf-8?B?YXNNc3BnSW55cWpmTUkzcWg5eSt3S04yZXZxTVA5ZlhUS2VLdlNaTFc2Y2hI?=
 =?utf-8?B?bzNObC9OUW1rWWF6QXQwbGtZMDVlNWlhSWJyZHVUMjBoSGtVdHpjZzN5TCti?=
 =?utf-8?B?U2h2REptU1JGVEU3dlExN3pQUWNYdHlXcjA2Vm1rRXRkM2IrUSszQzVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2ZyakVVT2Z4WGFqQy9mZFlwL3pUSlMrUDNlc3ZQRlRtUFVpQkZmSm12YjFn?=
 =?utf-8?B?ZG5FV2NTZWhFWGFzeWNORUZOeFAyVHVhSGZPWVRlV2M3VmF6VERGMmoycEsv?=
 =?utf-8?B?MGloZzNmWXVoL2Z2Q1VFaVVjUG1vMXFxU2VyYTZ6NFBRajUxaDhiMFA1ZmFP?=
 =?utf-8?B?RzBtZ1ZZR0hMdEFNWTRQRnpzQ0dKQS9DT1FQTTRpcnl2dWpGQTNTc3FJdXhr?=
 =?utf-8?B?Ynh6cDMwaEMydzRmazhqWDNzQVJpSG5SVnovNENralVUWkVoZjZPbFNBaENP?=
 =?utf-8?B?WFhOQ3dXL2RXZDNPaHJkL3hFMTMvRXhFdGNydW5hS001cUdyb0dUV2dTSDRJ?=
 =?utf-8?B?UXNJcVBkT3YrNWNERGRIMGhzVFVuMkhEVmpUTU5qRzlPdTVsN0NXN25WZm1L?=
 =?utf-8?B?Mks5TnF1eFV0RkpiaFcvcVVaeWFqcEkvUmpUYkdTQWFZUGI5VHF0VFM5VVpP?=
 =?utf-8?B?cVhqT2xRWkYzSVhUeVoxaVhJWWxpRXB3ajVzOTRSWGZxTDN1bUZyVmxITGJX?=
 =?utf-8?B?QWpsQ1VpQmtVUWNRNXVXOGVZZFVFMVlscnJHL2hXaDdjWmxpcFVQWkZRZFlM?=
 =?utf-8?B?bXRTcnYwWFNkYkRIYThPem54Z1M3VFFOWG5tNW5SMXhLOXdTRVNqRzZlV0ZK?=
 =?utf-8?B?dWR3UTY2RzJiL1BiOGxYY3dLT3g5Zkc0bFNQNUdyZ21FbWVPVXMxZWlEZENx?=
 =?utf-8?B?ME80WWo5c0p2RXhrSVhkRGxtOXhreWJTSlVpczJsc0tocXBXZ2pUYzI0V2JZ?=
 =?utf-8?B?WllYeFhGYm5iQUZlTGFXMjhuUlV4NVNmdGpKM3RXTi96VXN4bFU1M0JqdUs5?=
 =?utf-8?B?Tm1vbWdHSnUrN01yQkMzR05DVWJrSWUwTVRCbGV0bHV0OHV3REU0QjNsallQ?=
 =?utf-8?B?VEdTci9rbkFrcW0rRXBuWFlYMXNSaGZTWEdGUDlNSWdyTjJIMlpiYUxYSHFi?=
 =?utf-8?B?RHlhZ0thTHZMaDFwYlkwL3Y2ZWYxcHpnVk14SmxDYURqeVg3VVQ1Uk9PREJt?=
 =?utf-8?B?Skl4ZDRBUHRncWNwMkFzMjRob0ZCcFhKWDRBdzdIUlpEb21vSVhOeWprdER1?=
 =?utf-8?B?OXBEVlROM1ExeCtCMDdOMTJvTWk1S3VpNlBnR3pJZk1UMEYwdVVTWXFGOFRn?=
 =?utf-8?B?eWhSSGZhek9Wall0RUg4M2twSmZ3ZjQ0QXNhSzRTRVBYS0Nvdkd3LytOc3RF?=
 =?utf-8?B?SmhiejhtcFhKVWJpWlVIdXFaM1FXbDR5eUliUnhYaHA3UUxzMndPMS9HSjhL?=
 =?utf-8?B?YmRGNTlIdUJORUpsdXBLNEw0Wm80anNGRWVkWmR4MUtNZHh4aTQwVFhLRkxS?=
 =?utf-8?B?MStCOU16Um9DaWZSd25rN2w3TE1DT0Uxem9SNXpOV0d5cUl4MWFRVEFmWWhz?=
 =?utf-8?B?SmxMNUtFN3ZBVGFtQ0pCNDlNSkxXTzU5Ly8yMktCdVpXTXpxMTR2UTUwaFNK?=
 =?utf-8?B?aTNyWFpzRjRUdzFOdlB4TzNpRDdEcTE5cFZ2M3B1TmlESDBGRG9mRWpUb05q?=
 =?utf-8?B?YnVPU0l0dlhVbkl5dklVU25iNHE3dkl2RDlJRC9TV1pVWnA0MTFicmxsVnhz?=
 =?utf-8?B?NDJUNVBUZHV4aHhEamNYTmlwSmgxbzNCZnpBOWFqb1NldmRhS3E4bGoydHpn?=
 =?utf-8?B?dlhlbTJQQXd5WmJId1U5TjJaY1NxTUIrR3Z3RWJJQVptbTY4V0dUdTlGWjIr?=
 =?utf-8?B?VyswQS9OZzdjYnZpM2tDcCtPVUpnY2NKUzd4cGFJS3lRZDk4UDB1eVBXRVkw?=
 =?utf-8?B?NFZ3K1FicktZNVZCMnNEb0Q2TkZCbDlPeXFRWEEvT2w0Vkg3Sk96UURlRGtU?=
 =?utf-8?B?SjNHd0NLOFkvQWJiZGJESWhjMWpiVTVIa1QzLzhZS0dwUnNHa0gxL3dpK2xC?=
 =?utf-8?B?cFpaMGZGaGc4VkFBUmVMWE42MlJaaUJJVGRuYzVXWkl4bFBmK2JpQnAwa1cz?=
 =?utf-8?B?K25rMnpGR3NLYkh2VXljVytpL09XZ1JwOC9wRE5zNXd6NVpUTTR0WE5WSzBW?=
 =?utf-8?B?VU5Mb0pQdTExTG1HZGRwOWI4dFYyL3JmTmg2NE1laThXQUx1QUhBZlMxWmVj?=
 =?utf-8?B?SUQvTWM4S1ZnbHgzcXA4OG1kSFZRL25XdnU1NWNhdk9vbVV0b2JPTHF5bU1i?=
 =?utf-8?B?S0x0TmRKdXFsMDF2c2hNdmUxSTJxV2kxSUg3eTZJeGVkZzhFT09hMHFjanE3?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EvvbMU0wKNEpCX7ZY0AzBDk8"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 19547198-93d5-43f3-4f4e-08dc639e0759
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 14:02:35.8740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6V8dSFtJG3iIFu7U4XWBVglN35u68new26JbcJefy9qXSaP9gl1q4ELs9XHps3V8ZHJ9J1ghGhJiEz3O3+IqTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6243
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 7FonBuaezhRqePCUIYlzF9BWd34AWXYe
X-Proofpoint-GUID: 7FonBuaezhRqePCUIYlzF9BWd34AWXYe
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

--------------EvvbMU0wKNEpCX7ZY0AzBDk8
Content-Type: multipart/mixed; boundary="------------IkV14jgvWKund52SsSkpbYsR";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Huang Rui <ray.huang@amd.com>,
 Zack Rusin <zack.rusin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Message-ID: <1e44ed70-52ed-4213-83c1-b5e409579080@imgtec.com>
Subject: Re: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
References: <20240422121011.4133236-1-jani.nikula@intel.com>
In-Reply-To: <20240422121011.4133236-1-jani.nikula@intel.com>

--------------IkV14jgvWKund52SsSkpbYsR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22/04/2024 13:10, Jani Nikula wrote:
> Surprisingly many places depend on debugfs.h to be included via
> drm_print.h. Fix them.
>=20
> v3: Also fix armada, ite-it6505, imagination, msm, sti, vc4, and xe
>=20
> v2: Also fix ivpu and vmwgfx
>=20
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20240410141434.1579=
08-1-jani.nikula@intel.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> ---
>=20
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broa=
dcom.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c           | 2 ++
>  drivers/gpu/drm/armada/armada_debugfs.c     | 1 +
>  drivers/gpu/drm/bridge/ite-it6505.c         | 1 +
>  drivers/gpu/drm/bridge/panel.c              | 2 ++
>  drivers/gpu/drm/drm_print.c                 | 6 +++---
>  drivers/gpu/drm/i915/display/intel_dmc.c    | 1 +
>  drivers/gpu/drm/imagination/pvr_fw_trace.c  | 1 +

Acked-by: Matt Coster <matt.coster@imgtec.com> # drm/imagination

Cheers,
Matt

>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 ++
>  drivers/gpu/drm/nouveau/dispnv50/crc.c      | 2 ++
>  drivers/gpu/drm/radeon/r100.c               | 1 +
>  drivers/gpu/drm/radeon/r300.c               | 1 +
>  drivers/gpu/drm/radeon/r420.c               | 1 +
>  drivers/gpu/drm/radeon/r600.c               | 3 ++-
>  drivers/gpu/drm/radeon/radeon_fence.c       | 1 +
>  drivers/gpu/drm/radeon/radeon_gem.c         | 1 +
>  drivers/gpu/drm/radeon/radeon_ib.c          | 2 ++
>  drivers/gpu/drm/radeon/radeon_pm.c          | 1 +
>  drivers/gpu/drm/radeon/radeon_ring.c        | 2 ++
>  drivers/gpu/drm/radeon/radeon_ttm.c         | 1 +
>  drivers/gpu/drm/radeon/rs400.c              | 1 +
>  drivers/gpu/drm/radeon/rv515.c              | 1 +
>  drivers/gpu/drm/sti/sti_drv.c               | 1 +
>  drivers/gpu/drm/ttm/ttm_device.c            | 1 +
>  drivers/gpu/drm/ttm/ttm_resource.c          | 3 ++-
>  drivers/gpu/drm/ttm/ttm_tt.c                | 5 +++--
>  drivers/gpu/drm/vc4/vc4_drv.h               | 1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c         | 2 ++
>  drivers/gpu/drm/xe/xe_debugfs.c             | 1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          | 2 ++
>  drivers/gpu/drm/xe/xe_uc_debugfs.c          | 2 ++
>  include/drm/drm_print.h                     | 2 +-
>  31 files changed, 46 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivp=
u_debugfs.c
> index d09d29775b3f..e07e447d08d1 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2020-2023 Intel Corporation
>   */
> =20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_print.h>
> diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/=
armada/armada_debugfs.c
> index 29f4b52e3c8d..a763349dd89f 100644
> --- a/drivers/gpu/drm/armada/armada_debugfs.c
> +++ b/drivers/gpu/drm/armada/armada_debugfs.c
> @@ -5,6 +5,7 @@
>   */
> =20
>  #include <linux/ctype.h>
> +#include <linux/debugfs.h>
>  #include <linux/module.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> index 27334173e911..3f68c82888c2 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   */
>  #include <linux/bits.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pa=
nel.c
> index 7f41525f7a6e..32506524d9a2 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -4,6 +4,8 @@
>   * Copyright (C) 2017 Broadcom
>   */
> =20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 699b7dbffd7b..cf2efb44722c 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -23,13 +23,13 @@
>   * Rob Clark <robdclark@gmail.com>
>   */
> =20
> -#include <linux/stdarg.h>
> -
> +#include <linux/debugfs.h>
> +#include <linux/dynamic_debug.h>
>  #include <linux/io.h>
>  #include <linux/moduleparam.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> -#include <linux/dynamic_debug.h>
> +#include <linux/stdarg.h>
> =20
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm=
/i915/display/intel_dmc.c
> index 3697a02b51b6..09346afd1f0e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -22,6 +22,7 @@
>   *
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
> =20
>  #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/d=
rm/imagination/pvr_fw_trace.c
> index 31199e45b72e..73707daa4e52 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -12,6 +12,7 @@
> =20
>  #include <linux/build_bug.h>
>  #include <linux/dcache.h>
> +#include <linux/debugfs.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> =20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 0bf8a83e8df3..8586f2761782 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -2,6 +2,8 @@
>  /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.=

>   */
> =20
> +#include <linux/debugfs.h>
> +
>  #include "dpu_hwio.h"
>  #include "dpu_hw_catalog.h"
>  #include "dpu_hw_lm.h"
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/n=
ouveau/dispnv50/crc.c
> index 9c942fbd836d..5936b6b3b15d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: MIT
> +#include <linux/debugfs.h>
>  #include <linux/string.h>
> +
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r10=
0.c
> index 86b8b770af19..0b1e19345f43 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r30=
0.c
> index 25201b9a5aae..1620f534f55f 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r42=
0.c
> index eae8a6389f5e..a979662eaa73 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r60=
0.c
> index b5e97d95a19f..087d41e370fd 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -26,11 +26,12 @@
>   *          Jerome Glisse
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/slab.h>
>  #include <linux/seq_file.h>
> +#include <linux/slab.h>
> =20
>  #include <drm/drm_device.h>
>  #include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/ra=
deon/radeon_fence.c
> index 9ebe4a0b9a6c..4fb780d96f32 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -30,6 +30,7 @@
>   */
> =20
>  #include <linux/atomic.h>
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/kref.h>
>  #include <linux/sched/signal.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/rade=
on/radeon_gem.c
> index 3fec3acdaf28..2ef201a072f1 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/iosys-map.h>
>  #include <linux/pci.h>
> =20
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeo=
n/radeon_ib.c
> index fb9ecf5dbe2b..63d914f3414d 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -27,6 +27,8 @@
>   *          Christian K=C3=B6nig
>   */
> =20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_file.h>
> =20
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeo=
n/radeon_pm.c
> index 4482c8c5f5ce..2d9d9f46f243 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -21,6 +21,7 @@
>   *          Alex Deucher <alexdeucher@gmail.com>
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/rad=
eon/radeon_ring.c
> index 38048593bb4a..8d1d458286a8 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -27,6 +27,8 @@
>   *          Christian K=C3=B6nig
>   */
> =20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> =20
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> index 2078b0000e22..5c65b6dfb99a 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -30,6 +30,7 @@
>   *    Dave Airlie
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pagemap.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs=
400.c
> index d7f552d441ab..d4d1501e6576 100644
> --- a/drivers/gpu/drm/radeon/rs400.c
> +++ b/drivers/gpu/drm/radeon/rs400.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> =20
> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv=
515.c
> index 79709d26d983..bbc6ccabf788 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> =20
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_dr=
v.c
> index 4bab93c4fefd..1799c12babf5 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -5,6 +5,7 @@
>   */
> =20
>  #include <linux/component.h>
> +#include <linux/debugfs.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm=
_device.c
> index 76027960054f..434cf0258000 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -27,6 +27,7 @@
> =20
>  #define pr_fmt(fmt) "[TTM DEVICE] " fmt
> =20
> +#include <linux/debugfs.h>
>  #include <linux/mm.h>
> =20
>  #include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/t=
tm_resource.c
> index be8d286513f9..4a66b851b67d 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -22,8 +22,9 @@
>   * Authors: Christian K=C3=B6nig
>   */
> =20
> -#include <linux/iosys-map.h>
> +#include <linux/debugfs.h>
>  #include <linux/io-mapping.h>
> +#include <linux/iosys-map.h>
>  #include <linux/scatterlist.h>
> =20
>  #include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.=
c
> index 578a7c37f00b..474fe7aad2a0 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -32,10 +32,11 @@
>  #define pr_fmt(fmt) "[TTM] " fmt
> =20
>  #include <linux/cc_platform.h>
> -#include <linux/sched.h>
> -#include <linux/shmem_fs.h>
> +#include <linux/debugfs.h>
>  #include <linux/file.h>
>  #include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/shmem_fs.h>
>  #include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_util.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index ab61e96e7e14..08e29fa82563 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -5,6 +5,7 @@
>  #ifndef _VC4_DRV_H_
>  #define _VC4_DRV_H_
> =20
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
>  #include <linux/refcount.h>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_gem.c
> index 2132a8ad8c0c..07185c108218 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -30,6 +30,8 @@
>  #include "drm/drm_prime.h"
>  #include "drm/drm_gem_ttm_helper.h"
> =20
> +#include <linux/debugfs.h>
> +
>  static void vmw_gem_object_free(struct drm_gem_object *gobj)
>  {
>  	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gobj);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_de=
bugfs.c
> index c9b30dbdc14d..0b7aebaae843 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
> =20
>  #include "xe_debugfs.h"
> =20
> +#include <linux/debugfs.h>
>  #include <linux/string_helpers.h>
> =20
>  #include <drm/drm_debugfs.h>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe=
_gt_debugfs.c
> index ff7f4cf52fa9..8cf0b2625efc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -5,6 +5,8 @@
> =20
>  #include "xe_gt_debugfs.h"
> =20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
> =20
> diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe=
_uc_debugfs.c
> index 0a39ec5a6e99..78eb8db73791 100644
> --- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
> @@ -3,6 +3,8 @@
>   * Copyright =C2=A9 2022 Intel Corporation
>   */
> =20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_debugfs.h>
> =20
>  #include "xe_gt.h"
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9cc473e5d353..561c3b96b6fd 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -30,11 +30,11 @@
>  #include <linux/printk.h>
>  #include <linux/seq_file.h>
>  #include <linux/device.h>
> -#include <linux/debugfs.h>
>  #include <linux/dynamic_debug.h>
> =20
>  #include <drm/drm.h>
> =20
> +struct debugfs_regset32;
>  struct drm_device;
> =20
>  /* Do *not* use outside of drm_print.[ch]! */

--------------IkV14jgvWKund52SsSkpbYsR--

--------------EvvbMU0wKNEpCX7ZY0AzBDk8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZie/ewUDAAAAAAAKCRB5vBnz2d5qsBCB
AP9snwvOqu1oaLhyWxGllqALvt9GA1/G5NrKolujPEjZQgD9FlixRYbPHwT0xG6D9BSI6HB91lr4
e+uXKBvAenVqcAI=
=kuLt
-----END PGP SIGNATURE-----

--------------EvvbMU0wKNEpCX7ZY0AzBDk8--
