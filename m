Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME5/IECunmlxWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:09:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32029193ED6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC8910E6E0;
	Wed, 25 Feb 2026 08:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BDXF/eL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B3610E1A6;
 Wed, 25 Feb 2026 08:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvYE4yrAWdWVbodcYoTXdC5VVrIdsI7M4X04ZcjL98dbf4zolo+tgIf9PLSWgvkj5oPyT0YXuuEgd4qDva1qgFN6IlbHkJPBhaRWLoaFeaxf0orsgM8AMxDHAetIEyRMBsJ5cVN8AC8gpjzaT/PKZDxQ1yWN43va4zV6QVTCMKNE3/dZizln3maSTSBPiTPK/wz4g+vClEQzfRf7fenrsG9/NYE0PbAlS+Q7aYFJdFaTHqoJ6nYbBy2tptt6oxJ6RAfXgJ6dIDy/Y+IKkBk1DpRHvzQjP94pryUk3efZLoHbpeEePfnf59Py7NUXaoNh1b4vvhZcKsQMCxWG+Pu6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61DNwIKrUd+8KZwKcuoGAQ0Y9nn3DiY6mgpeThMOPLk=;
 b=Z2Xj3kCICyFJsVpy3Y4fudv9erYzEE0LSgipBNSCw7phhTpLTRfBOy8Ye450WoiG5cpw336k9NLK2bQm2hpH8IIpvP3Wgt0OG1WcRABW1kl5/tECc7r4mXxLvoCoMEBbcydvnuorLpB9Jfw5oMLIWiKJbayLRQ7d+YPl59Cpv1Ox6RAV4EmSbmaaZEte/evitG1vgijycVIXYLwYougyXncL/8eSKxxGee1DqoUPWCdX/R+HktO07EVQIOpYfjoN6AkX9q5DZ9MYalwmXIi1zgl2DzV/vV9PqSTvtV6EQbmlN6gS22lNpXMvkE2OgmaPz8h1RIjYjdW3BPMXZ6vq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61DNwIKrUd+8KZwKcuoGAQ0Y9nn3DiY6mgpeThMOPLk=;
 b=BDXF/eL5VsoA0ezAV8iXawUarFx0ZupV4E6AHAadU/9HbPHdiLk/mQiGupEpWTsbUvNqGQ+batS9lPmtAf6jGhWulCGJrlF2TjVVaLlBWehpuQlxv0bFz7g3gMh93Gztkt3GmxSTR/9XjS6xiGXafgi7waePPCH0ttC608RrUByTPta24zFJloFwqvK/MmMmQW8UCDI7N/GX/sy+hqctTjCvR3/DmSkOJbBDrTfy1LwyoP6nWUTvQ0dcJEfhKwFazM3J9cegTyOWfCQcW7gokh/Qqx29E8RceyHJo7lT75FnivPhTdsht6Nt7MielSgAZjoRCiLxZdYbrtIOdvXxFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 08:09:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:09:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 17:09:22 +0900
Message-Id: <DGNW1KH6TCE1.3DIVLKYG6OURI@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Dave Airlie" <airlied@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, "Nikola Djukic" <ndjukic@nvidia.com>,
 "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang
 Rui" <ray.huang@amd.com>, "Matthew Auld" <matthew.auld@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Helge Deller" <deller@gmx.de>,
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
In-Reply-To: <20260224222734.3153931-3-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: a38b1aaf-d819-481a-e68b-08de74453145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0lpMGhmOTlTRzQ0MkhGOHdzZjhSdkJxci9SRktiVFV0emRZSVluVTV5WFRF?=
 =?utf-8?B?UGJXTStKb1RTeEFBN3FrbUl2VWd2SVhqVTZnaXhJL2FNSXl6SFl6OGR5SjBK?=
 =?utf-8?B?UTR6NGFVQ1ZKbUF5NlQyb2dJMzg4OGFBNVdSVkE3ZWIydjRYYmF4N0V5c0dT?=
 =?utf-8?B?akVGSXYxTzRwbk9rNGs0TFZYWTdPZitrbU9uL0dLNUJrT3dHQ2FMRDMvZ3By?=
 =?utf-8?B?WVkyTUp2RWhuL2s4dVhET1YrU0lwNXhqUUoxb0NEaDQxZzFTSWxpQmtJN3dG?=
 =?utf-8?B?NXJEcm9tUkxNdXFKV3ZHQURuUytTUmNoRXYrL2JUMnFucjA0b1IyYXo5bTlJ?=
 =?utf-8?B?cmRzZ29ZanYzbzRRd09zcFgxc1k1RUdxNHErNS9oTmhBS2FTR2xUWEpDSm1I?=
 =?utf-8?B?T1JxMUYrWklyZXhpMS9RWWFvZlg5WWgxWWVnVm16eEx4NTZnd2lEaFJ5VXps?=
 =?utf-8?B?cXJZUGJXVjY1Wi9lRzBmWDlDRGptQlR4Sy9CcG5ZVG45OTRzSW0xMHg2dkxk?=
 =?utf-8?B?bWdNV3Yxcm00NDNLTkd0TE1xcEZReG5MSVpQQkdMRm5pM1dpWlRkY1hqS2pi?=
 =?utf-8?B?bE9uMW9GK2gzYjRnODRLSzgvWnBFdEtkeXpqTm9TSmF5ZUMxZXlHR2VNdHJj?=
 =?utf-8?B?bzJSUzA2MXhPQkZ4eTlvL0F4YTRpWTNiMWNBMDV4NkVXZHlwT1JaSVNoc2Rq?=
 =?utf-8?B?d2daaHZNRTdTL3RudnpZd2VTTXk3SytDR1QvSldDTU9JRkFLcVpCeEFhTXRH?=
 =?utf-8?B?MjB0YlNwMERWaHBrQzN0RjRRRit4ZkhBcHNucldUMndYUjExdThqNXZwKzFU?=
 =?utf-8?B?N1NxcnpJdlB4anVrek5zb01RdUpLVnlYUDduMkQwODZZbUZEVzJuanJKNVJl?=
 =?utf-8?B?emhSRGhmUjVpVXZsV2Y3TjJKN2phWmxJaVptZkxITUQ1VVM2RWwrR2FMa2Fp?=
 =?utf-8?B?d0tNVmhTQ3kzeUdoNytxckJkeFpURmQzenRYbW9INGgzOGhDZldaM2lNSTJI?=
 =?utf-8?B?NHZLUUZTUjAxc3orU0JaWloxTmNqZThwajZqbExpL3Y4S2EvSGIzRUxVQXBz?=
 =?utf-8?B?aU5NTUpPVEgxN05tVmZTVnJrWjMzMWxqUmRrakkvM2RtbnJhMFBxSXhEeXFJ?=
 =?utf-8?B?RTNYUEJJMlNicnBQRzUyMVNzTXBONkhtUTE0Z1FRQ096RnZKQm1rWDB3U0lj?=
 =?utf-8?B?Z3dHR3hicUl5WjJRTjk0UEJONGdSZkRGcWZQYjJzbnFyNktXNnhuYnBCb1hj?=
 =?utf-8?B?WDVhMGlHTkJscGxVVWJFYS9wMlJyZ2hNR29UeklDSWoxK0w3aFpOdkszNUIw?=
 =?utf-8?B?RSttS2p5S1ZGNFpDZ0hoam9FSkh3UGdqSllJeG8vWlhWSWQ0Y1B0ZDBTTG5N?=
 =?utf-8?B?M29MQjJQSmVQVHQvTGI3bWVIWjJoa1lzeEVTbkFPTC9EUlZ5VytGSzRmdnpo?=
 =?utf-8?B?bndkQWdGckhmSDBJUmwrQngzNCt0YzRxT0JEeTV2OUV5SlVqaTlMeWlOcThF?=
 =?utf-8?B?dlA4WVlzNmx6SVROVE1iT1ArMUxlbzlVS2orTlNWeloyd3pRdVFYQjNiUUxk?=
 =?utf-8?B?WjBTdm44MUhhdE9TTWFhbi9RZC9RSnJ0dnordjF2SzNJM0hDOHV6cGhFbWpP?=
 =?utf-8?B?WW9oV2pKcnZCcWJOVHE4UEpha2Y3SW5wSWdPdWlCSEJNN0pRNDRGMTBwY0or?=
 =?utf-8?B?WVNoZUU3TmlNdDhRbm1oOEtFbk93Nk51WTZFcDNjM0lBYjl3MkhkZ0VXT2lx?=
 =?utf-8?B?MnpNQi9XSFFrTXI0TkkrNHV4cUVYc2piaVhGUG0yeTE0akNUeTh1QTB4cHVM?=
 =?utf-8?B?L0VkVWloeHd6b09uTTZtWVJnWmphV0RUbGt0djV1SWxGd1dSNlVSdWQvM01n?=
 =?utf-8?B?TjBRTjRkSGFMTUJjaUR6Ty81ZEJyNmJIRk90dG1RUzVWQncvQUJlelZYMUhO?=
 =?utf-8?B?RjgvNXBSam92OTBndURueW1sRmlDc3RiejRrNW9OWCt2U1U5d1JBSDYwcFZj?=
 =?utf-8?B?cDJSNWUrWnpYOUIvN0ZPRGdHaHU4NDFCY3YwKzlRclhBNXArV2c2bDFVWjZ3?=
 =?utf-8?B?Z3AwcFZ6Y21sZDY4TTlNY2lRMDJOa3pJZmJnUUpIVDlEdnFOUllGN3VwNi9H?=
 =?utf-8?Q?t7l4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDlYYnpkeVhzUTdHODJCMkVab0VVb1ZJcHFqWktaZCs3a2pmWnNpYmJlQmVN?=
 =?utf-8?B?dWVaSWRiOGFnU2EvRnIwN2hLVjNZaWlrQUtZa1pUcU80S2hRelZTTXZub1pH?=
 =?utf-8?B?WDFDRmo3Wkx0V3FBS0ZiN1V4Q3gxczF1Q2dUTVFLSmZ5cW5zTVNoM29Uci9w?=
 =?utf-8?B?a1hnclRnQW42TjhOa01CenhHQUFoVUYzaHlxclR2L29MQ0VZSkRNTmFrSlVa?=
 =?utf-8?B?Sm1QMGdaT3U1dDlOSHh3U0VzRkQ2c3BKVVZjR2FVRHk2UVdSZFl4RjhoZENw?=
 =?utf-8?B?YWlpNElneXBYaVIxTHRoSkRubHFkbjI3cUV2UmtpWnJnWDM5aXlRdG85MkNy?=
 =?utf-8?B?MndoRGluNEtWUmFyc0YwY0x3VUpsVUNZVVNqZ1VpSi9HemEvb2xJcXY2dlFT?=
 =?utf-8?B?Q3lTbmtlMjlJQU5MSFpGTHdYYmhsbTlacFJxSDJOYmdwUEhaYTlSK0tjNlZp?=
 =?utf-8?B?dnduUGJNL1paNVJuVHlBQVhNOVhEa2Q5L1RwdEhYOVdkalFYNjUzZDFRb0JO?=
 =?utf-8?B?Vm9pOW5FVWx4MGJrS3YyL2lKQVB1N1BPeStWNWR6UW1hR0lKQkZpMmxxSUcz?=
 =?utf-8?B?TVdPSTNBNTFYZ1ViTEJQZE4reWxpd0pwbTlzbUZHMEQ0OHNnVG9xRWRlTmZi?=
 =?utf-8?B?MG5UMm5BWTE3TE1pSlgwb2s2QS9KZDRQdytOZEd6UXpDT2JzT2s2aGx2UHJR?=
 =?utf-8?B?MzFadEN1blRtRnVqZGZLajFobE5WcmhRVC9ocjI0eFVoOG52cTlEcFpkU0th?=
 =?utf-8?B?RS80TWJxTE11VkM5TjdKcHhnQ0ZqU0VYYVZPYXJLeHdWQlJ0S1p4YmdKTllR?=
 =?utf-8?B?eVVRcU9hZmVTY3FUV2JBcVlvVlJMUGx2dXZEY2JrN3BJZTRTcmtPRStlaTA5?=
 =?utf-8?B?M01WbDhFWFhJaXhPaW9XQTZObmtJeXFzRHFoa0NnZ2NHUytSdEdNTXJpUWh6?=
 =?utf-8?B?bzRhZ210STBKdjZ5T082TnJKSGIwMVNkZWVLd0pYdUs4RWN6ZWhIR1VqR05S?=
 =?utf-8?B?a1ZqVEpUck1GVWRZdjZnK1VVZWY1WCtxRlNMVGI2ekZjbHcyTFI4YnYrbjQ2?=
 =?utf-8?B?RDI1L2twdXlQKy9uMmpsSFlyYWF3aGEveVZOaWUwYnk4ZVNkakNOaThIUWRD?=
 =?utf-8?B?dzdyOXJSdVRxSm16MTVMdFRVVGk3QVlqUjZLTzVRRXdxYzFlUkVHdEFFMm1m?=
 =?utf-8?B?ajQ0SUNnbTdmNW1vd3loZzNOak9rSysycWdqekxtQkRoRmtjTW9hNU5razhE?=
 =?utf-8?B?cWJGS25tUk15YnVYWTVhcnV0R2d4Uk5mdXllKzVaOSt4S3RlOG1Yd0dyRGlq?=
 =?utf-8?B?bFlPcDF6SklUZmJweFJBaGhDeGo0TisrNzYxdEFENStMVGxMdVpBa1ExQWhW?=
 =?utf-8?B?N1puYk92N1diS0V5ck0yZTFUQk5veXRNV2YxQStKL2xRdS9PNWlDOU5yS1Bh?=
 =?utf-8?B?WlY3NTc5b0IxQUxSSGdYcmtEdGRiWFdrVWVSNjFIbmRQakd4Q09DSnJWOVRS?=
 =?utf-8?B?TWZQYzdjS1F4YUtZOG50a1Vxam1Wa1FtbGlnMDJEaWJYdWlyb25FSmNRZVdY?=
 =?utf-8?B?TlFSWUY1WWxmYVJXTHhiWUMrMURxTmVLVWRsaWpXYlpTT0t4dndsMDl2WEo2?=
 =?utf-8?B?djA3NEZZU3dSd1hhYmNNV0I2Vmw5am9HdEdVS1hadkFtcTQ4Qk5vdDlIb0Yr?=
 =?utf-8?B?cFRXS3M2Q3ZHVjJsREJKZHRLdCtENUdtZ2R0Vnd4UisyM3BHZVVvallWRGVD?=
 =?utf-8?B?c0FVNjBqSTFrS0ZYcVpxa2RZS2ZYUnVpdURhaGJ1Y0ZLbUhlOTZYZklSKzFX?=
 =?utf-8?B?M2Z5QlN0RnFjbzY3ekZ1NmpWT2pjZU9yUWgxWVp5RFF1amp2Q0p1RUpyNFVD?=
 =?utf-8?B?Y1hlL1l1YS9QdVhYNXN3T3V4c1JqQStndk9pU1lvdVo4U2xoNWFEQzQ3b0Mv?=
 =?utf-8?B?Skt4dGhZUU9JZWV1dnZVMER6MGdqY29mNGpLc1A5b0ZEbWJFemhBbzNXRWUz?=
 =?utf-8?B?THhaS1dra0hqalJlajR1RG9nN2U3MGZEaGJFWU5Nb1FWZ2ZCTWpLdkJJOTla?=
 =?utf-8?B?R0JTRTUyV2dkcm9WYUVOZXNmamQvbDM1SFE4dEdNRzlUMVhXbHgrRHA2NSth?=
 =?utf-8?B?RFVFbjlyRzVKWXdOT2F6UTNtZXI3d05qaHBrVHlHaDlCTS9NMUlHN3lET295?=
 =?utf-8?B?T3BQeU9yRjRKTUhFOVh6NlIvSVpaVVVLTDZmRTAxYThjaGpFSWt3cUk0cGs0?=
 =?utf-8?B?em1HcmhNQm5uazYyS0Rja2FFMXFnUUhnQ1IzQ2ZnUTJycmdpQUpVemwvMDZw?=
 =?utf-8?B?Z2ZyOStTRGFzNmVOWFBOWWRSQzhvQWNVWGIrZE1OakFvWkNtUy9ENWY2VkJx?=
 =?utf-8?Q?gEKkpDwsYgN5jHkMRP8eqjhabH35ixk1wyX1WBrLE4zoh?=
X-MS-Exchange-AntiSpam-MessageData-1: n0C8pYf2I+21Ng==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38b1aaf-d819-481a-e68b-08de74453145
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:09:26.5080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2zVps+QQ0O400HnS6fWT1AwfvbU7R8KRLI20/R3RwIfJmnPpfB2cmrnImCV+Hz/FHWf6EBW1rHzqHq4m6gIYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 32029193ED6
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 7:27 AM JST, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

(with one small comment below)

> ---
>  MAINTAINERS              |   8 +
>  rust/helpers/helpers.c   |   1 +
>  rust/helpers/list.c      |  17 ++
>  rust/kernel/ffi/clist.rs | 338 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/ffi/mod.rs   |   2 +
>  rust/kernel/lib.rs       |   1 +
>  6 files changed, 367 insertions(+)
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/ffi/clist.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc82a6bd1a61..0dc318c94c99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23181,6 +23181,14 @@ T:	git https://github.com/Rust-for-Linux/linux.g=
it alloc-next
>  F:	rust/kernel/alloc.rs
>  F:	rust/kernel/alloc/
> =20
> +RUST [FFI HELPER]
> +M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
> +M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +T:	git https://github.com/Rust-for-Linux/linux.git ffi-next
> +F:	rust/kernel/ffi/

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

<snip>
> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
> +    type Item =3D &'a T;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head =3D self.head_iter.next()?;
> +
> +        // Convert to item using OFFSET.
> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated usin=
g offset_of!)

`item_ptr` does not exist.=20

