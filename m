Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F04658F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 19:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD5889B67;
	Fri, 14 Jun 2019 17:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE53789B67;
 Fri, 14 Jun 2019 17:20:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 10:20:27 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 14 Jun 2019 10:20:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Jun 2019 20:20:22 +0300
Date: Fri, 14 Jun 2019 20:20:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Drop use of DRM_WAIT_ON() [Was: drm/drm_vblank: Change EINVAL by
 the correct errno]
Message-ID: <20190614172022.GE5942@intel.com>
References: <20190613021054.cdewdb3azy6zuoyw@smtp.gmail.com>
 <20190613050403.GA21502@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613050403.GA21502@ravnborg.org>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6MDQ6MDNBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFJvZHJpZ28uCj4gCj4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MTA6NTRQ
TSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWlyYSB3cm90ZToKPiA+IEZvciBoaXN0b3JpY2FsIHJlYXNv
biwgdGhlIGZ1bmN0aW9uIGRybV93YWl0X3ZibGFua19pb2N0bCBhbHdheXMgcmV0dXJuCj4gPiAt
RUlOVkFMIGlmIHNvbWV0aGluZyBnZXRzIHdyb25nLiBUaGlzIHNjZW5hcmlvIGxpbWl0cyB0aGUg
ZmxleGliaWxpdHkKPiA+IGZvciB0aGUgdXNlcnNwYWNlIG1ha2UgZGV0YWlsZWQgdmVyaWZpY2F0
aW9uIG9mIHRoZSBwcm9ibGVtIGFuZCB0YWtlCj4gPiBzb21lIGFjdGlvbi4gSW4gcGFydGljdWxh
ciwgdGhlIHZhbGlkYXRpb24gb2Yg4oCcaWYgKCFkZXYtPmlycV9lbmFibGVkKeKAnQo+ID4gaW4g
dGhlIGRybV93YWl0X3ZibGFua19pb2N0bCBpcyByZXNwb25zaWJsZSBmb3IgY2hlY2tpbmcgaWYg
dGhlIGRyaXZlcgo+ID4gc3VwcG9ydCB2Ymxhbmsgb3Igbm90LiBJZiB0aGUgZHJpdmVyIGRvZXMg
bm90IHN1cHBvcnQgVkJsYW5rLCB0aGUKPiA+IGZ1bmN0aW9uIGRybV93YWl0X3ZibGFua19pb2N0
bCByZXR1cm5zIEVJTlZBTCB3aGljaCBkb2VzIG5vdCByZXByZXNlbnQKPiA+IHRoZSByZWFsIGlz
c3VlOyB0aGlzIHBhdGNoIGNoYW5nZXMgdGhpcyBiZWhhdmlvciBieSByZXR1cm4gRU9QTk9UU1VQ
UC4KPiA+IEFkZGl0aW9uYWxseSwgc29tZSBvcGVyYXRpb25zIGFyZSB1bnN1cHBvcnRlZCBieSB0
aGlzIGZ1bmN0aW9uLCBhbmQKPiA+IHJldHVybnMgRUlOVkFMOyB0aGlzIHBhdGNoIGFsc28gY2hh
bmdlcyB0aGUgcmV0dXJuIHZhbHVlIHRvIEVPUE5PVFNVUFAKPiA+IGluIHRoaXMgY2FzZS4gTGFz
dGx5LCB0aGUgZnVuY3Rpb24gZHJtX3dhaXRfdmJsYW5rX2lvY3RsIGlzIGludm9rZWQgYnkKPiA+
IGxpYmRybSwgd2hpY2ggaXMgdXNlZCBieSBtYW55IGNvbXBvc2l0b3JzOyBiZWNhdXNlIG9mIHRo
aXMsIGl0IGlzCj4gPiBpbXBvcnRhbnQgdG8gY2hlY2sgaWYgdGhpcyBjaGFuZ2UgYnJlYWtzIGFu
eSBjb21wb3NpdG9yLiBJbiB0aGlzIHNlbnNlLAo+ID4gdGhlIGZvbGxvd2luZyBwcm9qZWN0cyB3
ZXJlIGV4YW1pbmVkOgo+ID4gCj4gPiAqIERybS1od2NvbXBvc2VyCj4gPiAqIEt3aW4KPiA+ICog
U3dheQo+ID4gKiBXbHJvb3RzCj4gPiAqIFdheWxhbmQtY29yZQo+ID4gKiBXZXN0b24KPiA+ICog
WG9yZyAoNjcgZGlmZmVyZW50IGRyaXZlcnMpCj4gPiAKPiA+IEZvciBlYWNoIHJlcG9zaXRvcnkg
dGhlIHZlcmlmaWNhdGlvbiBoYXBwZW5lZCBpbiB0aHJlZSBzdGVwczoKPiA+IAo+ID4gKiBVcGRh
dGUgdGhlIG1haW4gYnJhbmNoCj4gPiAqIExvb2sgZm9yIGFueSBvY2N1cnJlbmNlICJkcm1XYWl0
VkJsYW5rIiB3aXRoIHRoZSBjb21tYW5kOgo+ID4gICBnaXQgZ3JlcCAtbiAiZHJtV2FpdFZCbGFu
ayIKPiA+ICogTG9vayBpbiB0aGUgZ2l0IGhpc3Rvcnkgb2YgdGhlIHByb2plY3Qgd2l0aCB0aGUg
Y29tbWFuZDoKPiA+ICAgZ2l0IGxvZyAtU2RybVdhaXRWQmxhbmsKPiA+IAo+ID4gRmluYWxseSwg
bm9uZSBvZiB0aGUgYWJvdmUgcHJvamVjdHMgdmFsaWRhdGUgdGhlIHVzZSBvZiBFSU5WQUwgd2hp
Y2gKPiA+IG1ha2Ugc2FmZSwgYXQgbGVhc3QgZm9yIHRoZXNlIHByb2plY3RzLCB0byBjaGFuZ2Ug
dGhlIHJldHVybiB2YWx1ZXMuCj4gPiAKPiA+IENoYW5nZSBzaW5jZSBWMjoKPiA+ICBEYW5pZWwg
VmV0dGVyIGFuZCBDaHJpcyBXaWxzb24KPiA+ICAtIFJlcGxhY2UgRU5PVFRZIGJ5IEVPUE5PVFNV
UFAKPiA+ICAtIFJldHVybiBFSU5WQUwgaWYgdGhlIHBhcmFtZXRlcnMgYXJlIHdyb25nCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9A
Z21haWwuY29tPgo+ID4gLS0tCj4gPiBVcGRhdGU6Cj4gPiAgIE5vdyBJR1QgaGFzIGEgd2F5IHRv
IHZhbGlkYXRlIGlmIGEgZHJpdmVyIGhhcyB2Ymxhbmsgc3VwcG9ydCBvciBub3QuCj4gPiAgIFNl
ZTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzL2NvbW1p
dC8yZDI0NGFlZDY5MTY1NzUzZjNhZGJiZDY0NjhkYjA3M2RjMWFjZjlBCj4gPiAKPiA+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4g
PiBpbmRleCAwZDcwNGJkZGIxYTYuLmQ3NmE3ODNhN2Q0YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJs
YW5rLmMKPiA+IEBAIC0xNTc4LDEwICsxNTc4LDEwIEBAIGludCBkcm1fd2FpdF92YmxhbmtfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ICAJdW5zaWduZWQgaW50
IGZsYWdzLCBwaXBlLCBoaWdoX3BpcGU7Cj4gPiAgCj4gPiAgCWlmICghZGV2LT5pcnFfZW5hYmxl
ZCkKPiA+IC0JCXJldHVybiAtRUlOVkFMOwo+ID4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4g
IAo+ID4gIAlpZiAodmJsd2FpdC0+cmVxdWVzdC50eXBlICYgX0RSTV9WQkxBTktfU0lHTkFMKQo+
ID4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiAgCj4g
PiAgCWlmICh2Ymx3YWl0LT5yZXF1ZXN0LnR5cGUgJgo+ID4gIAkgICAgfihfRFJNX1ZCTEFOS19U
WVBFU19NQVNLIHwgX0RSTV9WQkxBTktfRkxBR1NfTUFTSyB8Cj4gCj4gV2hlbiB0b3VjaGluZyB0
aGlzIGZ1bmN0aW9uLCBjb3VsZCBJIGFzayB5b3UgdG8gdGFrZSBhIGxvb2sgYXQKPiBlbGltaW5h
dGluZyB0aGUgdXNlIG9mIERSTV9XQUlUX09OKCk/Cj4gSXQgY29tZXMgZnJvbSB0aGUgZGVwcmVj
YXRlZCBkcm1fb3NfbGludXguaCBoZWFkZXIsIGFuZCBpdCBpcyBvbmx5IG9mCj4gdGhlIGZldyBy
ZW1haW5pbmcgdXNlcnMgb2YgRFJNX1dBSVRfT04oKS4KCklJUkMgYWxsIHByZXZpb3VzIGF0dGVt
cHRzIGF0IHJlbW92aW5nIHRoYXQgZW5kZWQgdXAgd2l0aApyZWdyZXNzaW9ucy4gSSB0aGluayB0
aGVyZSBhcmUgc29tZSBkcmFnb25zIGx1cmtpbmcgaW5zaWRlIHRoYXQKbWFjcm8uCgotLSAKVmls
bGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
