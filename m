Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED0CEAD6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917A66E637;
	Mon,  7 Oct 2019 17:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A466E637
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:44:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48CF0B2D;
 Mon,  7 Oct 2019 19:44:29 +0200 (CEST)
Date: Mon, 7 Oct 2019 20:44:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Message-ID: <20191007174426.GF11781@pendragon.ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
 <20191007172256.GA1956@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007172256.GA1956@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570470269;
 bh=j/RZ7vTnFpQSXDCVdsQh487qVdy1glteYbQqTh4+P7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jfSJUyyq+xRnwgljPVfYonhPmN1RDpoDSHN9SyPloUPuA6KjNJPldONrvJmwH1ty4
 wfa87wudunZ2Mf9Q7g9jseK2IXfUTL9dJL3qA5QKIVpJHSd3P53rT/C2gP7CKNCO5H
 3TYWN4fCa9Aa1jEVpxJp24Ae7maAzQ2HLvjZjGeI=
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 Jyri Sarha <jsarha@ti.com>, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDc6MjI6NTZQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQuCj4gT24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDg6
MDc6NTZQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4g
PiBUaGlzIHBhdGNoIHNlcmllcyBmaXhlcyBhIG1vZHVsZSBhbGlhcyBpc3N1ZSB3aXRoIHRoZSBm
aXZlIHJlY2VudGx5Cj4gPiBhZGRlZCBwYW5lbCBkcml2ZXJzIHVzZWQgYnkgb21hcGRybS4KPiA+
IAo+ID4gQmVmb3JlIHRob3NlIHBhbmVsIGRyaXZlcnMsIG9tYXBkcm0gaGFkIGN1c3RvbSBkcml2
ZXJzIGZvciB0aGUgcGFuZWxzLAo+ID4gYW5kIHByZWZpeGVkIHRoZSBPRiBjb21wYXRpYmxlIHN0
cmluZ3Mgd2l0aCBhbiAib21hcGRzcywiIHByZWZpeC4gVGhlCj4gPiBTUEkgZGV2aWNlIElEcyBh
cmUgY29uc3RydWN0ZWQgYnkgc3RyaXBwaW5nIHRoZSBPRiBjb21wYXRpYmxlIHN0cmluZwo+ID4g
ZnJvbSB0aGUgcHJlZml4LCByZXN1bHRpbmcgaW4gdGhlICJvbWFwZHNzLCIgcHJlZml4IGJlaW5n
IHJlbW92ZWQsIGJ1dAo+ID4gdGhlIHN1YnNlcXVlbmNlIE9GIHZlbmRvciBwcmVmaXggYmVpbmcg
a2VwdC4gVGhlIFNQSSBkcml2ZXJzIHRodXMgaGFkCj4gPiBtb2R1bGVzIGFsaWFzZXMgdGhhdCBj
b250YWluZWQgdGhlIHZlbmRvciBwcmVmaXguCj4gPiAKPiA+IE5vdyB0aGF0IHRoZSBwYW5lbHMg
YXJlIHN1cHBvcnRlZCBieSBzdGFuZGFyZCBkcml2ZXJzIGFuZCB0aGUgIm9tYXBkc3MsIgo+ID4g
cHJlZml4IGlzIHJlbW92ZWQsIHRoZSBTUEkgZGV2aWNlIElEcyBhcmUgc3RyaXBwZWQgZnJvbSB0
aGUgT0YgdmVuZG9yCj4gPiBwcmVmaXguIEFzIHRoZSBuZXcgcGFuZWwgZHJpdmVycyBjb3BpZWQg
dGhlIG1vZHVsZSBhbGlhc2VzIGZyb20gdGhlCj4gPiBvbWFwZHJtLXNwZWNpZmljIGRyaXZlcnMs
IHRoZXkgY29udGFpbiB0aGUgdmVuZG9yIHByZWZpeCBpbiB0aGVpciBTUEkKPiA+IG1vZHVsZSBh
bGlhc2VzLCBhbmQgYXJlIHRodXMgbm90IGxvYWRlZCBhdXRvbWF0aWNhbGx5Lgo+ID4gCj4gPiBG
aXggdGhpcyBieSByZW1vdmluZyB0aGUgdmVuZG9yIHByZWZpeCBmcm9tIHRoZSBTUEkgbW9kdWxl
cyBhbGlhc2VzIGluCj4gPiB0aGUgZHJpdmVycy4gRm9yIGNvbnNpc3RlbmN5IHJlYXNvbiwgdGhl
IG1hbnVhbCBtb2R1bGUgYWxpYXNlcyBhcmUgYWxzbwo+ID4gbW92ZWQgdG8gdXNlIGFuIFNQSSBt
b2R1bGUgdGFibGUuCj4gCj4gR29vZCBleHBsYW5hdGlvbiAtIHRoYW5rcy4KPiAKPiA+IFRoZXNl
IHBhdGNoZXMgYXJlIGJhc2VkIG9uIHRoZSBkcm0tbWlzYy1maXhlcyBicmFuY2ggYXMgdGhleSBm
aXggdjUuNAo+ID4gcmVncmVzc2lvbnMuCj4gPiAKPiA+IExhdXJlbnQgUGluY2hhcnQgKDUpOgo+
ID4gICBkcm0vcGFuZWw6IGxnLWxiMDM1cTAyOiBGaXggU1BJIGFsaWFzCj4gPiAgIGRybS9wYW5l
bDogbmVjLW5sODA0OGhsMTE6IEZpeCBTUEkgYWxpYXMKPiA+ICAgZHJtL3BhbmVsOiBzb255LWFj
eDU2NWFrbTogRml4IFNQSSBhbGlhcwo+ID4gICBkcm0vcGFuZWw6IHRwby10ZDAyOHR0ZWMxOiBG
aXggU1BJIGFsaWFzCj4gPiAgIGRybS9wYW5lbDogdHBvLXRkMDQzbXRlYTE6IEZpeCBTUEkgYWxp
YXMKPiAKPiBGdWxsIHNlcmllcyBpczoKPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgo+IAo+IEkgZXhwZWN0IHNvbWVvbmUgZWxzZSB0byBwaWNrIHRoZW0gdXAgb3Ig
dGhhdCB5b3UgYXBwbHkgdGhlbS4KCkknZCBsaWtlIHNvbWVvbmUgdG8gdGVzdCB0aGUgcGF0Y2hl
cyBmaXJzdCBpZiBwb3NzaWJsZSA6LSkgVG9taSwgY291bGQKeW91IHRoZW4gcGljayB0aGVzZSB1
cCBhcyB2NS40IGZpeGVzID8KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
