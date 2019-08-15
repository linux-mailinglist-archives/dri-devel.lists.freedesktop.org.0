Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F248EDE7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ED16E3FB;
	Thu, 15 Aug 2019 14:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A406E3FB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:14:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EC442AF;
 Thu, 15 Aug 2019 16:14:43 +0200 (CEST)
Date: Thu, 15 Aug 2019 17:14:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Message-ID: <20190815141440.GA20322@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815140400.GA7174@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565878483;
 bh=CpWruMPwP6AjzSnh7pkBxx25Ie389i+DKRZU7zUWBn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gBYs3AHjWSM3z/BNO/Qh4DDFXlRIByhKgXhqLdbs9maiJWWP0H6KTlIicnHJcJ5e5
 gnDCiqT4MDTafxfHq6ddvkKxqikOPrkue9pJ0BnXaGBOssOAREAOjchw3RAOMu8YJG
 ZlEnUoO1lmQ8SvW4BS1RqJ3gndEFC95FrgUWnnhw=
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZywKCk9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA0OjA0OjAwUE0gKzAyMDAsIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwNDoxODozOFBN
ICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gSGkgRmFicml6aW8sCj4gPiAKPiA+
IChDQydpbmcgR3JlZyBhcyB0aGUgYXJjaGl0ZWN0IG9mIHRoZSBTUERYIG1vdmUpCj4gCj4gX29u
ZSBvZl8sIG5vdCB0aGUgb25lIHRoYXQgZGlkIHRoZSBtb3N0IG9mIGhlIHdvcmssIHRoYXQgd291
bGQgYmUgVGhvbWFzIDopCj4gCj4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAxMjowNDoyN1BN
ICswMTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gPiA+IFRoZSBpbmZvcm1hdGlvbiByZXBy
ZXNlbnRlZCBieSBkcm1fYnJpZGdlX3RpbWluZ3MgaXMgYWxzbwo+ID4gPiBuZWVkZWQgYnkgcGFu
ZWxzLCB0aGVyZWZvcmUgcmVuYW1lIGRybV9icmlkZ2VfdGltaW5ncyB0bwo+ID4gPiBkcm1fdGlt
aW5ncy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+ID4gPiBMaW5rOiBodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9saW51eC1yZW5lc2FzLXNvYy9tc2c0MzI3MS5odG1sCj4gPiA+IAo+ID4gPiAt
LS0KPiA+ID4gdjEtPnYyOgo+ID4gPiAqIG5ldyBwYXRjaAo+ID4gPiAKPiA+ID4gSSBoYXZlIGNv
cGllZCB0aGUgbGljZW5zZSBmcm9tIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBhcyB0aGF0J3MK
PiA+ID4gd2hlcmUgdGhlIHN0cnVjdCBvcmlnaW5hbGx5IGNhbWUgZnJvbS4gV2hhdCdzIHRoZSBy
aWdodCBTUERYIGxpY2Vuc2UKPiA+ID4gdG8gdXNlIGluIHRoaXMgY2FzZT8KPiA+IAo+ID4gaHR0
cHM6Ly93aWtpLnNwZHgub3JnL3ZpZXcvTGVnYWxfVGVhbS9EZWNpc2lvbnMvRGVhbGluZ193aXRo
X1B1YmxpY19Eb21haW5fd2l0aGluX1NQRFhfRmlsZXMKPiA+IAo+ID4gR3JlZywgYW55IGlkZWEg
b24gaG93IHdlIHNob3VsZCBoYW5kbGUgdGhpcyA/Cj4gCj4gVWdoLCB3aGF0IGx1bmFjeS4gIEJ1
dCBkcm1fYnJpZGdlLmggaXMgTk9UIHVuZGVyIGFueSAicHVibGljIGRvbWFpbiIKPiBsaWNlbnNl
LCBzbyB3aHkgaXMgdGhhdCBhbiBpc3N1ZSBoZXJlPyAgVGhpcyBsb29rcyBsaWtlIGEgIm5vcm1h
bCIgYnNkIDMKPiBjbGF1c2UgbGljZW5zZSB0byBtZSwgcmlnaHQ/CgpZb3UncmUgcmlnaHQsIEkg
b3ZlcnJlYWQgcGFydCBvZiB0aGUgdGV4dCBpbiBkcm1fYnJpZGdlLmgsIGl0IHNlZW1zIHRvCmlu
ZGVlZCBiZSBjb3ZlcmVkIGJ5IGEgQlNEIDMgY2xhdXNlIGxpY2Vuc2UuIFNvcnJ5IGZvciB0aGUg
bm9pc2UuCgo+IFNvIEkgd291bGQganVzdCB1c2UgIkJTRC0zLUNsYXVzZSIgYXMgdGhlIFNQRFgg
bGljZW5zZSBoZXJlLCBpZiBJIHdlcmUKPiBkb2luZyB0aGlzIHBhdGNoLi4uCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
