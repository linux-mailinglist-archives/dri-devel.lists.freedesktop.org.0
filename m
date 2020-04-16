Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F81ABD1D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 11:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283796E07B;
	Thu, 16 Apr 2020 09:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B486E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 09:43:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r26so4117810wmh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HGxQAf4jzO0Y72QET7kmxlzHV6ZBerU4O88zy1fdfpU=;
 b=MF93gO4SxOKB+qMBCapHcHMZU0uM5bpS0SLZlRWzKz2vzZa6uzWpvbbHmobJw6Axls
 QFbr4PiLPQVCBaA283wChwtst2isWHpmYZCkMdabMfE5kIfxyqwTGzA0Oh3gLfQ7+qht
 Gr+qzkKMNCKQBYc4xDFiFXf+bN+ljZmDJTXOSbEbkin7y9u1t1lVjadCyGVDT7u3Qlvg
 MLFFL50zXCqauyOmSnhvmXGHAU4QsZNR56g0QGsGJk1OJc37DNYzZ8A0B7v53rZEave3
 +dAJT6Hw1W5aJbccuFdyz7QCBJGawOEsWCQtES9T5+pEJd3hRu7iNIcAQh12pLwlmDF5
 pajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HGxQAf4jzO0Y72QET7kmxlzHV6ZBerU4O88zy1fdfpU=;
 b=Dvo+duVUKujbffxkhuje/42ElHCCzsjlxH6BlweGIRW9UL0k/GkBp6WZSX1mE0CRK8
 +NKVZlMInGXOrTMclmd6QW6DYoCg4o7vUDX1Hl4qYSNG5xR7JMS2KFaUcQwn9ULqAorL
 C2YMHdI7VgJP/NvMFGmxsjlZCKoWwvwgnB5ogO1zxVmdowKp91u9fArtfk9GwmVJEg/J
 Q9HqgcKbb+hWQo68GCoxBx2HbQqWuXJgROP9F3kzdi1CnvHHKtnCyCRZk2O82HxgVXWL
 6UZ0L9L6UiimThQbTZwDWioQyO4699bX6agR+DcKf5/7l8ScFA0DmeLHTLgG2uy4Dc3O
 8Kxg==
X-Gm-Message-State: AGi0PuZmZn8vidmP4HM7CExHm0rdi7c/pccRq7ojySF3uWTfXD2VEEWb
 of3MVP0xabMK5OSu6jbC70mqgw==
X-Google-Smtp-Source: APiQypJ76t5SrWztUDY3rBe8WJkYQzpZ53gL1ZUvzn8pvMoGaJezCgphDoFggL9MkZuivZ/hxX5NFA==
X-Received: by 2002:a7b:c941:: with SMTP id i1mr3721926wml.132.1587030200692; 
 Thu, 16 Apr 2020 02:43:20 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id z15sm14612513wrs.47.2020.04.16.02.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 02:43:19 -0700 (PDT)
Date: Thu, 16 Apr 2020 10:44:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v12 09/11] backlight: pwm_bl: Use 64-bit division function
Message-ID: <20200416094420.GB2167633@dell>
References: <cover.1586414867.git.gurus@codeaurora.org>
 <e2139a83008e9f301889f9384487c55de475a6a2.1586414867.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2139a83008e9f301889f9384487c55de475a6a2.1586414867.git.gurus@codeaurora.org>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 David Collins <collinsd@codeaurora.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-fbdev@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwOCBBcHIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIHdyb3RlOgoKPiBTaW5jZSB0
aGUgUFdNIGZyYW1ld29yayBpcyBzd2l0Y2hpbmcgc3RydWN0IHB3bV9zdGF0ZS5wZXJpb2QncyBk
YXRhdHlwZQo+IHRvIHU2NCwgcHJlcGFyZSBmb3IgdGhpcyB0cmFuc2l0aW9uIGJ5IHVzaW5nIGRp
dl91NjQgdG8gaGFuZGxlIGEgNjQtYml0Cj4gZGl2aWRlbmQgaW5zdGVhZCBvZiBhIHN0cmFpZ2h0
IGRpdmlzaW9uIG9wZXJhdGlvbi4KPiAKPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4K
PiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+Cj4gQ2M6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiBDYzogbGludXgtcHdt
QHZnZXIua2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1cnUg
RGFzIFNyaW5hZ2VzaCA8Z3VydXNAY29kZWF1cm9yYS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKSSBzZWUgdGhhdCB0aGlzIGlzIHBhcnQgb2YgYSBs
YXJnZSBzZXQsIGJ1dCB0aGUgcmVtYWluZGVyIG9mIHRoZQpwYXRjaGVzIGhhdmUgYmVlbiBoaWRk
ZW4gZnJvbSBtZS4KCkRvZXMgdGhpcyBtZWFuIEkgY2FuIGFwcGx5IHRoaXMgcGF0Y2ggb24gaXRz
IG93bj8KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiBpbmRleCBlZmI0ZWZjLi4zZTVkYmNm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gKysrIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiBAQCAtNjI1LDcgKzYyNSw4IEBAIHN0
YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAJCXBiLT5zY2FsZSA9IGRhdGEtPm1heF9icmlnaHRuZXNzOwo+ICAJfQo+ICAKPiAtCXBi
LT5sdGhfYnJpZ2h0bmVzcyA9IGRhdGEtPmx0aF9icmlnaHRuZXNzICogKHN0YXRlLnBlcmlvZCAv
IHBiLT5zY2FsZSk7Cj4gKwlwYi0+bHRoX2JyaWdodG5lc3MgPSBkYXRhLT5sdGhfYnJpZ2h0bmVz
cyAqIChkaXZfdTY0KHN0YXRlLnBlcmlvZCwKPiArCQkJCXBiLT5zY2FsZSkpOwo+ICAKPiAgCXBy
b3BzLnR5cGUgPSBCQUNLTElHSFRfUkFXOwo+ICAJcHJvcHMubWF4X2JyaWdodG5lc3MgPSBkYXRh
LT5tYXhfYnJpZ2h0bmVzczsKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZp
Y2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
