Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90658C9FFF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07846E9E6;
	Thu,  3 Oct 2019 14:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBFB6E9E4;
 Thu,  3 Oct 2019 14:02:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 07:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="275721842"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga001.jf.intel.com with ESMTP; 03 Oct 2019 07:02:05 -0700
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 3 Oct 2019 07:02:05 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.84]) by
 fmsmsx124.amr.corp.intel.com ([169.254.8.170]) with mapi id 14.03.0439.000;
 Thu, 3 Oct 2019 07:02:05 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/mm: Pack allocated/scanned boolean into a bitfield
Thread-Topic: [PATCH 2/2] drm/mm: Pack allocated/scanned boolean into a
 bitfield
Thread-Index: AQHVa/XR7TJ1QATpcU21b1VYmdrMnacutgEQgBpZ+wD///150A==
Date: Thu, 3 Oct 2019 14:02:05 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663D9C0289B@fmsmsx107.amr.corp.intel.com>
References: <20190915184539.16724-1-chris@chris-wilson.co.uk>
 <20190915184539.16724-2-chris@chris-wilson.co.uk>
 <14063C7AD467DE4B82DEDB5C278E8663D3DBA8B8@FMSMSX108.amr.corp.intel.com>
 <157008647693.2173.15522994971143064863@skylake-alporthouse-com>
In-Reply-To: <157008647693.2173.15522994971143064863@skylake-alporthouse-com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmQwYWM2YmMtNmI4Yy00MGVjLTgxZmYtMzY2Y2NiOTc0ZjhhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibzE0alAyRndBZ3dmT1FiVlEwYmd1V0JlSUZob2RvalgycTdoNHJvTnJGXC91M2ZWdWVSOUpLUEFGM2RaSEhXd1MifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIFttYWlsdG86ZHJp
LWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYNCj5PZiBDaHJp
cyBXaWxzb24NCj5TZW50OiBUaHVyc2RheSwgT2N0b2JlciAzLCAyMDE5IDM6MDggQU0NCj5Ubzog
UnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+OyBkcmktDQo+ZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj5TdWJqZWN0OiBSRTogW1BBVENIIDIvMl0gZHJtL21tOiBQYWNrIGFsbG9jYXRlZC9zY2Fu
bmVkIGJvb2xlYW4gaW50byBhDQo+Yml0ZmllbGQNCj4NCj5RdW90aW5nIFJ1aGwsIE1pY2hhZWwg
SiAoMjAxOS0wOS0xNiAyMDo0NToxNCkNCj4+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
Pj4gPkZyb206IGRyaS1kZXZlbCBbbWFpbHRvOmRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZ10gT24NCj5CZWhhbGYNCj4+ID5PZiBDaHJpcyBXaWxzb24NCj4+ID5TZW50OiBT
dW5kYXksIFNlcHRlbWJlciAxNSwgMjAxOSAyOjQ2IFBNDQo+PiA+QEAgLTQyNCw5ICs0MjQsOSBA
QCBpbnQgZHJtX21tX3Jlc2VydmVfbm9kZShzdHJ1Y3QgZHJtX21tICptbSwNCj4+ID5zdHJ1Y3Qg
ZHJtX21tX25vZGUgKm5vZGUpDQo+PiA+DQo+PiA+ICAgICAgIG5vZGUtPm1tID0gbW07DQo+PiA+
DQo+PiA+KyAgICAgIF9fc2V0X2JpdChEUk1fTU1fTk9ERV9BTExPQ0FURURfQklULCAmbm9kZS0+
ZmxhZ3MpOw0KPj4NCj4+IE1heWJlIGEgc2lsbHkgcXVlc3Rpb24ocyksIGJ1dCB5b3UgYXBwZWFy
IHRvIGJlIG1peGluZyBhdG9taWMgYml0IG9wcw0KPj4gKGNsZWFyXyBhbmQgdGVzdF8pIHdpdGgg
bm9uLWF0b21pYyBiaXQgb3BzIF9feHh4X2JpdCgpLg0KPj4NCj4+IFNob3VsZCB0aGF0IGJlIGEg
Y29uY2Vybj8gICBTaG91bGQgdGhhdCBiZSBtZW50aW9uIGluIHRoZSBjb21taXQ/DQo+DQo+R2Vu
ZXJhbGx5IHllcywgYnV0IHRoaXMgaXMgaW5zaWRlIGFuIGFsbG9jYXRpb24gZnVuY3Rpb24gc28g
dGhlIG5ldyBub2RlDQo+Y2Fubm90IGJlIGFjY2Vzc2VkIGNvbmN1cnJlbnRseSB5ZXQgKGFuZCBt
YW5pcHVsYXRpb24gb2YgdGhlIGRybV9tbQ0KPml0c2VsZiByZXF1aXJlcyBleHRlcm5hbCBzZXJp
YWxpc2F0aW9uKS4NCg0KR290IGl0LiANCg0KVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4N
Cg0KTWlrZQ0KDQoNCj5UaGUgY29uY2VybiBpcyB3aXRoIGJsb2NrcyBsaWtlDQo+DQo+PiA+ZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2NydGMuYw0KPmIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfY3J0Yy5jDQo+PiA+aW5kZXggZjFmMGE3Yzg3NzcxLi5iMDBlMjBmNWNlMDUg
MTAwNjQ0DQo+PiA+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfY3J0Yy5jDQo+PiA+Kysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfY3J0Yy5jDQo+PiA+QEAgLTk5NCw3ICs5OTQsNyBA
QCBzdGF0aWMgdm9pZCB2YzRfY3J0Y19kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1fY3J0Yw0KPj4g
PipjcnRjLA0KPj4gPiAgICAgICBzdHJ1Y3QgdmM0X2RldiAqdmM0ID0gdG9fdmM0X2RldihjcnRj
LT5kZXYpOw0KPj4gPiAgICAgICBzdHJ1Y3QgdmM0X2NydGNfc3RhdGUgKnZjNF9zdGF0ZSA9IHRv
X3ZjNF9jcnRjX3N0YXRlKHN0YXRlKTsNCj4+ID4NCj4+ID4tICAgICAgaWYgKHZjNF9zdGF0ZS0+
bW0uYWxsb2NhdGVkKSB7DQo+PiA+KyAgICAgIGlmIChkcm1fbW1fbm9kZV9hbGxvY2F0ZWQoJnZj
NF9zdGF0ZS0+bW0pKSB7DQo+PiA+ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsN
Cj4+ID4NCj4+ID4gICAgICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmdmM0LT5odnMtPm1t
X2xvY2ssIGZsYWdzKTsNCj4NCj53aGVyZSB3ZSBhcmUgdGVzdGluZyB0aGUgYml0IHByaW9yIHRv
IHRha2luZyB0aGUgbG9jayB0byBzZXJpYWxpc2UNCj5yZW1vdmFsIGJlZm9yZSBmcmVlLiBUbyBh
dm9pZCB0aGUgY29zdCBvZiBzZXJpYWxpc2luZyBoZXJlIHdlIGhhdmUgdG8gYmUNCj5zdXJlIHRo
YXQgYW55IG90aGVyIHRocmVhZCBoYXMgY29tcGxldGVseSBzdG9wcGVkIHVzaW5nIHRoZSBkcm1f
bW1fbm9kZQ0KPndoZW4gaXQgaXMgbWFya2VkIGFzIHJlbGVhc2VkLg0KPi1DaHJpcw0KPl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ZHJpLWRldmVsIG1h
aWxpbmcgbGlzdA0KPmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5odHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
