Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9961104EC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0826EA80;
	Tue,  3 Dec 2019 19:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC316EA8B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 19:18:58 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 59so3938136otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 11:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FLXMRyKICPlNOZ05fFO5shGyYBI5uM+0oVnpeDhbnQM=;
 b=VGuhP/91WGPuufncyxpCvB1F1u8XN9e7p8INSgCdCLjdOZhuDQeYqn6OkZSesnNTr8
 vFBOHcgzHNC1ZAvt+g/hIMT/AR9AO7cgbxpNrQkzfSzl89CA8/eXMGm2glyo7/EOR42L
 YlRjB4OzSHylN4by3PL0up84Qx50n+hdUDUQz665YkgP785HCMRpFWK/mgVD2IzsYSj1
 bO5gn3YExDaN9A9YUX3ZTUI7Ym5lLe37uvetSB1K6+50w4Dz90E2Mo/FA+lNgivchS78
 QJseerj6zNu+3NnnhX6KTCciItKdEXqbG9BCUZ4g4dT9a0REkShiLSI1IYhIbn9RTISE
 pgZA==
X-Gm-Message-State: APjAAAWbEsICwVdI5ex7E0hfxLdANyxvEewEHtn09DMY/dZlh4piSWMJ
 8RvZsClScDMbBNz3bejXLA==
X-Google-Smtp-Source: APXvYqzfMXYRpS6RB54EALQSkRj1NegXLtdiWeUYH7IkLsa+ocFmXr6dZDyL/GCEN559Imx4AOyWZA==
X-Received: by 2002:a9d:74d8:: with SMTP id a24mr4704586otl.100.1575400737646; 
 Tue, 03 Dec 2019 11:18:57 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z17sm1445722oib.3.2019.12.03.11.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 11:18:57 -0800 (PST)
Date: Tue, 3 Dec 2019 13:18:56 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v12 2/7] dt-bindings: sun6i-dsi: Add A64 DPHY compatible
 (w/ A31 fallback)
Message-ID: <20191203191856.GA17427@bogus>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
 <20191203134816.5319-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203134816.5319-3-jagan@amarulasolutions.com>
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
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDc6MTg6MTFQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiBUaGUgTUlQSSBEU0kgUEhZIGNvbnRyb2xsZXIgb24gQWxsd2lubmVyIEE2NCBpcyBzaW1p
bGFyCj4gb24gdGhlIG9uZSBvbiBBMzEuCj4gCj4gQWRkIEE2NCBjb21wYXRpYmxlIGFuZCBhcHBl
bmQgQTMxIGNvbXBhdGlibGUgYXMgZmFsbGJhY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBmb3IgdjEy
Ogo+IC0gbm9uZQo+IAo+ICAuLi4vYmluZGluZ3MvcGh5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlw
aS1kcGh5LnlhbWwgICAgICAgICB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
