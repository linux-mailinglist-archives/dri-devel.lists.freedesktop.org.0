Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E502C814
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 15:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D4A898F1;
	Tue, 28 May 2019 13:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4B989817
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 13:46:27 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a25so4771021lfg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 06:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uimJHxg6x5yQ0SkHYR4jhNo2jzcs/560scjjidJxXaA=;
 b=g2O+Me02HKPM3TTGYjnRFtPgMUKywLvg1XgAZrRd4LcrYR3znLtB6yHLIHn/7v80jG
 AG9XLWlacZX7cqijZpVhwHvGSDqi9aUcShOe7NWuOBA/CWIymKghBWfzp20nmquzgJvZ
 FrlHZJWxJKU4nNhB+a6xv/6LfVzc+sCP8ktip5QQayjRuOowrNUT2iNKShR3CerBDnxz
 e2J4MnfwN/UUb5C3u36BeM84N9EH/sfsX0kITkyfon9S+8WmXKHb9ejXOgis2z1FjrNs
 Kd/WKWlrPddgYcbOws0dHLqCrv3ZyRfLxDB/KSyxXz7160MOI08P3+ZJkwMdH8kA7OTK
 7j9Q==
X-Gm-Message-State: APjAAAVuQPjoj+tCTm1RagYXgJXE3T8xWvkBf3s2EGJPjGz8qWJZvk/O
 myHrkUSmTXNTcV3w3kvFkqskIYzBIdjDOvjQnCNG3Q==
X-Google-Smtp-Source: APXvYqy4gMwzBlvFh/Ib5gpRrpfYM0F0Z553OBKhHwqFjc4A6FVcEqQkL1jjwcIYhdWJgpLzcJ0GmyoVFzYPjUkcRek=
X-Received: by 2002:ac2:48ad:: with SMTP id u13mr33425124lfg.60.1559051186146; 
 Tue, 28 May 2019 06:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2019 15:46:14 +0200
Message-ID: <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uimJHxg6x5yQ0SkHYR4jhNo2jzcs/560scjjidJxXaA=;
 b=wIhuxC/qafCCzj9xj0e1GyrPTHQ9LBOu5VnQiwMSnJKjudJatYnjbRzVzl7upG0ngG
 cWtzKZmvp4vPIiRmvem2OWDEplCrgRfOuYzeq7EjL6eblc1GzwDuuKZ/uZmXUkyNAH6M
 h9ICrKl5D7CVaL58rjVCvLBqaPUOu/RAf73EcQDaGcodz0JIMVeJAaFbOlYrV7vaY7hb
 QOvaCL5bfa8tmpaGCOdUxmeU8tEyo+OhnsBwZdL+LTvxyjKmLP60bPkiyBYGH1eR6nw8
 87ZbuRmU9ShywtYnKzjS+OIQJmbJ9jsjjuUx2i0hIDJr5LWtHvg2bAOY8ivWaoxDmWM0
 b3Yg==
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCA0OjA0IEFNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gSGVyZSBpcyBhIHBhdGNoIHNlcmllcyB0aGF0IGFkZHMgaW5p
dGlhbCBkaXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBMRwo+IE5leHVzIDUgKGhhbW1lcmhlYWQpIHBo
b25lLiBJdCdzIG5vdCBmdWxseSB3b3JraW5nIHNvIHRoYXQncyB3aHkgc29tZQo+IG9mIHRoZXNl
IHBhdGNoZXMgYXJlIFJGQyB1bnRpbCB3ZSBjYW4gZ2V0IGl0IGZ1bGx5IHdvcmtpbmcuCj4KPiBU
aGUgcGhvbmVzIGJvb3RzIGludG8gdGVybWluYWwgbW9kZSwgaG93ZXZlciB0aGVyZSBpcyBhIHNl
dmVyYWwgc2Vjb25kCj4gKG9yIG1vcmUpIGRlbGF5IHdoZW4gd3JpdGluZyB0byB0dHkxIGNvbXBh
cmVkIHRvIHdoZW4gdGhlIGNoYW5nZXMgYXJlCj4gYWN0dWFsbHkgc2hvd24gb24gdGhlIHNjcmVl
bi4gVGhlIGZvbGxvd2luZyBlcnJvcnMgYXJlIGluIGRtZXNnOgoKSSB0ZXN0ZWQgdG8gYXBwbHkg
cGF0Y2hlcyAyLTYgYW5kIGdvdCB0aGUgY29uc29sZSB1cCBvbiB0aGUgcGhvbmUgYXMgd2VsbC4K
SSBzZWUgdGhlIHNhbWUgdGltb3V0cywgYW5kIEkgYWxzbyBub3RpY2UgdGhlIHVwZGF0ZSBpcyBz
bG93IGluIHRoZQpkaXNwbGF5LCBhcyBpZiB0aGUgRFNJIHBhbmVsIHdhcyBydW5uaW5nIGluIGxv
dyBwb3dlciAoTFApIG1vZGUuCgpXYXMgYm9vdGluZyB0aGlzIHRvIGRvIHNvbWUgb3RoZXIgd29y
aywgYnV0IGhhcHB5IHRvIHNlZSB0aGUgcHJvZ3Jlc3MhCgpZb3VycywKTGludXMgV2FsbGVpagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
