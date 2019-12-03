Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F91910FC36
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 12:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA996E444;
	Tue,  3 Dec 2019 11:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7096E444
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 11:10:30 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id i4so940745vkc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 03:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GPRZyr9rwShGjCYfhiCBmFoL5cEsHQVU8iM8OeKbL+Q=;
 b=trBZTyupbU5ihdRe/N3XGis92lhhPHSnp+X28mjVkVNKE22YhGZyUf0NAISRQPtpdq
 gfdc6RLns7D8zGLND0VqQexnE2W8l5z+Yg/arRDqtOMyCARfYk+t86rwg+s6lW7JH/rr
 p4HN22biABNFGU2WrlmGZ+Sav777mX0xmf4ugLG2zFAlx6NhUVdGHyhhKWpg65p4ZMyw
 riXe3DoQKTV0sZvsnFaPVtce4d7QISqLJx9eoFke7J7bwWHy6YyZerIxQZS9EXqgxL93
 fX0y5MPYy7baMgRfO41aXuLS1+q055E9FkEjNpqsp3L5/tt9Fv8xtCWmE0TK1ynaokKH
 3LrA==
X-Gm-Message-State: APjAAAWabe7Ck+3QPUN16bRLD17DsTA+FyGttAyLZGyyB4vreUdpdZLB
 vAoK9GFudW+EgZXEWR6XpK5IwS2d1PiWQtbZc1E=
X-Google-Smtp-Source: APXvYqwtC4YM0me0sChZVF9wH+cGKyUFykeZ7xDQ4k4jAiNBwkXrhiVEOgheVregu5zcHHuYDFog1t2tb9sovkXo4GY=
X-Received: by 2002:ac5:c7da:: with SMTP id e26mr3049241vkn.38.1575371429730; 
 Tue, 03 Dec 2019 03:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20191203100406.9674-1-tzimmermann@suse.de>
 <20191203100406.9674-3-tzimmermann@suse.de>
 <CACvgo50oHVLgjcv=ipQq=ZuWv2=mu20VHkVRx3x6+zhp5H9YYQ@mail.gmail.com>
In-Reply-To: <CACvgo50oHVLgjcv=ipQq=ZuWv2=mu20VHkVRx3x6+zhp5H9YYQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 3 Dec 2019 11:09:28 +0000
Message-ID: <CACvgo52UvEBSYTg3nTjrHvTg2kZ_Rd9LLLtNwrLbvcJ3k9yFGA@mail.gmail.com>
Subject: Re: [PATCH 02/12] drm/pci: Hide legacy PCI functions from non-legacy
 code
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GPRZyr9rwShGjCYfhiCBmFoL5cEsHQVU8iM8OeKbL+Q=;
 b=aqKaKGHfczTjUs4L9vqNXrUOm4j8SVnMj8u89OX2KBIOgF/aiZyVU2mFqgQzsxR48Q
 Hq/RgWnd1DgufkCoyhUvmh6PPrjTjEfXfqR6iTAZKEvFIsxXlOtL6qMftejSrzme4uMx
 yr9PPV8iGTSeNWUHqrglegBa8NfU7Zlu5HJN2+jXPF4vSeme03FoCBjKWYfjdrRk8W4f
 FXbaUIL+fRmhqfl3qArBwDmNWXy2G4b7x++z+f5lUnCeELR+HCc7jKzRTFvBbjJioEUo
 oPHoOXSmly6HwdjocNV7v6AyAg1yC1lpFumze8LqlGpCsNdZxra93AsmffjhAXLovvbV
 /Uhg==
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAzIERlYyAyMDE5IGF0IDExOjA2LCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBUaG9tYXMsCj4KPiBPbiBUdWUsIDMgRGVjIDIwMTkg
YXQgMTA6MDQsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToK
PiA+Cj4gPiBEZWNsYXJhdGlvbnMgb2YgZHJtX2xlZ2FjeV9wY2lfe2luaXQsZXhpdH0oKSBhcmUg
YmVpbmcgbW92ZWQgdG8KPiA+IGRybV9sZWdhY3kuaC4gQ09ORklHX0RSTV9MRUdBQ1kgcHJvdGVj
dHMgdGhlIGltcGxlbWVudGF0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9wY2kuYyB8ICA0ICsrKysKPiA+ICBpbmNsdWRlL2RybS9kcm1fbGVnYWN5LmggIHwgMjkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICBpbmNsdWRlL2RybS9kcm1fcGNpLmgg
ICAgIHwgMTUgLS0tLS0tLS0tLS0tLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+Cj4gSG93IGFib3V0IHdlIG1ha2UgdGhpcyBwYXRj
aCAwMS8xMiwgdGhpcyB3YXkgd2UgY2FuIGF2b2lkIHRoZSBjdXJyZW50Cj4gY2FzZSBvZiAtIGFk
ZCBjb2RlIG9ubHkgdG8gYmUgbW92ZWQgaW4gbmV4dCBwYXRjaC4KPgo+IEFzIGFsd2F5cyAtIGNv
dXBsZSBvZiBpZGVhcyBmb3IgZm9sbG93LXVwIGNsZWFudXBzLgo+ICAtIGRybV9pcnFfYnlfYnVz
aWQoKSBpcyBsZWdhY3kgY29kZWJhc2UgKHNlZSB0aGUgRFJJVkVSX0xFR0FDWSBjaGVjawo+IGF0
IHRoZSB0b3ApLiBIb3cgYWJvdXQgd2UgZ2l2ZSBpdCBhIF9sZWdhY3lfIG5hbWU/Cj4gIC0gV0Ug
SEFWRSBBIEZFVyBkcml2ZXJfZmVhdHVyZXMKClBhcmRvbiB0aGVyZSwgdGhlIGxhc3Qgb25lIHNo
b3VsZCByZWFkOgotIFdlIGhhdmUgYSBmZXcgaW5zdGFuY2VzIHRoYXQgcmVhZCBkcml2ZXJfZmVh
dHVyZXMgZGlyZWN0bHksIGluc3RlYWQKb2YgdXNpbmcgdGhlIGRybV9jb3JlX2NoZWNrX2ZlYXR1
cmUoKSBoZWxwZXIuCk1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGFkZHJlc3MgdGhvc2UuCgpKdXN0
IHNvbWUgbml0cGlja3Mgbm90aWNlZCB3aGlsZSBza2ltbWluZyB0aHJvdWdoLiBJdCdzIG5vdCBh
CnJlcXVpcmVtZW50IGJ5IGFueSBtZWFucy4KCkhUSApFbWlsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
