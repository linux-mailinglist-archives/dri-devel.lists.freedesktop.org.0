Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F95C0547
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742186E0F6;
	Fri, 27 Sep 2019 12:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773F6E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:37:56 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id q64so2303955ljb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 05:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eAEcZHLpmnRwpbb9uyGlf2g3EVhIuc00M/7AWO1KNuw=;
 b=r/1gRbkFjQdK0hWuSKWmShD4XV5bDqhr4gFV7VxQUe4eflmH3tTysHqE+zptFqNyC5
 o2ljffwp1wqAE3IXXCqFd6wdBGuegv84GhmMj1NFsCQcRLfgqErDuE/1MLGgqepm8up4
 0/SQwV4VUMehjyDOdBvlBO3kOj/CHqJEJx6/MmCB9VTwFTgem8GMldvv7QoIfP2NyCus
 1cMHW/2nduNpNMD5QUnj/L9K76zQlnMobGaNkEIemOo65rHW2Xxv3InRoDkJbUVZC48t
 7MrJgDQzZjM+LnqSkzRQWY4I4lkpBCz3h60FjnRhI6pmCBcagKPFtyNXe4mkqCT1XpNu
 HzbA==
X-Gm-Message-State: APjAAAWl3S1zYOlbvqs3WyHM3dFIDfamJc3XaEv0MG6oilk3Tn5INiQb
 OvLn55S38bvzTbORDq19KlxpvrowdELVFpxVW7SJyw==
X-Google-Smtp-Source: APXvYqzEBN2H9VZ16Z4mwW8FIUMGFxbgm0TG+OOaCdEa+aToKNkyeaQ0eeXMPWxqBDZwRDiy9REJgJLNA+FptFypIzk=
X-Received: by 2002:a2e:9ccb:: with SMTP id g11mr2680830ljj.62.1569587874296; 
 Fri, 27 Sep 2019 05:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190823193245.23876-1-laurent.pinchart@ideasonboard.com>
 <20190823193245.23876-4-laurent.pinchart@ideasonboard.com>
 <20190824095421.GC30584@ravnborg.org>
In-Reply-To: <20190824095421.GC30584@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Sep 2019 14:37:42 +0200
Message-ID: <CACRpkdYk8S271X7pV_Vxe7BhL_mScV69Xbet2xyOqF0fFsRdcg@mail.gmail.com>
Subject: Re: DRM_MODE_CONNECTOR_PANEL? [Was: drm/panel: Add and fill drm_panel
 type field]
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eAEcZHLpmnRwpbb9uyGlf2g3EVhIuc00M/7AWO1KNuw=;
 b=vJUKDkYzh33yf5U13Dl1KXTIiUsxYDjjQTCO1hJgN1uHWPgH3CCPT8GJE/sgxs7sB3
 KiGOa7VASYkyx+QjaXcEYFKYZCx0HWfIzu4EqkHvrfRctKa/arvc4YBGKDCrL+w2SWfH
 JhlthrNqZNVmg+Ipvrq9FooOJJRdupTZJs/Qb5ruHkkhhhRUQra0FE3hxRNh8586TCYG
 3oGZWYCdJIeNLWyMzwj7fuwUqEaLeqBAAQmG8VUSRRFBuPuQxMLJJ3VZsredvAnr6S42
 gBtcrwdJQK/CKESddJPtecrOCR/1yfO3EQlHXRnfLz4H3XFN3zxs9G6wlgCBcWeL0S9y
 F2XQ==
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
 Philippe Cornu <philippe.cornu@st.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jsarha@ti.com>,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Purism Kernel Team <kernel@puri.sm>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhIGRyaXZlLWJ5IGNvbW1lbnQ6CgpPbiBTYXQsIEF1ZyAyNCwgMjAxOSBhdCAxMTo1NCBB
TSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgoKPiBXZSB3aWxsIGFsc28g
c3RhcnQgdG8gc2VlIG5ldyBkcml2ZXJzIHdoZXJlIHRoZXJlIHdpbGwgYmUgc3VwcG9ydAo+IGZv
ciBtb3JlIHRoYW4gb25lIHR5cGUgb2YgY29ubmVjdG9yIGludGVyZmFjZS4KPgo+IExpa2UgZm9y
IGV4YW1wbGUgaWxpOTMyMjoKPiAgLSA4LWJpdCBzZXJpYWwgUkdCIGludGVyZmFjZQo+ICAtIDI0
LWJpdCBwYXJhbGxlbCBSR0IgaW50ZXJmYWNlCj4gIC0gOC1iaXQgSVRVLVIgQlQuNjAxIGludGVy
ZmFjZQo+ICAtIDgtYml0IElUVS1SIEJULjY1NiBpbnRlcmZhY2UKCkkganVzdCBmb3VuZCBhbGwg
dGhlc2Ugd2VpcmQgcmVmZXJlbmNlcyB3aGVuIG1ha2luZyB0aGUgSUxJOTMyMiBkcml2ZXIKYW5k
IHRyeWluZyB0byByZWFsbHkgdW5kZXJzdGFuZCB3aGF0IHdhcyBnb2luZyBvbiBpbiB0aGUgaGFy
ZHdhcmUuCkkgaGF2ZSB0aGlzIHNwZWNpYWwgbmFjayAoc2hhcmVkIHdpdGggbWFueSBrZXJuZWwg
ZGV2ZWxvcGVycykgdGhhdCBJCm5lZWQgdG8ga25vdyB3aGF0IGlzIGdvaW5nIG9uLgoKSSB0aGlu
ayB3aGF0IGlzIGFjdHVhbGx5IHRoZSBjYXNlIGlzIHRoYXQgYSAqbG90KiBvZiBwYW5lbHMgdGhh
dCB3ZQpzdXBwb3J0IChlc3BlY2lhbGx5IHRoZSBzby1jYWxsZWQgInNpbXBsZSIgcGFuZWxzKSBh
cmUgYWN0dWFsbHkgY29tcGxleCwKbGlrZSB0aGUgSUxJOTMyMiwganVzdCB0aGF0IG1hbnkgb2Yg
dGhlbSBhcmUgdW5kb2N1bWVudGVkLCBzZXQgdXAgYnkKUk9NIG9yIGJvb3Rsb2FkZXJzLCB0aGVp
ciBTUEkvSTJDIGxpbmVzIGZvcmdvdHRlbiBhYm91dCBhbmQgdGhlCnN1bSByZXN1bHQgYWRkZWQg
YXMgYSAic2ltcGxlIHBhbmVsIiBpbiBwYW5lbC1zaW1wbGUuYy4KClRoaXMgaXMgZmluZSBJIGd1
ZXNzIHRvIGdldCBzb21lIGJhc2ljIHN1cHBvcnQgdXAgYW5kIGdvaW5nLApidXQgYWxsIG9mIGEg
c3VkZGVuIHNvbWVvbmUgd2lsbCB1c2UgdGhhdCBicmlkZ2UvcGFuZWwgd2l0aApzb21lIG90aGVy
IGlucHV0IGZyb20gdGhlIGxpc3QgYWJvdmUgYW5kIG9vb3BzIHdyb25nbHkgbW9kZWxlZCwKdGhl
IERUIGNvbXBhdGlibGUgc3RyaW5nIG1ha2VzIG5vIHNlbnNlIGV0Yy4KCkFsc28gdGhlIElMSTkz
MjIgY2FuIGFjdHVhbGx5IHNldCB1cCBnYW1tYSBjb3JyZWN0aW9uIHdoaWNoIGlzCnZlcnkgbmlj
ZSBmb3IgcHJvZmVzc2lvbmFsIGFwcGxpY2F0aW9ucy4gSSBoYXZlbid0IHNlZW4gYW55IHdheSBm
b3IKRFJNIHRvIGRvIGdhbW1hIGNvcnJlY3Rpb24gcHJvcGVybHkgb3IgYW55IGZyYW1ld29yayBm
b3IgaXQKdG8gYWRqdXN0IGFuZCBwcm9wYWdhdGUgZ2FtbWEgdG8vZnJvbSB1c2Vyc3BhY2UgKHNl
ZW1zIGxpa2UKYW5vdGhlciBlbm9ybW91cyB0YXNrKSwgYnV0IEkgYW0gcHJldHR5IHN1cmUgaXQg
d2lsbCBiZSB0aGVyZSBvbmUKb2YgdGhlc2UgZGF5cyBzbyBJIHB1dCBpbiBzb21lIGNvbW1lbnRz
IGFuZCBwbGFjZWhvbGRlcnMuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
