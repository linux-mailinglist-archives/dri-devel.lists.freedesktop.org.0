Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B022FECBB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 15:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EAE6E8B8;
	Thu, 21 Jan 2021 14:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5833B6E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 14:17:55 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f4so1770570ljo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 06:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qTWjoxSYUi4JL7bGI6mfUa/FE+ddTQPHgoii5uzinw0=;
 b=MfQrvkEZK9CkOFzUT8cOGuJ6bH8ktiBx14mSDSXrvWsZpQHpVcQH3oqhZkf02lJF0C
 Fawh5Yj42LIU4ovM2ZcxYgMFbrH7e+8xzu+RRpGB5kK0gxuyQAacbPRoVpQOGBxubkuv
 DtPe5FJRwE0fvVXkS2m6LIwTEd4pqFPCDMm1KUE1dpTR86T5M7+a/HcgMDT77MIYRAzc
 QHApmZahkmLmhcobgWFK7LJJcoJYtaE2FGcXjCUUvuIFQxajNOwAs+Dho48CrkhVwIJE
 b5jHi0XPOrSspT+N/DMLeU/HSPr2Yj9MoBMhY4uF83wL1YF1squYKfYXhqI/WtjwJ1Ey
 ddTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qTWjoxSYUi4JL7bGI6mfUa/FE+ddTQPHgoii5uzinw0=;
 b=keEAqAPIKCGGU1chFzyxnvL9XCmIcRLdkrrlbVbKuVnRZeBRnCei0ZcZrmhDbyebIa
 Yolotk70F6EiU9maCdg2PdYHiVnKJIB8zFnZyHoLBkn1OR/fs6RteXepBUNJtdoWIFNR
 p+UaLjoDdskg/RsLqtNgQDIc33p24i09SjFrg3RZMPK6zfdTtJkgXtUzpmZnx8ioRTjy
 j4/ljBqnqexJvWgkQPwtNZZ4j8mQXKmUGppH72HB+Y6wyvOgTBfsbdorpYcybpciCwYo
 0BDHVEuQfuWk99Uvd9RHts87KVcFs5zvf4ynScQ4hd5ZVgDirEJ2eV+NtP6a3GKbolTJ
 kzEg==
X-Gm-Message-State: AOAM531aDGJDBUifqIXEdsTRaTI16aWTRU1U+Gq6YESUpKL9SvXF6WU9
 G9dIDPYjHrGNXWrWW7Zd658PDr3qW2GgHd5vmaI=
X-Google-Smtp-Source: ABdhPJx93WQ8CoZI8mE7J68rG71XZsqOVgjBEeJUDpRKtaIMDc+3RuxzVQHDmOsEOMzo8NVMKPVAttXNgcLqJcxtfB4=
X-Received: by 2002:a2e:b556:: with SMTP id a22mr6794328ljn.264.1611238673776; 
 Thu, 21 Jan 2021 06:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20210121061141.23062-1-o.rempel@pengutronix.de>
 <20210121061141.23062-7-o.rempel@pengutronix.de>
In-Reply-To: <20210121061141.23062-7-o.rempel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Jan 2021 11:17:42 -0300
Message-ID: <CAOMZO5C6RM2vEMFJB-+Nen1Et8wn39JJVM1UcOcar0aMebKykQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ARM: dts: imx6dl-prtvt7: fix PWM cell count for
 the backlight node.
To: Oleksij Rempel <o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgT2xla3NpaiwKCk9uIFRodSwgSmFuIDIxLCAyMDIxIGF0IDM6MTIgQU0gT2xla3NpaiBSZW1w
ZWwgPG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEF0IHNvbWUgcG9pbnQgUFdN
IGNlbGwgY291bnQgd2FzIGNoYW5nZWQsIGJ1dCBpdCBkaWRuJ3QgdHJpZ2dlcmVkIGFueQoKSXQg
Y2hhbmdlZCBpbiB0aGlzIGNvbW1pdDoKCmNvbW1pdCBmYTI4ZDgyMTJlZGU5YzUzM2FlODdhNzM3
NTcxYTlkM2IzZWViYjI5CkF1dGhvcjogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KRGF0ZTogICBGcmkgSnVsIDEwIDA3OjE5OjM3IDIwMjAgKzAyMDAK
CiAgICBBUk06IGR0czogaW14OiBkZWZhdWx0IHRvICNwd20tY2VsbHMgPSA8Mz4gaW4gdGhlIFNv
QyBkdHNpIGZpbGVzCgogICAgVGhlIGlteC1wd20gZHJpdmVyIHN1cHBvcnRzIDMgY2VsbHMgYW5k
IHRoaXMgaXMgdGhlIG1vcmUgZmxleGlibGUgc2V0dGluZy4KICAgIFNvIHVzZSBpdCBieSBkZWZh
dWx0IGFuZCBvdmVyd3JpdGUgaXQgYmFjayB0byB0d28gZm9yIHRoZSBmaWxlcyB0aGF0CiAgICBy
ZWZlcmVuY2UgdGhlIFBXTXMgd2l0aCBqdXN0IDIgY2VsbHMgdG8gbWluaW1pemUgY2hhbmdlcy4K
CiAgICBUaGlzIGFsbG93cyB0byBkcm9wIGV4cGxpY2l0IHNldHRpbmcgdG8gMyBjZWxscyBmb3Ig
dGhlIGJvYXJkcyB0aGF0IGFscmVhZHkKICAgIGRlcGVuZCBvbiB0aGlzLiBUaGUgYm9hcmRzIHRo
YXQgYXJlIG5vdyB1c2luZyAyIGNlbGxzIGV4cGxpY2l0bHkgY2FuIGJlCiAgICBjb252ZXJ0ZWQg
dG8gMyBpbmRpdmlkdWFsbHkuCgogICAgU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KICAgIFNpZ25lZC1vZmYtYnk6IFNoYXdu
IEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
