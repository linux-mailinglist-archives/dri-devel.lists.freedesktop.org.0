Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F4297F3
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978C6E0E3;
	Fri, 24 May 2019 12:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ACF6E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:23:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id n22so6972679lfe.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 05:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C+myfdGRYFPLLSybMtkNtVx2Tt/XQimBNXiCQ/VdObg=;
 b=DBENCBgHshEdZpyX3Lw2fX4gLHsrdoGf58BuamLyR9IKZl+25VukdlMrf8GPTnc1/z
 75L0zeFJNdlXtHDuUH+ATPuZvVVC4c9JAbJ3U+ey7ZDeAdgG2Isr/tsvNs88S38+EWg0
 BqVaoRv1/XCxygvW0KFUU6XIdrJtYX6Ua8vyDW+4pK4K8YAQrHva5Uv4R6IR8ggBuQgB
 IFkRRp6vy/maQ7GaaZ2krp4NVyi1qS1IawvHDQlw6Gw+KKJLWKfP7VUbhBQ4zY9KdY5z
 BdERnYnW3Ntm5ExakKagQS8as4/4wuFU6qZYgpiFFqBIN/s2t9fVhhlkVKluaSFtvkS1
 fLnA==
X-Gm-Message-State: APjAAAXQh26S94SA7auTQvzq1uVofY0mafn1wlp0uw/qagn1fcLBvjDv
 GSpwsAJHr+OOO7Y0MR7xy6zjcaikDG3pv/Yvjm0=
X-Google-Smtp-Source: APXvYqzNQQPTSEiT9TgbJ91HH92JPe3O9NL20r1waVsd3eYrkSbkO8SrKpooDjZEBXWcbK0tw4yY2uokVzdzBVZa5zc=
X-Received: by 2002:ac2:4428:: with SMTP id w8mr46274166lfl.99.1558700610795; 
 Fri, 24 May 2019 05:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557657814.git.agx@sigxcpu.org>
 <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
In-Reply-To: <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 24 May 2019 09:23:30 -0300
Message-ID: <CAOMZO5BaFYJxh1v46n2mdPyc+-jg6LgvoGR1rTE+yHZg_0Z8PA@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Kishon Vijay Abraham I <kishon@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C+myfdGRYFPLLSybMtkNtVx2Tt/XQimBNXiCQ/VdObg=;
 b=hZ0bD/CUdsrgatmNXy5higdZbx3OSCJT8sw3LgkqkYgqbLtDn/gLs9c3g8mirUEDrG
 l+4o7a9TAxKLDBrPxE1t79fM9XPEqezMkBejfXLFW1INWkfF6OniubiwX8l6JtdYRW5M
 tFXRga1iZyPaMA5IfgLcUNsVq0/n8CPAA7ngiZ2vlfacytZlLloQGm7izI50MYXleqvm
 ISGNwOfcAGX8Xe6oTUH7CHfM9HQ/3MXe5c0F3fumRQ20D6mMK9Uiok4uhyMArRoFFH+q
 u4G3Opyv18dM583Kp0bxWnPFYDg/9AdqBdoV4pWXcATSuvokXHnSxlg9lkFRrlKRVbRQ
 1utQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Li Jun <jun.li@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Abel Vesa <abel.vesa@nxp.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2lzaG9uLAoKT24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgNzo0OSBBTSBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPiB3cm90ZToKPgo+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciB0aGUg
TWl4ZWwgRFBIWSBhcyBmb3VuZCBvbiBpLk1YOCBDUFVzIGJ1dCBzaW5jZQo+IHRoaXMgaXMgYW4g
SVAgY29yZSBpdCB3aWxsIGxpa2VseSBiZSBmb3VuZCBvbiBvdGhlcnMgaW4gdGhlIGZ1dHVyZS4g
U28KPiBpbnN0ZWFkIG9mIGFkZGluZyB0aGlzIHRvIHRoZSBud2wgaG9zdCBkcml2ZXIgbWFrZSBp
dCBhIGdlbmVyaWMgUEhZCj4gZHJpdmVyLgo+Cj4gVGhlIGRyaXZlciBzdXBwb3J0cyB0aGUgaS5N
WDhNUS4gU3VwcG9ydCBmb3IgaS5NWDhRTSBhbmQgaS5NWDhRWFAgY2FuIGJlCj4gYWRkZWQgb25j
ZSB0aGUgbmVjZXNzYXJ5IHN5c3RlbSBjb250cm9sbGVyIGJpdHMgYXJlIGluIHZpYQo+IG1peGVs
X2RwaHlfZGV2ZGF0YS4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2ln
eGNwdS5vcmc+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFz
QG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0Bu
eHAuY29tPgo+IFJldmlld2VkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCldvdWxkIHlv
dSBoYXZlIGFueSBjb21tZW50cyBvbiB0aGlzIHNlcmllcywgcGxlYXNlPwoKVGhhbmtzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
