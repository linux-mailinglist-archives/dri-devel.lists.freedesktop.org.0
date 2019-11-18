Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F62100DE6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747E06E837;
	Mon, 18 Nov 2019 21:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409B46E837
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:41:10 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w24so15445220otk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FRpvq7Wj/iqnBV7qC9kY5Pc+/NV4VUnf2+TihSU+79o=;
 b=e0QUx0EF1VUkaqcnBCtooJB714z61WT97HlCgODDVOmVAWCXzCGMbLwiiyLkhy4/O4
 /Y4rLOBNZqYt/k7nmu8qJDKuBuREddxsLvX0RF3M4e0wsGieKuLW34DOHCGIcl8XmXMh
 MVRV5n4bPEx6zsGqPtZ+OgutpaT48HR4yz2VPVWew2Lq5CSxAHzXCH2RJoAUNkm/E88+
 yZ8xeZri2HsV9tk83htyCxUsU5iFH9vYJKH8kwqx30oIjiGRjlsNi1ubC8yj/fHqfMFr
 kz+EEa4X2FfZYIFoRSFHewe5xYQk/0xkbhcmYz5I76X7Xp24ksbx6/lUDgwGBj2nEg2P
 R7kg==
X-Gm-Message-State: APjAAAWjsocyOAzkaJW2c89VRlYe05rP7Kz1jsUXi52HlNaYR7ezDpO1
 o184kDEfiHBo/+QOFGfW5w==
X-Google-Smtp-Source: APXvYqxYNT8S6a4Vcem79ZkjeRstdF2mDqA8FfxIE8121Z6pXvIzENQymk0Bvzj9YGieUUYNDP5jRA==
X-Received: by 2002:a9d:7a86:: with SMTP id l6mr1091964otn.340.1574113269453; 
 Mon, 18 Nov 2019 13:41:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 94sm6653813otg.70.2019.11.18.13.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:41:08 -0800 (PST)
Date: Mon, 18 Nov 2019 15:41:08 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: display: bridge: lvds-codec:
 Document ti,ds90cf384a
Message-ID: <20191118214108.GA10188@bogus>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
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

T24gV2VkLCAxMyBOb3YgMjAxOSAxNTo1MToyOCArMDAwMCwgRmFicml6aW8gQ2FzdHJvIHdyb3Rl
Ogo+IFRoZSBEUzkwQ0YzODRBIGZyb20gVEkgaXMgYSB0cmFuc3BhcmVudCBMVkRTIHJlY2VpdmVy
IChkZWNvZGVyKSwKPiBhbmQgdGhlcmVmb3JlIGl0IGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgbHZk
cy1jb2RlYyBkcml2ZXIgYW5kCj4gYmluZGluZ3MuCj4gCj4gRG9jdW1lbnQgdGhlIHRpLGRzOTBj
ZjM4NGEgY29tcGF0aWJsZSBzdHJpbmcgd2l0aCB0aGUgZHQtYmluZGluZ3MuCj4gTm8gZHJpdmVy
IGNoYW5nZSByZXF1aXJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZh
YnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiAKPiAtLS0KPiB2My0+djQ6Cj4gKiBOZXcg
cGF0Y2gKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL2x2ZHMtY29kZWMueWFtbCB8IDcgKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
