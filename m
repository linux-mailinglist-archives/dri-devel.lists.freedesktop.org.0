Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2060FD5ED0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A116E1F5;
	Mon, 14 Oct 2019 09:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800085.outbound.protection.outlook.com [40.107.80.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ACB6E1F5;
 Mon, 14 Oct 2019 09:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvuXbEQQHIo3IBfHJJA8pMWHJL+ksZrxBtxAzGn2yWgtkw6f/wxcLRQuKsZEKR/+RdOmr62fV91DZAoqkrzCMwRi9ld2ug6T8UxnEdKiDN1JzFfzceF2nrclrkyx/xhsDwnz4Sdqih8NFiOQiyVQpCFW7ld1ndZwRXHXibqj1waH33nx0H7NGdnacxgFmaM5RVTYY/votJrt24kqqODyzWnpU5O7u2BX03E9CapXIlwqxshuTDflTH2AAEKDjkCNjH/cdH4ZMl79tPxeRA2aM+swqkBqw7VlPxU0xEZSzjK84Zn0aX0PwH7Lm9lpHxfd65mCvaX0I2SJ3mY4rZea8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXia265FrUzqcioJ39Iixmzif/BE7dC1EQeuIvPoshM=;
 b=hpsxkqh3Bcq+Bg94hN9GD+E/iOFxnT0InKvg2kriyatARhy8A0ScJ5G+ntWBJVcuTBz/ZOBwwg9kQ7IqddHDOIpcQzbKdgmPp/f8HQlxc7S79tWvirMbpwVbqWBPs1DArkDeKhWu3DbAYL9Ez2zxc9nq58NPkUI73mW2fbybVAngAeqBI/ZvDeoQBDOmJlWK9pherWNgcF8wcjYSvRLDsEe4r8kpuCTappmrVmM8xJ3Ukm9duWGfwiM/i8D0lXxHMHjEZiBeCWsELyP28DrEKFcmjPMDBegCw25OSlb3PKekO0Y4cEAoemnL2sLKv+ztmUQiMAm+GUmT7VfphtdtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3467.namprd12.prod.outlook.com (20.178.199.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 09:27:08 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::9c:ce1f:b89f:18dd]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::9c:ce1f:b89f:18dd%3]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 09:27:07 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/edid: Prep for HDMI VIC aspect ratio (WIP)
Thread-Topic: [PATCH 4/4] drm/edid: Prep for HDMI VIC aspect ratio (WIP)
Thread-Index: AQHVer67iO9Qqgm3XkSDKEPm0+EUZ6dZ5Z1w
Date: Mon, 14 Oct 2019 09:27:07 +0000
Message-ID: <DM6PR12MB4137CFEE415283752693EDC0FC900@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191004141914.20600-1-ville.syrjala@linux.intel.com>
 <20191004141914.20600-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20191004141914.20600-4-ville.syrjala@linux.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8180f60-32b5-48bc-1cc1-08d75088af08
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3467:
x-microsoft-antispam-prvs: <DM6PR12MB34675BF84676D8A3BD1E1223FC900@DM6PR12MB3467.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(13464003)(189003)(199004)(53546011)(6246003)(14454004)(9686003)(55016002)(76176011)(33656002)(99286004)(478600001)(102836004)(7696005)(6506007)(4326008)(5660300002)(52536014)(316002)(110136005)(6116002)(25786009)(71190400001)(71200400001)(3846002)(2906002)(8936002)(8676002)(66066001)(476003)(186003)(81166006)(81156014)(446003)(2501003)(486006)(26005)(11346002)(256004)(66446008)(66946007)(76116006)(74316002)(305945005)(7736002)(229853002)(86362001)(6436002)(64756008)(66476007)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3467;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJ+v8SQNzqkQHR5LYJCXmAi3V8n7iS5jhLvHAY2MpALa0sCaI0MBPKozzsEkwHRlf2bgmsFEOg3OkEhTcmyc09UAQf8Uj6VLlPeV14pbHy6BIQm+j/6oAwyLaVPBB6os7yz8jOZ1xsTEX+l8A+07zA+zkFFlXPDgrsJBakJgRnCAukEdjh+4Fvj4uNzdY6frIp+OdK2nBXSGxsWX29qAxS59BwYpBJ4mdJ+PUH5tTyHQSWJfXMEjajvbkTi5J49kYUjpEIoJbQNYvEMb+KZZuGcSAAad+ZE/IcnkjQG8OEsymPHlFCQXdtT+H2Nz9OdsXNousl7fukliUKIvtkQQFYIwTAfz0JINXydHHKZgSC78+reH30UPZsv6yOHGQqfGQE3dWxRDQwoOPN9aNh+3HYNkXd5iaEeXH0pHYl8bPnA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8180f60-32b5-48bc-1cc1-08d75088af08
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 09:27:07.6731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c49hloPaU5oWGM7lsVER/BkZ9HNCJuA4RbLN0S9UXZqksjb/HiBjZKuZHP03ILoS5U3Y8eB/9xNrrBjhznZ2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3467
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXia265FrUzqcioJ39Iixmzif/BE7dC1EQeuIvPoshM=;
 b=pxY8zaUzSS4lo9XCJEw8gpo5KOciC89xMEvumv+9U20wUBqFp8b1l3O6e5O3GngrC6b1GhHtsTSG9wUHuKsNUN1Z0SmfdBELgpffYV+URrvkSSEQm+u2yGLkj04hVPrMN5cZ0SJGyuV1dfd4NRMOptJZNaWmFd550um+nhhzrVo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogVmlsbGUgU3lyamFsYSA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDQsIDIw
MTkgMTA6MTkgUE0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMaW4sIFdheW5lIDxXYXluZS5MaW5AYW1k
LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggNC80XSBkcm0vZWRpZDogUHJlcCBmb3IgSERNSSBWSUMg
YXNwZWN0IHJhdGlvIChXSVApCj4gCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBJIHRoaW5rIHRoaXMgc2hvdWxkIHByb3ZpZGUgbW9z
dCBvZiBuZWNlc3NhcnkgbG9naWMgZm9yIGFkZGluZyBhc3BlY3IgcmF0aW9zIHRvCj4gdGhlIEhE
TUkgNGsgbW9kZXMuCj4gCj4gQ2M6IFdheW5lIExpbiA8d2F5bmVsaW5AYW1kLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDM3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgaW5kZXgKPiBjN2Y5ZjdjYTc1YTIu
LmM3NjgxNGVkYzc4NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTMyMTAsNiArMzIxMCwxMSBA
QCBzdGF0aWMgZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0Cj4gZHJtX2dldF9jZWFfYXNwZWN0X3Jh
dGlvKGNvbnN0IHU4IHZpZGVvX2NvZGUpCj4gIAlyZXR1cm4gZWRpZF9jZWFfbW9kZXNbdmlkZW9f
Y29kZV0ucGljdHVyZV9hc3BlY3RfcmF0aW87Cj4gIH0KPiAKPiArc3RhdGljIGVudW0gaGRtaV9w
aWN0dXJlX2FzcGVjdCBkcm1fZ2V0X2hkbWlfYXNwZWN0X3JhdGlvKGNvbnN0IHU4Cj4gK3ZpZGVv
X2NvZGUpIHsKPiArCXJldHVybiBlZGlkXzRrX21vZGVzW3ZpZGVvX2NvZGVdLnBpY3R1cmVfYXNw
ZWN0X3JhdGlvOwo+ICt9Cj4gKwoKVGhlcmUgYXJlIG5vIHBpY3R1cmVfYXNwZWN0X3JhdGlvIGF0
dHJpYnV0ZXMgZGVmaW5lZCBmb3IgbW9kZXMgaW4gCmVkaWRfNGtfbW9kZXNbXSBub3cuIFNob3Vs
ZCBhZGQgb24gdGhvc2UgZGVmaW5pdGlvbnMuCgo+ICAvKgo+ICAgKiBDYWxjdWxhdGUgdGhlIGFs
dGVybmF0ZSBjbG9jayBmb3IgSERNSSBtb2RlcyAodGhvc2UgZnJvbSB0aGUgSERNSQo+IHZlbmRv
cgo+ICAgKiBzcGVjaWZpYyBibG9jaykuCj4gQEAgLTMyMzYsNiArMzI0MSw5IEBAIHN0YXRpYyB1
OAo+IGRybV9tYXRjaF9oZG1pX21vZGVfY2xvY2tfdG9sZXJhbmNlKGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICp0b18KPiAgCWlmICghdG9fbWF0Y2gtPmNsb2NrKQo+ICAJCXJldHVybiAw
Owo+IAo+ICsJaWYgKHRvX21hdGNoLT5waWN0dXJlX2FzcGVjdF9yYXRpbykKPiArCQltYXRjaF9m
bGFncyB8PSBEUk1fTU9ERV9NQVRDSF9BU1BFQ1RfUkFUSU87Cj4gKwo+ICAJZm9yICh2aWMgPSAx
OyB2aWMgPCBBUlJBWV9TSVpFKGVkaWRfNGtfbW9kZXMpOyB2aWMrKykgewo+ICAJCWNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICpoZG1pX21vZGUgPQo+ICZlZGlkXzRrX21vZGVzW3ZpY107
Cj4gIAkJdW5zaWduZWQgaW50IGNsb2NrMSwgY2xvY2syOwo+IEBAIC0zMjcxLDYgKzMyNzksOSBA
QCBzdGF0aWMgdTggZHJtX21hdGNoX2hkbWlfbW9kZShjb25zdCBzdHJ1Y3QKPiBkcm1fZGlzcGxh
eV9tb2RlICp0b19tYXRjaCkKPiAgCWlmICghdG9fbWF0Y2gtPmNsb2NrKQo+ICAJCXJldHVybiAw
Owo+IAo+ICsJaWYgKHRvX21hdGNoLT5waWN0dXJlX2FzcGVjdF9yYXRpbykKPiArCQltYXRjaF9m
bGFncyB8PSBEUk1fTU9ERV9NQVRDSF9BU1BFQ1RfUkFUSU87Cj4gKwo+ICAJZm9yICh2aWMgPSAx
OyB2aWMgPCBBUlJBWV9TSVpFKGVkaWRfNGtfbW9kZXMpOyB2aWMrKykgewo+ICAJCWNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICpoZG1pX21vZGUgPQo+ICZlZGlkXzRrX21vZGVzW3ZpY107
Cj4gIAkJdW5zaWduZWQgaW50IGNsb2NrMSwgY2xvY2syOwoKQ3VycmVudCBjb2RlIGluIGRybV9t
YXRjaF9oZG1pX21kb2UoKSAmIGRybV9tYXRjaF9oZG1pX21vZGVfY2xvY2tfdG9sZXJhbmNlKCkK
dXNlIGhkbWlfbW9kZV9hbHRlcm5hdGVfY2xvY2soKSB0byBmaW5kIGFsdGVybmF0ZSBjbG9ja3Mu
CkluIGhkbWlfbW9kZV9hbHRlcm5hdGVfY2xvY2soKSwgaXQgYWRkcyBhbiBleGNlcHRpb24gZm9y
IFZJQyA0IG1vZGUgKDQwOTZ4MjE2MEAyNCkKZHVlIHRvIHRoZXJlIGlzIG5vIGFsdGVybmF0ZSBj
bG9jayBkZWZpbmVkIGZvciB0aGF0IG1vZGUgaW4gSERNSTEuNGIuIEJ1dCBIRE1JMi4wIGFkZHMK
MjMuOThIeiBmb3IgdGhhdCBtb2RlLiBNYXliZSB3ZSBzaG91bGQgYWxzbyByZXZpc2UgdGhhdCBw
YXJ0LgoKPiBAQCAtNTIxOCw2ICs1MjI5LDcgQEAKPiBkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zy
b21fZGlzcGxheV9tb2RlKHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUKPiAqZnJhbWUsCj4gIAkJ
CQkJIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKSAgewo+ICAJZW51bSBoZG1p
X3BpY3R1cmVfYXNwZWN0IHBpY3R1cmVfYXNwZWN0Owo+ICsJdTggdmljLCBoZG1pX3ZpYzsKPiAg
CWludCBlcnI7Cj4gCj4gIAlpZiAoIWZyYW1lIHx8ICFtb2RlKQo+IEBAIC01MjMwLDcgKzUyNDIs
OCBAQAo+IGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoc3RydWN0IGhk
bWlfYXZpX2luZm9mcmFtZQo+ICpmcmFtZSwKPiAgCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RF
X0ZMQUdfREJMQ0xLKQo+ICAJCWZyYW1lLT5waXhlbF9yZXBlYXQgPSAxOwo+IAo+IC0JZnJhbWUt
PnZpZGVvX2NvZGUgPSBkcm1fbW9kZV9jZWFfdmljKGNvbm5lY3RvciwgbW9kZSk7Cj4gKwl2aWMg
PSBkcm1fbW9kZV9jZWFfdmljKGNvbm5lY3RvciwgbW9kZSk7Cj4gKwloZG1pX3ZpYyA9IGRybV9t
b2RlX2hkbWlfdmljKGNvbm5lY3RvciwgbW9kZSk7Cj4gCj4gIAlmcmFtZS0+cGljdHVyZV9hc3Bl
Y3QgPSBIRE1JX1BJQ1RVUkVfQVNQRUNUX05PTkU7Cj4gCj4gQEAgLTUyNDQsMTEgKzUyNTcsMTUg
QEAKPiBkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKHN0cnVjdCBoZG1p
X2F2aV9pbmZvZnJhbWUKPiAqZnJhbWUsCj4gCj4gIAkvKgo+ICAJICogUG9wdWxhdGUgcGljdHVy
ZSBhc3BlY3QgcmF0aW8gZnJvbSBlaXRoZXIKPiAtCSAqIHVzZXIgaW5wdXQgKGlmIHNwZWNpZmll
ZCkgb3IgZnJvbSB0aGUgQ0VBIG1vZGUgbGlzdC4KPiArCSAqIHVzZXIgaW5wdXQgKGlmIHNwZWNp
ZmllZCkgb3IgZnJvbSB0aGUgQ0VBL0hETUkgbW9kZSBsaXN0cy4KPiAgCSAqLwo+ICAJcGljdHVy
ZV9hc3BlY3QgPSBtb2RlLT5waWN0dXJlX2FzcGVjdF9yYXRpbzsKPiAtCWlmIChwaWN0dXJlX2Fz
cGVjdCA9PSBIRE1JX1BJQ1RVUkVfQVNQRUNUX05PTkUpCj4gLQkJcGljdHVyZV9hc3BlY3QgPSBk
cm1fZ2V0X2NlYV9hc3BlY3RfcmF0aW8oZnJhbWUtPnZpZGVvX2NvZGUpOwo+ICsJaWYgKHBpY3R1
cmVfYXNwZWN0ID09IEhETUlfUElDVFVSRV9BU1BFQ1RfTk9ORSkgewo+ICsJCWlmICh2aWMpCj4g
KwkJCXBpY3R1cmVfYXNwZWN0ID0gZHJtX2dldF9jZWFfYXNwZWN0X3JhdGlvKHZpYyk7Cj4gKwkJ
ZWxzZSBpZiAoaGRtaV92aWMpCj4gKwkJCXBpY3R1cmVfYXNwZWN0ID0gZHJtX2dldF9oZG1pX2Fz
cGVjdF9yYXRpbyhoZG1pX3ZpYyk7Cj4gKwl9Cj4gCj4gIAkvKgo+ICAJICogVGhlIGluZm9mcmFt
ZSBjYW4ndCBjb252ZXkgYW55dGhpbmcgYnV0IG5vbmUsIDQ6MyBAQCAtNTI1NiwxMgo+ICs1Mjcz
LDIwIEBAIGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoc3RydWN0Cj4g
aGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKPiAgCSAqIHdlIGNhbiBvbmx5IHNhdGlzZnkgaXQg
Ynkgc3BlY2lmeWluZyB0aGUgcmlnaHQgVklDLgo+ICAJICovCj4gIAlpZiAocGljdHVyZV9hc3Bl
Y3QgPiBIRE1JX1BJQ1RVUkVfQVNQRUNUXzE2XzkpIHsKPiAtCQlpZiAocGljdHVyZV9hc3BlY3Qg
IT0KPiAtCQkgICAgZHJtX2dldF9jZWFfYXNwZWN0X3JhdGlvKGZyYW1lLT52aWRlb19jb2RlKSkK
PiArCQlpZiAodmljKSB7Cj4gKwkJCWlmIChwaWN0dXJlX2FzcGVjdCAhPSBkcm1fZ2V0X2NlYV9h
c3BlY3RfcmF0aW8odmljKSkKPiArCQkJCXJldHVybiAtRUlOVkFMOwo+ICsJCX0gZWxzZSBpZiAo
aGRtaV92aWMpIHsKPiArCQkJaWYgKHBpY3R1cmVfYXNwZWN0ICE9IGRybV9nZXRfaGRtaV9hc3Bl
Y3RfcmF0aW8oaGRtaV92aWMpKQo+ICsJCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfSBlbHNlIHsK
PiAgCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfQo+ICsKPiAgCQlwaWN0dXJlX2FzcGVjdCA9IEhE
TUlfUElDVFVSRV9BU1BFQ1RfTk9ORTsKPiAgCX0KPiAKPiArCWZyYW1lLT52aWRlb19jb2RlID0g
dmljOwo+ICAJZnJhbWUtPnBpY3R1cmVfYXNwZWN0ID0gcGljdHVyZV9hc3BlY3Q7Cj4gIAlmcmFt
ZS0+YWN0aXZlX2FzcGVjdCA9IEhETUlfQUNUSVZFX0FTUEVDVF9QSUNUVVJFOwo+ICAJZnJhbWUt
PnNjYW5fbW9kZSA9IEhETUlfU0NBTl9NT0RFX1VOREVSU0NBTjsKPiAtLQo+IDIuMjEuMAoKLS0K
V2F5bmUgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
