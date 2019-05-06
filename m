Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5406614500
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584398922F;
	Mon,  6 May 2019 07:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F8A8922F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 07:08:53 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y19so767079lfy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 00:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ckxUK0EUtxo/rY9pVfkfhX61lQYjZP3T6ZijSk+Xis=;
 b=JeOSElcXmCSz18GtZwOQOLzn1KKlMQsvV99huHPfYtox7agpd/e835lCz0E2He1l9b
 /qnUnRaiFUAVyISV5J8ICjRgO9erlKNGH30bh65tmcsB4xccEujtxzqhoKDpUyxmMYIy
 eO+tAI9znxY0dEsIQHK1Ejz2DrU3sqWztlD4UwrKkCm3c3XDmtzmTfp0v4lBRiMqVeUp
 XkAHaqg4EYmirn8Y7KhvUsIFojg6udcMSsjijFhbM38I8k1Ozk23O7aKwZdI7dK30Fzx
 7UPFqv3Lgmyb4Y8a2suRoZGBTBAxjlZiEgWIKvZRNbpL1uGGX62okGGeHqZfe76CLh/c
 Tvow==
X-Gm-Message-State: APjAAAVw1306tXrXajgl3KrBpschg5/XHSuOkBYWIWOes9RZS+h0JgVQ
 Cglf4bOqSJwfT+qlpcn7qDmWn3ngQt6IMLy7NWGXmg==
X-Google-Smtp-Source: APXvYqzCc/OSjn4pYKPp9j7dsjoSNEmMF6+y2Uv/KDTK9i/yRnI7v8HdczB/oMXqR5l+25NY5pgqs0RUm+/PLM5ihP0=
X-Received: by 2002:ac2:5381:: with SMTP id g1mr11913523lfh.130.1557126532214; 
 Mon, 06 May 2019 00:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-6-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-6-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2019 09:08:40 +0200
Message-ID: <CACRpkdZ608b7+mh8Ln9N7EdGQmu2YNdZqRzoYjwfZXtcWqFE5g@mail.gmail.com>
Subject: Re: [PATCH RFC 5/6] ARM: dts: qcom: msm8974-hammerhead: add support
 for backlight
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1ckxUK0EUtxo/rY9pVfkfhX61lQYjZP3T6ZijSk+Xis=;
 b=r/h/kNCyuv2LvDzVu1yxK2Pm9OQBmhjtYxX3feYYLTgvRpNmfmIv3nnqgAboDR0p0E
 B2Rw1gnv2ZURIXNuRQtBE/9IZ3ViUqrugMcI+kGblYdzsYaPm1H471eRPgzRnX+xdBDu
 dbCZroaZtjew5vv0xcxC4b0ofWDB8YT8OA6yQCUyyI+jdhtx76GNqhTsAip/WQ7mLI3X
 baWB6qrwoWrac+JVW+frSKfR3417U0+pNBq7bU1IjZ0+PDbrWX/PyUh1cMCj1Ma6g/eF
 aQXzDs+MTOJeL6OShLSE/c2sKBInacUOLjcAGdio5C2LJU3cxx3RIlsh+Su4juviTVcf
 6z7A==
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgNSwgMjAxOSBhdCAzOjA0IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gQWRkIG5lY2Vzc2FyeSBkZXZpY2UgdHJlZSBub2RlcyBmb3Ig
dGhlIG1haW4gTENEIGJhY2tsaWdodC4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8
bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KCj4gVGhpcyByZXF1aXJlcyB0aGlzIHNlcmllcyB0aGF0IEkg
c3VibWl0dGVkIHRvIHRoZSBMRUQgLyBiYWNrbGlnaHQKPiBzdWJzeXN0ZW06Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDQyNDA5MjUwNS42NTc4LTEtbWFzbmV5YkBvbnN0YXRp
b24ub3JnLwo+IEl0J3MgcmVjZWl2ZWQgMyB7UmV2aWV3ZWQsQWNrZWR9LUJ5cywgYW5kIGhhcyBu
byBvdXRzdGFuZGluZyBjaGFuZ2UKPiByZXF1ZXN0cywgc28gSSBleHBlY3QgaXQnbGwgYmUgbWVy
Z2VkIHNvb24uCgpJZiB0aGUgRFQgYmluZGluZ3MgYXJlIEFDS2VkIGFuZCByZXZpZXdlZCB3ZSBj
YW4gbWVyZ2UgRFRTCmZpbGVzIHVzaW5nIGl0IElNTy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
