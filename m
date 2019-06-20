Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2D4C79A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1213E6E4DE;
	Thu, 20 Jun 2019 06:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6586E4B6;
 Thu, 20 Jun 2019 06:45:23 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81772206B7;
 Thu, 20 Jun 2019 06:45:22 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id r15so1537127lfm.11;
 Wed, 19 Jun 2019 23:45:22 -0700 (PDT)
X-Gm-Message-State: APjAAAXJI/nJYalBpVU/3+A+AvtGtBvNuuKGyzRGg1jUCMkMFLDtogc9
 whQxkODa9PUcoIUGSRsljSGc/k2jEJRoFuheeNM=
X-Google-Smtp-Source: APXvYqzXMlEY/WRYRayoBb9QKi4Js4cCJqzNnoDhraKHkdb99GqSISyR2bUT9/dCId6OIt4j0w0nHyGdi/cre7W70aY=
X-Received: by 2002:a19:4f50:: with SMTP id a16mr3006815lfk.24.1561013120878; 
 Wed, 19 Jun 2019 23:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190618185502.3839-1-krzk@kernel.org>
 <20190618185502.3839-2-krzk@kernel.org>
 <CAKGbVbvMVRiWXf8E8hpym_F7ovoXeeTc92-hh6hA6802487jOg@mail.gmail.com>
In-Reply-To: <CAKGbVbvMVRiWXf8E8hpym_F7ovoXeeTc92-hh6hA6802487jOg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 20 Jun 2019 08:45:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfnhHcTYiyj1yLD6QR6CzkGMZMY7cihUrc8yWNr4ZLzuw@mail.gmail.com>
Message-ID: <CAJKOXPfnhHcTYiyj1yLD6QR6CzkGMZMY7cihUrc8yWNr4ZLzuw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/lima: Reduce the amount of logs on deferred probe
To: Qiang Yu <yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561013122;
 bh=7B1t2Lh59wMHQUIE+uN8j8QjZZ9WGWxpnaWzK5i3AMg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ks+KzuBlz1+TXaILSP1LoVZbCmC7KmpfWi6RSi5ErY55ZuFOvOazwEiFhwYVzueFK
 Hg2KLZIrHkxsr8oE/X7jj2iJHgcSoU2KJ6cXG5atVyovMVjHbBPqPNajlgxQY8cnXw
 6/tseCRo8wlpCly3fXITnPqGlEDlnRZaiABZ5Gmg=
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
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMCBKdW4gMjAxOSBhdCAwMjo1NSwgUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gSXQgbG9va3MgbGlrZSBsaW1hX2Nsa19pbml0IHdpbGwgaGF2ZSB0aGUgc2Ft
ZSBwcm9ibGVtIGlmIGRldm1fY2xrX2dldAo+IHJldHVybnMgLUVQUk9CRV9ERUZFUi4KCkluZGVl
ZCwgYWx0aG91Z2ggSSBkaWQgbm90IGV4cGVyaWVuY2UgaXQgYnV0IGl0IGlzIHZhbGlkIHBvaW50
LiBJJ2xsIHNlbmQgdjIuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
