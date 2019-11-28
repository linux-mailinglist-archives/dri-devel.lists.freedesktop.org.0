Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70610C1E3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 02:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191C96E5D5;
	Thu, 28 Nov 2019 01:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625D26E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 01:50:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [104.132.253.101])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB0FF4FF;
 Thu, 28 Nov 2019 02:50:54 +0100 (CET)
Date: Thu, 28 Nov 2019 03:50:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v7 2/7] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20191128015045.GA13942@pendragon.ideasonboard.com>
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
 <20191113100556.15616-3-jacopo+renesas@jmondi.org>
 <CAMuHMdWAvFfL5gWZVkfan=o2pRygxCKaNwCf=7AbiPJS1r8nAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWAvFfL5gWZVkfan=o2pRygxCKaNwCf=7AbiPJS1r8nAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574905855;
 bh=UZ6ggFBgzZuX2+D3oNGNdZPRR6WVAycMBJ8RY8d+ymk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t9GPUKIeQrjeJLIeZS9jGzPqGzY99zDh5ccnMwPkF4WJde46R2sSURIlzPlFwwT48
 Hmo2GJF3DMoVkpgbKXEtZ0P3yZIzekR8hCmCiVGnfzJb6XJRe6aJk/RdR7EFGbsOik
 scbNW64T2s0//DvmZ4j3rCEm8uADY6iCPIa33ZB4=
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDI6MzQ6MjdQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIEphY29wbywKPiAKPiBTb3JyeSBmb3Igc3BvaWxpbmcgeW91ciB2NyA7
LSkKPiAKPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAxMTowNCBBTSBKYWNvcG8gTW9uZGkgPGph
Y29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+ID4gRG9jdW1lbnQgdGhlIG5ld2x5IGFk
ZGVkICdjbW1zJyBwcm9wZXJ0eSB3aGljaCBhY2NlcHRzIGEgbGlzdCBvZiBwaGFuZGxlCj4gCj4g
cmVuZXNhcyxjbW1zCgpGaXggYXBwbGllZCB0byBteSBicmFuY2guCgo+ID4gYW5kIGNoYW5uZWwg
aW5kZXggcGFpcnMgdGhhdCBwb2ludCB0byB0aGUgQ01NIHVuaXRzIGF2YWlsYWJsZSBmb3IgZWFj
aAo+ID4gRGlzcGxheSBVbml0IG91dHB1dCB2aWRlbyBjaGFubmVsLgo+ID4KPiA+IFJldmlld2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IEtpZXJh
biBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0Bq
bW9uZGkub3JnPgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
