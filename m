Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2A8A260
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 17:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FFD89F89;
	Mon, 12 Aug 2019 15:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8689F89
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 15:35:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8C22327;
 Mon, 12 Aug 2019 17:35:44 +0200 (CEST)
Date: Mon, 12 Aug 2019 18:35:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 4/4] drm/panel/ili9341: Support DPI panels
Message-ID: <20190812153542.GJ5006@pendragon.ideasonboard.com>
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-5-noralf@tronnes.org>
 <20190811164139.GB14660@ravnborg.org>
 <4b195dcc-1b78-2d4b-b309-17cf8761296a@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b195dcc-1b78-2d4b-b309-17cf8761296a@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565624144;
 bh=6NF7a8t1MhSvEBj7EDnyDersqn4j2vxYJ7j77ZGbQBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VnRpnYU/6TGiJxOCn2+JGppTSKJhgmMPb3vao1JFz7pxCcP/qIrUNZDwzEQik/tOc
 ckS+Y/n8eKH6QNn0v5I2kNKXtsdWDY2tWQ4XnnPn33HHV7zDTu5RKycwuP8KSjIKO/
 to6D/lJOiFVlvdRXGGfy9REcEdk13CdGPepRAOZs=
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDI6MTM6NTRQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IERlbiAxMS4wOC4yMDE5IDE4LjQxLCBza3JldiBTYW0gUmF2bmJvcmc6Cj4gPiBP
biBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAwMzo1Mjo0OVBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4gPj4gQWRkIHN1cHBvcnQgZm9yIHBhbmVscyB0aGF0IHVzZSB0aGUgRFBJIGludGVy
ZmFjZS4KPiA+PiBJTEk5MzQxIGhhcyBvbmJvYXJkIFJBTSBzbyB0aGUgYXNzdW1wdGlvbiBtYWRl
IGhlcmUgaXMgdGhhdCBhbGwgc3VjaAo+ID4+IHBhbmVscyBzdXBwb3J0IHBpeGVsIHVwbG9hZCBv
dmVyIERCSS4KPiA+Pgo+ID4+IFRoZSBwcmVzZW5jZS9hYnNlbnNlIG9mIHRoZSBEZXZpY2UgVHJl
ZSAncG9ydCcgbm9kZSBkZWNpZGVzIHdoaWNoCj4gPj4gaW50ZXJmYWNlIGlzIHVzZWQgZm9yIHBp
eGVsIHRyYW5zZmVyLgo+ID4KPiA+IEhhdmUgeW91IGNvbnNpZXJlZCBpZiB0aGUgY29tcGF0aWJs
ZSBjb3VsZCBiZSB1c2VkIHRvIGRldGVybWluZSB0aGUgdXNlCj4gPiBvZiBhIHBhbmVsPyBUaGVu
IGl0IGlzIG1vcmUgZXhwbGljaXQgaG93IHRoZSBIVyBpcyBkZXNjcmliZWQgaW4gRFQuCj4gCj4g
SXMgdGhhdCBjb21tb24gdG8gdXNlIHRoZSBjb21wYXRpYmxlIHRvIHRlbGwgd2hpY2ggaW50ZXJm
YWNlIHRvIHVzZT8KPiBJIGRvbid0IGtub3cgd2hhdCBiZXN0IHByYWN0aWNlIGlzIGhlcmUuCgpV
c3VhbGx5IHRoZSBjb21wYXRpYmxlIGlkZW50aWZpZXMgdGhlIGRldmljZSwgbm90IHRoZSBpbnRl
cmZhY2UuCkFkZGl0aW9uYWwgcHJvcGVydGllcyBhcmUgcHJlZmVycmVkIHRvIGRlc2NyaWJlIHRo
ZSBpbnRlcmZhY2UuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
