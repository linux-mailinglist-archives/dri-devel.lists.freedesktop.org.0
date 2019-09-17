Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C16B4805
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692436EAEA;
	Tue, 17 Sep 2019 07:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAE66EAB7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 00:22:11 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 4so943606pgm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 17:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gHvCS0WVH6nxYtiVa7cmozt6ck7gFLQffDaRFaPUffg=;
 b=PjLjp27FJtKPrP5toE/NTMnUdNgoX3hozLC7V2gvzvYYYfWWsTDuMnoQtIlVZZAzNs
 Kw0YXRIjsuFU+JeTva0A2AT58q+Ig+J/R6Yt0fTsG2ylxV05WY3g0CaOcvx3HF94vDDl
 u5zhqhzupyieXRMoxJYx0inb0iZaWsorQwkLjunHLupHZJTGil6CywOkqQBXaVj7JlHu
 fTt5EvMwN0Q+F1fKMwJwpuWvNAeoH9u47olvE+dBp5Z8fnp4bTNDqf2G7Pft2m/OIEJ7
 WuZIRPhSaXYdt+vm9X01oQmguLQ2v1mH6gILYz0g56+79bYJ4ACKEMsnb4y92WvnlaP3
 LtdA==
X-Gm-Message-State: APjAAAV2/HRuvnI6JtghDUVz9nKqQmCO/5BLtIEAd73bj0SfzB7teRyH
 1MlnUxLAPP99ncX94fgl+ys=
X-Google-Smtp-Source: APXvYqzJ6FqLP4djoh9LqAiR2iEtYD5Kkz7MksbyKf2l/vz2NaL/A51k9HEdd9SWkQezPbEFKC3CUg==
X-Received: by 2002:a17:90b:f15:: with SMTP id
 br21mr2033808pjb.101.1568679730699; 
 Mon, 16 Sep 2019 17:22:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id q204sm288345pfq.176.2019.09.16.17.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 17:22:09 -0700 (PDT)
Date: Mon, 16 Sep 2019 17:22:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/11] Add support for software nodes to gpiolib
Message-ID: <20190917002207.GJ237523@dtor-ws>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <CACRpkdb=s67w2DCGubhbLQTtxpWtiW8S1MECMO4cvec=bF6OdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdb=s67w2DCGubhbLQTtxpWtiW8S1MECMO4cvec=bF6OdA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gHvCS0WVH6nxYtiVa7cmozt6ck7gFLQffDaRFaPUffg=;
 b=JVYTowaLIzs55a08OwW7+1LUrzAWD08aN31/PaXOCbf6VJrKyRw4oxkO/HMDjDR2Ss
 VHJccL1WXw1Ard7nTI5inozA2xt6smVM7TWC0xWkmOUizHgkmg2IxsTHXbmBRn7U9MaG
 sqC8VPO3gCq40qVaeqVxB9vl67T+JNzolQGp7v86oNyTji1s6fXImtuUNR6vP0yVQA/q
 y+PxowdPxsSw0cY2njZ6lrxTEd1a7SFUHK63b5NDecQDSzmdrsIjn9QcIhvEGPJ30yko
 udvbDp0GzntKTVqq5pmxkwTz0ePE4jzL9WXbpT3+yprF7IQfOcPDo1gaMVWn/LyZKt1B
 OikA==
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

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTA6NTU6NDdBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBXZWQsIFNlcCAxMSwgMjAxOSBhdCA4OjUyIEFNIERtaXRyeSBUb3Jva2hvdgo+
IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPiB3cm90ZToKPiAKPiA+IElmIHdlIGFncmVlIGlu
IHByaW5jaXBsZSwgSSB3b3VsZCBsaWtlIHRvIGhhdmUgdGhlIHZlcnkgZmlyc3QgMyBwYXRjaGVz
Cj4gPiBpbiBhbiBpbW11dGFibGUgYnJhbmNoIG9mZiBtYXliZSAtcmM4IHNvIHRoYXQgaXQgY2Fu
IGJlIHB1bGxlZCBpbnRvCj4gPiBpbmRpdmlkdWFsIHN1YnN5c3RlbXMgc28gdGhhdCBwYXRjaGVz
IHN3aXRjaGluZyB2YXJpb3VzIGRyaXZlcnMgdG8KPiA+IGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgo
KSBjb3VsZCBiZSBhcHBsaWVkLgo+IAo+IEkgdGhpbmsgaXQgc2VlbXMgYSBiaXQgZW50aHVzaWFz
dGljIHRvIGhhdmUgbm9uLUdQSU8gc3Vic3lzdGVtcwo+IHBpY2sgdXAgdGhlc2UgY2hhbmdlcyB0
aGlzIGNsb3NlIHRvIHRoZSBtZXJnZSB3aW5kb3cgc28gbXkgcGxhbgo+IGlzIHRvIG1lcmdlIHBh
dGNoZXMgMS4yLjMgKDEgYWxyZWFkeSBtZXJnZWQpIGFuZCB0aGVuIHlvdSBjb3VsZAo+IG1hc3Nh
Z2UgdGhlIG90aGVyIHN1YnN5c3RlbXMgaW4gdjUuNC1yYzEuCj4gCj4gQnV0IGlmIG90aGVyIHN1
YnN5c3RlbXMgc2F5ICJoZXkgd2Ugd2FudCBkbyBmaXggdGhpcyBpbiBsaWtlIDMgZGF5cyIKPiB0
aGVuIEknbSBnYW1lIGZvciBhbiBpbW11dGFibGUgYnJhbmNoIGFzIHdlbGwuCgpObywgaWYgaXQg
aXMgc3RpbGwgaGFzIGEgY2hhbmNlIGZvciAtcmMxIHRoZW4gSSdtIGdvb2QuIEkgd2FzIHRoaW5r
aW5nCmlmIGl0IGRvZXMgbm90IGdvIGludG8gLXJjMSBJIGNvdWxkIGNvbnZpbmNlIHNvbWUgb2Yg
dGhlbSBtZXJnZSBhCnRhcmdldGVkIGltbXV0YWJsZSBicmFuY2ggb2ZmIC1yYzggb3IgNS4zIGZp
bmFsIGFuZCB0aGVuIGFwcGx5IHBhdGNoZXMKcmVsZXZhbnQgdG8gdGhlaXIgc3Vic3lzdGVtcyBz
byB3ZSBkbyBub3QgaGF2ZSB0byB3YWl0IHRpbGwgNS42IHRvIGxhbmQKZXZlcnl0aGluZy4KClRo
YW5rcy4KCi0tIApEbWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
