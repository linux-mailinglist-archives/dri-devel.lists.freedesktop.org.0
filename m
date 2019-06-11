Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C683D1A1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936BF8922E;
	Tue, 11 Jun 2019 16:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C9F8922E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:02:45 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so16849196edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=A9jMoW0QmKKyi9ec8aluqwqavsfJI/Htr1MCP2wBwwU=;
 b=LBCAjPZlikFQHqTMmAc0rmOFArMZr8mgnf5nfSRvoD+8giEOhM477505DoZZvaGt+W
 2VymjKqcq1lUgCJ9A4434P9lo9Hpy5Dpq0WtROW9zWIrqPbuc+ULG/rBjRGJwmPgU7M9
 biy9aaklMtgqHlKX41sTIzyPXlLE5x4SHrGB5L+edciXQvLaYikFnsMTpM0krp+qgVed
 CLj72ivoGh+VkiutRpJ5qQfBsdv3ir5j2jaXWNmE7x0BAfyTEi/dt0scqFk1yvl3F6tZ
 ifecpmDcRpvj+hfCBAjY4po4I66hgggTQfszbbEJh9FVjy3LJE26C143nfeSweJPK85p
 zwAg==
X-Gm-Message-State: APjAAAUB9CHgy/SSZcW0h7nYiEhbqomU768qZK9z7NMyhV6T9msNk30+
 PAUzrPAIiOEXdAVEdfSbZ/covA==
X-Google-Smtp-Source: APXvYqwwhyBmC/vvyp/dwwd9MDMoawHGOyU3eW8rBQO0DKq+BTlCElU4lxnJQJ3zeIIy7ew9NkhppA==
X-Received: by 2002:a50:8ba6:: with SMTP id m35mr22489945edm.199.1560268964644; 
 Tue, 11 Jun 2019 09:02:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n5sm3726275edt.65.2019.06.11.09.02.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 09:02:43 -0700 (PDT)
Date: Tue, 11 Jun 2019 18:02:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm/fb: document dirty helper better
Message-ID: <20190611160241.GJ2458@phenom.ffwll.local>
References: <20190611112859.16375-1-daniel.vetter@ffwll.ch>
 <c472cb9b-9f23-3cd4-8836-d6aa11d5ec33@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c472cb9b-9f23-3cd4-8836-d6aa11d5ec33@tronnes.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=A9jMoW0QmKKyi9ec8aluqwqavsfJI/Htr1MCP2wBwwU=;
 b=b2/WwoBjVDUa/jy3mLy4g2CzkgIIETyipUEKC996fYieG6Oo3KOcGP3Mt9mY0Fmlda
 MbnApE8DP95dRokPtGGtv6uITjoEuklWp6vQHLzMJ/6pNC5igD0V9VJ46QIUPLDkVmrE
 YddOoiQW8fBYr9YxQ7foykmr53uDo7kDcdLsg=
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
Cc: David Lechner <david@lechnology.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDM6MzQ6NTJQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IAo+IAo+IERlbiAxMS4wNi4yMDE5IDEzLjI4LCBza3JldiBEYW5pZWwgVmV0dGVy
Ogo+ID4gQXBwYXJlbnRseSBsaXR0bGUgbm9uZSBmYWN0IHRoYXQgdGhlcmUncyBubyBuZWVkIHRv
IGhhbmQtcm9sbCB5b3VyIG93bgo+ID4gYW55bW9yZS4gQ2MnaW5nIGEgYnVuY2ggb2YgZHJpdmVy
IHBlb3BsZSB3aG8gbWlnaHQgd2FudCB0byBrbm93IHRoaXMKPiA+IHRvby4KPiA+IAo+ID4gQ2M6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiA+IENjOiBTZWJhc3RpYW4gUmVpY2hl
bCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPiA+IENjOiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+IENjOiBEYXZp
ZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPiA+IENjOiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRo
YXQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Cj4gPiAtLS0KPiAKPiBXaXRoIENocmlzJ3MgY29tbWVudCBhZHJlc3NlZDoKCkRv
bmUmbWVyZ2VkLCB0aGFua3MgdG8gYm90aCBvZiB5b3UgZm9yIHRha2luZyBhIGxvb2suCi1EYW5p
ZWwKCj4gCj4gUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
Pgo+IAo+IAo+ID4gIGluY2x1ZGUvZHJtL2RybV9mcmFtZWJ1ZmZlci5oIHwgMyArKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZnJhbWVidWZmZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9mcmFtZWJ1ZmZlci5o
Cj4gPiBpbmRleCBjMjMwMTY3NDhlM2YuLmMwZTAyNTZlM2U5OCAxMDA2NDQKPiA+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9mcmFtZWJ1ZmZlci5oCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZnJh
bWVidWZmZXIuaAo+ID4gQEAgLTg3LDYgKzg3LDkgQEAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcl9m
dW5jcyB7Cj4gPiAgCSAqIGZvciBtb3JlIGluZm9ybWF0aW9uIGFzIGFsbCB0aGUgc2VtYW50aWNz
IGFuZCBhcmd1bWVudHMgaGF2ZSBhIG9uZSB0bwo+ID4gIAkgKiBvbmUgbWFwcGluZyBvbiB0aGlz
IGZ1bmN0aW9uLgo+ID4gIAkgKgo+ID4gKwkgKiBBdG9taWMgZHJpdmVycyBzaG91bGQgdXNlIGRy
bV9hdG9taWNfaGVscGVyX2RpcnR5ZmIoKSB0byBpbXBsZW1lbnQKPiA+ICsJICogdGhpcyBob29r
Lgo+ID4gKwkgKgo+ID4gIAkgKiBSRVRVUk5TOgo+ID4gIAkgKgo+ID4gIAkgKiAwIG9uIHN1Y2Nl
c3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4gPiAKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
