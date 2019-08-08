Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E986D69
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3379F6ECD8;
	Thu,  8 Aug 2019 22:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE936ECD8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:51:13 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C042721882
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:51:12 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id k10so24862074qtq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:51:12 -0700 (PDT)
X-Gm-Message-State: APjAAAXVMvGH4u/jZyu1l6baSCLkDtQY+UL1xvqia6eUthlrd5mKijds
 Q6/kCYyPCu2nN9QJ9mgu4el7on3VBVaarjazcg==
X-Google-Smtp-Source: APXvYqyA2hIn0XiJuNJycBxSwBWHdeqoDL4GvlfM5I+8YAcF6aweUhFP77P+e7q5rCrWfED65M/i24zSoWbAiQ4R7gM=
X-Received: by 2002:a0c:baa1:: with SMTP id x33mr15618231qvf.200.1565304671853; 
 Thu, 08 Aug 2019 15:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190808134417.10610-1-kraxel@redhat.com>
 <20190808134417.10610-7-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-7-kraxel@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2019 16:51:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJd=Ra1Fc=g5qu4AABmi_YaQzaBFdhnoTkQpkA6n4B82w@mail.gmail.com>
Message-ID: <CAL_JsqJd=Ra1Fc=g5qu4AABmi_YaQzaBFdhnoTkQpkA6n4B82w@mail.gmail.com>
Subject: Re: [PATCH v4 06/17] drm/shmem: switch shmem helper to
 drm_gem_object_funcs->mmap
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565304672;
 bh=2E5zXkmUdh7YQCGVCVw3jcywOMy6GhyyM90zGnvuCe4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pebzK+QkjACrnuP9JbealzZ490748wvrZe8I+BlTpj4nkRcwzqUE61Xga4hMDpYL/
 hHzx9lIbkXJHshWB7MLp0zjsgu+A0iwoZ3FOKkOVKKUhlTIh6mfCPHU3GrXwEzQPIC
 3uVfoA9QCFrYbc77z2Ke69Iu8FDsgiOLP1enN8SE=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA3OjQ0IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IFN3aXRjaCBnZW0gc2htZW0gaGVscGVyIGZyb20gZ2VtX2RyaXZl
ci0+Zm9wcy0+bW1hcCB0bwo+IGRybV9nZW1fb2JqZWN0X2Z1bmNzLT5tbWFwLgo+Cj4gU2lnbmVk
LW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1
ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmggICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgIHwgMTggKysrKysrKy0tLS0tLS0tLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYyB8ICAxICsKPiAgZHJpdmVy
cy9ncHUvZHJtL3YzZC92M2RfYm8uYyAgICAgICAgICAgIHwgIDEgKwo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
