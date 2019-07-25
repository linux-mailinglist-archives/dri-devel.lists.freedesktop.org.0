Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1590675048
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB226E791;
	Thu, 25 Jul 2019 13:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95B6E791
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:54:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so50852286wrt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 06:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kiGD59LaW0LszoAZzmVLJ1Hft59fIaEtybxXjg0U4OU=;
 b=PM3Es6tQGPA8eUZbBPslgkUCXZBbp2URghiaV0+mle1hLW7SxNVn2Dw5RCmB/Bfp9Q
 adCamnwKrzFXOz377COeKJ/DYI/saw2C4qNcTtYB0jXd3LNPcZMuotoSO7QNinLDMxA6
 ayrCopQEbUu4UmbKZr1bftIPDwSccHrQ6jfzff0hmMZs+sPOnvpb+LdnhykLOZCGiNSq
 4VYdDC+wgvdXnopPgg8doYCqxbZDf+NrsE0LaZVanOjlRY3Om935QRhAFbjLYtVaIoBk
 R1xlqGH33pWlsd71E5HnK64BvAefw5v0bxT0JsNDu//qQ+TDzk7IyPOX+e47EH5A6xBA
 J3gg==
X-Gm-Message-State: APjAAAUNAePZubRkcrI3JbQS1u/VDFOFqfQspgN3H9+FTu4RSuQlBFs0
 7sWctExsGDrwZfCcjYWq0Or/YQ==
X-Google-Smtp-Source: APXvYqyi+7SaHwgU0aK/nQJij+0evagD7L54rP/lc55M34rnwnlBR+KX1Ln1iOdMtsPd3Xr0XJt2kw==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr64650717wrp.38.1564062869954; 
 Thu, 25 Jul 2019 06:54:29 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id c9sm40786310wml.41.2019.07.25.06.54.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 06:54:29 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:54:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 2/7] drivers: Introduce device lookup variants by
 of_node
Message-ID: <20190725135402.GL23883@dell>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723221838.12024-3-suzuki.poulose@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=kiGD59LaW0LszoAZzmVLJ1Hft59fIaEtybxXjg0U4OU=;
 b=sQQDJiby1lR9rJnYwpFayBJL1RCmEUHrXJL5ktfkxstXcB1e72/IJ+7W0b7G/ZBDE7
 l2/Oe7WGAKBlaplOUnR9eKLvijJm+yqgNtv1e2Xt94tpqVPUHg4DEcD9UGsRs0szMquI
 gd0SnX7mYKDLhjJOaB+OD74kiTzZcmfgGeIajBjxHk8HORwabuVH5qYZ14shV48okQcq
 oV1q3+hmkLuRmabQQ4N1s3WbE9w1LtffyarQQhGJ98ItiO4babxYtOZPj/d8HElgIXh3
 +7ifv5dKadFG/B1N65t8KG2r29CwpiyOZg/YA0MfSDcC9TY3HZioK4MipWty6YP9bw5P
 6xWg==
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 rafael@kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa@the-dreams.de>, David Airlie <airlied@linux.ie>,
 Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
 Alan Tull <atull@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Rosin <peda@axentia.se>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBKdWwgMjAxOSwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKCj4gSW50cm9kdWNl
IHdyYXBwZXJzIGZvciB7YnVzL2RyaXZlci9jbGFzc31fZmluZF9kZXZpY2UoKSB0bwo+IGxvY2F0
ZSBkZXZpY2VzIGJ5IGl0cyBvZl9ub2RlLgo+IAo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+
IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KPiBDYzogRnJhbmsg
Um93YW5kIDxmcm93YW5kLmxpc3RAZ21haWwuY29tPgo+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVp
a29Ac250ZWNoLmRlPgo+IENjOiBMaWFtIEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29tPgo+
IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXJvY2tjaGlwQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3BpQHZnZXIua2VybmVsLm9yZwo+IENjOiBNYXRo
aWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPgo+IENjOiBSb2IgSGVycmlu
ZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+IENjOiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZh
cy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+Cj4gQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5j
b20+Cj4gQ2M6IFdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+Cj4gQ2M6IEFsYW4gVHVs
bCA8YXR1bGxAa2VybmVsLm9yZz4KPiBDYzogTW9yaXR6IEZpc2NoZXIgPG1kZkBrZXJuZWwub3Jn
Pgo+IENjOiBsaW51eC1mcGdhQHZnZXIua2VybmVsLm9yZwo+IENjOiBQZXRlciBSb3NpbiA8cGVk
YUBheGVudGlhLnNlPgo+IENjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gQ2M6
IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgo+IENjOiBIZWluZXIgS2Fs
bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+IENjOiAiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2
ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+IENj
OiBMaWFtIEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29tPgo+IENjOiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiAiUmFmYWVsIEouIFd5c29j
a2kiIDxyYWZhZWxAa2VybmVsLm9yZz4KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KPiBDYzogVGhvciBUaGF5ZXIgPHRob3IudGhheWVyQGxpbnV4LmludGVsLmNvbT4KPiBD
YzogSmlyaSBTbGFieSA8anNsYWJ5QHN1c2UuY29tPgo+IENjOiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+Cj4gQ2M6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KPiBDYzogUGV0
ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KPiBTaWduZWQtb2ZmLWJ5OiBTdXp1a2kgSyBQb3Vs
b3NlIDxzdXp1a2kucG91bG9zZUBhcm0uY29tPgo+IC0tLQo+ICAtIERyb3BwZWQgdGhlIHJldmll
d2VkLWJ5IHRhZ3MgZnJvbSBUaG9yLCBNYXJrLCBBbmRyZXcgYW5kIFBldGVyIGFzIHRoZQo+ICAg
IHBhdGNoZXMgYXJlIG1lcmVnZWQsIHRob3VnaCB0aGVyZSBhcmUgbm8gZnVuY3Rpb25hbCBjaGFu
Z2VzLgo+IC0tLQo+ICBkcml2ZXJzL2FtYmEvdGVncmEtYWhiLmMgICAgICAgICAgICAgIHwgMTEg
Ky0tLS0tLS0KPiAgZHJpdmVycy9mcGdhL2ZwZ2EtYnJpZGdlLmMgICAgICAgICAgICB8ICA4ICst
LS0tLQo+ICBkcml2ZXJzL2ZwZ2EvZnBnYS1tZ3IuYyAgICAgICAgICAgICAgIHwgIDggKy0tLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYyAgICAgICAgfCAgNyArLS0tLQo+ICBk
cml2ZXJzL2kyYy9pMmMtY29yZS1vZi5jICAgICAgICAgICAgIHwgIDcgKy0tLS0KPiAgZHJpdmVy
cy9tZmQvYWx0ZXJhLXN5c21nci5jICAgICAgICAgICB8IDE0ICsrLS0tLS0tLS0KCkZvciBteSBv
d24gcmVmZXJlbmNlOgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+CgpXaGF0J3MgdGhlIG1lcmdlIHBsYW4gZm9yIHRoaXMgcGF0Y2g/CgpJcyBhbnlv
bmUgcHJlcGFyZWQgdG8gY3JlYXRlIGFuIGltbXV0YWJsZSBicmFuY2ggZm9yIHVzIHRvIHB1bGwg
ZnJvbT8KSSdtIGhhcHB5IHRvIGRvIGl0IGlmIG5vIG9uZSBlbHNlIHN0ZXBzIHVwLgoKPiAgZHJp
dmVycy9tdXgvY29yZS5jICAgICAgICAgICAgICAgICAgICB8ICA3ICstLS0tCj4gIGRyaXZlcnMv
bmV0L3BoeS9tZGlvX2J1cy5jICAgICAgICAgICAgfCAgOSArLS0tLS0tCj4gIGRyaXZlcnMvbnZt
ZW0vY29yZS5jICAgICAgICAgICAgICAgICAgfCAgNyArLS0tLQo+ICBkcml2ZXJzL29mL29mX21k
aW8uYyAgICAgICAgICAgICAgICAgIHwgIDggKy0tLS0tCj4gIGRyaXZlcnMvb2YvcGxhdGZvcm0u
YyAgICAgICAgICAgICAgICAgfCAgNyArLS0tLQo+ICBkcml2ZXJzL3JlZ3VsYXRvci9vZl9yZWd1
bGF0b3IuYyAgICAgIHwgIDcgKy0tLS0KPiAgZHJpdmVycy9zcGkvc3BpLmMgICAgICAgICAgICAg
ICAgICAgICB8IDIwICsrKy0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L2RldmljZS5oICAg
ICAgICAgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHNvdW5kL3Nv
Yy9yb2NrY2hpcC9yazMzOTlfZ3J1X3NvdW5kLmMgfCAgOSArKy0tLS0tCj4gIDE1IGZpbGVzIGNo
YW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDExMCBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
