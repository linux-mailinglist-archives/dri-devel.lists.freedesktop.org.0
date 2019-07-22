Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7797125D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7347F89F3C;
	Tue, 23 Jul 2019 07:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AF589A83
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:26:40 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b17so25983531lff.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 01:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qfvfkEyZd+DLJr7SlSsxk5CR4wqlGHyDi7qXTnWxyjM=;
 b=Ov36HN1wPSWA0NtcCk5ypzhStKqG+KmqgnVeOcyiICmSCJU3nzRNfP23MbXDhLR+C3
 CFxXxng74c+eVpupjijvP+iksqlrWElhA92f4I4s5Bsi6zFXLo1Wj+GS5iVTsM8LGeum
 jOTjEXl3M+iC3CfbcaHEt/mADdrsVDsYsHeidZbsz+AV2ixBu/8D2aQ366mlMcyCUTvj
 okVCPr7zpUVE0AQUvoNqc6T6oZcaTV2lXZC5EFsfEPkaWlZMvgd4LuCpwBwLjIbmOP9e
 PhykYsxQHMHKY5AtdoRgynqq1O6ofP8F8KQtdtRkMG21y90wgqbH5DjdChdY18yPh9Y2
 6dlw==
X-Gm-Message-State: APjAAAUrOD1ua52nfkF0ZBBPoevest6D2rPrd1YqxNWgHnoAlKAB+lP2
 Nc6PtSjhyLDBGeDt3wyQLUuVFbESVTpC183F4wo=
X-Google-Smtp-Source: APXvYqwdhc62rde+BTL3HtJEfabYZbOQO1FtvdIwx9Mc0UCkMBYiG0Q9xBEQCHEmk0uZ9+MEutmP0pVQlvGMwM821Q8=
X-Received: by 2002:ac2:568e:: with SMTP id 14mr31838975lfr.189.1563783998994; 
 Mon, 22 Jul 2019 01:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <1562781795-3494-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1562781795-3494-1-git-send-email-jrdr.linux@gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 22 Jul 2019 13:56:27 +0530
Message-ID: <CAFqt6zb-LmG4PrWCXfmDqor2bgxyFJRt5Yg0vmNgE9zvaw+S3Q@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: nvidia: Remove extra return
To: adaplas@gmail.com, b.zolnierkie@samsung.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qfvfkEyZd+DLJr7SlSsxk5CR4wqlGHyDi7qXTnWxyjM=;
 b=qU5ZgH7lnaBzI3Nk5qQNMvhVjMl1vZtjvP9SIy4aOn1q2RIFIL5sAukQ+3bhdueGsf
 gF8gLTsZT604maLq0+AppwcO65gamoxEZLGspJOmgg4gf0xYYZ8jBYG5qwrYKk/BXyRJ
 KOPx7ak3bgjRRiylLqULa2Dgx8dDTnjDL81skNMbTQktuIrwOxJUPGx4WI7O0GGObHJC
 7ubrWYDhzeHI50ALl8xoEgp/omFiEBRd7mHRj5mB42vvJUoHH6GF3YybSOuAgSTSAxCO
 gBb6cTwH9guFxUqHNDSlFxGiwrMrCoGUKv28FutneKRZuXRl8o3ZRFgKBxjx+VvqE2aY
 msPQ==
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
 dri-devel@lists.freedesktop.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMTE6MjggUE0gU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTWlub3IgY2xlYW51cCB0byByZW1vdmUgZXh0cmEg
cmV0dXJuIHN0YXRlbWVudC4KPgoKQW55IGNvbW1lbnQgb24gdGhpcyBwYXRjaCA/Cgo+IFNpZ25l
ZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udl9iYWNrbGlnaHQuYyB8IDIgLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by9mYmRldi9udmlkaWEvbnZfYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRp
YS9udl9iYWNrbGlnaHQuYwo+IGluZGV4IGU3MDVhNzguLjJjZTUzNTIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9udmlkaWEvbnZfYmFja2xpZ2h0LmMKPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L252aWRpYS9udl9iYWNrbGlnaHQuYwo+IEBAIC0xMjMsOCArMTIzLDYgQEAg
dm9pZCBudmlkaWFfYmxfaW5pdChzdHJ1Y3QgbnZpZGlhX3BhciAqcGFyKQo+Cj4gICAgICAgICBw
cmludGsoIm52aWRpYTogQmFja2xpZ2h0IGluaXRpYWxpemVkICglcylcbiIsIG5hbWUpOwo+Cj4g
LSAgICAgICByZXR1cm47Cj4gLQo+ICBlcnJvcjoKPiAgICAgICAgIHJldHVybjsKPiAgfQo+IC0t
Cj4gMS45LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
