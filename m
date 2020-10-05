Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869472842D2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 01:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F7C6E198;
	Mon,  5 Oct 2020 23:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCF489C85
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 23:05:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id 33so11313401edq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BndRb6p15eNabaroxFRhHbzTRpopAcvFkWHj6E0oBVE=;
 b=A4B9U6zknHJFfvFErxn/1am6mLk/YyfLtfbJc4aa0411SLC7Sa8QY487OFKCvOIkv0
 L3wCeSIfncnsZhpiCFPg7DSsQxvEOl1pX+3m9ilCE1LzUgeswxkPT2suJn/DRz9FuoB8
 pCOx3EKfnq85dUQ2C6UKuy2+i4r821yK/fvB1gm8uO0AjHQXpgArgO1dWAtgvQddqh/n
 uEuBQPhZOAO0HPavZHd7B1p00XeF2dt2/yh2Efvx5f3OJgvUalgUnubJnFvEM8lnEKua
 UfhZrrJ0ltqm2fZ2TSz/LLA/KUvzZDNddUn4ZgxEGhN42qL2jefK6pIhzfdwLFUox1pF
 MV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BndRb6p15eNabaroxFRhHbzTRpopAcvFkWHj6E0oBVE=;
 b=ZIcrHMMcUqXjL8eRv1VBbGV/3yq0pmTx7A3jq8qsJuk8u0TMvx1H0WKjcVFXMCujp5
 nQomn8FbF/w5XOs5wXaeF2U92iPAb0AfYUD6n3y4kHbF7nM8tjvaqAbwXN2T3F+xXkib
 xP2b/wh4yRXJof8Gp8ZuEw9dwaaomQYQipK71VWQ2tgzcbnk/3cmAtQFtfCdHzMnvmYu
 qrMD9hmaXinwhTbgXLiAaD2J9shLQnkPFFTXmvGa+gt3ln6B2ef5sS4Atci6Vikx7BUX
 oH8mqiYQLlJ8l123YOWLsUJlWWSZb/6cEr3eR/qDeSpt/SJFRjKFLEltOjzqwjMId0A7
 gvhw==
X-Gm-Message-State: AOAM531dgl4MkuoKnxQXOO4K1UswmVX4j1PHBVsJSPLZILFsBHYeSwYL
 2m18SRdybV0BSst+u1BD+uaW9ftdg4P94gBz2zY=
X-Google-Smtp-Source: ABdhPJyQmnHZjPa+qrQ46vA95hQ+9P2pC0wA5nzT/OkdTuhMdiHAYrPzHbK67at8cbvEz+hKp7igoblAjtdRUPFzuF4=
X-Received: by 2002:a05:6402:2073:: with SMTP id
 bd19mr2122483edb.127.1601939146137; 
 Mon, 05 Oct 2020 16:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201005142656.79736-1-christian.koenig@amd.com>
 <CAKMK7uGuce2YbhKv5TzruSg7UX=3MiW+oq8JZd5_oyyLOpEvJA@mail.gmail.com>
In-Reply-To: <CAKMK7uGuce2YbhKv5TzruSg7UX=3MiW+oq8JZd5_oyyLOpEvJA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 6 Oct 2020 09:05:34 +1000
Message-ID: <CAPM=9txKgdKDpAv9hPFCGmjmwtHefgUsW=LTPHvvyt_GGW26YA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: nuke ttm_bo_evict_mm and rename mgr function v2
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA2IE9jdCAyMDIwIGF0IDAxOjM4LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgNSwgMjAyMCBhdCA0OjI3IFBNIENocmlzdGlhbiBL
w7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IE1ha2UgaXQgbW9yZSBjbGVhciB3aGF0IHRoZSByZXNvdXJjZSBtYW5hZ2VyIGZ1bmN0aW9uCj4g
PiBkb2VzIGFuZCBudWtlIHRoZSB3cmFwcGVyIGZ1bmN0aW9uLgo+ID4KPiA+IHYyOiBudWtlIHRo
ZSB3cmFwcGVyCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4KPiBJIHRoaW5rIGFkZGluZyBhIGJkZXYgYmFjayBwb2ludGVy
IHRvIHJlc19tYW4gd291bGQgYmUgbmljZSBhbmQgd291bGQKPiBhbGxvdyB1cyB0byBkcm9wIHRo
YXQgcG9pbnRlciB0b28sIGZvciBzb21lIHJlYWxseSBwcmV0dHkgb2JqZWN0Cj4gb3JpZW50ZWQg
ZmVlbCBpbiB0aGUgYXBpIDotKSBCdXQgbWF5YmUgZm9sbG93IHVwIHBhdGNoLgoKUHJldHR5IHN1
cmUgSSBqdXN0IHJlbW92ZWQgdGhhdCBwb2ludGVyIGEgZmV3IHdlZWtzIGFnbyA6LVAKCmNvbW1p
dCA3NTQxY2UxYTZmMmJlOWFiMDU2YTViNTEwNWUwOGFlZjhkMzI4N2IxCkF1dGhvcjogRGF2ZSBB
aXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KRGF0ZTogICBUdWUgQXVnIDQgMTI6NTY6MjYgMjAy
MCArMTAwMAoKICAgIGRybS90dG06IGRyb3AgbWFuLT5iZGV2IGxpbmsuCgpEYXZlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
