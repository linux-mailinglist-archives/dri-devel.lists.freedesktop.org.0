Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3105A8B595
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 12:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B426E0D7;
	Tue, 13 Aug 2019 10:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B369B6E0D7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 10:30:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p77so758434wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 03:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FpaQRzjjHieM2ZwGQ/GdoyebOrmSoenQLDvTG9Qi6yI=;
 b=IF3BGROAb9pufHb5bUv2Exdk5MXW7lZ/FpXutvrDMP/EBq5RS6lCI6cAo+2U7zXeKQ
 6ua3VvN3JMB4+8/MVCS2CPwDs6+e9HfoPvoZfbv51yoYDOuvgbMwAVLnX96x8rTz7dhq
 gPXEYUYsQGZ12eifl5ltpgIyGXUdYKoEXcx0TbZ01gxsYK6uwmdLuj/pt4AC818HlmKo
 8H1RWPwFkeQSb0QWXD80HfWJgQw3QmOFF0EpWGIp7p6fdQiclRtRJFMryof6/mXtwYFH
 hPAR7f9YoAE9fBJzaksE4R/dcbN9xFU7yFeCJj38q48URNbN4rBpylIy0OSRnkDcQppO
 b3BQ==
X-Gm-Message-State: APjAAAWNIteRF/+TqOpyU72+JyrFB/pl3Jsd3BHUptrHON6+lsrOxBnv
 rxFecNzhsE7aOjSNvm37tzX8MQ==
X-Google-Smtp-Source: APXvYqyN4qrmzO2fFtNWQoBH44tqgLmmkrAsTcojaeG2fQxm4ZfxnFrHwjr1JBuy4GY1YNPhUuoqgg==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr2384506wme.3.1565692225238;
 Tue, 13 Aug 2019 03:30:25 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id a11sm10103044wrx.59.2019.08.13.03.30.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Aug 2019 03:30:24 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:30:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
Message-ID: <20190813103022.GB26727@dell>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net>
 <20190812081640.GA26727@dell>
 <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
 <1565690508.1856.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565690508.1856.0@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=FpaQRzjjHieM2ZwGQ/GdoyebOrmSoenQLDvTG9Qi6yI=;
 b=ECIOfaMx8Etdcuaur37ndWisVmkutpI1rFJEIHjhiDwicrUiGrpbpAh/VAWiR4/mk6
 Jys94C59P6dLWKu5BQICoe2FRE77l28OSivWG+JTNpgd8WKtGSQfWBBZVZAd/6GBPYIR
 N7QAM4bNCEBuL4EZ341aigqm61rNC6SklbSxux6Dl/RDvx5m6NoOoWU5WkAo1sULWlGP
 rmInauOV0CaASOC/reQNrVHz2DmC5lwG4koVfD/zwf/6tujmdf9hlG0GpGX3wZHW5mgA
 uLPW4z83TGAcn7qk9nhCXCd2q3i2VQmGjIrY9gblReoQWkp3QwSKnXXrrq/4ZMdLTfKj
 FjRA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKCj4gSGkgUGhpbGlwcGUs
Cj4gCj4gCj4gTGUgbWFyLiAxMyBhb8O7dCAyMDE5IMOgIDEwOjQ0LCBQaGlsaXBwZSA9P2lzby04
ODU5LTE/cT9NYXRoaWV1LURhdWQ9RTk/PQo+IDxmNGJ1Z0BhbXNhdC5vcmc+IGEgw6ljcml0IDoK
PiA+IEhpIExlZSwKPiA+IAo+ID4gT24gOC8xMi8xOSAxMDoxNiBBTSwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gPiAgT24gVGh1LCAyNSBKdWwgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiA+ID4g
Cj4gPiA+ID4gIEl0IGhhcyBiZWVuIHJlcGxhY2VkIHdpdGggdGhlIGluZ2VuaWMtaWlvIGRyaXZl
ciBmb3IgdGhlIEFEQy4KPiA+ID4gPiAKPiA+ID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJj
dWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPiA+ID4gIFRlc3RlZC1ieTogQXJ0dXIgUm9q
ZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4gPiA+ID4gIC0tLQo+ID4gPiA+ICAgZHJpdmVy
cy9tZmQvS2NvbmZpZyAgICAgIHwgICA5IC0tCj4gPiA+ID4gICBkcml2ZXJzL21mZC9NYWtlZmls
ZSAgICAgfCAgIDEgLQo+ID4gPiA+ICAgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jIHwgMzI0Cj4g
PiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gICAz
IGZpbGVzIGNoYW5nZWQsIDMzNCBkZWxldGlvbnMoLSkKPiA+ID4gPiAgIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21mZC9qejQ3NDAtYWRjLmMKPiA+ID4gCj4gPiA+ICBBcHBsaWVkLCB0aGFu
a3MuCj4gPiAKPiA+IEl0IHNlZW1zIHRoZSByZXBsYWNlbWVudCBpcyBkb25lIGluICJNSVBTOiBx
aV9sYjYwOiBNaWdyYXRlIHRvCj4gPiBkZXZpY2V0cmVlIiB3aGljaCBpcyBub3QgeWV0IG1lcmdl
ZC4KPiAKPiBJdCdzIG1lcmdlZCBpbiB0aGUgTUlQUyB0cmVlLCB0aG91Z2gsIHNvIGl0J2xsIGJs
ZW5kIHRvZ2V0aGVyIGp1c3QKPiBmaW5lIGluIGxpbnV4LW5leHQuCgpXb25kZXJmdWwuICBUaGFu
a3MgUGF1bC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
