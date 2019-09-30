Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443DC2DD6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32956E50C;
	Tue,  1 Oct 2019 07:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F7789308
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 22:45:00 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id j11so1157219plk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 15:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cK5Fghk/yA6wH8i7i1QdxuNjNjer/uYW7DYZEo/GN74=;
 b=EKwu8grs1QvIPZ8/aqZSHIw/Y1opnwGbNRE3L2tgBkpZwq2ZNF+UqoVhMllGOLxOaI
 +wqA/ecl79vEEGxNzGy/WDPefJU8oPqO41tC3uo3BXrHhZNyCLZ1Ep1p48uHJfjSbcds
 1iYgIwA+odW88fhlJ+SEJ4fhsjxx4q+5yLd+PpRIgA78rg5QzrNQq8kAJAiJt9BUgGZF
 iGtrtTU235f+27roHoGMptsESeIS/XP+Pp9DDvHJD2qeAsIwMiDPvBwm0rnFS7YvJ7cw
 PRwUfT6qw1zDdYaViK6iI0/0BRpUCmtdQRSBn8V2Sk5RrxxdtaMRrzc3XrQrTZQzfvVT
 y3EQ==
X-Gm-Message-State: APjAAAVNLsBv6TW4jkXJ7dhLSieSjef71T6Rrb2Lf1Mw5TYfNexvMJiX
 iafpU2sRjPa/yNjYZpiRubQ=
X-Google-Smtp-Source: APXvYqzpfrf1XrfBF5s/NlyYg1/o1Be4cDh58aR3YEzX+PU8lIPJMJmjlArWpf2bHK26A22NPfYSfw==
X-Received: by 2002:a17:902:b949:: with SMTP id
 h9mr8215703pls.35.1569883499500; 
 Mon, 30 Sep 2019 15:44:59 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id y7sm12632755pfn.142.2019.09.30.15.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 15:44:58 -0700 (PDT)
Date: Mon, 30 Sep 2019 15:44:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/11] Add support for software nodes to gpiolib
Message-ID: <20190930224456.GV237523@dtor-ws>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <CACRpkdb=s67w2DCGubhbLQTtxpWtiW8S1MECMO4cvec=bF6OdA@mail.gmail.com>
 <20190917002207.GJ237523@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917002207.GJ237523@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cK5Fghk/yA6wH8i7i1QdxuNjNjer/uYW7DYZEo/GN74=;
 b=UsyIMUg00LtJE64A4LiLe6eJzVF1zL6nphsK2U/Q2IqWrZP53dG4q1VEndLOUOYNYn
 5SEp3DRw3l7cXZ1osu3JlTEVDyzECiVpf9CZRZ+qF7EK8okwLv7gA5HXg3vLTVgj3toJ
 oE3oSQHrwjSgFSD6WS0XcDb/z8Q0ATme8RO9xD/byhPytcMAtRt6rhOoarHWAyjEK9hN
 OSXg/8HIwuMV/3mcDLh2yRcG3pIL2Lh/Pl+OTPlEuxgZKB0ZkFhU5n00g3bZjnQ7tiIL
 XXhd2dPfa8WSw2dXTy1o38zQlEVtZweCcrWF0Ce7wmvm/rWPWuzJjX7/TE1vyxfptElF
 18ZQ==
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, netdev <netdev@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsCgpPbiBNb24sIFNlcCAxNiwgMjAxOSBhdCAwNToyMjowN1BNIC0wNzAwLCBEbWl0
cnkgVG9yb2tob3Ygd3JvdGU6Cj4gT24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTA6NTU6NDdBTSAr
MDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDExLCAyMDE5IGF0IDg6
NTIgQU0gRG1pdHJ5IFRvcm9raG92Cj4gPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiAKPiA+ID4gSWYgd2UgYWdyZWUgaW4gcHJpbmNpcGxlLCBJIHdvdWxkIGxpa2UgdG8g
aGF2ZSB0aGUgdmVyeSBmaXJzdCAzIHBhdGNoZXMKPiA+ID4gaW4gYW4gaW1tdXRhYmxlIGJyYW5j
aCBvZmYgbWF5YmUgLXJjOCBzbyB0aGF0IGl0IGNhbiBiZSBwdWxsZWQgaW50bwo+ID4gPiBpbmRp
dmlkdWFsIHN1YnN5c3RlbXMgc28gdGhhdCBwYXRjaGVzIHN3aXRjaGluZyB2YXJpb3VzIGRyaXZl
cnMgdG8KPiA+ID4gZndub2RlX2dwaW9kX2dldF9pbmRleCgpIGNvdWxkIGJlIGFwcGxpZWQuCj4g
PiAKPiA+IEkgdGhpbmsgaXQgc2VlbXMgYSBiaXQgZW50aHVzaWFzdGljIHRvIGhhdmUgbm9uLUdQ
SU8gc3Vic3lzdGVtcwo+ID4gcGljayB1cCB0aGVzZSBjaGFuZ2VzIHRoaXMgY2xvc2UgdG8gdGhl
IG1lcmdlIHdpbmRvdyBzbyBteSBwbGFuCj4gPiBpcyB0byBtZXJnZSBwYXRjaGVzIDEuMi4zICgx
IGFscmVhZHkgbWVyZ2VkKSBhbmQgdGhlbiB5b3UgY291bGQKPiA+IG1hc3NhZ2UgdGhlIG90aGVy
IHN1YnN5c3RlbXMgaW4gdjUuNC1yYzEuCj4gPiAKPiA+IEJ1dCBpZiBvdGhlciBzdWJzeXN0ZW1z
IHNheSAiaGV5IHdlIHdhbnQgZG8gZml4IHRoaXMgaW4gbGlrZSAzIGRheXMiCj4gPiB0aGVuIEkn
bSBnYW1lIGZvciBhbiBpbW11dGFibGUgYnJhbmNoIGFzIHdlbGwuCj4gCj4gTm8sIGlmIGl0IGlz
IHN0aWxsIGhhcyBhIGNoYW5jZSBmb3IgLXJjMSB0aGVuIEknbSBnb29kLiBJIHdhcyB0aGlua2lu
Zwo+IGlmIGl0IGRvZXMgbm90IGdvIGludG8gLXJjMSBJIGNvdWxkIGNvbnZpbmNlIHNvbWUgb2Yg
dGhlbSBtZXJnZSBhCj4gdGFyZ2V0ZWQgaW1tdXRhYmxlIGJyYW5jaCBvZmYgLXJjOCBvciA1LjMg
ZmluYWwgYW5kIHRoZW4gYXBwbHkgcGF0Y2hlcwo+IHJlbGV2YW50IHRvIHRoZWlyIHN1YnN5c3Rl
bXMgc28gd2UgZG8gbm90IGhhdmUgdG8gd2FpdCB0aWxsIDUuNiB0byBsYW5kCj4gZXZlcnl0aGlu
Zy4KClNvIEkgZ3Vlc3Mgd2UgbWlzc2VkIC1yYzEuIEFueSBjaGFuY2Ugd2UgY291bGQgZ2V0IGFu
IGltbXV0YWJsZSBicmFuY2gKb2ZmIC1yYzEgdGhhdCB5b3Ugd2lsbCBwdWxsIGludG8geW91ciBt
YWluIGJyYW5jaCBhbmQgSSBob3BlZnVsbHkgY2FuCnBlcnN1YWRlIG90aGVyIG1haW50YWluZXJz
IHRvIHB1bGwgYXMgd2VsbCBzbyB3ZSBkbyBub3QgbmVlZCB0byBkcmFnIGl0Cm92ZXIgMisgbWVy
Z2Ugd2luZG93cz8KClRoYW5rcy4KCi0tIApEbWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
