Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A518D203E1F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 19:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87CB6E86C;
	Mon, 22 Jun 2020 17:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9376E86C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 17:36:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoQGpFKlOlKdGHkK0+XnMk+v2CcWGd1RdDe5xB0xJbtwr95MxKtIMR7+bzRUShzetinrZS61D5e5h1b+IJAeYHb/0HnWv3sGzRX9yUcqYUEKsoHuw5rEVcvs4YWYED//r8uM0scrONE6POfJk85T4F4mk+NeA739nlws+x3n77Vcz0wI4IIUYcddxhm+nX9LKvIo3IjSm6TM0lMo4s8eTgu865ShF+HWDJBnrchKvDlGyqyxh+AXWYaBMjO+7eufX7jChDGYmmPEkWR2pv+Nj+9rzq5k8WSmU3YvBaj2wmk8viKY1M7JZ8DE6NKUWtxDl/KkSqO0p1b5OeVzIUHhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afFAMDebkb0cloL10Chyv0Zq4dDZ/mkG01he3fjR/6Y=;
 b=H/Remc+BpPNbqM7npLTZYO11NfJKK1lc9UENDgg221nnl+KzDriDsFNy1sGOKSzpWtEvOnD1zKp+I/CSkbqCwR2lQjacWUj0Aeu1JcVPbNob9LnmnjQmhIlZ7lp6Y7z3Ak649f7ThrDnNnJYktOgU0qN6GlhqyH8/Mrw5mgCBS6tjSeuQhoIxcoqVMyIegyNGt8WjT9bu8rqT9X/T6K7KupX/KtXde2lYpRDgSN2MkN/kIbnmrgpMr7zMZSKf2FGtbW7jHx66e3AgUb3+NXZvZgJgSBfTrxpn6mNRI1hyZ80W8iG3gE01kowu3eSkZ7+C223QnfUvAsKt29e7EyMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afFAMDebkb0cloL10Chyv0Zq4dDZ/mkG01he3fjR/6Y=;
 b=dLISJigww+W8+rO6igaeCdXdzRECIPTQdAKVaMV1bUlQPhDW5e2FTvZrPdHmBk37f9Z7au8EiPJGfbt0q3ZZOj7ZpeNi6pxW3QucZTxEQMwII4AW/xKBnCmiMQ3Uq9MvDZAZbT8yuNRENHa7JLweZzmEekEpLvvFmc76Mv5Slzg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM5PR12MB1324.namprd12.prod.outlook.com (2603:10b6:3:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 17:36:55 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 17:36:55 +0000
Subject: Re: [PATCH 1/1] drm/mm/selftests: fix wrong return type casting
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <21094d57-c64e-ea7e-426e-997cd45d4635@amd.com>
 <20200622134533.15759-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2613f855-0efe-55dc-ee88-56fbf95bb9b0@amd.com>
Date: Mon, 22 Jun 2020 19:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200622134533.15759-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:110e:f147:6917:2b2f]
 (2a02:908:1252:fb60:110e:f147:6917:2b2f) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 17:36:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:110e:f147:6917:2b2f]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c281764b-99bc-497e-98a5-08d816d2db96
X-MS-TrafficTypeDiagnostic: DM5PR12MB1324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB13241C1F349E087FAFB27E5A83970@DM5PR12MB1324.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/bS+iRdLtIj10GKHL0c2GGspzK3u2bnNE+v2u8bKYWVQ6Y06cJF/UpLD3FoGxs9qcITCi4TBK33HygQbV23baakyFe5B18d35Uu2zj4i+4mvG0cKkudU9p9zThXF/bSLCcOXBAo2Ue3JQmL2FMBi+CgKZWZtZkOtZRgrXEnoT2lGAmxRKCvoDH/pkWyHxsgz3s6Uxa/tSAso1M87VjC+39PoIamZ9brDT+iMWGna2bIOflKyeX3UaHBI0lJtGkiXP0oTpOIjaUj2b65yPzZ+WrHdX5NKl81a5SnLsW84ih4ZaB8y+bgfpLE1NeYyCaaMUFZT6Qvambr1rG9MJ+jzpfEe7/kGRL9hgJQbkrzfxjZjtv/u9cSEjM70YHp68J2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(36756003)(5660300002)(52116002)(8936002)(316002)(86362001)(6666004)(6486002)(31686004)(186003)(66946007)(16526019)(2616005)(66556008)(66476007)(8676002)(478600001)(31696002)(83380400001)(4326008)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GaNKs5wR/NPhG9gEO4S9VNr/CmBchLuBYz6b1nbI8CV03fsxJ6HDMi9TdviD6b5jJxR2A4CAyL2t6ewhbqUlPKyQSaIICugTiFNlndK7VfuXsU64UaMVsU2HJzOIyFbE+GL1m7jyFLofccta6AKKcs0b49Rrz5HwWFYkwTohy2i1MgaCbFLxY6BW0jnDkXd6QbLBPVrk2zE68Io0438tMyHKB+/69tolICly6szYgX0l//N6fxccNNRAFxWtcuRvZv0QEArhIEZiDC41IA2yrLGqGBtW7UQn6Dfk4MXSvjD+WSf7lC4piYl1kBDyEZsucndPVXQ/JrZFGOGigxAhLjf0saBn+O2/6YjZXh3+2vp77Dvs99g+TFX1MJHPNlAPTBG2LyYIVUX88NxKDWfvddk40wrAYgY+dSZs3WtpeKFBVZ0PjC0hbTHiFJg272f6htHQrs3gZMynebPYe8zRT3OyK7tV5mF96hVqOgNV7F7cd6lHBuYX0Gx5587jObZekskdr4WnLDREYtI1YiIgNhwO4CbFUb+pRLknD9VAAKo6cbtNQInfDOjJ/YVvHg8d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c281764b-99bc-497e-98a5-08d816d2db96
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 17:36:55.7043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWUuoGjqeKxoeF0NeXDhVYhYGmOmZHvAmDxIHTXN1Q8woHPgex2/5JIv7zO9VPMr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1324
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
Cc: colin.king@canonical.com, Nirmoy Das <nirmoy.das@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDYuMjAgdW0gMTU6NDUgc2NocmllYiBOaXJtb3kgRGFzOgo+IEZ1bmN0aW9uIHByZXBh
cmVfaWd0X2ZyYWcoKSBhbmQgZ2V0X2luc2VydF90aW1lKCkgd2VyZSBjYXN0aW5nCj4gc2lnbmVk
IHZhbHVlIHRvIHVuc2lnbmVkIHZhbHVlIGJlZm9yZSByZXR1cm5pbmcgZXJyb3IuCj4gU28gZXJy
b3IgY2hlY2sgaW4gaWd0X2ZyYWcoKSB3b3VsZCBub3Qgd29yayB3aXRoIHVuc2lnbmVkCj4gcmV0
dXJuIHZhbHVlIGZyb20gZ2V0X2luc2VydF90aW1lKCkgY29tcGFyZWQgYWdhaW5zdCBuZWdhdGl2
ZQo+IHZhbHVlLgo+Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVuc2lnbmVkIGNvbXBhcmVkIGFn
YWluc3QgMCwgbm8gZWZmZWN0IikKPiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3ku
ZGFzQGFtZC5jb20+Cj4gUmVwb3J0ZWQtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1k
cm1fbW0uYyB8IDIxICsrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0
cy90ZXN0LWRybV9tbS5jCj4gaW5kZXggMzg0NmIwZjViYWUzLi4zMzA2ZDhiZDA1NDQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jCj4gQEAgLTEwNDEsMTMgKzEw
NDEsMTIgQEAgc3RhdGljIGludCBwcmVwYXJlX2lndF9mcmFnKHN0cnVjdCBkcm1fbW0gKm1tLAo+
ICAgewo+ICAgCXVuc2lnbmVkIGludCBzaXplID0gNDA5NjsKPiAgIAl1bnNpZ25lZCBpbnQgaTsK
PiAtCXU2NCByZXQgPSAtRUlOVkFMOwo+Cj4gICAJZm9yIChpID0gMDsgaSA8IG51bV9pbnNlcnQ7
IGkrKykgewo+ICAgCQlpZiAoIWV4cGVjdF9pbnNlcnQobW0sICZub2Rlc1tpXSwgc2l6ZSwgMCwg
aSwKPiAgIAkJCQkgICBtb2RlKSAhPSAwKSB7Cj4gICAJCQlwcl9lcnIoIiVzIGluc2VydCBmYWls
ZWRcbiIsIG1vZGUtPm5hbWUpOwo+IC0JCQlnb3RvIG91dDsKPiArCQkJcmV0dXJuIC1FSU5WQUw7
Cj4gICAJCX0KPiAgIAl9Cj4KPiBAQCAtMTA1Nyw4ICsxMDU2LDcgQEAgc3RhdGljIGludCBwcmVw
YXJlX2lndF9mcmFnKHN0cnVjdCBkcm1fbW0gKm1tLAo+ICAgCQkJZHJtX21tX3JlbW92ZV9ub2Rl
KCZub2Rlc1tpXSk7Cj4gICAJfQo+Cj4gLW91dDoKPiAtCXJldHVybiByZXQ7Cj4gKwlyZXR1cm4g
MDsKPgo+ICAgfQo+Cj4gQEAgLTEwNzAsMjEgKzEwNjgsMTYgQEAgc3RhdGljIHU2NCBnZXRfaW5z
ZXJ0X3RpbWUoc3RydWN0IGRybV9tbSAqbW0sCj4gICAJdW5zaWduZWQgaW50IHNpemUgPSA4MTky
Owo+ICAgCWt0aW1lX3Qgc3RhcnQ7Cj4gICAJdW5zaWduZWQgaW50IGk7Cj4gLQl1NjQgcmV0ID0g
LUVJTlZBTDsKPgo+ICAgCXN0YXJ0ID0ga3RpbWVfZ2V0KCk7Cj4gICAJZm9yIChpID0gMDsgaSA8
IG51bV9pbnNlcnQ7IGkrKykgewo+ICAgCQlpZiAoIWV4cGVjdF9pbnNlcnQobW0sICZub2Rlc1tp
XSwgc2l6ZSwgMCwgaSwgbW9kZSkgIT0gMCkgewo+ICAgCQkJcHJfZXJyKCIlcyBpbnNlcnQgZmFp
bGVkXG4iLCBtb2RlLT5uYW1lKTsKPiAtCQkJZ290byBvdXQ7Cj4gKwkJCXJldHVybiAwOwo+ICAg
CQl9Cj4gICAJfQo+Cj4gLQlyZXQgPSBrdGltZV90b19ucyhrdGltZV9zdWIoa3RpbWVfZ2V0KCks
IHN0YXJ0KSk7Cj4gLQo+IC1vdXQ6Cj4gLQlyZXR1cm4gcmV0Owo+IC0KPiArCXJldHVybiBrdGlt
ZV90b19ucyhrdGltZV9zdWIoa3RpbWVfZ2V0KCksIHN0YXJ0KSk7Cj4gICB9Cj4KPiAgIHN0YXRp
YyBpbnQgaWd0X2ZyYWcodm9pZCAqaWdub3JlZCkKPiBAQCAtMTExOSwxNyArMTExMiwxNyBAQCBz
dGF0aWMgaW50IGlndF9mcmFnKHZvaWQgKmlnbm9yZWQpCj4gICAJCQljb250aW51ZTsKPgo+ICAg
CQlyZXQgPSBwcmVwYXJlX2lndF9mcmFnKCZtbSwgbm9kZXMsIGluc2VydF9zaXplLCBtb2RlKTsK
PiAtCQlpZiAoIXJldCkKPiArCQlpZiAocmV0KQo+ICAgCQkJZ290byBlcnI7Cj4KPiAgIAkJaW5z
ZXJ0X3RpbWUxID0gZ2V0X2luc2VydF90aW1lKCZtbSwgaW5zZXJ0X3NpemUsCj4gICAJCQkJCSAg
ICAgICBub2RlcyArIGluc2VydF9zaXplLCBtb2RlKTsKPiAtCQlpZiAoaW5zZXJ0X3RpbWUxIDwg
MCkKPiArCQlpZiAoaW5zZXJ0X3RpbWUxID09IDApCj4gICAJCQlnb3RvIGVycjsKPgo+ICAgCQlp
bnNlcnRfdGltZTIgPSBnZXRfaW5zZXJ0X3RpbWUoJm1tLCAoaW5zZXJ0X3NpemUgKiAyKSwKPiAg
IAkJCQkJICAgICAgIG5vZGVzICsgaW5zZXJ0X3NpemUgKiAyLCBtb2RlKTsKPiAtCQlpZiAoaW5z
ZXJ0X3RpbWUyIDwgMCkKPiArCQlpZiAoaW5zZXJ0X3RpbWUyID09IDApCj4gICAJCQlnb3RvIGVy
cjsKPgo+ICAgCQlwcl9pbmZvKCIlcyBmcmFnbWVudGVkIGluc2VydCBvZiAldSBhbmQgJXUgaW5z
ZXJ0aW9ucyB0b29rICVsbHUgYW5kICVsbHUgbnNlY3NcbiIsCj4gLS0KPiAyLjI3LjAKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
