Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA1100DDC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA276E835;
	Mon, 18 Nov 2019 21:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F0C6E835
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:38:34 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id d22so9863823oic.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pCxQjBITmvqLnVSUQjs1CPX2mZzwD2s3GOOnzs0YZMI=;
 b=YipTUeMuEhgwI8pAf5eI0j2yxHNoxyuHcnhQptWU4bEzBBYPyCn2Lc6beKuegQyvJv
 UZpF2/24v7zR3Ac9kiIS1ONGxo7zX1nRtqDrJzDRuAX+58EhXfaJb2x+1SHVean+2Kn4
 kiqRCiRzzjgEU5oXoXI4uOAhD/k5FHNd98jthxRki6NwDxezA0Q63FMw8ofjFzTCcHv1
 zGnjPOvvCd/Q9tmarl1fTpdnCTvnq1PN9Xb/VKi6kuRmSZF0f81AFAFjjg7UkHJf4qmS
 6zVB+KxhHzLgCUtJqbmHCStpkmkTFXsp/UtomHY6ZPjtaSkEb/hx4tHBrKND/xwzi+/b
 OU0Q==
X-Gm-Message-State: APjAAAVLNQT8z0H2fI2DwB7YiVFKQuIknkJmOioPSkIO9Qr+a4OKkglE
 fzu9JleRIk9qsKRuXtlLFQ==
X-Google-Smtp-Source: APXvYqzSuqFp/B1swfguly5hmQtRXYxJLr4k7XHGsoFJa2jueuZF7o+LMcHgFPChBi+B6fK3kLjB9w==
X-Received: by 2002:aca:320a:: with SMTP id y10mr946034oiy.152.1574113113674; 
 Mon, 18 Nov 2019 13:38:33 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i12sm6636202ota.10.2019.11.18.13.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:38:33 -0800 (PST)
Date: Mon, 18 Nov 2019 15:38:32 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: display: bridge: lvds-transmitter:
 Document "ti,sn75lvds83"
Message-ID: <20191118213832.GA5885@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBOb3YgMjAxOSAxNTo1MToyMyArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3Rl
Ogo+IENvbXBhdGlibGUgc3RyaW5nICJ0aSxzbjc1bHZkczgzIiBpcyBiZWluZyB1c2VkIGJ5IGRl
dmljZSB0cmVlCj4gcmszMTg4LWJxZWRpc29uMnFjLmR0cywgYnV0IGl0J3Mgbm90IGRvY3VtZW50
ZWQgYW55d2hlcmUsIHRoZXJlZm9yZQo+IGRvY3VtZW50IGl0IHdpdGhpbiBsdmRzLXRyYW5zbWl0
dGVyLnlhbWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5j
YXN0cm9AYnAucmVuZXNhcy5jb20+Cj4gCj4gLS0tCj4gdjMtPnY0Ogo+ICogTmV3IHBhdGNoCj4g
LS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9s
dmRzLXRyYW5zbWl0dGVyLnlhbWwgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
