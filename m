Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026567459
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 19:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD1388905;
	Fri, 12 Jul 2019 17:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450DA88905
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 17:35:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFE06C055674;
 Fri, 12 Jul 2019 17:35:48 +0000 (UTC)
Received: from dhcp-17-89.bos.redhat.com (dhcp-17-89.bos.redhat.com
 [10.18.17.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 178AF608AB;
 Fri, 12 Jul 2019 17:35:48 +0000 (UTC)
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20190523110905.22445-1-tcamuso@redhat.com>
 <87v9y0mept.fsf@intel.com> <5111581c-9d73-530d-d3ff-4f6950bf3f8c@redhat.com>
 <20190710135617.GE5942@intel.com>
 <374b7e4e-40a2-f3c0-ae14-c533bd42243f@redhat.com>
 <20190712170657.GL5942@intel.com>
From: Tony Camuso <tcamuso@redhat.com>
Message-ID: <816a78f2-34f9-130f-3de8-c9adad17e8b9@redhat.com>
Date: Fri, 12 Jul 2019 13:35:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712170657.GL5942@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 12 Jul 2019 17:35:48 +0000 (UTC)
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8xMi8xOSAxOjA2IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gRnJpLCBKdWwg
MTIsIDIwMTkgYXQgMTI6MDc6NDZQTSAtMDQwMCwgVG9ueSBDYW11c28gd3JvdGU6Cj4+IE9uIDcv
MTAvMTkgOTo1NiBBTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+Pj4gT24gV2VkLCBKdWwgMTAs
IDIwMTkgYXQgMDk6NDc6MTFBTSAtMDQwMCwgVG9ueSBDYW11c28gd3JvdGU6Cj4+Pj4gT24gNS8y
NC8xOSA0OjM2IEFNLCBKYW5pIE5pa3VsYSB3cm90ZToKPj4+Pj4gT24gVGh1LCAyMyBNYXkgMjAx
OSwgdGNhbXVzbyA8dGNhbXVzb0ByZWRoYXQuY29tPiB3cm90ZToKPj4+Pj4+ICAgIEZyb20gRGFu
aWVsIEt3b24gPGRrd29uQHJlZGhhdC5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gVGhlIHN5c3RlbSB3YXMg
Y3Jhc2hlZCBkdWUgdG8gaW52YWxpZCBtZW1vcnkgYWNjZXNzIHdoaWxlIHRyeWluZyB0byBhY2Nl
c3MKPj4+Pj4+IGF1eGlsaWFyeSBkZXZpY2UuCj4+Pj4+Pgo+Pj4+Pj4gY3Jhc2g+IGJ0Cj4+Pj4+
PiBQSUQ6IDk4NjMgICBUQVNLOiBmZmZmODlkMWJkZjExMDQwICBDUFU6IDEgICBDT01NQU5EOiAi
aXBtaXRvb2wiCj4+Pj4+PiAgICAgIzAgW2ZmZmY4OWNlZGQ3ZjM4NjhdIG1hY2hpbmVfa2V4ZWMg
YXQgZmZmZmZmZmZiMDY2MzY3NAo+Pj4+Pj4gICAgICMxIFtmZmZmODljZWRkN2YzOGM4XSBfX2Ny
YXNoX2tleGVjIGF0IGZmZmZmZmZmYjA3MWNmNjIKPj4+Pj4+ICAgICAjMiBbZmZmZjg5Y2VkZDdm
Mzk5OF0gY3Jhc2hfa2V4ZWMgYXQgZmZmZmZmZmZiMDcxZDA1MAo+Pj4+Pj4gICAgICMzIFtmZmZm
ODljZWRkN2YzOWIwXSBvb3BzX2VuZCBhdCBmZmZmZmZmZmIwZDZkNzU4Cj4+Pj4+PiAgICAgIzQg
W2ZmZmY4OWNlZGQ3ZjM5ZDhdIG5vX2NvbnRleHQgYXQgZmZmZmZmZmZiMGQ1YmNkZQo+Pj4+Pj4g
ICAgICM1IFtmZmZmODljZWRkN2YzYTI4XSBfX2JhZF9hcmVhX25vc2VtYXBob3JlIGF0IGZmZmZm
ZmZmYjBkNWJkNzUKPj4+Pj4+ICAgICAjNiBbZmZmZjg5Y2VkZDdmM2E3OF0gYmFkX2FyZWEgYXQg
ZmZmZmZmZmZiMGQ1YzA4NQo+Pj4+Pj4gICAgICM3IFtmZmZmODljZWRkN2YzYWEwXSBfX2RvX3Bh
Z2VfZmF1bHQgYXQgZmZmZmZmZmZiMGQ3MDgwYwo+Pj4+Pj4gICAgICM4IFtmZmZmODljZWRkN2Yz
YjEwXSBkb19wYWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjBkNzA5MDUKPj4+Pj4+ICAgICAjOSBbZmZm
Zjg5Y2VkZDdmM2I0MF0gcGFnZV9mYXVsdCBhdCBmZmZmZmZmZmIwZDZjNzU4Cj4+Pj4+PiAgICAg
ICAgW2V4Y2VwdGlvbiBSSVA6IGRybV9kcF9hdXhfZGV2X2dldF9ieV9taW5vcisweDNkXQo+Pj4+
Pj4gICAgICAgIFJJUDogZmZmZmZmZmZjMGE1ODliZCAgUlNQOiBmZmZmODljZWRkN2YzYmYwICBS
RkxBR1M6IDAwMDEwMjQ2Cj4+Pj4+PiAgICAgICAgUkFYOiAwMDAwMDAwMDAwMDAwMDAwICBSQlg6
IDAwMDAwMDAwMDAwMDAwMDAgIFJDWDogZmZmZjg5Y2VkZDdmM2ZkOAo+Pj4+Pj4gICAgICAgIFJE
WDogMDAwMDAwMDAwMDAwMDAwMCAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwICBSREk6IGZmZmZmZmZm
YzBhNjEzZTAKPj4+Pj4+ICAgICAgICBSQlA6IGZmZmY4OWNlZGQ3ZjNiZjggICBSODogZmZmZjg5
ZjFiY2JhYmJkMCAgIFI5OiAwMDAwMDAwMDAwMDAwMDAwCj4+Pj4+PiAgICAgICAgUjEwOiBmZmZm
ODlmMWJlN2ExY2MwICBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgIFIxMjogMDAwMDAwMDAwMDAwMDAw
MAo+Pj4+Pj4gICAgICAgIFIxMzogZmZmZjg5ZjFiMzJhMjgzMCAgUjE0OiBmZmZmODlkMThmYWRm
YTAwICBSMTU6IDAwMDAwMDAwMDAwMDAwMDAKPj4+Pj4+ICAgICAgICBPUklHX1JBWDogZmZmZmZm
ZmZmZmZmZmZmZiAgQ1M6IDAwMTAgIFNTOiAwMDE4Cj4+Pj4+PiAgICAgICAgUklQOiAwMDAwMmI0
NWYwZDgwZDMwICBSU1A6IDAwMDA3ZmZjNDE2MDY2YTAgIFJGTEFHUzogMDAwMTAyNDYKPj4+Pj4+
ICAgICAgICBSQVg6IDAwMDAwMDAwMDAwMDAwMDIgIFJCWDogMDAwMDU2MDYyZTIxMmQ4MCAgUkNY
OiAwMDAwN2ZmYzQxNjA2ODEwCj4+Pj4+PiAgICAgICAgUkRYOiAwMDAwMDAwMDAwMDAwMDAwICBS
U0k6IDAwMDAwMDAwMDAwMDAwMDIgIFJESTogMDAwMDdmZmM0MTYwNmVjMAo+Pj4+Pj4gICAgICAg
IFJCUDogMDAwMDAwMDAwMDAwMDAwMCAgIFI4OiAwMDAwNTYwNjJkZmVkMjI5ICAgUjk6IDAwMDAy
YjQ1ZjBjZGYxNGQKPj4+Pj4+ICAgICAgICBSMTA6IDAwMDAwMDAwMDAwMDAwMDIgIFIxMTogMDAw
MDAwMDAwMDAwMDI0NiAgUjEyOiAwMDAwN2ZmYzQxNjA2ZWMwCj4+Pj4+PiAgICAgICAgUjEzOiAw
MDAwN2ZmYzQxNjA2ZWQwICBSMTQ6IDAwMDA3ZmZjNDE2MDZlZTAgIFIxNTogMDAwMDAwMDAwMDAw
MDAwMAo+Pj4+Pj4gICAgICAgIE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAyICBDUzogMDAzMyAg
U1M6IDAwMmIKPj4+Pj4+Cj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+Pgo+Pj4+Pj4g
SXQgd2FzIHRyeWluZyB0byBvcGVuICcvZGV2L2lwbWkwJywgYnV0IGFzIG5vIGVudHJ5IGluIGF1
eF9kaXIsIGl0IHJldHVybmVkCj4+Pj4+PiBOVUxMIGZyb20gJ2lkcl9maW5kKCknLiBUaGlzIGRy
bV9kcF9hdXhfZGV2X2dldF9ieV9taW5vcigpIHNob3VsZCBoYXZlIGRvbmUgYQo+Pj4+Pj4gY2hl
Y2sgb24gdGhpcywgYnV0IGhhZCBmYWlsZWQgdG8gZG8gaXQuCj4+Pj4+Cj4+Pj4+IEkgdGhpbmsg
dGhlIGJldHRlciBxdWVzdGlvbiBpcywgKndoeSogZG9lcyB0aGUgaWRyX2ZpbmQoKSByZXR1cm4g
TlVMTD8gSQo+Pj4+PiBkb24ndCB0aGluayBpdCBzaG91bGQsIHVuZGVyIGFueSBjaXJjdW1zdGFu
Y2VzLiBJIGZlYXIgYWRkaW5nIHRoZSBjaGVjawo+Pj4+PiBoZXJlIHBhcGVycyBvdmVyIHNvbWUg
b3RoZXIgcHJvYmxlbSwgdGFraW5nIHVzIGZ1cnRoZXIgYXdheSBmcm9tIHRoZQo+Pj4+PiByb290
IGNhdXNlLgo+Pj4+Pgo+Pj4+PiBBbHNvLCBjYW4geW91IHJlcHJvZHVjZSB0aGlzIG9uIGEgcmVj
ZW50IHVwc3RyZWFtIGtlcm5lbD8gVGhlIGF1eCBkZXZpY2UKPj4+Pj4gbm9kZXMgd2VyZSBpbnRy
b2R1Y2VkIGluIGtlcm5lbCB2NC42LiBXaGF0ZXZlciB5b3UgcmVwcm9kdWNlZCBvbiB2My4xMAo+
Pj4+PiBpcyBwcmV0dHkgbXVjaCBpcnJlbGV2YW50IGZvciB1cHN0cmVhbS4KPj4+Pj4KPj4+Pj4K
Pj4+Pj4gQlIsCj4+Pj4+IEphbmkuCj4+Pj4KPj4+PiBJIGhhdmUgbm90IGJlZW4gYWJsZSB0byBy
ZXByb2R1Y2UgdGhpcyBwcm9ibGVtLgo+Pj4KPj4+IG1rbm9kIC9kZXYvZm9vIGMgPGRybV9kcF9h
dXggbWFqb3I+IDI1NQo+Pj4gY2F0IC9kZXYvZm9vCj4+Pgo+Pj4gc2hvdWxkIGRvIGl0Lgo+Pgo+
PiBIb3cgZG8gSSBkZXRlcm1pbmUgPGRybV9kcF9hdXggbWFqb3I+Pwo+IAo+IGxzLGZpbGUsc3Rh
dC4gVGFrZSB5b3VyIHBpY2suCj4gCgpEb2guIFRoYW5rcyEhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
