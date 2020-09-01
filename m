Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D1258F44
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 15:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725976E420;
	Tue,  1 Sep 2020 13:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AAF6E420
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 13:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMezK79wB7tpzd59BENeXb9r7Th4tWveE5WDhrCWkLobhhPuodsS6k1kgjRX6ljRghKZWJfCkJPJTPYVGsXIeN3fGfg26J8nzmB5uqcUv0Wth/K8tACpyLRllkajKhGFSGFbtQ2Ys9C2S49jipRGMXqWtUivJeJ2/ShaK2bJ1hZ/4wKwst7WhQmh5kk2xFqZPNldofGYp82bVPQQwWdLxlYQp5jeFaZnOblooeAvbkIKVRt4QqZQootFVMwNPD46clQCsyAYqxO8e4gMOUGxZkYPu0GHLrphP1b6vJKjjXt8hgOIeNsgtUCRSjsRjR2r3AzRCMAAHSeEw0Yrkg6WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KagnyXdQMN2/Anw0GBWefhKxJdGB26CAdN+TKRRuGg=;
 b=OWurUi7Ss1To0CpWCvsUs2+5EnfafdfRGSuacsWyQNmHUgbB0h0Sk6KFy/x43KHKsszs2anxpEtYgAWzIWgDukS2XXkQV4UOxgaXYICFGs7kYKOq8LCvw83Y4M0OnXuBmdzjo1lU9axYKoL5uDADrBKqgxxiY0W/wGC+vMEveKsGnX0zAWTi2aiuLrlOm00YaHWDF7Z6mp8RN9nnmn3C1ZX+kR1joKERRW9oIgku3B02baukcoN7IGz2DRtkPtGNUDEk+Hm43L4P640WuX2TwB129Ii1dMoqEvU0LgNvl8egi1S0yYhIs3hTsuKP8vPzdKFvDF3nHbBRBPx14ysKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KagnyXdQMN2/Anw0GBWefhKxJdGB26CAdN+TKRRuGg=;
 b=LmfBjQaCUt0a3BBWv1RmMT1xUuae/TxyZI+u6pnjFgltzouHS6Kz9AjHrSLb5ju8c8/AWVjWrFuV3hmcwOqz3qKjpk001MTlgN7wTRjHfJ6D2EWuvNLRYd/RHluaFOCjsOoG8hI722LHCv1DX3mVgteU8DEEshIyVE1zS1rykjc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Tue, 1 Sep
 2020 13:37:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 13:37:42 +0000
Subject: Re: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20200831041713.12571-1-rdunlap@infradead.org>
 <81dc0a34-90f6-401a-f846-924fdff4aaff@amd.com>
 <20200901133200.GE2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d057988a-7ba4-7e3b-1c36-e40e9a5a8d9a@amd.com>
Date: Tue, 1 Sep 2020 15:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901133200.GE2352366@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:205:1::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 AM4PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:205:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.5 via Frontend Transport; Tue, 1 Sep 2020 13:37:38 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1ec1d14-a131-4294-6133-08d84e7c3224
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40470675FBE366BE32188FA0832E0@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTHMrM49Z867gCEjuDGoBrrZcboDoj30UMKuJwpElh0gK/QS9pRaTgKSyQKbTXHXM1urV1XisCflTOvsB3p7GvR3mfX8r8V8QHxZezCgqEXnQJ2VQGCbGhDKLMFJ49/c3t6fUwHsAoeVfTdwMZ6QYuYHJquNpdxRJrbb5OMN2k3IdqB35PIEhADmL/f67nEwvlEjWGQRO9yIIPYiOykkGNaNpSnbjVCr9iUVQZAkB3AvniLXEClj6xbBGVub7TgpYfj67a7twYvYx/5G4+FDSteYV0IMGz07JoFh81QNU9g+SPghDkhA6HidAtoV6JtkcpvAKkjCehk+MAC0T8eotTrFoSGtze5M1wKjzz9ofYnNv4qRjk8Nk7RAO9lkxU2GswjwM+5WaZDiF8fOhQ9RMTCHagGxo67hA/3bkrUr08I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(86362001)(31696002)(2616005)(966005)(956004)(478600001)(6486002)(36756003)(6666004)(316002)(110136005)(66574015)(16576012)(83380400001)(8676002)(66946007)(186003)(52116002)(2906002)(66476007)(45080400002)(5660300002)(31686004)(8936002)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mZRydIosolN29KQyRHWZbwGw3z7WvTVuuk/GxRDYI+U6A4bU/OHt5mJLr8jK1nQC6pvD/A5yxBr00l2pxsc9DI+adQvyTE1Iw7ZmIX2viYHrLQriutYwpFbfRlVCxRLCdmguGZ49VZ/dTIGcDGLM4TjdG6bVsWdLzyCnAh8LxzesX1p/Q4RYFgSRN5dmqiGENcOzzNMKC0rugwi1w4GU2cEo5Sxu6L7IRa52HdvhOFf/UTcZ4Jil+VzmiCVBxVGxPyjgIG0jCXoocZoSdrrrTnHJwZZp0NzTTrdKYF5ixiIMvm6/zT4+JdlqAOsI5IDJjQXJouv9iRnc7/rRa/doFs92w24rwGRF252I/sQLLt75bUx984OfgjjcHtZcIvxMpE3502PGmnhbaoe5dbfsbJruJrtJc3sOFCy9pmCk5/HbhZdxnkU0T6f7L7m81iG+x+alghW1ixB9HBPZ896Acql/NMhkVeyjWUsCQYNvN81rdnbeZ79RoU08A3ImTcVjDBa/ft0p4idSG+upHOBQE02sKzm654zvDyeNc1szUMFt68Vilvo5iGoSZwqebF7r0/KAH1JB87zF0hAGi3DBPC58iaTLGB/fP4OHO9gSqNvJGBveqoXBYlAOM3JZXnE5qfsVCxgmi2gJ0DOkKWXiqTb9xByCip2lQdkiAm4so5Z8bvl6JAfRoIIl91kCzzL3l++1peXCYykpTqqlBmnP0g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ec1d14-a131-4294-6133-08d84e7c3224
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 13:37:42.5924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QR7xaG1AUouuRPXLADhPWS+qImtfoTVNYo5PJUKzIEbwsEwjvc9Frm7kJjXnF6P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMDkuMjAgdW0gMTU6MzIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgQXVn
IDMxLCAyMDIwIGF0IDEyOjAyOjAzUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDMxLjA4LjIwIHVtIDA2OjE3IHNjaHJpZWIgUmFuZHkgRHVubGFwOgo+Pj4gQWRkIEBjb29r
aWUgdG8gZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKCkgdG8gcHJldmVudCBrZXJuZWwtZG9jCj4+
PiB3YXJuaW5nIGluIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYzoKPj4+Cj4+PiAuLi9kcml2
ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmM6MjkxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdjb29raWUnIG5vdCBkZXNjcmliZWQgaW4gJ2RtYV9mZW5jZV9lbmRfc2lnbmFs
bGluZycKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz4KPj4+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+
Pj4gQ2M6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2b0BwYWRvdmFuLm9yZz4KPj4+IENjOiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+PiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IFdpbGwgeW91IG1lcmdlIHRoZXNlIHR3byB0byBkcm0tbWlzYy1maXhlcyBvciBzaG91bGQg
c29tZW9uZSBlbHNlPwoKSSB3YXMgd29uZGVyaW5nIHRoZSBzYW1lIHRoaW5nIGFuZCBqdXN0IHdh
aXRpbmcgZm9yIFJhbmR5IHRvIHJlcGx5IHdpdGggCnBsZWFzZSBwaWNrIHRoZW0gdXAgb3IgSSdt
IGdvaW5nIHRvIHB1c2ggdGhlbSBiZWNhdXNlIEkgaGF2ZSBjb21taXQgYWNjZXNzLgoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKPgo+IEFsd2F5cyBhIGJpdCBjb25mdXNpbmcgd2hlbiBtYWludGFpbmVy
cyByZXBseSB3aXRoIGFja3Mvci1iIGJ1dCBub3Qgd2hhdAo+IHRoZXknbGwgZG8gd2l0aCB0aGUg
cGF0Y2ggOi0pCj4KPiBDaGVlcnMsIERhbmllbAo+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYyB8ICAgIDEgKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4+Pgo+Pj4gLS0tIGxueC01OS1yYzMub3JpZy9kcml2ZXJzL2RtYS1idWYvZG1hLWZl
bmNlLmMKPj4+ICsrKyBsbngtNTktcmMzL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwo+Pj4g
QEAgLTI4Myw2ICsyODMsNyBAQCBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9iZWdpbl9zaWduYWxs
aW5nCj4+PiAgICAvKioKPj4+ICAgICAqIGRtYV9mZW5jZV9lbmRfc2lnbmFsbGluZyAtIGVuZCBh
IGNyaXRpY2FsIERNQSBmZW5jZSBzaWduYWxsaW5nIHNlY3Rpb24KPj4+ICsgKiBAY29va2llOiBv
cGFxdWUgY29va2llIGZyb20gZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcoKQo+Pj4gICAgICoK
Pj4+ICAgICAqIENsb3NlcyBhIGNyaXRpY2FsIHNlY3Rpb24gYW5ub3RhdGlvbiBvcGVuZWQgYnkg
ZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcoKS4KPj4+ICAgICAqLwo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9uYW0xMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRh
PTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzRkOGQ0M2ZiYmIwNjQ3NWY5
NjQzMDhkODRlN2I2YTA1JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzM0NTYzOTI1NDYzMDM0NiZhbXA7c2RhdGE9aHhyYUJ4Y2E0b3hIJTJCc3ZSSmFEVDQ0
a0ZwJTJCQVhsdW4yR2FMWVk2TDZMZEElM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
