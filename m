Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMGBFBSclmkDiAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 06:13:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A407915C129
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 06:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13E110E1CE;
	Thu, 19 Feb 2026 05:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QvWWGKG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CF310E1CE;
 Thu, 19 Feb 2026 05:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyI0PddpUD5DsixtXmqTi0RVOMnuUwehou3sgUQ61BBVSqP5cXLD76imYNysps0slxlA3pW17ioFOPj1SkgJuk6cHn8LrF7+Fs00s5ex3Yyd6AClkKw1Ali9N4dpRLc5gvynM20OG2RLI/KbLAhgUmmkhLEbgtF9YeO6AG697Ap3PzP8l7ZpZdRp/O2CXmHAU5ttSkFlZH4vEoxGo72m/W/EfNjhxBEU0cF6DiXYD4gntKV74AvNIqv8w3GLNGTuU5a6f38R7R34MJCjKZnZLecc3NfavBquA0SqNXhKh9zajJDRl6Q49XblNToEDCD6SfFp4Cz6uJeC7560IUF9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCsF2hgUXVqn8U+mFm+xxzLK2ZMLOzjQWAOsNvAjvx0=;
 b=mNNmDwU5Ya6f/FYYg2XX9mWeiDSR43yCktlEEzKbwvfo1ieERtlJsfoqMLD5xrieV8CCq+DkyE5vrmQi/jiYwkMdq0CCqfwCCf02MEMhqFrr3C+DzneiF5RMRsLvVZ3PVxmdk2A8oLaR+WW9EEg7uW1kudfY7W3DYlbXmmf5wjJGF9zCcZ9D2c/71QaUA7xT8j7NRY/gCnmhZmt3wyMv3mB1WsGNUPwdjyPJI9E9NFpQSuUNy9y+VD/jMeELHbVdUSwrb7S6goW2rFsWtVRVkbHb5YlIRWbIoz0lGbJmh0n7BOJfi1EzE06HD4nhMBx4CSa0dSddeZjhrLuap+Iq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCsF2hgUXVqn8U+mFm+xxzLK2ZMLOzjQWAOsNvAjvx0=;
 b=QvWWGKG5VDoPNy85JUYDfcHs0Frsjr+CXLSBccjptiyrvGdKTeuE5spSK7w46BgmKneaZRVCA0zPDvxEQr4jct++ovLtAggxIUi/3pght+m7kwWG2azBOqRFw/s0JXds5uIE3up42Cau6aJf3F2FJfLDRvmk9KoKVP6QYERepvYzSqCqDtU3IctEPpnPBLS2FfpuAPHxwKD5ka+/r0dbLXr+2OiQLd62SS2pBtUT2182Mo5nHi6D0K2pj1wsdsl2vREnCx3Jhhh32phFZrJsNDBWtKpqcvQIUzfcptTRyKtl5Fw9TBbFXRo3K0goegvlbd7i3s278LMTB6i5djG4dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 05:13:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 05:13:40 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 14:13:37 +0900
Message-Id: <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-7-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de8dfb9-d55b-41f5-9e43-08de6f75a511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTYrLzdSQTY0L2ZJNVJXbHo2ZUFzSXd3bGNOdFJOb1dLcUhzNitibHhybmkx?=
 =?utf-8?B?TXR5RVhpa3pvRzU4NGcxMmkyUnF6dEQzaUJ0RmhDSHR1UzlxQzJ3dmtZbjBF?=
 =?utf-8?B?ZWg2Nk9ReDJ3bUs5MzFLZ3NNZ21NYlhlZzFCVEIxeElGTjExeExWUUpwbmVR?=
 =?utf-8?B?UGF3cnJVNG9IbDBHbG5kK3Y2aWQ4RjlZOGdRQzZLTHk1ejBtekRGdnJ6dDNr?=
 =?utf-8?B?OUFtZDRPL1MzWldGUUY3bFdlSXgyNTZKblNzeDF0Q1RYaFhMY3JWMnNJUHlh?=
 =?utf-8?B?Vlp5bWRSeGhFSkFOUUptNXVaMGo3aFI5RXpNdjBBbThtNVBXR1VXdjRsYk1j?=
 =?utf-8?B?UjhhZmhnVmNES1NUNVp1bmt0eEVROW1QS1Z3SXNOK2taRjJUbGRZMjJhTUZt?=
 =?utf-8?B?bDRKalZzOGN6TkgvWGFBOWhoWFBsRTBENS9LMHZWemtPQ0Z5REpPRklWQldw?=
 =?utf-8?B?bGpRdENaSHQ5WDc0Qzh3MklNY2FxdW8wSVc1TFhZalMyM2llQSs5YXFWWU95?=
 =?utf-8?B?U2tBN1R5VHh2NHhlQThQV09idk1XNGJZanRqNFVycXhxUzJ5MC9HbnBJVzFJ?=
 =?utf-8?B?Z0pnUCtQRklQVWRiQ3FFQ1FHSmx6bmpEMTdyb01xa2N3a3hQY21BYWcyRjFN?=
 =?utf-8?B?Q1lHbUxxZTJpanc1NUJsZitreThrMEN1S0Ryd2ZxSmw4UXUvWWI4RkdBVmVm?=
 =?utf-8?B?dkRVd1RFLzZEQUVSc1dhTjVNN0tnRjRKN0h3ckdyRHJ2cERCbnV3ZG5qL3Z6?=
 =?utf-8?B?alVSTUYyNWt5VllPN0lTSmFMNURRYmJoSklYaWFEcjh1SDVCK0t1YktuVDFD?=
 =?utf-8?B?V1Fpb3RHNmUzZDlDblgxTHB4NkpwVTExM1U0UXRONVNoa2pxSUJHd3RwWUw5?=
 =?utf-8?B?cjVodzQ2WmZicGlOZGR3RERxRnNqRkx3MGxpOUlFYlNDcVRub0JSYytHOHNI?=
 =?utf-8?B?dkR3Zk9ZSVYwU2xwT3poNzFjajZXZzJmMXg1TjdIVDZ3QlVic01mRWk2ZjFQ?=
 =?utf-8?B?NnYzSkovb09VdlVqcktvbGIxWUhFeldDYjVFZGNpUHZDdTFCY0t2bXBwWFF0?=
 =?utf-8?B?V3JBdkhVYzVEdU0zZnBUTHd4ZElFQlpYZ3g0N2RSOEpSYjd6RlZTRndYdlpt?=
 =?utf-8?B?dXZKQjZkNkt2N3dkOFFnZ3ZPM1hiS1VYQmIzQ0k5cUp4WkFiaW5MeEVuYUJa?=
 =?utf-8?B?dXVVUjdZRkRLTmIvaHdRMXNtSUp0R2JxWVNNdG51RGU1SlNvcjFwMUdiQmZ6?=
 =?utf-8?B?bW14aVNGbDFpNXlWWFp3L3EvdkcvWm0zLzViQzZFeFhVRFhIaFh2cEJ4VEtI?=
 =?utf-8?B?REZoSE05UHp2V0VvRGNnRTEyV0lDU3A0d1ozZmVLZ1p1eEtoMWhXNkpHVmdt?=
 =?utf-8?B?Vis4S0ZiYkdrNXZoWU4ybDBBKzRIcXBlVGI1ZmduNTAxeTVrdGhJRFAwL2hK?=
 =?utf-8?B?aENLWVpnQUxYb1Q5NGVhVTZtZG0yS0ZsZHFUSnArUi9sMSsxYUdBS0JSRkt4?=
 =?utf-8?B?cFF3cFhxOFhmVytZR0ZIbDQ3dng3WUZXWExVMFNyZ0RtcEFTeUZJVURuUUFz?=
 =?utf-8?B?aE5TZmIrMzExaWY1MUJ0NVdRZzI0R2FGbzBnZ09RNzBaNHhQcWl3RERxakY1?=
 =?utf-8?B?dlkzWm4wT0NWaUVocDlMdm5yVUVwenBzcVlXTHp0RTVDRnVPMUN0Sm16ZWVL?=
 =?utf-8?B?R0RwSGxwY2RPaUpUeEYrSFllVTlURVNUVGk1YTFNMWphcCtob0hyaVc5Qit4?=
 =?utf-8?B?d3NRMVJPQTBGbjRWd2h5YkpIRTFWaXUyQjJHTFFSME9iOUQ4U2g5Zk4rSDFX?=
 =?utf-8?B?UVZSbVo2MlRVRTdSeFZ6bjVHMWhKTGtCRzRqQjJUR2NRdHFrVU9Qem1aYk1E?=
 =?utf-8?B?b1MyU1JkNE9uMkRoWEp0ZkNZSER6ekVnWTZNV1VUUzE2ZS9FcWxqcW5ITjQ1?=
 =?utf-8?B?YlA2OU0ydng0ZEM4bXRkeE9JWkxBN3NBcFVuRGtKdDlVYUozVks0ZWhKRDEz?=
 =?utf-8?B?b2V4S05pcFJqZlFHVlR4UUtSMEJnVTUyRTJNSis5NUEvNEJZNVA3Uk5yclRO?=
 =?utf-8?B?Umg5QUt4U3o5cm9aak9YT3FoQzNDaWoxeXpnVGJubmJ1NU9XaXpONzQ2TFVj?=
 =?utf-8?Q?s5aM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rkp2czBIQnJ2cXc5c2VpMGxJQzFjTndLamFJbHRNV1BySnNmNFQzRVR2bTdG?=
 =?utf-8?B?YnRqbENGa0hLMXlyZDRRWFdOa0FGazlZNG9nRE90WUU5eVd4NVB2RmMxeDlr?=
 =?utf-8?B?SG5Kb3lQUFNkNS9FVnRLUjJSenNTOFNzU05YaUtZWjFSU0djTUdYZ0RiemlB?=
 =?utf-8?B?LzFjMWhVNnRSeFZJeFhPcGxRdm1IQTRXZURabGErZFN5alB3UzVZY3I5dEF5?=
 =?utf-8?B?c05xSHN6bG9PejgxMWpLSUlMTmszdzFlSTV3eFhZNVgyWHRQTDlNRFR0VGlX?=
 =?utf-8?B?bmlkYnBnWCt6blBBUWJXSmRteWxKUitJOW9HQkJmSHE4cGhDcFU2SkpmOVhq?=
 =?utf-8?B?UzBXbGFsK3FiRFFKQ3hGUHd5d0NrcjEySUlNeTU1RUN1SWNIbDNjNUZVK281?=
 =?utf-8?B?Z2NqdzRaeW5FMjU2bTBRaWVYdW84bEdUdzFZRndDVEI0YThhYUFxS2dZK3pU?=
 =?utf-8?B?d0JJSVRoM0cxZ3hsRERRNkRTTzV1d09hVkdPUWZaeUZ4YkppMHVkT2c4Mnpk?=
 =?utf-8?B?M0xHMzUzOUNTV00wOFZvY2taMlRWVTdKekhWQlFmVktwdVEvUFZsTGVydTIz?=
 =?utf-8?B?WjJkUnViQ3p4ZnJwM1oxYkhYbHNRZ0NianYxQ2lWZGp4ZGZ5SlRBcW44dEll?=
 =?utf-8?B?WWZodWVqSlFnczBtUHhHakRPc3lhV0FBNXphcHZwT1ZRdGxYM3RjMm5sdFE1?=
 =?utf-8?B?OXVuVmVoQSsyS3NnVzR5RE45WXhpd0ZUbEM1NkFxMC9UNHBKbHYzdFdEUWl5?=
 =?utf-8?B?ZjIycURDWXA5bWxoQXBCNzRLR2ZqOU5lVTg0blJWZVhSdUU3L0xIbkhqTGla?=
 =?utf-8?B?ZUd6NDlmVkpEOGtKeS92WjNaY1Z3MlFPUUR5N0RKOEN1VmVwOXJkRktZRm5u?=
 =?utf-8?B?MHVuYnFKa080QWFUNGFDTlRaMFpuZi8xNkRVVk8zNDY3dFlQK2x3b0hkeUVz?=
 =?utf-8?B?MDl6bmhNK3UrdFlrZkFRVEhYUzZ5bmVWMWdGak9xbWI1MSttcEhQSHRoWk1O?=
 =?utf-8?B?RUd1b0NQMlBtT2JpVStvVUtPNkUxZitnOTNsUGdhSXUyMEdBbHpzT09UeVQr?=
 =?utf-8?B?YzUwKzdHWWhXa082R256bG41UTVGRytBVnNCdmpGR3BPNGUzeDJISDFxMWQy?=
 =?utf-8?B?S2JsMFFQay9abmUwb2lLVW9nQlFLUlU3QVQrYVJ2WTU4eHJtS3dPTm9UVTdU?=
 =?utf-8?B?QVNyODJwNWVDYnRLZWFyL2N4WU1Gbnk0UWh6YXhIN0dHY005VTlRQWFYUnRM?=
 =?utf-8?B?aldEbitZbU9Ud2JpaXNzdnpYTTVOb2ZpRGQ0RzNqWHVNYnFxSHVLUkU5dis5?=
 =?utf-8?B?VnRISCtpQzJUU0NSbndFVjVjbjh4Nmp0ckVkUGVLZStmNHJHaXl6dDAvWUIz?=
 =?utf-8?B?cXptMUNzSDZySnpEbW94ZlNqM25SSytsMTc0ZjR5cUNCVHcvM2VVYzVVMXBv?=
 =?utf-8?B?azRhdlRTaDhiZnZZa2taTDl0Y2FNekd5MnF6b2p2SHlKNmxpUk9uVVBnTkpL?=
 =?utf-8?B?YmJuUWF2ZGk3V0hCSkE2eUx0cDMxSENsV3E5ZWU0b0EwazdLU0ZxL2k1RGoy?=
 =?utf-8?B?aURmcFN5M01uT1ROY0hUUCtMbmxNcHZyd0pLcThxUHQ2NWZWbkpJcTVRVkJ3?=
 =?utf-8?B?R0hOYXYrTEFXOGhuMGV1WjBRQ1dYT0I3VDFrUERXWkIyVVMrWUNhMHp3UWFk?=
 =?utf-8?B?Q1pubUp3Mm4vNkVVWFVHQVpkY1hndStDWHpJUzF6czl1aFRta1RSV0V2cmo4?=
 =?utf-8?B?QnlVd0gyWHZOTno2Uko1Q3BBZFl6TGJVNWdtVTg5dmo2RmNhcjFMN0NBeXRE?=
 =?utf-8?B?bnV3czRwZFJOQXJMOVpIajU2Q1dQdEpOaitSbGJSa05rTkhqdTFtMTBrUDBz?=
 =?utf-8?B?NzFkUHovaXgzd2VYVmRSbjA0Qmp3cWkzdUljTC9kSU9HQXJMSWZMditGSCtT?=
 =?utf-8?B?SWo0eGJSalZMVFYzdHVCMXNtQXRlM245bFYySkd6NkhpUllMYmJMdlJYdG5C?=
 =?utf-8?B?T2MzSHoxSXZFUUtWMVlKY0hQY1Q2YTZBeEl0ZE83TGZlcHRxS2V1SXo3TTM5?=
 =?utf-8?B?K2Fid2FkaUhUZC9PRHRucmZZcVk4Qldkb08wdzBXQlBRWlhhUUkwTjlvUlk0?=
 =?utf-8?B?SEk2ZHRHdE1CZDNZendaelJXdE0xNE4wdkZ4Yjl6UUZxakh4V2tVeHphVUcr?=
 =?utf-8?B?L0k5SEltM1IxSVJQd0lxVHEzUzB2c2ZsaGxmU2l6ekdUMGpiTUZ0djR5ZHRh?=
 =?utf-8?B?MThFYnBHOGgvMW5ocEZwMldQMThZTXcyVnZaOVZRZVJEV29taTdQdTFQcnJK?=
 =?utf-8?B?UER0UFhHYUpsUXdzS01OU2Z6OERWc2ZzMElYNFp2WlpQNW1sN3VtaEMyaExa?=
 =?utf-8?Q?JrC/yOnCpvVlOel0CyQ5pSRfs669AI1a8UvuOv9tl3esj?=
X-MS-Exchange-AntiSpam-MessageData-1: JQuMvZ0a4EBz8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de8dfb9-d55b-41f5-9e43-08de6f75a511
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 05:13:40.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuqLgVpamHsKHsO1wxF/b1Yk021AxwaNo0VfrCRcVF+vnUvkFX05KStRUcR8J3MP4q1sICZhsxJ9TCK0VeTG1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A407915C129
X-Rspamd-Action: no action

Just a few things caught when building.

On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
<snip>
> +use crate::{
> +    bindings,
> +    clist_create,
> +    error::to_result,
> +    ffi::clist::CListHead,
> +    new_mutex,
> +    prelude::*,
> +    sync::{
> +        lock::mutex::MutexGuard,
> +        Arc,
> +        Mutex, //
> +    },
> +    types::Opaque,

Need a `//` or `rustfmt` will reformat.

<snip>
> +#[pinned_drop]
> +impl PinnedDrop for GpuBuddyInner {
> +    fn drop(self: Pin<&mut Self>) {
> +        let guard =3D self.lock();
> +
> +        // SAFETY: guard provides exclusive access to the allocator.
> +        unsafe {
> +            bindings::gpu_buddy_fini(guard.as_raw());
> +        }
> +    }
> +}
> +
> +// SAFETY: [`GpuBuddyInner`] can be sent between threads.

No need to link on non-doccomments.

> +unsafe impl Send for GpuBuddyInner {}
> +
> +// SAFETY: [`GpuBuddyInner`] is `Sync` because the internal [`GpuBuddyGu=
ard`]
> +// serializes all access to the C allocator, preventing data races.

Here as well.

<snip>
> +/// Allocated blocks from the buddy allocator with automatic cleanup.
> +///
> +/// This structure owns a list of allocated blocks and ensures they are
> +/// automatically freed when dropped. Use `iter()` to iterate over all
> +/// allocated [`Block`] structures.
> +///
> +/// # Invariants
> +///
> +/// - `list` is an initialized, valid list head containing allocated blo=
cks.
> +/// - `buddy` references a valid [`GpuBuddyInner`].

rustdoc complains that this links to a private item in a public doc - we
should not mention `GpuBuddyInner` here.

> +#[pin_data(PinnedDrop)]
> +pub struct AllocatedBlocks {
> +    #[pin]
> +    list: CListHead,
> +    buddy: Arc<GpuBuddyInner>,
> +    flags: BuddyFlags,
> +}
> +
> +impl AllocatedBlocks {
> +    /// Check if the block list is empty.
> +    pub fn is_empty(&self) -> bool {
> +        // An empty list head points to itself.
> +        !self.list.is_linked()
> +    }
> +
> +    /// Iterate over allocated blocks.
> +    ///
> +    /// Returns an iterator yielding [`AllocatedBlock`] values. Each [`A=
llocatedBlock`]
> +    /// borrows `self` and is only valid for the duration of that borrow=
.
> +    pub fn iter(&self) -> impl Iterator<Item =3D AllocatedBlock<'_>> + '=
_ {
> +        // SAFETY: list contains gpu_buddy_block items linked via __bind=
gen_anon_1.link.
> +        let clist =3D unsafe {
> +            clist_create!(
> +                self.list.as_raw(),
> +                Block,
> +                bindings::gpu_buddy_block,
> +                __bindgen_anon_1.link
> +            )
> +        };
> +
> +        clist
> +            .iter()
> +            .map(|block| AllocatedBlock { block, alloc: self })
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for AllocatedBlocks {
> +    fn drop(self: Pin<&mut Self>) {
> +        let guard =3D self.buddy.lock();
> +
> +        // SAFETY:
> +        // - list is valid per the type's invariants.
> +        // - guard provides exclusive access to the allocator.
> +        // CAST: BuddyFlags were validated to fit in u32 at construction=
.
> +        unsafe {
> +            bindings::gpu_buddy_free_list(
> +                guard.as_raw(),
> +                self.list.as_raw(),
> +                self.flags.as_raw() as u32,
> +            );
> +        }
> +    }
> +}
> +
> +/// A GPU buddy block.
> +///
> +/// Transparent wrapper over C `gpu_buddy_block` structure. This type is=
 returned
> +/// as references from [`CListIter`] during iteration over [`AllocatedBl=
ocks`].

Link should be [`CListIter`](kernel::ffi::clist::CListIter) to resolve.
But maybe we don't need to share that detail in the public
documentation?
