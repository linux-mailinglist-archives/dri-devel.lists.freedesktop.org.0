Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B286A4561B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C57989916;
	Fri, 14 Jun 2019 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0674892E6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:51:18 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id d17so365245oth.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzp+WBHTFj1dREBw3t3t7ReTuxWbFCihELagRi77eaI=;
 b=MEb3YvGzqISlQtk0XvcCmKAjTpzhJGYj2jogIP4LxO66J4OxVYb4Q6sOx43FMtLaF2
 3o8KXIl67hdb5AWfCQmrzrGIZg/xL0Uu8Y4Y8E86SqFrhi1xoYfuTwIM5bomnorwfT0a
 ncO+1jnkLXbezSIAeaJTE2X4tStMxsJvBwZIcZDeO1wbJi9BOkblUTHgiQxxjk3+16JA
 +mSX7IX+Qea2RCg73d+eWA56+T0rWxR68NGvB7WNFvuhD58uyV8q7pJhe59zZ+NOk+f4
 Z1TLIWr1RriuX8rHuHITNP9kHhTU13PLJVgOPzpZrI8chBWfKCl0fuF0vOK6t8XKwYrc
 Zvxg==
X-Gm-Message-State: APjAAAUWsQ6A14VIoKecTe1Ixe5Xh1n47XLPWhDi+SKyY2Z3Jdjk+E5y
 yx7KCwdVG9veE3+CpyRDrwhWkrUHrjWdMdOthDo=
X-Google-Smtp-Source: APXvYqwEsz1YO1yjz7A0MEeM4kI0w2whLRKreOWn6G3jQyk4JbC9KFj0qpeHxm470LfOyu3DsqJQKUmNF0YLPjjj1nA=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr5936856otk.232.1560455477770; 
 Thu, 13 Jun 2019 12:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
In-Reply-To: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 13 Jun 2019 15:51:06 -0400
Message-ID: <CAGngYiVVa8WqQebDpV5ZUrc433LcEWAuvMFCFimq5ku9ij4CHQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] tda998x updates
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yzp+WBHTFj1dREBw3t3t7ReTuxWbFCihELagRi77eaI=;
 b=KQ73XNXMqox8e1yPd8gwdp4b6Us1DMae3gvdzWuOBwkJRMEuXmmsQU2mfaY9WsvrLa
 4ykCplxvIpt+Oj1PCk0dn0AgZj8aWchcBmSFmgMFlQk8GXJDz8CspP9ATTeQF7zQJV92
 9Fk2IpCH09l06zjdO/MBfFPm20tDnDCbXnCZxYm6/4OI3E73+7tdWDttjiT6jNDf7QQf
 N1wDt82ysKk1ukSXiG7nQzflWtpl1Gnvlxq0pRDQGadT9cMPZTki2/7CHliwWqB0C+Md
 jW6YVdEWNZ0FLXZIlEFrZuceFdfRfBo101np/ep8s3GtkX43W9pGm1eH9+s0bY8Igzcg
 mhkQ==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTA6MjkgQU0gUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4
IGFkbWluCjxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgcmVw
cmVzZW50cyBkZXZlbG9wbWVudCB3b3JrIGNvbGxlY3RlZCBvdmVyIHRoZSBsYXN0IHNpeAo+IG1v
bnRocyB0byBpbXByb3ZlIHRoZSBUREE5OTh4IGRyaXZlciwgcGFydGljdWxhcmx5IGZvciB0aGUg
YXVkaW8KPiBzaWRlLiAgVGhlc2UgcGF0Y2hlcyBjYW4gYmUgZm91bmQgaW4gbXkgImRybS10ZGE5
OTh4LWRldmVsIiBicmFuY2gKPiBhdCBnaXQ6Ly9naXQuYXJtbGludXgub3JnLnVrL35ybWsvbGlu
dXgtYXJtLmdpdAoKRm9yIHRoZSB3aG9sZSBwYXRjaHNldCwgYWZ0ZXIgJ2hhY2tpbmcnIHRoZSBi
Y2xrX3JhdGlvIHRvIGNvcnJlc3BvbmQgd2l0aApteSBpbXg2cSBzc2kncyB3aXJlIGZvcm1hdDoK
ClRlc3RlZC1ieTogU3ZlbiBWYW4gQXNicm9lY2sgPFRoZVN2ZW43M0BnbWFpbC5jb20+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
