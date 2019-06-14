Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95368452A7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE8989304;
	Fri, 14 Jun 2019 03:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D6889304
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:19:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d4so1253524edr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPwG/+sK6rrlYN0ObMy3YjCUZytnPkU+C+L+wuAauYY=;
 b=q+gZZXl6ejnSUBc8F1TK5J4UIrDTgbL9XhGjPzFcZHvdVqKNp02qZUOgOZ7I7iTrKt
 AviioACU6QWHEBIke8wppoDqwu0NTF6i+t/HWFA+4cHoECsdXSKlPDSO8CeI7fKwd1qs
 OG62staS9P4npqYzK7O/lb2HiiZGMq9nqNUifqqVpoENS7TOHK9lgOOwDKqMnM6p/XpL
 oT+S6rrQhCJTMewTJTA4hnBTYY3R0rTllika2UTdbky0JlyOgI7Jy0rDQxuefHDggjBs
 /PBGrW42Cka8tRrTGdG4ID76xJFtXSMUNex7vgRxWCexxrvsPjqIocbtcSSRuadxWpJQ
 m1WA==
X-Gm-Message-State: APjAAAUOgLlUuVyMCTB7y+tAlY4j5oEIgI8VJZW4PDs4S1jGYCroIpb3
 Z+2hO0r+N5OeaXl89iWtJ5VzTu0gDEA=
X-Google-Smtp-Source: APXvYqy60bIKBhC3MyKd0sY5KcmQRHWcTeOKx9bT8fOpHQZN0p8wUw99croMG4Y+BEPUihKEaMtrYw==
X-Received: by 2002:a17:906:5399:: with SMTP id
 g25mr63766654ejo.247.1560482356772; 
 Thu, 13 Jun 2019 20:19:16 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id z40sm473762edb.61.2019.06.13.20.19.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 20:19:16 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id n4so835186wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:19:16 -0700 (PDT)
X-Received: by 2002:adf:fd01:: with SMTP id e1mr2697971wrr.167.1560482355808; 
 Thu, 13 Jun 2019 20:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-3-jagan@amarulasolutions.com>
In-Reply-To: <20190613185241.22800-3-jagan@amarulasolutions.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 11:19:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
Message-ID: <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/9] drm/sun4i: tcon: Add TCON LCD support
 for R40
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo1MyBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBUQ09OIExDRDAsIExDRDEgaW4gYWxsd2lubmVyIFI0
MCwgYXJlIHVzZWQgZm9yIG1hbmFnaW5nCj4gTENEIGludGVyZmFjZXMgbGlrZSBSR0IsIExWRFMg
YW5kIERTSS4KPgo+IExpa2UgVENPTiBUVjAsIFRWMSB0aGVzZSBMQ0QwLCBMQ0QxIGFyZSBhbHNv
IG1hbmFnZWQgdmlhCj4gdGNvbiB0b3AuCj4KPiBBZGQgc3VwcG9ydCBmb3IgaXQsIGluIHRjb24g
ZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0
aW9ucy5jb20+CgpSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
