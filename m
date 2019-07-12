Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B33E672FE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 18:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143636E151;
	Fri, 12 Jul 2019 16:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8696E151
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 16:07:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8386E30BC599;
 Fri, 12 Jul 2019 16:07:47 +0000 (UTC)
Received: from dhcp-17-89.bos.redhat.com (dhcp-17-89.bos.redhat.com
 [10.18.17.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7FFD5D756;
 Fri, 12 Jul 2019 16:07:46 +0000 (UTC)
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20190523110905.22445-1-tcamuso@redhat.com>
 <87v9y0mept.fsf@intel.com> <5111581c-9d73-530d-d3ff-4f6950bf3f8c@redhat.com>
 <20190710135617.GE5942@intel.com>
From: Tony Camuso <tcamuso@redhat.com>
Message-ID: <374b7e4e-40a2-f3c0-ae14-c533bd42243f@redhat.com>
Date: Fri, 12 Jul 2019 12:07:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710135617.GE5942@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 12 Jul 2019 16:07:47 +0000 (UTC)
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

T24gNy8xMC8xOSA5OjU2IEFNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MTAsIDIwMTkgYXQgMDk6NDc6MTFBTSAtMDQwMCwgVG9ueSBDYW11c28gd3JvdGU6Cj4+IE9uIDUv
MjQvMTkgNDozNiBBTSwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+PiBPbiBUaHUsIDIzIE1heSAyMDE5
LCB0Y2FtdXNvIDx0Y2FtdXNvQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4+ICAgRnJvbSBEYW5pZWwg
S3dvbiA8ZGt3b25AcmVkaGF0LmNvbT4KPj4+Pgo+Pj4+IFRoZSBzeXN0ZW0gd2FzIGNyYXNoZWQg
ZHVlIHRvIGludmFsaWQgbWVtb3J5IGFjY2VzcyB3aGlsZSB0cnlpbmcgdG8gYWNjZXNzCj4+Pj4g
YXV4aWxpYXJ5IGRldmljZS4KPj4+Pgo+Pj4+IGNyYXNoPiBidAo+Pj4+IFBJRDogOTg2MyAgIFRB
U0s6IGZmZmY4OWQxYmRmMTEwNDAgIENQVTogMSAgIENPTU1BTkQ6ICJpcG1pdG9vbCIKPj4+PiAg
ICAjMCBbZmZmZjg5Y2VkZDdmMzg2OF0gbWFjaGluZV9rZXhlYyBhdCBmZmZmZmZmZmIwNjYzNjc0
Cj4+Pj4gICAgIzEgW2ZmZmY4OWNlZGQ3ZjM4YzhdIF9fY3Jhc2hfa2V4ZWMgYXQgZmZmZmZmZmZi
MDcxY2Y2Mgo+Pj4+ICAgICMyIFtmZmZmODljZWRkN2YzOTk4XSBjcmFzaF9rZXhlYyBhdCBmZmZm
ZmZmZmIwNzFkMDUwCj4+Pj4gICAgIzMgW2ZmZmY4OWNlZGQ3ZjM5YjBdIG9vcHNfZW5kIGF0IGZm
ZmZmZmZmYjBkNmQ3NTgKPj4+PiAgICAjNCBbZmZmZjg5Y2VkZDdmMzlkOF0gbm9fY29udGV4dCBh
dCBmZmZmZmZmZmIwZDViY2RlCj4+Pj4gICAgIzUgW2ZmZmY4OWNlZGQ3ZjNhMjhdIF9fYmFkX2Fy
ZWFfbm9zZW1hcGhvcmUgYXQgZmZmZmZmZmZiMGQ1YmQ3NQo+Pj4+ICAgICM2IFtmZmZmODljZWRk
N2YzYTc4XSBiYWRfYXJlYSBhdCBmZmZmZmZmZmIwZDVjMDg1Cj4+Pj4gICAgIzcgW2ZmZmY4OWNl
ZGQ3ZjNhYTBdIF9fZG9fcGFnZV9mYXVsdCBhdCBmZmZmZmZmZmIwZDcwODBjCj4+Pj4gICAgIzgg
W2ZmZmY4OWNlZGQ3ZjNiMTBdIGRvX3BhZ2VfZmF1bHQgYXQgZmZmZmZmZmZiMGQ3MDkwNQo+Pj4+
ICAgICM5IFtmZmZmODljZWRkN2YzYjQwXSBwYWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjBkNmM3NTgK
Pj4+PiAgICAgICBbZXhjZXB0aW9uIFJJUDogZHJtX2RwX2F1eF9kZXZfZ2V0X2J5X21pbm9yKzB4
M2RdCj4+Pj4gICAgICAgUklQOiBmZmZmZmZmZmMwYTU4OWJkICBSU1A6IGZmZmY4OWNlZGQ3ZjNi
ZjAgIFJGTEFHUzogMDAwMTAyNDYKPj4+PiAgICAgICBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgIFJC
WDogMDAwMDAwMDAwMDAwMDAwMCAgUkNYOiBmZmZmODljZWRkN2YzZmQ4Cj4+Pj4gICAgICAgUkRY
OiAwMDAwMDAwMDAwMDAwMDAwICBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgIFJESTogZmZmZmZmZmZj
MGE2MTNlMAo+Pj4+ICAgICAgIFJCUDogZmZmZjg5Y2VkZDdmM2JmOCAgIFI4OiBmZmZmODlmMWJj
YmFiYmQwICAgUjk6IDAwMDAwMDAwMDAwMDAwMDAKPj4+PiAgICAgICBSMTA6IGZmZmY4OWYxYmU3
YTFjYzAgIFIxMTogMDAwMDAwMDAwMDAwMDAwMCAgUjEyOiAwMDAwMDAwMDAwMDAwMDAwCj4+Pj4g
ICAgICAgUjEzOiBmZmZmODlmMWIzMmEyODMwICBSMTQ6IGZmZmY4OWQxOGZhZGZhMDAgIFIxNTog
MDAwMDAwMDAwMDAwMDAwMAo+Pj4+ICAgICAgIE9SSUdfUkFYOiBmZmZmZmZmZmZmZmZmZmZmICBD
UzogMDAxMCAgU1M6IDAwMTgKPj4+PiAgICAgICBSSVA6IDAwMDAyYjQ1ZjBkODBkMzAgIFJTUDog
MDAwMDdmZmM0MTYwNjZhMCAgUkZMQUdTOiAwMDAxMDI0Ngo+Pj4+ICAgICAgIFJBWDogMDAwMDAw
MDAwMDAwMDAwMiAgUkJYOiAwMDAwNTYwNjJlMjEyZDgwICBSQ1g6IDAwMDA3ZmZjNDE2MDY4MTAK
Pj4+PiAgICAgICBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgIFJTSTogMDAwMDAwMDAwMDAwMDAwMiAg
UkRJOiAwMDAwN2ZmYzQxNjA2ZWMwCj4+Pj4gICAgICAgUkJQOiAwMDAwMDAwMDAwMDAwMDAwICAg
Ujg6IDAwMDA1NjA2MmRmZWQyMjkgICBSOTogMDAwMDJiNDVmMGNkZjE0ZAo+Pj4+ICAgICAgIFIx
MDogMDAwMDAwMDAwMDAwMDAwMiAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2ICBSMTI6IDAwMDA3ZmZj
NDE2MDZlYzAKPj4+PiAgICAgICBSMTM6IDAwMDA3ZmZjNDE2MDZlZDAgIFIxNDogMDAwMDdmZmM0
MTYwNmVlMCAgUjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4+Pj4gICAgICAgT1JJR19SQVg6IDAwMDAw
MDAwMDAwMDAwMDIgIENTOiAwMDMzICBTUzogMDAyYgo+Pj4+Cj4+Pj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+Pj4+Cj4+Pj4gSXQgd2FzIHRyeWluZyB0byBvcGVuICcvZGV2L2lwbWkwJywgYnV0IGFz
IG5vIGVudHJ5IGluIGF1eF9kaXIsIGl0IHJldHVybmVkCj4+Pj4gTlVMTCBmcm9tICdpZHJfZmlu
ZCgpJy4gVGhpcyBkcm1fZHBfYXV4X2Rldl9nZXRfYnlfbWlub3IoKSBzaG91bGQgaGF2ZSBkb25l
IGEKPj4+PiBjaGVjayBvbiB0aGlzLCBidXQgaGFkIGZhaWxlZCB0byBkbyBpdC4KPj4+Cj4+PiBJ
IHRoaW5rIHRoZSBiZXR0ZXIgcXVlc3Rpb24gaXMsICp3aHkqIGRvZXMgdGhlIGlkcl9maW5kKCkg
cmV0dXJuIE5VTEw/IEkKPj4+IGRvbid0IHRoaW5rIGl0IHNob3VsZCwgdW5kZXIgYW55IGNpcmN1
bXN0YW5jZXMuIEkgZmVhciBhZGRpbmcgdGhlIGNoZWNrCj4+PiBoZXJlIHBhcGVycyBvdmVyIHNv
bWUgb3RoZXIgcHJvYmxlbSwgdGFraW5nIHVzIGZ1cnRoZXIgYXdheSBmcm9tIHRoZQo+Pj4gcm9v
dCBjYXVzZS4KPj4+Cj4+PiBBbHNvLCBjYW4geW91IHJlcHJvZHVjZSB0aGlzIG9uIGEgcmVjZW50
IHVwc3RyZWFtIGtlcm5lbD8gVGhlIGF1eCBkZXZpY2UKPj4+IG5vZGVzIHdlcmUgaW50cm9kdWNl
ZCBpbiBrZXJuZWwgdjQuNi4gV2hhdGV2ZXIgeW91IHJlcHJvZHVjZWQgb24gdjMuMTAKPj4+IGlz
IHByZXR0eSBtdWNoIGlycmVsZXZhbnQgZm9yIHVwc3RyZWFtLgo+Pj4KPj4+Cj4+PiBCUiwKPj4+
IEphbmkuCj4+Cj4+IEkgaGF2ZSBub3QgYmVlbiBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIHByb2Js
ZW0uCj4gCj4gbWtub2QgL2Rldi9mb28gYyA8ZHJtX2RwX2F1eCBtYWpvcj4gMjU1Cj4gY2F0IC9k
ZXYvZm9vCj4gCj4gc2hvdWxkIGRvIGl0LgoKSG93IGRvIEkgZGV0ZXJtaW5lIDxkcm1fZHBfYXV4
IG1ham9yPj8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
