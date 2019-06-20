Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7F4CE06
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 14:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F2F6E3FC;
	Thu, 20 Jun 2019 12:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E576E598
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 12:52:58 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so4605638edb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 05:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=x2nks0ZWBSwkgI+8zmRvf7myqGEPkqLJa4gjx4YnATo=;
 b=NEHeekW7DDFTWTkLT0MocmEBMt6KNUoba0n3nY2vteyioCu93BDK3LSH3SNXdZL8lq
 R9CQ5a7t7ToblHJkqLEn2Rc7MhRz6Y4dkWlnotoEJ9IWzeRhXQwg/AnVRLqdKUu0i0mP
 9B4kZm+L23G9znSeZM84yop/bi063cGq94hMpKhzlgh4jENqnYxWQWp4SQphEbcKxeVl
 LjIRJ9OjVbDA34ZgdYCPVdFXCqGgqEy+QYrOwhfSCThPvaM2mqZ7dEXIN7TNAKznTmFF
 zD03bIY8oU8J1pwgFJ0zfhN377omg2VzBawIqfs9v3359RdF3y6ob4dpWupjD/78+vxD
 RSsA==
X-Gm-Message-State: APjAAAVaZm4CpI/6Jry567E7P0qAitR+nvWJd40+580v7qMk9cJNpkgL
 bAwQUODfINLBrxhATmgqGGYqQw==
X-Google-Smtp-Source: APXvYqz+2wChTcVzB6MBFLdc2IqlXBe2K0UHIOc/CQhFkI7itM/Cb6Bs0OYMshmbKkGLPkSaEp4Rgw==
X-Received: by 2002:a50:89a6:: with SMTP id g35mr86186054edg.145.1561035176848; 
 Thu, 20 Jun 2019 05:52:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m31sm6738635edd.42.2019.06.20.05.52.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 05:52:56 -0700 (PDT)
Date: Thu, 20 Jun 2019 14:52:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Eric Engestrom <eric.engestrom@intel.com>
Subject: Re: [PATCH] drm/todo: Update drm_gem_object_funcs todo even more
Message-ID: <20190620125250.GU12905@phenom.ffwll.local>
References: <20190614203615.12639-2-daniel.vetter@ffwll.ch>
 <20190618140241.19856-1-daniel.vetter@ffwll.ch>
 <20190618182508.lp6n4zcgxj7lsu6l@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618182508.lp6n4zcgxj7lsu6l@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=x2nks0ZWBSwkgI+8zmRvf7myqGEPkqLJa4gjx4YnATo=;
 b=BX237Nt8fW09E+T8JC+wyULhns+ZVZeeTnzvT5lX/3gPohfyI7sppgm+Ttl3nMIs/s
 7a3RcRYcD2tEIgFf1SzYOsNhxhhQdlVe33mfsXDKeattokQKTo2zARoVgCwYlt9hNwc3
 VOE9a8PautAfn4jfPrHNJQUENhhtsZNKcm9FQ=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDc6MjU6MDhQTSArMDEwMCwgRXJpYyBFbmdlc3Ryb20g
d3JvdGU6Cj4gT24gVHVlc2RheSwgMjAxOS0wNi0xOCAxNjowMjo0MSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IEkgcnVzaGVkIG1lcmdpbmcgdGhpcyBhIGJpdCB0b28gbXVjaCwgYW5k
IE5vcmFsZiBwb2ludGVkIG91dCB0aGF0Cj4gPiB3ZSdyZSBhIGxvdCBiZXR0ZXIgYWxyZWFkeSBh
bmQgaGF2ZSBtYWRlIGdyZWF0IHByb2dyZXNzLgo+ID4gCj4gPiBMZXQncyB0cnkgYWdhaW4uCj4g
PiAKPiA+IEZpeGVzOiA0MmRiYmI0YjU0YTMgKCJkcm0vdG9kbzogQWRkIG5ldyBkZWJ1Z2ZzIHRv
ZG8iKQo+ID4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBD
YzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gPiBDYzogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiA+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+
IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+ID4gQ2M6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2dwdS90b2Rv
LnJzdCB8IDggKysrKystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9k
by5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ID4gaW5kZXggMjU4NzhkZDA0OGZk
Li42NmMxMjM3MzdjM2QgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJz
dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+IEBAIC0yMTIsOSArMjEy
LDExIEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcwo+ID4gIEdFTSBvYmplY3RzIGNhbiBu
b3cgaGF2ZSBhIGZ1bmN0aW9uIHRhYmxlIGluc3RlYWQgb2YgaGF2aW5nIHRoZSBjYWxsYmFja3Mg
b24gdGhlCj4gPiAgRFJNIGRyaXZlciBzdHJ1Y3QuIFRoaXMgaXMgbm93IHRoZSBwcmVmZXJyZWQg
d2F5IGFuZCBkcml2ZXJzIGNhbiBiZSBtb3ZlZCBvdmVyLgo+ID4gIAo+ID4gLVVuZm9ydHVuYXRl
bHkgc29tZSBvZiB0aGUgcmVjZW50bHkgYWRkZWQgR0VNIGhlbHBlcnMgYXJlIGdvaW5nIGluIHRo
ZSB3cm9uZwo+ID4gLWRpcmVjdGlvbiBieSBhZGRpbmcgT1BTIG1hY3JvcyB0aGF0IHVzZSB0aGUg
b2xkLCBkZXByZWNhdGVkIGhvb2tzLiBTZWUKPiA+IC1EUk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9P
UFMsIERSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywgYW5kIERSTV9HRU1fVlJBTV9EUklWRVJfUFJJ
TUUuCj4gPiArRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BTLCBEUk1fR0VNX1NITUVNX0RSSVZF
Ul9PUFMgYWxyZWFkeSBzdXBwb3J0IHRoaXMsIGJ1dAo+ID4gK0RSTV9HRU1fVlJBTV9EUklWRVJf
UFJJTUUgZG9lcyBub3QgeWV0IGFuZCBuZWVkcyB0byBiZSBhbGlnZW5kIHdpdGggdGhlIHByZXZp
b3VzCj4gCj4gcy9hbGlnZW5kL2FsaWduZWQvCgpGaXhlZCB3aGlsZSBhcHBseWluZy4KLURhbmll
bAoKPiAKPiA+ICt0d28uIFdlIGFsc28gbmVlZCBhIDJuZCB2ZXJzaW9uIG9mIHRoZSBDTUEgZGVm
aW5lIHRoYXQgZG9lc24ndCByZXF1aXJlIHRoZQo+ID4gK3ZtYXBwaW5nIHRvIGJlIHByZXNlbnQg
KGRpZmZlcmVudCBob29rIGZvciBwcmltZSBpbXBvcnRpbmcpLiBQbHVzIHRoaXMgbmVlZHMgdG8K
PiA+ICtiZSByb2xsZWQgb3V0IHRvIGFsbCBkcml2ZXJzIHVzaW5nIHRoZWlyIG93biBpbXBsZW1l
bnRhdGlvbnMsIHRvby4KPiA+ICAKPiA+ICBVc2UgRFJNX01PREVTRVRfTE9DS19BTExfKiBoZWxw
ZXJzIGluc3RlYWQgb2YgYm9pbGVycGxhdGUKPiA+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IC0tIAo+ID4gMi4yMC4xCj4gPiAK
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
