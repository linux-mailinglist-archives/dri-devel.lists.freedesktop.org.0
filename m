Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94F4A6211
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447BB10E196;
	Tue,  1 Feb 2022 17:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A6E10E157;
 Tue,  1 Feb 2022 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643735714; x=1675271714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=i0h5qFT/Bo0IsIvQOkkO5z2J6TvMithEvFyTrXr8FFM=;
 b=mPOituKFS3k+ZxYYngpPHFbbmxHQzsrMB+kXm9y7iAkXiKrc1jdOgfZS
 /HRrkbWeOiH7rE5tuN4mXKCEdynxhHLX/8pRFj5wE/+ib6RXp4l0MvgrB
 +ZlZ4R6RjQCgvQHmiO8RASSnh+voIKCCU1R8dZdNUziBXBSX3IGx45g/a
 TyXsYigGjKH/XmCRL1usOOAlgbPpypao1Tttt6fR06Asbg4btdVEWlEji
 hI6DFw6zFfAfU8WORdsktdneyqWmzE/lH0i0Ae37CgDQqL/mXZOBxwz/N
 orayVFaLMoRLG6J2otYe3ZwLsytq81E6xwrh22EKq7U5VgBAu/gv6/6jn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="228399164"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="228399164"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 09:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="698474793"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 01 Feb 2022 09:15:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 09:15:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 09:15:12 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2308.020;
 Tue, 1 Feb 2022 09:15:12 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/i915: Do not spam log with missing
 arch support
Thread-Topic: [Intel-gfx] [PATCH v3 3/3] drm/i915: Do not spam log with
 missing arch support
Thread-Index: AQHYFsPgYaG/1EGs90Ck2Lb33DgRO6x/d6kA
Date: Tue, 1 Feb 2022 17:15:12 +0000
Message-ID: <96f2f26758a7fb285afbcd29be751bf2b00d7dfc.camel@intel.com>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
 <20220131165926.3230642-4-lucas.demarchi@intel.com>
In-Reply-To: <20220131165926.3230642-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBC377CBC677BA498D8E6F751F1EC8ED@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAxLTMxIGF0IDA4OjU5IC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IEZvbGxvd2luZyB3aGF0IHdhcyBkb25lIGluIGRybV9jYWNoZS5jLCB3aGVuIHRoZSBzdHVi
IGZvcg0KPiByZW1hcF9pb19tYXBwaW5nKCkgd2FzIGFkZGVkIGluIGNvbW1pdCA2N2M0MzBiYmFh
ZTEgKCJkcm0vaTkxNTogU2tpcA0KPiByZW1hcF9pb19tYXBwaW5nKCkgZm9yIG5vbi14ODYgcGxh
dGZvcm1zIiksIGl0IGluY2x1ZGVkIGEgbG9nIG1lc3NhZ2UNCj4gd2l0aCBwcl9lcnIoKS4gIEhv
d2V2ZXIganVzdCB0aGUgd2FybmluZyBpcyBhbHJlYWR5IGVub3VnaCBhbmQgc3dpdGNoaW5nDQo+
IHRvIFdBUk5fT05DRSgpIGFsbG93cyB1cyB0byBrZWVwIHRoZSBsb2cgbWVzc2FnZSB3aGlsZSBh
dm9pZGluZyBsb2cNCj4gc3BhbS4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291
emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQpCdXQgc2FtZSBzdWdnZXN0aW9uIGFzIHRoZSBm
aXJzdCBwYXRjaCBpbiB0aGlzIHNlcmllcyBhYm91dCBkcm1fV0FSTl9PTkNFKCkuDQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gDQo+IHYzOiBObyBjaGFuZ2VzIGZyb20gcHJldmlvdXMgdmVyc2lvbiwganVz
dCBzdWJtaXR0aW5nIHRvIHRoZSByaWdodA0KPiBtYWlsaW5nIGxpc3QNCj4gDQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X21tLmggfCAzICstLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfbW0uaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbW0uaA0KPiBp
bmRleCAzYWQyMmJiZTgwZWIuLjA0Yzg5NzRkODIyYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9tbS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
bW0uaA0KPiBAQCAtMjMsOCArMjMsNyBAQCBpbnQgcmVtYXBfaW9fbWFwcGluZyhzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwNCj4gIAkJICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVk
IGxvbmcgcGZuLCB1bnNpZ25lZCBsb25nIHNpemUsDQo+ICAJCSAgICAgc3RydWN0IGlvX21hcHBp
bmcgKmlvbWFwKQ0KPiAgew0KPiAtCXByX2VycigiQXJjaGl0ZWN0dXJlIGhhcyBubyAlcygpIGFu
ZCBzaG91bGRuJ3QgYmUgY2FsbGluZyB0aGlzIGZ1bmN0aW9uXG4iLCBfX2Z1bmNfXyk7DQo+IC0J
V0FSTl9PTl9PTkNFKDEpOw0KPiArCVdBUk5fT05DRSgxLCAiQXJjaGl0ZWN0dXJlIGhhcyBubyBk
cm1fY2FjaGUuYyBzdXBwb3J0XG4iKTsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gICNlbmRpZg0K
DQo=
