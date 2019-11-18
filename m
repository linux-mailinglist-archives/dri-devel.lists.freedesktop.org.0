Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DB100DE3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676CE6E836;
	Mon, 18 Nov 2019 21:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66616E836
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:40:37 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c19so15892017otr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WZUio/taqOaS8HOsKs6Tx/K86C3+G5uKrrovVbDJGwI=;
 b=rPNALnX5ojXp8z42MshFbcd5bREygnN8QwhBWPMfWoWkvp1bkczFDYvtBd1Caqz6eV
 qS6mYAD62I87OGObfkOobhIU74wkieOdrqKtsVWrSxVpRhpIiQhK3alhswggXcTaXo/z
 Ax5jooCgNGcpSL8+3D11nA+gXGjBcV3daQTb6UBx3ul5SmuSuugMDRvY07kXlz74ijmv
 IiobTFJNlE5PgNHMO4tdAh/ggepVDNsXBizQTZDzgUeq4Wl7c9CENvbi8RP4pzGvKNHU
 /np7AdxqpU8FR23kQEk6FDKIz4raHesO6O62KepMqiFuOwmB9aXt13bUSRoE2L4qGKxc
 UnfA==
X-Gm-Message-State: APjAAAXYgeQTfaT89EaqKvkTw8l5QPqZRC+gL6BMh9ORhaE8GU2sCC0o
 Ohd7903NgXun1MjgdY9rDQ==
X-Google-Smtp-Source: APXvYqyrzHYyOBHJh5dN3sj2axQ7Dp2CrqN5El1pXKfbXVsKh1Bq1DDAp309KKjjFQBFuT2fTGWs5g==
X-Received: by 2002:a05:6830:1d8a:: with SMTP id
 y10mr996840oti.329.1574113236832; 
 Mon, 18 Nov 2019 13:40:36 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k9sm6441118oik.18.2019.11.18.13.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:40:36 -0800 (PST)
Date: Mon, 18 Nov 2019 15:40:35 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 08/13] dt-bindings: display: bridge: Repurpose
 lvds-encoder
Message-ID: <20191118214035.GA9128@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-9-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-9-git-send-email-fabrizio.castro@bp.renesas.com>
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

T24gV2VkLCAxMyBOb3YgMjAxOSAxNTo1MToyNyArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3Rl
Ogo+IEluIGFuIGVmZm9ydCB0byByZXB1cnBvc2UgbHZkcy1lbmNvZGVyLmMgdG8gYWxzbyBzZXJ2
ZSB0aGUKPiBmdW5jdGlvbiBvZiBMVkRTIGRlY29kZXJzLCB3ZSBlbmRlZCB1cCBkZWZpbmluZyBh
IG5ldyAiZ2VuZXJpYyIKPiBjb21wYXRpYmxlIHN0cmluZyAoImx2ZHMtZGVjb2RlciIpLCB0aGVy
ZWZvcmUgYWRhcHQgdGhlIGR0IHNjaGVtYQo+IHRvIGFsbG93IGZvciB0aGUgbmV3IGNvbXBhdGli
bGUgc3RyaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8u
Y2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+IC0tLQo+IHYzLT52NDoKPiAqIEltcHJvdmVkIHRp
dGxlIGFuZCBkZXNjcmlwdGlvbiBhY2NvcmRpbmcgdG8gTGF1cmVudCdzIGNvbW1lbnRzCj4gKiBS
ZXdvcmtlZCBkZWZpbml0aW9uIG9mIHRoZSBjb21wYXRpYmxlIHByb3BlcnR5Cj4gdjItPnYzOgo+
ICogRXh0cmFjdGVkIGNvbnZlcnNpb24gdG8gbHZkcy1jb2RlYyBhcyBwZXIgUm9iJ3MgY29tbWVu
dAo+IHYxLT52MjoKPiAqIENvbnZlcnRlZCB0byBkdC1zY2hlbWEgYXMgcGVyIE5laWwncyBjb21t
ZW50Cj4gLS0tCj4gIC4uLi97bHZkcy10cmFuc21pdHRlci55YW1sID0+IGx2ZHMtY29kZWMueWFt
bH0gICAgIHwgNTQgKysrKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDIg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uve2x2ZHMtdHJhbnNtaXR0ZXIueWFtbCA9
PiBsdmRzLWNvZGVjLnlhbWx9ICg2MSUpCj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
