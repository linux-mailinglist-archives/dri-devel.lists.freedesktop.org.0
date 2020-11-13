Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B72B169C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 08:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B39D6E3FC;
	Fri, 13 Nov 2020 07:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBBD6E3FC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 07:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h21/ivwsn2HoY+aF+vya7hsYWq4wt+IK+zGHnHnoxSCaoIVJQqStiZjYMDd9Y3o1gobT0tUt0a6PBENgXa1uzfuF+stl6MwE6vwnhbmWzieWKBvEcfKnWHBknRzK+NHlgDX3QbWpXY++c5CzAGkFWgbzAaMw/+ZVxE0jmYu4vbqRSVyRoQ28HlwocZDMa5i8GHlLvcajozhxImPTXvgXYuaud92j3hVVqcplYkr40mhXmRbtqa0kVZCfXrNUW9hV8V8KbgJOS/6YNdQmEOlYJWv9hs3uZ35J6UrTcy9qL+x6IogMbFRkQy9ogPTgJhzamKaDcI+kd4X5XW73s7mhIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsdmyiCyCPXbFeV6LfGOl+HlH5Gj9yP2o+lB0aFp7cM=;
 b=AJLFa4Qfo0ma8dY9B6HcbUN72CEN++IcKFPqq7HyH+aF+1UOkjNq8nhwNBd/l+aj6vXhmVORzhezrkTiOjDtQwyyJZJ72+eyy9u8cEL4uDfQIX+spwBfbZxTvoRNuTcKCbhpNnrN8eD6dHItOyJBzSf1FEvA268M9OFRyfhXHS9MnKzgZxhI7g6NsUj/nUSdQuC4p+zgU96bRIMFM+2VYl3gD7pJGUV6R1PQypBFEz/I+dB+rL7vCbqmgM2Le/OECKXqmBVOcgHErmTHT3UzwSYvbsVAgfzmcXwwKd9CH1I68DOGOnR773Qy7rYUFBXSPWFz4MqCcOOlB5VNoTFG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsdmyiCyCPXbFeV6LfGOl+HlH5Gj9yP2o+lB0aFp7cM=;
 b=C1VcraHfbOMyVyCwIAesCutTXpd/ZnhlkDeGeMj4Ja+KroZqETOOfWm4yb75ASS9tWrLNgQ2+g2Q93nhxUfhMFJ/mJaQb9MpgEvUBPT4UaVCXGf725Ab/aOvxqC5Fc4fOFizqFWmFDaLR81DCwa1KyUkJG+wIDK7uqCyxP9CAfU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 07:42:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 07:42:00 +0000
Subject: Re: [PATCH][next] drm/ttm: fix spelling mistake "swaput" -> "swapout"
To: Colin King <colin.king@canonical.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20201112095013.53619-1-colin.king@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e83cb79d-0260-aa20-ae51-ac24f2fce719@amd.com>
Date: Fri, 13 Nov 2020 08:41:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201112095013.53619-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::52) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0084.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Fri, 13 Nov 2020 07:41:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d7cce68-1d11-4dfd-86ed-08d887a79acc
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23567EFFBA7E6C06E4F4663F83E60@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJx/XS9HJJvja8qj2k94P2Dn+GS0FWMfuvIub13hDWdnet8RTAu/6jkNg3sPapS5t9ObFdJUis/OzOembNvmH9fMo339JJkGkUq8QTHk891cVtPEXiY5iJTAZtCCviw4FkVmh6NNXgqwHCCRLaTb4Qkd1I7suUaW/RMVxGF7eJNtxNWgApmX8nyHwhzNZE+xRknlDz2lzb40/NVbsr8BdCwA0FM3kBBuIz9YaArEl4wD6T4F68BeAv5ysEBh/vwt+wo/A//8A9F0Ec9ip2+4TBK3T6u326E0XgQBxf/RaTVLY8u7mfmkjtdMlvEaD/3GUezxHRN4v9//ZNNGecc2pQLhh8RRzTyqbyFKwXZBw3HyTr+Y2/B7b2y61zletVuy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(16526019)(66574015)(86362001)(6486002)(8676002)(4326008)(2906002)(110136005)(478600001)(83380400001)(5660300002)(66946007)(31696002)(66556008)(36756003)(4744005)(31686004)(52116002)(6666004)(2616005)(316002)(8936002)(66476007)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dG9BV0JSaUNVUTlZME1SWXdNelFmRnlvRGd1akkyb29kcVV0QVgyc3FmQy9T?=
 =?utf-8?B?OEFiVWNTT0VScmkrNU9ISjNMbkNONWhrdDdPbVRoKzlBZkJFUy9TNC9MZXFC?=
 =?utf-8?B?bENwR1FTWXpISzF6YnYyQmRIVVBHUWxlK1AxUDlrclVma25sRmZRRDBkaFlT?=
 =?utf-8?B?bDBMRTFINFkzSkRhbVNCYmNGRmtyZDlKQWI1TzZyS1lBc1ZYSWU1KzRyRk0x?=
 =?utf-8?B?c0dHdUNuVHhYUVZidWdDb3pUVnZJbXVaVVNyZHYrWTA4ZlFqUU5yc25ZcGhQ?=
 =?utf-8?B?NUM5S3J2SEJoaUp1YzVSYjNlVXFlOGlyS3ppTG55NDBHNDFOQWg2c2FLM1Zw?=
 =?utf-8?B?OEl2R2JKeXVxRnJ5THd2YUxLS3lMSzZpa2V3eno3OFN0RDVUMExJV0Frc1Nh?=
 =?utf-8?B?S3JLYlhzTDh5Nis5WFF4Mm03VUpBWld6T2dHenNnM2Fqb2hLRDBodWk5OHZs?=
 =?utf-8?B?MDM0UUFaM2FPSjY5eVJsS0xTL2ozOHZpNTI3U25DR2JxK3R0QUlSSXl2MWtB?=
 =?utf-8?B?NVJwM0Zrc0xxUmp6by8xak5FYkg0c3F4aElnZit4bFB0emY4a25jY0U3NE1I?=
 =?utf-8?B?RDhRWVp0WFV0ZTB2cTNJMGIxb2cvMWdHVVBIRmZ4U2o1OVYweWhVTjFzVEpL?=
 =?utf-8?B?TE1wb3I1VDRYVEoweHZ4VWpJNmRaNmFIUDZyVzk5SmFUbC9tYThuVXpTRUJU?=
 =?utf-8?B?MC9Pam9MVmt0ODkrM3E4VXdDT1p4WHVrYzF1bm51d0ptQkd1MVVpWEd4Uk9j?=
 =?utf-8?B?eHc3OStzc0dVRjBjcHNZcUJjSVJxN1c4cEdlaVdGT05JMlNwdGVNWWtKMWxX?=
 =?utf-8?B?RkRjV1ZlR1ZsV01xbUpQbW1VU1FRZXppWUpkMFVkZ2d2a1pCdjdpbkZ3Z0N6?=
 =?utf-8?B?MlVFL3pBb001eVZHdzFVdVpUSmdJTW1mMDRJSmlzK0w5bEpVM3kvUzVMRzYz?=
 =?utf-8?B?SHYxdFhDNGNTNjRFSzJVbUNrMXhLWmg0VzRZN2NaSU5BT2tscmwyUlZ4SHdL?=
 =?utf-8?B?VCtwK040cU9pYzVEbUNHQXdxNFZRamJZL0ZGZ3JSczQxZjNxanppSnZxb1pn?=
 =?utf-8?B?a3AvZzc1aFMxTW05Zm0veWZDRm1pdDhCRmZOK0o4eW9PaEFORm1JQnI1aXBv?=
 =?utf-8?B?L1pPVk1EcWhMNlRXdkN2dUMyNzlUT0I3YVdCaVk3UFBYUW1BTGh6Q2Y4R3h1?=
 =?utf-8?B?dHI1NytnQk5HVkkrZTFKaEhLZkE0Y1RlQkJQSG9xNnBTUEN4Tmh5TUNHQXRE?=
 =?utf-8?B?ZHNqakhQaW81VGlzMWtqcEFGN2c3bXVSc3JscDN5TGNldGhoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7cce68-1d11-4dfd-86ed-08d887a79acc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 07:42:00.0747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Doajy5rP/Irokd09z5Iw9bzthGeM1dxB4Ms+na4TiAeL28XccJ5NauykpukQSj8w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMTEuMjAgdW0gMTA6NTAgc2NocmllYiBDb2xpbiBLaW5nOgo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBUaGVyZSBpcyBhIHNwZWxsaW5n
IG1pc3Rha2UgaW4gYSB3YXJuaW5nIG1lc3NhZ2UsIGZpeCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IGU2
YmNiZmU1MzBlYy4uZDMyY2E4NzM0YWE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTE0
OTQsNyArMTQ5NCw3IEBAIGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX29wZXJhdGlvbl9j
dHggKmN0eCkKPiAgIAo+ICAgCQlyZXQgPSB0dG1fYm9faGFuZGxlX21vdmVfbWVtKGJvLCAmZXZp
Y3RfbWVtLCB0cnVlLCAmY3R4LCAmaG9wKTsKPiAgIAkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkg
ewo+IC0JCQlXQVJOKHJldCA9PSAtRU1VTFRJSE9QLCAiVW5leHBlY3RlZCBtdWx0aWhvcCBpbiBz
d2FwdXQgLSBsaWtlbHkgZHJpdmVyIGJ1Zy5cbiIpOwo+ICsJCQlXQVJOKHJldCA9PSAtRU1VTFRJ
SE9QLCAiVW5leHBlY3RlZCBtdWx0aWhvcCBpbiBzd2Fwb3V0IC0gbGlrZWx5IGRyaXZlciBidWcu
XG4iKTsKPiAgIAkJCWdvdG8gb3V0Owo+ICAgCQl9Cj4gICAJfQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
