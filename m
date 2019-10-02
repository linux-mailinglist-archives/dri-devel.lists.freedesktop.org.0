Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E32C877D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 13:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757446E95A;
	Wed,  2 Oct 2019 11:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84356E95A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 11:43:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2AFEDAB92;
 Wed,  2 Oct 2019 11:43:02 +0000 (UTC)
Subject: Re: [PATCH v3 0/5] drm/ast: Place cursor BOs at VRAM high-end
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190927090309.10254-1-tzimmermann@suse.de>
 <20191002085955.gy33j4rt454hjgcg@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <41685d3a-a9f1-887e-5869-8d9e098a9a84@suse.de>
Date: Wed, 2 Oct 2019 13:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191002085955.gy33j4rt454hjgcg@sirius.home.kraxel.org>
Content-Language: en-US
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDAyLjEwLjE5IHVtIDEwOjU5IHNjaHJpZWIgR2VyZCBIb2ZmbWFubjoKPiBPbiBGcmks
IFNlcCAyNywgMjAxOSBhdCAxMTowMzowNEFNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToKPj4gKHdhczogZHJtL2FzdC9tZ2FnMjAwOiBQbGFjZSBjdXJzb3IgQk9zIGF0IFZSQU0gaGln
aC1lbmQpCj4+Cj4+IFRoaXMgcGF0Y2hzZXQgY2xlYW5zIHVwIHRoZSBtZW1vcnkgbWFuYWdlbWVu
dCBvZiBIVyBjdXJzb3JzIGluIGFzdC4gSXQKPj4gZnVydGhlciBtb3ZlcyB0aGUgYWxsb2NhdGVk
IGN1cnNvciBCT3MgdG8gdGhlIG9mIHRoZSB2aWRlbyBSQU0gdG8gcmVkdWNlCj4+IG1lbW9yeSBm
cmFnbWVudGF0aW9uLgo+Pgo+PiBUaGUgYXN0IGRyaXZlciBtYW5hZ2VzIGN1cnNvciBtZW1vcnkg
aW4gYSBkZWRpY2F0ZWQgR0VNIFZSQU0gYnVmZmVyCj4+IG9iamVjdC4gSXQgdXNlcyBhIGRvdWJs
ZS1idWZmZXJpbmcgc2NoZW1lIG9mIGFsdGVybmF0aW5nIGJldHdlZW4gb2Zmc2V0cwo+PiB3aXRo
aW4gdGhlIEdFTSBCTy4gVGhlIGNvZGUgaXMgY29udm9sdXRlZCBhbmQgY2FuIGxlYWQgdG8gbWVt
b3J5Cj4+IGZyYWdtZW50YXRpb24gaWYgdGhlIEJPIGlzIHN0b3JlZCB0aGUgbWlkZGxlIG9mIFZS
QU0uIFRoaXMgaXMgZXNwZWNpYWxseQo+PiBhIHByb2JsZW0gYXMgYXN0IGRldmljZXMgb25seSBo
YXZlIGEgc21hbGwgYW1vdW50IG9mIHZpZGVvIG1lbW9yeSAoZS5nLiwKPj4gOCBNaUIpLgo+Pgo+
PiBXaXRoIHRoaXMgcGF0Y2hzZXQsIHRoZSBjdXJzb3IgaGFuZGxpbmcgaW4gYXN0IGlzIGZpcnN0
IHNwbGl0IHVwIGludG8KPj4gc2VwYXJhdGUgZnVuY3Rpb25zIGZvciBjb3B5aW5nIGN1cnNvciBp
bWFnZXMsIG1hbmFnaW5nIGJ1ZmZlciBvYmplY3RzLAo+PiBzZXR0aW5nIHNjYW5vdXQgYWRkcmVz
c2VzLCBhbmQgbW92aW5nIGFuZCBoaWRpbmcgdGhlIGN1cnNvci4gRnVydGhlcm1vcmUsCj4+IHRo
ZSBkcml2ZXIgZGVkaWNhdGVzIGEgZmV3IEtpQiBhdCB0aGUgaGlnaCBlbmQgb2YgdGhlIGRldmlj
ZSdzIHZpZGVvCj4+IG1lbW9yeSB0byBzdG9yaW5nIHRoZSBjdXJzb3IncyBidWZmZXIgb2JqZWN0
cy4gVGhpcyBwcmV2ZW50cyBtZW1vcnkKPj4gZnJhZ21lbnRhdGlvbi4KPj4KPj4gVGhlIHBhdGNo
c2V0IGhhcyBiZWVuIHRlc3RlZCBvbiBhc3QgaGFyZHdhcmUuCj4+Cj4+IHYzOgo+PiAJKiBzcGxp
dC1vZmYgYXN0IHBhdGNoZXMgaW50byBzZXBhcmF0ZSBzZXJpZXMKPj4gCSogbW92ZSBhcm91bmQg
YXN0X3tzaG93LGhpZGV9X2N1cnNvciBpbiBhIHNlcGFyYXRlIHBhdGNoCj4+IAkqIGZpeCBzcGFj
ZS1iZWZvcmUtdGFiIGVycm9yIG5lYXIgQVNUX0hXQ19TSUdOQVRVUkVfQ0hFQ0tTVU0KPj4gdjI6
Cj4+IAkqIHJlbW92ZSBWUkFNIGJ1ZmZlcnMgaW4gZmF2b3Igb2YgR0VNIEJPcwo+PiAJKiBtYW5h
Z2UgQk8gcGxhY2VtZW50IHdpdGggcGluIGZsYWcKPiAKPiBMb29rcyBhbGwgc2FuZSB0byBtZSwg
c2VyaWVzIGlzCj4gQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoK
VGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3IHBhdGNoZXMgZm9yIHRoaXMgZmFp
cmx5IG9ic2N1cmUgY29kZS4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4gCj4+Cj4+Cj4+IFRob21h
cyBaaW1tZXJtYW5uICg1KToKPj4gICAgZHJtL2FzdDogRG9uJ3QgY2FsbCBhc3Rfc2hvd19jdXJz
b3IoKSBmcm9tIGFzdF9jdXJzb3JfbW92ZSgpCj4+ICAgIGRybS9hc3Q6IE1vdmUgYXN0X3tzaG93
LGhpZGV9X2N1cnNvcigpIHdpdGhpbiBzb3VyY2UgZmlsZQo+PiAgICBkcm0vYXN0OiBNb3ZlIGN1
cnNvciB1cGRhdGUgY29kZSB0byBhc3Rfc2hvd19jdXJzb3IoKQo+PiAgICBkcm0vYXN0OiBNb3Zl
IGN1cnNvciBvZmZzZXQgc3dhcHBpbmcgaW50byBhc3Rfc2hvd19jdXJzb3IoKQo+PiAgICBkcm0v
YXN0OiBBbGxvY2F0ZSBjdXJzb3IgQk9zIGF0IGhpZ2ggZW5kIG9mIHZpZGVvIG1lbW9yeQo+Pgo+
PiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oICB8ICA0MyArKystLS0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAyMzUgKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKSwgMTIwIGRl
bGV0aW9ucygtKQo+Pgo+PiAtLQo+PiAyLjIzLjAKPj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCi0tIApUaG9tYXMgWmltbWVybWFubgpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgTGludXggR21iSCwgTWF4ZmVsZHN0cmFzc2Ug
NSwgOTA0MDkgTnVlcm5iZXJnLCBHZXJtYW55CkdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkg
SGlnZ2lucywgU3JpIFJhc2lhaApIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
