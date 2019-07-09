Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E81963932
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 18:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C843D89E05;
	Tue,  9 Jul 2019 16:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8131D894D7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 16:19:24 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id o9so28825905iom.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 09:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7tAfXbTGjm8fRgQr1s7o3SHyobzROVcWesepsvUVeJ0=;
 b=ZvDG9HyEa3ph183ZUJC15UznPc3orawK6xdjqU3ZhFtXaGPufIW2cSYcx/LvT606Zy
 r27NWlMYh/i93OccPcLOld6i5smi/rhXuWUbbDqQO62w3KJOe6nBMunIXr4Llgsk5TNp
 dbEuKePdvid0TyZmKNXcYbPMdk1PXjB2IYhgTNslC2j3zUZtMtow0pM38RE3HIzKiFpH
 x3F5/hnd2d+YtUQeit2mpNLZkJJL8JmM9eGgJK7F4xXmnt8TikForUYLVhIaJI09hn86
 NmsVoOHBW93Sjc5oDYt3woh323C+xVw6x70snwDkeR5hzqNKMaHodBA3QGCWbemgfwE2
 JInA==
X-Gm-Message-State: APjAAAW5/MN8dqxXalKh310wP2rrDgf60R1UhIc9WRmoMgvNZqqa5iyj
 eFyCLrKAmcPLVd5qEKr7Qg==
X-Google-Smtp-Source: APXvYqytUb4e1tTFkilBAmDnbfpUegwR/3+McS2ESVbZuIF2pcM4ypCPA270vJObgxVGw3SsHisGJg==
X-Received: by 2002:a05:6638:191:: with SMTP id
 a17mr24115446jaq.101.1562689163723; 
 Tue, 09 Jul 2019 09:19:23 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id r5sm18036660iom.42.2019.07.09.09.19.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 09:19:22 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:19:22 -0600
From: Rob Herring <robh@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 17/28] drivers: Introduce bus_find_device_by_of_node()
 helper
Message-ID: <20190709161922.GA1609@bogus>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-18-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560534863-15115-18-git-send-email-suzuki.poulose@arm.com>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, suzuki.poulose@arm.com,
 Maxime Ripard <maxime.ripard@bootlin.com>, gregkh@linuxfoundation.org,
 rafael@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
 linux-rockchip@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 linux-spi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSAxODo1NDoxMiArMDEwMCwgU3V6dWtpIEsgUG91bG9zZSB3cm90
ZToKPiBBZGQgYSB3cmFwcGVyIHRvIGJ1c19maW5kX2RldmljZSgpIHRvIHNlYXJjaCBmb3IgYSBk
ZXZpY2UKPiBieSB0aGUgb2Zfbm9kZSBwb2ludGVyLCByZXVzaW5nIHRoZSBnZW5lcmljIG1hdGNo
IGZ1bmN0aW9uLgo+IEFsc28gY29udmVydCB0aGUgZXhpc3RpbmcgdXNlcnMgdG8gbWFrZSB1c2Ug
b2YgdGhlIG5ldyBoZWxwZXIuCj4gCj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEZs
b3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgo+IENjOiBGcmFuayBSb3dhbmQg
PGZyb3dhbmQubGlzdEBnbWFpbC5jb20+Cj4gQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRl
Y2guZGU+Cj4gQ2M6IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+Cj4gQ2M6IGxp
bnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IENjOiBsaW51eC1zcGlAdmdlci5rZXJuZWwub3JnCj4gQ2M6IE1hdGhpZXUgUG9p
cmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2Jo
K2R0QGtlcm5lbC5vcmc+Cj4gQ2M6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRh
Z2F0bGFAbGluYXJvLm9yZz4KPiBDYzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNvbT4KPiBD
YzogV29sZnJhbSBTYW5nIDx3c2FAdGhlLWRyZWFtcy5kZT4KPiBDYzogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogIlJhZmFlbCBKLiBXeXNvY2tp
IiA8cmFmYWVsQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogU3V6dWtpIEsgUG91bG9zZSA8
c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9taXBp
X2RzaS5jICAgICAgICAgICAgIHwgIDcgKy0tLS0tLQo+ICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jl
c2lnaHQvb2ZfY29yZXNpZ2h0LmMgfCAxMSArKy0tLS0tLS0tLQo+ICBkcml2ZXJzL2kyYy9pMmMt
Y29yZS1vZi5jICAgICAgICAgICAgICAgICAgfCAgNyArLS0tLS0tCj4gIGRyaXZlcnMvbnZtZW0v
Y29yZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICstLS0tLS0KPiAgZHJpdmVycy9vZi9v
Zl9tZGlvLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKy0tLS0tLS0KPiAgZHJpdmVycy9v
Zi9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKy0tLS0tLQo+ICBkcml2ZXJz
L3NwaS9zcGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKy0tLS0tLS0KPiAgaW5j
bHVkZS9saW51eC9kZXZpY2UuaCAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysr
Cj4gIHNvdW5kL3NvYy9yb2NrY2hpcC9yazMzOTlfZ3J1X3NvdW5kLmMgICAgICB8ICA5ICsrLS0t
LS0tLQo+ICA5IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygt
KQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
