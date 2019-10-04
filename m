Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3BACB7AF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 11:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5346EB02;
	Fri,  4 Oct 2019 09:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD366EB02
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 09:53:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v8so6384402wrt.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 02:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8YhHlhwGt1TAWXafFmkDE+SBCnhwFe8ErS8cgtMMTtE=;
 b=EDDFAvIa6V0455Em26zhCZuE7OnHycrqWvW0V0xawgTtS8Dzq9B6uMDPKkWuksrsvi
 BVoOAAlgT+nM/CNCWLnayClbah2/QjFFbHjW22+Sv6/zKMPkbxMhpDLt2rAt18TsLiKq
 hthbTn3tq1mMtbI0SdGLUg+Y87zfkr9SjsLsByimM6gBrEhFkwkCJzcSOAtfvBCUhftQ
 XLA7BG0QpJDf9l3iTtkyL424h5F2cYX8UZLjYvG+I+NSzNoiU4k9tfRgvclEOANvKhVO
 YltWppjdRph0ZUaRn+u060abH4RbqRIdWeKAhW7/kRh5zAnPQpyTzVrCki6hpHRPLA8V
 tZXA==
X-Gm-Message-State: APjAAAVig8yKjx27p7OLO3rQ+xW7ofwKRwb14bWHV9ukFT7e2z5yC9kw
 L8o0UCNPxJkLSei3OFV2qOw60Q==
X-Google-Smtp-Source: APXvYqx575IgPMR5+hBw1Fkasc8Zm3FBPTFTq4xTXjeUiMnpd3XGClpUvuFfrq51IvPd6NIsV6MwQA==
X-Received: by 2002:a5d:4b52:: with SMTP id w18mr1225370wrs.239.1570182802022; 
 Fri, 04 Oct 2019 02:53:22 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b7sm1483036wrx.56.2019.10.04.02.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 02:53:21 -0700 (PDT)
Date: Fri, 4 Oct 2019 10:53:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] backlight: pwm_bl: Add missing curly branches in else
 branch
Message-ID: <20191004095319.dkcjemag65xgsmp5@holly.lan>
References: <20191003213502.102110-1-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003213502.102110-1-mka@chromium.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8YhHlhwGt1TAWXafFmkDE+SBCnhwFe8ErS8cgtMMTtE=;
 b=rVWsqpzVnJGi0YJ4CwuRNcaOlX+d7aKvIZN1mIp3uBoH7n6mm4b9o6bFRNye4VHvN0
 dmHpJgNyeQXGqq8oqFzi3tkydvv82SxHK6xZ5YgxvmJH2xq7/U3SLoSuKymkyPG7iYi6
 ScXsvWgiaPqfKnMnQUFEp15myR3XEB5V/7GNNKMgjnsvzfBTL2SIUtBXFMk81yumnur+
 vAjwHRiomQ54AQh7zgwceSjUCQqaCw7uoyVyVERGlXcoObSRoJk23p4RPVwZzRIE3bz8
 dRbbKGwpYcig8zrQ7LbMq4VYgJo0hVr2YcX3dJzKnSDqS7/z02rpCGlHl1kbulLwflaw
 VuMQ==
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
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDI6MzU6MDJQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gQWRkIGN1cmx5IGJyYWNlcyB0byBhbiAnZWxzZScgYnJhbmNoIGluIHB3bV9i
YWNrbGlnaHRfdXBkYXRlX3N0YXR1cygpCj4gdG8gbWF0Y2ggdGhlIGNvcnJlc3BvbmRpbmcgJ2lm
JyBicmFuY2guCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJv
bWl1bS5vcmc+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25A
bGluYXJvLm9yZz4KCj4gLS0tCj4gCj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5j
IHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gaW5kZXggNzQ2ZWViYzQxMWRmLi4xMzBh
YmZmMjcwNWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMK
PiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+IEBAIC0xMjUsOCArMTI1
LDkgQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2ts
aWdodF9kZXZpY2UgKmJsKQo+ICAJCXN0YXRlLmR1dHlfY3ljbGUgPSBjb21wdXRlX2R1dHlfY3lj
bGUocGIsIGJyaWdodG5lc3MpOwo+ICAJCXB3bV9hcHBseV9zdGF0ZShwYi0+cHdtLCAmc3RhdGUp
Owo+ICAJCXB3bV9iYWNrbGlnaHRfcG93ZXJfb24ocGIpOwo+IC0JfSBlbHNlCj4gKwl9IGVsc2Ug
ewo+ICAJCXB3bV9iYWNrbGlnaHRfcG93ZXJfb2ZmKHBiKTsKPiArCX0KPiAgCj4gIAlpZiAocGIt
Pm5vdGlmeV9hZnRlcikKPiAgCQlwYi0+bm90aWZ5X2FmdGVyKHBiLT5kZXYsIGJyaWdodG5lc3Mp
Owo+IC0tIAo+IDIuMjMuMC40NDQuZzE4ZWViNWEyNjUtZ29vZwo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
