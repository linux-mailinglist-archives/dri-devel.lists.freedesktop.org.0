Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE03C0562
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D16E215;
	Fri, 27 Sep 2019 12:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F66E215
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:44:26 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r22so1840117lfm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 05:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VyEYWcHusb2xAwadQO5+MZBHC82FyMUy4RKyfhU7dZI=;
 b=FJdP/+jxWB4mlJ90GWlh7hLSzYb1Rsp34bHBxjBkRv+PjD3rQbVoXJHBQY5Wd1mdMW
 fOcXIlNG2wDoVCgtnI5TurLz64RPczcyqvTArPESdU9lZD1M/lhkN4+IzQ+a4PmUBhj9
 eR68HWiNuy7wwI3+lZRauivf7jVH3mS3SRh/WtxGUkb5FjqsRlioRCYpk9xZM9TR4Q6/
 JZsik9yAQGsS6Jc7gAppuxOzfGcx8pkBo/PjwBBFnwdN1H5o9CrcOkRa+K19QTSt2PuY
 Zi/deV1adRwinvTo3kXm2m6x3o/OvopIXp/HvsLPO2WKIkjnbnbIUKQDBL1Hiz6wz8EF
 qyjQ==
X-Gm-Message-State: APjAAAX0EKSM9HFqzdPjDPEyCpKVZUsJ+m1XwPsrPS1ubfgFWsOQHX4s
 zGuLl+KIMQHdKtpeEpY7Box8N1Kz3VMaTeRckjcHEQ==
X-Google-Smtp-Source: APXvYqyVUS/ORGh6+Irmh08JU3KYmUZTazXWhmJ2zT/7x+4+cB8fif+Lo6eBRh7+KxDRONYgZjcDwtKl36K8qpk2p1M=
X-Received: by 2002:ac2:48af:: with SMTP id u15mr2778471lfg.75.1569588264784; 
 Fri, 27 Sep 2019 05:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190823193245.23876-1-laurent.pinchart@ideasonboard.com>
 <20190823193245.23876-4-laurent.pinchart@ideasonboard.com>
 <20190824095421.GC30584@ravnborg.org>
 <CACRpkdYk8S271X7pV_Vxe7BhL_mScV69Xbet2xyOqF0fFsRdcg@mail.gmail.com>
In-Reply-To: <CACRpkdYk8S271X7pV_Vxe7BhL_mScV69Xbet2xyOqF0fFsRdcg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 27 Sep 2019 13:44:13 +0100
Message-ID: <CAPj87rN3Dh1ANz=rZD=EMOfRXce7cc7v3M6TR2P0VJhyrT4-yw@mail.gmail.com>
Subject: Re: DRM_MODE_CONNECTOR_PANEL? [Was: drm/panel: Add and fill drm_panel
 type field]
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VyEYWcHusb2xAwadQO5+MZBHC82FyMUy4RKyfhU7dZI=;
 b=1lxXj2WtIhh3vII3c2Sh0jHQXGM4BV7F1OYmn3dPplxc/9auhG8FTZIfu6AMHt5lZ0
 HnI4JrVOu0s3cSpcacXnytfH9qIesYlaKJc2n3apMPVlSEKKUU8qPOfC/WnZEFDfew2h
 9YdSKalSJCITIB6s3LIOq2W3mGx6NJi/3gBRb+uyvXfrLrfGHTcSzQoOBni4cjEzEqpf
 YK2RPGtmtlW5Sjh+A/YWFJcz4GVEvKp1t6WxkbWqMwXmoiRpIMl7isT7kj0/cvmEeNEh
 /z2S9CRdmCahdwj3CFSplXOD6yp3nFBjBt8OhKttY02qTf6cUOJHNMLx4SiKftugJ9Nz
 qrrA==
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jsarha@ti.com>,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Purism Kernel Team <kernel@puri.sm>, Boris Brezillon <bbrezillon@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsCgpPbiBGcmksIDI3IFNlcCAyMDE5IGF0IDEzOjM3LCBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+IEFsc28gdGhlIElMSTkzMjIgY2FuIGFj
dHVhbGx5IHNldCB1cCBnYW1tYSBjb3JyZWN0aW9uIHdoaWNoIGlzCj4gdmVyeSBuaWNlIGZvciBw
cm9mZXNzaW9uYWwgYXBwbGljYXRpb25zLiBJIGhhdmVuJ3Qgc2VlbiBhbnkgd2F5IGZvcgo+IERS
TSB0byBkbyBnYW1tYSBjb3JyZWN0aW9uIHByb3Blcmx5IG9yIGFueSBmcmFtZXdvcmsgZm9yIGl0
Cj4gdG8gYWRqdXN0IGFuZCBwcm9wYWdhdGUgZ2FtbWEgdG8vZnJvbSB1c2Vyc3BhY2UgKHNlZW1z
IGxpa2UKPiBhbm90aGVyIGVub3Jtb3VzIHRhc2spLCBidXQgSSBhbSBwcmV0dHkgc3VyZSBpdCB3
aWxsIGJlIHRoZXJlIG9uZQo+IG9mIHRoZXNlIGRheXMgc28gSSBwdXQgaW4gc29tZSBjb21tZW50
cyBhbmQgcGxhY2Vob2xkZXJzLgoKR2FtbWEgY29ycmVjdGlvbiBoYXMgYmVlbiBzdXBwb3J0ZWQg
c2luY2UgYXBwcm94aW1hdGVseSB0aGUgZGF3biBvZgp0aW1lIHdpdGggYSAzeDgtYml0IExVVC4K
Ck9idmlvdXNseSBtb3JlIG1vZGVybiBoYXJkd2FyZSBoYXMgZmFyIG1vcmUgY29tcGxleCBjb2xv
dXIgbWFuYWdlbWVudC4KVGhpcyBpcyBhbHNvIHN1cHBvcnRlZCwgYW5kIGlzIGFwcHJveGltYXRl
bHkgZGVzY3JpYmVkIGhlcmU6Cmh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9kb2NzL2RybS9n
cHUvZHJtLWttcy5odG1sI2NvbG9yLW1hbmFnZW1lbnQtcHJvcGVydGllcwoKQm90aCBwbGFuZXMg
YW5kIENSVENzIGNhbiBoYXZlIGEgTFVUIC0+IG1hdHJpeCB0cmFuc2Zvcm0gLT4gTFVUCnBpcGVs
aW5lLiBUaGVyZSBhcmUgYWxzbyBhZGRpdGlvbmFsIHByb3BlcnRpZXMgZm9yIGZpeGVkIHRyYW5z
Zm9ybXMsCmUuZy4gbGltaXRlZCAxNi0yMzUgPC0+IGZ1bGwgMC0yNTUgcmFuZ2UgdHJhbnNsYXRp
b24uCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
