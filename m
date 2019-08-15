Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649079116C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F66D6EAD2;
	Sat, 17 Aug 2019 15:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7516EA9B;
 Thu, 15 Aug 2019 22:44:20 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id B4B0B3E998;
 Thu, 15 Aug 2019 22:44:17 +0000 (UTC)
Date: Thu, 15 Aug 2019 18:44:17 -0400
From: Brian Masney <masneyb@onstation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/11] ARM: dts: qcom: pm8941: add 5vs2 regulator node
Message-ID: <20190815224417.GA32072@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-10-masneyb@onstation.org>
 <CACRpkdYU-6LvFKRkj0yMMCmAnX0XtGe7rMwbXbhf2GCp77Ciyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYU-6LvFKRkj0yMMCmAnX0XtGe7rMwbXbhf2GCp77Ciyw@mail.gmail.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565909059;
 bh=czM1Vfno+UFHpzvoNlZgvzbIsi/W/guZt8ysTusqBg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z707lNUjzuIsbtPXSccR8bANmWJFP6d0utJUK+yc8rOPnV4fltz0acMoPYc0Gth9O
 9UmsjR4gMyWahWR+mUwz0JP9vIZHWTzezy6ZO8awAhHdaSSFZsP5nzvVceVqRxtZ6G
 FF0g1ay6/KWQatmMJPp2UFMvfQyb5QJEn8UXok28=
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6MzQ6MTdBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAyOjQ5IEFNIEJyaWFuIE1hc25leSA8bWFz
bmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiAKPiA+IHBtODk0MSBpcyBtaXNzaW5nIHRoZSA1
dnMyIHJlZ3VsYXRvciBub2RlIHNvIGxldCdzIGFkZCBpdCBzaW5jZSBpdHMKPiA+IG5lZWRlZCB0
byBnZXQgdGhlIGV4dGVybmFsIGRpc3BsYXkgd29ya2luZy4gVGhpcyByZWd1bGF0b3Igd2FzIGFs
cmVhZHkKPiA+IGNvbmZpZ3VyZWQgaW4gdGhlIGludGVycnVwdHMgcHJvcGVydHkgb24gdGhlIHBh
cmVudCBub2RlLgo+ID4KPiA+IE5vdGUgdGhhdCB0aGlzIHJlZ3VsYXRvciBpcyByZWZlcnJlZCB0
byBhcyBtdnMyIGluIHRoZSBkb3duc3RyZWFtIE1TTQo+ID4ga2VybmVsIHNvdXJjZXMuCj4gCj4g
V2hlbiBJIGxvb2tlZCBhdCBpdCBpdCBzZWVtZWQgbGlrZSB0aGlzIGNvbnZlbnRpb24gaXMgdXNl
ZCBmb3IgcG93ZXIKPiBzdXBwbGllcyB0aGF0IGFwcGVhciBvbiBib3RoIHRoZSBtYWluIFBNSUMg
YW5kIHRoZSAiZXh0cmEgKGJvb3Q/IGJhc2ljPwo+IGxvdyBwb3dlcj8pIFBNSUMgdGhhdCB0aGUg
bWFpbiA4MHh4IFBNSUMgaGFzIG12czEgYW5kIHRoZQo+IG90aGVyIDg5eHggUE1JQyBoYXMgbXZz
Mi4KCkFjY29yZGluZyB0byB0aGUgZG93bnN0cmVhbSBNU00gc291cmNlcywgdGhlIDV2czEgYW5k
IDV2czIgcmFpbHMgYXJlCmJvdGggb24gdGhlIHNlY29uZCBwbTg5NDEgUE1JQzoKCmh0dHBzOi8v
Z2l0aHViLmNvbS9BSUNQL2tlcm5lbF9sZ2VfaGFtbWVyaGVhZC9ibG9iL243LjEvYXJjaC9hcm0v
Ym9vdC9kdHMvbXNtODk3NC1yZWd1bGF0b3IuZHRzaSNMMTgKCj4gSSBzdXBwb3NlIGl0IGlzIG5h
bWVkICJtdnMiIG9uIGJvdGggUE1JQ3MgYW5kIHRoaXMgaXMganVzdCBhIHJhaWwKPiBuYW1lIHNv
IGFzIG5vdCB0byBjb25mdXNlIHRoZSBzY2hlbWF0aWM/CgpUaGF0IHNvdW5kcyByZWFzb25hYmxl
LgoKPiA+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3Jn
Pgo+IAo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+CgpUaGFuayB5b3UhCgpCcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
