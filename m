Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD73E670B
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2019 22:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F002989FF6;
	Sun, 27 Oct 2019 21:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCEE89FF6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 21:17:39 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id n16so2499795oig.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 14:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/iAJCHmYnu3MN/tSfMGe/nzIlm9sUPVCioEd8t0MfbY=;
 b=jm17WOYsspyn5sFRFDjyUgGqi1T5bbdCo4SMcMUkPWSmKkOUe9B9cLxMWG/3IhpqgY
 U1V1n35xtf0OWR4P2BIVMf5QVAvVxbUM/LCY7J4q7c/wTIFNp7fZUHvUbn78hGE0ml6n
 6b2S7oBY7eMb5Am0B4jGFoas4CImCXsCt/SIuUiTYpd/sPYnPVh9ik7UQ/ZWSoZm2OWO
 zscuvVQra87jgfnn/XnpX8wJj7FzwfYz92vF1eXJIbd4rq8uVBFWZ++2FWVbUovGJJwW
 M3ch76NZIt9eg2qbWLLbZGqQZg0KuBgZdIrKB4GuMTZ15E7IIIIw8gaLexDn+K3as7Xv
 2Zag==
X-Gm-Message-State: APjAAAVd1Nm6DF1TspYYl7JNY1SGZgXADvNOd9DJLUR5Um+WHQp8XISD
 jIUPZD5Xu/ZGbeiHW/hGaQ==
X-Google-Smtp-Source: APXvYqycENxBcO37SRF80CuuH2sAsSU8zEeqdg41f6o3Mskd1ZymMfnokYbEy29NcBFqqvPqzaY4dQ==
X-Received: by 2002:a54:4484:: with SMTP id v4mr7404163oiv.49.1572211058758;
 Sun, 27 Oct 2019 14:17:38 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g3sm2960776otg.56.2019.10.27.14.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 14:17:37 -0700 (PDT)
Date: Sun, 27 Oct 2019 16:17:37 -0500
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v11 2/7] dt-bindings: sun6i-dsi: Add A64 DPHY compatible
 (w/ A31 fallback)
Message-ID: <20191027211737.GA30896@bogus>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025175625.8011-3-jagan@amarulasolutions.com>
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
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNSBPY3QgMjAxOSAyMzoyNjoyMCArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiBU
aGUgTUlQSSBEU0kgUEhZIGNvbnRyb2xsZXIgb24gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyCj4g
b24gdGhlIG9uZSBvbiBBMzEuCj4gCj4gQWRkIEE2NCBjb21wYXRpYmxlIGFuZCBhcHBlbmQgQTMx
IGNvbXBhdGlibGUgYXMgZmFsbGJhY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9waHkvYWxs
d2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkueWFtbCAgICAgICAgIHwgNiArKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAoKUGxlYXNlIGFk
ZCBBY2tlZC1ieS9SZXZpZXdlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcgdmVyc2lvbnMuIEhv
d2V2ZXIsCnRoZXJlJ3Mgbm8gbmVlZCB0byByZXBvc3QgcGF0Y2hlcyAqb25seSogdG8gYWRkIHRo
ZSB0YWdzLiBUaGUgdXBzdHJlYW0KbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFja3MgcmVj
ZWl2ZWQgb24gdGhlIHZlcnNpb24gdGhleSBhcHBseS4KCklmIGEgdGFnIHdhcyBub3QgYWRkZWQg
b24gcHVycG9zZSwgcGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hhdCBjaGFuZ2VkLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
