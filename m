Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB6295BD0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985746E03F;
	Thu, 22 Oct 2020 09:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849316E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 09:30:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C9AAAC3C;
 Thu, 22 Oct 2020 09:30:01 +0000 (UTC)
Subject: Re: [PATCH 0/3] drm: Store USB device in struct drm_device
To: Hans de Goede <hdegoede@redhat.com>, airlied@linux.ie, daniel@ffwll.ch,
 sean@poorly.run, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20201021130732.4048-1-tzimmermann@suse.de>
 <d5cc8a94-e908-84a1-09b2-fef7a2e78d91@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <42768db1-37a6-ee8d-aa82-d14fc8806a4b@suse.de>
Date: Thu, 22 Oct 2020 11:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <d5cc8a94-e908-84a1-09b2-fef7a2e78d91@redhat.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIyLjEwLjIwIDExOjIwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEwLzIxLzIwIDM6MDcgUE0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+PiBUaGUgZHJpdmVy
cyBnbTEydTMyMCBhbmQgdWRsIG9wZXJhdGUgb24gVVNCIGRldmljZXMuIFRoZXkgbGVhdmUgdGhl
Cj4+IFBDSSBkZXZpY2UgaW4gc3RydWN0IGRybV9kZXZpY2UgZW1wdHkgYW5kIHN0b3JlIHRoZSBV
U0IgZGV2aWNlIGluIHRoZWlyCj4+IG93biBkcml2ZXIgc3RydWN0dXJlLgo+Pgo+PiBGaXggdGhp
cyBzcGVjaWFsIGNhc2UgYW5kIHNhdmUgYSBmZXcgYnl0ZXMgYnkgcHV0dGluZyB0aGUgVVNCIGRl
dmljZQo+PiBpbnRvIGFuIGFub255bW91cyB1bmlvbiB3aXRoIHRoZSBQQ0kgZGF0YS4gSXQncyBl
eHBlY3RlZCB0aGF0IERSTQo+PiBjb3JlIGFuZCBoZWxwZXJzIG9ubHkgdG91Y2ggdGhlIFBDSS1k
ZXZpY2UgZmllbGQgZm9yIGFjdHVhbCBQQ0kgZGV2aWNlcy4KPj4KPj4gVGhvbWFzIFppbW1lcm1h
bm4gKDMpOgo+PiAgIGRybTogQWRkIHJlZmVyZW5jZSB0byBVU0IgZGV2aWNlIHRvIHN0cnVjdCBk
cm1fZGV2aWNlCj4+ICAgZHJtL3RpbnkvZ20xMnUzMjA6IFN0b3JlIFVTQiBkZXZpY2UgaW4gc3Ry
dWN0IGRybV9kZXZpY2UudWRldgo+PiAgIGRybS91ZGw6IFN0b3JlIFVTQiBkZXZpY2UgaW4gc3Ry
dWN0IGRybV9kZXZpY2UudWRldgo+IAo+IFRoaXMgc2VyaWVzIGxvb2tzIGdvb2QgdG8gbWU6Cj4g
Cj4gUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CgpUaGFu
a3MgYSBsb3QuIEZvbGxvd2luZyBEYW5pZWwncyByZXF1ZXN0LCBJJ2xsIGRyb3AgcGF0Y2ggMSBh
bmQgaW5zdGVhZApkbyBhbiB1cGNhc3QgZnJvbSBkcm1fZGV2aWNlLmRldiB0byB0aGUgVVNCIGRl
dmljZSBzdHJ1Y3R1cmUuIFRoZSBkcml2ZXIKcGF0Y2hlcyAyIGFuZCAzIHdpbGwgYmUgc2xpZ2h0
bHkgZGlmZmVyZW50LiBVbmxlc3MgeW91IG9iamVjdCwgSScnbGwKdGFrZSB0aGUgci1iIGludG8g
dGhlIG5ldyBwYXRjaGVzLgoKQmVzdCByZWdhcmRzClRob21hcwoKPiAKPiBSZWdhcmRzLAo+IAo+
IEhhbnMKPiAKPiAKPj4KPj4gIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgICAgIHwg
NTIgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Nvbm5lY3Rvci5jIHwgIDggKystLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Ry
di5jICAgICAgIHwgIDIgKy0KPj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oICAgICAg
IHwgIDEgLQo+PiAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jICAgICAgfCAxNSArKysr
Ky0tLS0KPj4gIGluY2x1ZGUvZHJtL2RybV9kZXZpY2UuaCAgICAgICAgICAgIHwgMjEgKysrKysr
KystLS0tCj4+ICA2IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9u
cygtKQo+Pgo+PiAtLQo+PiAyLjI4LjAKPj4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SApNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
