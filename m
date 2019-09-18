Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459DB6B8C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 21:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807DF6F917;
	Wed, 18 Sep 2019 19:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B6D6F924;
 Wed, 18 Sep 2019 19:03:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 12:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="186559553"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2019 12:03:41 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.184]) by
 IRSMSX109.ger.corp.intel.com ([169.254.13.29]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 20:03:41 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 09/12] drm/i915: Add PIPECONF YCbCr 4:4:4
 programming for HSW
Thread-Topic: [Intel-gfx] [PATCH 09/12] drm/i915: Add PIPECONF YCbCr 4:4:4
 programming for HSW
Thread-Index: AQHVPXhROrqsRqkSw0SaMxUfze7FLqcyG9cA
Date: Wed, 18 Sep 2019 19:03:40 +0000
Message-ID: <190062bdc035cc63008ef79956e8ed41782a6099.camel@intel.com>
References: <20190718145053.25808-1-ville.syrjala@linux.intel.com>
 <20190718145053.25808-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20190718145053.25808-10-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.162]
Content-ID: <498F4834760BFD4AA4492FBD9E2D8E35@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDE3OjUwICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gT24gSFNXIHRoZSBwaXBlIGNvbG9yc3BhY2UgaXMgY29uZmlndXJlZCB2aWEgUElQRUNP
TkYNCj4gKGFzIG9wcG9zZWQgdG8gUElQRU1JU0MgaW4gQkRXKykuIExldCdzIGNvbmZpZ3VyZSty
ZWFkb3V0DQo+IHRoYXQgc3R1ZmYgY29ycmVjdGx5Lg0KPiANCj4gRW5hYmxsaW5nIFlDYkNyIDQ6
NDo0IG91dHB1dCB3aWxsIG5vdyBiZSBhIHNpbXBsZSBtYXR0ZXIgb2YNClR5cG86IEVuYWJsbGlu
ZyAtPiBFbmFibGluZw0KPiBzZXR0aW5nIGNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgYXBwcm9w
cmlhdGVseSBpbiB0aGUgZW5jb2Rlcg0KPiAuY29tcHV0ZV9jb25maWcoKS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMg
fCAxMyArKysrKysrKysrKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAg
ICAgICAgICAgICB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5LmMNCj4gaW5kZXggMWRkMWFhMjlhNjQ5Li5iZDNmZjk2YzE2MTggMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IEBA
IC05NDMwLDYgKzk0MzAsMTAgQEAgc3RhdGljIHZvaWQgaGFzd2VsbF9zZXRfcGlwZWNvbmYoY29u
c3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ICAJZWxzZQ0KPiAg
CQl2YWwgfD0gUElQRUNPTkZfUFJPR1JFU1NJVkU7DQo+ICANCj4gKwlpZiAoSVNfSEFTV0VMTChk
ZXZfcHJpdikgJiYNCj4gKwkgICAgY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCAhPSBJTlRFTF9P
VVRQVVRfRk9STUFUX1JHQikNCj4gKwkJdmFsIHw9IFBJUEVDT05GX09VVFBVVF9DT0xPUlNQQUNF
X1lVVl9IU1c7DQo+ICsNCj4gIAlJOTE1X1dSSVRFKFBJUEVDT05GKGNwdV90cmFuc2NvZGVyKSwg
dmFsKTsNCj4gIAlQT1NUSU5HX1JFQUQoUElQRUNPTkYoY3B1X3RyYW5zY29kZXIpKTsNCj4gIH0N
Cj4gQEAgLTEwNDIzLDcgKzEwNDI3LDE0IEBAIHN0YXRpYyBib29sIGhhc3dlbGxfZ2V0X3BpcGVf
Y29uZmlnKHN0cnVjdA0KPiBpbnRlbF9jcnRjICpjcnRjLA0KPiAgDQo+ICAJaW50ZWxfZ2V0X3Bp
cGVfc3JjX3NpemUoY3J0YywgcGlwZV9jb25maWcpOw0KPiAgDQo+IC0JaWYgKElOVEVMX0dFTihk
ZXZfcHJpdikgPj0gOSB8fCBJU19CUk9BRFdFTEwoZGV2X3ByaXYpKSB7DQo+ICsJaWYgKElTX0hB
U1dFTEwoZGV2X3ByaXYpKSB7DQo+ICsJCXUzMiB0bXAgPSBJOTE1X1JFQUQoUElQRUNPTkYocGlw
ZV9jb25maWctDQo+ID5jcHVfdHJhbnNjb2RlcikpOw0KPiArDQo+ICsJCWlmICh0bXAgJiBQSVBF
Q09ORl9PVVRQVVRfQ09MT1JTUEFDRV9ZVVZfSFNXKQ0KPiArCQkJcGlwZV9jb25maWctPm91dHB1
dF9mb3JtYXQgPQ0KPiBJTlRFTF9PVVRQVVRfRk9STUFUX1lDQkNSNDQ0Ow0KPiArCQllbHNlDQo+
ICsJCQlwaXBlX2NvbmZpZy0+b3V0cHV0X2Zvcm1hdCA9DQo+IElOVEVMX09VVFBVVF9GT1JNQVRf
UkdCOw0KPiArCX0gZWxzZSB7DQo+ICAJCXBpcGVfY29uZmlnLT5vdXRwdXRfZm9ybWF0ID0NCj4g
IAkJCWJkd19nZXRfcGlwZW1pc2Nfb3V0cHV0X2Zvcm1hdChjcnRjKTsNCj4gIA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfcmVnLmgNCj4gaW5kZXggNjZmN2Y0MTcyMzFmLi41ODQ3MTMxMmI4YjIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiBAQCAtNTcxMiw2ICs1NzEyLDcgQEAgZW51
bSB7DQo+ICAjZGVmaW5lICAgUElQRUNPTkZfQ1hTUl9ET1dOQ0xPQ0sJKDEgPDwgMTYpDQo+ICAj
ZGVmaW5lICAgUElQRUNPTkZfRURQX1JSX01PREVfU1dJVENIX1ZMVgkoMSA8PCAxNCkNCj4gICNk
ZWZpbmUgICBQSVBFQ09ORl9DT0xPUl9SQU5HRV9TRUxFQ1QJKDEgPDwgMTMpDQo+ICsjZGVmaW5l
ICAgUElQRUNPTkZfT1VUUFVUX0NPTE9SU1BBQ0VfWVVWX0hTVwkoMSA8PCAxMSkgLyogaHN3IG9u
bHkNCj4gKi8NCj4gICNkZWZpbmUgICBQSVBFQ09ORl9CUENfTUFTSwkoMHg3IDw8IDUpDQo+ICAj
ZGVmaW5lICAgUElQRUNPTkZfOEJQQwkJKDAgPDwgNSkNCj4gICNkZWZpbmUgICBQSVBFQ09ORl8x
MEJQQwkoMSA8PCA1KQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
