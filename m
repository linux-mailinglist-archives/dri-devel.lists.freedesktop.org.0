Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC268725
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 12:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDB389938;
	Mon, 15 Jul 2019 10:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3B089938
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 10:40:52 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l2so14665121wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 03:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9uBhlIU2szBotflkNdAmaBH8KE8ZJQBhkw7CUx5y0fo=;
 b=Gaz0m9BQNvCuJw2lv+6O0hvbjxEPgCcyH1IXfyPdd1W7FnBqW/auC3WmbGoIcWLjL8
 FMhwj5Lc/xq7HPhDvn+U8YJcYnUtrnLBLm3ykGe76G7qjmr1Fn/pbM9+nBq4wJwa3KhQ
 rdKT99+dNCS4/X3n3l5athWaPA4fLC6RXvCSL6waWt85FpmGgFgaR9GCIsXe3Kv2e0zF
 fJj/y1ZVHr3hazUS7QTWna0mS2jKjraR1Jia1zMSvXs1uXoOMMiKHCwYc523K1K+cnMb
 Y2idfi/64/WdrDJbAB87ZrpjoRLltVVf8yx/vKQE3PrPgUWPNenUKmyTax8pYHj0M68w
 jENw==
X-Gm-Message-State: APjAAAWyr/Uh/Esgmojlf0GNtjOLEQLthdI6vl4b3wwDru1zzrww6HxL
 sOquFlRE1oldYbRfn06MJXM=
X-Google-Smtp-Source: APXvYqyob/S8uNsVUwjk6Ce53GygAkmpira++H3AiLt8ALVqVysp39ciacNI0RAf3DgVc9jeNDkegQ==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr23986491wmc.1.1563187251053;
 Mon, 15 Jul 2019 03:40:51 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id f17sm14917117wmf.27.2019.07.15.03.40.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 03:40:50 -0700 (PDT)
Date: Mon, 15 Jul 2019 11:40:49 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH v3 24/24] video: fbdev-MMP: Remove call to memset after
 dma_alloc_coherent
Message-ID: <20190715104049.GC20839@arch-x1c3>
References: <20190715032017.7311-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715032017.7311-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9uBhlIU2szBotflkNdAmaBH8KE8ZJQBhkw7CUx5y0fo=;
 b=hCO/Lu8LiB+cld8yeqGPNjY7w/9KgXng4ECiHyBd4FH2qOmfuaXjOcQfltENZAr+qo
 oJlvvcT4zEi5rJxL042/5zXaDQVxjbcRXsXzl9CMMdA5PQAf0wpmwZZDva7D6x7WmukC
 aeRDA/uRTNi4e3CVtqpPwKwBzPfAzsHlJSKimLAsKtI7pAHNP2E9TU0igyzie5m4637o
 MNecrY2M6akN1QTJwEq1VHO43Z0WevQQ1RtQvvxLPZgKR3buFiS2QzLstC+AJwbqPzvF
 Klm4ks1OWpTP3gvUVM3U0ypTbRbZGkry/YOkDr6Iz1CWDXkcLpBfKIkO4HLcf39LepYK
 6XEA==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8xNSwgRnVxaWFuIEh1YW5nIHdyb3RlOgo+IEluIGNvbW1pdCA1MThhMmYxOTI1
YzMKPiAoImRtYS1tYXBwaW5nOiB6ZXJvIG1lbW9yeSByZXR1cm5lZCBmcm9tIGRtYV9hbGxvY18q
IiksCj4gZG1hX2FsbG9jX2NvaGVyZW50IGhhcyBhbHJlYWR5IHplcm9lZCB0aGUgbWVtb3J5Lgo+
IFNvIG1lbXNldCBpcyBub3QgbmVlZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFu
ZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gICAt
IFVzZSBhY3R1YWwgY29tbWl0IHJhdGhlciB0aGFuIHRoZSBtZXJnZSBjb21taXQgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlCj4gCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2ZiL21tcGZiLmMgfCAx
IC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKClJldmlld2VkLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
