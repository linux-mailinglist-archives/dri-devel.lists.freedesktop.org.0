Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8616BE4D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 11:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362216EA7C;
	Tue, 25 Feb 2020 10:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446E26EA7B;
 Tue, 25 Feb 2020 10:09:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 02:09:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; d="scan'208";a="271252934"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2020 02:09:46 -0800
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 02:09:46 -0800
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 02:09:45 -0800
Received: from BGSMSX107.gar.corp.intel.com ([169.254.9.58]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.95]) with mapi id 14.03.0439.000;
 Tue, 25 Feb 2020 15:39:43 +0530
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "mripard@kernel.org"
 <mripard@kernel.org>, "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>
Subject: RE: [RFC][PATCH 1/5] drm: Introduce scaling filter property
Thread-Topic: [RFC][PATCH 1/5] drm: Introduce scaling filter property
Thread-Index: AQHV66uGwTJMv8I+wEuEQcDULMK+vagrUAeAgABcxWA=
Date: Tue, 25 Feb 2020 10:09:42 +0000
Message-ID: <E92BA18FDE0A5B43B7B3DA7FCA03128605773303@BGSMSX107.gar.corp.intel.com>
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225070545.4482-2-pankaj.laxminarayan.bharadiya@intel.com>
 <87pne3rnwu.fsf@intel.com>
In-Reply-To: <87pne3rnwu.fsf@intel.com>
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogMjUgRmVicnVhcnkgMjAyMCAxNToy
Ng0KPiBUbzogTGF4bWluYXJheWFuIEJoYXJhZGl5YSwgUGFua2FqDQo+IDxwYW5rYWoubGF4bWlu
YXJheWFuLmJoYXJhZGl5YUBpbnRlbC5jb20+OyBkYW5pZWxAZmZ3bGwuY2g7IGludGVsLQ0KPiBn
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Ow0KPiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsgYWlybGllZEBsaW51eC5pZTsNCj4g
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOyB0emltbWVybWFubkBzdXNlLmRlOw0K
PiBtcmlwYXJkQGtlcm5lbC5vcmc7IG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbQ0KPiBDYzogTGF4
bWluYXJheWFuIEJoYXJhZGl5YSwgUGFua2FqDQo+IDxwYW5rYWoubGF4bWluYXJheWFuLmJoYXJh
ZGl5YUBpbnRlbC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBOYXV0aXlh
bCwgQW5raXQgSyA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UkZDXVtQQVRDSCAxLzVdIGRybTogSW50cm9kdWNlIHNjYWxpbmcgZmlsdGVyIHByb3BlcnR5DQo+
IA0KPiBPbiBUdWUsIDI1IEZlYiAyMDIwLCBQYW5rYWogQmhhcmFkaXlhDQo+IDxwYW5rYWoubGF4
bWluYXJheWFuLmJoYXJhZGl5YUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBhbmthaiBCaGFyYWRpeWENCj4gPiA8cGFua2FqLmxheG1pbmFyYXlhbi5iaGFyYWRpeWFAaW50
ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoYXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsuc2hh
cm1hQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmtpdCBOYXV0aXlhbCA8YW5raXQu
ay5uYXV0aXlhbEBpbnRlbC5jb20+DQo+IA0KPiBXaGF0IGRpZCBTaGFzaGFuayBhbmQgQW5raXQg
ZG8sIHNob3VsZCBvbmUgb3IgdGhlIG90aGVyIHBlcmhhcHMgcmV0YWluDQo+IGF1dGhvcnNoaXA/
DQoNCkkga2luZCBvZiByZWZhY3RvcmVkIHRoZSBjb2RlLCBhZGRlZCBwbGFuZSBzY2FsaW5nIHN1
cHBvcnQgYWRkZWQgbmV3IEFQSXMgJiBkb2N1bWVudGF0aW9uDQogYW5kIHJld3JvdGUgdGhlIHNj
YWxpbmcgZmlsdGVyIHNldHRpbmcgbG9naWMuIFNpbmNlIEkgbWFkZSBzaWduaWZpY2FudCBjaGFu
Z2VzIChJTUhPKSwgSSB0aG91Z2h0DQpvZiBjaGFuZ2luZyB0aGUgYXV0aG9yc2hpcC4gSSBzcG9r
ZSB3aXRoIEFua2l0IHJlZ2FyZGluZyB0aGlzIGR1cmluZyBteSBpbml0aWFsIGRpc2N1c3Npb24g
d2l0aCBoaW0uDQoNCldpbGwgeW91IHBsZWFzZSByZXZpZXcgdGhlIHByZXNlbnQgUkZDIGFuZCB0
aGUgb2xkZXIgb25lIGFuZCBzdWdnZXN0LiAgSSBoYXZlDQpubyBpc3N1ZXMgd2l0aCBjaGFuZ2lu
ZyB0aGUgYXV0aG9yc2hpcCDwn5iKLg0KIA0KPiANCj4gSW4gYW55IGNhc2UsIHdoZW4gdGFraW5n
IG92ZXIgY29kZSBhbmQgc3VibWl0dGluZywgeW91IHNob3VsZCBhZGQgeW91ciBzaWduLW9mZg0K
PiAqbGFzdCouIFBsZWFzZSBzZWUgWzFdIGZvciB3aGF0IFNpZ25lZC1vZmYtYnkgbWVhbnMuDQoN
CldhcyBub3QgYXdhcmUsIHdpbGwgZG8gdGhlIG5lZWRmdWwuDQoNClRoYW5rcywNClBhbmthag0K
DQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KPiBbMV0gaHR0cHM6Ly9kZXZlbG9wZXJjZXJ0
aWZpY2F0ZS5vcmcvDQo+IA0KPiAtLQ0KPiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2Ug
R3JhcGhpY3MgQ2VudGVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
