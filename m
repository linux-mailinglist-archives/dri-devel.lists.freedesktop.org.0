Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 487192E9EB3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 21:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B019389EB4;
	Mon,  4 Jan 2021 20:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB989D73;
 Mon,  4 Jan 2021 20:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5WJ9Yni4c7TLqEgRT2yDoSxpoZ48W6cKgDCW6OU5xu+fIiWUp85dwXwNcwhbwJmk4oBad7C/C8GuPSGDIdyViKE+cZavWm31k6Uy2a8faOcLT4wu1FJzdn75BnEbAdbzv2CCHKsUSFq9RxuX1RXX5giTDuZwdo+A8RacPXbULntMzBBnXfR/ZQ5usbQ2/AefzQ27Fmeb8lelBk6QrHKJJXQI/7X7VzGcjwfdxA1xqUmvtpdoltFRCh6I2YLvHIDsoxshxOKm/DejNx/sddhGq6g/8onFJr+ld3+nYF5rtePJtfKacnEBZukcsX8vsgncE9urPprtH6s/8MI3tACqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l4YcEpm50FYVo7udsZ8uUZD949wymaNPhFDgigOWrY=;
 b=iQRJwpaSAJlNSQIXrrxrYmNnLJTaLZ+gKf6gKQiq2npCYfeVGPFGwPjfSA2hXFtTZEtuu7pk0Nho7EjQkUbkKDjeJmkIwi+q6O21Xw7BPdGKzjMJ5FxaIrT9DDG7AWe9gb8WFaVV+ande845jpUg5vDGoNsmxY/fkLbmwhMi7GGO0Ypfj8YCCFlSnx2sXg+owQNFhyWCfkO54ZjsuGUPQKz2/1Y547YheDxK7OWTI1T+WPXIHuXxhLu97wNmE1HJKfhQhhXNgysuAZm70meKnqoxYYbDEBgE8d1zKcjXBzmdNQPniTHMvzoTF6hmvmLUMsqEChRseYeXTz3ZXOrMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l4YcEpm50FYVo7udsZ8uUZD949wymaNPhFDgigOWrY=;
 b=t8XQZWKOZB9mlsCRVcFAkUEWwU1DqzNC3ok7opqwykmjRLYlKG/m13xk7J+FuRubOXRS8mBUujjpxg4plcZ4LxwRxKgVKfLvTNJg9eEDZ0E/GutFGkUcNa0xJI1xY0SAU6ETjVw+SVlIYIoJLzwkEKQcdmR8vbCi1R/Vq6uWnBA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 20:13:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 20:13:58 +0000
Subject: Re: Couple of issues with amdgpu on my WX4100
To: Alex Williamson <alex.williamson@redhat.com>
References: <4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com>
 <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
 <20210104094547.06a61444@omen.home>
 <ea539e21-aed3-8f23-74b2-5a214fa9fdb2@amd.com>
 <20210104114335.3f87ff27@omen.home>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <158aa1bf-cff5-d3ce-758f-3afcd4a15cae@amd.com>
Date: Mon, 4 Jan 2021 21:13:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210104114335.3f87ff27@omen.home>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:205::23)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:205::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 20:13:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b2994725-6cdd-4583-54cc-08d8b0ed452f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4391D83C005C2B57EE78E01483D20@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrAUp5uNgbjt4lbwE/K+WaePNOP63ZditFzTQZ5WB5IZY5TbK4rEGjGGq+CyyYYQ1MA0pUjYwpNnxgPNybGe3QKo4Qlowj8dSLmpfFy3Xt+u954/Gefno6epFeARetgssVJgbM+3N7AxwjKVNIf0+dYTHtbM9066APzoXR82yKzV7SvZxhHm23NdLY6KVeT2IjEuinFYiwTq5TupbuNakpXCEW2D9LYOC0M1N5Zo64fRii0DnsYHKECo/Ppafn4AkKgkXzYZMhYUrwrbFI/AwPdspgmZk6Ff9a7BpuqiciO3I439gA70GNc2mr7HCJZ87gHSWXmGPjMGDt6lVFu8BvIpdb/sU28qBl/7xa1JQYDSbKQvazIMG4QdNeyC0tsJwaZGsYi51uUTn1HN/37l1Or/9njBkuCkx2NZ9UXQ8uTMhC634bUA9Eu995g6Di4hd8wtyY8f/u2vaAVG7t3Umx3dzqpfG5iH+D46mlshq+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(36756003)(54906003)(316002)(6916009)(8676002)(52116002)(31696002)(86362001)(4326008)(2906002)(6666004)(2616005)(6486002)(66946007)(31686004)(16526019)(66556008)(66476007)(5660300002)(186003)(478600001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVpwclNjK29BUG9wR2IxZUtVemkxMXNIdTNUQzJQZ1VtOFpwWU5Cd3dwWGJV?=
 =?utf-8?B?d1d0SnVlbnBlZVp3RjNPbWhxOGdLU1FqcmJTcFlZckIrZU1Weit6NmFuQkl1?=
 =?utf-8?B?NHNpUVVBbGc4YVYzektNVkJEalFYUm15ZGlROHIxOTJTZjFlZCt5UGowRFIr?=
 =?utf-8?B?L2diN2ZRaUx6aS9jVS9zL2Fmc00wRzZnZVFDMXU4eGhYeVFrV3hjakJPaHRK?=
 =?utf-8?B?alR6VGdDOWZOSkJkMS9mc3Q3RDBOYmRHU3dWOUl2SlZ4ZW1KZzU0b2VuRGVW?=
 =?utf-8?B?Y0lkaWgvZ01QOGt0NFFwQVRsUEI1ZjJIeDNGRGFWWG5oYmtzZlpySE9zWHZH?=
 =?utf-8?B?RW5sWFhkSUdad0tvYTdSclQ5L2ZhRnExb1ZwTlNROVRTVTRBeG94OVBGMWRG?=
 =?utf-8?B?QkUrUmxlTVNhdGRqVDVoTTBUSTIrWS9OdzFtWS9RUk5TMzR4d2F6V21HbVZB?=
 =?utf-8?B?Rm1mZjBPWEw1YUZtK2xRTHFHQTVBL2RlNG0zdDNnaXI2R0FyZVFlZjhKbity?=
 =?utf-8?B?eU5QazNzOU1uZUlhREh1SDYrRFZpeEdpMnU4V3BEWS9TY01GK2s1eHp0b3lH?=
 =?utf-8?B?aUV3RG5KZEFYT1VWbTVpY0ZLdmVoQlN5c1Arelh0TmMyZFZWS1hrdlpBTjFj?=
 =?utf-8?B?RFFKMW4zeGdscjRSZ3FTR0NYK1lNTUUrOURFZDRFZG9Wd0cyaEppUWliZG5N?=
 =?utf-8?B?UjhUL2dXWkZNa2RMaDVTL2ZldUVBRnJ5alB2SjZqc3JqQTl5M3N3bFJjbTU0?=
 =?utf-8?B?cExlOXA5RlV0RUh1d3J4eHZrNHJQbnlCdjE5bzVCUlVyWmcvc2JTOUxOSC81?=
 =?utf-8?B?d1k1TWhQbGY4TUV4V2hHVVN5SWh3WVhPaHZocEtsYVg2bWRSMkdvQk5udVNq?=
 =?utf-8?B?YUg0TjhrNWFFb3lOU1d5dGJEYlFVK2lDTnZzSjB4cGhhU2RPbVVrN0hRMzJD?=
 =?utf-8?B?NDNqMlV0SGRiYVBhWUlEY0lrS2owTFZmNDhwOFRMUytveFh1ejhReHh2Wkhn?=
 =?utf-8?B?aUlOUU1mdmpHT0RXaWpNYXptckVCZE5USVZxT0VrbEdkWElWeWVpbDQrT3Nl?=
 =?utf-8?B?bGZldUNTckVSbzFOWTBUZzVsb21WVDdhZEh1OFk5RG9vN1ZwVnpNdkF4Wlow?=
 =?utf-8?B?NmVkZWFTbDdqYkVvYVhpWW5DOWFwcnVJYWpVa2ltMDdVOGYrdzFFanJZdS9Y?=
 =?utf-8?B?RFhaeXJwOVFmbDMvMFZBa0JHWlE4bVg5eDhkay85K210QmNjTlJpTjRmM2ts?=
 =?utf-8?B?dDlDMG9wYXplSGJkc0dKOTl0ZTk5Z0I5anRlSFVYRmtuZWpqbUFCV3RVaHZI?=
 =?utf-8?B?RnFOSWpkTG1uN01Hcm51YlFHbkFVSVhKQ3NURE91MGxGYnd1eHlBejRmSW9o?=
 =?utf-8?B?dW9kV25WUDBJVzdwVys5K3M0U2tkdGthSHgwdGFOQTFuYy9KUnBkNVpQdUtZ?=
 =?utf-8?Q?ndKqxYXm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 20:13:58.6053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: b2994725-6cdd-4583-54cc-08d8b0ed452f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9pe80WnKEQ5iOZRGf35G895K6ZPX7FsMCsGM6hbJCLWlI/OoUvmk8r9YXGoeywB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDEuMjEgdW0gMTk6NDMgc2NocmllYiBBbGV4IFdpbGxpYW1zb246Cj4gT24gTW9uLCA0
IEphbiAyMDIxIDE4OjM5OjMzICswMTAwCj4gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+PiBBbSAwNC4wMS4yMSB1bSAxNzo0NSBzY2hyaWViIEFs
ZXggV2lsbGlhbXNvbjoKPj4+IE9uIE1vbiwgNCBKYW4gMjAyMSAxMjozNDozNCArMDEwMAo+Pj4g
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+ICAg
Cj4+PiBbU05JUF0KPj4gVGhhdCdzIGEgcmF0aGVyIGJhZCBpZGVhLiBTZWUgb3VyIEdQVXMgZm9y
IGV4YW1wbGUgcmV0dXJuIHdheSBtb3JlIHRoYW4KPj4gdGhleSBhY3R1YWxseSBuZWVkLgo+Pgo+
PiBFLmcuIGEgUG9sYXJpcyB1c3VhbGx5IHJldHVybnMgNEdpQiBldmVuIHdoZW4gb25seSAyR2lC
IGFyZSBpbnN0YWxsZWQsCj4+IGJlY2F1c2UgNEdpQiBpcyBqdXN0IHRoZSBtYXhpbXVtIGFtb3Vu
dCBvZiBSQU0geW91IGNhbiBwdXQgdG9nZXRoZXIgd2l0aAo+PiB0aGUgQVNJQyBvbiBhIGJvYXJk
Lgo+IFdvdWxkIHRoZSBkcml2ZXIgZmFpbCBvciBtaXNiZWhhdmUgaWYgdGhlIEJBUiBpcyBzaXpl
ZCBsYXJnZXIgdGhhbiB0aGUKPiBhbW91bnQgb2YgbWVtb3J5IG9uIHRoZSBjYXJkIG9yIGlzIG1l
bW9yeSBzaXplIGRldGVybWluZWQgaW5kZXBlbmRlbnRseQo+IG9mIEJBUiBzaXplPwoKVWZmLCBn
b29kIHF1ZXN0aW9uLiBJIGhhdmUgbm8gaWRlYS4KCkF0IGxlYXN0IHRoZSBMaW51eCBkcml2ZXIg
c2hvdWxkIGJlaGF2ZSB3ZWxsLCBidXQgbm8gaWRlYSBhYm91dCB0aGUgCldpbmRvd3MgZHJpdmVy
IHN0YWNrLgoKPj4gU29tZSBkZXZpY2VzIGV2ZW4gcmV0dXJuIGEgbWFzayBvZiBhbGwgMSBldmVu
IHdoZW4gdGhleSBuZWVkIG9ubHkgMk1pQiwKPj4gcmVzdWx0aW5nIGluIG5lYXJseSAxVGlCIG9m
IHdhc3RlZCBhZGRyZXNzIHNwYWNlIHdpdGggdGhpcyBhcHByb2FjaC4KPiBVZ2guICBJJ20gYWZy
YWlkIHRvIGFzayB3aHkgYSBkZXZpY2Ugd2l0aCBhIDJNaUIgQkFSIHdvdWxkIGltcGxlbWVudCBh
Cj4gUkVCQVIgY2FwYWJpbGl0eSwgYnV0IEkgZ3Vlc3Mgd2UgcmVhbGx5IGNhbid0IG1ha2UgYW55
IGFzc3VtcHRpb25zCj4gYWJvdXQgdGhlIGJyZWFkdGggb2YgU0tVcyB0aGF0IEFTSUMgbWlnaHQg
c3VwcG9ydCAob3Igc2FuaXR5IG9mIHRoZQo+IGRlc2lnbmVycykuCgpJdCdzIGEgc3RhbmRhcmQg
ZmVhdHVyZSBmb3IgRlBHQXMgdGhlc2UgZGF5cyBzaW5jZSBob3cgbXVjaCBCQVIgeW91IG5lZWQg
CmRlcGVuZHMgb24gd2hhdCB5b3UgbG9hZCBvbiBpdCwgYW5kIHRoYXQgaW4gdHVybiB1c3VhbGx5
IG9ubHkgaGFwcGVucyAKYWZ0ZXIgdGhlIE9TIGlzIGFscmVhZHkgc3RhcnRlZCBhbmQgeW91IGZp
cmUgdXAgeW91ciBkZXZlbG9wbWVudCAKZW52aXJvbm1lbnQuCgo+IFdlIGNvdWxkIHByb2JlIHRv
IGRldGVybWluZSB0aGUgbWF4aW11bSBzaXplIHRoZSBob3N0IGNhbiBzdXBwb3J0IGFuZAo+IHBv
dGVudGlhbGx5IGVtdWxhdGUgdGhlIGNhcGFiaWxpdHkgdG8gcmVtb3ZlIHNpemVzIHRoYXQgd2Ug
Y2FuJ3QKPiBhbGxvY2F0ZSwgYnV0IHdpdGhvdXQgYW55IGFiaWxpdHkgZm9yIHRoZSBkZXZpY2Ug
dG8gcmVqZWN0IGEgc2l6ZQo+IGFkdmVydGlzZWQgYXMgc3VwcG9ydGVkIHZpYSB0aGUgY2FwYWJp
bGl0eSBwcm90b2NvbCBpdCBtYWtlcyBtZSBuZXJ2b3VzCj4gaG93IHdlIGNhbiBndWFyYW50ZWUg
dGhlIHJlc291cmNlcyBhcmUgYXZhaWxhYmxlIHdoZW4gdGhlIHVzZXIKPiByZS1jb25maWd1cmVz
IHRoZSBkZXZpY2UuICBUaGF0IG1pZ2h0IG1lYW4gd2UnZCBuZWVkIHRvIHJlc2VydmUgdGhlCj4g
cmVzb3VyY2VzLCB1cCB0byB3aGF0IHRoZSBob3N0IGNhbiBzdXBwb3J0LCByZWdhcmRsZXNzIG9m
IHdoYXQgdGhlCj4gZGV2aWNlIGNhbiBhY3R1YWxseSB1c2UuICBJJ20gbm90IHN1cmUgaG93IGVs
c2UgdG8ga25vdyBob3cgbXVjaCB0bwo+IHJlc2VydmUgd2l0aG91dCBkZXZpY2Ugc3BlY2lmaWMg
Y29kZSBpbiB2ZmlvLXBjaS4gIFRoYW5rcywKCldlbGwgaW4gdGhlIEZQR0EgY2FzZSBJIG91dGxp
bmVkIGFib3ZlIHlvdSBkb24ndCByZWFsbHkga25vdyBob3cgbXVjaCAKQkFSIHlvdSBuZWVkIHVu
dGlsIHRoZSBzZXR1cCBpcyBjb21wbGV0ZWQuCgpFLmcuIHlvdSBjb3VsZCBuZWVkIG9uZSBCQVIg
d2l0aCBqdXN0IDJNaUIgYW5kIGFub3RoZXIgd2l0aCAxMjhHQiwgb3IgCnR3byB3aXRoIDY0R0Ig
b3IuLi4uIFRoYXQncyB0aGUgcmVhc29uIHdoeSBzb21lYm9keSBjYW1lIHVwIHdpdGggdGhlIApS
RUJBUiBzdGFuZGFyZCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpJIHRoaW5rIEkgY2FuIHN1bW1hcml6
ZSB0aGF0IHN0YXRpYyByZXNpemluZyBtaWdodCB3b3JrIGZvciBzb21lIGRldmljZXMgCmxpa2Ug
b3VyIEdQVXMsIGJ1dCBpdCBkb2Vzbid0IHNvbHZlIHRoZSBwcm9ibGVtIGluIGdlbmVyYWwuCgpS
ZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gQWxleAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
