Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF93B868
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 17:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6EF8915B;
	Mon, 10 Jun 2019 15:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B521D8915B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:41:11 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E5E620862
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:41:11 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id y57so11069870qtk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 08:41:11 -0700 (PDT)
X-Gm-Message-State: APjAAAV9phMXBhNsyTx+kio2cLhKWrmTxR2i5aC6c70HtHzGBVq9yx/j
 K8QfSuBRneCcwmAqOzbN0Z1yTl710OgTFAIa4g==
X-Google-Smtp-Source: APXvYqydQzs4cjcSFJ8E3/ot+asEgpEsq2iXy80h4JLcIszoWdJjJbaM7LX/cRsox86nPbWtKcJk2grbkrhatgkzBqg=
X-Received: by 2002:aed:3b33:: with SMTP id p48mr53409177qte.143.1560181270746; 
 Mon, 10 Jun 2019 08:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190529065121.13485-1-boris.brezillon@collabora.com>
In-Reply-To: <20190529065121.13485-1-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 09:40:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJm48FGfJojjj_uyj9Xcv33bGhP30RYfy_Tr5xQ4JP+FQ@mail.gmail.com>
Message-ID: <CAL_JsqJm48FGfJojjj_uyj9Xcv33bGhP30RYfy_Tr5xQ4JP+FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gem_shmem: Use a writecombine mapping for ->vaddr
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560181271;
 bh=m1vsfrKCar4vKLtPTK9fl8x+KuHYly1l6SWaqfr6y+8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q7glsNUVhnVJyb4eBdeRQNvB7IJq8qAlW7LELo4J5s5ApGxSAH3G+bbbgi18tj85o
 dPLRcnaj07J49rBhds9CAZSiybfbU00jes7hOApVq1LmKOA1SsTdJvw+c4SafqmdJT
 KkscQxH0AOjERHsPUXvqHNNew2Jm9bIjx049QCpY=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTI6NTEgQU0gQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBSaWdodCBub3csIHRoZSBCTyBpcyBt
YXBwZWQgYXMgYSBjYWNoZWQgcmVnaW9uIHdoZW4gLT52bWFwKCkgaXMgY2FsbGVkCj4gYW5kIHRo
ZSB1bmRlcmx5aW5nIG9iamVjdCBpcyBub3QgYSBkbWFidWYuCj4gRG9pbmcgdGhhdCBtYWtlcyBj
YWNoZSBtYW5hZ2VtZW50IGEgYml0IG1vcmUgY29tcGxpY2F0ZWQgKHlvdSdkIG5lZWQKPiB0byBj
YWxsIGRtYV9tYXAvdW5tYXBfc2coKSBvbiB0aGUgLT5zZ3QgZmllbGQgZXZlcnl0aW1lIHRoZSBC
TyBpcyBhYm91dAo+IHRvIGJlIHBhc3NlZCB0byB0aGUgR1BVL0NQVSksIHNvIGxldCdzIG1hcCB0
aGUgQk8gd2l0aCB3cml0ZWNvbWJpbmUKPiBhdHRyaWJ1dGVzIGluc3RlYWQgKGFzIGRvbmUgaW4g
bW9zdCBkcml2ZXJzKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMu
YnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gRm91bmQgdGhpcyBpc3N1ZSB3aGlsZSB3
b3JraW5nIG9uIHBhbmZyb3N0IHBlcmZjbnQgd2hlcmUgdGhlIEdQVSBkdW1wcwo+IHBlcmYgY291
bnRlciB2YWx1ZXMgaW4gbWVtb3J5IGFuZCB0aGUgQ1BVIHJlYWRzIHRoZW0gYmFjayBpbgo+IGtl
cm5lbC1zcGFjZS4gVGhpcyBwYXRjaCBzZWVtcyB0byBzb2x2ZSB0aGUgdW5wcmVkaWN0YWJsZSBi
ZWhhdmlvciBJCj4gaGFkLgo+Cj4gSSBjYW4gYWxzbyBnbyBmb3IgdGhlIG90aGVyIG9wdGlvbiAo
Y2FsbCBkbWFfbWFwL3VubWFwL19zZygpIHdoZW4KPiBuZWVkZWQpIGlmIHlvdSB0aGluayB0aGF0
J3MgbW9yZSBhcHByb3ByaWF0ZS4KClVzaW5nIHdyaXRlY29tYmluZSBldmVyeXdoZXJlIHdhcyB0
aGUgaW50ZW50aW9uLCBidXQgSSBtaXNzZWQgdGhpcwpzcG90LiBJJ3ZlIGFwcGxpZWQgdGhpcyBh
ZGRpbmcgYSBGaXhlcyB0YWcuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
