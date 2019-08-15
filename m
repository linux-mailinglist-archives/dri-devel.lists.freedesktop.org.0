Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F488EDFA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7ED6E409;
	Thu, 15 Aug 2019 14:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117E16E409
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:16:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8CFE920049;
 Thu, 15 Aug 2019 16:16:00 +0200 (CEST)
Date: Thu, 15 Aug 2019 16:15:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 0/9] Add dual-LVDS panel support to EK874
Message-ID: <20190815141559.GB2437@ravnborg.org>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=xQ1MIdX7YOo3YP1MDUoA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, David Airlie <airlied@linux.ie>,
 ebiharaml@si-linux.co.jp, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 xu_shunji@hoperun.com, Biju Das <biju.das@bp.renesas.com>,
 Simon Horman <horms@verge.net.au>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8KCj4gaXQgYXBwZWFycyB0aGF0IFJvYiBoYXMgYmVlbiBidXN5IGNvbnZlcnRp
bmcgdGhlIGR0LWJpbmRpbmdzIHJlbGV2YW50IHRvIHRoaXMKPiBzZXJpZXMsIGFuZCBoaXMgY2hh
bmdlcyBhcmUgbm93IGZvdW5kIGluIGxpbnV4LW5leHQuIE1vc3Qgbm90YWJseQo+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2ZHMudHh0IGhh
cyBub3cgYmVjb21lCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvbHZkcy55YW1sCj4gCj4gWW91IGhhdmUgYWxyZWFkeSB0YWtlbiBwYXRjaDoKPiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMDcyNzQ5Lwo+IAo+IGFzIHN1Y2ggdGhl
IHBhdGNoIEkgYW0gc2VuZGluZyB5b3UgaXMgc3RpbGwgcmVsYXRlZCB0bzoKPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1sdmRzLnR4dAo+IAo+
IFBhdGNoICJkdC1iaW5kaW5nczogZGlzcGxheTogQWRkIGJpbmRpbmdzIGZvciBBZHZhbnRlY2gg
SURLLTIxMjFXUiIgaXMgc3RpbGwKPiBhc3N1bWluZyB0aGUgZm9ybWF0IGlzIC50eHQsIGFzIEkg
YW0gbm90IHRvbyBzdXJlIGFib3V0IHdoYXQgdGhlIHByb3RvY29sIGlzIGluCj4gdGhpcyBjYXNl
PyBTaGFsbCB3ZSB0YWtlIHRoaXMgcGF0Y2ggYW5kIGNvbnZlcnQgaXQgbGF0ZXIgdG8gLnlhbWwg
b3Igc2hhbGwgSQo+IGNvbnZlcnQgaXQgdG8gLnlhbWwgc3RyYWlnaHQgYXdheT8KPiAKPiBQbGVh
c2UsIGxldCBtZSBrbm93IHdoYXQncyB0aGUgYmVzdCBjb3Vyc2Ugb2YgYWN0aW9uLgoKSXQgaXMg
cHJlZmVycmVkIHRoYXQgYWxsIG5ldyBkaXNwbGF5IGFuZCBwYW5lbCBiaW5kaW5ncyB1c2VzIHRo
ZSBuZXcKbWV0YS1zY2hlbWEgZm9ybWF0LgpBbmQgdGhhdCB0aGUgd3JpdGVycyB1c2VzIHRoZSBh
dmFpbGFibGUgdG9vbHMgdG8gdmVyaWZ5IHRoZSBiaW5kaW5ncwpzdWJtaXNzaW9uLgpUaGlzIGlz
IG9uZSB3YXkgdG8gYXZvaWQgc2ltcGxlIG1pc3Rha2VzIGluIGV4YW1wbGVzLgoKCVNhbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
