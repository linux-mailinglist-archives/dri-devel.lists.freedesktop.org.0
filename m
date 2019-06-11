Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE841CD1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BBB892A1;
	Wed, 12 Jun 2019 06:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F71891E3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 20:02:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n4so14340339wrw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jIebUp4XY7WW1bkNEqW8SSNqGZE7schYtfqUjB6l7k0=;
 b=as8MZxmXIgUPQkfwzSXtKQYm2P3IIR9lu8K+YgF0ZvzZ+Q/4x+jg98Y+kDl30FXsSn
 gk7x2Au7QHse5+jD7IrA0orZmIZgE0U2VnqmI9R5VvmbURQolCdl9hegGeH/0XMEBJae
 IkrY8LvyRJgP98VOxQBsfqW/svdfWc883ieQsW6IM/oq6P25E09VGlA3ic58aX2dhCp8
 4ekcHwYZ54fmr0LOouDRkRd8CP2sfs0S4fbjVtwqKWvmUOTtOCWoFS1kGDO6icM0ykn6
 jNOjV9SHX9GxzdCHtr/llZM0p9b/sMij+1951DIl586rXU4ZTApri+sdZFIzOXgJUxQg
 Wz0Q==
X-Gm-Message-State: APjAAAV0RCoGcpS+NbJFFpfJTWZlsMrW3P+DLvpxQYsm+tq6MncUsNdb
 NP5xeGUr3tbD3yRnmLtFEMY=
X-Google-Smtp-Source: APXvYqy69Nttw3VJy9kpldo/q2sr2jjcjp5IQcHqdojuXnECS/X413h3T3E/IrANMshlTYRLwEAwbA==
X-Received: by 2002:adf:e60f:: with SMTP id p15mr5340510wrm.332.1560283348311; 
 Tue, 11 Jun 2019 13:02:28 -0700 (PDT)
Received: from [192.168.1.17] (bgt97.neoplus.adsl.tpnet.pl. [83.28.83.97])
 by smtp.gmail.com with ESMTPSA id t15sm6862774wrx.84.2019.06.11.13.02.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 13:02:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: pwm-backlight: Add 'max-brightness'
 property
To: Matthias Kaehlcke <mka@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20190610233739.29477-1-mka@chromium.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <00220cd7-ed4b-5250-d448-cf83ed4c2012@gmail.com>
Date: Tue, 11 Jun 2019 22:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610233739.29477-1-mka@chromium.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jIebUp4XY7WW1bkNEqW8SSNqGZE7schYtfqUjB6l7k0=;
 b=rjjq2BYL90EBCSL/toQeCzvvX7/mr3CT8wNVZ5RrUf9C4iHpBbLWDEbfYOZEJ8Pj4q
 NNEdrItqug1NOkCSsrAgG3RaVp1IDaUsD0EY9yUcqX03AYR0uvQg3SEa/rIVUCmk79ik
 AUaWNObvhnMKupRn+GrK6NbovbCK4c93D2eYGYLq2NMisxYK0gmviqStYYoaCInLvwoS
 ik0rmfpNNqQwh1zguzJdUG/zHLIIJ0/L6Trutr9hHDGjdTk/wevjQxUE5vaWeo1qkqp4
 l3sv1kswS2B88HLMkiLSc+8+51SEKiFcExDiVLbfATNMmV/gP5sCngr3zpwjKPHwn3nL
 R5fg==
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dGhpYXMsCgpPbiA2LzExLzE5IDE6MzcgQU0sIE1hdHRoaWFzIEthZWhsY2tlIHdyb3Rl
Ogo+IEFkZCBhbiBvcHRpb25hbCAnbWF4LWJyaWdodG5lc3MnIHByb3BlcnR5LCB3aGljaCBpcyB1
c2VkIHRvIHNwZWNpZnkKPiB0aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxzIChtYXgtYnJp
Z2h0bmVzcyArIDEpIHdoZW4gdGhlIG5vZGUKPiBoYXMgbm8gJ2JyaWdodG5lc3MtbGV2ZWxzJyB0
YWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVt
Lm9yZz4KPiAtLS0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3
bS1iYWNrbGlnaHQudHh0ICAgICAgIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1iYWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1iYWNrbGlnaHQudHh0Cj4gaW5kZXgg
NjRmYTJmYmQ5OGM5Li45OGY0YmE2MjYwNTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1iYWNrbGlnaHQudHh0Cj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1i
YWNrbGlnaHQudHh0Cj4gQEAgLTI3LDYgKzI3LDkgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXNvbHV0aW9uIHB3bSBkdXR5IGN5Y2xlIGNh
biBiZSB1c2VkIHdpdGhvdXQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoYXZpbmcg
dG8gbGlzdCBvdXQgZXZlcnkgcG9zc2libGUgdmFsdWUgaW4gdGhlCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYnJpZ2h0bmVzcy1sZXZlbCBhcnJheS4KPiArICAtIG1heC1icmlnaHRu
ZXNzOiBNYXhpbXVtIGJyaWdodG5lc3MgdmFsdWUuIFVzZWQgdG8gc3BlY2lmeSB0aGUgbnVtYmVy
IG9mCj4gKyAgICAgICAgICAgICAgICAgICAgYnJpZ2h0bmVzcyBsZXZlbHMgKG1heC1icmlnaHRu
ZXNzICsgMSkgd2hlbiB0aGUgbm9kZQo+ICsgICAgICAgICAgICAgICAgICAgIGhhcyBubyAnYnJp
Z2h0bmVzcy1sZXZlbHMnIHRhYmxlLgoKSW4gdGhlIExFRCBzdWJzeXN0ZW0gd2UgaGF2ZSBsZWQt
bWF4LW1pY3JvYW1wIHByb3BlcnR5IHdoaWNoIHNlZW1zIHRvCmJldHRlciBkZXNjcmliZSBoYXJk
d2FyZSBjYXBhYmlsaXRpZXMuIEl0IHNheXMganVzdDogdGhpcyBpcyB0aGUgY3VycmVudApsZXZl
bCB0aGUgTEVEIGNhbiB3aXRoc3RhbmQuIG1heC1icmlnaHRuZXNzIGRvZXMgbm90IGltcGxpY2l0
bHkgY29udmV5CnRoaXMga2luZCBvZiBpbmZvcm1hdGlvbi4KCldoeSB0aGUgbmVlZCBmb3IgdGhl
IHByb3BlcnR5IGF0IGFsbD8gSWYgZm9yIHRoZSByZWFzb25zIG90aGVyIHRoYW4KaGFyZHdhcmUg
Y2FwYWJpbGl0aWVzIHRoYW4gaXQgc2hvdWxkIGJlIG1vcmUgbGlrZWx5IGhhbmRsZWQKYnkgdXNl
cnNwYWNlLgoKPiAgIFswXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9w
d20udHh0Cj4gICBbMV06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dw
aW8udHh0Cj4gCgotLSAKQmVzdCByZWdhcmRzLApKYWNlayBBbmFzemV3c2tpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
