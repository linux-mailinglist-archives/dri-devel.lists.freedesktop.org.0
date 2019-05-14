Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478271C6DF
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 12:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFB7892C8;
	Tue, 14 May 2019 10:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DEA892C8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 10:18:44 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id w37so22103332edw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 03:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ORyjFaWPbaw6KQxgFwnjj56eUspz8KmYIPTpXxpUWBU=;
 b=qrfvrEySp8ROPVYxmLBepXvVdi1eqW3Tcs/jQdBQJxUqux3FA7CvUYeAIgi7lh0k5l
 qjD4yJce+cBcn6gWdEFoEcfKge6hUdyjTZFvL5Fg7plutOStLKse+gG8aCyvYHIa5ko/
 nSNPJXkWfNeJJTJDkO8csuSSKYTZ/4DUc1LU/I5j2h8/ccd+M3QCtQvleFX5Z51AiUaM
 3/o2VwQ0CESJvPCdT05bqql1aXvz6aKKJVFk8VddWLYqcW0/e/ASVybzgnDFvZ/xtgZ/
 GR1K693Cvr7zoxGxGF2Du8VFHFWLd3SjrBzTWxA3fMJFPmyhx1PfRvFOgK5JUF8Kga0I
 Vepw==
X-Gm-Message-State: APjAAAX5AW4Xt93yP6I7DMZg3eC4XzWY1jpLlkBNGh5ufY6LoKRaJ810
 /m92H2AXOtjf7WEbPM3gjFp0vxciCzI=
X-Google-Smtp-Source: APXvYqw+t+s4nEEHE79LOyO+Asa9QnRudNTdcRDUoUvVTMowtkcu9Gjy2zju4+SV17VOP6F3xPcVaA==
X-Received: by 2002:a50:fa90:: with SMTP id w16mr34920327edr.184.1557829122140; 
 Tue, 14 May 2019 03:18:42 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id d90sm597942edd.96.2019.05.14.03.18.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 03:18:40 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id h4so18552728wre.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 03:18:39 -0700 (PDT)
X-Received: by 2002:a5d:688f:: with SMTP id h15mr10564376wru.44.1557829119553; 
 Tue, 14 May 2019 03:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190512174608.10083-6-peron.clem@gmail.com>
 <CAMty3ZBTO9+9HLikR8=KgWZQBp+1yVgxQ_rD-E8WeJ8VvpuAcA@mail.gmail.com>
In-Reply-To: <CAMty3ZBTO9+9HLikR8=KgWZQBp+1yVgxQ_rD-E8WeJ8VvpuAcA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 14 May 2019 18:18:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v64QpH2uL3Q2=ePEaYhrB1_J5uNT4VnBssBgwbOB0NDD0Q@mail.gmail.com>
Message-ID: <CAGb2v64QpH2uL3Q2=ePEaYhrB1_J5uNT4VnBssBgwbOB0NDD0Q@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 5/8] arm64: dts: allwinner: Add mali GPU
 supply for Pine H64
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMjoyOCBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAxMiwgMjAxOSBhdCAxMToxNiBQ
TSA8cGVyb24uY2xlbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IENsw6ltZW50IFDD
qXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Cj4gPgo+ID4gRW5hYmxlIGFuZCBhZGQgc3VwcGx5
IHRvIHRoZSBNYWxpIEdQVSBub2RlIG9uIHRoZQo+ID4gUGluZSBINjQgYm9hcmQuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KPiA+
IC0tLQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1waW5lLWg2
NC5kdHMgfCA1ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYt
cGluZS1oNjQuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBp
bmUtaDY0LmR0cwo+ID4gaW5kZXggNDgwMjkwMmUxMjhmLi5lMTZhOGM2NzM4ZjkgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtcGluZS1oNjQu
ZHRzCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtcGlu
ZS1oNjQuZHRzCj4gPiBAQCAtODUsNiArODUsMTEgQEAKPiA+ICAgICAgICAgc3RhdHVzID0gIm9r
YXkiOwo+ID4gIH07Cj4gPgo+ID4gKyZncHUgewo+ID4gKyAgICAgICBtYWxpLXN1cHBseSA9IDwm
cmVnX2RjZGNjPjsKPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4KPiBJIHRo
aW5rIHdlIGNhbiBzcXVhc2ggYWxsIHRoZXNlIGJvYXJkIGR0cyBjaGFuZ2VzIGludG8gc2luZ2xl
IHBhdGNoLgoKWWVzLiBQbGVhc2UgZG8gc28gZm9yIGFsbCBwYXRjaGVzIHdpdGggdGhlIHNhbWUg
Y2hhbmdlcyBhcHBsaWVkIHRvIGRpZmZlcmVudApib2FyZHMsIGFuZCBhdXRob3JlZCBieSB0aGUg
c2FtZSBwZXJzb24uCgpDaGVuWXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
