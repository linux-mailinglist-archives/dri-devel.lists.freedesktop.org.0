Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE869100DC7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D926E06D;
	Mon, 18 Nov 2019 21:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877396E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:35:50 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y194so16823400oie.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Sl6UvL1270xzdCJiWSFRDVSctMprL75mgthNeZrpY4g=;
 b=nYttepYczCsX9uxROyQX8UbyFkpE92HAvDHZwmkHehEioZxVyWMwgNlZclQkT3A04A
 k/aTnL/nIQcO2h+2cPEOeLQWk7XKoJF8VC7LHNh8ntOGvzlbBM4/FxswAOk9zUFx+tzs
 zPRs4diC47eMmHNaiydAH3EpX0JuUv2ZjgJJ5nnYFw7V1qPpdM9ePLHzez3Hvs7BXSsz
 ORpCbKlX6abSSXKK6a/bdUKJonug4kKzPIVccg7wAyfxjIqd0lUcHQroK6eDzy1SuQM6
 94uKppN2BvuYUMFBD9Je5pDdfC48etLwOAQbdGMAbvRrBxLuhsSSnzThQYzU0qa+eA/Y
 34Sw==
X-Gm-Message-State: APjAAAUWZyBAaxEIaVGOfRHNlQHAimi/BX//svWcJHNcA6nxfn+dOOBb
 Tq/7Wj0tWc6FcI+RAyj+Pg==
X-Google-Smtp-Source: APXvYqyodfRhsKMy4FOhXu6Ho1s9RLWOndgId1YcIUHbjswsnDNmMErI8ydPdEeAc6VoUI1SAu1QSQ==
X-Received: by 2002:aca:b303:: with SMTP id c3mr1000895oif.100.1574112949655; 
 Mon, 18 Nov 2019 13:35:49 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x11sm6400573oie.25.2019.11.18.13.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:35:48 -0800 (PST)
Date: Mon, 18 Nov 2019 15:35:48 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: display: bridge: Convert
 lvds-transmitter binding to json-schema
Message-ID: <20191118213548.GA765@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-2-git-send-email-fabrizio.castro@bp.renesas.com>
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

T24gV2VkLCAxMyBOb3YgMjAxOSAxNTo1MToyMCArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3Rl
Ogo+IENvbnZlcnQgdGhlIGx2ZHMtdHJhbnNtaXR0ZXIgYmluZGluZyB0byBEVCBzY2hlbWEgZm9y
bWF0IHVzaW5nCj4ganNvbi1zY2hlbWEuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2Fz
dHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Cj4gCj4gLS0tCj4gdjMtPnY0Ogo+
ICogRml4ZWQgdGhlIGRlc2NyaXB0aW9uIG9mIHByb3BlcnR5ICJjb21wYXRpYmxlIiBhY2NvcmRp
bmcgdG8gTGF1cmVudCdzCj4gICBjb21tZW50cwo+IHYyLT52MzoKPiAqIEV4dHJhY3RlZCBjb252
ZXJzaW9uIHRvIGR0LXNjaGVtYSBhcyBwZXIgUm9iJ3MgY29tbWVudAo+IHYxLT52MjoKPiAqIENv
bnZlcnRlZCB0byBkdC1zY2hlbWEgYXMgcGVyIE5laWwncyBjb21tZW50Cj4gLS0tCj4gIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dCAgIHwgNjYgLS0tLS0t
LS0tLS0tLS0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRl
ci55YW1sICB8IDkxICsrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5
MSBpbnNlcnRpb25zKCspLCA2NiBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5z
bWl0dGVyLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIueWFtbAo+IAoKUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
