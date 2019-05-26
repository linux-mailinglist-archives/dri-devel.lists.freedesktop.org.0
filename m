Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015192A96D
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 13:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106C89B3C;
	Sun, 26 May 2019 11:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5317289B3C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 11:38:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q16so3902492ljj.8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 04:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=StbyjKuob+g69b+MP1BIv299rEU4AXwlNv29yO23S00=;
 b=UsqapD/btIBIK60rQkNxtxeu+e9oSE61K2WJGwXL2UOz345YbeuKogQqJx9qf/pkar
 6S/dLUByjRYUGHTtDNTCIYBmueIrGVN+xxs9s2HOguhJ3MwcxJ1Iut5Ya1dxJ98RFvhx
 7SHXYevjrkKUG5QgfuoI1SxKJLe0T2y2iSIsACf/uEx3DADomiSccGqv21nkmhxCG3UE
 JNus8jwsg+bUoE65KTpVt8WNCLwTTYvqNneNqAFkQsfgBIfBWA7jSuWpnzUTmUwjwwFN
 0VN3jDYAtD+Oe5/0FG/pWFudj9D2XToUKx66uYbN52Xtk2r9DDl1V34O6QEany+XrWgO
 6HgQ==
X-Gm-Message-State: APjAAAUUj3u15GgHeh7EKfKGSpZ4LaaEJtQNQZlXJYlG2ZPihrLW3y9U
 CLBENGgzRMoEo1n7HEAk9qtfAaFotugvb8k9Xbr7Qg==
X-Google-Smtp-Source: APXvYqzkfil9hqz1ZkvBl/R+Yqjpk9Cywx5M2byVDQ7H+/N0GSx/hbm4OvxF1WwQI5M16kMKXZu5E33pRO3OhJJFljA=
X-Received: by 2002:a2e:9259:: with SMTP id v25mr14311716ljg.46.1558870712828; 
 Sun, 26 May 2019 04:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190522072153.13727-1-linus.walleij@linaro.org>
 <20190525073616.GE9586@ravnborg.org>
In-Reply-To: <20190525073616.GE9586@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 May 2019 13:38:20 +0200
Message-ID: <CACRpkdYK5SdyvUVqVdE2nTyf1Y5Chrt2v9e1MdSkmEa=DQuDkg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mcde: Add new driver for ST-Ericsson MCDE
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=StbyjKuob+g69b+MP1BIv299rEU4AXwlNv29yO23S00=;
 b=e962xnw5+hNuM0uPwzVK1bXVXGAOIcRWYjrrrbvxhjR7fyV8sk0v27XYgG9m4zeju5
 3yv241EGu+AvHZ38YO3q1zs+S8c0THn42fML8dZYxAHUqWpLlfNTwH5LS7OCF7vk+y/p
 hHdELrYG+we3CEBs7JRy7GCEbfXfksQDqWGovwGhGzM6UlRqB2+x8ehtp9CRqH6eUB0O
 VQd95nGEbOfPLPS4+AJwR33boJPqLN9F0RCfOOeJqBR1eFm789TXoZ0XBcCUAmKji5ZW
 e2iVUPwe6KAa4TZvOaxqgtI9Lolra8sXYGDXLN4YxHkOlQQSKAhsmKj2lCTL1GSvkHb5
 2v2Q==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXkgMjUsIDIwMTkgYXQgOTozNiBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgoKPiBUaGlzIGRyaXZlciBicmVha3MgYnVpbGQgaW4gZHJtLW1pc2MtbmV4
dCBhdCB0aGUgbW9tZW50Lgo+Cj4gRm9sbG93aW5nIHBhdGNoIGZpeGVkIGJvdGggYSBidWlsZCB3
YXJuaW5nIGFuZCBhIGJ1aWxkIGVycm9yLgo+IENvdWxkIHlvdSB0YWtlIGEgbG9vayBhbmQgZ2V0
IGl0IGZpeGVkIHByb3Blcmx5Lgo+Cj4gSWYgcmVsZXZhbnQgLSB0aGVuIHBhdGNoIGlzOgo+IFNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KClRoYW5rcyBTYW0s
IHNvcnJ5IGZvciBzY3Jld2luZyB1cCA6KAoKSSBtYWRlIGl0IHRvIGEgcHJvcGVyIHBhdGNoIGFu
ZCBwdXNoZWQgb3V0LCBpdCBidWlsZHMKZmluZSB3aXRoIHRoZSBsYXRlc3QgYnJhbmNoIGFmdGVy
IHRoaXMgZm9yIG1lIGFzIHdlbGwuCkknbGwgYXBwbHkgaXQgdG8gZHJtLW1pc2MtbmV4dC4KCllv
dXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
