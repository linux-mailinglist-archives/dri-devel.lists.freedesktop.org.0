Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A53D654F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 16:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2D989C13;
	Mon, 14 Oct 2019 14:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8011A89B38
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 14:35:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6595B568;
 Mon, 14 Oct 2019 14:35:19 +0000 (UTC)
Subject: Re: [PATCH 0/3] drm/vboxvideo: Use generic fbdev and framebuffer
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191011134808.3955-1-tzimmermann@suse.de>
 <20191012123636.GA25302@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8384c75e-3a7c-5b82-4ac0-2b7d261f153b@suse.de>
Date: Mon, 14 Oct 2019 16:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191012123636.GA25302@ravnborg.org>
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDEyLjEwLjE5IHVtIDE0OjM2IHNjaHJpZWIgU2FtIFJhdm5ib3JnOgo+IEhpIFRob21h
cy4KPiAKPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwMzo0ODowNVBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPj4gVGhlIHZib3h2aWRlbyBkcml2ZXIgcHJvdmlkZXMgaXRzIG93
biBpbXBsZW1lbnRhdGlvbiBmb3IgZmJkZXYgZW11bGF0aW9uCj4+IGFuZCBmcmFtZWJ1ZmZlcnMu
IEJvdGggY2FuIGJlIHJlcGxhY2VkIGJ5IERSTSdzIGdlbmVyaWMgY29kZS4KPj4KPj4gQWxsIHBh
dGNoZXMgaGF2ZSBiZWVuIHRlc3RlZCBvbiBWaXJ0dWFsQm94IDYuMC4xMi4KPj4KPj4gVGhvbWFz
IFppbW1lcm1hbm4gKDMpOgo+PiAgICBkcm0vdmJveHZpZGVvOiBTd2l0Y2ggdG8gZ2VuZXJpYyBm
YmRldiBlbXVsYXRpb24KPj4gICAgZHJtL3Zib3h2aWRlbzogU3dpdGNoIHRvIGRybV9hdG9taWNf
aGVscGVyX2RpcnR5X2ZiKCkKPj4gICAgZHJtL3Zib3h2aWRlbzogUmVwbGFjZSBzdHJ1Y3QgdnJh
bV9mcmFtZWJ1ZmZlciB3aXRoIGdlbmVyaWMKPj4gICAgICBpbXBsZW1lbmF0aW9uCj4+Cj4+ICAg
ZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby9NYWtlZmlsZSAgICB8ICAgMiArLQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyAgfCAgMTQgKy0tCj4+ICAgZHJpdmVycy9n
cHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5oICB8ICAyNSAtLS0tLQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS92Ym94dmlkZW8vdmJveF9mYi5jICAgfCAxNDkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbWFpbi5jIHwgMTE5ICstLS0t
LS0tLS0tLS0tLS0tLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUu
YyB8ICA4NiArKysrKysrLS0tLS0tLS0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlv
bnMoKyksIDM0NiBkZWxldGlvbnMoLSkKPj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3Zib3h2aWRlby92Ym94X2ZiLmMKPiBOaWNlIHdvcmsuIEJyb3dzZWQgdGhyb3VnaCB0
aGUgY2hhbmdlcyBhbmQgZW5qb3llZCBhbGwgdGhlIGRlbGV0ZWQgY29kZS4KPiAKPiBZb3UgY2Fu
IGFkZCBteToKPiAKPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
IAo+IHRvIHRoZSB3aG9sZSBzZXJpZXMuCgpUaGFua3MhCgo+IAo+IAlTYW0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCi0tIApUaG9tYXMg
WmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgTGludXggR21iSCwgTWF4
ZmVsZHN0cmFzc2UgNSwgOTA0MDkgTnVlcm5iZXJnLCBHZXJtYW55CkdGOiBGZWxpeCBJbWVuZMO2
cmZmZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaApIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
