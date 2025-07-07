Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6634AFBD6D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8C710E570;
	Mon,  7 Jul 2025 21:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ZYurT6yI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012065.outbound.protection.outlook.com [40.107.75.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4FD10E44F;
 Mon,  7 Jul 2025 11:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRN4oari+JBA4YngN0c+2eb9AhEr3RMlu6a27wGHlWHkIrHTOHlCEIVc+dQnwjpoG0m6UiR58AbWACI8uEubnA0v53d2mSQsfZAaPN/wF0omNqW0PPSA/tWKghtT7o4Fc+FyKZGejzdip8k2E5K6K10xcA0TNFf0veJRwSDgKlZF7/Jm7RZYk+fV7YgWJ4b89JhwqItxLHXErLjcUDfQ7Hsrbf8VRKixoYtXQwEa2Kpwsv41Jjn8NLSiRBxH2QqWKmxjIDLei39dfdUIY1VlPLbDiENEUJqus3FBNko7+FawgtZGrUoGVeMyL0sZUGPbLnW15ZjJprz5qba+Gm1meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksBfp2AIWByMov8+43Nc4Tp2S5FLVTqstpaceKchNQk=;
 b=TO1PcQHt4UJ5j7ElAYcFcL0QPgGNXfCLGSoAHT2ZiRUHYgw4CxZX9vDnljMsE8PEFUe5DEpd/NeznkK+WAuK2owInojoEc6rSJomhfKuF/X/0egkR+SZ059BWYxvTXsC3kkl1gdMieUhujWmp+gDkiz2i988zGl6P/LPWfXhK68EikohCZZALE8Y/wLYXSciDlnlOxErKV/qsjSWluFdfszmlUS+2JWGAKLZVTO6bOT4sc5uABbOwA0YIqP2bAKRZFVzaT+Sru2xNhKeb0mXQY5W2lUKe3C/juhsPvFgXL0WSVr09xUxA+zPWL5p5wMxf6VDVxsoGZuJZXQfRyAx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksBfp2AIWByMov8+43Nc4Tp2S5FLVTqstpaceKchNQk=;
 b=ZYurT6yI6GtzzZJlXiTjDe2tfLHrTACbV/Yt5GR52DKxkSk7B+bL/sg/5rIvjnenytH00ea5cjJ8UhCp7aOQ4/eo4MswgXO9EjtmdEfY1FqawZblOKQCYZgW0Eq0G20NbfqTHD90eupvtGdnrDnjtB28wSbcdjEwJeQs1Rv/QpGEe4IcCWaORVt2uIMIZU/3nNUhEUuhaZUqyYswH6Cw/BBq2dWwmMtBtKVyg1HcDYlkpt+TPfZ8E2AGg83aF2FpEhxIff8y8GrzeckNYoL8xwaHkiYvsf33VuX1Dos5h+Lu4RXtJy6/+0oCZzDfnYpBj6Z93rnrjMCOaaChV47O9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by TY1PPF5F1F8FF60.apcprd06.prod.outlook.com (2603:1096:408::916)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 11:49:25 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 11:49:24 +0000
Message-ID: <a4cc7c59-2dfd-497e-9f20-b12ea86a1baa@vivo.com>
Date: Mon, 7 Jul 2025 19:48:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] mm/filemap: add write_begin_get_folio() helper
 function
To: =?UTF-8?B?6ZmI5rab5rabIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>,
 "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "willy@infradead.org" <willy@infradead.org>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chentao325@qq.com" <chentao325@qq.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>
References: <20250707070023.206725-5-chentaotao@didiglobal.com>
From: hanqi <hanqi@vivo.com>
In-Reply-To: <20250707070023.206725-5-chentaotao@didiglobal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|TY1PPF5F1F8FF60:EE_
X-MS-Office365-Filtering-Correlation-Id: ee66d21a-6b8f-4d2c-8ac7-08ddbd4c51ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHRHek1ZSEhJdUJOMWIzZ2R4NDN0N25FeFppMXZEcUxjRFpqbEZXcUJRc2g3?=
 =?utf-8?B?aCtkVWtJKytlRFJEU0lJS01jL2p2NkhSQ3ZPWStJcm5QNlROVWIxTDd6U3By?=
 =?utf-8?B?N0ZLZktYZDB5ZVVDbU5xTmg5SHFQMDVUNlZXVDJ6OXpBUnJheUZSUU1BVUp6?=
 =?utf-8?B?SWx1NlhBN3hYRHJ2TlpYd0RkT0h2QXVESVpPaThYMDg4QThyaU9XYlY5bklr?=
 =?utf-8?B?SXZBcVJqVVppZVBZcVo5ak5BZU8vVDRMa2VrbDN3YVN2SUw5a0NNWDZNbXVr?=
 =?utf-8?B?N09tODg0WXdYOW5EU3VBOFU2YUJmU0loQkxWNkZYR2dQQ21jdjZDUm4yeGl1?=
 =?utf-8?B?OVVucStmazZSTFRyditRSUhnTGNJWmZoWmlsZm5XbTI0bTFwV1JzcFU4bTlD?=
 =?utf-8?B?Vlk4QnAzbmp6ektSOTVqZXQ1bnVQQjhiTHZ4ak8yQ1QzQWIvck5jd3dQRmZy?=
 =?utf-8?B?MTJOeHhrYkh4cTJiODNFeFhIc1RBRHRUcTFQdHlzSHFBdSthdnlORmJvdmRD?=
 =?utf-8?B?c1VGdFphZmZ6Tmd2aHpyV2txY2R0Snl6Mnk2ZzRJdldWSEtNV2FDVDc4dGpz?=
 =?utf-8?B?MGlxZUNaK3Job1hRNDJaRFVDaWoyclE4bDRWL2c4V1V4dFN2YXNjbU9KRXc3?=
 =?utf-8?B?ZE9IdEVBa0UxNHlLSExtOXd3VUVNc3kvell4V00vSXp1MVBqQndidzRMY08y?=
 =?utf-8?B?YkpoZk1lSTBHdW9OVzBGTDJJdHhZNW1ySS9YcEEzM3ByNmtVWGZoM3BuaWVR?=
 =?utf-8?B?aC94ZDQ4aWJ4a3hYSTkxd0xrWTBCL1BPdnduWkxhTFUvZ3k4eTd3c2xlYSs2?=
 =?utf-8?B?aSs0YSsxbmFpYmJJZnJ5dVBPZVBmMzBhaTdETHhGbVZxUjRpZWUrNVFpSlBP?=
 =?utf-8?B?ZVhLVWNOYUorajJJbHVZRXFZQm1veVUxRE4rbENkekEwZ2JNcHlqaGUrVENP?=
 =?utf-8?B?US95ZWRnUXdRcFVyaHV2UGpkb3RXRWpQQUhzRmU0a3UxY0YycW5oSVhJMHhN?=
 =?utf-8?B?Rk16YjVxWnIvYUhQYmdhWUIvdytSWW9jVHZUSDhUVzdPVXZqL0VhOXZtUlRn?=
 =?utf-8?B?TUR2ek9STFNIN0YwUnpIYkYveWh5UmRic3BVNTNTVWdoaHZhSHYzbVBTQjBw?=
 =?utf-8?B?Uzh3SWJXWDlSdHcvNTdGNTBxeDNoZGRJMlVYYk5tNnFXRWNmQWhRMEtrWTVF?=
 =?utf-8?B?b2JWcTBKOGIrU3NZUWN6WFdDa1RiQ1dibVBrVjFOVVp4TU5FM25WaHBXNXlK?=
 =?utf-8?B?dmJKL2NvcDhKV2dxSnlNRnNRVmx3TXVrZmZVV1p5VHVkYzd6RnAzTFNCV3d5?=
 =?utf-8?B?ZWpydVVpRjVoT2dFZExIRXRUUGJ0aUJoTTdXcGVtd1Y2d1AySFA2WTRhcHk1?=
 =?utf-8?B?dWdHNmJtQ0VDN0hiRU01S2lJaTNrTjRRN1d1MmM3Y2pXbnVtbDBNekNUdnc5?=
 =?utf-8?B?VzU3UlYybzNQTFVUVFN5V1RRZTFadURQL1A4dzQzcU44V2toRUZhWUtNM0Ex?=
 =?utf-8?B?UkxFOXo3OFdORlFzM09DS3NpKzMrN0lYMGNUL0JCb0tRR29tQ1lvVDd3T3FV?=
 =?utf-8?B?T1k5bS9iU3FKNDE3M1lmOTdxU2NrWDlReFdMeFJrWFVzcDU1Zm93dWdIRmk5?=
 =?utf-8?B?dTgrRHM5dFJoQ2IvUjJsa1h2Y2dvV2RQaXBOM1VhZDlLRXRoRmlXNVBOendx?=
 =?utf-8?B?ak1XdThKa25qeEtUMWdIdkF5YXZYbGhsaWlnU3BvNWhTNUJVVFFrRk9kNDVi?=
 =?utf-8?B?MCtGMlp0QUsrSVE3L2hJUS9rcm9vT0RiRDZJMGVDY1krRnNtQ0pWTENuU1dE?=
 =?utf-8?B?eDA0RzRQdjJHcE1IbjBLa1hZZCtpMmtoY1BpN2l0azJpdTE0WGQwWERKUGx0?=
 =?utf-8?B?bVFzOFEvN0s3dUM3TVR4cHZBdWswUVRJUHV3OE1IU3Fubk5kbXJqWmwwbVlx?=
 =?utf-8?B?c1FMcVhMaU8yNGdudFMyVUFLMmdTL3BuK0FtZ1pyeWhGTkc4NTJIeUlOenlm?=
 =?utf-8?B?RkpQRzREcnhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1A3SWlJcGJ1cHEzS3g1Y3VSYksyVTZvWWF2ZHJ2eFAraFQ0cmJnWnpGU25l?=
 =?utf-8?B?QTRmbmQvbDV6RmtkMEFmQWFURTVTRjV2Q013V2NDRUhXdDBQY013YTIrcmZo?=
 =?utf-8?B?czlPNkVabFdIdEV5QkhoR2Z4Z2JheWVVSE9CYW5Zb1VsOEFsRmE2RlRTWVI3?=
 =?utf-8?B?cVZoRkhKOTVQNzJaNGNkcjFJRUdzdkFzbDNtdXVvN0xnTDVNbFdUS1VJTjVX?=
 =?utf-8?B?cU9VY0N4ZklDSE9FampicXNadFg3MitTRjZXM2R3MnpXSHQyNksvcVB2Mi9V?=
 =?utf-8?B?KzdENkpBdXNVclRsWDNLTzhsUXFTL3paUEdUU0dOSUFzeWJadEh0R0ZLaFBh?=
 =?utf-8?B?RzZhVW0zekJKKzhqU20zSEtYekRqSGxNM2dJaTR5TXZqOW5wMkFqU1kwanpi?=
 =?utf-8?B?TkJrMDJYRE1xRXc0ZTNyL3JiaDAxR09rT0JZYzZCcGd5enp3N0JqOGtoUmk0?=
 =?utf-8?B?NmRzUWJ2S3ZxdDRnWHlaRVlIbGRHTVdOVmNFM2VDODhwenFKZUh4dGdwd1ov?=
 =?utf-8?B?elhGY3N2ZDRIa1p6YTVjN0dzdUN4ZjhjTkhrbEF5a0NZd012Q2VHdjBzRnpm?=
 =?utf-8?B?R3k4N3YyY3pLM1hBM1B3Rk14YXNaNWpkWTBkNHo2Q0ZTSis4bkIweWhac0Fn?=
 =?utf-8?B?SGNLckR2RXpTSWR3WG5MSEI3bUhmbktOT0tEYnNvV1J6SHpRbDRoR0VlalR0?=
 =?utf-8?B?U2RNdGg5VGZCRWNQazhzellYRUYyYzFjYXUwYnhjR1p4VVJOQVY3dkdzVG96?=
 =?utf-8?B?VGRlVkYrSkxJUlNiQ0FpWi95aDBlSHY0RURvcWY0SnFvL05hdCtkT0pjVjFl?=
 =?utf-8?B?RTFueDMxTERSUExPWUd1UDJ0R08zeXl5bmZRejVCdUlIVlhOSlp1ZHFOdHlm?=
 =?utf-8?B?UGNmNzhKWVdRNmVoMVViYjZub2V0cGt4QUYrdkFRWGVzanV6SzlURThFTUlw?=
 =?utf-8?B?c0dPS3BNeUIwMHYxdWk0aHp1T0lGNmhldHJXekpRLzlJU2Z0RmJ4MGNmNnpj?=
 =?utf-8?B?RCt6TEw0cms3VGhsMW9Xa2ZPenV3RmtWY3NGZVJIN0lhdnMwOGhEU1VUaFVz?=
 =?utf-8?B?MTJrU25uZE9Fa2h2cmUwaWNIOGR2SmlvUVlCZHdWaUNhSXlOWGhaaWVhRjEr?=
 =?utf-8?B?b0NkVmlIUDhqU25HSHl5bkNFK1lXRjUxbW0zZldJeGlhbkhBbWpXdFZ3aGVp?=
 =?utf-8?B?QTlBb0lWUFJaeUxxSmUvQy9ab1ZZZjJjaHNUekdNdUExMEp2ak5YOTZzNlVv?=
 =?utf-8?B?TUVlcVZlOWxHckxGb0w0SHJVcWVYSkxWRE9kdXB1bHJCa3JQN2w4OG5DZU85?=
 =?utf-8?B?VTQxcDFkSnpiRmprOU4xYmoxMktiY1JuY25mdk1LUEhBcElHV201aXlWZFZX?=
 =?utf-8?B?dkVkOGJnWGxTQmJvYVo5eVJ5bUpuUnBJVTVsZEsrNzBzVzhINXpSWVZGQkhm?=
 =?utf-8?B?QzE3OW5MUkYxNXFoWXNzdlpUQ29BczJ5MzN6MlNtM0RLdTdTajdvNC9CbUFV?=
 =?utf-8?B?U1FqVUZXbFBob0VEaVNTOFlCbjhwT3BJa1ROc2ZaRjIzZFgrNm0rVlY2amxU?=
 =?utf-8?B?aGFJZnRyT2hXYzhWKzE3UWozVWJ5aXpWUC9HMG8xKzF0M1VoaTlGUjg2OTNq?=
 =?utf-8?B?UFFVeEh4SHNhK3ExaTFublNJcjM5YjdBK2ZzeVFNSk85UXIwNm1kZExTQTRX?=
 =?utf-8?B?VWROVFZtcW04RjhjZEIxck9nR2hDcS80dGZBd3hXaW1nRG9hRjdSL3JqbjBw?=
 =?utf-8?B?UGloWVZWSTVIbUJKZVhybGxiRWZ4WldRSnR5MHpwbjJtVXJJYmFRQjhBN01i?=
 =?utf-8?B?Smgxck8zYXlpVUM3UzE2TlFOU0tLRzA4enZDMXFPVGxCaHZNa0FONlpmekVv?=
 =?utf-8?B?bjM1UXg3Wk9hdk5yczBzWm5WRFdZbmlpVFVrN0c3Z1FtU1MzYmN0SldDVlEy?=
 =?utf-8?B?Y0wyWWdCWmowYTBsb2s2cFVON3dUVzdGOW9UdU8vUUJ2VzRDOHY5WDF0SjR2?=
 =?utf-8?B?bTVOQTl3UTRHaVhiZVVkcEJRbzhESndWME1DM0xGVFduNzhNVEFwQk54OFZF?=
 =?utf-8?B?anhVYUhjcHFSYzhJMnVSL3A3aWhLakk0aVJzSVZSekI4R3JqNTFrOS9sbVBR?=
 =?utf-8?Q?skIV+yNGlIpaOxKs0Dn7Fa3CZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee66d21a-6b8f-4d2c-8ac7-08ddbd4c51ba
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 11:49:24.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sjr/peJbd3lSQNGT+0I12eFpDruZ9vXxqOjFqMJZozwBhyCDIN657YTh/mBKQ+mpaWEcH05lv9+gvj6LkvPkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF5F1F8FF60
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:54 +0000
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



在 2025/7/7 15:00, 陈涛涛 Taotao Chen 写道:
> From: Taotao Chen <chentaotao@didiglobal.com>
>
> Add write_begin_get_folio() to simplify the common folio lookup logic
> used by filesystem ->write_begin() implementations.
>
> This helper wraps __filemap_get_folio() with common flags such as
> FGP_WRITEBEGIN, conditional FGP_DONTCACHE, and set folio order based
> on the write length.
>
> Part of a series refactoring address_space_operations write_begin and
> write_end callbacks to use struct kiocb for passing write context and
> flags.
>
> Signed-off-by: Taotao Chen <chentaotao@didiglobal.com>
> ---
>   include/linux/pagemap.h |  3 +++
>   mm/filemap.c            | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+)
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index e63fbfbd5b0f..cbf8539ba11b 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -749,6 +749,9 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
>   		fgf_t fgp_flags, gfp_t gfp);
>   struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
>   		fgf_t fgp_flags, gfp_t gfp);
> +struct folio *write_begin_get_folio(const struct kiocb *iocb,
> +				    struct address_space *mapping,
> +				    pgoff_t index, size_t len);
>   
>   /**
>    * filemap_get_folio - Find and get a folio.
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ba089d75fc86..9520f65c287a 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2026,6 +2026,36 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
>   }
>   EXPORT_SYMBOL(__filemap_get_folio);
>   
> +
> +/**
> + * write_begin_get_folio - Get folio for write_begin with flags
> + * @iocb: kiocb passed from write_begin (may be NULL)
> + * @mapping: the address space to search in
> + * @index: page cache index
> + * @len: length of data being written
> + *
> + * This is a helper for filesystem write_begin() implementations.
> + * It wraps __filemap_get_folio(), setting appropriate flags in
> + * the write begin context.
> + *
> + * Returns a folio or an ERR_PTR.
> + */

hi, tao
I think it might be worth considering adding an fgf_t parameter to the
write_begin_get_folio() helper, since in some filesystems the fgp_flags
passed to __filemap_get_folio() in write_begin are not limited to just
FGP_WRITEBEGIN. Something like:
struct folio *write_begin_get_folio(const struct kiocb *iocb,
				    struct address_space *mapping,
				    pgoff_t index, size_t len,
                                     fgf_t fgp_flags)

> +struct folio *write_begin_get_folio(const struct kiocb *iocb,
> +				    struct address_space *mapping,
> +				    pgoff_t index, size_t len)
> +{
> +	fgf_t fgp_flags = FGP_WRITEBEGIN;
> +
> +	fgp_flags |= fgf_set_order(len);
> +
> +	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
> +		fgp_flags |= FGP_DONTCACHE;
> +
> +	return __filemap_get_folio(mapping, index, fgp_flags,
> +				   mapping_gfp_mask(mapping));
> +}
> +EXPORT_SYMBOL(write_begin_get_folio);
> +
>   static inline struct folio *find_get_entry(struct xa_state *xas, pgoff_t max,
>   		xa_mark_t mark)
>   {

