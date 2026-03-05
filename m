Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM+SFnU4qWnN3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:01:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B783B20D142
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226B10E22F;
	Thu,  5 Mar 2026 08:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ekLBp92Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011044.outbound.protection.outlook.com [52.101.57.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F34A10E22F;
 Thu,  5 Mar 2026 08:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVFnH4xPwaiPn1LNue0EebAlOiUYJRXnsiCN1/Vj0JRweQKTyeekAoOtVhBe5UO/5qNbpyW7I284ukwMolmfkawLPl5T04JCdOK91VB08CHNk3ylJ+4Ms4YF2xV+fZQhv0zxGeKu7ZYC1G+2qMeOn6aBNhZPTy34xoTYThNMV12uTyjVNQ67W4YkD/ct7Z0qpgUhL4JveRngFyDdh+dhewQo418rKLFIapIF1gpkq9dW5vjyVWYyYOf5yT8mRUDPhvrOf01dEbQrsH5fqN4yN6c/7Ynk8GoKGR51YSFUJzjGbA7n8FHhAl3/9f28QTLSa2ulDYbqYv6pjeSk0Po45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo9czK2855E8ZTkuVXlMrdw+e6ySCCrQMraXVo7KHPI=;
 b=u8U+d7USyGOOGj1/93hXbTsK6boDr60g6vEn4F6xXLD+NrcFJhLrjwdbV6OC0WnGq5rveY8FsvkqDEhEC//mLLgytt7MP86IiF1ZIkfC9ITJbff5DmanJowyR7ipQBNvmMQGVl8nL1fV3ZRrMNRzr+RpkG08XSapZBV8lpUFTVgCycYRvLi3JsqfoAH+rcUgdg3dy68/whpLpV9ql+DGGjHi4mDD0PD5WpoJKEax8F/EkgDZfeL2Q4YAgr2negzyvYpGgwVEgg3xr2Ps6Z4A2kVRosQ8rnT4vJ3m7+JDZHzGL32fgGr8vdoD0L5smfuKWwIlM1JpRx4XmTf4B8JRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo9czK2855E8ZTkuVXlMrdw+e6ySCCrQMraXVo7KHPI=;
 b=ekLBp92ZI65lWEjfddP4kac4C6xYLLFSyXtZju1XgZjDnpoGthUPXtPwgsaIrewXx23sd2NcpjYn6fpZTosuTnWKdwNAfRc2KDJM2G3xS7DQ5HTm4Th5N83d1uw1JyWFIBHqzZJ1VDgZIHR4IWhTjemR6mmHbg2rIVVg11b3vejVPFxeF8JqsksyBia6FiHznVtzfcu4bL4u4S/yDTbfjGuCisjCFvsHG4mYUP4j3MGz7AB2RF5NTIu/+8e4td2DwOp5gM5Uz/j0ZP6bwm7FAEPT04hz5iKboUqNGKSZUYb7BoseMRiXqqsBswIObpkdRGb1PhLqXISi5E39cRbrEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB8107.namprd12.prod.outlook.com (2603:10b6:510:2bb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 08:01:43 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 08:01:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 17:01:39 +0900
Message-Id: <DGUOW0UMG5DY.GYRK410GIRUJ@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
 <24b74629-87e8-463c-ad21-376a5097823e@nvidia.com>
In-Reply-To: <24b74629-87e8-463c-ad21-376a5097823e@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: ad184347-08f5-43a4-a9e6-08de7a8d70b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: O2Yfiqd7V5cw2Pp8ji136/K664nMmWU1hxI/MQyB/IkZz/NUQn9aUrnpUmaCg9TFmRPjud7FkAO+WrJ9kLCDKNpO4WhK/dI532ZPVI66kqJ4b+jBVW/pIQdDKSknLa3rckbW2eRc3irQJAgKL09BWCnM2llpfgI4543uf42h9zul398h0GFTip90jY7VGQJwYsd+RpxbxjBdDgVHlgbd/uxhEEiTNaIScX1PHK74YnOMEGDF3Jq4xsZJEGl8mAyrsyAZEAQyxi5JxRAfBVLDAPYtm1WOTUGWAX8crXvwPjMdkEqzNVcw1HwGrrdG2p4svYPJStGZSa3SPmbE87P41AlotiaVDPFsbJ5JKb5OEUgMZD3cQu1zHy4saEfVGYyORz5Rs6T9iwZERiU7QZeoG+RNB3FyBaa3/oZpqclXCIndU84G3UMcVG6Uj/fL6jH3vsYGIWCZ92lTfKvxxEGDojiA7AtSJ6X8pyP/Vh3F43XkTJpObl+6+G0HxKH0bk7wztiHeXT5wrP+c0IAcMe6CZe6n66HnHSP8wICyPS1Hg/6mOr2/pTD0pGP7Y05IwpVBd5QyyOvpZIvennmprdpJs1n53SbbN+0XyWloirC18iWqiWjWm685vP8s1nPaP27MRIGPpYyITlpD7CTa4fS3smT1QVm4UBSL5NgBadJfUciQv2SxAhDqqfczRfXUg20dcPXc9ox3DvqXc80wE+6KYM3D8Cg+7euSo8d90MWp78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG4rOWJKTk5QcXNYNXlDOXoxTVNQTVM1eTlJNFBhSGNLWitsNC9CL3hBWmJU?=
 =?utf-8?B?Wkg1eEowY0ZCckkxR3FpZVFoOWxFMTZRYVNTaE1ySllSK3V5ai94RnNLMVFr?=
 =?utf-8?B?VURzZWtHNTRVOVBWSyt5L3ptNkh6cmpWd1R4SkhVK1RUY3lUZHpLTzN0Z2dK?=
 =?utf-8?B?Q0ZHNHZPSGlPYUVhcUZMaTI3SG9Nemd0OWlCRVlBUmJCNnBEYnV4REdmZmt0?=
 =?utf-8?B?azlGT0IySytaS1Q1YzJEc3pONmwzOFc2NTNSTmhtNlEzUHgyMEYzaGNvY1JZ?=
 =?utf-8?B?TXBBQ3NEZFVuMlBRZGw5MDBxeStGZk54U0pROHZlWGZWV29tUDc3VTc2R0xQ?=
 =?utf-8?B?cFVFYW4rSEFsQnJFVlRwUzhUeGFlQXlXY1pPVS96MzdZUStRdGJ3d0l2cGx6?=
 =?utf-8?B?cVNxZ1U0SmdEL1U1WU4vQk5zU21ZcEJuYlhMZk94c3V0dG5MVU1ZcTlNSWRM?=
 =?utf-8?B?REx0UmNiRXhmV2xrMmREUkUybHhaN1NvMEQrMFdpSkM1WEN0ZzdWTVY3TWRu?=
 =?utf-8?B?TmlEVW5uWStGVTVSRlI0Z0trUE4rMEdKVmxFZk10VlBQQXFtbk9HWEp5SkUr?=
 =?utf-8?B?THk1WlY1SXQ4TnNRYm0zaTJWd1NqTG5hZG0wcWl6Y3JqYVhEL0laVE1WV0xD?=
 =?utf-8?B?SldTNHVMQTFxY3N1QlBRaVlJa0ppMzlrc3ArV0I1YitpanFBZmhYQ2xLYkNz?=
 =?utf-8?B?M1Q4b0l0V09tUkpSYlpJRU9OR0V0a0lmZ3lCYTY5SHNvbXppZnBzaW9BdzBm?=
 =?utf-8?B?RFZxMm1qNkIrazhqblNTa1lIQmdVeG5aL2U1YWFNdUFxM25id1pDcCtrZkVY?=
 =?utf-8?B?N2NPRlpUNi9ydnZvR2tOT1p2ZFNtNSs3SDREdnNYcXpUTWZCcWtPZzd2Um9U?=
 =?utf-8?B?eEJ0U0hSRGg5WjBRM3AvdkNNOUJqNk14Tm9RR2picDFlVFhNeStzVzlzU2tq?=
 =?utf-8?B?YWhTckNmblBtei9jcWRTK2tkak1vTDVQSnB0WFhleXVWZzljdEhKYWZCL09V?=
 =?utf-8?B?dlVMVzV6eHgyUFRRTnJITE4rNXYydEpkNGVZR1VqRzV3KzFOb0ZPR3JTSkJQ?=
 =?utf-8?B?QUErR0E2bWp5TjRPWm1ZWWJHWDBkcGxod00rb1VSYmZXM3lTdjFKTjBUU21n?=
 =?utf-8?B?Sk9MVW1TYTRTNHAyR0hnM1JjRmlBNkhRbHRWb0d6a1dmYUhqVTEzdEZhbTdK?=
 =?utf-8?B?QVU5aVFFOWl0WkNTZzEzL1BaZ1FxVVJxcElMY3kxc1N4WnhPdURzVHRaNkF6?=
 =?utf-8?B?aGJzcUI3aDIrMU00bzBKUTJUU2gvS3lZbGdXSjk2cTdZRWVVWWowb0ZWWDkw?=
 =?utf-8?B?bzFBbVcwRHJIa1JLQWwwYnB2ajhCZFNTQng1UFludXlFZDRaMnNXRHYwUlJV?=
 =?utf-8?B?T1daaXNDam5BZUhVWWFVU1ZRemE4RWdQNjBPb014OVZkNmIzZDNWaE1XNlJp?=
 =?utf-8?B?Q3hKOHVXYXc1cC9rTTl0SllzczVHV25UbWlrcVh2T1dIZzRXRFgxR2pKRlRZ?=
 =?utf-8?B?Q1NSOHcyUThaSC9LZURwSVYvOVk2MWlndkF2Z01KUEdYNXA3cmFFUjBJVSth?=
 =?utf-8?B?SGE5R3J1SEtqVmFqbG5kZmRUbmpaSnphZGdBSTdFRk1mNUdqU3l4Q0dBNE5a?=
 =?utf-8?B?bmgraWtqOURtN3RoSHpnSzBwcmVHaFloLzIxb3F3N3pjdXd2ZUhYT0dKWGZN?=
 =?utf-8?B?WGRlWWFRR1oraEh5cDVhQ1Z0cElVWW9manNFZ1lmcUpCL3dVcnl4dFBNTmVZ?=
 =?utf-8?B?bVdYN2U2M0dFSGJGNG0wNXVIK1BpNHB2dENWdVF4MnRLZ1RSd2NmTDU3VGNB?=
 =?utf-8?B?S2JEQmdTaTJTdHJvQXRNMUE3Z0ZxK1h1Q09VUk9jN2RGRlRDK0ZwemZiN1Nn?=
 =?utf-8?B?TjhVQS9PaTJwYlJCZmRSUkJqb2lwZG1NWnR1RURVSUNnMmtTS0VzY2UwdGtK?=
 =?utf-8?B?dS9NVE5Femxvbk1ScHpWRzdXZ3Myb3hxNGJRRGRtK3d0ZW1BOXhpcUFMTGpR?=
 =?utf-8?B?Q3R4SzZGemJFM3h2YzBURlZtN3VNdW0zZXFidzQ2M0g0WExnalRUQk1PVFEr?=
 =?utf-8?B?eEpycXg3WDc1c2FiUEExWFozc3BVUUpTSm1iQk8zZHo1RlJTa2VPbDJpZ1lQ?=
 =?utf-8?B?bVduMVNhQTJ4NXN6aUNNWlhZMGw4T041cFJtV3l4NmhyZDU4Rk1NTUxHZ0x2?=
 =?utf-8?B?TlkveXpDTjVGd1krb2tUaXA4eVcySmNwSXZ5dWtDVWhHeEh1Q3dkVjNhdTRv?=
 =?utf-8?B?VjRJbUJQT0REeW9qSTVMWWcwZTJobHBReWdKSitCY1pFNW1idVl5aFA4QlpP?=
 =?utf-8?B?RUcwanRBSmlic2RwR1N5SzNFRDE0Z2xFMnB0VkozbDhRWHc3QWdpVUpKMzNq?=
 =?utf-8?Q?HWf+IvfVFmQ11ugYVNsy/eSv8wve5aM4S9V4QsDUcW+vj?=
X-MS-Exchange-AntiSpam-MessageData-1: tlLwXG2zOckMRg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad184347-08f5-43a4-a9e6-08de7a8d70b8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 08:01:43.5331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bEV+2u0MT/l/ejBFNhh2Uu5no2s6Ne2/Ox8COKIPzbTNkx3JPfd9qo04xyRSMlUi4I+G6kjoFiolTPmw8Ha4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8107
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
X-Rspamd-Queue-Id: B783B20D142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[google.com,nvidia.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 4:50 PM JST, John Hubbard wrote:
> On 3/4/26 11:37 PM, Eliot Courtney wrote:
>> On Wed Mar 4, 2026 at 8:39 PM JST, Danilo Krummrich wrote:
>>> On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
>>>> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Re=
sult<GspCommand<'_>> {
>>>> +        read_poll_timeout(
>>>> +            || Ok(self.driver_write_area_size()),
>>>> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgE=
lement>() + size,
>>>> +            Delta::ZERO,
>>>
>>> Isn't this either creating unneccessary thrashing of the memory control=
ler or
>>> unnecessary contention at the cache-coherency level?
>>>
>>> I think we should probably add at least a small delay of something arou=
nd 1us.
>>=20
>> This is what nouveau does (specifically `usleep_range(1, 2)`). OTOH,
>> openrm just does a busy wait, which is what I replicated here for now.
>
> Open RM has some ancient bad habits!
>
>> GSP command queue not having space IIUC is meant to be very exceptional.
>> I am not sure which is best, maybe Alex has an opinion, but also happy
>> to change it because that reasoning makes sense to me and I don't know
>> enough about the distribution of how often it would actually need
>> to wait to know if 0 delay is justified.
>
> Almost never! There is a big big difference in how the OS behaves,
> between 0 delay and non-zero delay. Sleeping, if you can afford to
> (and we can, here, IIUC) is far better than a hard spin loop: the
> scheduler can do something reasonable, for one thing.

In this case the rust `read_poll_timeout` has a preemption point, so
maybe the scheduler would be fine?

But, if we can afford to sleep here it does seem better to me.
