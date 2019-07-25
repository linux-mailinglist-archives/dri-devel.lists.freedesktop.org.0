Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B234C7491E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 10:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469936E697;
	Thu, 25 Jul 2019 08:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730042.outbound.protection.outlook.com [40.107.73.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E2D6E697
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 08:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INXaq0Sise8gilX+TDrCbplE6tJbUW5OC4jMb05/zoiXP7DllJZtetVJ+4It6f1c4TQNFwq+geZpj6bj1ldRfvgXuX92Qefed3gb8dGJmQSovIJd4CrjBBVORCz+7/bXBLEMHHxfgq6exwXdVPgiPeqpM97LbQGLVTvY8gn9flFs2zzFtgY4C3ANmkDtWW+fGrOaxunL4mEIZ6TiWrANsdt9L4GkHqPtKWDSjyIyIuWdRGMCbhJUEXKVuBJ+DtV3oRifdI0TiJsAlTvSFqTyL/v9IwgbdFtcLcCASC32LUU8gxQu5SMq5vqu+8k42Go5TmkIugVnwl0ddGY241vWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn+dAVsxlgkVyuK2zYlZ0ob8n130DWGxXe1RcqU9Sas=;
 b=PjiFE/Y3lOEnTqDExbjcg7pWA4Nna3mh5r0uzVQdDZft6Dusw56HzDPpOXRCtyYv13gefS+9mMU9RVCXQxuLG9rtnRDQ2QkxRtPYzY9Eh2kkIIFCDZqzle7rSZgVTyBJSBOnlbEiaO7tI/VMxQ6E53bUmm3gEEhyTthbEjO49sX33ed+eXisIDL4Wu45o6Q3dcqwy5Y1/cxPSR/tCzn4fi5r4zqZhfUDPXujhDpx1FBwwvEvQn0tzZ4x8dKaQPfl4AAkwVXb/gyZAWUdOmg0cbRUznKvakl9yBuQk9E9sJoXV48tScgyBkeJrsaGnihTiMcLcnokFeJyOiz3CCqsDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0004.namprd12.prod.outlook.com
 (2603:10b6:301:4a::14) by BN6PR12MB1299.namprd12.prod.outlook.com
 (2603:10b6:404:1d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Thu, 25 Jul
 2019 08:27:54 +0000
Received: from DM3NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MWHPR1201CA0004.outlook.office365.com
 (2603:10b6:301:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.15 via Frontend
 Transport; Thu, 25 Jul 2019 08:27:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT009.mail.protection.outlook.com (10.152.82.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 08:27:53 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 25 Jul
 2019 03:27:51 -0500
Subject: Re: [PATCH libdrm] libdrm: wrap new flexible syncobj query interface
 v2
To: Chunming Zhou <david1.zhou@amd.com>, <dri-devel@lists.freedesktop.org>
References: <20190725081111.21568-1-david1.zhou@amd.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <1607deaa-1f36-afcc-0044-aea62c22b68b@amd.com>
Date: Thu, 25 Jul 2019 16:27:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190725081111.21568-1-david1.zhou@amd.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(446003)(486006)(67846002)(229853002)(47776003)(6116002)(3846002)(58126008)(316002)(14444005)(53936002)(478600001)(110136005)(11346002)(66574012)(336012)(65956001)(7736002)(23676004)(50466002)(305945005)(76176011)(126002)(65806001)(8936002)(2616005)(16576012)(476003)(8676002)(65826007)(26005)(6666004)(356004)(2870700001)(5660300002)(2486003)(68736007)(64126003)(70206006)(70586007)(31686004)(16526019)(36756003)(31696002)(81156014)(426003)(2906002)(186003)(81166006)(54906003)(6246003)(4326008)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1299; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02256331-9da3-4996-f3a7-08d710d9fcf1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR12MB1299; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1299:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1299D66599DC412892CDA914B4C10@BN6PR12MB1299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ldOdLLXSki0jn2zjM2NGu8Xd9oe9SHckAqiREG2o7evcmrcLhAag110ldda6bLcNXUf9BxwTyT/h2yH4LVAdAlJrV4QakCxIcT6aFwN83WUEfbCgPBjfVLLM9C9bqcxhgsgTqlTLigGnm8LSxOZ2jzSR0Sh1A8vM2PHBzdWYK9XHmADIJpkKKrmFC5nmWI0Bm3FWfSN2G+jABcL69xV9gtQCeMiVAeEKGcpBrroMihNfALPHhojpSVIBoWd4yP3cwqSsAiteyMLTCRUUJtaIzFdHPyLYcb8YwyFZDIyuVJl0BLN08iaCB6vCRTTdriPdRlGOe99OuRdDPUPOEPWdbOD+dnRFbOmXe8gk1h1Z6i9IchuobVIsY/WcyyjS8cnzOjRk3+MaZx/TDusnH4dbJ/uch7CwES7OM+5Ott9GkUI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 08:27:53.2175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02256331-9da3-4996-f3a7-08d710d9fcf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn+dAVsxlgkVyuK2zYlZ0ob8n130DWGxXe1RcqU9Sas=;
 b=IuOczGz74v7ZPv8VmNFMt9Yek7kT2DGkDl78SnupmCveUBQ0Jp7iL0H83zA9jW+MPKv1M1qQJe9+o7VVsieUfLbSmK+mxcE09d6pl46M3Xn+XXs5nd+xqGAzgbx9V83mKmMC8dIuyjPqs9fAS3c2st6sVgydxhC6A86ApXcI1TA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGd1eXMsIHNpbmNlIEkgaGF2ZSBubyB3cml0ZSBwZXJtaXNzaW9uIHRvIGxpYmRybSwg
SSBuZWVkIHlvdXIgCmhlbHAgdG8gcHVzaCBwYXRjaC4KCi1EYXZpZApPbiAyMDE55bm0MDfmnIgy
NeaXpSAxNjoxMSwgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiB2Mjogbml0LXBpY2tzIGZpeAo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KPiBDYzog
TGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgo+IENjOiBD
aHJpc3RpYW4gS8O2bmlnIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBGb3IgdGhlIHhm
ODZkcm0uW2NoXSBwYXJ0IDogUmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwu
Zy5sYW5kd2VybGluQGludGVsLmNvbT4KPiAtLS0KPiAgIGFtZGdwdS9hbWRncHUtc3ltYm9sLWNo
ZWNrIHwgIDEgKwo+ICAgYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICAgfCAxOCArKysrKysrKysr
KysrKysrKysKPiAgIGFtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgIHwgMTAgKysrKysrKysrKwo+
ICAgaW5jbHVkZS9kcm0vZHJtLmggICAgICAgICAgfCAgMyArKy0KPiAgIHhmODZkcm0uYyAgICAg
ICAgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4gICB4Zjg2ZHJtLmggICAgICAgICAg
ICAgICAgICB8ICAyICsrCj4gICA2IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1LXN5bWJvbC1jaGVjayBi
L2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrCj4gaW5kZXggMjc0YjRjNmQuLjU5N2E5OWIyIDEw
MDc1NQo+IC0tLSBhL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrCj4gKysrIGIvYW1kZ3B1L2Ft
ZGdwdS1zeW1ib2wtY2hlY2sKPiBAQCAtNTYsNiArNTYsNyBAQCBhbWRncHVfY3Nfc3luY29ial9l
eHBvcnRfc3luY19maWxlMgo+ICAgYW1kZ3B1X2NzX3N5bmNvYmpfaW1wb3J0X3N5bmNfZmlsZQo+
ICAgYW1kZ3B1X2NzX3N5bmNvYmpfaW1wb3J0X3N5bmNfZmlsZTIKPiAgIGFtZGdwdV9jc19zeW5j
b2JqX3F1ZXJ5Cj4gK2FtZGdwdV9jc19zeW5jb2JqX3F1ZXJ5Mgo+ICAgYW1kZ3B1X2NzX3N5bmNv
YmpfcmVzZXQKPiAgIGFtZGdwdV9jc19zeW5jb2JqX3NpZ25hbAo+ICAgYW1kZ3B1X2NzX3N5bmNv
YmpfdGltZWxpbmVfc2lnbmFsCj4gZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUuaCBiL2FtZGdw
dS9hbWRncHUuaAo+IGluZGV4IDlkOWIwODMyLi4xOWY3NGJkNiAxMDA2NDQKPiAtLS0gYS9hbWRn
cHUvYW1kZ3B1LmgKPiArKysgYi9hbWRncHUvYW1kZ3B1LmgKPiBAQCAtMTU5MSw2ICsxNTkxLDI0
IEBAIGludCBhbWRncHVfY3Nfc3luY29ial90aW1lbGluZV93YWl0KGFtZGdwdV9kZXZpY2VfaGFu
ZGxlIGRldiwKPiAgIGludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVfZGV2aWNlX2hh
bmRsZSBkZXYsCj4gICAJCQkgICAgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMs
Cj4gICAJCQkgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMpOwo+ICsvKioKPiArICogIFF1ZXJ5IHN5
bmMgb2JqZWN0cyBsYXN0IHNpZ25hbGVkIG9yIHN1Ym1pdHRlZCBwb2ludC4KPiArICoKPiArICog
XHBhcmFtICAgZGV2CSAgICAtIFxjIFtpbl0gc2VsZi1leHBsYW5hdG9yeQo+ICsgKiBccGFyYW0g
ICBoYW5kbGVzIC0gXGMgW2luXSBhcnJheSBvZiBzeW5jIG9iamVjdCBoYW5kbGVzCj4gKyAqIFxw
YXJhbSAgIHBvaW50cyAtIFxjIFtvdXRdIGFycmF5IG9mIHN5bmMgcG9pbnRzIHJldHVybmVkLCB3
aGljaCBwcmVzZW50cwo+ICsgKiBzeW5jb2JqIHBheWxvYWQuCj4gKyAqIFxwYXJhbSAgIG51bV9o
YW5kbGVzIC0gXGMgW2luXSBzZWxmLWV4cGxhbmF0b3J5Cj4gKyAqIFxwYXJhbSAgIGZsYWdzICAg
LSBcYyBbaW5dIGEgYml0bWFzayBvZiBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU18qCj4gKyAqCj4g
KyAqIFxyZXR1cm4gICAwIG9uIHN1Y2Nlc3Ncbgo+ICsgKiAgICAgICAgICAtRVRJTUUgLSBUaW1l
b3V0Cj4gKyAqICAgICAgICAgIDwwIC0gTmVnYXRpdmUgUE9TSVggRXJyb3IgY29kZQo+ICsgKgo+
ICsgKi8KPiAraW50IGFtZGdwdV9jc19zeW5jb2JqX3F1ZXJ5MihhbWRncHVfZGV2aWNlX2hhbmRs
ZSBkZXYsCj4gKwkJCSAgICAgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCj4g
KwkJCSAgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMsIHVpbnQzMl90IGZsYWdzKTsKPiAgIAo+ICAg
LyoqCj4gICAgKiAgRXhwb3J0IGtlcm5lbCBzeW5jIG9iamVjdCB0byBzaGFyZWFibGUgZmQuCj4g
ZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVfY3MuYyBiL2FtZGdwdS9hbWRncHVfY3MuYwo+IGlu
ZGV4IDk3N2ZhM2NmLi4wMWUyYjJjOCAxMDA2NDQKPiAtLS0gYS9hbWRncHUvYW1kZ3B1X2NzLmMK
PiArKysgYi9hbWRncHUvYW1kZ3B1X2NzLmMKPiBAQCAtNzIxLDYgKzcyMSwxNiBAQCBkcm1fcHVi
bGljIGludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYs
Cj4gICAJcmV0dXJuIGRybVN5bmNvYmpRdWVyeShkZXYtPmZkLCBoYW5kbGVzLCBwb2ludHMsIG51
bV9oYW5kbGVzKTsKPiAgIH0KPiAgIAo+ICtkcm1fcHVibGljIGludCBhbWRncHVfY3Nfc3luY29i
al9xdWVyeTIoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAo+ICsJCQkJCXVpbnQzMl90ICpoYW5k
bGVzLCB1aW50NjRfdCAqcG9pbnRzLAo+ICsJCQkJCXVuc2lnbmVkIG51bV9oYW5kbGVzLCB1aW50
MzJfdCBmbGFncykKPiArewo+ICsJaWYgKCFkZXYpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+
ICsJcmV0dXJuIGRybVN5bmNvYmpRdWVyeTIoZGV2LT5mZCwgaGFuZGxlcywgcG9pbnRzLCBudW1f
aGFuZGxlcywgZmxhZ3MpOwo+ICt9Cj4gKwo+ICAgZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2NzX2V4
cG9ydF9zeW5jb2JqKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKPiAgIAkJCQkJdWludDMyX3Qg
aGFuZGxlLAo+ICAgCQkJCQlpbnQgKnNoYXJlZF9mZCkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtLmggYi9pbmNsdWRlL2RybS9kcm0uaAo+IGluZGV4IDUzMjc4N2JmLi5hZjM3YTgwYiAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybS5o
Cj4gQEAgLTc3MSwxMSArNzcxLDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7Cj4gICAJ
X191MzIgcGFkOwo+ICAgfTsKPiAgIAo+ICsjZGVmaW5lIERSTV9TWU5DT0JKX1FVRVJZX0ZMQUdT
X0xBU1RfU1VCTUlUVEVEICgxIDw8IDApIC8qIGxhc3QgYXZhaWxhYmxlIHBvaW50IG9uIHRpbWVs
aW5lIHN5bmNvYmogKi8KPiAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7Cj4g
ICAJX191NjQgaGFuZGxlczsKPiAgIAlfX3U2NCBwb2ludHM7Cj4gICAJX191MzIgY291bnRfaGFu
ZGxlczsKPiAtCV9fdTMyIHBhZDsKPiArCV9fdTMyIGZsYWdzOwo+ICAgfTsKPiAgIAo+ICAgCj4g
ZGlmZiAtLWdpdCBhL3hmODZkcm0uYyBiL3hmODZkcm0uYwo+IGluZGV4IDk1M2ZjNzYyLi4yOGE2
MTI2NCAxMDA2NDQKPiAtLS0gYS94Zjg2ZHJtLmMKPiArKysgYi94Zjg2ZHJtLmMKPiBAQCAtNDMx
NCw2ICs0MzE0LDIxIEBAIGRybV9wdWJsaWMgaW50IGRybVN5bmNvYmpRdWVyeShpbnQgZmQsIHVp
bnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAo+ICAgICAgIHJldHVybiAwOwo+ICAg
fQo+ICAgCj4gK2RybV9wdWJsaWMgaW50IGRybVN5bmNvYmpRdWVyeTIoaW50IGZkLCB1aW50MzJf
dCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKPiArCQkJCXVpbnQzMl90IGhhbmRsZV9jb3Vu
dCwgdWludDMyX3QgZmxhZ3MpCj4gK3sKPiArICAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGlu
ZV9hcnJheSBhcmdzOwo+ICsKPiArICAgIG1lbWNsZWFyKGFyZ3MpOwo+ICsgICAgYXJncy5oYW5k
bGVzID0gKHVpbnRwdHJfdCloYW5kbGVzOwo+ICsgICAgYXJncy5wb2ludHMgPSAodWludHB0cl90
KXBvaW50czsKPiArICAgIGFyZ3MuY291bnRfaGFuZGxlcyA9IGhhbmRsZV9jb3VudDsKPiArICAg
IGFyZ3MuZmxhZ3MgPSBmbGFnczsKPiArCj4gKyAgICByZXR1cm4gZHJtSW9jdGwoZmQsIERSTV9J
T0NUTF9TWU5DT0JKX1FVRVJZLCAmYXJncyk7Cj4gK30KPiArCj4gKwo+ICAgZHJtX3B1YmxpYyBp
bnQgZHJtU3luY29ialRyYW5zZmVyKGludCBmZCwKPiAgIAkJCQkgIHVpbnQzMl90IGRzdF9oYW5k
bGUsIHVpbnQ2NF90IGRzdF9wb2ludCwKPiAgIAkJCQkgIHVpbnQzMl90IHNyY19oYW5kbGUsIHVp
bnQ2NF90IHNyY19wb2ludCwKPiBkaWZmIC0tZ2l0IGEveGY4NmRybS5oIGIveGY4NmRybS5oCj4g
aW5kZXggM2ZiMWQxY2EuLjU1Y2VhZWQ5IDEwMDY0NAo+IC0tLSBhL3hmODZkcm0uaAo+ICsrKyBi
L3hmODZkcm0uaAo+IEBAIC04ODQsNiArODg0LDggQEAgZXh0ZXJuIGludCBkcm1TeW5jb2JqVGlt
ZWxpbmVXYWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMsCj4g
ICAJCQkJICB1aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwo+ICAgZXh0ZXJuIGludCBkcm1TeW5j
b2JqUXVlcnkoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKPiAg
IAkJCSAgIHVpbnQzMl90IGhhbmRsZV9jb3VudCk7Cj4gK2V4dGVybiBpbnQgZHJtU3luY29ialF1
ZXJ5MihpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAo+ICsJCQkg
ICAgdWludDMyX3QgaGFuZGxlX2NvdW50LCB1aW50MzJfdCBmbGFncyk7Cj4gICBleHRlcm4gaW50
IGRybVN5bmNvYmpUcmFuc2ZlcihpbnQgZmQsCj4gICAJCQkgICAgICB1aW50MzJfdCBkc3RfaGFu
ZGxlLCB1aW50NjRfdCBkc3RfcG9pbnQsCj4gICAJCQkgICAgICB1aW50MzJfdCBzcmNfaGFuZGxl
LCB1aW50NjRfdCBzcmNfcG9pbnQsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
