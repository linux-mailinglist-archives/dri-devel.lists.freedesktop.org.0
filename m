Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 823FDD4FBC
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 14:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088C36E483;
	Sat, 12 Oct 2019 12:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BFE6E483
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 12:36:42 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A84B5804BB;
 Sat, 12 Oct 2019 14:36:38 +0200 (CEST)
Date: Sat, 12 Oct 2019 14:36:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm/vboxvideo: Use generic fbdev and framebuffer
Message-ID: <20191012123636.GA25302@ravnborg.org>
References: <20191011134808.3955-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011134808.3955-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=arlZwdzp4CD6PVwSuQsA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDM6NDg6MDVQTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gVGhlIHZib3h2aWRlbyBkcml2ZXIgcHJvdmlkZXMgaXRz
IG93biBpbXBsZW1lbnRhdGlvbiBmb3IgZmJkZXYgZW11bGF0aW9uCj4gYW5kIGZyYW1lYnVmZmVy
cy4gQm90aCBjYW4gYmUgcmVwbGFjZWQgYnkgRFJNJ3MgZ2VuZXJpYyBjb2RlLgo+IAo+IEFsbCBw
YXRjaGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gVmlydHVhbEJveCA2LjAuMTIuCj4gCj4gVGhvbWFz
IFppbW1lcm1hbm4gKDMpOgo+ICAgZHJtL3Zib3h2aWRlbzogU3dpdGNoIHRvIGdlbmVyaWMgZmJk
ZXYgZW11bGF0aW9uCj4gICBkcm0vdmJveHZpZGVvOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxw
ZXJfZGlydHlfZmIoKQo+ICAgZHJtL3Zib3h2aWRlbzogUmVwbGFjZSBzdHJ1Y3QgdnJhbV9mcmFt
ZWJ1ZmZlciB3aXRoIGdlbmVyaWMKPiAgICAgaW1wbGVtZW5hdGlvbgo+IAo+ICBkcml2ZXJzL2dw
dS9kcm0vdmJveHZpZGVvL01ha2VmaWxlICAgIHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS92
Ym94dmlkZW8vdmJveF9kcnYuYyAgfCAgMTQgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlk
ZW8vdmJveF9kcnYuaCAgfCAgMjUgLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92
Ym94X2ZiLmMgICB8IDE0OSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vdmJveHZpZGVvL3Zib3hfbWFpbi5jIHwgMTE5ICstLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMgfCAgODYgKysrKysrKy0tLS0t
LS0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMzQ2IGRlbGV0aW9ucygt
KQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Zi
LmMKTmljZSB3b3JrLiBCcm93c2VkIHRocm91Z2ggdGhlIGNoYW5nZXMgYW5kIGVuam95ZWQgYWxs
IHRoZSBkZWxldGVkIGNvZGUuCgpZb3UgY2FuIGFkZCBteToKCkFja2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cgp0byB0aGUgd2hvbGUgc2VyaWVzLgoKCVNhbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
