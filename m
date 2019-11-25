Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AE108BB1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 11:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E4689FE6;
	Mon, 25 Nov 2019 10:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E22B89FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 10:30:24 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id d22so12606608oic.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 02:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wyl6mPeC7mKjazb4tEOb4I3V1TLHNpvgiFJX0v5ANQ4=;
 b=IPkwrIztonCcqhFSgfqdltc3UbPachIKNhU1uKu2FOC6RwzltFzAL+OWFFJv6vCci1
 Ku5LnhPhltG+BZW0QE5q6jQmMzaJVCWQQyWr2i+LvOe9pXe1x2Cg+EP/PxZieRREh+1O
 DkeRDm+ShfKlYDGwvRMl4KTkN4sv5WiSh+UehVcuob7uQO9M9FHbDEtueJVluLTGj+Cv
 E+rofGMusn29H02TYJfUdBPwTYyDweN8H+48xb/4eE/mMaQLQaDk3dG/nyiHSLFAj9fj
 Rr2hYlUfQebuswA0mGOLHjii3mQ6xIvG3RL0Z8xa/0IdAUS+ZjVI5ZUFJw5/3Qp5QBA/
 gALg==
X-Gm-Message-State: APjAAAV3ZxJ9H67yuBNKAR/rWAjSg7KL4ldbLj0srxwIS57DZMx6OtQ8
 xbCHYX7uFQIwE/Eh0uN1eFUhaomSwhROuH4Kgxw=
X-Google-Smtp-Source: APXvYqzGsVbZbHgRXv5DP5pCPh136mIwXjppchqIZm61zcsPTRH2CV8Hej5jjf9xpn2HJ5cJeQYvNVIBbPnBJq7B8hE=
X-Received: by 2002:aca:4a41:: with SMTP id x62mr7182936oia.148.1574677823677; 
 Mon, 25 Nov 2019 02:30:23 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-11-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191119001040.GJ5171@pendragon.ideasonboard.com>
In-Reply-To: <20191119001040.GJ5171@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Nov 2019 11:30:12 +0100
Message-ID: <CAMuHMdUkibRMto5BehwxY2qGbx5tr_5vLT41PFzx_vU4_0bfWg@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] ARM: dts: iwg20d-q7-common: Add LCD support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMToxMCBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgTm92IDEzLCAyMDE5
IGF0IDAzOjUxOjI5UE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiA+IFRoZSBpd2cy
MGQgY29tZXMgd2l0aCBhIDciIGNhcGFjaXRpdmUgdG91Y2ggc2NyZWVuLCB0aGVyZWZvcmUKPiA+
IGFkZCBzdXBwb3J0IGZvciBpdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0
cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPgo+IEFja2VkLWJ5OiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4KPiBJIGV4cGVj
dCBHZWVydCB0byBwaWNrIHRoaXMgdXAuCgpUaGFua3MsIHF1ZXVlZCBpbiByZW5lc2FzLWRldmVs
IGZvciB2NS42LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
