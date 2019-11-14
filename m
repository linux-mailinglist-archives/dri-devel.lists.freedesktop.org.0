Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C3FC8BF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 15:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8DC6EA2B;
	Thu, 14 Nov 2019 14:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CC66EA2B;
 Thu, 14 Nov 2019 14:20:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 06:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="404987346"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2019 06:20:46 -0800
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 14 Nov 2019 06:20:46 -0800
Received: from fmsmsx119.amr.corp.intel.com ([169.254.14.8]) by
 fmsmsx115.amr.corp.intel.com ([169.254.4.117]) with mapi id 14.03.0439.000;
 Thu, 14 Nov 2019 06:20:45 -0800
From: "Bloomfield, Jon" <jon.bloomfield@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: RE: drm-next + i915 CVE yolo merge
Thread-Topic: drm-next + i915 CVE yolo merge
Thread-Index: AQHVmouWKOmcSj6wQEekfGGWd8tzzKeK17qA///d7gA=
Date: Thu, 14 Nov 2019 14:20:45 +0000
Deferred-Delivery: Thu, 14 Nov 2019 14:20:33 +0000
Message-ID: <AD48BB7FB99B174FBCC69E228F58B3B68EB2EE33@FMSMSX119.amr.corp.intel.com>
References: <CAPM=9txqtne1+ycij3YYmxWA1jAOB=VoWCZbjnLb71hwxB7_Cw@mail.gmail.com>
 <CAKMK7uFtbRifpYanq3qOAOfzFFKWEe0zvJUg8A241TJ6rqoE+A@mail.gmail.com>
In-Reply-To: <CAKMK7uFtbRifpYanq3qOAOfzFFKWEe0zvJUg8A241TJ6rqoE+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGVhZDk3OGQtYWRlOC00MTQ5LTg0OTYtM2ExN2IwYjRmOThmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRjVPXC91QldFd0hReWtXRmpKMk1Sd2FTZVVPM3Q3bmVGdlRCdU95TGFnMHltbWRBNHpmS0c4dm1vd1hFRFoybHcifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTQsIDIwMTkg
MTI6MTMgQU0NCj4gVG86IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4NCj4gQ2M6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBCbG9vbWZpZWxkLCBKb24N
Cj4gPGpvbi5ibG9vbWZpZWxkQGludGVsLmNvbT47IEpvb25hcyBMYWh0aW5lbg0KPiA8am9vbmFz
LmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPjsNCj4gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+OyBk
cmktZGV2ZWwgPGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgSW50ZWwgR3Jh
cGhpY3MgRGV2ZWxvcG1lbnQgPGludGVsLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsg
TGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KPiBTdWJqZWN0
OiBSZTogZHJtLW5leHQgKyBpOTE1IENWRSB5b2xvIG1lcmdlDQo+IA0KPiBPbiBUaHUsIE5vdiAx
NCwgMjAxOSBhdCAyOjMzIEFNIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6
DQo+ID4gVGhlIGxhbmRpbmcgb2YgdGhlIGk5MTUgQ1ZFIGZpeGVzIGludG8gTGludXMgdHJlZSBo
YXMgY3JlYXRlZCBhIGJpdCBvZg0KPiA+IGEgbWVzcyBpbiBsaW51eC1uZXh0IGFuZCBkb3duc3Ry
ZWFtIGluIGRybS1uZXh0IHRyZWVzLg0KPiA+DQo+ID4gSSB0YWxrZWQgdG8gRGFuaWVsIGFuZCBo
ZSBoYWQgdGFsa2VkIHRvIEpvb25hcyBhIGJpdCwgYW5kIEkgZGVjaWRlZCB0bw0KPiA+IGdvIHdp
dGggd2hhdCBEYW5pZWwgZGVzY3JpYmVzIGFzIHRoZSBZT0xPIG1lcmdlLCB3aGVyZSBJIGp1c3Qg
c29sdmUgaXQNCj4gPiBhbmQgcHJheSwgYW5kIGV2ZXJ5b25lIGVsc2UgdmVyaWZpZXMvZml4ZXMg
aXQuDQo+ID4NCj4gPiBJbiBteSBmYXZvdXIgSSd2ZSBiZWVuIHJlYWRpbmcgdGhlc2UgcGF0Y2hl
cyBmb3IgYSBjb3VwbGUgb2YgbW9udGhzDQo+ID4gbm93IGFuZCBhcHBsaWVkIHRoZW0gdG8gYSBs
b3Qgb2YgcGxhY2VzLCBzbyBJJ20gcXVpdGUgZmFtaWxpYXIgd2l0aA0KPiA+IHdoYXQgdGhleSBh
cmUgZG9pbmcuDQo+ID4NCj4gPiBUaGUgd29yc3QgY3VscHJpdCB3YXMgdGhlIFJDNiBjdHggY29y
cnVwdGlvbiBmaXggc2luY2UgdGhlIHdob2xlIG9mDQo+ID4gcmM2IGdvdCByZWZhY3RvcmVkIGlu
IG5leHQuIEhvd2V2ZXIgSSBhbHNvIGhhZCBhY2Nlc3MgdG8gYSB2ZXJzaW9uIG9mDQo+ID4gdGhp
cyBwYXRjaCBKb24gd3JvdGUgb24gZHJtLXRpcCBhIGNvdXBsZSBvZiB3ZWVrcyBhZ28uDQo+ID4N
Cj4gPiBJIHRvb2sgdGhhdCBwYXRjaCwgYXBwbGllZCBpdCBhbmQgZml4ZWQgaXQgdXAgb24gdG9w
IG9mIGRybS1uZXh0LiBUaGVuDQo+ID4gSSBiYWNrbWVyZ2VkIHRoZSBjb21taXQgdGhhdCBhbHNv
IHdlbnQgaW50byBMaW51cycgdHJlZS4gVGhlbiBJDQo+ID4gcmVtb3ZlZCBhbnkgZXZpZGVuY2Ug
b2YgdGhlIFJDNiBwYXRjaCBmcm9tIExpbnVzJyB0cmVlIGFuZCBsZWZ0IHRoZQ0KPiA+IG5ld2Vy
IHZlcnNpb24gcGllY2VzIGluIHBsYWNlLiBUaGUgb3RoZXIgc3R1ZmYgbW9zdGx5IG1lcmdlZCBm
aW5lIGFuZA0KPiA+IHRoZSByZXN1bHRzIGxvb2tlZCBmaW5lLCBidXQgSSdkIGRlZmluaXRlbHkg
dGhpbmsgZXZlcnlvbmUgYXQgSW50ZWwNCj4gPiBzaG91bGQgYmUgc3RhcmluZyBhdCBpdCwgYW5k
IG15IGRpbnEgdGlwIHJlc29sdXRpb25zIEFTQVAgYW5kDQo+ID4gaG9wZWZ1bGx5IGl0IGdvZXMg
aW50byBDSSBhbmQgY29tZXMgb3V0IHNtZWxsaW5nIG9mIHNvbWV0aGluZyBnb29kLg0KPiA+DQoN
CkltcmUgc2hvdWxkIGxvb2sgYXQgdGhlIFJDNiBmaXggLSBIZSBkaWQgYWxsIHRoZSBoYXJkIHdv
cmsgb24gdGhhdCwgaW5jbHVkaW5nIHRoZSByZWJhc2VzIEkgc2VudCB0byBEYXZlLiBJIHdhcyBq
dXN0IGEgcHJveHkgOi0pDQoNCj4gPiBMZXQgbWUga25vdyBpZiBpdCdzIGFsbCBob3JyaWJsZSBh
c2FwLA0KPiANCj4gQWRkIE1hcnRpbiBhbmQgQXJlayBmb3IgQ0kgcmVzdWx0cy4gVGhlIHlvbG8g
c3R1ZmYgbGFuZGVkIGluDQo+IENJX0RSTV83MzQwLCBkaWQgd2UgYnJlYWsgYW55dGhpbmcgaW4g
dGhlcmU/IEZyb20gYSBxdWljayBsb29rIHNlZW1zDQo+IGFsbCBvay4NCg0KSm9uDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
