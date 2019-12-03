Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6526510FE94
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18436E161;
	Tue,  3 Dec 2019 13:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335296E161
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:22:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4821D309;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
Date: Tue, 3 Dec 2019 15:22:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge: lvds-transmitter:
 Add new props
Message-ID: <20191203132241.GQ4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-18-boris.brezillon@collabora.com>
 <20191202171140.GR4929@pendragon.ideasonboard.com>
 <20191203133843.32cab43e@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203133843.32cab43e@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575379369;
 bh=JpHuU7B1YlnxGZyUy1Mq/44OB8mK0NSeVUkhBs9yFv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k6KAI49qneV2kbHO+NuPIV227baWlP9abEnvgQ1TzzUCku+zGWuLAwdkGex/2klEr
 mCtZJA5cQMOkEH/SXFYUN1pdo7MgJFu5m+6X4phmmj8OQhmY1nDBq+hTLMEJYhyItQ
 evRDBOPQaH9kt6rmF0355QUrZQNkvE25Uew5SONE=
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
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwMTozODo0M1BNICswMTAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gTW9uLCAyIERlYyAyMDE5IDE5OjExOjQwICswMjAwIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAwNTo0NTow
OFBNICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiA+IEFkZCB0aGUgZGF0YS1tYXBw
aW5nIHByb3BlcnR5IHRvIGRlc2NyaWJlIHRoZSBvdXRwdXQgYnVzIGZvcm1hdCBhbmQKPiA+ID4g
dGhlIGJ1cy13aWR0aCBwcm9wZXJ0eSB0byBkZXNjcmliZSB0aGUgaW5wdXQgYnVzIGZvcm1hdC4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAq
IE5ldyBwYXRjaAo+ID4gPiAtLS0KPiA+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9s
dmRzLXRyYW5zbWl0dGVyLnR4dCAgICB8IDEzICsrKysrKysrKysrKysgIAo+ID4gCj4gPiBQbGVh
c2Ugbm90ZSB0aGF0IGx2ZHMtdHJhbnNtaXR0ZXIgaGFzIGJlZW4gcmVuYW1lZCB0byBsdmRzLWNv
ZGVjIGFuZAo+ID4gY29udmVydGVkIHRvIFlBTUwgYXMgcGFydCBvZiBhIHB1bGwgcmVxdWVzdCBJ
J3ZlIHJlY2VudGx5IHNlbnQgKFsxXSkuCj4gPiBUaGlzIHBhdGNoIHdpbGwgdGh1cyBuZWVkIHRv
IGJlIHJlYmFzZWQuCj4gCj4gTGV0IG1lIGtub3cgd2hlbiBpdCdzIGJlZW4gbWVyZ2VkLCBJJ2xs
IGFzayBmb3IgYSBkcm0tbmV4dCAtPgo+IGRybS1taXNjLW5leHQgYmFja21lcmdlLgoKSSBleHBl
Y3QgRGF2ZSB0byBtZXJnZSBpdCB3aGVuIHRoZSBtZXJnZSB3aW5kb3cgd2lsbCBjbG9zZS4KCj4g
PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzM0Mjc1NC8KPiA+
IAo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvbHZkcy10cmFuc21pdHRlci50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQKPiA+ID4gaW5kZXggNjAwOTFk
YjVkZmE1Li43YjQzYjZmMjAyNzkgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAo+ID4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
bHZkcy10cmFuc21pdHRlci50eHQKPiA+ID4gQEAgLTM2LDYgKzM2LDE5IEBAIGdyYXBoIGJpbmRp
bmdzIHNwZWNpZmllZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgu
dHh0Lgo+ID4gPiAgLSBWaWRlbyBwb3J0IDAgZm9yIHBhcmFsbGVsIGlucHV0Cj4gPiA+ICAtIFZp
ZGVvIHBvcnQgMSBmb3IgTFZEUyBvdXRwdXQKPiA+ID4gIAo+ID4gPiArT3B0aW9uYWwgcG9ydCAw
IG5vZGUgcHJvcGVydGllczoKPiA+ID4gKwo+ID4gPiArLSBidXMtd2lkdGg6IG51bWJlciBvZiBk
YXRhIGxpbmVzIHVzZSB0byB0cmFuc21pdCB0aGUgUkdCIGRhdGEuCj4gPiA+ICsJICAgICBDYW4g
YmUgMTggb3IgMjQuCj4gPiA+ICsKPiA+ID4gK09wdGlvbmFsIHBvcnQgMSBub2RlIHByb3BlcnRp
ZXM6Cj4gPiA+ICsKPiA+ID4gKy0gZGF0YS1tYXBwaW5nOiBzZWUgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbHZkcy55YW1sCj4gPiA+ICsJCWZvciBtb3Jl
IGRldGFpbHMgYWJvdXQgdGhpcyBMVkRTIGRhdGEtbWFwcGluZyBwcm9wZXJ0eS4KPiA+ID4gKwkJ
U3VwcG9ydGVkIHZhbHVlczoKPiA+ID4gKwkJImplaWRhLTE4Igo+ID4gPiArCQkiamVpZGEtMjQi
Cj4gPiA+ICsJCSJ2ZXNhLTI0Igo+ID4gPiAgCj4gPiA+ICBFeGFtcGxlCj4gPiA+ICAtLS0tLS0t
ICAKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
