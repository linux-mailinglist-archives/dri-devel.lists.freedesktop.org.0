Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C34EAC00
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 09:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64316EC00;
	Thu, 31 Oct 2019 08:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D766EC00
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 08:58:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v9so5296852wrq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 01:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mM5JWFj5/j1kMfO0LYYDWqFAXV7BHBUBoAurAtsh+vs=;
 b=kAH6yCdubrrdNjSmVeuevJx5HRrbmUY/OcunUPD8Kz4f5b0IhjD63URlYjGdeROtaE
 EVE0kYZ1QLQ+VlKssihHFCqW9ZvzDCCkZINYMsl1+sqEvLW3cd5i4sFa4qHdT3wpcCHC
 MNHv/ctHlleC6bAHT/Cr3PNITHAzaCLlHgfGbQEdeAI3IDRPShCroCAzhWYc8c8vNRto
 3VAzpNVBGYkqEZkkl4n5nL72eYNX+tiSIr1E8bioJPEJNoN4kRXN2XH4rgG1GOpv2max
 u159MqKWL6MH4LNyNYkivPqQYf957EW43e0h7/j6pyZUxeCH5YWXZLTBxpqZj5KuV8XU
 ADVg==
X-Gm-Message-State: APjAAAUWixF8e60NCzLY/3NJCrmyGzUQshXPeNHIBwM0jg7HR0Fhv1fT
 Ho7Ym8hfDqXs2/+lbb26ybdC0A==
X-Google-Smtp-Source: APXvYqxdn+1tmOLx8ifp3F1PxxrO/zj4IhisAc9DnkIGdD19EJUgI1oKHtPcrdKzBLR3SbDRmKd/OA==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr4389080wrj.284.1572512327362; 
 Thu, 31 Oct 2019 01:58:47 -0700 (PDT)
Received: from dell ([2.31.163.64])
 by smtp.gmail.com with ESMTPSA id a206sm3494167wmf.15.2019.10.31.01.58.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 31 Oct 2019 01:58:46 -0700 (PDT)
Date: Thu, 31 Oct 2019 08:58:45 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V9 1/6] backlight: qcom-wled: Add new properties for
 PMI8998.
Message-ID: <20191031085845.GA5700@dell>
References: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
 <1571814423-6535-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571814423-6535-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=mM5JWFj5/j1kMfO0LYYDWqFAXV7BHBUBoAurAtsh+vs=;
 b=sjxcXNY1tNdgNLsdckLy5C5ghG1YOXnEJggZIwKLSbYHASKZ0ONzEsR8o2/z4bNoP3
 9Teai83oT5ZDna4z6Nt0jrz+QGFloBaBOr4xleRjnZCXPGaTaASxPAEgS3gkaR4UOUim
 HgufBrfwRfalglmkFZFdGS+v8blf8XzFfWvbg9zbnzix7ZdBQFQZj8/iK8td64QFmIqn
 YUWxnRz3USDGpylVcwrFMAUKt2ahxOCdzQnhRrLOxA2Bslx3GIlT//nu0z++uJRYxUWL
 Lb79ddtanLSnRnJjuVuxNA8I6VQTpjKBrL1O9ccy+PzpYaOgjKdplScT4ZxBNKagFyia
 PUlQ==
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

T24gV2VkLCAyMyBPY3QgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IFVwZGF0ZSB0aGUgYmlu
ZGluZ3Mgd2l0aCB0aGUgbmV3IHByb3BlcnRpZXMgdXNlZCBmb3IKPiBQTUk4OTk4Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+Cj4gUmV2aWV3
ZWQtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cj4gUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9xY29tLXdsZWQudHh0ICAgICAgICAgIHwgNzQgKysrKysrKysr
KysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpUaGlzIHBhdGNoIG5vIGxvbmdlciBhcHBsaWVzLgoKSXQgbG9va3MgbGlrZSB5
b3UgZHJvcHBlZCB0aGUgcmVuYW1lIHBhdGNoLgoKUGxlYXNlIHJlYmFzZSBhbGwgb2YgdGhlIHBh
dGNoZXMgaW4gdGhpcyBzZXQgb24gdG9wIG9mIGEgcmVsZWFzZWQKY29tbWl0IGFuZCByZXNlbmQu
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVh
ZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
