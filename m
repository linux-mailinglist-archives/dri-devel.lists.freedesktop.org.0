Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B81F9B0
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 20:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2060A892CB;
	Wed, 15 May 2019 18:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A96892CB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 18:05:05 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z19so684717qtz.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 11:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+hs5xg7kXU2SMsc3oKZIKfrfpdpw9b4KuC9hrmBGtlM=;
 b=Rr/M+V3fClZh7uZO3x4zey3c95ItoPKOZvBR8B6NiMSDpwt4XQlZOHQNxH0Vms3xu5
 fmb+lZMuKvvo4EUASK4pNbZqDQHh+4CEaJLNMlDYL984BDBJ96kGUEAutyx6fIpefLyr
 LNkqvjkQoKoTBQyEVjF5D3F3AXqwTVgMyxvtBFQXZlxejoy+iBMnsS2OOxXwrn9F4apV
 ugJqDZLt4ecR5PdNByvQ/0tez6rg1Oh8N0FmS6V6oh6qh0LtfFYKtsOr+dIRySDwl+vk
 dJsaTBBy/pV9AlNh7EwPxwwGcZq3m5qAyS2z32248BnG4aoerxLAHVLSP+/9A96+RIDY
 3H4Q==
X-Gm-Message-State: APjAAAVFxWUS+6EAQmHYsn4p7RAMtsKt3LcSMtfWwrCzGbHG7UiDPqrR
 AhD/lzM+2a6jNKiueaaVMlGZpg==
X-Google-Smtp-Source: APXvYqzgn4I8gLwP45HY/wQks6X1Aa55QBkdkNaroINqESPe3UjrHphkUh2LgwXrGMx2OH2J7r4FNQ==
X-Received: by 2002:a0c:98f8:: with SMTP id g53mr9717980qvd.142.1557943504648; 
 Wed, 15 May 2019 11:05:04 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id e25sm2116919qta.18.2019.05.15.11.05.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 11:05:03 -0700 (PDT)
Date: Wed, 15 May 2019 14:05:03 -0400
From: Sean Paul <sean@poorly.run>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Add hooks for suspend/resume
Message-ID: <20190515180503.GU17077@art_vandelay>
References: <20190502223808.185180-1-dianders@chromium.org>
 <20190515175826.GT17077@art_vandelay>
 <CAD=FV=X=ScK0H-ZNcOeEta2BL+f4TSAmXS=D585omXxbRVZcyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X=ScK0H-ZNcOeEta2BL+f4TSAmXS=D585omXxbRVZcyQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+hs5xg7kXU2SMsc3oKZIKfrfpdpw9b4KuC9hrmBGtlM=;
 b=bRruT73OXhXm9o91r54/0gUD2l5eMfxYgSCfb3qivODs0BuSErPmM54r4FE6OUIHW8
 phoQtIzqZKTxehM+SrYtgIc2LVo+Ka9E3elMPQ83jY/A2zsqdaOI7i2K2Um2+BKvjJlJ
 /EZBn3/xIylmGa7cJAmEEsLSSENXudtz5RSgcUnxiuCICBQiVJQWyBKJyReW/YfQPRRd
 ldKhjcu/NhuSvhW3nTBmwtaibC5MB20gENDW6FcMWs7Cc504KEbBMP331NEMzzmY7a1K
 ZaqRWwKPKHZQWWLdI8MXO+ue4ZZb2a8qg1XdocHN9iLhCOsGlisIQuglYSUNlelgGt7i
 oKFA==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTE6MDE6MjZBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMDo1OCBBTSBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4gd3JvdGU6Cj4gCj4gPiBPbiBUaHUsIE1heSAwMiwgMjAxOSBh
dCAwMzozODowN1BNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gPiBPbiBSb2Nr
Y2hpcCByazMyODgtYmFzZWQgQ2hyb21lYm9va3Mgd2hlbiB5b3UgZG8gYSBzdXNwZW5kL3Jlc3Vt
ZQo+ID4gPiBjeWNsZToKPiA+ID4KPiA+ID4gMS4gWW91IGxvc2UgdGhlIGFiaWxpdHkgdG8gZGV0
ZWN0IGFuIEhETUkgZGV2aWNlIGJlaW5nIHBsdWdnZWQgaW4uCj4gPiA+Cj4gPiA+IDIuIElmIHlv
dSdyZSB1c2luZyB0aGUgaTJjIGJ1cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMK
PiA+ID4gd29ya2luZy4KPiA+ID4KPiA+ID4gTGV0J3MgYWRkIGEgaG9vayB0byB0aGUgY29yZSBk
dy1oZG1pIGRyaXZlciBzbyB0aGF0IHdlIGNhbiBjYWxsIGl0IGluCj4gPiA+IGR3X2hkbWktcm9j
a2NoaXAgaW4gdGhlIG5leHQgY29tbWl0Lgo+ID4gPgo+ID4gPiBOT1RFOiB0aGUgZXhhY3Qgc2V0
IG9mIHN0ZXBzIEkndmUgZG9uZSBoZXJlIGluIHJlc3VtZSBjb21lIGZyb20KPiA+ID4gbG9va2lu
ZyBhdCB0aGUgbm9ybWFsIGR3X2hkbWkgaW5pdCBzZXF1ZW5jZSBpbiB1cHN0cmVhbSBMaW51eCBw
bHVzIHRoZQo+ID4gPiBzZXF1ZW5jZSB0aGF0IHdlIGRpZCBpbiBkb3duc3RyZWFtIENocm9tZSBP
UyAzLjE0LiAgVGVzdGluZyBzaG93IHRoYXQKPiA+ID4gaXQgc2VlbXMgdG8gd29yaywgYnV0IGlm
IGFuIGV4dHJhIHN0ZXAgaXMgbmVlZGVkIG9yIHNvbWV0aGluZyBoZXJlIGlzCj4gPiA+IG5vdCBu
ZWVkZWQgd2UgY291bGQgaW1wcm92ZSBpdC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gPiAtLS0KPiA+ID4KPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMjEgKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAg
ICAgICAgICB8ICAzICsrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4g
PiA+IGluZGV4IGRiNzYxMzI5YTFlMy4uNGIzOGJmZDQzZTU5IDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gPiBAQCAtMjc4MCw2ICsy
NzgwLDI3IEBAIHZvaWQgZHdfaGRtaV91bmJpbmQoc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4gPiA+
ICB9Cj4gPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChkd19oZG1pX3VuYmluZCk7Cj4gPiA+Cj4gPiA+
ICtpbnQgZHdfaGRtaV9zdXNwZW5kKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+ID4gPiArewo+ID4g
PiArICAgICByZXR1cm4gMDsKPiA+ID4gK30KPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGR3X2hk
bWlfc3VzcGVuZCk7Cj4gPiA+ICsKPiA+ID4gK2ludCBkd19oZG1pX3Jlc3VtZShzdHJ1Y3QgZHdf
aGRtaSAqaGRtaSkKPiA+ID4gK3sKPiA+ID4gKyAgICAgaW5pdGlhbGl6ZV9oZG1pX2loX211dGVz
KGhkbWkpOwo+ID4gPiArCj4gPiA+ICsgICAgIGR3X2hkbWlfc2V0dXBfaTJjKGhkbWkpOwo+ID4g
PiArICAgICBpZiAoaGRtaS0+aTJjKQo+ID4gPiArICAgICAgICAgICAgIGR3X2hkbWlfaTJjX2lu
aXQoaGRtaSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgaWYgKGhkbWktPnBoeS5vcHMtPnNldHVwX2hw
ZCkKPiA+ID4gKyAgICAgICAgICAgICBoZG1pLT5waHkub3BzLT5zZXR1cF9ocGQoaGRtaSwgaGRt
aS0+cGh5LmRhdGEpOwo+ID4gPiArCj4gPiA+ICsgICAgIHJldHVybiAwOwo+ID4gPiArfQo+ID4g
PiArRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9yZXN1bWUpOwo+ID4KPiA+IEJvdGggcGF0Y2hl
cyBsb29rIGdvb2QgdG8gbWUsIEknZCBwcm9iYWJseSBwcmVmZXIgdG8ganVzdCBzbWFzaCB0aGVt
IHRvZ2V0aGVyLAo+ID4gYnV0IG1laC4KPiA+Cj4gPiBJZiBubyBvbmUgbW9yZSBhdXRob3JpdGF0
aXZlIGNoaW1lcyBpbiwgSSdsbCBhcHBseSB0aGVtIHRvIC1taXNjIGluIGEgZmV3IGRheXMuCj4g
Cj4gU3VyZS4gIEkgY2FuIHNtYXNoIHRoZW0gYW5kIHJlLXBvc3Qgb3IgeW91IGNhbiBzbWFzaCB0
aGVtIGZvciBtZSBvciB3ZQo+IGNhbiBrZWVwIHRoZW0gYXMtaXMuICBJIG9yaWdpbmFsbHkgc2Vw
YXJhdGVkIGJlY2F1c2UgSSB3YXNuJ3Qgc3VyZSBpZgo+IHRoZXknZCBldmVudHVhbGx5IGdvIHRo
cm91Z2ggZGlmZmVyZW50IHRyZWVzLiAgSnVzdCBsZXQgbWUga25vdyEgIDotKQoKRGVmaW5pdGVs
eSBubyBuZWVkIHRvIHJlcG9zdC4gSXQncyBlbnRpcmVseSBwb3NzaWJsZSBBbmRyemVqIG9yIEhl
aWtvIHByZWZlciB0bwpoYXZlIHRoZSBkdy1oZG1pIHN0dWZmIGJyb2tlbiBvdXQgYW55d2F5cy4g
TXkgb3BpbmlvbiBpcyBvZiBsaXR0bGUgdmFsdWUgaGVyZSA6KQoKU2VhbgoKPiAKPiAtRG91ZwoK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
