Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD18C36AA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC8C6E7C1;
	Tue,  1 Oct 2019 14:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265386E7BC;
 Tue,  1 Oct 2019 14:08:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 07:08:13 -0700
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="366339728"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 07:08:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Eric Engestrom <eric@engestrom.ch>
Subject: Re: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
In-Reply-To: <20191001123444.xtp7wpickwjus4m2@engestrom.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
 <875zl8d8x0.fsf@intel.com> <20191001123444.xtp7wpickwjus4m2@engestrom.ch>
Date: Tue, 01 Oct 2019 17:08:04 +0300
Message-ID: <8736gcd0e3.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwMSBPY3QgMjAxOSwgRXJpYyBFbmdlc3Ryb20gPGVyaWNAZW5nZXN0cm9tLmNoPiB3
cm90ZToKPiBPbiBUdWVzZGF5LCAyMDE5LTEwLTAxIDE0OjAzOjU1ICswMzAwLCBKYW5pIE5pa3Vs
YSB3cm90ZToKPj4gT24gVGh1LCAyNiBTZXAgMjAxOSwgRXJpYyBFbmdlc3Ryb20gPGVyaWNAZW5n
ZXN0cm9tLmNoPiB3cm90ZToKPj4gPiBPbiBUdWVzZGF5LCAyMDE5LTA5LTI0IDE1OjU4OjU2ICsw
MzAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPj4gPj4gSGkgYWxsLCB2MiBvZiBbMV0sIGEgbGl0dGxl
IHJlZmFjdG9yaW5nIGFyb3VuZCBkcm1fZGVidWcgYWNjZXNzIHRvCj4+ID4+IGFic3RyYWN0IGl0
IGJldHRlci4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBmdW5jdGlvbmFsIGNoYW5nZXMuCj4+ID4+
IAo+PiA+PiBJJ2QgYXBwcmVjaWF0ZSBhY2tzIGZvciBtZXJnaW5nIHRoZSBsb3QgdmlhIGRybS1t
aXNjLiBJZiB0aGVyZSBhcmUgYW55Cj4+ID4+IG9iamVjdGlvbnMgdG8gdGhhdCwgd2UnbGwgbmVl
ZCB0byBwb3N0cG9uZSB0aGUgbGFzdCBwYXRjaCB1bnRpbAo+PiA+PiBldmVyeXRoaW5nIGhhcyBi
ZWVuIG1lcmdlZCBhbmQgY29udmVydGVkIGluIGRybS1uZXh0Lgo+PiA+PiAKPj4gPj4gQlIsCj4+
ID4+IEphbmkuCj4+ID4+IAo+PiA+PiBDYzogRXJpYyBFbmdlc3Ryb20gPGVyaWMuZW5nZXN0cm9t
QGludGVsLmNvbT4KPj4gPj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPj4gPj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPj4gPj4gQ2M6IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNvbT4K
Pj4gPj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+ID4+IENjOiBCZW4gU2tl
Z2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4+ID4+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+PiA+PiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+PiA+PiBD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4+ID4+IENjOiBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZwo+PiA+PiBDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
PiA+PiBDYzogRnJhbmNpc2NvIEplcmV6IDxjdXJyb2plcmV6QHJpc2V1cC5uZXQ+Cj4+ID4+IENj
OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPj4gPj4gQ2M6IFJ1c3NlbGwg
S2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51eC5vcmcudWs+Cj4+ID4+IENjOiBDaHJpc3RpYW4g
R21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+PiA+PiBDYzogZXRuYXZpdkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gPj4gCj4+ID4+IAo+PiA+PiBbMV0gaHR0cDovL21pZC5t
YWlsLWFyY2hpdmUuY29tL2NvdmVyLjE1NjgzNzUxODkuZ2l0LmphbmkubmlrdWxhQGludGVsLmNv
bQo+PiA+PiAKPj4gPj4gSmFuaSBOaWt1bGEgKDkpOgo+PiA+PiAgIGRybS9wcmludDogbW92ZSBk
cm1fZGVidWcgdmFyaWFibGUgdG8gZHJtX3ByaW50LltjaF0KPj4gPj4gICBkcm0vcHJpbnQ6IGFk
ZCBkcm1fZGVidWdfZW5hYmxlZCgpCj4+ID4+ICAgZHJtL2k5MTU6IHVzZSBkcm1fZGVidWdfZW5h
YmxlZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCj4+ID4+ICAgZHJtL3ByaW50OiBy
ZW5hbWUgZHJtX2RlYnVnIHRvIF9fZHJtX2RlYnVnIHRvIGRpc2NvdXJhZ2UgdXNlCj4+ID4KPj4g
PiBUaGUgYWJvdmUgZm91ciBwYXRjaGVzIGFyZToKPj4gPiBSZXZpZXdlZC1ieTogRXJpYyBFbmdl
c3Ryb20gPGVyaWNAZW5nZXN0cm9tLmNoPgo+PiA+Cj4+ID4gRGlkIHlvdSBjaGVjayB0byBtYWtl
IHN1cmUgdGhlIGB1bmxpa2VseSgpYCBpcyBwcm9wYWdhdGVkIGNvcnJlY3RseQo+PiA+IG91dHNp
ZGUgdGhlIGBkcm1fZGVidWdfZW5hYmxlZCgpYCBjYWxsPwo+PiAKPj4gSSBkaWQgbm93Lgo+PiAK
Pj4gSGF2aW5nIGRybV9kZWJ1Z19lbmFibGVkKCkgYXMgYSBtYWNybyB2cy4gYXMgYW4gaW5saW5l
IGZ1bmN0aW9uIGRvZXMgbm90Cj4+IHNlZW0gdG8gbWFrZSBhIGRpZmZlcmVuY2UsIHNvIEkgdGhp
bmsgdGhlIGlubGluZSBpcyBjbGVhcmx5IHByZWZlcnJhYmxlLgo+Cj4gQWdyZWVkIDopCj4KPj4g
Cj4+IEhvd2V2ZXIsIGZvciBleGFtcGxlCj4+IAo+PiAJdW5saWtlbHkoZm9vICYmIGRybV9kZWJ1
ZyAmIERSTV9VVF9EUCkKPj4gCj4+IGRvZXMgcHJvZHVjZSBjb2RlIGRpZmZlcmVudCBmcm9tCj4+
IAo+PiAJKGZvbyAmJiBkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRfRFApKQo+PiAKPj4gaW5kaWNh
dGluZyB0aGF0IHRoZSB1bmxpa2VseSgpIHdpdGhpbiBkcm1fZGVidWdfZW5hYmxlZCgpIGRvZXMg
bm90Cj4+IHByb3BhZ2F0ZSB0byB0aGUgd2hvbGUgY29uZGl0aW9uLiBJdCdzIHBvc3NpYmxlIHRv
IHJldGFpbiB0aGUgc2FtZQo+PiBhc3NlbWJseSBvdXRwdXQgd2l0aAo+PiAKPj4gCSh1bmxpa2Vs
eShmb28pICYmIGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUCkpCj4+IAo+PiBidXQgaXQncyB1
bmNsZWFyIHRvIG1lIHdoZXRoZXIgdGhpcyBpcyByZWFsbHkgd29ydGggaXQsIGVpdGhlcgo+PiBy
ZWFkYWJpbGl0eSBvciBwZXJmb3JtYW5jZSB3aXNlLgo+PiAKPj4gVGhvdWdodHM/Cj4KPiBUaGF0
IGtpbmQgb2YgY29kZSBvbmx5IGhhcHBlbnMgMiB0aW1lcywgYm90aCBpbgo+IGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgKGluIHBhdGNoIDIvOSksIHJpZ2h0Pwo+Cj4gSSB0
aGluayB5b3VyIHN1Z2dlc3Rpb24gaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmU6Cj4KPiAt
ICAgaWYgKHVubGlrZWx5KHJldCAmJiBkcm1fZGVidWcgJiBEUk1fVVRfRFApKSB7Cj4gKyAgIGlm
ICh1bmxpa2VseShyZXQpICYmIGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUCkpIHsKPgo+IEl0
IGRvZXNuJ3QgcmVhbGx5IGNvc3QgbXVjaCBpbiByZWFkYWJpbGl0eSAoZXNwZWNpYWxseSBjb21w
YXJlZCB0byB3aGF0Cj4gaXQgd2FzIGJlZm9yZSksIGFuZCB3aGV0aGVyIGl0J3MgaW1wb3J0YW50
IHBlcmZvcm1hbmNlIHdpc2UgSSBjb3VsZG4ndAo+IHRlbGwsIGJ1dCBJIHRoaW5rIGl0J3MgYmVz
dCB0byBrZWVwIHRoZSBjb2RlIG9wdGltaXNlZCBhcyBpdCB3YXMgYmVmb3JlCj4gdW5sZXNzIHRo
ZXJlJ3MgYSByZWFzb24gdG8gZHJvcCBpdC4KPgo+IEx5dWRlIG1pZ2h0IGtub3cgbW9yZSBzaW5j
ZSBzaGUgd3JvdGUgMmYwMTVlYzZlYWI2OTMwMWZkY2Y1LCBpZiB5b3Ugd2FudAo+IHRvIHBpbmcg
aGVyPwoKSnVzdCBlbmRlZCB1cCBzZW5kaW5nIHRoZSB1cGRhdGVkIHZlcnNpb24gd2l0aCB3aGF0
IHlvdSBzdWdnZXN0IGFuZCBJCmFncmVlIHdpdGg7IHBlZGFudGljYWxseSB0aGUgY2hhbmdlIHNo
b3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoIGFueXdheS4KClRoYW5rcyBmb3IgeW91ciBpbnB1dHMu
CgpCUiwKSmFuaS4KCgo+Cj4+IAo+PiBCUiwKPj4gSmFuaS4KPj4gCj4+IAo+PiAtLSAKPj4gSmFu
aSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgoKLS0gCkphbmkgTmlr
dWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
