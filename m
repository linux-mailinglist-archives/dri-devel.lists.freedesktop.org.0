Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F9297BA
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 13:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FA06E0FE;
	Fri, 24 May 2019 11:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC826E0FE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 11:58:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 04:58:33 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 24 May 2019 04:58:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 May 2019 14:58:29 +0300
Date: Fri, 24 May 2019 14:58:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: tony camuso <tcamuso@redhat.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
Message-ID: <20190524115829.GC5942@intel.com>
References: <20190523110905.22445-1-tcamuso@redhat.com>
 <87v9y0mept.fsf@intel.com>
 <04ae1fb0-02ab-88e9-94b3-e36f48cc65d5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04ae1fb0-02ab-88e9-94b3-e36f48cc65d5@redhat.com>
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
Cc: airlied@linux.ie, dkwon@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDY6NDg6MzJBTSAtMDQwMCwgdG9ueSBjYW11c28gd3Jv
dGU6Cj4gT24gNS8yNC8xOSA0OjM2IEFNLCBKYW5pIE5pa3VsYSB3cm90ZToKPiA+IE9uIFRodSwg
MjMgTWF5IDIwMTksIHRjYW11c28gPHRjYW11c29AcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4gIEZy
b20gRGFuaWVsIEt3b24gPGRrd29uQHJlZGhhdC5jb20+Cj4gPj4KPiA+PiBUaGUgc3lzdGVtIHdh
cyBjcmFzaGVkIGR1ZSB0byBpbnZhbGlkIG1lbW9yeSBhY2Nlc3Mgd2hpbGUgdHJ5aW5nIHRvIGFj
Y2Vzcwo+ID4+IGF1eGlsaWFyeSBkZXZpY2UuCj4gPj4KPiA+PiBjcmFzaD4gYnQKPiA+PiBQSUQ6
IDk4NjMgICBUQVNLOiBmZmZmODlkMWJkZjExMDQwICBDUFU6IDEgICBDT01NQU5EOiAiaXBtaXRv
b2wiCj4gPj4gICAjMCBbZmZmZjg5Y2VkZDdmMzg2OF0gbWFjaGluZV9rZXhlYyBhdCBmZmZmZmZm
ZmIwNjYzNjc0Cj4gPj4gICAjMSBbZmZmZjg5Y2VkZDdmMzhjOF0gX19jcmFzaF9rZXhlYyBhdCBm
ZmZmZmZmZmIwNzFjZjYyCj4gPj4gICAjMiBbZmZmZjg5Y2VkZDdmMzk5OF0gY3Jhc2hfa2V4ZWMg
YXQgZmZmZmZmZmZiMDcxZDA1MAo+ID4+ICAgIzMgW2ZmZmY4OWNlZGQ3ZjM5YjBdIG9vcHNfZW5k
IGF0IGZmZmZmZmZmYjBkNmQ3NTgKPiA+PiAgICM0IFtmZmZmODljZWRkN2YzOWQ4XSBub19jb250
ZXh0IGF0IGZmZmZmZmZmYjBkNWJjZGUKPiA+PiAgICM1IFtmZmZmODljZWRkN2YzYTI4XSBfX2Jh
ZF9hcmVhX25vc2VtYXBob3JlIGF0IGZmZmZmZmZmYjBkNWJkNzUKPiA+PiAgICM2IFtmZmZmODlj
ZWRkN2YzYTc4XSBiYWRfYXJlYSBhdCBmZmZmZmZmZmIwZDVjMDg1Cj4gPj4gICAjNyBbZmZmZjg5
Y2VkZDdmM2FhMF0gX19kb19wYWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjBkNzA4MGMKPiA+PiAgICM4
IFtmZmZmODljZWRkN2YzYjEwXSBkb19wYWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjBkNzA5MDUKPiA+
PiAgICM5IFtmZmZmODljZWRkN2YzYjQwXSBwYWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjBkNmM3NTgK
PiA+PiAgICAgIFtleGNlcHRpb24gUklQOiBkcm1fZHBfYXV4X2Rldl9nZXRfYnlfbWlub3IrMHgz
ZF0KPiA+PiAgICAgIFJJUDogZmZmZmZmZmZjMGE1ODliZCAgUlNQOiBmZmZmODljZWRkN2YzYmYw
ICBSRkxBR1M6IDAwMDEwMjQ2Cj4gPj4gICAgICBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgIFJCWDog
MDAwMDAwMDAwMDAwMDAwMCAgUkNYOiBmZmZmODljZWRkN2YzZmQ4Cj4gPj4gICAgICBSRFg6IDAw
MDAwMDAwMDAwMDAwMDAgIFJTSTogMDAwMDAwMDAwMDAwMDAwMCAgUkRJOiBmZmZmZmZmZmMwYTYx
M2UwCj4gPj4gICAgICBSQlA6IGZmZmY4OWNlZGQ3ZjNiZjggICBSODogZmZmZjg5ZjFiY2JhYmJk
MCAgIFI5OiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4gICAgICBSMTA6IGZmZmY4OWYxYmU3YTFjYzAg
IFIxMTogMDAwMDAwMDAwMDAwMDAwMCAgUjEyOiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4gICAgICBS
MTM6IGZmZmY4OWYxYjMyYTI4MzAgIFIxNDogZmZmZjg5ZDE4ZmFkZmEwMCAgUjE1OiAwMDAwMDAw
MDAwMDAwMDAwCj4gPj4gICAgICBPUklHX1JBWDogZmZmZmZmZmZmZmZmZmZmZiAgQ1M6IDAwMTAg
IFNTOiAwMDE4Cj4gPj4gICAgICBSSVA6IDAwMDAyYjQ1ZjBkODBkMzAgIFJTUDogMDAwMDdmZmM0
MTYwNjZhMCAgUkZMQUdTOiAwMDAxMDI0Ngo+ID4+ICAgICAgUkFYOiAwMDAwMDAwMDAwMDAwMDAy
ICBSQlg6IDAwMDA1NjA2MmUyMTJkODAgIFJDWDogMDAwMDdmZmM0MTYwNjgxMAo+ID4+ICAgICAg
UkRYOiAwMDAwMDAwMDAwMDAwMDAwICBSU0k6IDAwMDAwMDAwMDAwMDAwMDIgIFJESTogMDAwMDdm
ZmM0MTYwNmVjMAo+ID4+ICAgICAgUkJQOiAwMDAwMDAwMDAwMDAwMDAwICAgUjg6IDAwMDA1NjA2
MmRmZWQyMjkgICBSOTogMDAwMDJiNDVmMGNkZjE0ZAo+ID4+ICAgICAgUjEwOiAwMDAwMDAwMDAw
MDAwMDAyICBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgIFIxMjogMDAwMDdmZmM0MTYwNmVjMAo+ID4+
ICAgICAgUjEzOiAwMDAwN2ZmYzQxNjA2ZWQwICBSMTQ6IDAwMDA3ZmZjNDE2MDZlZTAgIFIxNTog
MDAwMDAwMDAwMDAwMDAwMAo+ID4+ICAgICAgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMDIgIENT
OiAwMDMzICBTUzogMDAyYgo+ID4+Cj4gPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+Cj4gPj4g
SXQgd2FzIHRyeWluZyB0byBvcGVuICcvZGV2L2lwbWkwJywgYnV0IGFzIG5vIGVudHJ5IGluIGF1
eF9kaXIsIGl0IHJldHVybmVkCj4gPj4gTlVMTCBmcm9tICdpZHJfZmluZCgpJy4gVGhpcyBkcm1f
ZHBfYXV4X2Rldl9nZXRfYnlfbWlub3IoKSBzaG91bGQgaGF2ZSBkb25lIGEKPiA+PiBjaGVjayBv
biB0aGlzLCBidXQgaGFkIGZhaWxlZCB0byBkbyBpdC4KPiA+IAo+ID4gSSB0aGluayB0aGUgYmV0
dGVyIHF1ZXN0aW9uIGlzLCAqd2h5KiBkb2VzIHRoZSBpZHJfZmluZCgpIHJldHVybiBOVUxMPyBJ
Cj4gPiBkb24ndCB0aGluayBpdCBzaG91bGQsIHVuZGVyIGFueSBjaXJjdW1zdGFuY2VzLiBJIGZl
YXIgYWRkaW5nIHRoZSBjaGVjawo+ID4gaGVyZSBwYXBlcnMgb3ZlciBzb21lIG90aGVyIHByb2Js
ZW0sIHRha2luZyB1cyBmdXJ0aGVyIGF3YXkgZnJvbSB0aGUKPiA+IHJvb3QgY2F1c2UuCj4gCj4g
VGhhdCdzIGEgdmVyeSBnb29kIHF1ZXN0aW9uLgo+IAo+ID4gQWxzbywgY2FuIHlvdSByZXByb2R1
Y2UgdGhpcyBvbiBhIHJlY2VudCB1cHN0cmVhbSBrZXJuZWw/IFRoZSBhdXggZGV2aWNlCj4gPiBu
b2RlcyB3ZXJlIGludHJvZHVjZWQgaW4ga2VybmVsIHY0LjYuIFdoYXRldmVyIHlvdSByZXByb2R1
Y2VkIG9uIHYzLjEwCj4gPiBpcyBwcmV0dHkgbXVjaCBpcnJlbGV2YW50IGZvciB1cHN0cmVhbS4K
PiAKPiBJIHdpbGwgbG9vayBpbnRvIHRoaXMgZGVlcGVyLCB1c2luZyB0aGUgdXBzdHJlYW0ga2Vy
bmVsLgoKU2hvdWxkIGJlIHRyaXZpYWwgdG8gcmVwcm9kdWNlIHdpdGggbWtub2QuIEkgd29uZGVy
IGlmIHdlIHNob3VsZCBzdGljayBhCnRlc3QgbGlrZSB0aGF0IGludG8gaWd0IGFjdHVhbGx5LiBO
b3Qgc3VyZSBob3cgaGFwcHkgcGVvcGxlIHdvdWxkIGJlIGlmCmlndCBjcmVhdGVzIG5ldyBkZXZp
Y2Ugbm9kZXMuLi4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
