Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77A9CD2B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 12:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FC689B61;
	Mon, 26 Aug 2019 10:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D7989B61
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 10:15:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4EE731B;
 Mon, 26 Aug 2019 12:15:56 +0200 (CEST)
Date: Mon, 26 Aug 2019 13:15:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190826101550.GB5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826075943.h7ivwagape3glym5@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566814557;
 bh=9wZSzYHEKtzlGccYoNBaQM5/r5uiiDKyUx0xfquMNBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uyvLe2AQoJzdJ3a+hqTNdkz1kiuJHyq90GBzU82SftccR9ETTjypUnKh5WGKh3DPQ
 XJbEq+4MyWenoNDZWKweCjlylTnbe/CfH6HJr0A80djtxztDj2j1L0XXUnpLLmwDn6
 pV+EB/Ug5xi0/r8KUu2H5seKFRPZG3xSg3Lu5fyk=
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
Cc: muroya@ksk.co.jp, Ulrich Hecht <uli@fpond.eu>,
 Simon Horman <horms@verge.net.au>, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDk6NTk6NDNBTSArMDIwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDI2LCAyMDE5IGF0IDA5OjM0OjQxQU0gKzAy
MDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIFN1biwgQXVnIDI1LCAyMDE5IGF0
IDM6NTAgUE0gSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPiB3cm90ZToK
PiA+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5l
c2FzIFItQ2FyIERpc3BsYXkKPiA+ID4gVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KPiA+
ID4KPiA+ID4gQ01NIGlzIHRoZSBpbWFnZSBlbmhhbmNlbWVudCBtb2R1bGUgYXZhaWxhYmxlIG9u
IGVhY2ggUi1DYXIgRFUgdmlkZW8KPiA+ID4gY2hhbm5lbCBvbiBSLUNhciBHZW4yIGFuZCBHZW4z
IFNvQ3MgKFYzSCBhbmQgVjNNIGV4Y2x1ZGVkKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
SmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4KPiA+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCEKPiA+Cj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0Cj4gPiA+
IEBAIC0wLDAgKzEsMzMgQEAKPiA+ID4gKyogUmVuZXNhcyBSLUNhciBDb2xvciBNYW5hZ2VtZW50
IE1vZHVsZSAoQ01NKQo+ID4gPiArCj4gPiA+ICtSZW5lc2FzIFItQ2FyIGltYWdlIGVuaGFuY2Vt
ZW50IG1vZHVsZSBjb25uZWN0ZWQgdG8gUi1DYXIgRFUgdmlkZW8gY2hhbm5lbHMuCj4gPiA+ICsK
PiA+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiA+ICsgLSBjb21wYXRpYmxlOiBzaGFsbCBi
ZSBvbmUgb3IgbW9yZSBvZiB0aGUgZm9sbG93aW5nOgo+ID4gPiArICAgLSAicmVuZXNhcyxjbW0t
cjhhNzc5NSI6IGZvciBSOEE3Nzk1IChSLUNhciBIMykgY29tcGF0aWJsZSBDTU0uCj4gPiA+ICsg
ICAtICJyZW5lc2FzLGNtbS1yOGE3Nzk2IjogZm9yIFI4QTc3OTYgKFItQ2FyIE0zLVcpIGNvbXBh
dGlibGUgQ01NLgo+ID4gPiArICAgLSAicmVuZXNhcyxjbW0tcjhhNzc5NjUiOiBmb3IgUjhBNzc5
NjUgKFItQ2FyIE0zLU4pIGNvbXBhdGlibGUgQ01NLgo+ID4gPiArICAgLSAicmVuZXNhcyxjbW0t
cjhhNzc5OTAiOiBmb3IgUjhBNzc5OTAgKFItQ2FyIEUzKSBjb21wYXRpYmxlIENNTS4KPiA+ID4g
KyAgIC0gInJlbmVzYXMsY21tLXI4YTc3OTk1IjogZm9yIFI4QTc3OTk1IChSLUNhciBEMykgY29t
cGF0aWJsZSBDTU0uCj4gPgo+ID4gUGxlYXNlIHVzZSAicmVuZXNhcyw8c29jeXBlLT4tY21tIiBp
bnN0ZWFkIG9mICJyZW5lc2FzLGNtbS08c29jdHlwZT4iLgo+IAo+IEkgYWN0dWFsbHkgY29waWVk
IGl0IGZyb20gdGhlIHItY2FyIGdwaW8gYmluZGluZ3MsIGFuZCBJIGxpa2VkCj4gY21tLTxzb2N0
eXBlPiBiZXR0ZXIuIElmIHlvdSBwcmVmZXIgSSBjYW4gY2hhbmdlIGl0IHRob3VnaC4KPiAKPiA+
ID4gKyAgIC0gInJlbmVzYXMscmNhci1nZW4zLWNtbSI6IGZvciBhIGdlbmVyaWMgUi1DYXIgR2Vu
MyBjb21wYXRpYmxlIENNTS4KPiA+ID4gKyAgIC0gInJlbmVzYXMscmNhci1nZW4yLWNtbSI6IGZv
ciBhIGdlbmVyaWMgUi1DYXIgR2VuMiBjb21wYXRpYmxlIENNTS4KPiA+ID4gKwo+ID4gPiArICAg
V2hlbiB0aGUgZ2VuZXJpYyBjb21wYXRpYmxlIHN0cmluZyBpcyBzcGVjaWZpZWQsIHRoZSBTb0Mt
c3BlY2lmaWMKPiA+ID4gKyAgIHZlcnNpb24gY29ycmVzcG9uZGluZyB0byB0aGUgcGxhdGZvcm0g
c2hvdWxkIGJlIGxpc3RlZCBmaXJzdC4KPiA+ID4gKwo+ID4gPiArIC0gcmVnOiB0aGUgYWRkcmVz
cyBiYXNlIGFuZCBsZW5ndGggb2YgdGhlIG1lbW9yeSBhcmVhIHdoZXJlIENNTSBjb250cm9sCj4g
PiA+ICsgICByZWdpc3RlcnMgYXJlIG1hcHBlZCB0by4KPiA+ID4gKwo+ID4gPiArIC0gY2xvY2tz
OiBwaGFuZGxlIGFuZCBjbG9jay1zcGVjaWZpZXIgcGFpciB0byB0aGUgQ01NIGZ1bmN0aW9uYWwg
Y2xvY2sKPiA+ID4gKyAgIHN1cHBsaWVyLgo+ID4KPiA+IFRoaW5raW5nIGFib3V0IHlhbWwgdmFs
aWRhdGlvbjoKPiA+Cj4gPiBwb3dlci1kb21haW5zPwo+ID4gcmVzZXRzPwo+IAo+IFRoZXkgc2hv
dWxkIGluZGVlZCBiZSBkb2N1bWVudGVkLgoKSG93IGFib3V0IGNvbnZlcnRpbmcgdGhpcyBiaW5k
aW5nIHRvIHlhbWwgYWxyZWF5ID8gSXQgc2hvdWxkIGJlIGZhaXJseQpzaW1wbGUuCgo+ID4gPiAr
RXhhbXBsZToKPiA+ID4gKy0tLS0tLS0tCj4gPiA+ICsKPiA+ID4gKyAgICAgICBjbW0wOiBjbW1A
ZmVhNDAwMDAgewo+ID4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNt
bS1yOGE3Nzk2IjsKPiA+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAw
eDEwMDA+Owo+ID4gPiArICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3
Nzk2X1BEX0FMV0FZU19PTj47Cj4gPiA+ICsgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBD
UEdfTU9EIDcxMT47Cj4gPiA+ICsgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyA3MTE+Owo+
ID4gPiArICAgICAgIH07CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
