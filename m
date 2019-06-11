Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F583D2FD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0214689159;
	Tue, 11 Jun 2019 16:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7BE89159
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:52:15 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q10so7781162pff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQYk/P/AHz+84MHAfqs8A9FFft/ChbHJqGQaIDzi6ok=;
 b=tTTnO/A+ea6zPq4dkKNkD7AGn7ZaIIqKT+Lz8kU+F3lY1s5UxCIarWINP73WkjRIUf
 4IDG1UgoowKDs99bf2LMEI/jRVHeRbZtSaumenkKfxcNxHbt26NgS4QkSfhC8NaZXTOz
 ojh9kCPfTIE4gXltqgt+zjPHwe7hp7dm+FZ046z6vMDBzUoo7bPfpieJmgpaITy4w1qH
 IgrLwgzTpg0klQO0RbNISyXCEjOSS/+PKa2R+KCY+TiFKOiUErxwqje9UscCm7Uv4kRs
 e4Z0yJ9WoXPdkHVpHTGxEfswyykvVcBOvzpSl+FJ6kS7VWgaJRDhuoXURsQiuWAOAplC
 SdIg==
X-Gm-Message-State: APjAAAWSzDGF3/ln32RDIXUvEi0bGZ6xwfNSQ/SWg7xlzjKdbWl6gHjV
 TYgnueE0DZ0QbjSIyd5+ezoqI1ZsOgx1t10sS88=
X-Google-Smtp-Source: APXvYqwIRgwZSvbJvIgasj06odVOLwqV4e1NGaONT67RAQJDqA/rR9sRiGkufN8AoUbyfd4Xe69TJ3rJVeHoEHiPbLI=
X-Received: by 2002:a17:90b:8d2:: with SMTP id
 ds18mr3765976pjb.132.1560271935519; 
 Tue, 11 Jun 2019 09:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
In-Reply-To: <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2019 19:52:04 +0300
Message-ID: <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] docs: mark orphan documents as such
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DQYk/P/AHz+84MHAfqs8A9FFft/ChbHJqGQaIDzi6ok=;
 b=cjJRH/tiJROWu574Li6WdMn+vr3Phrkemo9e0MrIa7BjfXn2y19eO6hPYoPqTcaHm+
 hm86n1rLG16xTwB/lLMEZ2SGn8PMjk7ag060+cgnFYiLM2inu1qWcunQBV1YSvwfqYTT
 DgE717bOFNLWOZArTH/miO/fXl2dyCUiS6unF3rjzsK53ET9uPUrfDplIbVezPaE0owq
 T40LrouoYo1Kjly8EJOlF7nZLhlPBw95nQfBGP3R4rCFndbjLuo5+P13eHpc0hbKjwSf
 j1WcA8dmRUBq2QbCXlBPmirBES11keCDGZCylHH6F7HiSk1MO2DGiSF9oKgwoUiwsuzg
 zNOQ==
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Linux PM <linux-pm@vger.kernel.org>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Sean Paul <sean@poorly.run>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gNywgMjAxOSBhdCAxMDowNCBQTSBNYXVybyBDYXJ2YWxobyBDaGVoYWIKPG1j
aGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiBTcGhpbnggZG9lc24ndCBsaWtlIG9y
cGhhbiBkb2N1bWVudHM6Cgo+ICAgICBEb2N1bWVudGF0aW9uL2xhcHRvcHMvbGctbGFwdG9wLnJz
dDogV0FSTklORzogZG9jdW1lbnQgaXNuJ3QgaW5jbHVkZWQgaW4gYW55IHRvY3RyZWUKCj4gIERv
Y3VtZW50YXRpb24vbGFwdG9wcy9sZy1sYXB0b3AucnN0ICAgICAgICAgICAgIHwgMiArKwoKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9sYXB0b3BzL2xnLWxhcHRvcC5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2xhcHRvcHMvbGctbGFwdG9wLnJzdAo+IGluZGV4IGFhNTAzZWU5YjNiYy4uZjJjMmZm
ZTMxMTAxIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vbGFwdG9wcy9sZy1sYXB0b3AucnN0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9sYXB0b3BzL2xnLWxhcHRvcC5yc3QKPiBAQCAtMSw1ICsx
LDcgQEAKPiAgLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCj4KPiArOm9ycGhh
bjoKPiArCj4gIExHIEdyYW0gbGFwdG9wIGV4dHJhIGZlYXR1cmVzCj4gID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Cj4KCkNhbiB3ZSByYXRoZXIgY3JlYXRlIGEgdG9jIHRyZWUgdGhlcmU/
Ckl0IHdhcyBhIGZpcnN0IGRvY3VtZW50IGluIHJlU1QgZm9ybWF0IGluIHRoYXQgZm9sZGVyLgoK
LS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
