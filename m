Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CF100DD8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DC46E833;
	Mon, 18 Nov 2019 21:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914326E833
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:38:15 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n23so15882237otr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mAc7Q/gtUlmiHluKgpEFvKm0HPMSruDCFKUdodfYdR0=;
 b=Ts84sJKNcwzeA4oVD4tjXmc6C1Z7rft7egccHhUbFvuK+DyLKbbKqvT4JctBlLkJv6
 ZQAtMPDgv4pyR8gpQWC5q12Igr7JWX+xuK6ofy83LkqVZkl2sIBW8BmHpz35cybcO5+V
 KJxZw1AVL7yDNFktaQKE328XELWdsOVlZ3B0mJC49iUNJvuVwF2X1Xi1E5+gM4iH7fGk
 FjlC0U+ISmkag0leV8jyXl01F2n2G4xFF+RgJmqseG1Pgm8zsd987WkFkGYmM5ka/0Yp
 mv1GNmfgll8txHF0wtgDgMO/7Z80J3/ynHHcOgY/saAhzWdheHJXqp/C5J45+AzyUbvc
 9TBw==
X-Gm-Message-State: APjAAAVj5d+IX1OIF8rX8Ajt9HNwMhkAxEfa9b+hEI+iF4bu4QzNFMoa
 s+0QSz/M2Fdd3FWG5pC2qA==
X-Google-Smtp-Source: APXvYqyBcM9ucYjeN+0WdBVulO1FOqLPu7utjXGGWwI64en8P7kn8VoXj4mYdXUFMhdkBH8ZvYGVwQ==
X-Received: by 2002:a9d:2c25:: with SMTP id f34mr1021910otb.27.1574113094793; 
 Mon, 18 Nov 2019 13:38:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v11sm6502747ota.13.2019.11.18.13.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:38:14 -0800 (PST)
Date: Mon, 18 Nov 2019 15:38:13 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 03/13] dt-bindings: display: bridge: lvds-transmitter:
 Absorb ti,ds90c185.txt
Message-ID: <20191118213813.GA5240@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
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

T24gV2VkLCAxMyBOb3YgMjAxOSAxNTo1MToyMiArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3Rl
Ogo+IHRpLGRzOTBjMTg1LnR4dCBkb2N1bWVudHMgTFZEUyBlbmNvZGVycyB1c2luZyB0aGUgc2Ft
ZSBkcml2ZXIKPiBhcyB0aGUgb25lIGRvY3VtZW50ZWQgYnkgbHZkcy10cmFuc21pdHRlci55YW1s
Lgo+IFNpbmNlIHRoZSBwcm9wZXJ0aWVzIGxpc3RlZCBpbiB0aSxkczkwYzE4NS50eHQgYXJlIHRo
ZSBzYW1lCj4gYXMgdGhlIG9uZXMgbGlzdGVkIGluIGx2ZHMtdHJhbnNtaXR0ZXIueWFtbCwgYWJz
b3JiIHRoZSBkdC1iaW5kaW5nCj4gaW50byBsdmRzLXRyYW5zbWl0dGVyLnlhbWwuCj4gCj4gU2ln
bmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5j
b20+Cj4gCj4gLS0tCj4gdjMtPnY0Ogo+ICogTmV3IHBhdGNoCj4gLS0tCj4gIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnlhbWwgIHwgMTQgKysrLS0tCj4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwYzE4NS50eHQgICAgICAgIHwgNTUgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
NjEgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MGMxODUudHh0Cj4gCgpSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
