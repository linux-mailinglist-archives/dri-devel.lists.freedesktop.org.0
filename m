Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D88C4B6A6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 13:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0A96E370;
	Wed, 19 Jun 2019 11:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89B6E370
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:05:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c66so1282717wmf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 04:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xl41q9hNOc/g9EYGMDVv6e3kqykgA8u4AjfGsUyaRHQ=;
 b=T9PQ1WoMFIkbdtZBVocE5H4SO8h5w31gtuWPTh2ZcYiUBlQywNKuiawpsJrxLEjr0c
 iUMzW8PdSHOt/LSzwm9soovetLgLWgXpIZo0XeOMYN4fV/sRYO2Au4cdjnBi+xPDPFwB
 vOmQfPYCT7S2XR/oKM+/f51QkZsnpz8v3yudzJlkjTZ2+hU1XMtY772cnl2vdqQuvXup
 +BTUeaoXOfRdGCDI8ytC2RXJBP8Vw6EDvP/BEVLfd1mD3wNqeWuLgsJtSkX2qHF7ZTW1
 NQgnRuraTf/fvd47z35h2yFWn+CP9Tz4H1iNuXi8w6aAWyM1MPLyVlUct9dYyO4kRk/+
 28LA==
X-Gm-Message-State: APjAAAVUHvfmTdodn6qm6KIIXWfN/85dh0kLimdE9vYr+g+pxUNydJlP
 DF9CyaN0mUYlDhHFu5BL5by/Ew==
X-Google-Smtp-Source: APXvYqy0Vj4gusY17LcUMJkB9rXJuNIK1DSDRJXpXkTwo5jvGI4HfycfIswmjX9F29RGTZ3uyd8gDw==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr7615451wmj.2.1560942356321;
 Wed, 19 Jun 2019 04:05:56 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u6sm1599073wml.9.2019.06.19.04.05.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 04:05:55 -0700 (PDT)
Date: Wed, 19 Jun 2019 12:05:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/4] MAINTAINERS: Add entry for stable backlight sysfs
 ABI documentation
Message-ID: <20190619110553.zyz3jqshscqxqtum@holly.lan>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-2-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613194326.180889-2-mka@chromium.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xl41q9hNOc/g9EYGMDVv6e3kqykgA8u4AjfGsUyaRHQ=;
 b=JdBKTLDrjuc2YV4PWxdd20VcvL3iFMegCFa3Q6/uzxvqugEYTjmLnyj3TVyv5+lys4
 PVN+wGlTXU/nam3nxiTvzOWWzj9hPkoHQ+xbPGb+E3B8NyUvnBV/CfvX4yvCMHuiSmFt
 3AqbNmYSEqL1Es3/1h3AwunxKHbRwcaLzPU1yKE6dk5/1OO04B5XEPyBvkL2tpm1Flem
 EFAI8EhR6ft5+W4a1Rcw04rvaT/1+0dFW8gjs1eG/PoBy2xi+eySWVD8tVEPwTsoKRwn
 F9bSd1N5bhkLh+fdtRtGYuKSbiqJP1LG/v1NxcE+PbhV/JwyBeI09YxUpy7B5UiSy2q3
 Vipg==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTI6NDM6MjNQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gQWRkIGFuIGVudHJ5IGZvciB0aGUgc3RhYmxlIGJhY2tsaWdodCBzeXNmcyBB
QkkgdG8gdGhlIE1BSU5UQUlORVJTCj4gZmlsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlh
cyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KCldlbGwgc3BvdHRlZC4gVGhhbmtzIQoKQWNr
ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKRGFu
aWVsLgoKPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBp
bmRleCA1N2Y0OTZjZmY5OTkuLmQ1MWU3NDM0MDg3MCAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVS
Uwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTI4NTcsNiArMjg1Nyw3IEBAIEY6CWRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0Lwo+ICBGOglpbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5oCj4gIEY6CWlu
Y2x1ZGUvbGludXgvcHdtX2JhY2tsaWdodC5oCj4gIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodAo+ICtGOglEb2N1bWVudGF0aW9uL0FCSS9zdGFibGUv
c3lzZnMtY2xhc3MtYmFja2xpZ2h0Cj4gIAo+ICBCQVRNQU4gQURWQU5DRUQKPiAgTToJTWFyZWsg
TGluZG5lciA8bWFyZWtsaW5kbmVyQG5lb21haWxib3guY2g+Cj4gLS0gCj4gMi4yMi4wLnJjMi4z
ODMuZ2Y0ZmJiZjMwYzItZ29vZwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
