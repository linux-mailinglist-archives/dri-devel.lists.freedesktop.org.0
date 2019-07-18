Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A406D311
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 19:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB926E446;
	Thu, 18 Jul 2019 17:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90DB6E449
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 17:49:06 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id z63so12545094ywz.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TcHEhgeLg4wCyvAuCh277bKvKMlAO9sX0vLEQ8gbuaw=;
 b=WwtKYz0KZ2w0r30EVkoVJluMXhXIM9euKtvo7FluAKQbW8HLz3rJb3ji61tnoRNtJ3
 s33CSdUO3aSFhfhkdTs/Zic1Yeckabo6E8kDtFRM7oC9WRk5bzBzXhAPSw1LaN+SEuSb
 uq/gXF4Ab7k/IwEs2w7P9Do4lRVyuZomjz5GFqTBtVsEPTMxTRDntBuxPmyW2ANPdaIv
 Dw73//yKfM8dvtDnrVWG70GXj7iYVq4FH2AjE29aNCpCQit7cKZwIn0CpIlh2R+p6rI0
 r89Cvr7cwPc4v8OMB8FImfZoygxFIDRu9ekY3Q7F4MJ1LoNw2Iy5voxUeUTtv6M/HM9H
 i2fA==
X-Gm-Message-State: APjAAAUF66/D3I3r1jS4oltppt4yCyspztiKbjWLz74Qhtm7w6m/qtQC
 6bfE/LukCnyAzwCL7oy7bW6jXQ==
X-Google-Smtp-Source: APXvYqx6Uslwcgt6FXtPTtAmiDT6PsPZOZfSYSrx+5nJhVWwXm/mkQxhro4Op23WJMYr87U7zzwBEg==
X-Received: by 2002:a81:5fd4:: with SMTP id
 t203mr27254887ywb.300.1563472146017; 
 Thu, 18 Jul 2019 10:49:06 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j67sm6907891ywa.39.2019.07.18.10.49.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 10:49:05 -0700 (PDT)
Date: Thu, 18 Jul 2019 13:49:05 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 04/11] drm/ati_pcigart: drop dependency on
 drm_os_linux.h
Message-ID: <20190718174905.GG31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-5-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TcHEhgeLg4wCyvAuCh277bKvKMlAO9sX0vLEQ8gbuaw=;
 b=H6wkH+Ja6Vv25R0kLDO3V4VVaS5ztNs9UcAubxqNI+3MthILN+2PFYat2u8m43w84T
 dAl/y87QY25XTUsQar+5BsMFrCcgZZr2GZBLhuqyQHujiIFXoQSWk06OtnL5c36L74TC
 VxBLEPjDdkPgpMEK7dFUqwRJj+fvhBAX6RIVfav3Jv8IKNZRSO4hEMAaQJ+tiTHT8GCC
 58uDhvWDf0K5kwRrrRpoDq/1sHOiikD5rNc1/JfuBN9AtOcD6T+9q+hREa6IMDY3J47U
 XJ1yiFscnRKTlmsHD1sW4ywez1baijXdAhIcjPWMvudB7QJGXHuaGaZUZArhWVOxGrjq
 WC9A==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTU6MDBQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFRoZSBkcm1fb3NfbGludXguaCBoZWFkZXIgaXMgZGVwcmVjYXRlZC4KPiBKdXN0IG9w
ZW5jb2RlIHRoZSBzb2xlIERSTV9XUklURTMyKCkuCgpBbnkgcGxhbnMgZm9yIHRoZSBvdGhlciB1
c2VycyBvZiBEUk1fV1JJVEU8Tj4oKT8gSXQgc2VlbXMgbGlrZSBpdCdkIGJlIHRyaXZpYWwKdG8g
Zml4IGl0IHVwIGZvciB2aWEgYW5kIG1nYS4gSSBkb24ndCByZWFsbHkgaGF2ZSBhbnkgYmFja2dy
b3VuZCBvbgpkcm1fb3NfbGludXguaCwgYnV0IGl0IGRvZXNuJ3Qgc2VlbSBsaWtlIGl0J2QgYmUg
dGhhdCBtdWNoIG1vcmUgZWZmb3J0IHRvIGp1c3QKcmVtb3ZlIHRoZSB3aG9sZSB0aGluZy4KClNl
YW4KCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBT
ZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hdGlfcGNpZ2FydC5jIHwgMTAgKysrKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXRpX3BjaWdhcnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hdGlfcGNpZ2Fy
dC5jCj4gaW5kZXggMmE0MTNlMjkxYTYwLi41ODBhYTI2NzYzNTggMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2F0aV9wY2lnYXJ0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRpX3Bj
aWdhcnQuYwo+IEBAIC0zNSw3ICszNSw2IEBACj4gIAo+ICAjaW5jbHVkZSA8ZHJtL2F0aV9wY2ln
YXJ0Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgo+IC0jaW5jbHVkZSA8ZHJtL2Ry
bV9vc19saW51eC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KPiAgI2luY2x1ZGUgPGRy
bS9kcm1fcHJpbnQuaD4KPiAgCj4gQEAgLTE2OSw2ICsxNjgsNyBAQCBpbnQgZHJtX2F0aV9wY2ln
YXJ0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9hdGlfcGNpZ2FydF9p
bmZvICpnYQo+ICAJCXBhZ2VfYmFzZSA9ICh1MzIpIGVudHJ5LT5idXNhZGRyW2ldOwo+ICAKPiAg
CQlmb3IgKGogPSAwOyBqIDwgKFBBR0VfU0laRSAvIEFUSV9QQ0lHQVJUX1BBR0VfU0laRSk7IGor
Kykgewo+ICsJCQl1MzIgb2Zmc2V0Owo+ICAJCQl1MzIgdmFsOwo+ICAKPiAgCQkJc3dpdGNoKGdh
cnRfaW5mby0+Z2FydF9yZWdfaWYpIHsKPiBAQCAtMTg0LDEwICsxODQsMTIgQEAgaW50IGRybV9h
dGlfcGNpZ2FydF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fYXRpX3Bj
aWdhcnRfaW5mbyAqZ2EKPiAgCQkJCWJyZWFrOwo+ICAJCQl9Cj4gIAkJCWlmIChnYXJ0X2luZm8t
PmdhcnRfdGFibGVfbG9jYXRpb24gPT0KPiAtCQkJICAgIERSTV9BVElfR0FSVF9NQUlOKQo+ICsJ
CQkgICAgRFJNX0FUSV9HQVJUX01BSU4pIHsKPiAgCQkJCXBjaV9nYXJ0W2dhcnRfaWR4XSA9IGNw
dV90b19sZTMyKHZhbCk7Cj4gLQkJCWVsc2UKPiAtCQkJCURSTV9XUklURTMyKG1hcCwgZ2FydF9p
ZHggKiBzaXplb2YodTMyKSwgdmFsKTsKPiArCQkJfSBlbHNlIHsKPiArCQkJCW9mZnNldCA9IGdh
cnRfaWR4ICogc2l6ZW9mKHUzMik7Cj4gKwkJCQl3cml0ZWwodmFsLCAodm9pZCBfX2lvbWVtICop
bWFwLT5oYW5kbGUgKyBvZmZzZXQpOwo+ICsJCQl9Cj4gIAkJCWdhcnRfaWR4Kys7Cj4gIAkJCXBh
Z2VfYmFzZSArPSBBVElfUENJR0FSVF9QQUdFX1NJWkU7Cj4gIAkJfQo+IC0tIAo+IDIuMjAuMQo+
IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9T
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
