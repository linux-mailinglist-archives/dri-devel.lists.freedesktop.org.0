Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65AAB60C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EE96E235;
	Fri,  6 Sep 2019 10:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A9C6E235;
 Fri,  6 Sep 2019 10:35:06 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id b123so3724190vsb.5;
 Fri, 06 Sep 2019 03:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iBMDiFL15VF5qGp+naaSR1DFAv6H6kz31gfhZio50+8=;
 b=CgJJwqRBn2l/k7P+M1hV0JlkmlmUNqMNkhK7W9bNhthJMCAxXltc3gUKd0/rLaqyjZ
 FVjfRL0f0At5xc27F4ldGn9aKwCt1ERAVBC08CPk8QmXq9AHJIZi7f2HpqBQdZY8eW+/
 IBwlDjten95Dp2O/DcQx6yTcQO+ZonGyGk1ibBWpN8b0JkkrHYE+yBpTKqy9CyyaLv9H
 JViGF64N0C4jENE7JvzT9ZlMswaLG3HRnGANq76fR2i52BQj4YVWq7C8dzkcRoHJlUXM
 ttdfb9Q77Dt6KLQBetoOA3mNb/fdBrnTZwJ7h8H/lruvC9jmWhRGqvlG2szyNCkczxlI
 1Hbw==
X-Gm-Message-State: APjAAAXCqd1Bmdmub3KcFRuEenzu2OUbpDty/ox8g0+kxI4qF7Y/wlgq
 o+OSExBOu8R2NwuiAxA9zmouwiuGMZveb3qrWS4/OqtS
X-Google-Smtp-Source: APXvYqwfkSYT+EZSiCrLHo4dDN2egeB6NSGHWqIkoWmWgOuqC8cZXHOemKMWh0b3943QcIPLFqDzgoH0vXH81DnA8KA=
X-Received: by 2002:a67:eb42:: with SMTP id x2mr2143773vso.88.1567766105596;
 Fri, 06 Sep 2019 03:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190906100308.15341-1-christian.gmeiner@gmail.com>
 <ed249ddd9a37878214047fad227b7bf460da3298.camel@pengutronix.de>
In-Reply-To: <ed249ddd9a37878214047fad227b7bf460da3298.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 6 Sep 2019 12:35:50 +0200
Message-ID: <CAH9NwWc1BmQabXfJQ1HFS7xOew2TtDBDDRzWcP_UUSuZ7OqDDQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/etnaviv: update hardware headers from rnndb
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iBMDiFL15VF5qGp+naaSR1DFAv6H6kz31gfhZio50+8=;
 b=tpuZA/QvlS8h+imOANt68oZe+6hKidzq5q1KwaVMNovjjIHXOau0KjUNagkYlHnLnH
 rGnMnzYVrfEB/RMR+S4X/CjA0PU+5vHweQr1n8opGAly9xUWt4r1aNI6dtL21pxvuvaK
 67DPlO/ZhvCDn3Tj4tPOx2fFIx3tZc9DOeoq4GppNioofAV5l3m4yST6/U8EoQBxc8qX
 vVwntUkkmXElKWeBffmGGm2pkItIRhrsQN9xDh/o3CBgN6W/3tlzOWMSwt+yda2/++4M
 hb1c64llWLS9dEMwSYtmXsKxqYh3bBwJDkTXWSGp4H3k7zPbi714QgMnql0tcFS1CDEa
 zGkg==
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnIuLCA2LiBTZXB0LiAyMDE5IHVtIDEyOjExIFVociBzY2hyaWViIEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPjoKPgo+IE9uIEZyLCAyMDE5LTA5LTA2IGF0IDEyOjAzICsw
MjAwLCBDaHJpc3RpYW4gR21laW5lciB3cm90ZToKPiA+IFVwZGF0ZSB0aGUgc3RhdGUgSEkgYW5k
IGNvbW1vbiBoZWFkZXIgZnJvbSBybm5kYiBjb21taXQKPiA+IGEwNDI4MzU5MWE4YSAocm5uZGI6
IHVwZGF0ZSBNTVUgZXhjZXB0aW9uIGNhdXNlcykuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L3N0YXRlLnhtbC5oICAgICB8ICAgMzcgKy0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9zdGF0ZV8zZC54bWwuaCAgfCAxODQ5ICsrKysrKysrKysr
KysrKysrKysrKystCj4KPiBJJ20gbm90IGEgZmFuIG9mIHB1bGxpbmcgaW4gdGhlIGNvbXBsZXRl
IHN0YXRlXzNkIGhlYWRlci4gT25seSBhIHZlcnkKPiBsaW1pdGVkIHN1YnNldCBvZiB0aG9zZSBz
dGF0ZXMgYXJlIHVzZWQgaW4gdGhlIGtlcm5lbCBhbmQgdGhlIHJlc3Qgb2YKPiB0aGlzIG1hc3Np
dmUgc3RhdGUgc2V0IGlzIHB1cmUgbm9pc2UgZnJvbSBhIGtlcm5lbCBQb1YuCj4KCldoYXQgaWYg
SSBqdXN0IHVwZGF0ZSBzdGF0ZV9oaS54bWwuaCBhbmQgbGVhdmUgdGhlIG90aGVycyB1bnRvdWNo
ZWQ/CldvdWxkIHRoYXQgd29yayBmb3IgeW91PwoKLS0gCmdyZWV0cwotLQpDaHJpc3RpYW4gR21l
aW5lciwgTVNjCgpodHRwczovL2NocmlzdGlhbi1nbWVpbmVyLmluZm8vcHJpdmFjeXBvbGljeQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
