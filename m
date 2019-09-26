Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8842C002E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3826EE90;
	Fri, 27 Sep 2019 07:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F4F897E4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 10:26:07 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x8QAPidZ024941
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 19:25:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x8QAPidZ024941
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id z14so1202523vsz.13
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 03:25:44 -0700 (PDT)
X-Gm-Message-State: APjAAAWSTI2yDShO8uc3ZHb+tegDglK70Vo6YgDK6IyLj9Hsixw74rCg
 ZxlWSZ1UrDLMy0Pta6Edzs9H0Oz8fHb/cXNlU+c=
X-Google-Smtp-Source: APXvYqyeIspKm3xk+JKqX7PSS7gDWlcm9BZdyqAWf+X9fC0of2bjx1GwXyPr283EhOahiarlzOo3vv0bAZkcr7AOlSE=
X-Received: by 2002:a67:1a41:: with SMTP id a62mr1750823vsa.54.1569493543459; 
 Thu, 26 Sep 2019 03:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190926101312.32218-1-geert@linux-m68k.org>
In-Reply-To: <20190926101312.32218-1-geert@linux-m68k.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 26 Sep 2019 19:25:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTk5yE1=WsxdYpEw6EYXMmq8cW5QBEse2WWhTJ0y=iMA@mail.gmail.com>
Message-ID: <CAK7LNARTk5yE1=WsxdYpEw6EYXMmq8cW5QBEse2WWhTJ0y=iMA@mail.gmail.com>
Subject: Re: [PATCH -next] fbdev: c2p: Fix link failure on non-inlining
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1569493544;
 bh=4gNfylHHZtdgndSad6PjJXSwxIOR9alrhtPtj8B7110=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VinczihnWCDBrgvoLP2kh5fTytrGSEoNtQk40bdmi4GDG5IIpShIqMdnNlzt2kiFt
 2N65b4GeXMV6VQPXgYcU1CIGc8tXfRCQdgtgd2aOkFQa+01xE/x2GQUIUKR/SHNNre
 NCTiw3vbhHgYaFneTON8+Erl4Q78APXKXU+wGXaM3C6Ja31BIp+qqtkEn4FCTAhNVt
 hQQZSwgqopq9slaI9tSyg4TSxVwU5jACP3ZwJDUlaeeT357sqWaLKvsLq1c64N4RJ7
 Mv2TSeZsU6DA2+zpeWPIOuUIDAXJsoetGen8N6y7CzkhW1MCRhr8kQyc6ob7SW1fp5
 3SdgKiScRbF1g==
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNzoxMyBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IFdoZW4gdGhlIGNvbXBpbGVyIGRlY2lkZXMgbm90
IHRvIGlubGluZSB0aGUgQ2h1bmt5LXRvLVBsYW5hciBjb3JlCj4gZnVuY3Rpb25zLCB0aGUgYnVp
bGQgZmFpbHMgd2l0aDoKPgo+ICAgICBjMnBfcGxhbmFyLmM6KC50ZXh0KzB4ZDYpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBjMnBfdW5zdXBwb3J0ZWQnCj4gICAgIGMycF9wbGFuYXIuYzooLnRl
eHQrMHgxZGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjMnBfdW5zdXBwb3J0ZWQnCj4gICAg
IGMycF9pcGxhbjIuYzooLnRleHQrMHhjNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGMycF91
bnN1cHBvcnRlZCcKPiAgICAgYzJwX2lwbGFuMi5jOigudGV4dCsweDE1MCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGMycF91bnN1cHBvcnRlZCcKPgo+IEZpeCB0aGlzIGJ5IG1hcmtpbmcgdGhl
IGZ1bmN0aW9ucyBfX2Fsd2F5c19pbmxpbmUuCj4KPiBSZXBvcnRlZC1ieTogbm9yZXBseUBlbGxl
cm1hbi5pZC5hdQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+CgoKUmV2aWV3ZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2Fo
aXJvQHNvY2lvbmV4dC5jb20+CgoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
