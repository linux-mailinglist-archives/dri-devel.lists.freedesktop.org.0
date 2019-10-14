Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D4D5C60
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3989D6E118;
	Mon, 14 Oct 2019 07:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9C06E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:27:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p4so2478475wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 00:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Lsu4fhje736plADrPfFak7Hyuvi8ToLdp9rnCK4hwgE=;
 b=NfwNvPB9SW7yq4WrZvyKlOUUMpOx+Y3lDT4HpYYrVP5a5LyLinLMG9BqJXT1uXGN8O
 k8cHauVdJDlCEoaMZ5YWyjv77JvVou2d96xP3Gj6wg/Ag4akNcXlJRRfwfUIz46Qlprj
 oae4QAoK0ugMqld6Q2zupMLmh/nCse6x0x5Wtn/4yFgN6L0O3aPuhgD0XdARXO2xWH2D
 8ysl8itRPaDkmKI138qeyBXlcYQWawFxzjajE90aG1XF0Mxy4f6HlW4/LjMg4UvFDmMm
 nIhYwVbrX+23P0ogasc+Uq/1e7RB43KDFxeE79Hk4eIMJrNZphLY0/GRkforYhQ9LisB
 IK9w==
X-Gm-Message-State: APjAAAXMMYTENv5ThHt9ywoz/8XGnwdzORaG9qCo1xG4OrlcILlMCFJq
 0mg2U81nZZtbtkiYrA+HCMG5eA==
X-Google-Smtp-Source: APXvYqzw9fkcyJEo4AQK7M4LJ3HxW6G4IjmVLs+xsK03nZjv0Pw9xmGK1kAVONlnHG2VAyBzoqVlSg==
X-Received: by 2002:adf:e705:: with SMTP id c5mr23614156wrm.375.1571038056779; 
 Mon, 14 Oct 2019 00:27:36 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id f20sm14187442wmb.6.2019.10.14.00.27.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Oct 2019 00:27:36 -0700 (PDT)
Date: Mon, 14 Oct 2019 08:27:34 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 3/4] backlight: pwm_bl: drop use of int_pow()
Message-ID: <20191014072734.GG4545@dell>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-4-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008120327.24208-4-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Lsu4fhje736plADrPfFak7Hyuvi8ToLdp9rnCK4hwgE=;
 b=QAeR6xlIwruriMfHuFp2cv0YcQ7dfUCPQKWO3lSStColxpeElXzjO1pIuQnkS1TUZN
 cty42z8g8KK99VaGUqB/ZKPZqONUVjGeeKHaO7U/ZeaPF/37YP+WnTh+wZVEllLcTG7w
 JQWbBUZoVWjxcHApwBnUGZGGLTX9yOvDPZDrs9WfgOL76QsRx9nGg4GgBGDJNp7H0VNL
 ndbPJ0Tv48BYDmb3RoNgWP2uo3DBciF1dy4MU724NcdBreSG4GtL9V6VplxrcEZdM5bi
 d5sPeIPQDBqskiN+LDOq4H1eHwwsSO34kxUg/hgSYldiDuEN2bNCl0bBPIeHsn8M84kI
 c+ZA==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwOCBPY3QgMjAxOSwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToKCj4gRm9yIGEgZml4
ZWQgc21hbGwgZXhwb25lbnQgb2YgMywgaXQgaXMgbW9yZSBlZmZpY2llbnQgdG8gc2ltcGx5IHVz
ZQo+IHR3byBleHBsaWNpdCBtdWx0aXBsaWNhdGlvbnMgcmF0aGVyIHRoYW4gY2FsbGluZyB0aGUg
aW50X3BvdygpIGxpYnJhcnkKPiBmdW5jdGlvbjogQXNpZGUgZnJvbSB0aGUgZnVuY3Rpb24gY2Fs
bCBvdmVyaGVhZCwgaXRzIGltcGxlbWVudGF0aW9uCj4gdXNpbmcgcmVwZWF0ZWQgc3F1YXJpbmcg
bWVhbnMgaXQgZW5kcyB1cCBkb2luZyBmb3VyIDY0eDY0Cj4gbXVsdGlwbGljYXRpb25zLgo+IAo+
IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxlbW9l
cy5kaz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCAzICsrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVk
LCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
