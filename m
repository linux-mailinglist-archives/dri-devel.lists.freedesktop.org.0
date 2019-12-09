Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05EA117084
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 16:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7512C89C5E;
	Mon,  9 Dec 2019 15:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246E289C5E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:32:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C44B6FCF;
 Mon,  9 Dec 2019 16:32:44 +0100 (CET)
Date: Mon, 9 Dec 2019 17:32:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: analogix-anx78xx:
 support bypass GPIO
Message-ID: <20191209153238.GE12841@pendragon.ideasonboard.com>
References: <20191209145016.227784-1-hsinyi@chromium.org>
 <20191209145016.227784-4-hsinyi@chromium.org>
 <20191209145552.GD12841@pendragon.ideasonboard.com>
 <CAJMQK-hNSF-Vu4CfTKiCUdBRmaONf=Lp3NN0-nFor6mxY1seJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJMQK-hNSF-Vu4CfTKiCUdBRmaONf=Lp3NN0-nFor6mxY1seJg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575905565;
 bh=0cB0KQ3w+T+YFNjQmKzHnWoA1Lbe2MnHeWDxvrD8lXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b2QZylIm5A2WoRrkTXJACdWQ8pVO3Oc6jF1G0+p6ZZZ5RxitGUqTKPs/gxaeVL5xs
 knCiwQStorSLSz+tdnbQ0oSMO4fc+799n85bSK0hRusxluYigK4T5+5JzphL63NLCZ
 cFkTOH3wYDnQiipsxpDzlK3VP6tXltJ+KHLb+rDw=
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
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSHNpbi1ZaSwKCk9uIE1vbiwgRGVjIDA5LCAyMDE5IGF0IDExOjA5OjM0UE0gKzA4MDAsIEhz
aW4tWWkgV2FuZyB3cm90ZToKPiBPbiBNb24sIERlYyA5LCAyMDE5IGF0IDEwOjU1IFBNIExhdXJl
bnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBNb24sIERlYyAwOSwgMjAxOSBhdCAxMDo1MDoxNVBN
ICswODAwLCBIc2luLVlpIFdhbmcgd3JvdGU6Cj4gPiA+IFN1cHBvcnQgb3B0aW9uYWwgZmVhdHVy
ZTogYnlwYXNzIEdQSU8uCj4gPiA+Cj4gPiA+IFNvbWUgU29DIChlZy4gbXQ4MTczKSBoYXZlIGEg
aGFyZHdhcmUgbXV4IHRoYXQgY29ubmVjdHMgdG8gMiBwb3J0czoKPiA+ID4gYW54NzY4OCBhbmQg
aGRtaS4gV2hlbiB0aGUgR1BJTyBpcyBhY3RpdmUsIHRoZSBicmlkZ2UgaXMgYnlwYXNzZWQuCj4g
Pgo+ID4gVGhpcyBkb2Vzbid0IGxvb2sgbGlrZSB0aGUgcmlnaHQgcGxhY2UgdG8gZml4IHRoaXMs
IGFzIHRoZSBtdXggaXMKPiA+IHVucmVsYXRlZCB0byB0aGUgYnJpZGdlLiBZb3Ugd291bGQgaGF2
ZSB0byBkdXBsaWNhdGUgdGhpcyBsb2dpYyBpbiBldmVyeQo+ID4gYnJpZGdlIGRyaXZlciBvdGhl
cndpc2UuCj4gPgo+ID4gQ291bGQgeW91IGRlc2NyaWJlIHRoZSBoYXJkd2FyZSB0b3BvbG9neSBp
biBhIGJpdCBtb3JlIGRldGFpbHMgPyBJIGNhbgo+ID4gdGhlbiB0cnkgdG8gYWR2aXNlIG9uIGhv
dyB0byBiZXN0IHN1cHBvcnQgaXQuCj4KPiBIaSBMYXVyZW50LAo+IAo+IFRoZSBtdDgxNzMgbGF5
b3V0IGlzOgo+IAo+IE1UODE3MyBIRE1JIGJyaWRnZS0tIGhhcmR3YXJlIG11eCAtLS0gSERNSQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0t
LS0tLS0tIGFueDc2ODgKCllvdSBtYXkgaGF2ZSB1c2VkIGEgcHJvcG9ydGlvbmFsIGZvbnQgd2hl
biB3cml0aW5nIHRoaXMsIHRoZSB8IGRvZXNuJ3QKYWxpZ24gd2l0aCBhbnl0aGluZyB1c2luZyBh
IGZpeGVkIGZvbnQuIERvIEkgYXNzdW1lIGNvcnJlY3RseSB0aGF0IHRoZQpoYXJkd2FyZSBtdWx0
aXBsZXhlciBpcyBhY3R1YWxseSBhIGRlbXVsdGlwbGV4ZXIgd2l0aCBvbmUgaW5wdXQgYW5kIHR3
bwpvdXRwdXRzID8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICstLS0tLS0t
LS0tLSsKKy0tLS0tLS0tLSsgICAgICAgICArLS0tLS0tKyAgICAvLS0+IHwgSERNSSAgICAgIHwK
fCBNVDgxNzMgIHwgIEhETUkgICB8ICAgLS0+fCAtLS8gICAgIHwgQ29ubmVjdG9yIHwKfCAgSERN
SSAgIHwgLS0tLS0tPiB8LS0vICAgfCAgICAgICAgICstLS0tLS0tLS0tLSsKfCBFbmNvZGVyIHwg
ICAgICAgICB8ICAgIC0+fCAtLVwgICAgICstLS0tLS0tLS0tLSsgICAgICArLS0tLS0tLS0tLS0r
CistLS0tLS0tLS0rICAgICAgICAgKy0tLS0tLSsgICAgXC0tPiB8IEFOWDc2ODggICB8IC0tLT4g
fCBVU0ItQyAgICAgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBCcmlk
Z2UgICAgfCAgICAgIHwgQ29ubmVjdG9yIHwKCQkJCSAgICAgKy0tLS0tLS0tLS0tKyAgICAgICst
LS0tLS0tLS0tLSsKCj4gVGhlcmUncyBhIGhhcmR3YXJlIG11eCB0aGF0IHRha2VzIG10ODE3MyBo
ZG1pIGFzIGlucHV0IGFuZCBoYXMgMgo+IG91dHB1dCBwb3J0OiBuYXRpdmUgaGRtaSBhbmQgYW54
NzY4OCBicmlkZ2UuCj4gSWYgZ3BpbyBpcyBhY3RpdmUsIHdlIHdvdWxkIGxpa2UgaXQgdG8gZ28g
dG8gSERNSS4KPiAKPiBQcmV2aW91cyBhcHByb2FjaCBpcyB0byBtYWtlIGhhcmR3YXJlIG11eCBh
IGdlbmVyaWMgZ3BpbyBtdXggYnJpZGdlLAo+IGJ1dCB0aGlzIGlzIHByb2JhYmx5IGEgdmVyeSBy
YXJlIHVzZSBjYXNlIHRoYXQgaXMgb25seSBmb3IKPiBtdDgxNzMuKGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvNTc3MjNBRDIuODAyMDgwNkBjb2RlYXVyb3JhLm9yZy8pCj4gV2UgbWVyZ2Ug
dGhlIG11eCBhbmQgYW54NzY4OCB0byBhIHNpbmdsZSBicmlkZ2UgYW5kIGxlYXZlIHRoaXMgYXMg
YW4KPiBvcHRpb25hbCBmZWF0dXJlIGluIHRoaXMgdGltZS4KCkkgdGhpbmsgdGhhdCdzIGEgYmV0
dGVyIGFwcHJvYWNoLCBhdCBsZWFzdCBhdCB0aGUgRFQgbGV2ZWwuIFRoZSBIRE1JCmRlbXVsdGlw
bGV4ZXIgc2hvdWxkIGJlIHJlcHJlc2VudGVkIGFzIGEgRFQgbm9kZSB3aXRoIDMgcG9ydHMgKG9u
ZSBpbnB1dAphbmQgdHdvIG91dHB1dHMpIHdpdGggYSBjb250cm9sIEdQSU8uCgpGcm9tIGEgdmlk
ZW8gcG9pbnQgb2YgdmlldywgdGhlIEFOWDc2ODggc2hvdWxkIGJlIHJlcHJlc2VudGVkIGFzIGEg
RFQKbm9kZSB3aXRoIDIgcG9ydHMgKG9uZSBpbnB1dCBhbmQgb25lIG91dHB1dCksIHJlZ2FyZGxl
c3Mgb2Ygd2hldGhlciBpdAppcyB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGggYW4gSERNSSBzd2l0
Y2ggYXMgc2hvd24gYWJvdmUsIG9yIGRpcmVjdGx5CmNvbm5lY3RlZCB0byB0aGUgb3V0cHV0IG9m
IGFuIEhETUkgZW5jb2Rlci4gSG93ZXZlciwgYXMgdGhlIEFOWDc2ODgKc3VwcG9ydHMgYm90aCBE
UCBvdXRwdXQgYW5kIFVTQi1DIG91dHB1dCwgdGhlIHNpdHVhdGlvbiBtYXkgYmUgc2xpZ2h0bHkK
bW9yZSBjb21wbGV4LiBQbGVhc2Ugc2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTExODQ4OTUvCmZvciBhIHNpbWlsYXIgZGlzY3Vzc2lvbiwgcmVsYXRlZCB0byB0aGUgQU5Y
NzYyNS4KCkluIGFueSBjYXNlLCBJIGRvbid0IHRoaW5rIHRoZSBBTlg3Njg4IHNob3VsZCBjYXJl
IGFib3V0IHRoZSBHUElPLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
