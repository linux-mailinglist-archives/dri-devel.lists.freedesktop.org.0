Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C66110110
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 16:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510ED6E83C;
	Tue,  3 Dec 2019 15:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F9E6E83C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 15:20:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so4248551ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 07:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3zQ0bKSvISFi+1fBMi3jNVJYg+1MoT8ThtuF+2ovSQ=;
 b=F/zJirZJ//5eLc/pILPEj9d4yiZJDg52URp8ABQoNzTVMl9DshO2idr5okhvlLFvin
 DBzd030WkifMsDs9jot2adiTlN/dJY/QyLTKc0bmwDSho5dIuVqm67bU0Dtt2u9og5sJ
 JHGyOGTA4+zDQ9GOHxgQnQPL8Up2LWOccr34259thv6gova3CY9WG+ggzsW3RUSkWQk8
 FIS1LGbbE/E9+qwdSrETSqEWNDVEJkuKdPbet2AOD8ZLNnoSP27k6jpS8JL38kWy2TmA
 HL8D3+P/fyiMClc8N0vEHfAD5UMUx7AiEMsNlXFLZsh/FafN2SmxoPlbUyc/USkN1pCh
 36jA==
X-Gm-Message-State: APjAAAWJHhFO/BKZXm95yMh/E/miEGbT1LPR6uFQ713Ot0cqhllAx80Z
 Dah+wzdt5f+Nr5JPpPNL92E+e3ZDNpTnBGL+b/hXfg==
X-Google-Smtp-Source: APXvYqzeswPvfb4bN8LEsJSRL/PyxST5l5bJCtG71jQQSWLOGmPl2rs5haGp6u2c8kSn123mUXgOro1vUhgVEbncNNQ=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr2954959ljk.77.1575386436713;
 Tue, 03 Dec 2019 07:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
In-Reply-To: <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 16:20:24 +0100
Message-ID: <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=m3zQ0bKSvISFi+1fBMi3jNVJYg+1MoT8ThtuF+2ovSQ=;
 b=AWHhNjjjjGYoZzrFZIUydXTE8P04GoVEj/nkxXov5Xl+m6KVTmezfYzIS189Xbp2d9
 AoBT8kGo9Ilce7YjmHJ3BR2nLuZhHz+3UDJ/UUeou1iPTqwGwNddK1xb8tuMlXbwtqUv
 IvCc9hkMqkDp2pZ1+fqZfUoFvFdi6r9t/BjcweQbftCQDIBBsX3LPi/p1NolQb2re4oG
 PcRRUdNQdc96SBz0HlnkEujZ0AHARIftTj2fcd6E527NVp6lJFODir0h6yiz4ltMi1q/
 ex1vgLswTSItO9QwCbjS0LEF/qs2+n2yDsn1fJAg1JwWMO95Ffh1DJlmg/hRr4/s9Iog
 mqEg==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKT24gVHVlLCBEZWMgMywgMjAxOSBhdCA4OjQ3IEFNIE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFVzaW5nIG9ubHkgdGhlIG1vZGUgYXMgd2Ug
ZG8gY3VycmVudGx5IGhhcyBhIGJ1bmNoIG9mIHNob3J0Y29taW5ncyBhcwo+IGFsbW9zdCBubyBl
bmNvZGVyIHdpbGwgYmUgYWJsZSB0byBwcm92aWRlIHRoZSB0eXBpY2FsIHBpeGVsIGNsb2NrLCBh
bmQKPiB0aGF0IHNpdHVhdGlvbiBsZWFkcyB0byBtdWx0aXBsZSB0aGluZ3M6Cj4KPiAgIC0gSWYg
c29tZW9uZSB3b3JraW5nIG9uIG9uZSBlbmNvZGVyIHdhbnRzIHRvIHVwc3RyZWFtIGEgcGFuZWwg
dGhleQo+ICAgICBoYXZlIHRlc3RlZCwgY2hhbmNlcyBhcmUgdGhpcyB3aWxsIG5vdCBiZSB0aGUg
dHlwaWNhbCBwaXhlbCBjbG9jawo+ICAgICAvIHRpbWluZ3MgYmVpbmcgdXNlZCBidXQgcmF0aGVy
IHRoZSBvbmUgdGhhdCB3aWxsIG1hdGNoIHdoYXQgdGhhdAo+ICAgICBTb0MgaXMgY2FwYWJsZSBv
Zi4gVHJvdWJsZSBjb21lcyB3aGVuIGEgc2Vjb25kIHVzZXIgY29tZXMgaW4gd2l0aAo+ICAgICBh
IGRpZmZlcmVudCBlbmNvZGVyIGFuZCBkaWZmZXJlbnQgY2FwYWJpbGl0aWVzLCBhbmQgdGhlbiB3
ZSBoYXZlIGEKPiAgICAgbWFpbnRhaW5hbmNlIGZpZ2h0IG92ZXIgd2hpY2ggdGltaW5nIGlzIHRo
ZSB0cnVlIHRpbWluZyAod2l0aCBhCj4gICAgIHNpZ25pZmljYW50IGNoYW5jZSB0aGF0IG5vbmUg
b2YgdGhlbSBhcmUpLgo+Cj4gICAtIElmIHdlIGNhbid0IG1hdGNoIHRoZSBwaXhlbCBjbG9jaywg
d2UgY3VycmVudGx5IGhhdmUgbm8gZWFzeSB3YXkKPiAgICAgdG8gbWFrZSB0aGUgdXN1YWwgbWVh
c3VyZXMgb2YgcmVkdWNpbmcgLyBncm93aW5nIHRoZSBwb3JjaGVzIGFuZAo+ICAgICBibGFua2lu
Z3MgYXJlYXMgdG8gbWF0Y2ggdGhlIHBpeGVsIGNsb2NrIHdlIGNhbiBwcm92aWRlLCBzaW5jZSB3
ZQo+ICAgICBkb24ndCBoYXZlIGFuIGVhc3kgd2F5IHRvIGdldCB0aGUgdG9sZXJhbmNlIG9uIHRo
b3NlIHRpbWluZ3MgZm9yIGEKPiAgICAgZ2l2ZW4gcGFuZWwuIFRoZXJlJ3Mgc29tZSBhZCBob2Mg
c29sdXRpb25zIG9uIHNvbWUgZHJpdmVycyAoSQo+ICAgICB0aGluayB2YzQgaGFzIHRoYXQ/KSB0
byBpZ25vcmUgdGhlIHBhbmVsIGFuZCBqdXN0IHBsYXkgYXJvdW5kIHdpdGgKPiAgICAgdGhlIHRp
bWluZ3MsIGJ1dCBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGdlbmVyYWxpc2VkLgoKSSd2ZSBiZWVu
IGNvbmZ1c2VkIHdpdGggdGhlc2UgdGhpbmdzIGFzIHRoZXkgbG9vayB0b2RheSBhbmQgaXQgc2Vl
bXMKdGhlIHdob2xlIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGNvdWxkIG5lZWQgc29tZSBpbXBy
b3ZlbWVudD8KCklmIC5jbG9jayBpcyBzdXBwb3NlZCB0byBiZSBodG90YWwgKiB2dG90YWwgKiB2
cmVmcmVzaCwgd2hhdCBpcyB0aGUKLmNsb2NrIGRvaW5nIHRoZXJlIGFueXdheS4KClNhZGx5IEkg
YW0gdG9vIGluZXhwZXJpZW5jZWQgdG8gcmVhbGl6ZSB3aGVyZSB0aGUgdG9sZXJhbmNlcyBzaG91
bGQKYmUgc3RhdGVkLCBidXQgSSBndWVzcyBqdXN0IHN0YXRpbmcgdGhhdCBoc3luY19zdGFydCBl
dGMgYXJlIHR5cGljYWwsCnRoZW4gc3BlY2lmeSBzb21lIHRvbGVyYW5jZSBmb3IgZWFjaCB3b3Vs
ZCBoZWxwIGEgYml0PwoKT24gdGhlIERTSSBkaXNwbGF5cyBpbiB2aWRlbyBtb2RlIHRoZXJlIGlz
IGFsc28gdGhpcyBFT0wgYXJlYQp3aGljaCBzZWVtcyB0byBiZSB3aGVyZSB0aGUgbG9naWMgaXMg
bm9ybWFsbHkganVzdCBpZGxpbmcgZm9yIGEKd2hpbGUsIHRoYXQgY2FuIGJlIGFkanVzdGVkIG9u
IHNvbWUgaGFyZHdhcmUgYXMgd2VsbCwgYnV0CkkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCBpdCBh
ZG1pdHRlZGx5LiBTb21ldGltZXMgSSB3b25kZXIgaWYKYW55b25lIHJlYWxseSB1bmRlcnN0YW5k
cyBEU0kuLi4gOi8KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
