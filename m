Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B75B117309D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 06:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5758E6EDE6;
	Fri, 28 Feb 2020 05:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6956EDE6;
 Fri, 28 Feb 2020 05:50:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 21:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="437317578"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2020 21:50:21 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Feb 2020 21:50:21 -0800
Received: from bgsmsx109.gar.corp.intel.com (10.223.4.211) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Feb 2020 21:50:21 -0800
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.58]) by
 BGSMSX109.gar.corp.intel.com ([169.254.10.142]) with mapi id 14.03.0439.000;
 Fri, 28 Feb 2020 11:20:17 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: RE: [Intel-gfx] [RFC][PATCH 5/5] drm/i915/display: Add
 Nearest-neighbor based integer scaling support
Thread-Topic: [Intel-gfx] [RFC][PATCH 5/5] drm/i915/display: Add
 Nearest-neighbor based integer scaling support
Thread-Index: AQHV66uZeA9shQKOjUiF9Sh/Uqx6m6grJygAgAT3PXA=
Date: Fri, 28 Feb 2020 05:50:16 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA03128605778A4D@BGSMSX107.gar.corp.intel.com>
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225070545.4482-6-pankaj.laxminarayan.bharadiya@intel.com>
 <CAPj87rPHFCntSOCx=92HitNxRBkXx3xSft0krkFLzdM2FrDSRw@mail.gmail.com>
In-Reply-To: <CAPj87rPHFCntSOCx=92HitNxRBkXx3xSft0krkFLzdM2FrDSRw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Souza,
 Jose" <jose.souza@intel.com>, "Nautiyal, 
 Ankit K" <ankit.k.nautiyal@intel.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFN0b25lIDxk
YW5pZWxAZm9vaXNoYmFyLm9yZz4NCj4gU2VudDogMjUgRmVicnVhcnkgMjAyMCAxMzowMA0KPiBU
bzogTGF4bWluYXJheWFuIEJoYXJhZGl5YSwgUGFua2FqDQo+IDxwYW5rYWoubGF4bWluYXJheWFu
LmJoYXJhZGl5YUBpbnRlbC5jb20+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGlu
dXguaW50ZWwuY29tPjsgRGFuaWVsIFZldHRlcg0KPiA8ZGFuaWVsQGZmd2xsLmNoPjsgaW50ZWwt
Z2Z4IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgZHJpLWRldmVsDQo+IDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgVmlsbGUgU3lyasOkbMOkDQo+IDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47
IE1hYXJ0ZW4NCj4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
OyB0emltbWVybWFubkBzdXNlLmRlOw0KPiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+OyBtaWhhaWwuYXRhbmFzc292QGFybS5jb207IEpvb25hcw0KPiBMYWh0aW5lbiA8am9vbmFz
LmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IFZpdmksIFJvZHJpZ28NCj4gPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+OyBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az47IFNv
dXphLA0KPiBKb3NlIDxqb3NlLnNvdXphQGludGVsLmNvbT47IERlIE1hcmNoaSwgTHVjYXMNCj4g
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1hdHRoZXcu
ZC5yb3BlckBpbnRlbC5jb20+OyBEZWFrLCBJbXJlIDxpbXJlLmRlYWtAaW50ZWwuY29tPjsNCj4g
U2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBOYXV0aXlhbCwgQW5raXQgSw0K
PiA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0
IDxsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtJbnRl
bC1nZnhdIFtSRkNdW1BBVENIIDUvNV0gZHJtL2k5MTUvZGlzcGxheTogQWRkIE5lYXJlc3QtDQo+
IG5laWdoYm9yIGJhc2VkIGludGVnZXIgc2NhbGluZyBzdXBwb3J0DQo+IA0KPiBIaSwNCj4gDQo+
IE9uIFR1ZSwgMjUgRmViIDIwMjAgYXQgMDc6MTcsIFBhbmthaiBCaGFyYWRpeWENCj4gPHBhbmth
ai5sYXhtaW5hcmF5YW4uYmhhcmFkaXlhQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gQEAgLTQxNSwx
OCArNDE1LDI2IEBAIHNrbF9wcm9ncmFtX3NjYWxlcihzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5l
LA0KPiA+ICAgICAgICAgdTE2IHlfdnBoYXNlLCB1dl9yZ2JfdnBoYXNlOw0KPiA+ICAgICAgICAg
aW50IGhzY2FsZSwgdnNjYWxlOw0KPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqc3RhdGUgPSAmcGxhbmVfc3RhdGUtPnVhcGk7DQo+ID4gKyAgICAgICB1MzIgc3JjX3cg
PSBkcm1fcmVjdF93aWR0aCgmcGxhbmVfc3RhdGUtPnVhcGkuc3JjKSA+PiAxNjsNCj4gPiArICAg
ICAgIHUzMiBzcmNfaCA9IGRybV9yZWN0X2hlaWdodCgmcGxhbmVfc3RhdGUtPnVhcGkuc3JjKSA+
PiAxNjsNCj4gPiAgICAgICAgIHUzMiBzY2FsaW5nX2ZpbHRlciA9IFBTX0ZJTFRFUl9NRURJVU07
DQo+ID4gKyAgICAgICBzdHJ1Y3QgZHJtX3JlY3QgZHN0Ow0KPiA+DQo+ID4gICAgICAgICBpZiAo
c3RhdGUtPnNjYWxpbmdfZmlsdGVyID09DQo+IERSTV9TQ0FMSU5HX0ZJTFRFUl9ORUFSRVNUX05F
SUdIQk9SKSB7DQo+ID4gICAgICAgICAgICAgICAgIHNjYWxpbmdfZmlsdGVyID0gUFNfRklMVEVS
X1BST0dSQU1NRUQ7DQo+ID4gKyAgICAgICAgICAgICAgIHNrbF9zZXR1cF9uZWFyZXN0X25laWdo
Ym9yX2ZpbHRlcihkZXZfcHJpdiwgcGlwZSwNCj4gPiArIHNjYWxlcl9pZCk7DQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAgICAvKiBNYWtlIHRoZSBzY2FsaW5nIHdpbmRvdyBzaXplIHRvIGludGVn
ZXIgbXVsdGlwbGUgb2Ygc291cmNlDQo+ID4gKyAgICAgICAgICAgICAgICAqIFRPRE86IFNob3Vs
ZCB1c2Vyc3BhY2UgdGFrZSBkZXNpc2lvbiB0byByb3VuZCBzY2FsaW5nIHdpbmRvdw0KPiA+ICsg
ICAgICAgICAgICAgICAgKiB0byBpbnRlZ2VyIG11bHRpcGxlPw0KPiA+ICsgICAgICAgICAgICAg
ICAgKi8NCj4gPiArICAgICAgICAgICAgICAgY3J0Y193ID0gcm91bmRkb3duKGNydGNfdywgc3Jj
X3cpOw0KPiA+ICsgICAgICAgICAgICAgICBjcnRjX2ggPSByb3VuZGRvd24oY3J0Y19oLCBzcmNf
aCk7DQo+IA0KPiBUaGUga2VybmVsIHNob3VsZCBhYnNvbHV0ZWx5IG5vdCBiZSBjaGFuZ2luZyB0
aGUgY28tb3JkaW5hdGVzIHRoYXQNCj4gdXNlcnNwYWNlIHJlcXVlc3RlZC4NCg0KVGhhbmtzLCBX
aWxsIGdldCByaWQgb2YgdGhpcyBpbiBWMi4NCg0KVGhhbmtzLA0KUGFua2FqDQo+IA0KPiBDaGVl
cnMsDQo+IERhbmllbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
