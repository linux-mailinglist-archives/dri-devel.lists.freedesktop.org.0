Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7CA7F51
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 11:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3DA896E5;
	Wed,  4 Sep 2019 09:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7330C896E5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 09:27:52 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39512)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1i5RZb-0003Yi-2F; Wed, 04 Sep 2019 10:27:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1i5RZP-0004Q3-GU; Wed, 04 Sep 2019 10:27:19 +0100
Date: Wed, 4 Sep 2019 10:27:19 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Cheng-yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH] drm: bridge/dw_hdmi: add audio sample channel status
 setting
Message-ID: <20190904092719.GJ13294@shell.armlinux.org.uk>
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
 <CAFv8NwKHZM+zTu7GF_J0Xk6hubA2JK4cCsdhsDPOGk=3rnbCZw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFv8NwKHZM+zTu7GF_J0Xk6hubA2JK4cCsdhsDPOGk=3rnbCZw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XKThuSbZFfZ7pl95l1VPO0wQKRiG+nLbFF9OeGTjtYM=; b=Om8Lq5NKTbiEdTpux26a7qCk5
 dZ5tJGlG6PK6Luh2tvZO7cMaOJLPmYev9eKKaC+piAWTYRoP3tQBsAX1v0z0Rmmf6HCqVQAkuV80k
 f9MovrDB/BdqRql6wDTRmwUw4C0xwquaK5wQ98nhINmsPydabgyv424kYP72LLxUYR/NFlWMA+5VY
 p9ygB+RVjjh9ozvrDrk/c83hko1T+Krs2RxUAUfeFFukYaxNLm/NHyAnrKbfhgsLJkyFZ4pfG+ZxA
 EzXEF67V3Av318bsLe0fW/7CVPA0qtAMOVbSUl4lU4N80WT/8hmoVpi0tao6OabLx64hmsNOLxnj7
 cqhKedPvQ==;
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
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kuninori.morimoto.gx@renesas.com,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, cain.cai@rock-chips.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yakir Yang <ykk@rock-chips.com>, sam@ravnborg.org,
 Xing Zheng <zhengxing@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 =?utf-8?B?6JSh5p6r?= <eddie.cai@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, kuankuan.y@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDU6MDk6MjlQTSArMDgwMCwgQ2hlbmcteWkgQ2hpYW5n
IHdyb3RlOgo+IEhpLAo+IAo+IE9uIFR1ZSwgU2VwIDMsIDIwMTkgYXQgNTo1MyBQTSBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4K
PiA+IE9uIDAzLzA5LzIwMTkgMDc6NTEsIENoZW5nLVlpIENoaWFuZyB3cm90ZToKPiA+ID4gRnJv
bTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgo+ID4gPgo+ID4gPiBXaGVuIHRyYW5z
bWl0dGluZyBJRUM2MDk4NSBsaW5lYXIgUENNIGF1ZGlvLCB3ZSBjb25maWd1cmUgdGhlCj4gPiA+
IEF1ZGlvIFNhbXBsZSBDaGFubmVsIFN0YXR1cyBpbmZvcm1hdGlvbiBvZiBhbGwgdGhlIGNoYW5u
ZWwKPiA+ID4gc3RhdHVzIGJpdHMgaW4gdGhlIElFQzYwOTU4IGZyYW1lLgo+ID4gPiBSZWZlciB0
byA2MDk1OC0zIHBhZ2UgMTAgZm9yIGZyZXF1ZW5jeSwgb3JpZ2luYWwgZnJlcXVlbmN5LCBhbmQK
PiA+ID4gd29yZGxlbmd0aCBzZXR0aW5nLgo+ID4gPgo+ID4gPiBUaGlzIGZpeCB0aGUgaXNzdWUg
dGhhdCBhdWRpbyBkb2VzIG5vdCBjb21lIG91dCBvbiBzb21lIG1vbml0b3JzCj4gPiA+IChlLmcu
IExHIDIyQ1YyNDEpCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0By
b2NrLWNoaXBzLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxjeWNo
aWFuZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmggfCAyMCArKysrKysrKwo+
ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gPiA+IGluZGV4IGJkNjVkMDQ3
OTY4My4uMzRkNDZlMjVkNjEwIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gPiBAQCAtNTgyLDYgKzU4Miw2MyBAQCBzdGF0aWMgdW5z
aWduZWQgaW50IGhkbWlfY29tcHV0ZV9uKHVuc2lnbmVkIGludCBmcmVxLCB1bnNpZ25lZCBsb25n
IHBpeGVsX2NsaykKPiA+ID4gICAgICAgcmV0dXJuIG47Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtz
dGF0aWMgdm9pZCBoZG1pX3NldF9zY2hubChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiA+ID4gK3sK
PiA+ID4gKyAgICAgdTggYXVkX3NjaG5sX3NhbXBsZXJhdGU7Cj4gPiA+ICsgICAgIHU4IGF1ZF9z
Y2hubF84Owo+ID4gPiArCj4gPiA+ICsgICAgIC8qIFRoZXNlIHJlZ2lzdGVycyBhcmUgb24gUksz
Mjg4IHVzaW5nIHZlcnNpb24gMi4wYS4gKi8KPiA+ID4gKyAgICAgaWYgKGhkbWktPnZlcnNpb24g
IT0gMHgyMDBhKQo+ID4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiBBcmUgdGhlc2Ug
bGltaXRlZCB0byB0aGUgMi4wYSB2ZXJzaW9uICppbiogUkszMjg4LCBvciAyLjBhIHZlcnNpb24g
b24gYWxsCj4gPiBTb0NzID8KPiA+Cj4gCj4gSW4gdGhlIG9yaWdpbmFsIHBhdGNoIGJ5IFlha2ly
LAo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC81Mzk2NTMvICAg
KHNvcnJ5LCBJIHNob3VsZAo+IGhhdmUgYWRkZWQgdGhpcyBsaW5rIGluIHRoZSAiYWZ0ZXIgdGhl
IGN1dCIgbm90ZSkKPiAKPiBUaGUgZml4IGlzIGxpbWl0ZWQgdG8gdmVyc2lvbiAyLjAuCj4gU2lu
Y2UgSSBhbSBvbmx5IHRlc3Rpbmcgb24gUkszMjg4IHdpdGggMi4wYSwgSSBjaGFuZ2UgdGhlIGNo
ZWNrIHRvIDIuMGEgb25seS4KPiBJIGNhbiBub3QgdGVzdCAyLjBhIHZlcnNpb24gb24gb3RoZXIg
U29Dcy4KPiBUaGUgZGF0YWJvb2sgSSBoYXZlIGF0IGhhbmQgaXMgMi4wYSAobm90IHNwZWNpZmlj
IHRvIFJLMzI4OCkgc28gSQo+IHRoaW5rIGFsbCAyLjBhIHNob3VsZCBoYXZlIHRoaXMgcmVnaXN0
ZXIuCj4gCj4gQXMgZm9yIG90aGVyIHZlcnNpb24gbGlrZSB2ZXJzaW9uIDEuMyBvbiBpTVg2LCB0
aGVyZSBpcyBubyBzdWNoCj4gcmVnaXN0ZXIsIGFzIHN0YXRlZCBieSBSdXNzZWxsCj4gCj4gaHR0
cDovL2xrbWwuaXUuZWR1L2h5cGVybWFpbC9saW51eC9rZXJuZWwvMTUwMS4zLzA2MjY4Lmh0bWwu
CgpJdCdzIGxpa2VseSBtb3JlIHRvIGRvIHdpdGggaG93IHRoZSBJUCBpcyBjb25maWd1cmVkIHJh
dGhlciB0aGFuIHRoZQp2ZXJzaW9uLiAgVGhlIGJpZyBkaWZmZXJlbmNlIGJldHdlZW4gZHctaGRt
aSB1c2VkIGluIGlNWDYgYW5kIGVsc2V3aGVyZQppcyB0aGF0IGlNWDYgdXNlcyBhIGJ1aWx0LWlu
IEFIQiBhdWRpbyBpbnRlcmZhY2UgYW5kIG5vdCBJMlMuICBFbHNld2hlcmUKdXNlcyBJMlMuCgpJ
MlMgZG9lcyBub3QgaGF2ZSB0aGUgY2FwYWJpbGl0eSB0byBjb252ZXkgY2hhbm5lbCBzdGF0dXMg
aW5mb3JtYXRpb24KKHdoaWNoIGlzIHJlcXVpcmVkIGJ5IEhETUkpLiAgV2l0aCBBSEIsIGl0IGlz
IGVuY29kZWQgaW50byB0aGUgZGF0YSBpbgptZW1vcnkuCgpTbywgSSB0aGluayB0aGlzIHNldHVw
IHNob3VsZCBiZSBkb25lIGluIHRoZSBJMlMgZHJpdmVyIGFuZCBub3QgaW4gdGhlCmNvcmUgZHJp
dmVyLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVr
L2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1
YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRpbmcgdG8gc3Bl
ZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
