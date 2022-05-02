Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84485176C8
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2243D10EB17;
	Mon,  2 May 2022 18:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D1810EB17;
 Mon,  2 May 2022 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651517198; x=1683053198;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T+UPeWmzOhR0Dy2bihyDb1E+DjCSpOUCDIXhj04NfUk=;
 b=W8l7miXHOiNHOTher/YYeFSiyYS5C/YIif0Ot6CEbJOnAfGgzsWLPcvM
 KijlJZO9dM5hvVJ/rJ6KtZs01j9PwfD2Q4EI1a9D7hS3p1uZk90aSibDa
 u96NzrFrdPrTN7R4447L1QHDKQTp0Y8X01FVHMETBS0XYmJpo3aDvMsqy
 wfjNxDJYe19X30rqawVAUBvLa293cQ6h8wT/VbqhXhimpH1XEkQpW+bQp
 KEBVmmM4srRcG+S11BBv/vaiG+jj6DaBNyLqgUaaeQmjzsiEevjBLwKVw
 1TQF/BiBuh6CSn6BrNs8mR4oZXHvLwJre4dk1TwYh6KyaDjJUqdlrFnwc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247208690"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="247208690"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 11:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583851890"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 02 May 2022 11:46:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 11:46:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 11:46:36 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Mon, 2 May 2022 11:46:36 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 06/11] drm/i915/pvc: Reduce stack usage in reset selftest
 with extra blitter engine
Thread-Topic: [PATCH 06/11] drm/i915/pvc: Reduce stack usage in reset selftest
 with extra blitter engine
Thread-Index: AQHYXkKBAmdOlzs/F06we8KIp4g2SK0MYvUA
Date: Mon, 2 May 2022 18:46:36 +0000
Message-ID: <b308861d15d0fe885a236a38ca097baf5de50ba4.camel@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-7-matthew.d.roper@intel.com>
In-Reply-To: <20220502163417.2635462-7-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B75134BF0991B429D6644174B3CB060@intel.com>
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA1LTAyIGF0IDA5OjM0IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBG
cm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiANCj4gUFZD
IGFkZHMgZXh0cmEgYmxpdHRlciBlbmdpbmVzIChpbiB0aGUgZm9sbG93aW5nIHBhdGNoKS4gVGhl
IHJlc2V0DQo+IHNlbGZ0ZXN0IGhhcyBhIGxvY2FsIGFycmF5IG9uIHRoZSBzdGFjayB3aGljaCBp
cyBzaXplZCBieSB0aGUgbnVtYmVyDQo+IG9mIGVuZ2luZXMuIFRoZSBpbmNyZWFzZSBwdXNoZXMg
dGhlIHNpemUgb2YgdGhpcyBhcnJheSB0byB0aGUgcG9pbnQNCj4gd2hlcmUgaXQgdHJpcHMgdGhl
ICdzdGFjayB0b28gbGFyZ2UnIGNvbXBpbGUgd2FybmluZy4gVGhpcyBwYXRjaCB0YWtlcw0KPiB0
aGUgYWxsb2NhdGlvbiBvZiB0aGUgc3RhY2sgYW5kIG1ha2VzIGl0IGR5bmFtaWMgaW5zdGVhZC4N
Cg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlz
b25ASW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9w
ZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0
X2hhbmdjaGVjay5jIHwgOSArKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Qvc2VsZnRlc3RfaGFuZ2NoZWNrLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9z
ZWxmdGVzdF9oYW5nY2hlY2suYw0KPiBpbmRleCA4M2ZmNGMyZTU3YzUuLjNiOWQ4MjI3NmRiMiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfaGFuZ2NoZWNr
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfaGFuZ2NoZWNrLmMN
Cj4gQEAgLTk3OSw2ICs5NzksNyBAQCBzdGF0aWMgaW50IF9faWd0X3Jlc2V0X2VuZ2luZXMoc3Ry
dWN0IGludGVsX2d0ICpndCwNCj4gIAllbnVtIGludGVsX2VuZ2luZV9pZCBpZCwgdG1wOw0KPiAg
CXN0cnVjdCBoYW5nIGg7DQo+ICAJaW50IGVyciA9IDA7DQo+ICsJc3RydWN0IGFjdGl2ZV9lbmdp
bmUgKnRocmVhZHM7DQo+ICANCj4gIAkvKiBDaGVjayB0aGF0IGlzc3VpbmcgYSByZXNldCBvbiBv
bmUgZW5naW5lIGRvZXMgbm90IGludGVyZmVyZQ0KPiAgCSAqIHdpdGggYW55IG90aGVyIGVuZ2lu
ZS4NCj4gQEAgLTk5Niw4ICs5OTcsMTEgQEAgc3RhdGljIGludCBfX2lndF9yZXNldF9lbmdpbmVz
KHN0cnVjdCBpbnRlbF9ndCAqZ3QsDQo+ICAJCQloLmN0eC0+c2NoZWQucHJpb3JpdHkgPSAxMDI0
Ow0KPiAgCX0NCj4gIA0KPiArCXRocmVhZHMgPSBremFsbG9jKHNpemVvZigqdGhyZWFkcykgKiBJ
OTE1X05VTV9FTkdJTkVTLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXRocmVhZHMpDQo+ICsJCXJl
dHVybiAtRU5PTUVNOw0KPiArDQo+ICAJZm9yX2VhY2hfZW5naW5lKGVuZ2luZSwgZ3QsIGlkKSB7
DQo+IC0JCXN0cnVjdCBhY3RpdmVfZW5naW5lIHRocmVhZHNbSTkxNV9OVU1fRU5HSU5FU10gPSB7
fTsNCj4gIAkJdW5zaWduZWQgbG9uZyBkZXZpY2UgPSBpOTE1X3Jlc2V0X2NvdW50KGdsb2JhbCk7
DQo+ICAJCXVuc2lnbmVkIGxvbmcgY291bnQgPSAwLCByZXBvcnRlZDsNCj4gIAkJYm9vbCB1c2lu
Z19ndWMgPSBpbnRlbF9lbmdpbmVfdXNlc19ndWMoZW5naW5lKTsNCj4gQEAgLTEwMTYsNyArMTAy
MCw3IEBAIHN0YXRpYyBpbnQgX19pZ3RfcmVzZXRfZW5naW5lcyhzdHJ1Y3QgaW50ZWxfZ3QgKmd0
LA0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gIA0KPiAtCQltZW1zZXQodGhyZWFkcywgMCwgc2l6
ZW9mKHRocmVhZHMpKTsNCj4gKwkJbWVtc2V0KHRocmVhZHMsIDAsIHNpemVvZigqdGhyZWFkcykg
KiBJOTE1X05VTV9FTkdJTkVTKTsNCj4gIAkJZm9yX2VhY2hfZW5naW5lKG90aGVyLCBndCwgdG1w
KSB7DQo+ICAJCQlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzazsNCj4gIA0KPiBAQCAtMTIzNiw2ICsx
MjQwLDcgQEAgc3RhdGljIGludCBfX2lndF9yZXNldF9lbmdpbmVzKHN0cnVjdCBpbnRlbF9ndCAq
Z3QsDQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiAgCX0NCj4gKwlrZnJlZSh0aHJlYWRzKTsNCj4g
IA0KPiAgCWlmIChpbnRlbF9ndF9pc193ZWRnZWQoZ3QpKQ0KPiAgCQllcnIgPSAtRUlPOw0KDQo=
