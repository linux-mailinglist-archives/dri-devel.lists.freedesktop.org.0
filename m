Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78434BB7CD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 17:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6736E261;
	Mon, 23 Sep 2019 15:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97BF6E261
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 15:22:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 08:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,540,1559545200"; d="scan'208";a="203143434"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 23 Sep 2019 08:22:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2019 18:22:06 +0300
Date: Mon, 23 Sep 2019 18:22:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tony Camuso <tcamuso@redhat.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
Message-ID: <20190923152206.GN1208@intel.com>
References: <20190523110905.22445-1-tcamuso@redhat.com>
 <87v9y0mept.fsf@intel.com>
 <5111581c-9d73-530d-d3ff-4f6950bf3f8c@redhat.com>
 <20190710135617.GE5942@intel.com>
 <374b7e4e-40a2-f3c0-ae14-c533bd42243f@redhat.com>
 <20190712170657.GL5942@intel.com>
 <841db615-a353-2174-6fd6-a3302f352b08@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <841db615-a353-2174-6fd6-a3302f352b08@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Joe Donahue <jdonohue@redhat.com>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 John Feeney <jfeeney@redhat.com>, dkwon@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDM6MzVBTSAtMDQwMCwgVG9ueSBDYW11c28gd3Jv
dGU6Cj4gT24gNy8xMi8xOSAxOjA2IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBG
cmksIEp1bCAxMiwgMjAxOSBhdCAxMjowNzo0NlBNIC0wNDAwLCBUb255IENhbXVzbyB3cm90ZToK
PiA+PiBPbiA3LzEwLzE5IDk6NTYgQU0sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+Pj4gT24g
V2VkLCBKdWwgMTAsIDIwMTkgYXQgMDk6NDc6MTFBTSAtMDQwMCwgVG9ueSBDYW11c28gd3JvdGU6
Cj4gPj4+PiBPbiA1LzI0LzE5IDQ6MzYgQU0sIEphbmkgTmlrdWxhIHdyb3RlOgo+ID4+Pj4+IE9u
IFRodSwgMjMgTWF5IDIwMTksIHRjYW11c28gPHRjYW11c29AcmVkaGF0LmNvbT4gd3JvdGU6Cj4g
Pj4+Pj4+ICAgIEZyb20gRGFuaWVsIEt3b24gPGRrd29uQHJlZGhhdC5jb20+Cj4gPj4+Pj4+Cj4g
Pj4+Pj4+IFRoZSBzeXN0ZW0gd2FzIGNyYXNoZWQgZHVlIHRvIGludmFsaWQgbWVtb3J5IGFjY2Vz
cyB3aGlsZSB0cnlpbmcgdG8gYWNjZXNzCj4gPj4+Pj4+IGF1eGlsaWFyeSBkZXZpY2UuCj4gPj4+
Pj4+Cj4gPj4+Pj4+IGNyYXNoPiBidAo+ID4+Pj4+PiBQSUQ6IDk4NjMgICBUQVNLOiBmZmZmODlk
MWJkZjExMDQwICBDUFU6IDEgICBDT01NQU5EOiAiaXBtaXRvb2wiCj4gPj4+Pj4+ICAgICAjMCBb
ZmZmZjg5Y2VkZDdmMzg2OF0gbWFjaGluZV9rZXhlYyBhdCBmZmZmZmZmZmIwNjYzNjc0Cj4gPj4+
Pj4+ICAgICAjMSBbZmZmZjg5Y2VkZDdmMzhjOF0gX19jcmFzaF9rZXhlYyBhdCBmZmZmZmZmZmIw
NzFjZjYyCj4gPj4+Pj4+ICAgICAjMiBbZmZmZjg5Y2VkZDdmMzk5OF0gY3Jhc2hfa2V4ZWMgYXQg
ZmZmZmZmZmZiMDcxZDA1MAo+ID4+Pj4+PiAgICAgIzMgW2ZmZmY4OWNlZGQ3ZjM5YjBdIG9vcHNf
ZW5kIGF0IGZmZmZmZmZmYjBkNmQ3NTgKPiA+Pj4+Pj4gICAgICM0IFtmZmZmODljZWRkN2YzOWQ4
XSBub19jb250ZXh0IGF0IGZmZmZmZmZmYjBkNWJjZGUKPiA+Pj4+Pj4gICAgICM1IFtmZmZmODlj
ZWRkN2YzYTI4XSBfX2JhZF9hcmVhX25vc2VtYXBob3JlIGF0IGZmZmZmZmZmYjBkNWJkNzUKPiA+
Pj4+Pj4gICAgICM2IFtmZmZmODljZWRkN2YzYTc4XSBiYWRfYXJlYSBhdCBmZmZmZmZmZmIwZDVj
MDg1Cj4gPj4+Pj4+ICAgICAjNyBbZmZmZjg5Y2VkZDdmM2FhMF0gX19kb19wYWdlX2ZhdWx0IGF0
IGZmZmZmZmZmYjBkNzA4MGMKPiA+Pj4+Pj4gICAgICM4IFtmZmZmODljZWRkN2YzYjEwXSBkb19w
YWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjBkNzA5MDUKPiA+Pj4+Pj4gICAgICM5IFtmZmZmODljZWRk
N2YzYjQwXSBwYWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjBkNmM3NTgKPiA+Pj4+Pj4gICAgICAgIFtl
eGNlcHRpb24gUklQOiBkcm1fZHBfYXV4X2Rldl9nZXRfYnlfbWlub3IrMHgzZF0KPiA+Pj4+Pj4g
ICAgICAgIFJJUDogZmZmZmZmZmZjMGE1ODliZCAgUlNQOiBmZmZmODljZWRkN2YzYmYwICBSRkxB
R1M6IDAwMDEwMjQ2Cj4gPj4+Pj4+ICAgICAgICBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgIFJCWDog
MDAwMDAwMDAwMDAwMDAwMCAgUkNYOiBmZmZmODljZWRkN2YzZmQ4Cj4gPj4+Pj4+ICAgICAgICBS
RFg6IDAwMDAwMDAwMDAwMDAwMDAgIFJTSTogMDAwMDAwMDAwMDAwMDAwMCAgUkRJOiBmZmZmZmZm
ZmMwYTYxM2UwCj4gPj4+Pj4+ICAgICAgICBSQlA6IGZmZmY4OWNlZGQ3ZjNiZjggICBSODogZmZm
Zjg5ZjFiY2JhYmJkMCAgIFI5OiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4+Pj4+ICAgICAgICBSMTA6
IGZmZmY4OWYxYmU3YTFjYzAgIFIxMTogMDAwMDAwMDAwMDAwMDAwMCAgUjEyOiAwMDAwMDAwMDAw
MDAwMDAwCj4gPj4+Pj4+ICAgICAgICBSMTM6IGZmZmY4OWYxYjMyYTI4MzAgIFIxNDogZmZmZjg5
ZDE4ZmFkZmEwMCAgUjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4+Pj4+ICAgICAgICBPUklHX1JB
WDogZmZmZmZmZmZmZmZmZmZmZiAgQ1M6IDAwMTAgIFNTOiAwMDE4Cj4gPj4+Pj4+ICAgICAgICBS
SVA6IDAwMDAyYjQ1ZjBkODBkMzAgIFJTUDogMDAwMDdmZmM0MTYwNjZhMCAgUkZMQUdTOiAwMDAx
MDI0Ngo+ID4+Pj4+PiAgICAgICAgUkFYOiAwMDAwMDAwMDAwMDAwMDAyICBSQlg6IDAwMDA1NjA2
MmUyMTJkODAgIFJDWDogMDAwMDdmZmM0MTYwNjgxMAo+ID4+Pj4+PiAgICAgICAgUkRYOiAwMDAw
MDAwMDAwMDAwMDAwICBSU0k6IDAwMDAwMDAwMDAwMDAwMDIgIFJESTogMDAwMDdmZmM0MTYwNmVj
MAo+ID4+Pj4+PiAgICAgICAgUkJQOiAwMDAwMDAwMDAwMDAwMDAwICAgUjg6IDAwMDA1NjA2MmRm
ZWQyMjkgICBSOTogMDAwMDJiNDVmMGNkZjE0ZAo+ID4+Pj4+PiAgICAgICAgUjEwOiAwMDAwMDAw
MDAwMDAwMDAyICBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgIFIxMjogMDAwMDdmZmM0MTYwNmVjMAo+
ID4+Pj4+PiAgICAgICAgUjEzOiAwMDAwN2ZmYzQxNjA2ZWQwICBSMTQ6IDAwMDA3ZmZjNDE2MDZl
ZTAgIFIxNTogMDAwMDAwMDAwMDAwMDAwMAo+ID4+Pj4+PiAgICAgICAgT1JJR19SQVg6IDAwMDAw
MDAwMDAwMDAwMDIgIENTOiAwMDMzICBTUzogMDAyYgo+ID4+Pj4+Pgo+ID4+Pj4+PiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gPj4+Pj4+Cj4gPj4+Pj4+IEl0IHdhcyB0cnlpbmcgdG8gb3BlbiAnL2Rl
di9pcG1pMCcsIGJ1dCBhcyBubyBlbnRyeSBpbiBhdXhfZGlyLCBpdCByZXR1cm5lZAo+ID4+Pj4+
PiBOVUxMIGZyb20gJ2lkcl9maW5kKCknLiBUaGlzIGRybV9kcF9hdXhfZGV2X2dldF9ieV9taW5v
cigpIHNob3VsZCBoYXZlIGRvbmUgYQo+ID4+Pj4+PiBjaGVjayBvbiB0aGlzLCBidXQgaGFkIGZh
aWxlZCB0byBkbyBpdC4KPiA+Pj4+Pgo+ID4+Pj4+IEkgdGhpbmsgdGhlIGJldHRlciBxdWVzdGlv
biBpcywgKndoeSogZG9lcyB0aGUgaWRyX2ZpbmQoKSByZXR1cm4gTlVMTD8gSQo+ID4+Pj4+IGRv
bid0IHRoaW5rIGl0IHNob3VsZCwgdW5kZXIgYW55IGNpcmN1bXN0YW5jZXMuIEkgZmVhciBhZGRp
bmcgdGhlIGNoZWNrCj4gPj4+Pj4gaGVyZSBwYXBlcnMgb3ZlciBzb21lIG90aGVyIHByb2JsZW0s
IHRha2luZyB1cyBmdXJ0aGVyIGF3YXkgZnJvbSB0aGUKPiA+Pj4+PiByb290IGNhdXNlLgo+ID4+
Pj4+Cj4gPj4+Pj4gQWxzbywgY2FuIHlvdSByZXByb2R1Y2UgdGhpcyBvbiBhIHJlY2VudCB1cHN0
cmVhbSBrZXJuZWw/IFRoZSBhdXggZGV2aWNlCj4gPj4+Pj4gbm9kZXMgd2VyZSBpbnRyb2R1Y2Vk
IGluIGtlcm5lbCB2NC42LiBXaGF0ZXZlciB5b3UgcmVwcm9kdWNlZCBvbiB2My4xMAo+ID4+Pj4+
IGlzIHByZXR0eSBtdWNoIGlycmVsZXZhbnQgZm9yIHVwc3RyZWFtLgo+ID4+Pj4+Cj4gPj4+Pj4K
PiA+Pj4+PiBCUiwKPiA+Pj4+PiBKYW5pLgo+ID4+Pj4KPiA+Pj4+IEkgaGF2ZSBub3QgYmVlbiBh
YmxlIHRvIHJlcHJvZHVjZSB0aGlzIHByb2JsZW0uCj4gPj4+Cj4gPj4+IG1rbm9kIC9kZXYvZm9v
IGMgPGRybV9kcF9hdXggbWFqb3I+IDI1NQo+ID4+PiBjYXQgL2Rldi9mb28KPiA+Pj4KPiA+Pj4g
c2hvdWxkIGRvIGl0Lgo+ID4+Cj4gPj4gSG93IGRvIEkgZGV0ZXJtaW5lIDxkcm1fZHBfYXV4IG1h
am9yPj8KPiA+IAo+ID4gbHMsZmlsZSxzdGF0LiBUYWtlIHlvdXIgcGljay4KPiA+IAo+IAo+IFBy
b2JsZW0gaGVyZSBpcyBJIGNhbid0IGxzLGZpbGUsc3RhdCAvZGV2L2ZvbyB1bnRpbCBhZnRlciBp
dCdzIGNyZWF0ZWQsCj4gYnV0IEkgbmVlZCB0byBrbm93IHRoZSBkcm1fZHBfYXV4IG1ham9yIG51
bWJlciBiZWZyb2UgSSBjYW4gdXNlIG1rbm9kLgo+IAo+IFdoYXQgYW0gSSBtaXNzaW5nIGhlcmU/
Cgp1ZGV2L3doYXRldmVyIHNob3VsZCBjcmVhdGUgYSBidW5jaCBvZiB0aGVzZSBmb3IgeW91IHNv
IHlvdSBjYW4gY2hlY2sKZnJvbSB0aGVtLiBJZiBub3QsIHRoZW4gZGlnIGFyb3VuZCBpbiAvc3lz
L2NsYXNzL2RybV9kcF9hdXhfZGV2LgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
