Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C7F297513
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37146F902;
	Fri, 23 Oct 2020 16:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C286F8F4;
 Fri, 23 Oct 2020 16:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3D29VhJHRMLemEI0Q/FHe3ZtV0oEO/9n4yI4X67oT7r2HFVLChpry0MVfoj77BOlvwdVT6dZq2YEuhmK6nrAcV+Kxkhxs8bkeIpMw+thuXJjUkDt/MfJ5F/HOPI1FmPqAB24yQUZl/4KiVD7jehFZt2y0nEgVeqaftgzcgSusPGFYvOb7kRxXfI24ck0OxbvYcnhebXd7POxRpnmIeqW6ulbBVG/C2uWUm41mqXD0RfMLIVoBRSvU0FNu8rpFVrjY6f21Sg/0vEqlisZ4a8Qcj1zchKK+LF0VemIbl8olIP3GBg0jcXBZL54SdjFZLQMEA1gyPeEKJZYWEt9qRwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb6xlH+YsIQLQra1S6TBPMNI9X0yX0l13txSZtFBGYk=;
 b=WTJHLhle0H6qOQ2srWU3A1tmT5vb1OmHLq9NDtSI8KevbeMrRnLIYSCb6A/tPHkc4PejHDFpgltmQYPIEXCoDiiQ0c9VDRJnctHDfgjWbOYzlLbw/mjC6lptJum/Motk5UawXilKfLHLKToBc5Zdo02TSRJ17zKoT50IMbt6SerI+5d9J+I/i4oLUqyXP013RQOYtKH6mLwtKI2n7SipsqQAP9CBKj+HeHikbkLvjx5yg8IVkuKkLuHT0NVgLOVixl1ZlzMFX6UuRxCrPbMMZEoLIRNSrmoml7oazbTL2CYSy/HUjvvt82Zi/ucOzA3dT9HVoUYLShVkcV7P7k4brw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb6xlH+YsIQLQra1S6TBPMNI9X0yX0l13txSZtFBGYk=;
 b=AGUbVTGo9ov97LluCKr1swnUHrzAZnCtG96/IqvY9YudlZkxk2P1ekmCjH1s4tw/R576uSQOoX9EM/aMdOuczAGegQoe/u3imiSL5H7u+dxbvrokMMAX9Ij9lah5EBslO0nKUCYMWU6ZrKYBoyUerikAQ5EGqli7yFcnAXDGQBU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 16:51:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 16:51:00 +0000
Subject: Re: [PATCH v3 11/56] drm/amdgpu: fix some kernel-doc markups
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <ffc1f2d59fd5005f365eb5d178a2d890112bb6bb.1603469755.git.mchehab+huawei@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5e7a3500-a84a-1dfb-0841-bb624eba30c8@amd.com>
Date: Fri, 23 Oct 2020 18:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ffc1f2d59fd5005f365eb5d178a2d890112bb6bb.1603469755.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0701CA0027.eurprd07.prod.outlook.com
 (2603:10a6:200:42::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0027.eurprd07.prod.outlook.com (2603:10a6:200:42::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.7 via Frontend
 Transport; Fri, 23 Oct 2020 16:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eae4bd9c-256f-4b08-8bda-08d87773d1a0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417977C14AE775EA4961216831A0@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8scQpRbzcT2TTnlvPEXmz8V++e2H+hT0LohqzgNjkPkS/A0KCvWsnGNAQ3ZsUTi8hHKE0aDQXCT0DD+DWrE8wEOLy45N+bmo39TA9b2un/LdxLE4/bqVBSFW/vl2G4TJ3kIaBbIvBnMrgK7qYjIZmSaOiSrdquP4N1fTXd/N6fYi1a5S2nGYYXZGibLuoDZ3nuY2KYw7e2GhqGwl2ymmFFkpqUWRmpb9FijdcVjlx0tzZBNL5t2b2ZaIhUe24RdKcwW7hGjoOp6b+VgQGA3S7JA20zybmLK7QUyXKI8CgL3onEm01A8kSuJqlcwsCJt5gMctSBOYwsTXopNvN8XJdVvVyCdlY0XBb9R9Uo6Mxcuf8Soli3BBN2akQ1cgbPS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(86362001)(2906002)(478600001)(54906003)(83380400001)(66574015)(316002)(6486002)(8676002)(31686004)(186003)(2616005)(16526019)(8936002)(66556008)(66946007)(52116002)(4326008)(31696002)(110136005)(5660300002)(66476007)(7416002)(6666004)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tRk54PN/KWpnXgbWV+uUTlP4+b9JbqCBaTZL4ilWcG83MA9koGhT2E8lRFAaXrO8/ZH5o6N3wg11pQG48hEAIgzZE0EUh1IOQ1fnffWb1+ooRQWsRwtTtv1QCHvep/fzk5TXVVbZFQWVEegHYQ9k4pjfcXBKyIF3c5XwWlCcH9Wgmjr2jga5Yomu/gi3jpmkFoB+O9pu6+eLpaZkuMsPU4uamBGzygkljKnTfzdZIlntdpOwa0T1n+MHvJUmlFeEEnp3yjlwcWDkbYXVRtjtGS6RiaaJNOgs88lJO4I6uHSrDV+mdIJOjl17z4NQ3CzsvCxjd9XiDsNMGBsfDLV9TUL3OxYFtG+hlpVQ5BQ0XMauBAWo9P/bH5AFzMo9GGf+KdRhIykESYpccteRkSYax4AFOTCxUExI6YPSEZ6TeArYF5O0DuuDV4h5xI3EsnxnvG7xO6A+D1qlYOHUCNKou2TuU/9wsfX8fwKAdKconcKHXUcXyufQZtiicGR/iqAx39TPqeM5xG+0yyKoNvQ7zo21Ok+R6Yd9V8NglH9wsGMAV3fYoNi04kCzJizYFgitaC3BF4uJq9turwtoBtBy3nOyfx+aHkHTSAh5PkFqB9knTmokzb7EJH1t4PKSs0ZKjY/H+iptYQ6jxNpHqgAyThSFLRAHl2X6UzcKwnfzO0WeqTQ/1/GUFYV2xZ9OPiBaTrfecYOnNiegT7xKmii+Zw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae4bd9c-256f-4b08-8bda-08d87773d1a0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 16:50:59.8277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10tc9HHyD1mlCQ02XT8VEVaiJaC7ZF0PF0FSVrdmYcBmQkLLZmvChBvfaR8+tulP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
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
Cc: Alex Sierra <alex.sierra@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jacob He <jacob.he@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMTAuMjAgdW0gMTg6MzIgc2NocmllYiBNYXVybyBDYXJ2YWxobyBDaGVoYWI6Cj4gU29t
ZSBmdW5jdGlvbnMgaGF2ZSBkaWZmZXJlbnQgbmFtZXMgYmV0d2VlbiB0aGVpciBwcm90b3R5cGVz
Cj4gYW5kIHRoZSBrZXJuZWwtZG9jIG1hcmt1cC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgICAgICAgfCAyICstCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDIgKy0KPiAgIGluY2x1ZGUv
dWFwaS9kcm0vYW1kZ3B1X2RybS5oICAgICAgICAgICAgICAgIHwgMiArLQo+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IGluZGV4IGRmMTEwYWZhOTdiZi4uYTVmNzNhMjY3ZmU1
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBAQCAtMjE2Niw3
ICsyMTY2LDcgQEAgc3RydWN0IGFtZGdwdV9ib192YSAqYW1kZ3B1X3ZtX2JvX2FkZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAo+ICAgCj4gICAvKioKPiAtICogYW1kZ3B1X3ZtX2Jv
X2luc2VydF9tYXBwaW5nIC0gaW5zZXJ0IGEgbmV3IG1hcHBpbmcKPiArICogYW1kZ3B1X3ZtX2Jv
X2luc2VydF9tYXAgLSBpbnNlcnQgYSBuZXcgbWFwcGluZwo+ICAgICoKPiAgICAqIEBhZGV2OiBh
bWRncHVfZGV2aWNlIHBvaW50ZXIKPiAgICAqIEBib192YTogYm9fdmEgdG8gc3RvcmUgdGhlIGFk
ZHJlc3MKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+
IGluZGV4IDBjNmI3YzVlY2ZlYy4uNzk1YmFkMzA3NDk3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiBAQCAtNTI4LDcgKzUyOCw3IEBAIGlu
dCBhbWRncHVfdnJhbV9tZ3JfYWxsb2Nfc2d0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+
ICAgfQo+ICAgCj4gICAvKioKPiAtICogYW1kZ3B1X3ZyYW1fbWdyX2FsbG9jX3NndCAtIGFsbG9j
YXRlIGFuZCBmaWxsIGEgc2cgdGFibGUKPiArICogYW1kZ3B1X3ZyYW1fbWdyX2ZyZWVfc2d0IC0g
YWxsb2NhdGUgYW5kIGZpbGwgYSBzZyB0YWJsZQo+ICAgICoKPiAgICAqIEBhZGV2OiBhbWRncHUg
ZGV2aWNlIHBvaW50ZXIKPiAgICAqIEBzZ3Q6IHNnIHRhYmxlIHRvIGZyZWUKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdw
dV9kcm0uaAo+IGluZGV4IGM1ZmYyYjI3NWZjZC4uNzkxYTFkNTk3ZDJhIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9h
bWRncHVfZHJtLmgKPiBAQCAtNjY3LDcgKzY2Nyw3IEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2NzX2No
dW5rX2RhdGEgewo+ICAgCX07Cj4gICB9Owo+ICAgCj4gLS8qKgo+ICsvKgo+ICAgICogIFF1ZXJ5
IGgvdyBpbmZvOiBGbGFnIHRoYXQgdGhpcyBpcyBpbnRlZ3JhdGVkIChhLmguYS4gZnVzaW9uKSBH
UFUKPiAgICAqCj4gICAgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
