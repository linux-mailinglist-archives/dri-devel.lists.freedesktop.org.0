Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E479D14
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8B089257;
	Mon, 29 Jul 2019 23:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AC789257
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 23:52:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 16:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="190714714"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 16:52:31 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.137]) by
 FMSMSX105.amr.corp.intel.com ([169.254.4.116]) with mapi id 14.03.0439.000;
 Mon, 29 Jul 2019 16:52:30 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH libdrm 3/3] intel: Add support for EHL
Thread-Topic: [PATCH libdrm 3/3] intel: Add support for EHL
Thread-Index: AQHVOz6l/iCfGihJvE+2nkCZx3Vy+6bi0DeA
Date: Mon, 29 Jul 2019 23:52:30 +0000
Message-ID: <c57579ff7e23de69dcb6edef54160d2dca504c92.camel@intel.com>
References: <20190715185332.10615-1-lucas.demarchi@intel.com>
 <20190715185332.10615-3-lucas.demarchi@intel.com>
In-Reply-To: <20190715185332.10615-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.8.193]
Content-ID: <5840B5A2117AEA46AED820F265691615@intel.com>
MIME-Version: 1.0
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
Cc: "Ausmus, James" <james.ausmus@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCg0KT24gTW9uLCAyMDE5LTA3LTE1IGF0IDExOjUzIC0wNzAwLCBMdWNhcyBE
ZSBNYXJjaGkgd3JvdGU6DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVs
LmNvbT4NCj4gDQo+IEFkZCB0aGUgUENJIElEIGltcG9ydCBmb3IgRUhMLg0KPiANCj4gQ2M6IFJv
ZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgQXVzbXVzIDxqYW1lcy5hdXNtdXNAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNh
cyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbnRlbC9p
bnRlbF9jaGlwc2V0LmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2ludGVsL2ludGVsX2NoaXBzZXQuYyBiL2ludGVsL2ludGVsX2No
aXBzZXQuYw0KPiBpbmRleCAxNTdjMmM3ZC4uZjZlMzdlZTcgMTAwNjQ0DQo+IC0tLSBhL2ludGVs
L2ludGVsX2NoaXBzZXQuYw0KPiArKysgYi9pbnRlbC9pbnRlbF9jaGlwc2V0LmMNCj4gQEAgLTM2
LDYgKzM2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlIHsNCj4gIH0gcGNpaWRz
W10gPSB7DQo+ICAJLyogS2VlcCBpZHMgc29ydGVkIGJ5IGdlbjsgbGF0ZXN0IGdlbiBmaXJzdCAq
Lw0KPiAgCUlOVEVMX1RHTF8xMl9JRFMoMTIpLA0KPiArCUlOVEVMX0VITF9JRFMoMTEpLA0KPiAg
CUlOVEVMX0lDTF8xMV9JRFMoMTEpLA0KPiAgCUlOVEVMX0NOTF9JRFMoMTApLA0KPiAgCUlOVEVM
X0NGTF9JRFMoOSksDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
