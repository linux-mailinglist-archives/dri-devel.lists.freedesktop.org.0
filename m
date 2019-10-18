Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9731DBE8D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 09:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BC96EAD5;
	Fri, 18 Oct 2019 07:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290BA6EAD5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 07:40:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j11so5102545wrp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 00:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5iztkm06g93DGhL7MltWaye7ky43Diy2spcjfqFIzXg=;
 b=sbZubDEy5llk8T9ADeJgPilYl1m0ahIAD5gXd1iBRuUOeZ4Dl9oLRnj3g/ROxlE5AX
 jSGy7LpySya1IREkwK2jH86lrLukg2w7Yf+l4dNUdOjhtxdDaB7qHZ1VI3ZSpOkxLhKm
 TkNu5JZJP8z5UWX3qlmO1zwRCFoyGIlVmOGUNfg2PNycHB4i9xyH40zCBp8zXn+jEH8z
 WktrrQmKpd/LrQXdYNxnBk85OeH8W+2oNfZDUzYNNLpTNZV/9DWUJHRbdtqbgu3za2fS
 bLWyAQXF9WnJ9vLZSvZF9QMSKPFuhwr1wPwJ9qRx8W0prefkxJnLl7q00mtGQcLxsHUP
 GXkg==
X-Gm-Message-State: APjAAAXZRES/GblpQJ/nDaQmt4DRHbdruTkKqNxZm/5TEFOsik3DBE9R
 +wgjPRbFT/mGNSTCpXq7jBGGAg==
X-Google-Smtp-Source: APXvYqyaR1yIy6/nHTciHSlsM7Yad4h/pKWcFB87SKBaPMe+VEelXm6J/rsxud+fKoJs55M7U1t4SQ==
X-Received: by 2002:adf:a141:: with SMTP id r1mr6580104wrr.122.1571384409625; 
 Fri, 18 Oct 2019 00:40:09 -0700 (PDT)
Received: from dell ([95.149.164.47])
 by smtp.gmail.com with ESMTPSA id y1sm5466054wrw.6.2019.10.18.00.40.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Oct 2019 00:40:09 -0700 (PDT)
Date: Fri, 18 Oct 2019 08:40:07 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191018074007.GV4365@dell>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015191821.11479-30-bigeasy@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=5iztkm06g93DGhL7MltWaye7ky43Diy2spcjfqFIzXg=;
 b=pJCPbtlKt6Rvp+pV9pRvRRTB2+C2HV3kB8c8I0/yqQfCX1XILLaTFo35IB5nQTJtDM
 r9tTOQbpFgwCznZAP7qrE4cjnzi9qj6ZmdZGM1h1W5XfeazaxmF2MQu7674gQ2JvQYEr
 2njL2yf4ovlyLYmjBr4GUucktQC+SrgIDf56mP73dW7lI8dxYXSRuGNBDTX7/SweYT2e
 riAEXLMNTeT5LEopMjCuOCz8mo1DZscS2DBrV7iO6lbt7JZpcOHcZSgvd4iCvqII523b
 d9g8mpFLw5ipUQ2n81QUKvjxUvNjgP/G6QBe5rqiruEoearvj6JcSGh2PPB4m2NZOlgO
 ra8Q==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNSBPY3QgMjAxOSwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToKCj4g
RnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gCj4gQ09ORklHX1BS
RUVNUFRJT04gaXMgc2VsZWN0ZWQgYnkgQ09ORklHX1BSRUVNUFQgYW5kIGJ5IENPTkZJR19QUkVF
TVBUX1JULgo+IEJvdGggUFJFRU1QVCBhbmQgUFJFRU1QVF9SVCByZXF1aXJlIHRoZSBzYW1lIGZ1
bmN0aW9uYWxpdHkgd2hpY2ggdG9kYXkKPiBkZXBlbmRzIG9uIENPTkZJR19QUkVFTVBULgo+IAo+
IFN3aXRjaCB0aGUgS2NvbmZpZyBkZXBlbmRlbmN5IHRvIENPTkZJR19QUkVFTVBUSU9OLgo+IAo+
IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IENjOiBKaW5nb28gSGFuIDxqaW5nb29o
YW4xQGdtYWlsLmNvbT4KPiBDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVy
a2llQHNhbXN1bmcuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IFtiaWdlYXN5OiArTENEX0hQNzAwXQo+IFNp
Z25lZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25p
eC5kZT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyB8IDQgKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGll
ZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
