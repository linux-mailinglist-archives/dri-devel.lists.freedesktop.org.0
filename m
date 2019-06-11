Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F23CA08
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 13:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC0489026;
	Tue, 11 Jun 2019 11:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F365D89026
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:30:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z25so19551040edq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 04:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9hplbdoQt6f+tO46cQ+h1MGYuIVNz9GlttJp/d6VvJQ=;
 b=i6PNN4BK9VbFng5yBN3eHvRjdJ1FKUAsqSJicvyPaRg8iKEgu8tYXiN6chWyz1E8gj
 v+p7miObS+YNL3k6VDekyzl+WuhBjQdvOvq6271C+Xq5mftp4KyPcek17PxQ23C3/ptj
 m5r1AKOneQYGnOMD3JhazsEUGz2GMmXBYXWNxmBUKKL/yNapIrpCgXSJRHunq5Zf2mAM
 13R13DvC0ULBqF3vkw7nPJ198IsPCXYZ9thPPDPLRAo02NhgBUHScP4OqwSkBBaFo+BA
 kYaurkzwuiwP/OzDfABKPnrpW3SnWaSmjodyA1wx7m8QjBveXPflQdqOsPqLkH3b3aAR
 RYPw==
X-Gm-Message-State: APjAAAVEhAd2dmGuLp+LAt/xm8YlahPbM7ar7ZOd66n6nmgXVJ18jObR
 CkwRZRSozfH1Aj1t5kdNUm742g==
X-Google-Smtp-Source: APXvYqwaG1EfgBgdGzQa0Mh8frWzZPhVvttosZJRAWJ86A4Qn0yJEvInK9QnGCa9nN2NzQ2HnfMmtw==
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr79643105edc.294.1560252654684; 
 Tue, 11 Jun 2019 04:30:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id hk1sm2213283ejb.36.2019.06.11.04.30.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 04:30:53 -0700 (PDT)
Date: Tue, 11 Jun 2019 13:30:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [GIT PULL] omapdrm changes for 5.3
Message-ID: <20190611113051.GB2458@phenom.ffwll.local>
References: <a709f57d-6909-8550-3932-d84e0b5bc3ef@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a709f57d-6909-8550-3932-d84e0b5bc3ef@ti.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9hplbdoQt6f+tO46cQ+h1MGYuIVNz9GlttJp/d6VvJQ=;
 b=YWPKRbfQJsHz03fX91KjviFdGivsl9H/fIVdW2I9qgYgx4gFqs5zVtBwZe7cl1v7EF
 gyDc7wl+iGdFobJJox94ZxLNwfJ2Y1SCvBwd9HniC81dh1naYvcOVYftZS0LgAgmwILH
 nQAUWiU4ytrnwdbAa5qieVKoJ+zOgJIQ0+Qfc=
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6MDU6NDBBTSArMDMwMCwgVG9taSBWYWxrZWluZW4g
d3JvdGU6Cj4gSGkgRGF2ZSwKPiAKPiBQbGVhc2UgcHVsbCBvbWFwZHJtIGNoYW5nZXMgZm9yIDUu
My4KPiAKPiAgVG9taQo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMzk2
ZjlhY2FmZmQ4N2U0NGI4YjAyYmM2MGYwNmRjOTQ5YjgzMmI3ZToKPiAKPiAgIE1lcmdlIGJyYW5j
aCAnZHJtLW5leHQtNS4zJyBvZiBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9s
aW51eCBpbnRvIGRybS1uZXh0ICgyMDE5LTA2LTA2IDE0OjI4OjI2ICsxMDAwKQo+IAo+IGFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvbWJhL2xpbnV4LmdpdCB0YWdzL29tYXBk
cm0tNS4zCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDFiYjQxOGJmZmRkNmY5
NWE0MWU4ZTU5YmU2MzkzM2JjODRmZGUxM2M6Cj4gCj4gICBkcm0vb21hcDogYWRkIHN1cHBvcnQg
Zm9yIG1hbnVhbGx5IHVwZGF0ZWQgZGlzcGxheXMgKDIwMTktMDYtMTAgMTc6MDQ6MTUgKzAzMDAp
Cj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IG9tYXBkcm0gY2hhbmdlcyBmb3IgNS4zCj4gCj4gLSBBZGQgc3VwcG9y
dCBmb3IgRFNJIGNvbW1hbmQgbW9kZSBkaXNwbGF5cwoKVGhhbmtzLCBwdWxsZWQuCj4gCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+IEVtaWwgVmVsaWtvdiAoMSk6Cj4gICAgICAgZHJtL29tYXA6IHJlbW92ZSBvcGVuLWNv
ZGVkIGRybV9pbnZhbGlkX29wKCkKPiAKPiBLZWZlbmcgV2FuZyAoMSk6Cj4gICAgICAgZHJtL29t
YXA6IFVzZSBkZXZfZ2V0X2RydmRhdGEoKQo+IAo+IFNlYmFzdGlhbiBSZWljaGVsICg0KToKPiAg
ICAgICBkcm0vb21hcDogdXNlIERSTV9ERUJVR19EUklWRVIgaW5zdGVhZCBvZiBDT1JFCj4gICAg
ICAgZHJtL29tYXA6IGRvbid0IGNoZWNrIGRpc3BjIHRpbWluZ3MgZm9yIERTSQo+ICAgICAgIGRy
bS9vbWFwOiBhZGQgZnJhbWVkb25lIGludGVycnVwdCBzdXBwb3J0Cj4gICAgICAgZHJtL29tYXA6
IGFkZCBzdXBwb3J0IGZvciBtYW51YWxseSB1cGRhdGVkIGRpc3BsYXlzCgpUaGlzIHNlZW1zIHRv
IHJlaW52ZW50IGRybV9hdG9taWNfaGVscGVyX2RpcnR5KCksIEkndmUgY2MnZWQgeW91IG9uIGEg
ZG9jCnBhdGNoLiBBbHNvIHRoZSBmYmRldiBkaXJ0eSBzdHVmZiBzZWVtcyB0byBiZSBtaXNzaW5n
IGhlcmUsIHlvdSBtaWdodCB3YW50CnRvIGxvb2sgYXQgTm9yYWxmJ3MgZ2VuZXJpYyBmYmRldiBz
dHVmZiB0byB0YWtlIGNhcmUgb2YgYWxsIG9mIHRoaXMgZm9yCnlvdS4KCkNoZWVycywgRGFuaWVs
Cj4gCj4gVGhvbWFzIE1leWVyICgxKToKPiAgICAgICBkcm0vb21hcDogTWFrZSBzdXJlIGRldmlj
ZV9pZCB0YWJsZXMgYXJlIE5VTEwgdGVybWluYXRlZAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyB8ICAxOCArLS0KPiAgZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZHNzL29tYXBkc3MtYm9vdC1pbml0LmMgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2NydGMuYyAgICAgICAgICAgICB8IDE4MCArKysrKysrKysrKysrKysr
KysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmggICAgICAgICAg
ICAgfCAgIDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jICAgICAgICAg
ICAgICB8ICAxNiArLS0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuaCAgICAg
ICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jICAg
ICAgICAgICAgICAgfCAgMTkgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfaXJx
LmMgICAgICAgICAgICAgIHwgIDI1ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9pcnEuaCAgICAgICAgICAgICAgfCAgIDEgKwo+ICA5IGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNl
cnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKPiAKPiAKPiAtLSAKPiBUZXhhcyBJbnN0cnVtZW50
cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KPiBZLXR1bm51
cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
