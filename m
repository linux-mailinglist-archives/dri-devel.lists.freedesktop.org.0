Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33FBF7080
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13596E867;
	Mon, 11 Nov 2019 09:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078726E867
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i10so13757027wrs.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VAhgFuknLH+5wiq8gpshwrQB5hsKGp5uyD1SKtlD5qw=;
 b=osskwcRIrn3pMaml4wjsjn+3Xd/VFyLJX0FqyxJPrPXzAheTq95chRFk27I5WxfswH
 7NyKq709waVMFfBx440MLw7JtGDEL+LiBU4aMo31LE0Hiz40hSRj9aICeptE+CNe5fVD
 Ukg3ljGR8I0M6cBWn1n2tZ0rej3G+TVSaS2k9LUiFpNSeokURwtRQnnlCbyc5jB6ortH
 4/I7pJAXbzVaZS0IJvJO0Fpd/hZRwoMaQsF7xSySfx+OVGAC5me4ZnVk9VQcLOjLAiZn
 6L1ob6a4FHOei8jGSkjtNp00HrtsY1lK1XPnhqo/rZbob69CFIPKWZRC8ZHKQjwt7ZSp
 Fcpw==
X-Gm-Message-State: APjAAAW5DUazI29Sz5vezREstKy0DIC+gzU+ZWN/Emfh0sGX0ShvqY9X
 f7a5t08lIAC+9RYt0SvUDngyUA==
X-Google-Smtp-Source: APXvYqyw8G9ReMr7hKfdQleBjqoUQ06hvaDyQGL44hHp1RrN1PqVZqBIUWqqsUUff682AmzCC8i97w==
X-Received: by 2002:adf:c105:: with SMTP id r5mr20303156wre.125.1573464310629; 
 Mon, 11 Nov 2019 01:25:10 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id q15sm6492591wrs.91.2019.11.11.01.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:25:10 -0800 (PST)
Date: Mon, 11 Nov 2019 09:25:02 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 3/8] backlight: qcom-wled: Add new properties for
 PMI8998.
Message-ID: <20191111092502.GQ18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-4-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=VAhgFuknLH+5wiq8gpshwrQB5hsKGp5uyD1SKtlD5qw=;
 b=ZZT3kTVKlAhZeX/N1Fvo+J/MQqwPp8uIHJEUXfME6HpfveP8v/D27PTJfk90U4I90t
 mRCY+1phXU1NUxl7eV15hmK5Jssl7QqveGx+YJP6NsK9o4z9qV8DuQUUn0Clxw9Xo1Vf
 d+afqPzL/lG3S0DnazgdXV3z/eBii8U3kCEmsQekT3lWdpDZ4M28XaPdcket6px5zV04
 HUX1dgoE0fBPFv2531agmoF8MECttCNT9Gh1/a895oEFOK/goc7fjsW/n98WgKy9mUIA
 Bx71jjuXJSuDJc7PuYxJssZ+RLKbj5x/4W2KzOVch2qQBCx97p4nDoX9RboELD8dQMwq
 Ewsg==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IFVwZGF0ZSB0aGUgYmlu
ZGluZ3Mgd2l0aCB0aGUgbmV3IHByb3BlcnRpZXMgdXNlZCBmb3IKPiBQTUk4OTk4Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+Cj4gUmV2aWV3
ZWQtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4gUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9xY29tLXdsZWQudHh0ICAgICAgICAgIHwgNzQgKysrKysrKysr
KysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxp
bmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
