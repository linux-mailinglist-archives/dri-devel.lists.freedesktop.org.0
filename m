Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA4021532A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B7B6E34A;
	Mon,  6 Jul 2020 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A3C6E059
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 18:41:44 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k23so37082246iom.10
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jul 2020 11:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WMam9KMN4N8PeAEM40GNpNo2zYpfT1xm+vr06Ee2x14=;
 b=AxEabW/lzyZ2qlTf+PHt+KOYjnTp/SIT47axfbz/xNCoCqaeVUM3xzTmWeAcfiLKOW
 jJjegqyiMnpF8BtbFW7UCZm5RajW69M91jc+AUkZfmbju0UwEiLNrwvzGzGn7MkUiORs
 EVUnHKWbUMYyl0brpJVmufSrpUNtsg5n3E69x7mykxozCy/okobAZ7FObIAt05D2CxB/
 FROsqXlr7TddUDivxEFn3CDR6NVi78hVhVM/sYQI6xoT2VVTmliYTXrsCYlRIxOx681N
 HPnMVdz8wcjOw4cehpOuzxOjWNicCwQxlWLOqJtYFFPtup93zarw2kE9POpsdJXATGNn
 oE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=WMam9KMN4N8PeAEM40GNpNo2zYpfT1xm+vr06Ee2x14=;
 b=SiIn4EgqJ9IQGFk5McZL17K0P+htWRWPH4rMRkwS0AZAZbCyJmdU9xurwsLGDV0udv
 rizhZ99xAsE9/OAP43uG6H1q6QAhXJoHP/G9m1jtvYg4jTTh201dGEoarDAM7P6Vc7Bv
 7UlBnsmVB4bpv26Yoj34EmSvWxMyJzg/Czlt44N/wDxBu6SCUzpg7+HkX0YSIXUAn4i1
 EWJAcbuXnd5c9vS5RZBxeJEcOub6t3PjEKtgWFFogFo3sLTy5mKUf7HY9Tfgp2/c9AHz
 VsbrA9scDWAZ4al4xhvLIczTbBmKk7RfKdNv0iSfbQ4hxqs4EUwEzojJaVLYAYJ0HqSs
 6nUg==
X-Gm-Message-State: AOAM5323hhZp/etkeVbpU7bOZTt3bLAMSz9vVC4uCnV5NljZnA5q0cUr
 5YKUUOLfTNB1un/pSekAstUnZ5S3sCnfC0gpMXw=
X-Google-Smtp-Source: ABdhPJxK/S7BemaC7I1AoTKGocPOpRoy6dfNruNY70JrVKJMhu9vEH11u0LMDqGDvyIyydjnFOGfcx6Z3KHCmPW0okY=
X-Received: by 2002:a05:6638:252:: with SMTP id
 w18mr37241264jaq.42.1593974504022; 
 Sun, 05 Jul 2020 11:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200705065917.22285-1-lukas.bulwahn@gmail.com>
 <20200705113017.mostxjvatkqkhqf6@core.my.home>
In-Reply-To: <20200705113017.mostxjvatkqkhqf6@core.my.home>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 5 Jul 2020 20:41:33 +0200
Message-ID: <CAKXUXMz_usPZw5-UPLxSqBRVP4-RFZTLO-tt5pEfiTPrxifFWg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust entry to renaming and conversion
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, 
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgNSwgMjAyMCBhdCAxOjMwIFBNIE9uZMWZZWogSmlybWFuIDxtZWdvdXNAbWVn
b3VzLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBMdWthcywKPgo+IE9uIFN1biwgSnVsIDA1LCAyMDIw
IGF0IDA4OjU5OjE3QU0gKzAyMDAsIEx1a2FzIEJ1bHdhaG4gd3JvdGU6Cj4gPiBDb21taXQgYTc0
ZTgxYTU2NDA1ICgiZHJtL3BhbmVsOiByb2NrdGVjaC1qaDA1N24wMDkwMDogUmVuYW1lIHRoZSBk
cml2ZXIgdG8KPiA+IHN0NzcwMyIpIGFuZCBjb21taXQgNzMxN2Y0NTc0NDkyICgiZHQtYmluZGlu
Z3M6IHBhbmVsOiBDb252ZXJ0Cj4gPiByb2NrdGVjaCxqaDA1N24wMDkwMCB0byB5YW1sIikgcmVu
YW1lZCBhbmQgY29udmVydGVkIHRoZSBmaWxlcyBtZW50aW9uZWQgaW4KPiA+IERSTSBEUklWRVIg
Rk9SIFJPQ0tURUNIIEpIMDU3TjAwOTAwIFBBTkVMUywgYnV0IGRpZCBub3QgYWRqdXN0IHRoZSBl
bnRyaWVzCj4gPiBpbiBNQUlOVEFJTkVSUy4KPgo+IEEgc2ltaWxhciBwYXRjaCB3YXMgYWxyZWFk
eSBwb3N0ZWQ6Cj4KPiBodHRwczovL2xrbWwua2VybmVsLm9yZy9sa21sLzIwMjAwNzAxMTg0NjQw
LjE2NzQ5NjktMS1tZWdvdXNAbWVnb3VzLmNvbS8KPgoKVGhhbmtzLCBPbmRyZWouIFRoaXMgcGF0
Y2ggcG9zdGVkIGhlcmUgc2hhbGwgYmUgSUdOT1JFRC4KCkx1a2FzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
