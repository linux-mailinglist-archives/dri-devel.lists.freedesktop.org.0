Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE3A1BBA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 15:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6691C89247;
	Thu, 29 Aug 2019 13:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC3D89247
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 13:44:41 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5578A2342C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 13:44:41 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id i78so1487560qke.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 06:44:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWAsqBwQZoBvi2Dwi0xOwpKEKEvnq1TTWSzWxuM8djPbIHqfgS7
 ZfU2a38/J6MNlQr9/gxI5XSHIQS35gHemMcv4A==
X-Google-Smtp-Source: APXvYqxSE0YabCZbTGJEMY6IRxRqXQltQGwtj+w4DSTunRzVOnwmn8VB0XQkhKwOYkeqn97wvdZAYXR3bCf8AGd6bR0=
X-Received: by 2002:a37:4941:: with SMTP id w62mr8752360qka.119.1567086280340; 
 Thu, 29 Aug 2019 06:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 29 Aug 2019 08:44:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLikohkWAq7exzCuGfg2yVE1Wx6h7GZFP8-jaL31PLpmA@mail.gmail.com>
Message-ID: <CAL_JsqLikohkWAq7exzCuGfg2yVE1Wx6h7GZFP8-jaL31PLpmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add idk-1110wr binding
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567086281;
 bh=mR7GA3c4mGRbLwLDIK+jRuWdNT4gDXNkRRI6mT85V6w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nO/aoVqieSJBIcG8Q1+Ukaxbr8aB1UPguFn1lMmZhsf/sbrqA+r7ZtvKoOxFOXt6R
 P6+qGYTzBPWW8jXYLcKpzu2eVYVOPYH4+olE+9leQGrL7R+7OJCID9RsHoB8rEp683
 srC9yYQYiwILMQRhyzllWwssMBKCbzaeQERBmKGI=
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
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, xu_shunji@hoperun.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, ebiharaml@si-linux.co.jp,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgNjozOCBBTSBGYWJyaXppbyBDYXN0cm8KPGZhYnJpemlv
LmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYmluZGluZyBmb3IgdGhlIGlk
ay0xMTEwd3IgTFZEUyBwYW5lbCBmcm9tIEFkdmFudGVjaC4KPgo+IFNvbWUgcGFuZWwtc3BlY2lm
aWMgZG9jdW1lbnRhdGlvbiBjYW4gYmUgZm91bmQgaGVyZToKPiBodHRwczovL2J1eS5hZHZhbnRl
Y2guZXUvRGlzcGxheXMvRW1iZWRkZWQtTENELUtpdHMtTENELUtpdC1Nb2R1bGVzL21vZGVsLUlE
Sy0xMTEwV1ItNTVXU0ExRS5odG0KPgo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IC0tLQo+IHYxLT52MjoKPiAqIG5vIGNo
YW5nZQo+Cj4gIC4uLi9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMTExMHdyLnlhbWwgICAg
ICAgIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5z
ZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0xMTEwd3IueWFtbAoKUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
