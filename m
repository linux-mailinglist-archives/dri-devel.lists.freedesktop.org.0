Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43691EE953
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 21:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F8789154;
	Mon,  4 Nov 2019 20:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28A289146;
 Mon,  4 Nov 2019 20:18:59 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B55B321655;
 Mon,  4 Nov 2019 20:18:59 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id 205so17603411qkk.1;
 Mon, 04 Nov 2019 12:18:59 -0800 (PST)
X-Gm-Message-State: APjAAAWne/BG1IOioqEKlwN8S5qSEQNQlUeduAFOUuVfev2tPTTphD12
 jecgFkj8i++5hgazinHm/X2k7ZKH2LjdVF/ZwQ==
X-Google-Smtp-Source: APXvYqy+2TDn1ppQOdbox9dVjpoaM5UOxJ2o3eR8ZyLap8rNMbfAtTKwfGDbpdYuZMRnBc5OImTCfHCBp7JGrUt+jmo=
X-Received: by 2002:a05:620a:205d:: with SMTP id
 d29mr1189735qka.152.1572898738841; 
 Mon, 04 Nov 2019 12:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com>
 <20191031104402.31813-6-kholk11@gmail.com>
In-Reply-To: <20191031104402.31813-6-kholk11@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 Nov 2019 14:18:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLocqJOpK1zRah=nFPos6izcX5e0mHS1WBdYtZJm30QSA@mail.gmail.com>
Message-ID: <CAL_JsqLocqJOpK1zRah=nFPos6izcX5e0mHS1WBdYtZJm30QSA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B
 compatible
To: AngeloGioacchino Del Regno <kholk11@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572898739;
 bh=RLIrrknFz4bGTk4KfTN8equRNdviyydQMz+yWFN+VhQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IL+TrNHIRlr4u3r6/LyzdY1L7Eylbi+RUZe+yeMZdW/4vPfSjmaUQSx/gp0TsI+mb
 nzygeOjLWio8H8XQ9oIqEr+dnwKrCIlymS8ls5+KMGaS56CViGmYoCWJU6wdXUQwE5
 P7OcWsj1cWz1h6yb1eExKMPDcXdj1+ojrY6o4Me8=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgNTo0NCBBTSA8a2hvbGsxMUBnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gRnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29t
PgoKVXNlIGdldF9tYWludGFpbmVycy5wbCB0byBzZW5kIHRoaW5ncyB0byB0aGUgcmlnaHQgbGlz
dHMuCgo+IE9uIGZhbWlseSBCIFNvQ3MsIHRoZSAyOG5tIFBMTCBoYXMgYSBkaWZmZXJlbnQgaW9z
cGFjZSBhZGRyZXNzCj4gYW5kIHRoYXQgcmVxdWlyZWQgYSBuZXcgY29tcGF0aWJsZSBpbiB0aGUg
ZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGto
b2xrMTFAZ21haWwuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tc20vZHNpLnR4dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
