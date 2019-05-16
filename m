Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0A2002C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4BA8938B;
	Thu, 16 May 2019 07:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45A689385;
 Thu, 16 May 2019 07:23:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 00:23:24 -0700
X-ExtLoop1: 1
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga008.jf.intel.com with ESMTP; 16 May 2019 00:23:23 -0700
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 16 May 2019 00:23:23 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.217]) with mapi id 14.03.0415.000;
 Thu, 16 May 2019 12:53:20 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [v10 12/12] drm/i915: Add state readout for DRM infoframe
Thread-Topic: [v10 12/12] drm/i915: Add state readout for DRM infoframe
Thread-Index: AQHVCnfqKNsZl1ujAUGzvuo9vEX2SaZsOAQAgAEjXQA=
Date: Thu, 16 May 2019 07:23:19 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F8202AD07@BGSMSX104.gar.corp.intel.com>
References: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
 <1557855394-12214-13-git-send-email-uma.shankar@intel.com>
 <20190515192956.GG24299@intel.com>
In-Reply-To: <20190515192956.GG24299@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTgzODQ2NzAtMmU1OS00NmM1LWI1YWEtYTA0ZWE3ZjFkODU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTWlkbVV4Znk3b2hWSkJBZ21hcWVsc3pXK1JrMDhFSFJhXC9RRzA0amJFT3JIN0thM0FTb2NFRjBHcHpVQnBybHIifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "dcastagna@chromium.org" <dcastagna@chromium.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IFZpbGxlIFN5cmrDpGzDpCBbbWFp
bHRvOnZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tXQo+U2VudDogVGh1cnNkYXksIE1heSAx
NiwgMjAxOSAxOjAwIEFNCj5UbzogU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+
Cj5DYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsKPm1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgU2hhcm1h
LCBTaGFzaGFuawo+PHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+OyBlbWlsLmwudmVsaWtvdkBn
bWFpbC5jb207IGJyaWFuLnN0YXJrZXlAYXJtLmNvbTsKPmRjYXN0YWduYUBjaHJvbWl1bS5vcmc7
IHNlYW5wYXVsQGNocm9taXVtLm9yZzsgUm9wZXIsIE1hdHRoZXcgRAo+PG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+OyBqb25hc0Brd2lib28uc2UKPlN1YmplY3Q6IFJlOiBbdjEwIDEyLzEyXSBk
cm0vaTkxNTogQWRkIHN0YXRlIHJlYWRvdXQgZm9yIERSTSBpbmZvZnJhbWUKPgo+T24gVHVlLCBN
YXkgMTQsIDIwMTkgYXQgMTE6MDY6MzRQTSArMDUzMCwgVW1hIFNoYW5rYXIgd3JvdGU6Cj4+IEFk
ZGVkIHN0YXRlIHJlYWRvdXQgZm9yIERSTSBpbmZvZnJhbWUgYW5kIGVuYWJsZWQgc3RhdGUgdmFs
aWRhdGlvbiBmb3IKPj4gRFJNIGluZm9mcmFtZS4KPj4KPj4gdjI6IEFkZHJlc3NlZCBWaWxsZSdz
IHJldmlldyBjb21tZW50cyBhbmQgZHJvcHBlZCB0aGUgdW51c2VkIGRybQo+PiBpbmZvZnJhbWUg
cmVhZCBhdCBpbnRlbF9oZG1pX2luaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2Fy
IDx1bWEuc2hhbmthckBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfZGRpLmMgICAgIHwgNCArKysrCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9k
aXNwbGF5LmMgfCAxICsKPj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kZGkuYwo+PiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jCj4+IGluZGV4IDBhZjQ3ZjMuLmY1NzQzMTUgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jCj4+IEBAIC0zODM0LDYgKzM4MzQsMTAgQEAg
dm9pZCBpbnRlbF9kZGlfZ2V0X2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2Rlcgo+KmVuY29kZXIs
Cj4+ICAJaW50ZWxfcmVhZF9pbmZvZnJhbWUoZW5jb2RlciwgcGlwZV9jb25maWcsCj4+ICAJCQkg
ICAgIEhETUlfSU5GT0ZSQU1FX1RZUEVfVkVORE9SLAo+PiAgCQkJICAgICAmcGlwZV9jb25maWct
PmluZm9mcmFtZXMuaGRtaSk7Cj4+ICsJaWYgKChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEwIHx8
IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpKSkKPgo+U2lsbHkgZXh0cmEgcGFyZW5zLiBBY3R1YWxs
eSwgSSB0aGluayB0aGUgY2hlY2sgY2FuIGJlIHJlbW92ZWQgZW50aXJlbHkgc2luY2UKPmludGVs
X3JlYWRfaW5mb2ZyYW1lKCkgYWxzbyBjaGVja3MgaW5mb2ZyYW1lcy5lbmFibGUuCgpIbW0geWVh
aCwgd2lsbCBkcm9wIHRoaXMuCgo+PiArCQlpbnRlbF9yZWFkX2luZm9mcmFtZShlbmNvZGVyLCBw
aXBlX2NvbmZpZywKPj4gKwkJCQkgICAgIEhETUlfSU5GT0ZSQU1FX1RZUEVfRFJNLAo+PiArCQkJ
CSAgICAgJnBpcGVfY29uZmlnLT5pbmZvZnJhbWVzLmRybSk7Cj4+ICB9Cj4+Cj4+ICBzdGF0aWMg
ZW51bSBpbnRlbF9vdXRwdXRfdHlwZQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfZGlzcGxheS5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxh
eS5jCj4+IGluZGV4IGUzNWJhOGQuLmM4OWIyMTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2Rpc3BsYXkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9kaXNwbGF5LmMKPj4gQEAgLTEyMjc0LDYgKzEyMjc0LDcgQEAgc3RhdGljIGJvb2wgZmFz
dGJvb3RfZW5hYmxlZChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZQo+KmRldl9wcml2KQo+PiAgCVBJ
UEVfQ09ORl9DSEVDS19JTkZPRlJBTUUoYXZpKTsKPj4gIAlQSVBFX0NPTkZfQ0hFQ0tfSU5GT0ZS
QU1FKHNwZCk7Cj4+ICAJUElQRV9DT05GX0NIRUNLX0lORk9GUkFNRShoZG1pKTsKPj4gKwlQSVBF
X0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKGRybSk7Cj4+Cj4+ICAjdW5kZWYgUElQRV9DT05GX0NIRUNL
X1gKPj4gICN1bmRlZiBQSVBFX0NPTkZfQ0hFQ0tfSQo+PiAtLQo+PiAxLjkuMQo+Cj4tLQo+Vmls
bGUgU3lyasOkbMOkCj5JbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
