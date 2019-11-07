Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D7F39ED
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 21:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769796E528;
	Thu,  7 Nov 2019 20:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139496E528
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:56:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E6AA71D;
 Thu,  7 Nov 2019 21:56:28 +0100 (CET)
Date: Thu, 7 Nov 2019 22:56:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 7/7] ARM: shmobile_defconfig: Enable support for
 panels from EDT
Message-ID: <20191107205618.GS24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573157463-14070-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573160188;
 bh=XOVqC1Za2WqOkjZOMkB346Qf0kLFRLSch16UrNY1ZsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hRTD0NYmi8ynBwpnxpxSjN+1xthvaX8AjFVrvKFIwAwMx1AQnoWgItF3Nx40NU3BM
 Mm5cokGjY7nzwEv9jQEtADT86OeuSy0YnuR1TJXgTBFB9hg7Jxpecpcb3grXCKgBMA
 EjPjS7vKsnyPsv/kkziHLLTlFAofNBqY/vDb7IKY=
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

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgTm92IDA3LCAy
MDE5IGF0IDA4OjExOjAzUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBUaGUgaXdn
MjBkIGNvbWVzIHdpdGggYW4gTENEIHBhbmVsIGZyb20gRW1lcmdpbmcgRGlzcGxheQo+IFRlY2hu
b2xvZ2llcyBDb3Jwb3JhdGlvbiAoRURUKSwgdGhlcmVmb3JlIGVuYWJsZSB3aGF0J3MKPiByZXF1
aXJlZCB0byBzdXBwb3J0IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8
ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+IC0tLQo+IHYyLT52MzoKPiAqIE5v
IGNoYW5nZQo+IHYxLT52MjoKPiAqIE5vIGNoYW5nZQo+IC0tLQo+ICBhcmNoL2FybS9jb25maWdz
L3NobW9iaWxlX2RlZmNvbmZpZyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25m
aWcgYi9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZwo+IGluZGV4IGM2YzcwMzUu
LmFiNDE2YTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25m
aWcKPiArKysgYi9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZwo+IEBAIC02Niw2
ICs2Niw3IEBAIENPTkZJR19JTlBVVF9FVkRFVj15Cj4gIENPTkZJR19LRVlCT0FSRF9HUElPPXkK
PiAgIyBDT05GSUdfSU5QVVRfTU9VU0UgaXMgbm90IHNldAo+ICBDT05GSUdfSU5QVVRfVE9VQ0hT
Q1JFRU49eQo+ICtDT05GSUdfVE9VQ0hTQ1JFRU5fRURUX0ZUNVgwNj15CgpEbyB0aGVzZSBvcHRp
b25zIG5lZWQgdG8gYmUgYnVpbHQtaW4sIG9yIGNvdWxkIG1vZHVsZXMgd29yayB0b28gPwoKPiAg
Q09ORklHX1RPVUNIU0NSRUVOX1NUMTIzMj15Cj4gIENPTkZJR19JTlBVVF9NSVNDPXkKPiAgQ09O
RklHX0lOUFVUX0FEWEwzNFg9eQo+IEBAIC0xMjUsNyArMTI2LDkgQEAgQ09ORklHX1ZJREVPX0FE
Vjc2MDQ9eQo+ICBDT05GSUdfVklERU9fTUw4NlY3NjY3PXkKPiAgQ09ORklHX0RSTT15Cj4gIENP
TkZJR19EUk1fUkNBUl9EVT15Cj4gK0NPTkZJR19EUk1fUEFORUxfU0lNUExFPXkKPiAgQ09ORklH
X0RSTV9EVU1CX1ZHQV9EQUM9eQo+ICtDT05GSUdfRFJNX0xWRFNfQ09ERUM9eQo+ICBDT05GSUdf
RFJNX1NJSTkwMlg9eQo+ICBDT05GSUdfRFJNX0kyQ19BRFY3NTExPXkKPiAgQ09ORklHX0RSTV9J
MkNfQURWNzUxMV9BVURJTz15CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
