Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C614DC7BE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65510EBCB;
	Thu, 17 Mar 2022 13:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A2B10EBCB;
 Thu, 17 Mar 2022 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647524524; x=1679060524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xC+PkNEo1STiYbeOnSfOAXfxR9DsIZDobnH0VSJaDGk=;
 b=koXH8GPGin0ZTjfBxeScuWTgq6S5v6W8unBKn5kv9upvnkOEmciowdRR
 NvhY6gLit7SZGr7SQBJbkwTEV/xnGZBPJ+ct07wc5y9RfO54fBB3i138Y
 v7WlMu30LN3EOIPHGHPAG+4o5qaVCNuuo2IIuDI1b34irythlNS64bn6T
 k0U2LcRD1blRPbUb9QMZWj75VWVA12TvjXn4W0b2hO94dY9rVnOpRGyZb
 sDRqYRynX/f2tAphoSC10Xl60mHenR4Pv0Jk6YLPYzxk1eR7t6XS65HuG
 ThBpRzh3fWNPtIKAKV80LXtS59ACmmd4De8CNwYP8PMn66y/x7imqV4of Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237478831"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237478831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 06:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="516766760"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 17 Mar 2022 06:42:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 06:42:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 06:42:01 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.021;
 Thu, 17 Mar 2022 06:42:01 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/i915: Add logical mapping for video decode engines
Thread-Topic: [PATCH 2/2] drm/i915: Add logical mapping for video decode
 engines
Thread-Index: AQHYOZAJ2Bsg+2dNDUe4rsINSEbMJ6zEDBoA
Date: Thu, 17 Mar 2022 13:42:01 +0000
Message-ID: <cbb389d6b46156b6d53613b5adc93c86d5335ac1.camel@intel.com>
References: <20220316234538.434357-1-lucas.demarchi@intel.com>
 <20220316234538.434357-2-lucas.demarchi@intel.com>
In-Reply-To: <20220316234538.434357-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <79509C83DA53654A8970C53A00C37232@intel.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTAzLTE2IGF0IDE2OjQ1IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IEZyb206IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiANCj4g
QWRkIGxvZ2ljYWwgbWFwcGluZyBmb3IgVkRCT1hzLiBUaGlzIG1hcHBpbmcgaXMgcmVxdWlyZWQg
Zm9yDQo+IHNwbGl0LWZyYW1lIHdvcmtsb2Fkcywgd2hpY2ggb3RoZXJ3aXNlIGZhaWwgd2l0aA0K
PiANCj4gCTAwMDAwMDAwLUY4QzUzNTI4OiBbR1VDXSAwNDQxLUlOVkFMSURfRU5HSU5FX1NVQk1J
VF9NQVNLDQo+IA0KPiAuLi4gaWYgdGhlIGFwcGxpY2F0aW9uIGlzIHVzaW5nIHRoZSBsb2dpY2Fs
IGlkIHRvIHJlb3JkZXIgdGhlIGVuZ2luZXMgYW5kDQo+IHRoZW4gdXNpbmcgaXQgZm9yIHRoZSBi
YXRjaCBidWZmZXIgc3VibWlzc2lvbi4gSXQncyBub3QgYSBiaWcgcHJvYmxlbSBvbg0KPiBtZWRp
YSB2ZXJzaW9uIDExIGFuZCAxMiBhcyB0aGV5IGhhdmUgb25seSAyIGluc3RhbmNlcyBvZiBWQ1Mg
YW5kIHRoZQ0KPiBsb2dpY2FsIHRvIHBoeXNpY2FsIG1hcHBpbmcgaXMgbW9ub3RvbmljYWxseSBp
bmNyZWFzaW5nIC0gaWYgdGhlDQo+IGFwcGxpY2F0aW9uIGlzIG5vdCB1c2luZyB0aGUgbG9naWNh
bCBpZC4NCj4gDQo+IENoYW5naW5nIGl0IGZvciB0aGUgcHJldmlvdXMgcGxhdGZvcm1zIGFsbG93
cyB0aGUgbWVkaWEgZHJpdmVyDQo+IGltcGxlbWVudGF0aW9uIGZvciB0aGUgbmV4dCBvbmVzICgx
Mi41MCBhbmQgYWJvdmUpIHRvIGJlIHRoZSBzYW1lLA0KPiBjaGVja2luZyB0aGUgbG9naWNhbCBp
ZC4gSXQgc2hvdWxkIGFsc28gbm90IGludHJvZHVjZSBhbnkgYnVnIGZvciB0aGUNCj4gb2xkIHZl
cnNpb25zIG9mIHVzZXJzcGFjZSBub3QgY2hlY2tpbmcgdGhlIGlkLg0KPiANCj4gVGhlIG1hcHBp
bmcgYWRkZWQgaGVyZSBpcyB0aGUgY29tcGxldGUgbWFwIG5lZWRlZCBieSBYRUhQU0RWLiBQcmV2
aW91cw0KPiBwbGF0Zm9ybXMgd2l0aCBvbmx5IDIgaW5zdGFuY2VzIHdpbGwganVzdCB1c2UgYSBw
YXJ0aWFsIG1hcCBhbmQgc2hvdWxkDQo+IHN0aWxsIHdvcmsuDQo+IA0KPiBDYzogTWF0dCBSb3Bl
ciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IFsgRXh0ZW5kIHRoZSBtYXBwaW5nIHRv
IG1lZGlhIHZlcnNpb25zIDExIGFuZCAxMiBhbmQgZ2l2ZSBwcm9wZXINCj4gICBqdXN0aWZpY2F0
aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSB3aHkgXQ0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBE
ZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3MuYyB8IDIyICsrKysrKysrKysrKysrKysrLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9j
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX2NzLmMNCj4gaW5kZXgg
ODA4MDQ3OWYyN2FhLi5hZmEyZTYxY2Y3MjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L2ludGVsX2VuZ2luZV9jcy5jDQo+IEBAIC03MzEsMTIgKzczMSwyNCBAQCBzdGF0aWMgdm9p
ZCBwb3B1bGF0ZV9sb2dpY2FsX2lkcyhzdHJ1Y3QgaW50ZWxfZ3QgKmd0LCB1OCAqbG9naWNhbF9p
ZHMsDQo+ICANCj4gIHN0YXRpYyB2b2lkIHNldHVwX2xvZ2ljYWxfaWRzKHN0cnVjdCBpbnRlbF9n
dCAqZ3QsIHU4ICpsb2dpY2FsX2lkcywgdTggY2xhc3MpDQo+ICB7DQo+IC0JaW50IGk7DQo+IC0J
dTggbWFwW01BWF9FTkdJTkVfSU5TVEFOQ0UgKyAxXTsNCj4gKwkvKg0KPiArCSAqIExvZ2ljYWwg
dG8gcGh5c2ljYWwgbWFwcGluZyBpcyBuZWVkZWQgZm9yIHByb3BlciBzdXBwb3J0DQo+ICsJICog
dG8gc3BsaXQtZnJhbWUgZmVhdHVyZS4NCj4gKwkgKi8NCj4gKwlpZiAoTUVESUFfVkVSKGd0LT5p
OTE1KSA+PSAxMSAmJiBjbGFzcyA9PSBWSURFT19ERUNPREVfQ0xBU1MpIHsNCj4gKwkJc3RhdGlj
IGNvbnN0IHU4IG1hcFtdID0geyAwLCAyLCA0LCA2LCAxLCAzLCA1LCA3IH07DQoNCllvdSBjYW4g
ZHJvcCB0aGUgc3RhdGljLg0KDQpPdGhlciB0aGFuIHRoYXQgTEdUTS4NClJldmlld2VkLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiAgDQo+IC0J
Zm9yIChpID0gMDsgaSA8IE1BWF9FTkdJTkVfSU5TVEFOQ0UgKyAxOyArK2kpDQo+IC0JCW1hcFtp
XSA9IGk7DQo+IC0JcG9wdWxhdGVfbG9naWNhbF9pZHMoZ3QsIGxvZ2ljYWxfaWRzLCBjbGFzcywg
bWFwLCBBUlJBWV9TSVpFKG1hcCkpOw0KPiArCQlwb3B1bGF0ZV9sb2dpY2FsX2lkcyhndCwgbG9n
aWNhbF9pZHMsIGNsYXNzLA0KPiArCQkJCSAgICAgbWFwLCBBUlJBWV9TSVpFKG1hcCkpOw0KPiAr
CX0gZWxzZSB7DQo+ICsJCWludCBpOw0KPiArCQl1OCBtYXBbTUFYX0VOR0lORV9JTlNUQU5DRSAr
IDFdOw0KPiArDQo+ICsJCWZvciAoaSA9IDA7IGkgPCBNQVhfRU5HSU5FX0lOU1RBTkNFICsgMTsg
KytpKQ0KPiArCQkJbWFwW2ldID0gaTsNCj4gKwkJcG9wdWxhdGVfbG9naWNhbF9pZHMoZ3QsIGxv
Z2ljYWxfaWRzLCBjbGFzcywNCj4gKwkJCQkgICAgIG1hcCwgQVJSQVlfU0laRShtYXApKTsNCj4g
Kwl9DQo+ICB9DQo+ICANCj4gIC8qKg0KDQo=
