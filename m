Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6586F2376
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 01:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AD86E2B8;
	Thu,  7 Nov 2019 00:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A2C6E2B8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 00:44:49 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y194so444352oie.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 16:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0A6Sl7zSjHp0Gn3fGjWaLM1DGcUnZEOa8sMsOQfIiPU=;
 b=O3ixQAkCV8GMPIuIM9X9gRx2KU7jdcRVDvMKCTdD0Ppy/PgCICJqJxEfCVjcaSKveK
 TWQK/d2HnELPAGYiBGPy5AG+k3Un1s2q9+NbIcv0BPezpJtUy5HAAvWHRWsTiGKAp0TV
 xYFZBaR8n0M0OwIVd0mS56YvMH3sD8lWzQzzI2N8M4nYo8t/x3qMdPEHdg51MNboO3Rs
 UaqzWCSvpjr7tn/2inH2GFrXCT18s1/xgMLJ57eGKhtNFBSvPJhH5AvNQj4Fo5nsE+Qz
 3+o1371C7BVkOuob0SvokUeMwXXOoW12p8k54cRMZHQV776/MCJiqf33lEQGfPvmTmJB
 /7Ww==
X-Gm-Message-State: APjAAAWcxgRrHe4tZz9v/EF8SeEgJ+0Ajusyvsk5z+1YKoX45sw6QGeD
 7ML6joJuh3mDZ6QEmERoow==
X-Google-Smtp-Source: APXvYqyfsqvPVgFUWcwXVoPnoSlHymygFq5/jTwO77h/Hv9a1kU1pcDbot6gwp0R/54F7mjEIf2REA==
X-Received: by 2002:aca:1101:: with SMTP id 1mr772110oir.103.1573087488847;
 Wed, 06 Nov 2019 16:44:48 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a9sm202045otc.75.2019.11.06.16.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 16:44:48 -0800 (PST)
Date: Wed, 6 Nov 2019 18:44:47 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: du: Add vendor prefix
 to vsps property
Message-ID: <20191107004447.GA14493@bogus>
References: <20191105183504.21447-1-geert+renesas@glider.be>
 <20191105183504.21447-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105183504.21447-2-geert+renesas@glider.be>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAgNSBOb3YgMjAxOSAxOTozNTowMiArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IFRoZSBSZW5lc2FzLXNwZWNpZmljICJ2c3BzIiBwcm9wZXJ0eSBsYWNrcyBhIHZlbmRv
ciBwcmVmaXguCj4gQWRkIGEgInJlbmVzYXMsIiBwcmVmaXggdG8gY29tcGx5IHdpdGggRFQgYmVz
dCBwcmFjdGlzZXMuCj4gCj4gTW92ZSAicmVuZXNhcyx2c3BzIiBiZWxvdyAicmVuZXNhcyxjbW1z
IiB0byBwcmVzZXJ2ZSBhbHBoYWJldGljYWwgc29ydAo+IG9yZGVyLgo+IAo+IEZpeGVzOiAwNjcx
MWU2Mzg1YTRhYjRjICgiZHJtOiByY2FyLWR1OiBEb2N1bWVudCB0aGUgdnNwcyBwcm9wZXJ0eSBp
biB0aGUgRFQgYmluZGluZ3MiKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgICAgICAgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKCkFja2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
