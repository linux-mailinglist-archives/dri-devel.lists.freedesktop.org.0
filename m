Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C95722D76
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 09:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B9C891DA;
	Mon, 20 May 2019 07:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D776891DA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 07:56:27 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p27so22472212eda.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 00:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jiVgtLJVaSK+kBnj7Ae+LR1x0hOyccWrwqfEKZcrZlk=;
 b=kvXuW/hXwMLnp1Iqb7XAoVaFZ4dnWR0EsGDf9XdGoR8rhrbOvRzwq4VjpFhF/tx+lC
 pJoS1pmMqLEfTHOCRy72UCd/68VoRql9EIt3Kipln6H6hkRBbAiUFz0pBD9302bG2x8W
 3E+uIq4uYeJrK4dAGC8npktW/Bitwjp+lAPFhrc2eFuNC2o4NfV/VPhUQLAP6A/osjWL
 2n1ulsXxXNFU756TK3VBdnWz8udF9usktiucZQrGGyDMTy5cYmNKfm62MGASZH/KY0Ji
 qo9/6ArXr6XCI2gOwDM9i1lGEloSPF5h8mjmfNQ3PaigQ0lUEjxODjOeTckM8ARgNFFw
 OlaQ==
X-Gm-Message-State: APjAAAUNgoqLTJhqtE/9IVtmpUWIBlBr7az5F4EDOPPqSlwiZguvhM6/
 uIGUeXQsRYKIUy8kQL/eUqo/FLxFUn8=
X-Google-Smtp-Source: APXvYqwi/FoAjlDjgnyKa9Nq5isBQTItjiBdLZ9RqLwDoQTYjlY2eNSF3P5KmqEErVvFcy6mF/ngHQ==
X-Received: by 2002:a17:906:82cf:: with SMTP id
 a15mr32371500ejy.176.1558338985489; 
 Mon, 20 May 2019 00:56:25 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id e9sm5209044edq.39.2019.05.20.00.56.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 00:56:25 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id l2so13381187wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 00:56:24 -0700 (PDT)
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr41065855wrn.201.1558338984633; 
 Mon, 20 May 2019 00:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190516154943.239E668B05@newverein.lst.de>
 <20190516155139.E6EE568C65@newverein.lst.de>
In-Reply-To: <20190516155139.E6EE568C65@newverein.lst.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 20 May 2019 15:56:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xKk1r1iqSVm5pVvHVkyQ175MUFB7JPUkvQX9ecOZDDQ@mail.gmail.com>
Message-ID: <CAGb2v64xKk1r1iqSVm5pVvHVkyQ175MUFB7JPUkvQX9ecOZDDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: DTS: allwinner: a64: Enable audio on Teres-I
To: Torsten Duwe <duwe@lst.de>
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
 devicetree <devicetree@vger.kernel.org>,
 Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6NTIgUE0gVG9yc3RlbiBEdXdlIDxkdXdlQGxzdC5k
ZT4gd3JvdGU6Cj4KPiBGcm9tOiBIYXJhbGQgR2V5ZXIgPGhhcmFsZEBjY2JpYi5vcmc+Cj4KPiBU
aGUgVEVSRVMtSSBoYXMgaW50ZXJuYWwgc3BlYWtlcnMgKGxlZnQsIHJpZ2h0KSwgaW50ZXJuYWwg
bWljcm9waG9uZQo+IGFuZCBhIGhlYWRzZXQgY29tYm8gamFjayAoaGVhZHBob25lcyArIG1pYyks
ICJDVElBIiAoYW5kcm9pZCkgcGlub3V0Lgo+Cj4gVGhlIGhlYWRwaG9uZSBhbmQgbWljIGRldGVj
dCBsaW5lcyBvZiB0aGUgQTY0IGFyZSBjb25uZWN0ZWQgcHJvcGVybHksCj4gYnV0IEFGQUlLIGN1
cnJlbnRseSB1bnN1cHBvcnRlZCBieSB0aGUgZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFy
YWxkIEdleWVyIDxoYXJhbGRAY2NiaWIub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFRvcnN0ZW4gRHV3
ZSA8ZHV3ZUBzdXNlLmRlPgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBDaGVuLVl1
IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
