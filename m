Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECDE10F970
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AB16E40D;
	Tue,  3 Dec 2019 08:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213946E33A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 20:52:05 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k24so1009026ioc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 12:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKoJSkDsfIMrRW3jw85HKe2BQZ9NViBue+DgpdqXPJk=;
 b=a88EWgarL5wx1gi3HHOeorj28FnmPhPmcxT011LtgvpRKeTej8z3q9VP4A5YAetE/M
 fG3xFCAaeATjI3x6zO4LfsYmzfjmIviMRZwQBSpRPfV8XzYJFSMtA3Z7DURVw2LS8Qnb
 mbeXJDTuhqj07rWUxu9HBvLuQjVaH/ThIM/ZpQ3C22HIlXEojUAqnBO1HK2XuNtyrH+7
 YcWfk8/gHD2LvbKmcHMMPC/OX8KavcSgoOvzz1dautHlfAmsR+OcNF/7CInyM1hAs6IS
 RnZDbxu3fUDQDhquwH6ynUySWO6HCksjvcxrrXFuBi81E/qdC4koyv1EoWswNhEKCayv
 PnLw==
X-Gm-Message-State: APjAAAVRbD+F+49KMfQbfB8dYDYQroqSJ7miOSjagh3C9xeok/KJPOAa
 kyJjXB6TRSsdUcU+4SiyPKliaOoe+Udkk7+dtnI=
X-Google-Smtp-Source: APXvYqzWJF+0Ki7M75FXoNw5UEUbhPWmgMVsemvAdnlzFn4gnf/vkOuGYX8u/xhrshBT2ODP7R8nZZfzmzkVwC/iQMQ=
X-Received: by 2002:a6b:5914:: with SMTP id n20mr744400iob.42.1575319924442;
 Mon, 02 Dec 2019 12:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <CAOCk7NoKPoxcETLYQ4CyAtYGnPwvYapdSavZM=aRdswDydTLEA@mail.gmail.com>
 <20191202204802.GA23600@ravnborg.org>
In-Reply-To: <20191202204802.GA23600@ravnborg.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 2 Dec 2019 13:51:53 -0700
Message-ID: <CAOCk7NogV39X2QMabv1naso4r7T_EkdzajcbtoPzQnJQ5T7WoQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yKoJSkDsfIMrRW3jw85HKe2BQZ9NViBue+DgpdqXPJk=;
 b=jn5nPOdzEW+w5jzVGwuZ5oFeYEJf8WBlojzcbzo0FpQpz8lU3xlwetOymXe33RV0vU
 rZIUB8uzWSed5dAOZ1mQV8JCVBog+b8KG4/DzRaXJXK6jqkoWbOhqSlwP5HgyP7tpA1F
 sZOxbnADrE1RzNLnPdosncLvIUYhSNdiY5DzW7oxY59mP20Eg/u0Prwm4gBh32Q/n4J9
 GV8x5s3ajEkkySKLDzpqU3t0idoZb/hk/zqyucuqOWZLmopIcohvyGZ0mCdu/5Fjm4V6
 91n5ODv3rGa/fc60puo1AB0cc1S+Tf15xJgp0UInowtD9CGErLbGPkAFEeLQiB55Jmxs
 HKBQ==
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCAxOjQ4IFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBKZWZmcmV5Lgo+Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9kc2lfbWFuYWdlci5jICAgICAgICAgICAgICB8ICAgMiArLQo+ID4KPiA+IEhvdyBjb21l
IHRoZSBkaWZmIHN0YXQgaW4gdGhlIGNvdmVyIGxldHRlciBoZXJlIGluZGljYXRlcyBhIGNoYW5n
ZSB0bwo+ID4gdGhpcyBmaWxlLCB5ZXQgSSBjYW5ub3QgZmluZCBhIGNoYW5nZSB0byB0aGlzIGZp
bGUgaW4gYW55IG9mIHRoZQo+ID4gcGF0Y2hlcz8gIFdoYXQgYW0gSSBtaXNzaW5nPwo+Cj4gVGhp
cyBmaWxlIGlzIHBhdGNoZWQgaW4gIltQQVRDSCB2MSAwNi8yNl0gZHJtL3BhbmVsOiBkZWNvdXBs
ZSBjb25uZWN0b3IKPiBmcm9tIGRybV9wYW5lbCIKPgo+IFNlZTogaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktRGVjZW1iZXIvMjQ3MTg2Lmh0bWwK
Pgo+IFRoZSBhYm92ZSBwYXRjaCB0b3VjaGVzIGEgbG90IG9mIGZpbGVzL2RyaXZlcnMgc28gaXQg
d2FzIGNjOiB0bwo+IGEgbG90IG9mIHBlb3BsZS4gTWF5YmUgaXMgd2FzIGNvbnNpZGVyZWQgYXMg
c3BhbT8KCkludGVyZXN0aW5nLiAgSSBtaXNzZWQgdGhhdCBJIGRpZG4ndCBoYXZlIHBhdGNoIDYg
aW4gdGhlIHNlcmllcyBpbiBteQppbmJveC4gIEl0cyBhbHNvIG5vdCBpbiBteSBzcGFtIGJveC4g
IEkgd29uZGVyIHdoZXJlIGl0IHdlbnQuCgpUaGFua3MgZm9yIHRoZSBkaXJlY3QgbGluayB0byB0
aGUgcGF0Y2guICBJIHNhdyBubyBjb25jZXJucy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
