Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2672EF950
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716336E8C4;
	Fri,  8 Jan 2021 20:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD226E8C4;
 Fri,  8 Jan 2021 20:36:39 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id d189so12724269oig.11;
 Fri, 08 Jan 2021 12:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b9Rt82GW8KWAByvkk9obV3ZIpw1Casv9Xpm9XTSxgNs=;
 b=HXrJtALQglLUwlcIYLv0Pbm6fo7Eqd5MwfW8CipxsdU4Phc62azLX0mGKOTknkBc/k
 7nTbukE/fL/3jZWuGVCFK23DE6Bs8lb5ijmbBRkbpo6h0KJuwY01vKWaf0eV298hCOGD
 5Saz1R/TcjwL/wK27pWBeCgCFctg9UDdZMo50o+gBqxzKc4o7E0OqqvgDIIP0s6MCif/
 IZBAs/4GLJR3cO9yPbThH0DuyP53X3e59xxdYb2aAzt0NLBeGebTEWInG3o5L8eWC/AR
 N+pWh3ZkvPhhb7dpwzUXakp0m7CNBw38hTLwYQgyIiC+p0ldApfPE7DKR7KOdIik8Plq
 0Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b9Rt82GW8KWAByvkk9obV3ZIpw1Casv9Xpm9XTSxgNs=;
 b=EOGLvszYl9RreaC3S6r9hm4IDltUtTO8pgM/6tW3bZT6dGflE5w7Jn4f0r59VG9eLs
 Qotoi+0V29VfLdCux5bDw5x3bWoJ1a0+Z3mDDhXuAnSrEXKvvJ65+jWWpQGrcE4BMOVZ
 SWRr+1QRSeIJBy6Z1yptlW17iZ0maQ584agSj7wEUGSr7HtUuT6g54jlbtnRb8689wk2
 Qwh56d/vKHnfG05vMgG0Q1+0ug2qgM9tZB+Ci3frCMAjAyfE61WaWZKpKEKTM5cFm67w
 S0o5DY0ZsDdZOPeS6goCXLO5FdP/BUlHg1EM5KVv7z551a++HcNrj9ad8KVeFgUsSF/2
 tzmg==
X-Gm-Message-State: AOAM533YQP8+/+skLNoC02E31C8BtQIPrj8Jr1kcEqv+lDuVdJ7YWsSR
 beaoD3UeObBBV2Y9wVWAXlTx+Qig4x8eIAUGGTY=
X-Google-Smtp-Source: ABdhPJybhF2d2ICidbN92E2NRo7ryVGnG5mjIKZVjTCsffYlCCozzKgjlHnZjBK0989Ey5syJ6aNgkcI9BG8WFHkcz0=
X-Received: by 2002:aca:6202:: with SMTP id w2mr3296602oib.5.1610138198672;
 Fri, 08 Jan 2021 12:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-12-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:36:27 -0500
Message-ID: <CADnq5_M=FvTBgvVkU5-s8A8-wd8APyRETdR-M__6hD=Mmnp5eg@mail.gmail.com>
Subject: Re: [PATCH 11/40] drm/amd/pm/powerplay/hwmgr/hwmgr: Move prototype
 into shared header
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jOjU0NzQ6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJh2ZWdhMTBfaHdtZ3JfaW5pdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4K
PiBDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGll
ZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L2h3bWdyL2h3bWdyLmMgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuaCB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL3Bvd2VycGxheS9od21nci9od21nci5jCj4gaW5kZXggNmE3ZGU4Yjg5OGZhZi4uZjJj
ZWYwOTMwYWE5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxh
eS9od21nci9od21nci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkv
aHdtZ3IvaHdtZ3IuYwo+IEBAIC0zMyw2ICszMyw3IEBACj4gICNpbmNsdWRlICJwcHNtYy5oIgo+
ICAjaW5jbHVkZSAiYW1kX2FjcGkuaCIKPiAgI2luY2x1ZGUgInBwX3BzbS5oIgo+ICsjaW5jbHVk
ZSAidmVnYTEwX2h3bWdyLmgiCj4KPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBwcF9zbXVtZ3JfZnVu
YyBjaV9zbXVfZnVuY3M7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3QgcHBfc211bWdyX2Z1bmMgc211
OF9zbXVfZnVuY3M7Cj4gQEAgLTQ2LDcgKzQ3LDYgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBwcF9z
bXVtZ3JfZnVuYyB2ZWdhMTJfc211X2Z1bmNzOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0IHBwX3Nt
dW1ncl9mdW5jIHNtdTEwX3NtdV9mdW5jczsKPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBwcF9zbXVt
Z3JfZnVuYyB2ZWdhMjBfc211X2Z1bmNzOwo+Cj4gLWV4dGVybiBpbnQgdmVnYTEwX2h3bWdyX2lu
aXQoc3RydWN0IHBwX2h3bWdyICpod21ncik7Cj4gIGV4dGVybiBpbnQgc211MTBfaW5pdF9mdW5j
dGlvbl9wb2ludGVycyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKPgo+ICBzdGF0aWMgaW50IHBv
bGFyaXNfc2V0X2FzaWNfc3BlY2lhbF9jYXBzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpOwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBf
aHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9o
d21nci5oCj4gaW5kZXggZjc1MmI0YWQwYzhhZS4uMDdjMDZmOGM5MGIwOSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuaAo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21n
ci5oCj4gQEAgLTQ0Miw1ICs0NDIsNiBAQCBpbnQgdmVnYTEwX3VwZGF0ZV91dmRfZHBtKHN0cnVj
dCBwcF9od21nciAqaHdtZ3IsIGJvb2wgYmdhdGUpOwo+ICBpbnQgdmVnYTEwX3VwZGF0ZV9zYW11
X2RwbShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBib29sIGJnYXRlKTsKPiAgaW50IHZlZ2ExMF91
cGRhdGVfYWNwX2RwbShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBib29sIGJnYXRlKTsKPiAgaW50
IHZlZ2ExMF9lbmFibGVfZGlzYWJsZV92Y2VfZHBtKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGJv
b2wgZW5hYmxlKTsKPiAraW50IHZlZ2ExMF9od21ncl9pbml0KHN0cnVjdCBwcF9od21nciAqaHdt
Z3IpOwo+Cj4gICNlbmRpZiAvKiBfVkVHQTEwX0hXTUdSX0hfICovCj4gLS0KPiAyLjI1LjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
