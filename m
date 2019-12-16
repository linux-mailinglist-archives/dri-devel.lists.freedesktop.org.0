Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80A1228DC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9436E9AB;
	Tue, 17 Dec 2019 10:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303FC6E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:03:17 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DB96C24001C;
 Mon, 16 Dec 2019 11:03:13 +0000 (UTC)
Date: Mon, 16 Dec 2019 12:03:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 09/12] drm/rockchip: lvds: Add PX30 support
Message-ID: <20191216120312.4aa478da@xps13>
In-Reply-To: <20191216105827.rxkfbwemkqw446jx@gilmour.lan>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
 <20191216105827.rxkfbwemkqw446jx@gilmour.lan>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLAoKTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdyb3RlIG9uIE1v
biwgMTYgRGVjIDIwMTkgMTE6NTg6MjcKKzAxMDA6Cgo+IEhpLAo+IAo+IE9uIEZyaSwgRGVjIDEz
LCAyMDE5IGF0IDA3OjEwOjQ4UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiArc3Rh
dGljIGludCBweDMwX2x2ZHNfZ3JmX2NvbmZpZyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIs
Cj4gPiArCQkJCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+ID4gK3sKPiA+ICsJc3Ry
dWN0IHJvY2tjaGlwX2x2ZHMgKmx2ZHMgPSBlbmNvZGVyX3RvX2x2ZHMoZW5jb2Rlcik7Cj4gPiAr
CXU4IG5oc3luYyA9ICEobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX1BIU1lOQyk7Cj4gPiAr
CXU4IG52c3luYyA9ICEobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX1BWU1lOQyk7Cj4gPiAr
CXU4IG5kY2xrID0gIShtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfUENTWU5DKTsKPiA+ICsJ
aW50IHJldDsKPiA+ICsKPiA+ICsJaWYgKGx2ZHMtPm91dHB1dCAhPSBESVNQTEFZX09VVFBVVF9M
VkRTKSB7Cj4gPiArCQlEUk1fREVWX0VSUk9SKGx2ZHMtPmRldiwgIlVuc3VwcG9ydGVkIGRpc3Bs
YXkgb3V0cHV0ICVkXG4iLAo+ID4gKwkJCSAgICAgIGx2ZHMtPm91dHB1dCk7Cj4gPiArCQlyZXR1
cm4gLUVJTlZBTDsKPiA+ICsJfQo+ID4gKwo+ID4gKwlpZiAobmhzeW5jIF4gbnZzeW5jKSB7Cj4g
PiArCQlEUk1fREVWX0VSUk9SKGx2ZHMtPmRldiwgIlVuc3VwcG9ydGVkIEhzeW5jL1ZzeW5jIHBv
bGFyaXR5XG4iKTsKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwl9Cj4gPiArCj4gPiArCS8q
IFNldCBmb3JtYXQgKi8KPiA+ICsJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGx2ZHMtPmdyZiwg
UFgzMF9MVkRTX0dSRl9QRF9WT19DT04xLAo+ID4gKwkJCQkgUFgzMF9MVkRTX0ZPUk1BVChsdmRz
LT5mb3JtYXQpLAo+ID4gKwkJCQkgUFgzMF9MVkRTX0ZPUk1BVChsdmRzLT5mb3JtYXQpKTsKPiA+
ICsJaWYgKHJldCkKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiArCj4gPiArCS8qIENvbnRyb2wgSHN5
bmMvVnN5bmMgcG9sYXJpdHkgKi8KPiA+ICsJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGx2ZHMt
PmdyZiwgUFgzMF9MVkRTX0dSRl9QRF9WT19DT04wLAo+ID4gKwkJCQkgUFgzMF9MVkRTX1RJRV9D
TEtTKDEpLAo+ID4gKwkJCQkgUFgzMF9MVkRTX1RJRV9DTEtTKDEpKTsKPiA+ICsJaWYgKHJldCkK
PiA+ICsJCXJldHVybiByZXQ7Cj4gPiArCj4gPiArCS8qIFNldCBIc3luYy9Wc3luYyBwb2xhcml0
eSAqLwo+ID4gKwlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobHZkcy0+Z3JmLCBQWDMwX0xWRFNf
R1JGX1BEX1ZPX0NPTjAsCj4gPiArCQkJCSBQWDMwX0xWRFNfSU5WRVJUX0NMS1MoMSksCj4gPiAr
CQkJCSBQWDMwX0xWRFNfSU5WRVJUX0NMS1MobmhzeW5jKSk7Cj4gPiArCWlmIChyZXQpCj4gPiAr
CQlyZXR1cm4gcmV0OyAgCj4gCj4gSSBkb24ndCBrbm93IHRoZSBoYXJkd2FyZSBidXQgaXQgc2Vl
bXMgcHJldHR5IHdlaXJkIHRvIG1lLiBoc3luYyBhbmQKPiB2c3luYyBpbiBMVkRTIGFyZSBub3Qg
Y2xvY2tzIChvciBldmVuIHNpZ25hbHMpLCB0aGV5J3JlIGEgYml0IGluIHRoZQo+IHBheWxvYWQu
IElzIHRoZXJlIGFueSBleHBsYW5hdGlvbiBpbiB0aGUgZGF0YXNoZWV0IChvciBldmVuIGEKPiBk
YXRhc2hlZXQgaW4gdGhlIGZpcnN0IHBsYWNlKT8KClRoZXJlIGlzIG5vIGV4cGxhbmF0aW9uIGFi
b3V0IHRoaXMgaW4gdGhlIFBYMzAgVFJNIHBhcnQgMSAocHVibGljKS4gQnV0CnlvdSBhcmUgcmln
aHQgdGhlIG5hbWluZyBpcyB3ZWlyZC4gQ291bGQgdGhlICJ0aWUgY2xvY2tzIiB0aGluZyBhYm92
ZQptZWFuIHNvbWV0aGluZyB0byB5b3UvcGVvcGxlIGtub3dpbmcgdGhlIExWRFMgd29ybGQ/CgpD
aGVlcnMsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
