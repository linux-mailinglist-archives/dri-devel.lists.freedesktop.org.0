Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE96759A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 21:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5216E382;
	Fri, 12 Jul 2019 19:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DC26E382
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 19:55:44 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 201so7317931qkm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 12:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DPl+m+lBq9+B9rcJujBekjym3J7/OdwIHcDR75e8t6Q=;
 b=TFoy2Onu1N1FKoOpwFzorj2FIxVtum+z5Ld7Wcy/auCEOqC7VWZ/6afWp6giwFYBzf
 qOiZWErX2jJl5PaUwF7HQHtDC0vXuq5yVpX+uvGGdYZ8xTw6DKA6kdDoB3ucu1y7KnjC
 ST7jEOklIaTUC6JrsNxRIVY9ent0u9G5NGK3DmqDC9rh2tFx5vmjyiak+3m9oxTyYa5j
 hCxQlPneLdUX1eH6Js5DpJcXC4SBAP5FB2zr/Y1m7ZOh/SljhESo2amYMpGqI8sWgdGg
 VsFiNfoVnxvu23xviD9bSl9T7gSPozd8Va/PPX/e6ngo9Pd3XANHYSXPrDIWpBH3iTjJ
 TlHw==
X-Gm-Message-State: APjAAAVBpYK6g+PEE7meSjYVY3DaZUOkpqxKkELbHu4lmfX1KFtUeogZ
 pAds3agz19zo0pZvsXIX/6u7jw==
X-Google-Smtp-Source: APXvYqx1HGInbkt7yT6Je/Daaz06Bco/++z43iC+tVH8r5l7fwYMxAj0yGHtch4KyRCg2pWj2m1RNQ==
X-Received: by 2002:a37:a5cb:: with SMTP id o194mr7989179qke.371.1562961344024; 
 Fri, 12 Jul 2019 12:55:44 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id r205sm5090843qke.115.2019.07.12.12.55.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 12:55:43 -0700 (PDT)
Message-ID: <93fcded587fd0a2c67df35cc74d6406bd3267c4c.camel@redhat.com>
Subject: Re: [PATCH 04/10] drm/nouveau: Use connector kdev as aux device parent
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 12 Jul 2019 15:55:42 -0400
In-Reply-To: <20190704190519.29525-5-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-5-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUaHUsIDIwMTkt
MDctMDQgYXQgMTU6MDUgLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9tOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBTZXQgdGhlIGNvbm5lY3RvcidzIGtlcm5l
bCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwKPiBkZXZpY2UuIFRoaXMg
YWxsb3dzIHVkZXYgcnVsZXMgdG8gYWNjZXNzIGNvbm5lY3RvciBhdHRyaWJ1dGVzIHdoZW4KPiBj
cmVhdGluZyBzeW1saW5rcyB0byBhdXggZGV2aWNlcy4KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNr
ZWdnc0ByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0
b3IuYwo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwo+IGlu
ZGV4IDQxMTZlZTYyYWRhZi4uZTMyZGVmMDllZjg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gQEAgLTEzNDYsNyArMTM0Niw3IEBAIG5vdXZl
YXVfY29ubmVjdG9yX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCWJyZWFrOwo+
ICAJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQ6Cj4gIAljYXNlIERSTV9NT0RF
X0NPTk5FQ1RPUl9lRFA6Cj4gLQkJbnZfY29ubmVjdG9yLT5hdXguZGV2ID0gZGV2LT5kZXY7Cj4g
KwkJbnZfY29ubmVjdG9yLT5hdXguZGV2ID0gY29ubmVjdG9yLT5rZGV2Owo+ICAJCW52X2Nvbm5l
Y3Rvci0+YXV4LnRyYW5zZmVyID0gbm91dmVhdV9jb25uZWN0b3JfYXV4X3hmZXI7Cj4gIAkJc25w
cmludGYoYXV4X25hbWUsIHNpemVvZihhdXhfbmFtZSksICJzb3ItJTA0eC0lMDR4IiwKPiAgCQkJ
IGRjYmUtPmhhc2h0LCBkY2JlLT5oYXNobSk7Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
