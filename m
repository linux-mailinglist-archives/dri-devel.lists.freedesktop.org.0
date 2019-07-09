Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8EC6382E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77C26E05D;
	Tue,  9 Jul 2019 14:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751306E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:50:41 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so35513098iom.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 07:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=46Epk3/36kPZgwCBdnESdwm9AsP3sDBy9DMR2D84jbQ=;
 b=TyI5I3fNV2YbQRGkCxn6HGSnpknfVbSXMdci+xXf5Ln5dmgIGBTFwXavbKF/9B5XQ4
 5tw+uXoanXf3RZwJziv9O5AOLozn1U+Ls0LBXl7LGaZw7/WJ3IEKA4mELgp0UYu8ivrh
 b5UbhG01Q5TOPQACnA7pI+2xscpr3Aa/SyJHKyw+W9YLEjwdlDiwWgKMcPdGDUaDwTId
 6oncT20oT8m7zX4B5PgNPe5fkZ2MlgMfkQ8SK851qJ5P5Dgr73SON1Y9fh/2iv9NwTq9
 vEDU9KLOOHYeFK7B8x6HWfZSuPPCn/qme/czm57XwfnODg5BjLe13B3xQs0MjF83LZyU
 gM4Q==
X-Gm-Message-State: APjAAAWmXlowSOeZzcjipQ3BO1YzxVG1IOV7CkoC1qHrSOJtLNjLJUGL
 2YBAIayDpRV+phk/M0FhwQ==
X-Google-Smtp-Source: APXvYqzHI8qSCiXN6FftFD/8DWYZDs1KQ1ycSN/veVfBVhoubY3v9ODlSdRUq4IMRUPQR2RPAVWsOA==
X-Received: by 2002:a5e:9701:: with SMTP id w1mr161447ioj.294.1562683840732;
 Tue, 09 Jul 2019 07:50:40 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id k2sm16925748iom.50.2019.07.09.07.50.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:50:40 -0700 (PDT)
Date: Tue, 9 Jul 2019 08:50:39 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 6/9] dt-bindings: sun6i-dsi: Add R40 MIPI-DSI
 compatible (w/ A64 fallback)
Message-ID: <20190709145039.GA313@bogus>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-7-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614164324.9427-7-jagan@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSAyMjoxMzoyMSArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiBU
aGUgTUlQSSBEU0kgY29udHJvbGxlciBvbiBBbGx3aW5uZXIgUjQwIGlzIHNpbWlsYXIgb24KPiB0
aGUgb25lIG9uIEE2NCBsaWtlIGRvZXNuJ3QgYXNzb2NpYXRlIGFueSBEU0lfU0NMSyBnYXRpbmcu
Cj4gCj4gU28sIGFkZCBSNDAgY29tcGF0aWJsZSBhbmQgYXBwZW5kIEE2NCBjb21wYXRpYmxlIGFz
IGZhbGxiYWNrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
