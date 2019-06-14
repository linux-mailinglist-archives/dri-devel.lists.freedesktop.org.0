Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C699457C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 10:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93768972D;
	Fri, 14 Jun 2019 08:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6144F89760
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:42:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s49so2416204edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 01:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QgL2xEAvTit++D3krd05nlqQHQWQMdk7SdHziLACmgM=;
 b=QN6FxtQEO4DV3qJ9oa8Rx0oDYi3U5LSi7Tc77IT6FA+3FX2Z3NJEJKxrlfyHNOg0mJ
 ZR5QvMdYVQHGSYnkS8FgMw2FqmftRPGd6Zwt5fKOln9R4NDuj9NdEBKCoGTqAzB4GRRY
 6Nn8W49U0kUCBu578lt9bSXf7e5bEl4ChUEgOvO/NeRxu/9P6Ps1QLuBRCWSlg7rXtlP
 S+/u1+whhM91zDlkACUpNnv9s68KcV1ApAu860NIgKoXJ3wnq6DU4Qkn+g2yV1LacKox
 ClkL32s2cHpkus8QuKdjWSPpIkjYZminYiVoJQRON0BwMm4fQUSLD860N9wK7y2ujYu7
 QNFg==
X-Gm-Message-State: APjAAAUE4aTmyyoVku0GOzJD81zdnSGRvQpCwcguifCfkQELtoqM/LQ9
 hgrRR2rXQ8hjy5WtiKlelDVufQ==
X-Google-Smtp-Source: APXvYqwbZ1p/AAYkMvc204IuHnK2Mme6rVhADerqoPX3axFuelEDR2MDYfkYCclx3wOIYO9+vicaOg==
X-Received: by 2002:a50:b68f:: with SMTP id d15mr25067320ede.39.1560501775062; 
 Fri, 14 Jun 2019 01:42:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id i5sm681242edc.20.2019.06.14.01.42.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 01:42:54 -0700 (PDT)
Date: Fri, 14 Jun 2019 10:42:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190614084251.GW23020@phenom.ffwll.local>
Mail-Followup-To: Jacopo Mondi <jacopo@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
 <20190607120304.GH7593@pendragon.ideasonboard.com>
 <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QgL2xEAvTit++D3krd05nlqQHQWQMdk7SdHziLACmgM=;
 b=XR58Y3i7jh0s5ib+GPkWBYx5jkGGKnL6OtPhGMnIBDHFCkRvO/5LSEA0GQVt6euYoc
 2D8OEuFd0loxWkqqM6jxW3f4fxleyUMo+JEAeloHbyHmGkYy+7cI4/UC2Yq0Ah1Px7bi
 s0SkPljmpvYKvE4ULlepeye+FGxVL2/x4kvfw=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MTU6NTJBTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdy
b3RlOgo+IEhpIExhdXJlbnQsCj4gICAgdGhhbmtzIGZvciByZXZpZXcKPiAKPiBPbiBGcmksIEp1
biAwNywgMjAxOSBhdCAwMzowMzowNFBNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+
ID4gSGkgSmFjb3BvLAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+ID4KPiA+IE9u
IFRodSwgSnVuIDA2LCAyMDE5IGF0IDA0OjIyOjE5UE0gKzAyMDAsIEphY29wbyBNb25kaSB3cm90
ZToKPiA+ID4gRW5hYmxlIHRoZSBHQU1NQV9MVVQgS01TIHByb3BlcnR5IHVzaW5nIHRoZSBmcmFt
ZXdvcmsgaGVscGVycyB0bwo+ID4gPiByZWdpc3RlciB0aGUgcHJvZXBydHkgYW5kIHRoZSBhc3Nv
Y2lhdGVkIGdhbW1hIHRhYmxlIHNpemUgbWF4aW11bSBzaXplLgo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiA+IC0t
LQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgfCAzICsrKwo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwo+ID4gPiBpbmRleCBlNmQzZGYzN2M4MjcuLmM5
MjBmYjVkYmE2NSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9kdV9jcnRjLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9j
cnRjLmMKPiA+ID4gQEAgLTEyMDcsNiArMTIwNyw5IEBAIGludCByY2FyX2R1X2NydGNfY3JlYXRl
KHN0cnVjdCByY2FyX2R1X2dyb3VwICpyZ3JwLCB1bnNpZ25lZCBpbnQgc3dpbmRleCwKPiA+ID4g
IAkgICAgcmNkdS0+Y21tc1tzd2luZGV4XSkgewo+ID4gPiAgCQlyY3J0Yy0+Y21tID0gcmNkdS0+
Y21tc1tzd2luZGV4XTsKPiA+ID4gIAkJcmdycC0+Y21tc19tYXNrIHw9IEJJVChod2luZGV4ICUg
Mik7Cj4gPiA+ICsKPiA+ID4gKwkJZHJtX21vZGVfY3J0Y19zZXRfZ2FtbWFfc2l6ZShjcnRjLCBD
TU1fR0FNTUFfTFVUX1NJWkUpOwo+ID4gPiArCQlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChj
cnRjLCAwLCBmYWxzZSwgQ01NX0dBTU1BX0xVVF9TSVpFKTsKPiA+Cj4gPiBUaGlzIGNoYW5nZSBs
b29rcyBnb29kLCBidXQgeW91IGFsc28gbmVlZCB0byBhZGQgc3VwcG9ydCBmb3IgbGVnYWN5IEFQ
SS4KPiA+IEFjY29yZGluZyB0byB0aGUgZnVuY3Rpb24ncyBkb2N1bWVudGF0aW9uLAo+ID4KPiA+
ICAqIERyaXZlcnMgc2hvdWxkIHVzZSBkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0
KCkgdG8gaW1wbGVtZW50IHRoZQo+ID4gICogbGVnYWN5ICZkcm1fY3J0Y19mdW5jcy5nYW1tYV9z
ZXQgY2FsbGJhY2suCj4gPgo+IAo+IERyaXZlcnMgJ3NodWxkJyBvciBkcml2ZXJzICdzaGFsbCcg
Pwo+IElzbid0IHRoaXMgcmVxdWlyZWQgb25seSB0byBzdXBwb3J0IHRoZSAnbGVnYWN5IEFQSXMn
ID8gRG8gd2Ugd2FudCB0aGF0PwoKWW91J3JlIGNhbGxpbmcgZHJtX21vZGVfY3J0Y19zZXRfZ2Ft
bWFfc2l6ZSwgd2hpY2ggaXMgb25seSB1c2VmdWwgZm9yIHRoZQpsZWdhY3kgaW9jdGxzLiBzaG91
bGQgaGVyZSA9IGFzc3VtaW5nIHlvdXIgaHcgc3VwcG9ydHMgc29tZXRoaW5nIHRoYXQKbGVnYWN5
IGdhbW1hIGlvY3RsIGNhbiB1c2UuIEZlZWwgZnJlZSB0byBwYXRjaCB1cCB0aGUgZG9jcy4KLURh
bmllbAoKPiAKPiBUaGFua3MKPiAgICBqCj4gCj4gPiA+ICAJfQo+ID4gPgo+ID4gPiAgCWRybV9j
cnRjX2hlbHBlcl9hZGQoY3J0YywgJmNydGNfaGVscGVyX2Z1bmNzKTsKPiA+ID4KPiA+Cj4gPiAt
LQo+ID4gUmVnYXJkcywKPiA+Cj4gPiBMYXVyZW50IFBpbmNoYXJ0CgoKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
