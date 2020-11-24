Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D92C2C90
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9676E49D;
	Tue, 24 Nov 2020 16:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3666B6E49D;
 Tue, 24 Nov 2020 16:17:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so3459513wme.1;
 Tue, 24 Nov 2020 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LijZ/LqMszGs8xMM0dN6Uty/k0Afuzo1kPHaiKp50lc=;
 b=eaq71AqWyrm4yPjqqoTtDMMrJUD/KevYxQDuMMRci86JvXfpe109IVVg4XYRfQ989H
 8z+N2Z3l1wEbTolG3PvIdM8zCEjXNTYB4LN7dy+FW/kz8o4PrApSMxa+IQo+ht7GB/ul
 qwzLvczje0prXgOiFT0YrVDqnifD1NLbbkZzbQ+oh7jX6AKkQ2gpPTQ7xo0u5oHlQ2iQ
 A43GSBpnmZiGXuWpZghmalIj8kmrHMzVGMfIF18BbCRymF50MEjKHsNIgXCDbFR4GYKx
 TUZFDyiEMYdU67/R84i7RfwvbW/yFgKkrNGMOLEPhpjElJ8Lw6lzbK2q8TZmFAPHEiqX
 +tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LijZ/LqMszGs8xMM0dN6Uty/k0Afuzo1kPHaiKp50lc=;
 b=jzA1kyzSqorG3zijMx8nplTWDsGAbzCTc5yed4nNrcWV/r+DAcLucPG8W+Iz40voC1
 svOyFicCFN67QrHriHVP6C0ZHuF7uYeJMupVBqc+jAR7+zr7ZrdqJ7b1gNesXG7kl8Df
 3Ml7HerU7zgh6tR2DB2UR/tuJzIGZH2jWjak65l3PfOUEQpqWr8TWO+gUu85AGjO6p8d
 yhLUReaGqt0YlfU+tJLWJ6Yaje8uv0Z6wc9th1XOdhnAae2fS0g/GlPH2Dfu8LDVcCow
 yI1aRPTZOcu5s96rZfTeAoRx9dwQETZqWve47rD4s1JmYJR0ETokdbezvucsF2GOz1ws
 IxOg==
X-Gm-Message-State: AOAM531vyF8UiGCu3uVYY6VbOZiJlQpoYu+MdGwO5ZSCj4jeJUizThSO
 AYSYpU2VZ8YxoLWD7rJJSDo5TanOrzwGkX6KhnY=
X-Google-Smtp-Source: ABdhPJzNygOzaDXbLuiWRGlvfncBI8h76FaQ99ii/pEtG+p4yc6rqeX5YYUTQfCiUJ/jAsV9SGlQext02PglndiOHbI=
X-Received: by 2002:a1c:2dc8:: with SMTP id t191mr5227545wmt.73.1606234653994; 
 Tue, 24 Nov 2020 08:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-31-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-31-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:17:22 -0500
Message-ID: <CADnq5_PXFO704YgzzWHmMSJEp0g0LMKYYqBcCJ--yLZ72agDNg@mail.gmail.com>
Subject: Re: [PATCH 30/40] drm/amd/include/dimgrey_cavefish_ip_offset: Mark
 top-level IP_BASE as __maybe_unused
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Tao Zhou <tao.zhou1@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2RpbWdyZXlfY2F2ZWZpc2hfcmVnX2luaXQuYzoyODoKPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9pbmNsdWRlL2RpbWdyZXlfY2F2ZWZpc2hfaXBfb2Zmc2V0Lmg6MTUxOjI5
OiB3YXJuaW5nOiDigJhVTUNfQkFTReKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
Y29uc3QtdmFyaWFibGU9XQo+IDE1MSB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBVTUNf
QkFTRSA9IHsgeyB7IHsgMHgwMDAxNDAwMCwgMHgwMjQyNTgwMCwgMCwgMCwgMCwgMCB9IH0sCj4g
fCBefn5+fn5+fgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvZGltZ3Jl
eV9jYXZlZmlzaF9pcF9vZmZzZXQuaDo4MToyOTogd2FybmluZzog4oCYRlVTRV9CQVNF4oCZIGRl
ZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gODEgfCBzdGF0
aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgRlVTRV9CQVNFID0geyB7IHsgeyAweDAwMDE3NDAwLCAw
eDAyNDAxNDAwLCAwLCAwLCAwLCAwIH0gfSwKPiB8IF5+fn5+fn5+fgo+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvZGltZ3JleV9jYXZlZmlzaF9pcF9vZmZzZXQuaDo3NDoy
OTogd2FybmluZzog4oCYRFBDU19CQVNF4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1jb25zdC12YXJpYWJsZT1dCj4gNzQgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgRFBD
U19CQVNFID0geyB7IHsgeyAweDAwMDAwMDEyLCAweDAwMDAwMEMwLCAweDAwMDAzNEMwLCAweDAw
MDA5MDAwLCAweDAyNDAzQzAwLCAwIH0gfSwKPiB8IF5+fn5+fn5+fgo+Cj4gTkI6IFNuaXBwZWQg
bG90cyBvZiB0aGVzZQo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Cj4g
Q2M6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KPiBDYzogSmlhbnNvbmcg
Q2hlbiA8SmlhbnNvbmcuQ2hlbkBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3Mh
CgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvZGltZ3JleV9jYXZl
ZmlzaF9pcF9vZmZzZXQuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2RpbWdyZXlfY2F2ZWZpc2hfaXBfb2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUvZGltZ3JleV9jYXZlZmlzaF9pcF9vZmZzZXQuaAo+IGluZGV4IGI0MTI2M2RlOGE5YjYu
LmY4NDk5NmE3M2RlOTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2RpbWdyZXlfY2F2ZWZpc2hfaXBfb2Zmc2V0LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2luY2x1ZGUvZGltZ3JleV9jYXZlZmlzaF9pcF9vZmZzZXQuaAo+IEBAIC0zMyw3ICszMyw3IEBA
IHN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFCj4gIHN0cnVjdCBJUF9CQVNFCj4gIHsKPiAgICAgIHN0
cnVjdCBJUF9CQVNFX0lOU1RBTkNFIGluc3RhbmNlW01BWF9JTlNUQU5DRV07Cj4gLX07Cj4gK30g
X19tYXliZV91bnVzZWQ7Cj4KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgQVRIVUJf
QkFTRSA9IHsgeyB7IHsgMHgwMDAwMEMwMCwgMHgwMjQwOEMwMCwgMCwgMCwgMCwgMCB9IH0sCj4g
LS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
