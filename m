Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25A7A292
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2CD6E42B;
	Tue, 30 Jul 2019 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BAD89DB5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 11:23:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n9so61517258wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 04:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7FSTYRCDuN8ugCkUACc2sS4c/sxO9MPaWoEgh7iEEsE=;
 b=dql3FIFThIQ5fNqAUL9YnGrkP/NefZ+SoVEKrgxH7Rk+HNUA2NDAd5LqbjiHr9wSJq
 2eijg73vP+B0eycxoVa9MJ09sWURfXZxRElOV8hBQ09bJ3ajG4g7l3KYAmsYHee3nCRp
 ctK1EsTdy/ljSrB5Y8PyVVgJPjz4sbbO6pcSVbup2Yeevm7NLUEYZCJuLOHKidD/MUUj
 bpZ5OlG88neKg0YEujEc9fvRCJe0BgzVW7Ewz2s53G+lOA+Aknks4JUFYQxAPEskf+yM
 2McFNS71+gM6L8hUIkSk5+qDNfO+4mJtfBGy5Yev6F5us/rMiLEOuqIBR9iQK+7ZGj4e
 Ncmg==
X-Gm-Message-State: APjAAAV7s4gU1mm3psDbsqEhVfyYksLVsWbB5i2ycL8JQK5yrAwHLSoT
 xcuBhn33H3Pg3eqsC9F+5pRyPxJWBjyl4TPaTN8=
X-Google-Smtp-Source: APXvYqyKS6i0fcHmOYx363DJnPTuu/xw0bA5xIlQXAB08qPtFUJYujyOTv9lxMWA//8NpJVOebpAE1xkHqBFV70jCHw=
X-Received: by 2002:a5d:514f:: with SMTP id u15mr21122702wrt.183.1564399401730; 
 Mon, 29 Jul 2019 04:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190725220215.460-1-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 29 Jul 2019 13:23:10 +0200
Message-ID: <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
To: Paul Cercueil <paul@crapouillou.net>
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7FSTYRCDuN8ugCkUACc2sS4c/sxO9MPaWoEgh7iEEsE=;
 b=bVgt5oMZu9vka1vXyxfezj5eUPF8tafHtuB8RDF5PL5XefOI5mn84bdcGgEYFQWdBD
 v3/RzVElyj8HrIjajPHz9JfYqtYa1a1yA8hfjYuu81uuZW+L4M6UDlbC+97IeFIaW79S
 VyfhVHIyNKEDN8aDRs1lSXylanKCL5tamDdd0LGZFSuGIdZhIA5YtQMSnnlPGOXYI+uB
 otASFE6nLMIXfBJnLYqx5jtskcjMG1v7YFrGQrTtLxogh4D9ruZUok7QnLA9zT0nF3y9
 Mad/lcbjmcAfGQ+6KgMGFjkt1CTbHPYd7gc6HCKZGD+kgkTJ+bsGFjbvG/audBf5AYAL
 O2cQ==
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
 James Hogan <jhogan@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTI6MDIgQU0gUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+IHdyb3RlOgo+Cj4gSGksCj4KPiBUaGlzIHBhdGNoc2V0IGNvbnZlcnRzIHRo
ZSBRaSBMQjYwIE1JUFMgYm9hcmQgdG8gZGV2aWNldHJlZSBhbmQgbWFrZXMgaXQKPiB1c2UgYWxs
IHRoZSBzaGlueSBuZXcgZHJpdmVycyB0aGF0IGhhdmUgYmVlbiBkZXZlbG9wZWQgb3IgdXBkYXRl
ZAo+IHJlY2VudGx5Lgo+Cj4gQWxsIHRoZSBjcmFwcHkgb2xkIGRyaXZlcnMgYW5kIGN1c3RvbSBj
b2RlIGNhbiBiZSBkcm9wcGVkIHNpbmNlIHRoZXkKPiBoYXZlIGJlZW4gcmVwbGFjZWQgYnkgYmV0
dGVyIGFsdGVybmF0aXZlcy4KPgo+IFNvbWUgb2YgdGhlc2UgYWx0ZXJuYXRpdmVzIGFyZSBub3Qg
eWV0IGluIDUuMy1yYzEgYnV0IGhhdmUgYWxyZWFkeSBiZWVuCj4gYWNjZXB0ZWQgYnkgdGhlaXIg
cmVzcGVjdGl2ZSBtYWludGFpbmVyIGZvciBpbmNsdXNpb24gaW4gNS40LXJjMS4KPgo+IFRvIHVw
c3RyZWFtIHRoaXMgcGF0Y2hzZXQsIEkgdGhpbmsgdGhhdCBhcyBzb29uIGFzIE1JUFMgbWFpbnRh
aW5lcnMKPiBhZ3JlZSB0byB0YWtlIHBhdGNoZXMgMDEtMDMvMTEgYW5kIDExLzExLCB0aGUgb3Ro
ZXIgcGF0Y2hlcyBjYW4gZ28KPiB0aHJvdWdoIHRoZWlyIHJlc3BlY3RpdmUgbWFpbnRhaW5lcidz
IHRyZWUuCgpXYXMgdGhpcyBzZXJpZXMgdGVzdGVkIHdpdGggdGhlIEJlbiBOYW5vbm90ZSBkZXZp
Y2U/CkkgaGF2ZSBvbmUgb2YgdGhlc2UgYW5kIGZyb20gdGltZSB0byB0aW1lIEkgdXBncmFkZSB0
aGUga2VybmVsIG9uIGl0LgoKLS0gClRoYW5rcywKLy9yaWNoYXJkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
