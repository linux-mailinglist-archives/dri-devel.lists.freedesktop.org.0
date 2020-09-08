Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FE52610AC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E3289DB7;
	Tue,  8 Sep 2020 11:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582D989DB7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:30:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c19so14129008wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wXB1eTAxqsju0aM5A5RDZ+1cxmKYnF77Bv4+kmfr+08=;
 b=K3EmJGwyuBvLJnwM8K/R+rkNPKm2nLI7PKa4VQjbSa3DMML8iBhLX+FzE0p4Dm1XJw
 ktPgiAlwUDQB6/yDTrdAqj44PDdaxb5TTisd/UCBpBljgyl2HdpYBjPPh+ieX9/Gn1MZ
 ilap/vFgQGDYjvchjqtdffmZB4pSegrutHbbfRHXS+gsn52QOh3XK/vg0UsOOBnUFRrb
 Ss3gCU4Y66xe9KLdTFMRppbV9Pdjqdn4GNHO0fxC4Uwtq4ujlTBO6eVl4eqoygN2vGE8
 Act9088X3DMooOVl89UYe5x/FX42mZR6FqYFFArk8rFs8zQqznrDRX1qAJXK8fh0zbNg
 c9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wXB1eTAxqsju0aM5A5RDZ+1cxmKYnF77Bv4+kmfr+08=;
 b=alwFNUgTpwPUTRazUZtwW8mtWFGDX7PY7BswWyU2VpOOKNFlCx5q1hnq0SZmJ+VZ26
 bj8IcDHqrRqkk0fPBmBGqmCQmIBwmUf7xfU8KwGEbTmYGrXEc2GEb4B3jf6E+/rW3qBD
 ySOrg8N04dMM3YfQn0cIRTJcEiRbJaC+ukbSYtefLK7+WO10Mc/74lXupFk7k2CBLbOc
 XEOAisgx5jYHj4Xn60DKE2YcmITFXiHmthg+8BIWnV2s6a5iD/QqWSwpGCxdunmLKn8f
 eW1i8bWQGBOA0ANgAJqux2D76Qn9/3Y7EtHHPWqKneKB6aEEXkWB7TlnymlLXtwEYIsK
 oFXw==
X-Gm-Message-State: AOAM530DUdnoVrw02dwtB7pFhPBIffy8qr+JmxtGGqexBS59M/wYR4Wl
 93JagD7yScI4jeSOKI4ey8Ev0Q==
X-Google-Smtp-Source: ABdhPJxvwHCoi1j/hoPppPSJvHE4pMStog7kQzFsNdAefSHfRWryS0eyg1DCjLZBilTNlBuqDxVEpw==
X-Received: by 2002:a1c:8f:: with SMTP id 137mr3034727wma.158.1599564632933;
 Tue, 08 Sep 2020 04:30:32 -0700 (PDT)
Received: from dell ([91.110.221.179])
 by smtp.gmail.com with ESMTPSA id y6sm14126980wrn.41.2020.09.08.04.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 04:30:32 -0700 (PDT)
Date: Tue, 8 Sep 2020 12:30:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: tosa_lcd: Include the right header
Message-ID: <20200908113030.GN4400@dell>
References: <20200826070917.100717-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826070917.100717-1-linus.walleij@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNiBBdWcgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIFRvc2EgYmFj
a2xpZ2h0IExDREUgZHJpdmVyIHdhcyBjb252ZXJ0ZWQgdG8gdXNlIEdQSU8gZGVzY3JpcHRvcnMK
PiBpbiAwYjBjYjUyYmQ4MGVkYTc2YzRiOTkyMWY1Y2Y5YzFiNzA5ZDQ0ZTgzCj4gKCJ2aWRlbzog
YmFja2xpZ2h0OiB0b3NhOiBVc2UgR1BJTyBsb29rdXAgdGFibGUiKSBidXQKPiBzdGlsbCBpbmNs
dWRlcyA8bGludXgvZ3Bpby5oPiByYXRoZXIgdGhhbiA8bGludXgvZ3Bpby9jb25zdW1lci5oPi4K
PiBGaXggaXQuCj4gCj4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gQ2M6IFJv
YmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgo+IFNpZ25lZC1vZmYtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvdG9zYV9sY2QuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
