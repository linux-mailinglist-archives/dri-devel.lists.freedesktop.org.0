Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC5A23B9A5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38476E198;
	Tue,  4 Aug 2020 11:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32706E198
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJT/9AFMhzUU8u123hhc0yFlMf2y0AjV3P+3LrXF5h4YHzbVHa1p3km2Q9CYAxS1sKeBrPn/xPZTs7fjzw5L7+DDaQuPcvKuI+R2ywKBYPe+V6Nexw2An3aqv9UM5ZiX05jKgPhG2xGWMqzVKDkfZrHk0vh5q4ggaOSJIKmDSOFyfGI582wTw8EoSg5M/sY3gS166b04d2SW8mJQ9WECoi5G+rF8rzJTnRBtj3Knxq45CsCgy1aSUWqZA00yKZ57UzqudF0Y0y4fjXVl77V87V0hXFU2GxOfEzf7brcXH6oX9jlT6Ylbmr+9zI4/jjYnvG32cooRNFPXcWSqW+XS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIQDKEgA6dJWHpNrFqgZaaa0LGIR9X29HKnoTp5udzU=;
 b=dco8FYMeVV1WlvOCfx9kSBBWPUD1F3bI4rqy23/E3SgR3Jo0cZNgtZc3cT5ubsexm2lpERsJvHXDJQdslI8PGIxXF6wgGzKZjOzm6A0E6fTW9fZyc5QKLAaA87BfMz+YAI7zxTe7kbgozSLxVC345KquGfqhNGV2C18EFbJP8u1ui51PeEXPlzBMtrXn2n94tj5a6xDKWDM2bF0OIab/uHtVX/UTLSXgqj5ZpZwQtH3F88/Fh7p6/wuiMm9cZNY0FUamO5iuNRO+V+5b9EiftDzeyvC8lkwOOVi1kHhskydox1otaLCOwt3TmpiofNrX8QhwreMUANZW+/yj0EXsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIQDKEgA6dJWHpNrFqgZaaa0LGIR9X29HKnoTp5udzU=;
 b=xS6cWimcAzk4BIWOgW5jM1PRgw+mxoTsWbM5KtqENyYGy/I7vGjhTp+Cw2LJt9vnJPoyvBjSVDuLmDgHuQXBHGthaxF2z5fTch13vk4+USyUtOfCoWiLiklMDtIkmf1rWBglmY7MPnSjlsw5skkWnq6j4NfFQl8o2YjkCShf7Tc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:37:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:37:11 +0000
Subject: Re: [PATCH 54/59] drm/ttm: drop list of memory managers from device.
 (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-55-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cb1104e1-5b15-0714-7595-d4641d9af938@amd.com>
Date: Tue, 4 Aug 2020 13:37:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-55-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.13 via Frontend Transport; Tue, 4 Aug 2020 11:37:09 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4af0fd56-0121-4df6-187b-08d8386ab9b4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41111EC15FF609B48FED2ABE834A0@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFUk8/Yu1tyhep4fPvahZY17ExaQeD3skX+RGSLtvrbELbOed2UCqy9Gt8xfgDL6UB9wl+qQ58lT8v+JJwGfcGHIoF6AQ5iZ81s/3v6N1Hj2osKVrVcN7/0ysaNJQ3iNDC5sfWTlma7vU5tBlcN3UZAk/JQecvirp7rjkFk0oJB0l3b6/e1CmI7zPklvZ17sGa9RWT26vgiJv0NmVsaGT6DzQYpJ8bLl7XgkwwSYZyH4W8ArKwPnFM1kuNWh155q1+SeVQO6jAEvAhNXIZWr7j/3gsTkt60ZUEuD3v506kHERpCBlZ5oJVivjx1VEgzAYcONE5ovyattbTnb7aPkIQsbq6g5dmZl2rvCj+SqzSHuTXgzZfH5tjbuHF/Pq8ay
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(478600001)(6486002)(86362001)(2906002)(6666004)(66574015)(316002)(16526019)(186003)(83380400001)(52116002)(8936002)(66556008)(31696002)(4326008)(66946007)(31686004)(2616005)(66476007)(36756003)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JmVXiqpOdcLSaWKoUTVOww14dQ3800qWls1lDOyfDiYu2MrNoD5HqIt2/QwayU2muIAEKk3kV0snvNys5N1sACFqbHPz2dymJKBDjXgQ1eSzx3fdE31Ik4QYwQUXkJJ3ipm2hIPnMF6cat9NlEL4M9n4G55pQI66JsJrkR5bPWGBNhpsYvmmQO1zBb4QsY2OVw/Zj3+Fmayah7lWtgF4MeWylO7y6P/NNPeXm/zFH6S8cuQ5NQQz11CdDphxQBialIgfXrIG90jMyL6RPdHqMN7GoxWe7H1AEy31c6LZSFbdcUM4ZXSxQv2DgarzGCirc968XPL6FKf6Na1M7/wMIzCvzxJ4ty2gMhCvCoolR5XeJFz4leDT8Sn2W6jU/XGpzy5cFDkWSsYyA/BtUUVaXz7d7UZ3LoqXZoR/Kqj+7B4QtGOW+uWAKfYHcR5R29gmk1kopVVFdBjVv49VJfvZavYlIJDDjyEWI+bKhHCNavBiCxsOWDNJ8BnNmcf/Z7zlGvQSx1U3VocIg1PForAqWD3Iv9uvHoz9vRDY53hrWStanuNQokVCK6gSpv/DVJ5h4hwrW7L2K9j2+gR2OMX7hYdHJiSXjkLLzQA4Z1iO2rlqhpIwtoVlEIY9GPyq0xGjDq2q/GnN+Fm/PQW07wJTAdzzsKa1boFE+ogYi4l06vh4/jTg10ypR0rPoCzscekRN0U62B0U8ivMng12mWb7Mg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af0fd56-0121-4df6-187b-08d8386ab9b4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:37:10.9000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixKUhnqU/otil1RqF8Fgh2xRyH2KWjB0IwlsAPoBiR3kZPzlAx1u3VWfWAYsTIik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIGRyaXZlciBub3cgY29udHJvbHMgdGhl
c2UsIHRoZSBjb3JlIGp1c3QgY29udHJvbHMgdGhlIHN5c3RlbQo+IG1lbW9yeSBvbmUuCj4KPiB2
MjogaW5pdCBzeXNtYW4gZXhwbGljaXRseSBhbmQgYXNzaWduIGl0IGFzIGEgZHJpdmVyIG1hbmFn
ZXIKPiB0byBzaW1wbGlmeSB0aGUgbG9va3VwIHNlcXVlbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
RGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyAgICB8IDYgKysrLS0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2RyaXZlci5oIHwgNiArKy0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggNzhiNzI0NDNhOWVm
Li4xMmFiZTQ2YmZiYzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtMTU1OCw2ICsxNTU4
LDcgQEAgaW50IHR0bV9ib19kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRl
dikKPiAgIAo+ICAgCW1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgVFRNX1BMX1NZU1RFTSk7
Cj4gICAJdHRtX21lbV90eXBlX21hbmFnZXJfZGlzYWJsZShtYW4pOwo+ICsJdHRtX3NldF9kcml2
ZXJfbWFuYWdlcihiZGV2LCBUVE1fUExfU1lTVEVNLCBOVUxMKTsKPiAgIAo+ICAgCW11dGV4X2xv
Y2soJnR0bV9nbG9iYWxfbXV0ZXgpOwo+ICAgCWxpc3RfZGVsKCZiZGV2LT5kZXZpY2VfbGlzdCk7
Cj4gQEAgLTE1ODMsNyArMTU4NCw3IEBAIEVYUE9SVF9TWU1CT0wodHRtX2JvX2RldmljZV9yZWxl
YXNlKTsKPiAgIAo+ICAgc3RhdGljIHZvaWQgdHRtX2JvX2luaXRfc3lzbWFuKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2KQo+ICAgewo+IC0Jc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICpt
YW4gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIFRUTV9QTF9TWVNURU0pOwo+ICsJc3RydWN0IHR0
bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+c3lzbWFuOwo+ICAgCj4gICAJLyoKPiAg
IAkgKiBJbml0aWFsaXplIHRoZSBzeXN0ZW0gbWVtb3J5IGJ1ZmZlciB0eXBlLgo+IEBAIC0xNTk0
LDYgKzE1OTUsNyBAQCBzdGF0aWMgdm9pZCB0dG1fYm9faW5pdF9zeXNtYW4oc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYpCj4gICAJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19D
QUNIRUQ7Cj4gICAKPiAgIAl0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0KG1hbiwgMCk7Cj4gKwl0
dG1fc2V0X2RyaXZlcl9tYW5hZ2VyKGJkZXYsIFRUTV9QTF9TWVNURU0sIG1hbik7Cj4gICAJdHRt
X21lbV90eXBlX21hbmFnZXJfc2V0X3VzZWQobWFuLCB0cnVlKTsKPiAgIH0KPiAgIAo+IEBAIC0x
NjE1LDggKzE2MTcsNiBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCB0dG1fYm9fZGV2
aWNlICpiZGV2LAo+ICAgCj4gICAJYmRldi0+ZHJpdmVyID0gZHJpdmVyOwo+ICAgCj4gLQltZW1z
ZXQoYmRldi0+bWFuX3ByaXYsIDAsIHNpemVvZihiZGV2LT5tYW5fcHJpdikpOwo+IC0KPiAgIAl0
dG1fYm9faW5pdF9zeXNtYW4oYmRldik7Cj4gICAKPiAgIAliZGV2LT52bWFfbWFuYWdlciA9IHZt
YV9tYW5hZ2VyOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
IGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IGluZGV4IGJmZDE5NDAwMzcyZi4u
ZDU2NDZkN2NhYzYwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gQEAgLTQxNCw3ICs0
MTQsNyBAQCBzdHJ1Y3QgdHRtX2JvX2RldmljZSB7Cj4gICAJLyoKPiAgIAkgKiBhY2Nlc3Mgdmlh
IHR0bV9tYW5hZ2VyX3R5cGUuCj4gICAJICovCj4gLQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFn
ZXIgbWFuX3ByaXZbVFRNX05VTV9NRU1fVFlQRVNdOwo+ICsJc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyIHN5c21hbjsKPiAgIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbl9kcnZb
VFRNX05VTV9NRU1fVFlQRVNdOwo+ICAgCS8qCj4gICAJICogUHJvdGVjdGVkIGJ5IGludGVybmFs
IGxvY2tzLgo+IEBAIC00NDYsOSArNDQ2LDcgQEAgc3RydWN0IHR0bV9ib19kZXZpY2Ugewo+ICAg
c3RhdGljIGlubGluZSBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKnR0bV9tYW5hZ2VyX3R5
cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gICAJCQkJCQkJICAgIGludCBtZW1fdHlw
ZSkKPiAgIHsKPiAtCWlmIChiZGV2LT5tYW5fZHJ2W21lbV90eXBlXSkKPiAtCQlyZXR1cm4gYmRl
di0+bWFuX2RydlttZW1fdHlwZV07Cj4gLQlyZXR1cm4gJmJkZXYtPm1hbl9wcml2W21lbV90eXBl
XTsKPiArCXJldHVybiBiZGV2LT5tYW5fZHJ2W21lbV90eXBlXTsKPiAgIH0KPiAgIAo+ICAgc3Rh
dGljIGlubGluZSB2b2lkIHR0bV9zZXRfZHJpdmVyX21hbmFnZXIoc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
