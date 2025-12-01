Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A1C99305
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 22:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235AC10E496;
	Mon,  1 Dec 2025 21:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LejXlTnr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC79F10E113;
 Mon,  1 Dec 2025 21:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPsYcbQcCZrA6xmnxdiHJqdXuaxZCeMM/bMCHPx0DEFpID4+aFDK3nkEdecyjWXxxxfcsRoyMJa3/BFYJh4elEG8i6wkQBvrJWarfZ0oUPuBNXLmTTknICvfwez3utzvtB47uaXMQLx4TT/aguuTnoHf5bsMnOis+xZtmrnwuYW+JFexXGfGaFxvcUfd8Zic7vmTBbsROHKs+ZvRt+oUFmqfC5P2IhrivHA7wz4DfcEYE1LZ4B5nL8pU7DhmRze9bnotPHME8W2w+rrx4oiXY0AfLXbMK4Lf3QtfahrgHB6CIEs2Nno3hKYM95S96q1JJspA6G1xq3Ab40SZEkdFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G1sF9PjDBLBC8VDpOHl+IZ8mDanhpIdJk0hssWn4u0=;
 b=ThlC20U0OjjTTYXRn8FJJcglb/T4egS6ReU0j79KG+BSS5P269jFl4jNJ4z0m0NruStaiJU7kvMupkLPbFZJWxcvcj/69E2lxz0Blo7J/1eawplZuXXRc7yDeeeClosslJIsBpDCqmOrt3d7fMSJmE7q1ms98799HQG+u4iaDW3bixa7tkll55bFinZFIfDWpTJla8yHDPAk74LW1YFUtx+HbqjeR4PhnXejV5ymLrRLrhhv/+RT/MnPRnMABQGKKE1oUdfHTTNiXeulPIr5gq5TEXDpFtkKF1t/59W+9fYCZcaxsHBzfq+8HkSO6UpdICjI7dTATfpKiTPIHhvswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G1sF9PjDBLBC8VDpOHl+IZ8mDanhpIdJk0hssWn4u0=;
 b=LejXlTnroh9MX6GV1ue36wEFvoTB/D5WmUQJgSnou30KwIsbrcrnmZzW1Lv2uHqPLklKyrvRaZuIxKxiNWj2MhteQoEmOeb/Q+/qb/tb9w2eTb9WniDtvtU5qdKDfyuQdKOCp2E2oBV+Gtn6eRtWEn86C0bKYZv6MptIgCiFJavxhoEG3nMezP0KvU40yluueP+A7fPD8Jrg/OK+/avHVWCDIOOcNhFMz4W1KXp3iAYIJddnf/d3ywyWsX9WujvseBRckUpdAYqPArzJYNGl12isEEayKy15lolx+HjenMFbiCZAhF+ryzXLmNVMEA5dKj+XhdDQvtutweWxslhqXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 21:35:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 21:35:44 +0000
Message-ID: <55706e62-83ce-41d8-b0b8-320955cd73bc@nvidia.com>
Date: Mon, 1 Dec 2025 16:35:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <aS2zeUDqqbmYPaug@google.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aS2zeUDqqbmYPaug@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR18CA0023.namprd18.prod.outlook.com
 (2603:10b6:208:23c::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 6956256c-169f-4662-a81a-08de3121958a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzM1TmRBbC96aHN0dWZtbCtGbCttZ25OOE42Ujh5R1BXS1hMSTJ6TXpvZmht?=
 =?utf-8?B?RUxzaTlGTFR5dWpuUm5ON0xKOEhuQW11ZVZkQVVlb2FLVDRzUjlvcUdPY2lV?=
 =?utf-8?B?Vm0zRjZ0OWp3bTVub1JFbE12aG5NVnNKamljYi9LUlFOZzk5SWw0bjk5SDE4?=
 =?utf-8?B?V3licXhLRUVFbkcxd1M1a0xucHdHYWdNY2dWOUhZdzlqWjQzRXhFWVBJYVE5?=
 =?utf-8?B?Z1NMTk5NazhIdjdteXBJR3hYcWdVUExrbEtLblZGRFgwWXZTa1pIUXpFUjVo?=
 =?utf-8?B?SnhTS1J4QXh6aGxFUnNWeFpTQkthQTV3VVBWSGl6c3FDOUNhK2RiZkZxUHlC?=
 =?utf-8?B?NmtFa0YrSTl3TkR6TVlxeU1QTXlVYms0ZmVDRlRHNTdaaEx3am56Y1Q1UnJR?=
 =?utf-8?B?cU5pSm9HOEdQQ0VCUndMc3luakZjVUYvTDk4SlNPZjlSWXd0dGE3dWlFamt2?=
 =?utf-8?B?TW1CQi8yWklvaCtLMXM5ZG1SeHI3V1Bpc21oc1NDWU1SWGZzSHhxUklZeHhk?=
 =?utf-8?B?eG9aK2xBNXY2bmNGbGUwYkNyTEJ5aTBqNm1EWXRISmRyU081Qk1mK3lGakJL?=
 =?utf-8?B?ZCtaQitQU3k3enhmcm5FNmd5T3h2TlFwaXI4Q09rL1hSSXN4blNrcnhhd3pl?=
 =?utf-8?B?eGxaTHF1T2U1OHFKRG8xSHovaVp1U0lhZk5ldXRkTjVLS1czYkhUd3VvVkNu?=
 =?utf-8?B?ZUdnLzlEOExGQUpzM2E3OFFBME1LNWxteTRmSDEzQ2w2N0FqelF2VlhmSGk5?=
 =?utf-8?B?bStxOXV0ZDlkbGZJd3REdGVmQ2xqNFNlUlI4T1FBNXcvOEVRQ1FuS3BmR3Vv?=
 =?utf-8?B?SnQxRWE2Y3I2d2tCRi9FbStEM2VoaXY3czlUcGpiODdPZ1hFVzJKRFQrQ2RZ?=
 =?utf-8?B?ZmF5OGVJVEdPVldnUno2MVJqdEMzWG11djNSZFhMSWtQL2IwWFFtSlF3bTRy?=
 =?utf-8?B?Yy9aZFl0WTBrVFpGRXYzYXgreWsyMHJ5b0gvUFdkTlBBNWV6UktoTmFLNWlD?=
 =?utf-8?B?ZndIR3ppQkE5TlhOc3J2aFZBa1hyVFdMWjd3cG4rOXRrR2pnb05aVWgvNVpI?=
 =?utf-8?B?UmRtS1lqWFZDa0dFNWhMbkN5VHlNQ29KaDhVWkp4dm5TSTZKOXlmNUV3ZTlC?=
 =?utf-8?B?Ny9GZlZSM0UyVk5TeHY4VFFYbHVRMWpNWjJJNWc2MFIwQm43cTVGaWcrWXUx?=
 =?utf-8?B?RzRzczJRS0ppL05YUlhEaHJpVHRsZmczc1pOZnQ2YmhTMitkb3NSKzhYMTQx?=
 =?utf-8?B?RkRJRXA1NkVtUlgzSS9PNXhySFJhdjRlMFp5QWZqUThyTFRjeGR3S1RtcUN1?=
 =?utf-8?B?ZzRjTmJEdUpMS2Vta0Vqc0FyaksvY0ZwbldrQk9xWVhvY0hueXY3dFduMlNu?=
 =?utf-8?B?bzBVTzRhT0gvWmd5TEg2dDJKUVFSMzZRZDk1Z2lZK3V4b2FNZi9QaUVSUUZk?=
 =?utf-8?B?TTlzMEdTRTZZN1pIOUpuSnhVMEd0T1pCanlGeEZHWTlMbVhaK3lPV3FoeGRB?=
 =?utf-8?B?VzFBdEY4MGV5YnVSYitVdWhkK2ZyaUNGUE56TmV0UkhHNFdZUWh5a1c1TGRI?=
 =?utf-8?B?S09TUloyM2o4SnRaNGd6ZWpBbGdBMUJKSzYzdlIxd00xTXJDUFdMYVJEeUlK?=
 =?utf-8?B?N1hrTDN3K2FwZDEya1NvdkpiSkd1bzhnRDdJZTBERHNSaXpxVzJ0dEhQT1Zs?=
 =?utf-8?B?UFZ3TTYrVVdkSGU5YllIV0tYWTZCTG96QVRJUElpZjMya0FmZSttSEl6K1V2?=
 =?utf-8?B?M1hnU3pvTWN3clJKalF0TC9IdXpncE9yQUJJWCsxdGpXenozZmsrZTZkM3Z6?=
 =?utf-8?B?bTVvMVQvSWlrQ2pwSk5wRHp4UFN6UEMySnJZVlZBa2c5ZHRsVytYdkpCWmM0?=
 =?utf-8?B?TlJ6eGsxWElOK2JDL3ZxVjVkdkJ2eTN4MGV4c0Z4Ulh1Z2owQjcwOUx0YnRV?=
 =?utf-8?Q?6M4JpX6xUHD/muDXg1aeLcMxR7SWmlVe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFRpMWhSYlV0aS9ZR2Y3R2FTaGM4UFVFbEhDWHBhd3I2N29uTHZxZTY2eTli?=
 =?utf-8?B?bVNNRXJkdjhEYjUzUm5CaDZTZGZpS0MxMkJ5aFJ4cENFdXNDTWVJWGFCMFNB?=
 =?utf-8?B?bEZXa1dLK1ZOQnVDb0VyaE52dUpuemlhUmVFVnJxL0ZoRDQzbEdGbHliSDYr?=
 =?utf-8?B?N3kwNzZhbW1MWlVqdndROCsxdjgvb081OXh6aHg0R3NLVWgrbFZDeFQxSHQ2?=
 =?utf-8?B?WklHbEFtTkljN2RJSzRjcTlCM2JjQzcvUzNZeC9ld3RNZ05wZUF2VHpjenJ2?=
 =?utf-8?B?dVZLYVYwREJ6SE5OVjRhdlVQT3pZdktTZUZHR1IvU3ZwL3hrbGVlZStaUnYw?=
 =?utf-8?B?YmNKbG0xTndkZE5kYmpKMnFqc0ZkMDFiWTJ0ZXMvNzE4bUJmejhyVnJRR2JI?=
 =?utf-8?B?L2ZWT1BvNzRCcjloOVhSRVc0TThNMnJQMkhobGE1a2RtQ0kzcDgreDRqSmNC?=
 =?utf-8?B?Sjhiay9hS2EyOW5ZSmRMWjNOOUM5bVZlbWgxcDYzLzN2QUw1R2JnRjNTWWV2?=
 =?utf-8?B?M1VlcWdHU1Ric3FSYzNWbnF1SEQySmpPSW1QV0wyS0RUNnpSQzBQVVVub2NW?=
 =?utf-8?B?NzV5R1hzRm4ydU5yQUIwTDY5Z1o4Z1lCQ2ZlNkxOZUNIZVd6eS8xUGZaOXJG?=
 =?utf-8?B?Y2ZQTksrVjdiaGJWR3ZJZUEveERKa3FCVWRiRWUwczlSV09UcUJSalp1Y1lh?=
 =?utf-8?B?RjhPSkdxRVh5RWhZZ2x5a2xiU2ZieWMzSDJiQUJaVElzRmgzd1dPNDNKc0FK?=
 =?utf-8?B?eUJ1Z2xjV2tKLzNpY0c4dUY3akRDa2NUVGluRDZVVzNEYXlkcUREWVZ2dzRG?=
 =?utf-8?B?cUZ2R1BSRG5GSit3a01kSlA4ME9jblh4UG8xWE43aHp6R2ZzZ2VuQ2FEblA3?=
 =?utf-8?B?OEwvcm1CcjBzdXFyZFlLa0xxUzhKS21PYVhDbVdhMDV0SnRtRDF3QUI0bGx5?=
 =?utf-8?B?akwxSE9hVG1NVDk0UVlXdzVQbHJZMU16OTR4cDRwTlVaSHRha0xUZE9ta2F5?=
 =?utf-8?B?d0FlNFJ2KzBKeittME0vODFHTER1aVc4S29rOVJzSWpqUjBQUU1TdElaQ1VU?=
 =?utf-8?B?aWFuNFM3NG1MczkrZWplcGpTd2t2cG5iTE4wRWlHd2lVTUFQd1ViN29tOTBn?=
 =?utf-8?B?VTZqUGlUMEhOOWFnZkRXTWFocmMyQUdNK1FLUEgxVHJNak1ZODNOem85aTRy?=
 =?utf-8?B?MExVUCtmY2ZWSEdieFhTRFhEQi9UanFINStrOGhvQmNBcXZ6eTExdUlOQWNT?=
 =?utf-8?B?SkRjQi9HL0M5dEhKdGdkalJKcE5ra3IwN2RaU3dvbENFcVRXczIvL2pFK2pQ?=
 =?utf-8?B?NzdpZ05FTWZ5T3dOUG9lOG55c1piQmpCN2RxYU9RLzZ3MmRHSUVCcStvaVdT?=
 =?utf-8?B?QnEvU1kwaGZIR0dkU0JEcWpjRXNaSnJkcW0xL3RNNEdPVFM1TWg3dDA4MDRj?=
 =?utf-8?B?MHQ5cG44K0MzVnIyWWNIeFoyQnloblRGY3JHNnlxVHJrdU54aWZCdk91WUtV?=
 =?utf-8?B?ZEgwVzZBUlNBaEV3R3JvRWRCdzRUdmlBM1VTdFVTVERGdTkyOFNCamMvR0hI?=
 =?utf-8?B?Y2hzMmRPQk52NldHYUkraVFtVVZ5MG5Vc01CSFY4ajFLKzN0b2RYS211WVor?=
 =?utf-8?B?SlpQSjY3TmlNN01DMDRaRVN0OG1NNGRjMUVZMjkyYTlFVnFJbjdkYWRWbHY1?=
 =?utf-8?B?WEpXeUI2QUpaVENDYXY0akVUdlo0TmxpRXBJNHlMd3c4ZTlnNWFZRkdIV3NW?=
 =?utf-8?B?MEo1U2ZEcVdORmZDM2hpWFZKRStJcWZXUVA1dXVvSFhQMVh5Q1ErN1hlWWxU?=
 =?utf-8?B?MVIrYjZNNmRZb3lSWEdKbWo5WURTVXhRa0ZLVXBZVEpMVDhwTUc5bCs1SEZr?=
 =?utf-8?B?RU5WWGNWbUVYTzZEcVhJN20ySExZM2NMamxwYVNFSTJpNU1wRWdXdk5uWGNo?=
 =?utf-8?B?Ry9YUmhwVVArNndjSWh4M1JYRW1jQlo0NFJsN0NTWVRrMFYvNGoweEJ3OW5E?=
 =?utf-8?B?dmc0SHh3YjE0WkQ1RWZjZERLODJnV2tXRk9Wc0dsazkza2hKVUZQNFlFbkVF?=
 =?utf-8?B?SXQwdVNmTCtmYVA0SGdZaHNDdG5MT05DZ2M4c3g2SGFneEZkdHF3UDFRK3RI?=
 =?utf-8?Q?Zox0OWXDdEpl2sYZeZZ8RPVTV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6956256c-169f-4662-a81a-08de3121958a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 21:35:44.7816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f30W1342lovf8f3Ko7sS5BgPIKR/441jVeMzyI1YbNBj1RQYPXexrmf1WBLvxqVtJeDoIM+F5bF1OfdApESoPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
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



On 12/1/2025 10:25 AM, Alice Ryhl wrote:
> On Sat, Nov 29, 2025 at 04:30:56PM -0500, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list_head nodes and high-level
>> iteration over typed list items.
>>
>> Provide a `clist_create` macro to assist in creation of the `Clist` type.
>>
[...]
>> +//! // Rust wrapper for the C struct.
>> +//! // The list item struct in this example is defined in C code as:
>> +//! //   struct SampleItemC {
>> +//! //       int value;
>> +//! //       struct list_head link;
>> +//! //   };
>> +//! //
>> +//! #[repr(transparent)]
>> +//! pub(crate) struct Item(Opaque<SampleItemC>);
>> +//!
>> +//! impl Item {
>> +//!     pub(crate) fn value(&self) -> i32 {
>> +//!         // SAFETY: `Item` has same layout as `SampleItemC`.
>> +//!         unsafe { (*self.0.get()).value }
>> +//!     }
>> +//! }
>> +//!
>> +//! // Create typed Clist from sentinel head.
>> +//! // SAFETY: head is valid, items are `SampleItemC` with embedded `link` field.
>> +//! let list = unsafe { clist_create!(&mut head, Item, SampleItemC, link) };
>> +//!
>> +//! // Iterate directly over typed items.
>> +//! let mut found_0 = false;
>> +//! let mut found_10 = false;
>> +//! let mut found_20 = false;
>> +//!
>> +//! for item in list.iter() {
>> +//!     let val = item.value();
>> +//!     if val == 0 { found_0 = true; }
>> +//!     if val == 10 { found_10 = true; }
>> +//!     if val == 20 { found_20 = true; }
>> +//! }
>> +//!
>> +//! assert!(found_0 && found_10 && found_20);
>> +//! ```
>> +
>> +use core::{
>> +    iter::FusedIterator,
>> +    marker::PhantomData, //
>> +};
>> +
>> +use crate::{
>> +    bindings,
>> +    types::Opaque, //
>> +};
>> +
>> +/// Initialize a `list_head` object to point to itself.
>> +///
>> +/// # Safety
>> +///
>> +/// `list` must be a valid pointer to a `list_head` object.
>> +#[inline]
>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
>> +    unsafe {
>> +        (*list).next = list;
>> +        (*list).prev = list;
>> +    }
>> +}
> 
> It may make sense to move such manual reimplementations into the
> bindings crate so that other abstractions take advantage of them by
> default when they write bindings::init_list_head.
> 
> Of course you can still have a re-export here.
> 
Where would we make this change, do you mean to rust/helpers/ and have it come
into the bindings that (like i did in v2)? Or do you mean move this function as
it is to bindings/lib.rs?

I am Ok with either.

>> +/// Wraps a `list_head` object for use in intrusive linked lists.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `ClistHead` represents an allocated and valid `list_head` structure.
>> +///
>> +/// # Safety
>> +///
>> +/// - All `list_head` nodes must not be modified by C code for the lifetime of `ClistHead`.
> 
> So if I modify the list from Rust code, it's okay?
> 
> I think the actual requirement you want is just that nobody modifies it.

Yeah you're right, I will change the phrasing.

> 
>> +#[repr(transparent)]
>> +pub struct ClistHead(Opaque<bindings::list_head>);
>> +
>> +impl ClistHead {
>> +    /// Create a `&ClistHead` reference from a raw `list_head` pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    #[inline]
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
>> +        // SAFETY:
>> +        // - `ClistHead` has same layout as `list_head`.
>> +        // - `ptr` is valid and unmodified for 'a.
>> +        unsafe { &*ptr.cast() }
>> +    }
>> +
>> +    /// Get the raw `list_head` pointer.
>> +    #[inline]
>> +    pub fn as_raw(&self) -> *mut bindings::list_head {
>> +        self.0.get()
>> +    }
>> +
>> +    /// Get the next `ClistHead` in the list.
>> +    #[inline]
>> +    pub fn next(&self) -> &Self {
>> +        let raw = self.as_raw();
>> +        // SAFETY:
>> +        // - `self.as_raw()` is valid per type invariants.
>> +        // - The `next` pointer is guaranteed to be non-NULL.
>> +        unsafe { Self::from_raw((*raw).next) }
>> +    }
>> +
>> +    /// Get the previous `ClistHead` in the list.
>> +    #[inline]
>> +    pub fn prev(&self) -> &Self {
>> +        let raw = self.as_raw();
>> +        // SAFETY:
>> +        // - self.as_raw() is valid per type invariants.
>> +        // - The `prev` pointer is guaranteed to be non-NULL.
>> +        unsafe { Self::from_raw((*raw).prev) }
>> +    }
>> +
>> +    /// Check if this node is linked in a list (not isolated).
>> +    #[inline]
>> +    pub fn is_linked(&self) -> bool {
>> +        let raw = self.as_raw();
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe { (*raw).next != raw && (*raw).prev != raw }
>> +    }
>> +}
>> +
>> +// SAFETY: `ClistHead` can be sent to any thread.
>> +unsafe impl Send for ClistHead {}
>> +
>> +// SAFETY: `ClistHead` can be shared among threads as it is not modified by C per type invariants.
>> +unsafe impl Sync for ClistHead {}
>> +
>> +impl PartialEq for ClistHead {
>> +    fn eq(&self, other: &Self) -> bool {
>> +        self.as_raw() == other.as_raw()
>> +    }
>> +}
>> +

[...]

>> +impl<'a> FusedIterator for ClistHeadIter<'a> {}
>> +
>> +/// A typed C linked list with a sentinel head.
>> +///
>> +/// A sentinel head represents the entire linked list and can be used for
>> +/// iteration over items of type `T`, it is not associated with a specific item.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
>> +/// - `offset` is the byte offset of the `list_head` field within the C struct that `T` wraps.
>> +///
>> +/// # Safety
>> +///
>> +/// - All the list's `list_head` nodes must be allocated and have valid next/prev pointers.
>> +/// - The underlying `list_head` (and entire list) must not be modified by C for the
>> +///   lifetime 'a of `Clist`.
> 
> Here and elsewhere: We don't generally have Safety sections on structs.
> It looks like these should just be invariants.

I see, Ok I will move it, thanks.

> 
>> +pub struct Clist<'a, T> {
>> +    head: &'a ClistHead,
>> +    offset: usize,
>> +    _phantom: PhantomData<&'a T>,
>> +}
>> +
>> +impl<'a, T> Clist<'a, T> {
>> +    /// Create a typed `Clist` from a raw sentinel `list_head` pointer.
>> +    ///
>> +    /// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
>> +    /// the C struct that `T` wraps.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
>> +    ///   representing a list sentinel.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
>> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
>> +    #[inline]
>> +    pub unsafe fn from_raw_and_offset<const OFFSET: usize>(ptr: *mut bindings::list_head) -> Self {
> 
> I think OFFSET should probably be a constant on the struct rather than a
> field.

Yes John suggested this too. The type signature becomes complex/ugly (and you
guys know my hatred for const generic syntax :)). But ok, since this is mostly
hidden by a macro, I will make the change :).

> 
>> +        Self {
>> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
>> +            head: unsafe { ClistHead::from_raw(ptr) },
>> +            offset: OFFSET,
>> +            _phantom: PhantomData,
>> +        }
>> +    }
>> +
>> +    /// Get the raw sentinel `list_head` pointer.
>> +    #[inline]
>> +    pub fn as_raw(&self) -> *mut bindings::list_head {
>> +        self.head.as_raw()
>> +    }
>> +
>> +    /// Check if the list is empty.
>> +    #[inline]
>> +    pub fn is_empty(&self) -> bool {
>> +        let raw = self.as_raw();
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe { (*raw).next == raw }
>> +    }
>> +
>> +    /// Create an iterator over typed items.
>> +    #[inline]
>> +    pub fn iter(&self) -> ClistIter<'a, T> {
>> +        ClistIter {
>> +            head_iter: ClistHeadIter {
>> +                current_head: self.head,
>> +                list_head: self.head,
>> +                exhausted: false,
>> +            },
>> +            offset: self.offset,
>> +            _phantom: PhantomData,
>> +        }
>> +    }
>> +}
>> +
>> +/// High-level iterator over typed list items.
>> +pub struct ClistIter<'a, T> {
>> +    head_iter: ClistHeadIter<'a>,
>> +    offset: usize,
>> +    _phantom: PhantomData<&'a T>,
>> +}
>> +
>> +impl<'a, T> Iterator for ClistIter<'a, T> {
>> +    type Item = &'a T;
>> +
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        let head = self.head_iter.next()?;
>> +
>> +        // Convert to item using offset.
>> +        // SAFETY:
>> +        // - `item_ptr` calculation from `offset` (calculated using offset_of!)
>> +        //    is valid per invariants.
>> +        Some(unsafe { &*head.as_raw().cast::<u8>().sub(self.offset).cast::<T>() })
> 
> Can be simplified to:
> head.as_raw().byte_sub(OFFSET).cast::<T>()
> 

Fixed, thanks.

 - Joel

