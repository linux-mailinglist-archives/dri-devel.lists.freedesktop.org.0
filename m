Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48E7E220
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 20:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5F86E75B;
	Thu,  1 Aug 2019 18:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2397F6E75B;
 Thu,  1 Aug 2019 18:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kg8w3KigouvV+KCOd68i/iZ02Mg4vXnXxzizXIFy1UDMhsebL4IMeasnK7V+3elauTxLEkLJ6ssBXsVVCnOjuIA8LJ7+EW4Q5WrZHkAip66CWq2wemGGiuuPH7/T81l6xZjzNV9pW74Ij1GmcNAlR3h8NnTxLgeo5C4GuvOffwpnlJxLVEUOmJtb7cs5RYOrfRp09ZKPv8PX3kllu5grs8lLIy5zOZF91Lnc30gBMvkY5MXguvKZW1g5aDuIZ8QgTpEs4FIFgpJFs+Tut5N8omQQ+zC7HL+WjWTLcUw8r9SDfl39kYOo3ckRuEmPlGuhpLR1wa6BjEwOoY8VjCFgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD2zZj0d21jX/mOCzRynyozB6xDqF9YUL19tBlyMWj0=;
 b=h+8wurK5wJQG/JUJ0VtAwu21nBcuifZfDnG1R7UW/sOO5FC6FCHx1LLWF0ke3ACovO79Q6HJdhTifC1E+2TKIE7uFAKudAdSoFeqhqE+AmbhN1NUoaIYoJLJBxRcz9VPL4f49RCxgEDj/irnjXRyYRw5nalQP6s5caYNZDyV0socNyUsro39fPCiU/zS/6UfSYZhNGVy/GFfePM+f9CvfZiq15puRCpJ+bEwLY6SneccCI0XtMF1PUdK1nEWezjd0Up2DFPyztQe3ElDjFztsV7dkmJYshP7XN6TlX9gZ7FNRPiWvZkyPIxugYv2GYHIHKWbNdCp0U5rOQ6sAKlHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB3558.namprd12.prod.outlook.com (20.178.196.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 1 Aug 2019 18:24:54 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::71c5:66f4:1a5e:14fe]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::71c5:66f4:1a5e:14fe%4]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 18:24:54 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [Intel-gfx] [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Thread-Topic: [Intel-gfx] [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Thread-Index: AQHVIhft1cOEwK1eDEK/yedcz2d0QqbEnbaAgACS0oCACFmIAIAYzwqAgACPiAA=
Date: Thu, 1 Aug 2019 18:24:54 +0000
Message-ID: <3327686c-590a-d0eb-fc64-a9b951fdd195@amd.com>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
 <11bb4ca1d27d3ab2d169deb57951855c4ddcd563.camel@redhat.com>
 <20190711102923.3d219640@eldfell.localdomain>
 <97e2643d-c534-cfb5-bd27-4cf95c656104@amd.com>
 <20190801125109.2488a2d0@ferris.localdomain>
In-Reply-To: <20190801125109.2488a2d0@ferris.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ae80ebc-025d-4e70-1190-08d716ad8cb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3558; 
x-ms-traffictypediagnostic: BYAPR12MB3558:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB3558EF9CFC65AF614F9F88C382DE0@BYAPR12MB3558.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(486006)(6916009)(71190400001)(25786009)(6436002)(71200400001)(478600001)(229853002)(476003)(6116002)(66556008)(36756003)(86362001)(6512007)(66476007)(66446008)(66946007)(305945005)(66066001)(3846002)(31686004)(64756008)(8676002)(81166006)(256004)(31696002)(81156014)(102836004)(26005)(53546011)(6506007)(386003)(76176011)(966005)(6246003)(52116002)(1411001)(2906002)(6486002)(14454004)(4326008)(68736007)(2616005)(186003)(316002)(53936002)(5660300002)(8936002)(6306002)(54906003)(11346002)(7736002)(99286004)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3558;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: owPO6ssTwss/nRKxMH9oPgk7hz4BSF9JtzpO0BactQ137/I6MLcG1tJV7kicOwlUhxe8k9jAKCdISSwGdFHrT+/Dz6l2Hni6P87S1JjOQLnweye8gXXKjlZ7dhO9afJ6FASOlWd9LErX96KQlR+x3JR6Wo93Kmg4+GSaHP9pPzmRc1I7UR+KHr7nkVo3KInpFG5dS+5gcZSo8ikXw4AX6oqA6tb09n64d3A87sKn7dBy0NTi1j99PRSE2BJmSrIW+ipVovN8obRFeh+21TrgC1d2qiVDHLiZsvVjp0+YkTcBbCzGNfCQg2U4AHf6fxs4srZ+FDwUln2Fk6r17wrhTM4cmzrUIG4+5AdSk8NQCfkvy0V6fRZMry6hMhMmFdq+paOMBH3TKGhUOTJNr4ep27YnA8R7uc9whqSupWumdb8=
Content-ID: <D383779ABDE6234BADF620CC3BF78A64@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae80ebc-025d-4e70-1190-08d716ad8cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 18:24:54.3146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3558
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD2zZj0d21jX/mOCzRynyozB6xDqF9YUL19tBlyMWj0=;
 b=dIvfGtjLt2bmGjjNcvQ+TvlAl/yaB3pUKvj37I+uWiCV6f3k4pljrjnMzyRkFJzYFCxOHrJGdGvYn1KAnbfHLxe85cZUQHGozIyw/tYRhwbAGnuWJNxNYCjfLP3GxbZYBO578bzRk17SJYqcjqDr/daOrlN5TxXCEmRgQuARa90=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA4LTAxIDU6NTEgYS5tLiwgUGVra2EgUGFhbGFuZW4gd3JvdGU6Cj4gT24gVHVl
LCAxNiBKdWwgMjAxOSAxNDo1OTo1OCArMDAwMAo+ICJMaSwgU3VuIHBlbmcgKExlbykiIDxTdW5w
ZW5nLkxpQGFtZC5jb20+IHdyb3RlOgo+IAo+PiBPbiAyMDE5LTA3LTExIDM6MjkgYS5tLiwgUGVr
a2EgUGFhbGFuZW4gd3JvdGU6Cj4+PiBXYWl0LCBvbmUgY2FuIHdyaXRlIHVkZXYgcnVsZXMgZm9y
IGNvbm5lY3RvcnMgYW5kIHN0dWZmPwo+Pj4gSG93PyBXaGF0IGNhbiB0aGV5IGRvPyAgCj4+Cj4+
IEkgd2FzIHVzaW5nIGl0IHRvIGdlbmVyYXRlIHVzZXItZnJpZW5kbHkgZGV2aWNlIG5hbWVzIGZv
ciB0aGUgbXN0IGF1eAo+PiBpbXBsZW1lbnRhdGlvbjoKPj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzMxNTkwMC8/c2VyaWVzPTYzMjM3JnJldj0yCj4gCj4gSGksCj4g
Cj4gd2hhdCBpcyB0aGF0IGRldmljZSBub2RlIHVzZWQgZm9yPwo+IAo+IEFyZSB0aGUgImJ5LXBh
dGgiIHN5bWxpbmtzIHRvIGhlbHAgYSBkaXNwbGF5IHNlcnZlciBhc3NvY2lhdGUgdGhlCj4gcmln
aHQgZGV2aWNlIG5vZGUgd2l0aCB0aGUgcmlnaHQgRFJNIEtNUyBjb25uZWN0b3IgcmVzb3VyY2U/
CgpJIGludGVuZGVkIGl0IHRvIGJlIHNvbWV0aGluZyBtb3JlIGRlc2NyaXB0aXZlIHRoYW4gdGhl
CicvZGV2L2RybV9kcF9hdXgwLCBkcm1fZHBfYXV4MSwgZHJtX2RwX2F1eDIsIC4uLicgIG5hbWVz
LCB0byBoZWxwIHVzZXJzCmlkZW50aWZ5IHRoZSBjb25uZWN0b3IgdGhleSdyZSBhZGRyZXNzaW5n
IGluIHRoZSBtc3QgdG9wb2xvZ3kuIEkgZ3Vlc3MKaXQgY291bGQgYWxzbyBiZSB1c2VkIGZvciB0
aGUgcHVycG9zZSB5b3UgbWVudGlvbiBhcyB3ZWxsLgoKT2YgY291cnNlLCB3ZSdkIG5lZWQgbW9y
ZSByZWxpYWJsZSBhbmQgcGVyc2lzdGVudCBQQVRIIHByb3BzIGZpcnN0LiBUaGUKcGF0Y2ggd2Fz
IGRyb3BwZWQgdW50aWwgdGhpcyBoYXBwZW5zLgoKTGVvCgo+IAo+IFRoZSBwYXRjaCBjb21taXQg
bWVzc2FnZSBkaWQgbm90IGV4cGxhaW4gd2hhdCB0aGUgbmFtZXMgYXJlCj4gYWN0dWFsbHkgdXNl
ZCBmb3IuCj4gCj4gCj4gVGhhbmtzLAo+IHBxCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
