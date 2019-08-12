Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF178988C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 10:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86CB6E46B;
	Mon, 12 Aug 2019 08:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361CD6E46B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 08:16:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p17so103759136wrf.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 01:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
 b=h+oDKCUic/p99NQhCXdrdYR0uipeD1kH4mqnMzKpoUY/fr9JSsnjYsz01y6Qnf9HJU
 vfe9wxB3ShUIs7A2CFrFR5Qg1rElvqDQ+3pLU4Nn98ypEQdGA5Mhpgu9fck/Kt4f0D6A
 +n8xOuGOB6fAAJ2XmPabvoS/H1SEBqCvaXbeW6MCQDD9lHGEfMwOiegcm80g0j1swvml
 1BKEavr2Rl3C8/z88vps699H699YPaFExGOOf2SXYNrvZNxwXiEVBnC2SXSdkNaEqAUb
 8FNb+NDGLGi7zgIyBjGV8Sg1texEk7ygg6WA3TqK/vq2zcpYOTEx2lSQoJKLt9UAaLOa
 K5Qw==
X-Gm-Message-State: APjAAAVIhL/TAuASKF3+y+Ym1oAtSl828hvRNLsydRhVWA4gR76wWi5B
 MNrJ12gXZI87TY+nvBRRwY0yOw==
X-Google-Smtp-Source: APXvYqyD6fPKryZQTpN9zsdwGV7yS5BKNQZ8tOEeMIPGi0uW8Qmgi+HgiANiv0VmQSgyzgbueGKdzg==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr40515082wrn.240.1565597802765; 
 Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id g15sm16420028wrp.29.2019.08.12.01.16.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Date: Mon, 12 Aug 2019 09:16:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
Message-ID: <20190812081640.GA26727@dell>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-11-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
 b=u4QlkRbMDiHfGrjdu436aHZusopdsD94AaT6zXTM3eaZ4y6BosUM0tlaA56X51nN9c
 umI3PH27REA1YdEm/bDm3OE2UI9MGULdMLuGUTvnDBKUBlM+u5BgwEJXKd1SByIuWkrY
 2kv99VeKU+V5QXG9oieP77x7yQgoExIDYXx4vPH8vlEru6HzZ6/p32cpzzObsHy5W3az
 O2VbXSjzdwyFpNJYin4w9mGvGx4NIQqGMocgiLaaq7HHG8qkJjXvIxiD9mAgo53+VJlh
 LCcGJbAa2s5qZg9/JZfFsSRo/t/+spxSIJYxDJW7Gfq3OorZb4uOTIjODwyWsHDkDNXd
 LmBw==
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
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdWwgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKCj4gSXQgaGFzIGJlZW4g
cmVwbGFjZWQgd2l0aCB0aGUgaW5nZW5pYy1paW8gZHJpdmVyIGZvciB0aGUgQURDLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IFRlc3Rl
ZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4gLS0tCj4gIGRyaXZl
cnMvbWZkL0tjb25maWcgICAgICB8ICAgOSAtLQo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAg
fCAgIDEgLQo+ICBkcml2ZXJzL21mZC9qejQ3NDAtYWRjLmMgfCAzMjQgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzM0IGRlbGV0aW9u
cygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jCgpBcHBs
aWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBU
ZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
