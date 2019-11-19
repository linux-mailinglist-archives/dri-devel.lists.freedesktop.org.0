Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB8100FBD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ED889786;
	Tue, 19 Nov 2019 00:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C97789786
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:12:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BADA563;
 Tue, 19 Nov 2019 01:12:40 +0100 (CET)
Date: Tue, 19 Nov 2019 02:12:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 11/13] ARM: shmobile_defconfig: Enable support for
 panels from EDT
Message-ID: <20191119001226.GK5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-12-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573660292-10629-12-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574122362;
 bh=GP7ciNLF5eYh1JLsO7mIhGa5Max5aGk7MjHNaTeyNj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIQFJhjB+x0+JCrFULqVLROHhIBXIa/3vM+E/rQCPVpwiFb8klbstYT0K/3VdEbcV
 3R4kQTKtrtcnFe1LqihWK0pFXR8l/HdFDnfJ/B20jjm1+7sIWeMqJ4zreJQj/md6ds
 Zi3Q3KXflkjwlotTsPDlxo42m0qwctGr3M/w3ysQ=
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgTm92IDEzLCAy
MDE5IGF0IDAzOjUxOjMwUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgaXdn
MjBkIGNvbWVzIHdpdGggYW4gTENEIHBhbmVsIGZyb20gRW1lcmdpbmcgRGlzcGxheQo+IFRlY2hu
b2xvZ2llcyBDb3Jwb3JhdGlvbiAoRURUKSwgdGhlcmVmb3JlIGVuYWJsZSB3aGF0J3MKPiByZXF1
aXJlZCB0byBzdXBwb3J0IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgoKQWNrZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCkkgZXhwZWN0IEdlZXJ0IHRv
IHBpY2sgdGhpcyB1cC4KCj4gLS0tCj4gdjMtPnY0Ogo+ICogTm8gY2hhbmdlCj4gdjItPnYzOgo+
ICogTm8gY2hhbmdlCj4gdjEtPnYyOgo+ICogTm8gY2hhbmdlCj4gLS0tCj4gIGFyY2gvYXJtL2Nv
bmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2Rl
ZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnCj4gaW5kZXggYzZj
NzAzNS4uYWI0MTZhNSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2Rl
ZmNvbmZpZwo+ICsrKyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnCj4gQEAg
LTY2LDYgKzY2LDcgQEAgQ09ORklHX0lOUFVUX0VWREVWPXkKPiAgQ09ORklHX0tFWUJPQVJEX0dQ
SU89eQo+ICAjIENPTkZJR19JTlBVVF9NT1VTRSBpcyBub3Qgc2V0Cj4gIENPTkZJR19JTlBVVF9U
T1VDSFNDUkVFTj15Cj4gK0NPTkZJR19UT1VDSFNDUkVFTl9FRFRfRlQ1WDA2PXkKPiAgQ09ORklH
X1RPVUNIU0NSRUVOX1NUMTIzMj15Cj4gIENPTkZJR19JTlBVVF9NSVNDPXkKPiAgQ09ORklHX0lO
UFVUX0FEWEwzNFg9eQo+IEBAIC0xMjUsNyArMTI2LDkgQEAgQ09ORklHX1ZJREVPX0FEVjc2MDQ9
eQo+ICBDT05GSUdfVklERU9fTUw4NlY3NjY3PXkKPiAgQ09ORklHX0RSTT15Cj4gIENPTkZJR19E
Uk1fUkNBUl9EVT15Cj4gK0NPTkZJR19EUk1fUEFORUxfU0lNUExFPXkKPiAgQ09ORklHX0RSTV9E
VU1CX1ZHQV9EQUM9eQo+ICtDT05GSUdfRFJNX0xWRFNfQ09ERUM9eQo+ICBDT05GSUdfRFJNX1NJ
STkwMlg9eQo+ICBDT05GSUdfRFJNX0kyQ19BRFY3NTExPXkKPiAgQ09ORklHX0RSTV9JMkNfQURW
NzUxMV9BVURJTz15CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
