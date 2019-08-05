Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0AF816C4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005976E3D3;
	Mon,  5 Aug 2019 10:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1EE6E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:17:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 563172F9;
 Mon,  5 Aug 2019 12:17:12 +0200 (CEST)
Date: Mon, 5 Aug 2019 13:17:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Message-ID: <20190805101710.GD29747@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802080613.GF5008@pendragon.ideasonboard.com>
 <TY1PR01MB1770F1B00FEA431E43978FD9C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F1B00FEA431E43978FD9C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565000232;
 bh=mqdLCGTLZQXDGi/vqwQcb5FtYFpqzjRn/gvCjgjqTpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TQS2PEoqz/2A5ipX9abBLnHS2NgeDYXB4szYFKtJdcGYGAVCbxnFzktMTN1ytxHNq
 yVFH01E3YnWw5VX7PLGKLqQkSn70ZspAv3SO0RYcj3fJBSga3EtKgkQ22pZ2RaywVw
 wJeJwfxaASprD0t+6iDPfdeu2lD//OnaUNre6aVI=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAwOTozMjo0MkFNICswMDAwLCBG
YWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gT24gMDIgQXVndXN0IDIwMTkgMDk6MDYgTGF1cmVudCBQ
aW5jaGFydCB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDA4OjM0OjAyQU0gKzAx
MDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiA+ID4gV2hlbiBpbiB2ZXJ0aWNhbCBzdHJpcGUg
bW9kZSBvZiBvcGVyYXRpb24sIHRoZXJlIGlzIHRoZSBvcHRpb24KPiA+ID4gb2Ygc3dhcHBpbmcg
ZXZlbiBkYXRhIGFuZCBvZGQgZGF0YSBvbiB0aGUgdHdvIExWRFMgaW50ZXJmYWNlcwo+ID4gPiB1
c2VkIHRvIGRyaXZlIHRoZSB2aWRlbyBvdXRwdXQuCj4gPiA+IEFkZCBkYXRhIHN3YXAgc3VwcG9y
dCBieSBleHBvc2luZyBhIG5ldyBEVCBwcm9wZXJ0eSBuYW1lZAo+ID4gPiAicmVuZXNhcyxzd2Fw
LWRhdGEiLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJp
emlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8IDIzICsrKysrKysrKysrKysrKystLS0tLS0tCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiA+ID4gaW5kZXggM2FlYWY5ZS4u
YzMwNmZhYiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9s
dmRzLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiA+
ID4gQEAgLTY5LDYgKzY5LDcgQEAgc3RydWN0IHJjYXJfbHZkcyB7Cj4gPiA+Cj4gPiA+ICAJc3Ry
dWN0IGRybV9icmlkZ2UgKmNvbXBhbmlvbjsKPiA+ID4gIAlib29sIGR1YWxfbGluazsKPiA+ID4g
Kwlib29sIHN0cmlwZV9zd2FwX2RhdGE7Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiAgI2RlZmluZSBi
cmlkZ2VfdG9fcmNhcl9sdmRzKGJyaWRnZSkgXAo+ID4gPiBAQCAtNDM5LDEyICs0NDAsMTYgQEAg
c3RhdGljIHZvaWQgcmNhcl9sdmRzX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+
ID4gPiAgCXJjYXJfbHZkc193cml0ZShsdmRzLCBMVkRDSENSLCBsdmRoY3IpOwo+ID4gPgo+ID4g
PiAgCWlmIChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJUktfRFVBTF9MSU5LKSB7
Cj4gPiA+IC0JCS8qCj4gPiA+IC0JCSAqIENvbmZpZ3VyZSB2ZXJ0aWNhbCBzdHJpcGUgYmFzZWQg
b24gdGhlIG1vZGUgb2Ygb3BlcmF0aW9uIG9mCj4gPiA+IC0JCSAqIHRoZSBjb25uZWN0ZWQgZGV2
aWNlLgo+ID4gPiAtCQkgKi8KPiA+ID4gLQkJcmNhcl9sdmRzX3dyaXRlKGx2ZHMsIExWRFNUUklQ
RSwKPiA+ID4gLQkJCQlsdmRzLT5kdWFsX2xpbmsgPyBMVkRTVFJJUEVfU1RfT04gOiAwKTsKPiA+
ID4gKwkJdTMyIGx2ZHN0cmlwZSA9IDA7Cj4gPiA+ICsKPiA+ID4gKwkJaWYgKGx2ZHMtPmR1YWxf
bGluaykKPiA+ID4gKwkJCS8qCj4gPiA+ICsJCQkgKiBDb25maWd1cmUgdmVydGljYWwgc3RyaXBl
IGJhc2VkIG9uIHRoZSBtb2RlIG9mCj4gPiA+ICsJCQkgKiBvcGVyYXRpb24gb2YgdGhlIGNvbm5l
Y3RlZCBkZXZpY2UuCj4gPiA+ICsJCQkgKi8KPiA+ID4gKwkJCWx2ZHN0cmlwZSA9IExWRFNUUklQ
RV9TVF9PTiB8IChsdmRzLT5zdHJpcGVfc3dhcF9kYXRhID8KPiA+ID4gKwkJCQkJCSAgICAgICBM
VkRTVFJJUEVfU1RfU1dBUCA6IDApOwo+ID4gCj4gPiBXb3VsZCB0aGUgZm9sbG93aW5nIGJlIHNp
bXBsZXIgPwo+ID4gCj4gPiAJCWx2ZHN0cmlwZSA9IChsdmRzLT5kdWFsX2xpbmsgPyBMVkRTVFJJ
UEVfU1RfT04gOiAwKQo+ID4gCQkJICB8IChsdmRzLT5zdHJpcGVfc3dhcF9kYXRhID8gTFZEU1RS
SVBFX1NUX1NXQVAgOiAwKTsKPiA+IAo+ID4gPiArCQlyY2FyX2x2ZHNfd3JpdGUobHZkcywgTFZE
U1RSSVBFLCBsdmRzdHJpcGUpOwo+IAo+IEkgYWN0dWFsbHkgdGhpbmsgSSBuZWVkIHRvIHJld29y
ayB0aGlzIHBhdGNoIHNsaWdodGx5LCBiZWNhdXNlIHRoZSB1c2VyIG1hbnVhbAo+IHNheXMgdGhh
dCBTVF9TV0FQIGlzIHJlc2VydmVkIGZvciBMVkQxU1RSSVBFLCBzbyBJIG5lZWQgdG8gbWFrZSBz
dXJlIHdlCj4gZG9uJ3Qgc2V0IGl0IGZvciBMVkRTMS4KPiAKPiBTbyBwZXJoYXBzLCB0aGlzIGNv
dWxkIHRyYW5zbGF0ZSB0byBzb21ldGhpbmcgbGlrZToKPiBJZiAobHZkcy0+ZHVhbF9saW5rKQo+
IAlsdmRzdHJpcGUgPSBMVkRTVFJJUEVfU1RfT04gfCAoPHN3YXAtd2hhdGV2ZXI+ICYmIGx2ZHMt
PmNvbXBhbmlvbikgPyBMVkRTVFJJUEVfU1RfU1dBUCA6IDApOwo+IAo+IEkgZG9uJ3QgdGhpbmsg
d2Ugc2hvdWxkIGJlIHNldHRpbmcgTFZEU1RSSVBFX1NUX1NXQVAgd2l0aG91dCBMVkRTVFJJUEVf
U1RfT04sIHRoaXMgc29sdXRpb24KPiB3b3VsZCBhbGxvdyB1cyB0byB0ZXN0IGx2ZHMtPmR1YWxf
bGluayBvbmx5IG9uY2UsIGFuZCB3aWxsIHByZXZlbnQgdXMgZnJvbSBzZXR0aW5nIExWRFNUUklQ
RV9TVF9TV0FQIGlmCj4gTFZEU1RSSVBFX1NUX09OIGlzIG5vdCBzZXQgb3IgaWYgd2UgYXJlIHRv
dWNoaW5nIExWRFMxLgo+IAo+IFdoYXQgZG8geW91IHRoaW5rPwoKSSB3YXMgdGhpbmtpbmcgdGhh
dCBsdmRzLT5zdHJpcGVfc3dhcF9kYXRhIHNob3VsZCBvbmx5IGJlIHNldCB3aGVuCmx2ZHMtPmR1
YWxfbGluayBpcyBzZXQgYW5kIGx2ZHMtPmNvbXBhbmlvbiBpcyBub24tTlVMTCwgc28gYm90aCBh
cmUKcm91Z2hseSBlcXVpdmFsZW50LiBJdCdzIGEgZGV0YWlsIGFueXdheSwgaXQgZG9lc24ndCBt
YXR0ZXIgdG9vIG11Y2guCgo+ID4gPiAgCX0KPiA+ID4KPiA+ID4gIAkvKgo+ID4gPiBAQCAtNzcw
LDggKzc3NSwxMiBAQCBzdGF0aWMgaW50IHJjYXJfbHZkc19wYXJzZV9kdChzdHJ1Y3QgcmNhcl9s
dmRzICpsdmRzKQo+ID4gPiAgCQl9Cj4gPiA+ICAJfQo+ID4gPgo+ID4gPiAtCWlmIChsdmRzLT5k
dWFsX2xpbmspCj4gPiA+ICsJaWYgKGx2ZHMtPmR1YWxfbGluaykgewo+ID4gPiArCQlsdmRzLT5z
dHJpcGVfc3dhcF9kYXRhID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKAo+ID4gPiArCQkJCQkJbHZk
cy0+ZGV2LT5vZl9ub2RlLAo+ID4gPiArCQkJCQkJInJlbmVzYXMsc3dhcC1kYXRhIik7Cj4gPiA+
ICAJCXJldCA9IHJjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5pb24obHZkcyk7Cj4gPiA+ICsJfQo+
ID4gCj4gPiBBcyBleHBsYWluZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgY29ycmVzcG9uZGluZyBE
VCBiaW5kaW5ncywgSSB0aGluawo+ID4gdGhpcyBzaG91bGQgYmUgcXVlcmllZCBmcm9tIHRoZSBy
ZW1vdGUgZGV2aWNlIHJhdGhlciB0aGFuIHNwZWNpZmllZCBpbgo+ID4gRFQuCj4gPiAKPiA+ID4K
PiA+ID4gIGRvbmU6Cj4gPiA+ICAJb2Zfbm9kZV9wdXQobG9jYWxfb3V0cHV0KTsKCi0tIApSZWdh
cmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
