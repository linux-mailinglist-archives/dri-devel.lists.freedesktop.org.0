Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCEeC1j/pGmpyAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 04:09:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CB1D29F3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 04:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BD610E41E;
	Mon,  2 Mar 2026 03:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LKm4MB5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE43E10E41E;
 Mon,  2 Mar 2026 03:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYc+nUEE6CUU3fNoLWpHHxhssppsyslZy1AJ5e3qH0V1WfepRMUCESfUw2Z/pBikk1G6cYRAaFrXKF/yn8I04D33GRZOapcHQSeRG0e8OJJonYOAuuzsJb9LQJvTRGOk3v+iOQKJDfpB4LD2WdmyLCIkCUyBeCuIj4+uo7PCexX8CT5R2GJBurRn5LFO7rERmGXiS+O1gpvNlP2RFYWNbY2de54Bnl4HUCNznytimIBktl980Dgbfvyl1FJiR7lTetcs4x99fcVtBkLQW4MuseqTLg5x9b0CbcwEolJzKV/C3DNf9sbdLLXCWRcvN9weaM7yjdYur9rZFZ8CF84QmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq9tkvekJxuJqKIvLun0XvzIi8ICZkM1KRnAYrDfQwE=;
 b=u1+2b33+MjvRrqVDP1jU6JmHaV9h4E+deYRWSK1Z9ItAy8SysD24M7ufe+KL0O613StqW50oWq1Vyjebf31vidrC+JSs5HoIvnZhIcl8yMKEIV8wXqwYYqEBKQQOyEo/a5NNDJ0RjHv5oA4PtS6/0UvslKKM7UTRubWk8YQkdS8g5rmxKBYV6K2iyKAe0Lk7I1Bm4+Svv21LvpUWXav/44sAdG7bW2ln2cQOhTMac0ODO3Lo3Xx16zWbeAgjxNCT4iWPIdlj13CijUCbCxOAnRkSwhfnQUPfokJQYixFN4sZHv3DoHgEcyFP3gWGLEYWIT4pdm0JptR1Qy1CDEbX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq9tkvekJxuJqKIvLun0XvzIi8ICZkM1KRnAYrDfQwE=;
 b=LKm4MB5aUPZO5AjT10Pdn1WWEM+mCyAbSbIXzR+63BSiiYEKYmYr6ysYrrc3mb3HoVPSSiUOKWUwk2F+oNGf58jxL3DiFOAU6p5SdWak5tB3QaQ5IcrGnB/5OUZFc1JPTXQ1vRGx9KD0pga6Reu/HMyzkFJjpk+V8+jdmxJvxx8TM1kUhJpdwQk9ZBgWNxfkvZaOX+6XjFXhlH6xbLtwPy/tary/zi5DbBptqTJjn7qlvXTxxGGJigW2d8vpZe6zuUWeQj0qyFHpb38GTOmLBbgQlLN7TWtkyk0DvCdB5xpd7s3LPE3jiVc1CJ4uOhylwez60L8b/9lEKiK7L5f8Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPFD22966BE3.namprd12.prod.outlook.com (2603:10b6:f:fc00::662)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 2 Mar
 2026 03:09:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 03:08:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 12:08:56 +0900
Message-Id: <DGRYS9M0DSP3.35OPMTWI9KC7S@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <joel@joelfernandes.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v8 11/25] gpu: nova-core: mm: Use usable VRAM region for
 buddy allocator
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-12-joelagnelf@nvidia.com>
 <DGRGNLACDJI2.1JFEXE1GL1ZVM@nvidia.com>
In-Reply-To: <DGRGNLACDJI2.1JFEXE1GL1ZVM@nvidia.com>
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPFD22966BE3:EE_
X-MS-Office365-Filtering-Correlation-Id: 923d7f60-4045-4321-850b-08de78090cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: AiRIX7lskuu+BJ39skbJ7h5ZxI1b0Vfx4Lfs5mleYaYz5octU9nFWKD9/q5mut3QQqJnQbaUzL1KSd1bvLqjae4mmynoTy0Kvf3BV+wBhuLjmo1S62bVagt1WqgQqc+JFT7V61lvbE61lrFqyZmaJQPYnIbdGurX82902EkWEWs24J8sRmB5YhsPjTwoxfXieamQSPogbwfxCwbTvoYYAFoJbnje8gQ+UMFYJSUJXfTFe04QTl9a07LCH37cTdBglI0Tx3qebmGh/mn5Vt8fyUAP3xr8CQgUE9Bwyvwb51eXDtRVmHWEsp/W+D603PYvwpm4gDCgFm2mIJ0uKIRlS/vSWMLTz7n6hHJc0x4bLxLhk95+A7+iMZ+/VaPMHn+0mRqIF5+Fku8BkL0z1J2MdPRvp+S2Ze9+5wtSojqL4Vbaim6ziPOBSdVp5sB6PQIO8BL3Xng6ZYmxrgxfUiZw3Q+1ifB9QqcsSpTJrA41hPFNl0TLQ35ltAMch14un5DoSMOoqRuouWfjuNO/9EUfjd6YJVhJgtWvAyJfcMRGrMpyr7IrLn+N7RhEC/1KpRBkrstpU5X3wmekHOUrOXZV4T2V8vkjc6yWMLG4iomJ6OCLXB4E7ZwSsZDef0oQOOHPxLMQ5aqtYxBTpT7NfsCPghvCdQqIXu+0aJXSKg0VG9VYUfYwdCfaIsUzb81JMBti4BTF0C9UbSN5mkKNFquecthDt0a5CQWL/1nEA1grqq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmVWT2VZdGFTTG9HNUxiaWlPWkVIbWUrS3FQQkR5c003Nk5lT2JYN3RSbWtE?=
 =?utf-8?B?WVhhOXk0bzBYMnpDdmJPYUE2dE1SSWkzZmovdHNJRzFoOHV4czhZQ1lCZlVN?=
 =?utf-8?B?cVRYc0V2YkVUUWtjejdlQk5KN1I3MDFtbE42S055blY2L2RaSmRsRlp5TjVL?=
 =?utf-8?B?dk9YODgrVGJyVEQrRWYwNFhYNzBwT3MvczZaQSt2eUpkU284eVliRWo2ekJa?=
 =?utf-8?B?TDY0bEU1REF4NTZCK29XdlRhTEpkVXUwUzA3YlJYTDhPNU11TkVGTU9SanAr?=
 =?utf-8?B?cVJBK0dIV0pLSlVaMVNjS1N0YzBKcnR2YkhkT0dLZzN0N0RsdnFrSWVwWHg1?=
 =?utf-8?B?UXhrRG1lYndNNHViV2p0dHVOUjBYQVpKc1hMM2tkblprZHFYbHhqTE1qK2ZW?=
 =?utf-8?B?SWIrUFhrb2JLSkcyWjlJQytMUmcxbktZMllxWnFQbHpxVXFET2tzalRVQVJi?=
 =?utf-8?B?ekl0dkhVU1JlMDFHUUE4bEtRVjNhbXE3aGxXTmdUVFd4em14Y0RvTEpjVUJz?=
 =?utf-8?B?WXFCUXFQVXk1YmFhV2VrS1NDYVphdFhDME9CcWkrUkZibkFEVzF1eUM3MVl3?=
 =?utf-8?B?S2p2cEx0MU5PUDBpWTFIdWxhSnoyTmJxY1QwTjhGemdoNzc2b2duYWx4YVBi?=
 =?utf-8?B?VzdTdXpDQjlYZ2xhd1owUnVYSEJrdS9nalhmUmQxazFXZnA1Y2tqYXF3V05n?=
 =?utf-8?B?dVM1NjRsWUJvcHNML2ZmSXk2R1BIUy9BQkpVZ20wTUhTSVRZR0xoaXMvbVVk?=
 =?utf-8?B?eTFwdWp5L1d2dE5lU1JVTVJ5VVViMXdjcVVTUm9MOHpRdUhueDE3Z1NmSFNZ?=
 =?utf-8?B?WFUvT2FGazlpelZTSTVxTlVReXZFUW84eCtQRzVndFhDaGw0YjlmWDV5S2dC?=
 =?utf-8?B?OHlCUDhpMlo1Qy9FaVlXaXNKZG5nV3FGOXVuRS9mN3JHYXR4YWpWMjMrVlNK?=
 =?utf-8?B?MUg2b1RDRnVSa1pVek91MkpBV2ZqWUVhZkJnc0JsRkkzZkRmYXZEaDlDRW5M?=
 =?utf-8?B?ZkRYTUZxK2ZBVjBnT1RnY2Fxb2NZTEZVdDZ2blltNmd3RWpmS0tTd0dzL1NN?=
 =?utf-8?B?aS93ZHZpL01SMnVmY1NyVWptcmhxRWJ5cGl0NVhHN1RyaStaL0ovei9OTmpD?=
 =?utf-8?B?cmxGNWJsNXFnRXBZWjdrODk1WHBHZ0FJaTdrL1o2M3lZUkRHUUs0bk0zUzNU?=
 =?utf-8?B?Z2pOUkExaU0vMWQxRnhUN3lFZDBGZ1NOQXo1Ym80VTBySXhZUjhid25RQzZq?=
 =?utf-8?B?eDZPSVdzK1hMdm1nZjVsaElyYUZZM2JXUFRyV25CVXZWd1VHeld1MTlHVmFo?=
 =?utf-8?B?cHBJT0NnSWRLWnFVOVJScDROZVg0a0xaRmc0L2NxZ1luM3pHUXFtM1FjSkk5?=
 =?utf-8?B?S0twQmp5NE5YOGhZZDRhdUNmV05GUFdaT1l1cnZGcFFLSFlmMFRsNnMvc1NW?=
 =?utf-8?B?OUNseVdoaHpON01UbzFQZTFTYm1aYjEvZzdxUGFLbk5INWlNZmJ2bjBlcERR?=
 =?utf-8?B?ZTZKOERlZmcxejRzWGYwN2svcUR0ZnFqUmx5aHhMMXhTOGs3QzkwT1ZYWXNC?=
 =?utf-8?B?dzR6VnRvNkRZaGFqek9XQm9yK1M1cFR4RVdZTUVBZmUyKzlJS3ZsMUI5aDl2?=
 =?utf-8?B?U3Z4K1IvWFV5V3A1c3dBVkUyWlFXcUZVUVpXOGZiZzBEOHlwbUpuZXR6MDUx?=
 =?utf-8?B?OXhaVjlINmJEL295Z29GUVNGRnMzeFh6RFVQV0RMUzFaczVram9XRk1JRXhz?=
 =?utf-8?B?MUQrYlV1SzUwaTIrNDJzcXRZNG9lYzNqOHBSZ3B4VU1VNDhPa0Jrc3FCR3FT?=
 =?utf-8?B?K0dSd0E4anBMbml1MjV4MnVvOTFZclhneW11K2dySU4zeVd1cnptMTAwOFhr?=
 =?utf-8?B?aG9Ic3A0dHFFcUtzVmc4MnZSalRHKzF5QUd4ZTFyd3A4RkNFbXAyL1pjWmc2?=
 =?utf-8?B?M2JFdFhlY3orYjJLc3kxakFYcUtEK2I3Q3MzV2ZSUTBpcXFOa3RkN3hWd1Ar?=
 =?utf-8?B?NXNjM0hCdGljM0JvSkxTSGVpMjYwTXdKR1NjeGlMdkZUaHQ0T0VBbmoxenU5?=
 =?utf-8?B?QTNLVkpURjBnMGZZS1huWmxKYURQMXk5NXdFK1p1ZVVDblgzaHBOYlRUSHY5?=
 =?utf-8?B?NFo2emdxUTUwNkxldlp5ZXJBaEFkbHpkMnhDdFp3eXdLTmZoKzdpZm4ydmt0?=
 =?utf-8?B?blkzYUtteElyWVlJd0tyT29sVDlyNDlML0VNRzBCTFdMWndkaTdvcnp3THQx?=
 =?utf-8?B?clAzdEdKNUFoa1BqTHJpcjBENnNsbGZtSDlBZWJWTEFkTEtXT2VEY2NmejJm?=
 =?utf-8?B?MlFpaUx3L0c2akhKc2tOWFZmVCtHa1l0ZHZhOWFYNjljV0lDalY5Zjg4VGhM?=
 =?utf-8?Q?1hdb4EualL+JAAyzsar4WMujj5lH428nj0/kNXRa+UZqt?=
X-MS-Exchange-AntiSpam-MessageData-1: ujYxL54uaVZQ7g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923d7f60-4045-4321-850b-08de78090cbc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 03:08:59.8756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7gc4UDonRJeRUqfgs56eNkUBOxxKmPD0Yu3RczvFN3c2TkjVsGGUKHl44+jZLFx2/4MY/5g8NZBfXOnWh/qjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFD22966BE3
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
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev,joelfernandes.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 8F1CB1D29F3
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 9:56 PM JST, Alexandre Courbot wrote:
<snip>
> This is all the better as `usable_vram` is added as an `Option` in
> `FbLayout`, not because `None` is a valid state but because `FbLayout`
> is already constructed by the time we obtain `usable_vram`. So `None` is
> just a value that tells the caller "please return an error". Now we can
> remove the option altogether, drop patch 5, and have `boot` return the
> error for us if `usable_vram` cannot be obtained.

Correction: patches 3 and 5 won't be needed anymore and can be dropped,
it seems.
