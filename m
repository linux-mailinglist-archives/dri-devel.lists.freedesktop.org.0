Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9B72D15
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882506E519;
	Wed, 24 Jul 2019 11:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD096E519
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:13:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so46493874wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7Vbm5wjodc/SiuXfd2hEHkZgRHnDrgsvnClch0dv500=;
 b=AI2TMeVlRCQvJwN6tDtNeDKk9cFu9rVrDG7IPz1xgxrVxhYlskOcM1E/8xTpH/zCZc
 3o+SRymAThUQJgNfw8ZZCgR6UjVD8w1SRzjRsqqtlN1lzeD3wvlW4dV5q6zTLWGWqkgA
 HouNRq0AbHCjPFVA+R7ra2CwmIufDXnxiEEpZpYyFULbrHyvV69F5LUyorh7BAor5V3S
 pKMJ7IE9hpf0BuZnEnCfMGNOkgDejSZQEY2mvu+V3dyIPFRmaG5cOhX9BnAdpUM9Mpz7
 +4CB4XynNgOys+W6slIN9SUZ8S/I4t8CnkgkqMgO5h13UWLLzo0QGdXQNZPOdS8NhMqa
 Rvjg==
X-Gm-Message-State: APjAAAV3tYJzXOIUWPD0J+Ss2N/JGsRHBMaPalgomI5yvBReEsNC1ndG
 kytMHRJC+quC6h8KKq0IfjmHtw==
X-Google-Smtp-Source: APXvYqxXj3Bvg1DEF4zdhtIcF4p/ecaSTdTJ//QjjR1Lmf36EMffI7ShBaIJZCpNdPfg/rB/y9TOjQ==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr72432053wrn.198.1563966793314; 
 Wed, 24 Jul 2019 04:13:13 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g10sm33641138wrw.60.2019.07.24.04.13.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 04:13:12 -0700 (PDT)
Date: Wed, 24 Jul 2019 12:13:11 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 5/7] backlight: gpio: remove dev from struct
 gpio_backlight
Message-ID: <20190724111311.zkhc4qzdktrw4sak@holly.lan>
References: <20190724082508.27617-1-brgl@bgdev.pl>
 <20190724082508.27617-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724082508.27617-6-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7Vbm5wjodc/SiuXfd2hEHkZgRHnDrgsvnClch0dv500=;
 b=zjqzTsV3sC2VxjWuPXKIKiVPljJPuNhPm9Eo3muadrJX0uOfyeRP1+0z8ruC5+uBE8
 kVQXypwUufH1EOWhSVEgvJXaLmrs0dD55o0bQZSbPtok43uPOWIpgx/J9ZAgKcMaFDvL
 Q40uZcOODl7gy7dZ7D8EvD3qHOxoegPBkNvZbDy2dht2yPpcz8YA3FqP8NlU2lS2Msop
 7sLjI5SyXrArFojZqSZa/e/oXEezqOZOSvnXHGQv8PbPyAG2kVKvRxQ73NEGep2YjF3P
 9dVHmIOtgEXHiVWyCgsdpGlyQcxDu6ipd0Rj/NtFnYRAUHak5chJc/jqi6L4LTZESixq
 xvvg==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MjU6MDZBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFRoaXMgZmllbGQgaXMgdW51c2VkLiBSZW1vdmUgaXQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNv
bT4KPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFj
a2xpZ2h0LmMgfCA0IC0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gaW5kZXggMDEyNjIxODZm
YTFlLi43MDg4MjU1NmYwNDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFj
a2xpZ2h0LmMKPiBAQCAtMTksOSArMTksNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+
ICAKPiAgc3RydWN0IGdwaW9fYmFja2xpZ2h0IHsKPiAtCXN0cnVjdCBkZXZpY2UgKmRldjsKPiAg
CXN0cnVjdCBkZXZpY2UgKmZiZGV2Owo+IC0KPiAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwo+
ICAJaW50IGRlZl92YWx1ZTsKPiAgfTsKPiBAQCAtNjksOCArNjcsNiBAQCBzdGF0aWMgaW50IGdw
aW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAo
Z2JsID09IE5VTEwpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0JZ2JsLT5kZXYgPSAmcGRl
di0+ZGV2Owo+IC0KPiAgCWlmIChwZGF0YSkKPiAgCQlnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2
Owo+ICAKPiAtLSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
