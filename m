Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF745C23
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED18951B;
	Fri, 14 Jun 2019 12:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED688951B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:06:38 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m24so5238581ioo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV/TN56tvtkshednW+FR3TYUMeR7LNkhJIJyPcztGuQ=;
 b=rf5j0dNpCufSTHGwN+QKwEIZTu4T+80T+stPGhKGQvHSOewE21Z685sW97pGGKQYVs
 Kpj+aogbp93CDQzejKEG6cXbtWLoPFYNvq69XLCkfX3dR8cXxWe/id6eX4sZQvi8bCrv
 aISv+6c0azQIKO7hcdCdOX1IONY4UAj2qsyHiEsHg87Xu5E4p/xQRa9E8Q05leW0jtBe
 HC9XMu8elF0UdSEZ9tq8BgzyaTH/O8rh87cuGPUG1mG22YLaoEcOMhmqnN5JnY3cbaBW
 cujcBb+A6JydQv6SWsM81wO6l5Nu20W1G9cBOf8VCAPUN/KV47rDQG231jZ/L+dJy9Yi
 oMkA==
X-Gm-Message-State: APjAAAXzGQJBkKrWDVwfdFoHpaXLohl9gVYcKUHjZmRGT8fgI00Xb64q
 9bV3LThpS//LKKR3QaNkfPnPN/5hyzfHFvCnfmV7BQ==
X-Google-Smtp-Source: APXvYqzd3RL+iPjapmaxAdyvWMQJF7lG1MDH2O7AA77mNOJAARM4fauuhUSG4Vu+ikv2M3ZUTkZw+Wyq92aI3r6eLBo=
X-Received: by 2002:a6b:5115:: with SMTP id f21mr5692335iob.173.1560513997259; 
 Fri, 14 Jun 2019 05:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-3-jagan@amarulasolutions.com>
 <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
 <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
 <CAMty3ZBc-AqbNGZCxRhOPw46iMvEZxoq1oATA46=K29gRYi4Sg@mail.gmail.com>
 <CAGb2v6466QSF1wJ_wJsVwAgHsnLXD9GAwbPQtXcTDq4aqAeEfQ@mail.gmail.com>
In-Reply-To: <CAGb2v6466QSF1wJ_wJsVwAgHsnLXD9GAwbPQtXcTDq4aqAeEfQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 14 Jun 2019 17:36:26 +0530
Message-ID: <CAMty3ZC39yQs+_Cytp25xJO9Da0FWkC9g1VwYmzQZSGNoWc-yw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/9] drm/sun4i: tcon: Add TCON LCD support
 for R40
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dV/TN56tvtkshednW+FR3TYUMeR7LNkhJIJyPcztGuQ=;
 b=ZcN2e49mct35/m0fC0Bk4nbq0vVLZywYLxKLRo2uHlF5EhUnLtkkIv355WOKHFKGgb
 J01Wq8pOvuHMiwJThf2Ejb05s3co10a3TNB8r+QvphUXGbk5Uh7rpEB7QSCE8XU4sE1I
 2zCGaCefXOtG5SsSDzfDmE7oQrrECjcqoTUow=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNDozMiBQTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNjo1NiBQTSBKYWdhbiBUZWtp
IDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdW4g
MTQsIDIwMTkgYXQgOTowNSBBTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAxMToxOSBBTSBDaGVuLVl1IFRzYWkg
PHdlbnNAY3NpZS5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCBKdW4gMTQsIDIw
MTkgYXQgMjo1MyBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVENPTiBMQ0QwLCBMQ0QxIGluIGFsbHdpbm5lciBSNDAs
IGFyZSB1c2VkIGZvciBtYW5hZ2luZwo+ID4gPiA+ID4gTENEIGludGVyZmFjZXMgbGlrZSBSR0Is
IExWRFMgYW5kIERTSS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBMaWtlIFRDT04gVFYwLCBUVjEgdGhl
c2UgTENEMCwgTENEMSBhcmUgYWxzbyBtYW5hZ2VkIHZpYQo+ID4gPiA+ID4gdGNvbiB0b3AuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gQWRkIHN1cHBvcnQgZm9yIGl0LCBpbiB0Y29uIGRyaXZlci4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkg
PHdlbnNAY3NpZS5vcmc+Cj4gPiA+Cj4gPiA+IEkgdGFrZSB0aGF0IGJhY2suCj4gPiA+Cj4gPiA+
IFRoZSBUQ09OIG91dHB1dCBtdXhpbmcgKHdoaWNoIHNlbGVjdHMgd2hldGhlciBUQ09OIExDRCBv
ciBUQ09OIFRWCj4gPiA+IG91dHB1dHMgdG8gdGhlIEdQSU8gcGlucykKPiA+ID4gaXMgbm90IHN1
cHBvcnRlZCB5ZXQuIFBsZWFzZSBhdCBsZWFzdCBhZGQgVE9ETyBub3Rlcywgb3IgaWRlYWxseSwK
PiA+Cj4gPiBBcmUgeW91IHJlZmVycmluZyBhYm91dCBwb3J0IHNlbGVjdGlvbj8gaXQgaXMgc3Vw
cG9ydCBpbgo+ID4gc3VuOGlfdGNvbl90b3BfZGVfY29uZmlnLgo+Cj4gTm8uIFRoYXQncyBzdXBw
b3J0ZWQgYXMgeW91IGFscmVhZHkgcG9pbnRlZCBvdXQuIFRoYXQgb25seSBzZWxlY3RzCj4gd2hp
Y2ggbWl4ZXIgb3V0cHV0cyB0byB3aGljaCBUQ09OLgo+Cj4gSSdtIHRhbGtpbmcgYWJvdXQgdGhl
IEdQSU9EIGFuZCBHUElPSCBiaXRzLCB3aGljaCBzZWxlY3Qgd2hpY2ggb2YKPiBMQ0Qgb3IgVFYg
VENPTiBvdXRwdXRzIHRvIHRoZSBMQ0QgZnVuY3Rpb24gcGlucy4gS2VlcCBpbiBtaW5kIHRoYXQK
PiB0aGUgVFYgVENPTidzIEgvViBTWU5DIHNpZ25hbHMgYXJlIHVzZWQgaW4gY29tYmluYXRpb24g
d2l0aCB0aGUKPiBUViBlbmNvZGVyIFJHQiBvdXRwdXRzIGZvciBWR0EuCgpHb3QgaXQsIHNvIGRv
IEkgbmVlZCB0byBhZGQgVE9ETyBvbiBzdW44aV9yNDBfbGNkX3F1aXJrcyBzdHJ1Y3Q/Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
