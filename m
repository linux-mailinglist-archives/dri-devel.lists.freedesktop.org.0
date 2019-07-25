Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E974DB3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 14:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40098929A;
	Thu, 25 Jul 2019 12:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F59B6E72D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 12:04:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x15so44759131wmj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 05:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0FAnicQC3Lzrq72AlSeZdLbP8+ZrEQz5E7M32ViFUag=;
 b=B8rgxp2tajNbVq1Dw0VvsZ8+heW63U4PzHltge7n1bHIRpC0+XueGZirsUAdqee6sv
 8pDfEwf/BgTnrkt/cZ9hZru+a4lOSNrJAfpZ6OrHkMtDg6yGawK1bPsvt5J8w+fDgoWg
 +XZMyENM2st0wD6d5QlVSNQSWjySxEtHrzoBfBP7FbKztVeXx8skBWH9udWwOeuRV+ba
 2ya8AmZDQTu3ab9gmOrB8gbs9A84r2u8pxMYr7xlUMzmu7kRUZRB7w+wq9WstdBhihqa
 KP2Nkkq+CMuc9PMsN3/5OAfcDrSLHNOzJLfIaYx7PJ545k6WphRzAoVSruTdEzWTk/sG
 yC2Q==
X-Gm-Message-State: APjAAAVJYrPyKJShYItkSv1YW6DFgpDJNVqntuJbyR3ypF+9B+nG+uvc
 Ctaehs3Jya1U+ejF7GX0jb9uJx9s+Ow=
X-Google-Smtp-Source: APXvYqyA17hSbbdLRBtdRWn2rJjCbKZmwSesZdVDyxbiu4fImY7DoNEvEw2IuZHQTdAnPXau9t2MXg==
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr15972949wmk.5.1564056291947; 
 Thu, 25 Jul 2019 05:04:51 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id x18sm43748309wmi.12.2019.07.25.05.04.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 05:04:50 -0700 (PDT)
Date: Thu, 25 Jul 2019 13:04:39 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2] backlight: rave-sp: don't touch initial state and
 register with correct device
Message-ID: <20190725120439.GD23883@dell>
References: <20190708124129.5664-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708124129.5664-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=0FAnicQC3Lzrq72AlSeZdLbP8+ZrEQz5E7M32ViFUag=;
 b=Mpf0t5n2Y6gZPosgtjUZrHj5s8ybcrQhiRjYyOE5YCuQMx7G8vp5utLxHxd/efBD9k
 cbDbklpExmvoB5JFFOFNcO6Txuk6THss9ZC9NxEo4r5PBkv6BwxPm2uE1mXR9d4vnJge
 kSM0uuH4gZSGzsxZNqew8En9Nje9680gQjSssPh9CuJZLClj/p8JlxEQxA9Y+xrHj1s8
 hwYWvKvcsoKRseUv+WJCtcLxL2j9mShQHgSzXq8b/ZrtmU1R9B2j7s97faL8bb83LuEC
 I1G4imMKUhkiJUiAQ0xDbKJ5M7HvhVLL8XKRzguejj1nqsks5IJUZSXx71FFkFttZ4yX
 /iyQ==
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOCBKdWwgMjAxOSwgTHVjYXMgU3RhY2ggd3JvdGU6Cgo+IFRoaXMgd2F5IHRoZSBi
YWNrbGlnaHQgY2FuIGJlIHJlZmVyZW5jZWQgdGhyb3VnaCBpdHMgZGV2aWNlIG5vZGUgYW5kCj4g
ZW5hYmxpbmcvZGlzYWJsaW5nIGNhbiBiZSBtYW5hZ2VkIHRocm91Z2ggdGhlIHBhbmVsIGRyaXZl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5k
ZT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYyB8
IDEwICsrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGlu
YXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
