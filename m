Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390FA2764FC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0946EA1C;
	Thu, 24 Sep 2020 00:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7736EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:20:09 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id u21so2068651eja.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RO2haehJbbmPliMQGTCUNzlFgZJnCjxEpos9821TVn0=;
 b=En/LtzUx6Nx1VzEujx5wyKAJ0XIQq5wKwFYkAepIX/VlhBPzpudpgMcX07DyWsc9KE
 L0v7M0atHzjOW2hkUbp1DBt12nSpcYTPsgLaEYBHr7urJcxLDEcAaQDQ+lAnT7YwvtIW
 SUHkDcX3EqclOpzFyy2tondWEfjI+8+ZLUDP3S6cP0SD7I+Mbba3r28HaJaE/Z4S6f06
 VlUXfrTinKgHlbSB73XOPLT2/mdV7NDqvgGcEpjZutCSlkhFOBhx5Rg88mkxAYMlZIQ0
 TsN0YOKDP+Qz3m7YtmHugBQUhgBv6j51sNmXaczj4eyJDWZihe4chPsRUE6LPJzTrJuP
 iTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RO2haehJbbmPliMQGTCUNzlFgZJnCjxEpos9821TVn0=;
 b=B4Xwtl2Bo/WsUZyfjkE87+Bwz6dSZ3RZjZniS29gdohulNRTeTrFuFEvm23guvwp+y
 ocFkIgVcDYikr7mBm7bXCT/r/6okUA+AECMkDBseZucmXB1nBPVrDLUopDOiQ+3RyYC3
 UJd/BudJrYtnGKO2HuKFwMxdhJWI2uUwVsmP3L9y5wRF5NcrNRH1vo7QHI2xG/M3CwJb
 xKfdfwngUgocw/v9NuoEbXprR9eBcnjDWcEbMfS8EiuZXa2C8pH5fFmzHg5rFlimsaKJ
 uJpCp8Oagv/LOPr7ciuHFsIIVrEou3msnogmLAbeZVyMlHbv4bjDYFHCtPwCFdj3g/H0
 bBUw==
X-Gm-Message-State: AOAM532yNkp8zVoqpDWTUV5dkcZjfXcq6AFxxJr2s+bCUM8d1N9ZmrrP
 9jvdBQTqAB/ibWpIIWUkqz1JsZryqwi2SJ0qej0IRt4T
X-Google-Smtp-Source: ABdhPJz1shAj7jQLZ67FRWDRo6Adn7dBNSxUSncpbtudJz8EXxm/4t43GiS8sk/BJGFa46wESF8WcooG4pW5RiHG1Ds=
X-Received: by 2002:a17:906:d787:: with SMTP id
 pj7mr2011309ejb.340.1600906808161; 
 Wed, 23 Sep 2020 17:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200917142917.3178-1-christian.koenig@amd.com>
 <4b32960a-2322-bdd7-cba5-b8f41e896e97@gmail.com>
In-Reply-To: <4b32960a-2322-bdd7-cba5-b8f41e896e97@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Sep 2020 10:19:56 +1000
Message-ID: <CAPM=9twOkJCWnYk5+AamVWqkSMVR6o1pUc=wSr51_y+5cyYbeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: stop using persistent_swap_storage
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <skeggsb@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpGb3IgYm90aCBw
YXRjaGVzLgoKT24gV2VkLCAyMyBTZXAgMjAyMCBhdCAyMzowMywgQ2hyaXN0aWFuIEvDtm5pZwo8
Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUGluZz8gQmVuLCBE
YXZlIGFueSBjb21tZW50IG9uIHRoaXM/Cj4KPiBBbSAxNy4wOS4yMCB1bSAxNjoyOSBzY2hyaWVi
IENocmlzdGlhbiBLw7ZuaWc6Cj4gPiBBY2NvcmRpbmcgdG8gQmVuIHRoaXMgaXMgbW9zdCBsaWtl
bHkganVzdCBhIGxlZnRvdmVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jIHwgMSAtCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jCj4gPiBp
bmRleCA4OWFkYWRmNDcwNmIuLjU5NDVjNjYzMzgxZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZ2VtLmMKPiA+IEBAIC0yMDksNyArMjA5LDYgQEAgbm91dmVhdV9nZW1f
bmV3KHN0cnVjdCBub3V2ZWF1X2NsaSAqY2xpLCB1NjQgc2l6ZSwgaW50IGFsaWduLCB1aW50MzJf
dCBkb21haW4sCj4gPiAgICAgICBpZiAoZHJtLT5jbGllbnQuZGV2aWNlLmluZm8uZmFtaWx5ID49
IE5WX0RFVklDRV9JTkZPX1YwX1RFU0xBKQo+ID4gICAgICAgICAgICAgICBudmJvLT52YWxpZF9k
b21haW5zICY9IGRvbWFpbjsKPiA+Cj4gPiAtICAgICBudmJvLT5iby5wZXJzaXN0ZW50X3N3YXBf
c3RvcmFnZSA9IG52Ym8tPmJvLmJhc2UuZmlscDsKPiA+ICAgICAgICpwbnZibyA9IG52Ym87Cj4g
PiAgICAgICByZXR1cm4gMDsKPiA+ICAgfQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
