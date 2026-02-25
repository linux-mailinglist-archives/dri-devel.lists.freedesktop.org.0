Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF52No1Zn2lRagQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:20:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D29719D21A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6F210E36C;
	Wed, 25 Feb 2026 20:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XrZugcC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B5410E36C;
 Wed, 25 Feb 2026 20:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdbHq5Xuf88dJdpw5tmDj+0BlOdcJ3lT18gU//tseSOiCmj9eD05lC4S99vy0pMcTbkuJDlNPr+dNHCJacfaRYTjhRj6/a+m9GeE/jtklExzIxrzNb9Un62rp8vG3xwh/TJmKF0B5Ia/1V1SC7SfbwNFYLnBhypnbDLW0M87X26yUbiYRZ4TG+zWWCxqKtTqXh+X6QGLjLo0rRHIlUae1A6zaQ7eg8jhJu3WAH0tsIrbHiLZD2xGX2VcXaMGmmlXWIHQfQ1Ok52tEqChmP4kQA8A9n36o6/2ciE1+GHNJsyOH5+hXwtkUY4gOcz6bideeESoakFP+k+cV/mQnsohTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvWjKumVid6KfMcFHik3IpxYzjnoRTZtVR1LA5LBjis=;
 b=CGwybXGeY+ctGuUxJ0RUmBQbEIDgOmXF2rh/UE/WANMqTO0iH/Hxszw/ozwMhuFRlzPn2I8XlZBTYGY8RJ5uYzgDgWlFRGCg8zIk2zQybor5hj4O1Lzb6m958BPuI4p37cVxcBDqcmERTCPxf41ZFciUJ3CUHVuzttu62cvYNrFCnqCSCZr/AHwgLBttXEjoqiQTsowa9MaVRufyzdcIWtqa3+7jkvHKTf4Cda3atGbraG8pyJQ82SfusvkPuomay/Xt634b6RibgX/2IW3Rnb6sicnBY22hEek5I7cNBeIoU4m/p6MJSY09YinQ9L86T7vPXSM2yurnhqpOjOPJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvWjKumVid6KfMcFHik3IpxYzjnoRTZtVR1LA5LBjis=;
 b=XrZugcC0iTrdHBoiBpIm/uzaS2J1g4aEJ4I02umUUOQWiKWgOgCFEGfSdj5Piq+3A7RwbygVg1yfc/4G0rrEncmzpoLL5vSpSOC1U1HKMWecwzSthVXipLsn2X/PYf3XKUbz2RNj8OHAEkRaLjriFpWF4VezhpC2a6gVXuvJJJQFcjjsYA1Hiy68mANL94ZXWRR8/d6xPNsl5YonoQvUiATn4JNp8Jhm9iQfALwPzWjldAcoUhrB3PZSTJsnMdajG4/UV2N6syQnsQkib9xGCvMocACuX/cIX+JQBSkjEcDeEhHb2daoEy37R8rJ7+m1JRpG5XMxe68rpPesnjLuZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BL1PR12MB5705.namprd12.prod.outlook.com (2603:10b6:208:384::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Wed, 25 Feb 2026 20:20:16 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:20:16 +0000
Message-ID: <fe65b37f-6944-4056-8b7a-3cc09a044bf8@nvidia.com>
Date: Wed, 25 Feb 2026 15:20:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
 <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org> <aZ9SF5ql6OCdaFi8@tardis.local>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aZ9SF5ql6OCdaFi8@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BL1PR12MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: 24377316-9054-476a-1954-08de74ab49b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: pmkeAuchFAYML1Ug0ydGEDzGV24iMx9/rEngdU1GH3Cl5DMuMErpggk61BKrltMfN312lK27eTePRfddm6+/Uuo1IhL9RjADiuPPdV8sBVZvaXVXjwDXHF8f8mYwWj0kqpiA078+4v3N5dHAdf9pYQLCPSlxbNqQ2OB2DgS+Fh4uT6l7OIXQ+TmulD4ebmeXdKzvbX29TL00QoRsXvLWoHgm6OpNDqYBwSwTLG+A0nd/BFqFkhyj6RN0es0EG6zPiBCjTVcqSlb8bAJV9ktaX6k29itGlXVGI9fOnVrSHxj0h64CyTnljdH/p8MFfQ5Kddc+P+slmFG5mtx409elkGbSB058sH6JCOx3mEGCxYiXCDPM+OPn+Cc8KqL6WmD8jw///In7ZKpPhUeoog3MKbob8fLZ6p/Roe7e7rnpTvwyjz6wsmn7xUpf61nFgwvT3qansmuwhVg4Ny9pDqo9u4HOPBylI2bDLrhI496LgdRT9F4VkOcgGgi6usaHYjuHvQY6j9XQdcYAEPBMDsICgFL9oQMqvYCdXtX+MxB2WxItcVaRtwnQMzNj/QI+W76OQ8xf+KMz9NOleMkPwpWv+GFuChMTJjqbbGBRHYqmp+7FCJKdEWa+IZcLoBbdnfP9N1hYNNTqQoUlJ9mofB1o+iCUKqDHqRV8W/c+BFy9q/ZUVGcbcCxiOLxmk9khptx1BNkn9LfVJk6bKetM79BHcrDWBPIYwn+McjMPRrsfwfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3NKZXB4TllEWlJvY3N6bERzWUl3d1VYaldMSEtKSTJSbHc5MXY4OG5QVCtM?=
 =?utf-8?B?NzZvZXI2L1NmejZmTG9oZXpiQ1ZLWk9ZWXB2Qi9nUXZvNGE4TEFUL1FHZEdT?=
 =?utf-8?B?RGdYTFhYN2gwZkc4RFluZHRiNUR2YlFOeG9zOU9FTHF5K2xPeDA4SGhpQ2Vm?=
 =?utf-8?B?aHBRVU1nUmswV0M0LzBFTHFjTXk1VGIrMTdLc3JBbVZVcTlBbyt5WGFvemZk?=
 =?utf-8?B?MnZJZXpkeWlpWENWQ01GRVB3OEJva3V1eFgxc1NMckNabnppZktQYzdoVDlW?=
 =?utf-8?B?eDI1YlV5ZVVSa2lJajdPSFl2U1d2OWxnWkxXcW50NTVhMk9MRXZyeEJVZGRV?=
 =?utf-8?B?RGtSbWxmS25JVjk5N3U5UFFqWDBaQlZoR0MrcEJNVGpTRkoyWUFKMExKekFa?=
 =?utf-8?B?bWJLTTFJOFBUQWFrQVR2QXN5SGRTVWRBYmw3RnZyc1V1M0p1VXBNdnp4RkF1?=
 =?utf-8?B?R3RVZGlVZmJjanUzbmNCMDJJNVhwZHJmMUZCN1hGRmV6TjF2S2tEMy8vM29s?=
 =?utf-8?B?MzhzMHd6cmZFcFc0cmpRdmlYUkdGa0dQc0RyNXVOaWc1QThMZzhXcDlFOUNC?=
 =?utf-8?B?eVoxSzhCbFY1RXc3M2p2ZE85VTN1U29hcmlOejEwSk9kZGFXSFRmU3lvMmpM?=
 =?utf-8?B?OTVIdkROajIrUzlWanhqOUowMU1TckRRbTJwaThaK0tPZkxWdDRYcnU3dFA3?=
 =?utf-8?B?Y1NnYjhxZGQ3dGdKaDV5Qi81VHR3OEp2VUVjdkhYcjY0Nk1MTHhXS2c4aWpL?=
 =?utf-8?B?cC9sdWIzc096V3IrclpGY3paSVNLdktCQWJQSFkvQW5oTUMrd3dhL1Mxbmsy?=
 =?utf-8?B?QVUzU29URENhbmlIdW54OXY4QVZHWW8xeWhiSEM3eU1SNHRrWVM0RlN1UVkv?=
 =?utf-8?B?LzdqT21BZ2pFVWRzMnIrNStIbWZWWjZSc3dNNjhUYWtlOTVWclRubWkxSGN3?=
 =?utf-8?B?TjJGS0xSdldodEp0SHovYWxJZ2JzaUt5STR6TFNNTXdoTy9BRzhhZGNQS1hH?=
 =?utf-8?B?b1N5cnB2ZjgrcWVrRGpsYzVxaTdQQ3NQOEpNY2FpWk9jekZlcXh5RG9LRThO?=
 =?utf-8?B?VW1FRnRIcVJmMWxPU214Vm1Ca3JsR2w3bTZBVWVsRUlNSDVKOUJHcDFqQW80?=
 =?utf-8?B?LzhUOWgwclNyVmdsQnhCZ0paMmREMW5sTGs2VW5XYW56NnVhWmUrK3lLWjZv?=
 =?utf-8?B?bGxTMHc2L1M3UkYyMVVUS1pLNEZZeFJGVkZkVUt4S1lydENwc0IvNlB5UVA0?=
 =?utf-8?B?MXVRTEUwcTNucEYyUW5BZHV4TG1HR1FsTUVqUnc1c3kxSnU3NU5NNm5RU0FB?=
 =?utf-8?B?VzJ2VEk1bDJSMnRCQVpYT0hrczBIV2NnK1ROeHI4c2FabXVpWHhmSXZOeFVH?=
 =?utf-8?B?cWhGd2lraG1jL2FHd1dBMmE1YkpzVk9FZmhQcmxQclN5bHBDVCtWbmZTcHdn?=
 =?utf-8?B?eU9Hc1ZBUGNmalVtdU00Q3V6ZERleGUwRjNnajJZcFVtNzNRdTFzOVM0YWJT?=
 =?utf-8?B?SEtDdjQ2MDJIRXZaQWRSYnhTMmdRL1lQUjRqUldvTzNCQTNqWGtxYlFKb2xh?=
 =?utf-8?B?a1lxeXRhLzRNSzBMVnVsTENTRUJ4Y0pPdzFyeERmKy9lcEZHTlBkSUxNWjRw?=
 =?utf-8?B?eEdMSk54ZDkvS2E3NHdkWkdTUXNudnZ4dDJCbUxKTStiK0F5c0U1T3psWjNr?=
 =?utf-8?B?cVIvdFpVYlNFT0IrZ3BXcWtPc29nbGRicmhMWXE4SU1WZVVHSzA1YW9qa3dp?=
 =?utf-8?B?TTRGNDJxWWZPY045Mm0xN3Q5aml1N1pxelR2b0tLbVAyR1JlUzUrMGRKS1lY?=
 =?utf-8?B?R1d4QmUzYm9IU1kyWXBPZXdIYXQzQWxpdy9QbW0yVUZ6TU04N3MyeFh2MXRw?=
 =?utf-8?B?bXp1djRndHAyL3lFczFWbGw2SnlNc2FkRHd3MU5KSTA0TjhHOVl4ekhRRVZh?=
 =?utf-8?B?RFc5NVEyTlc1MmhPOWp0RUNFalc0UWJNQ2ZKclNjKzF4WEFTOGFuMWJmUGc0?=
 =?utf-8?B?RTd4TDV2K1RnMDlETENpQ0pKUHBCdCtlbU84VFRzbjNFTTliQkNOZDRORFBp?=
 =?utf-8?B?cndpM0JxVkFOa1V0My9VYjFlbWV1SS9LUGdZZkREaUZYbCtQWFBNOEh0Tlg0?=
 =?utf-8?B?VzF2RnVUR1E3bGlTN2ZKVkw5TTZEVDhBZnI3WlBEcFZjNlF5ejEyMXFoUmth?=
 =?utf-8?B?ekFyNElsbElSNUV0OFh3VDQxdjlGQitiOERPRTVHMWdUV3A3bFdwRU9nVloz?=
 =?utf-8?B?SXF1eGloSEhiZ1BySVd6TXR2V2t2R015dWVmRzdyY0RsMkQ5NDZSaURNdVJr?=
 =?utf-8?B?VHhRR2gvY21tVW82VkJXelRxUFRqMVRrWHYvRHRpOWRXYmtMemhZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24377316-9054-476a-1954-08de74ab49b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:20:16.0431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kx89WzniUXN4e5EVso79g8b7BWFRAIyd+uejh6t19uiOtT+z5xJ9KcOOJSH9/w22yJUfSnF+061aXUsOc7NQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5705
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[garyguo.net,vger.kernel.org,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2D29719D21A
X-Rspamd-Action: no action



On 2/25/2026 2:48 PM, Boqun Feng wrote:
> On Fri, Feb 20, 2026 at 05:48:37PM +0100, Danilo Krummrich wrote:
>> On Fri Feb 20, 2026 at 2:09 AM CET, Gary Guo wrote:
>>> On 2026-02-19 16:24, Danilo Krummrich wrote:
>>>> I feel like it makes a bit more sense to have an entry for the entire class of
>>>> "RUST [FFI]" infrastructure.
>>>
>>> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` crate
>>> defining FFI types, we have `CStr`/`CString` which in Rust std is inside `std::ffi`,
>>> etc.
>>
>> The idea is not that everything that somehow has an FFI interface falls under
>> this category, as this would indeed be the majority.
>>
>> The idea is rather everything that is specifically designed as a helper to
>> implement FFI interactions. (Given that maybe just "RUST [FFI HELPER]"?)
>>
> 
> I feel like you may want to call it "interop" then, because it's "Rust
> doing something with interoperation on C data structure". If I
> understand you correctly, the category you referred here is the area
> that we could not simply call an FFI function to get the functionality
> from C side, but rather we need to make sure that we are interpret C
> data structure correctly to work with C side.

Boqun has a point here: https://en.wikipedia.org/wiki/Language_interoperability

thanks,

--
Joel Fernandes

