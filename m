Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D503DA4FBC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112A889BF4;
	Mon,  2 Sep 2019 07:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657F7899D5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 02:07:24 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id z14so2643035vsz.13
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2019 19:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SteZi7Jc1Qj/ZWEovebsg0xMt+f3c5vmQftu053JsS8=;
 b=SQ1KwE/0T4Bv9mQkqKdXNUiK+0WeW2nD0GCeFH4S9ImpcPg7YHFBKfRcQOhvRkR7a+
 Z/MJby7D7uxpeKGjIWyRayKf6lWYRx9p/s21t1sbaKyPYt9xlBBeY251Hfzvm3+fhGzU
 3xYM7j5NG4uiu29dV1SX9TX/00dk8HYQhoagXdlWr381MfF4vYMzTsDe+/kjGPgczmcc
 +MjZ9xRRDyOXMpbCYt52UNw659zpxCTfRsXps796eIwIdJVvmj9Fuahmhc+KAQOrnuNB
 fSJ9QORGTCf0LakroMF2JDWYh5Rf7kFsrBb4KDxI5VHD9Oj/84YHHvS61Ty9S7OkcW+1
 SVZw==
X-Gm-Message-State: APjAAAXBgcXb8KR3PLhb69cMB/TnA59uaJ7U9E7lVsD/yPXUFp2arbBT
 /AcsljpyidPMCRNjOr8zWhg3AWaW3xvw6p2bkKvaxg==
X-Google-Smtp-Source: APXvYqygVljSvGbaEG8FKuJz0otOZOZdwZTpv0TbVOTes8YfHOyxR97RLOewIUCIM3Ih7DIGVB5YrjsGpPU2Agxjvyo=
X-Received: by 2002:a67:de08:: with SMTP id q8mr4571764vsk.119.1567390042918; 
 Sun, 01 Sep 2019 19:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190829042957.150929-1-cychiang@chromium.org>
 <HE1PR06MB4011FA45247F186BB83DFF04ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011FA45247F186BB83DFF04ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 2 Sep 2019 10:06:55 +0800
Message-ID: <CAFv8NwLq-cJqj0MB=rzKuqr3g0n3Y-nHor4w8ntiFXytoHpdLw@mail.gmail.com>
Subject: Re: [PATCH] drm: dw-hdmi-i2s: enable audio clock in audio_startup
To: Jonas Karlman <jonas@kwiboo.se>
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SteZi7Jc1Qj/ZWEovebsg0xMt+f3c5vmQftu053JsS8=;
 b=lPR+RAf4lLbHFKrG7BKbpxKO2o5PIV6QPEk5yeLJsGuOupELQ4EX6PQ2n7tlyefFjX
 5TueBZwuZlQptLjVpdiWoRTQzixxBywwaHL2Q/9NxpVlWZua4yL5HvNYQaptM2F6I5gj
 urBmtznxWX5SXt9UN7RdKLsmNWsgswpCy+GTA=
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
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMSwgMjAxOSBhdCA2OjA0IFBNIEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJv
by5zZT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA4LTI5IDA2OjI5LCBDaGVuZy1ZaSBDaGlhbmcgd3Jv
dGU6Cj4gPiBJbiB0aGUgZGVzaWdud2FyZSBkYXRhYm9vaywgdGhlIHNlcXVlbmNlIG9mIGVuYWJs
aW5nIGF1ZGlvIGNsb2NrIGFuZAo+ID4gc2V0dGluZyBmb3JtYXQgaXMgbm90IGNsZWFybHkgc3Bl
Y2lmaWVkLgo+ID4gQ3VycmVudGx5LCBhdWRpbyBjbG9jayBpcyBlbmFibGVkIGluIHRoZSBlbmQg
b2YgaHdfcGFyYW0gb3BzIGFmdGVyCj4gPiBzZXR0aW5nIGZvcm1hdC4KPiA+Cj4gPiBPbiBzb21l
IG1vbml0b3JzLCB0aGVyZSBpcyBhIHBvc3NpYmlsaXR5IHRoYXQgYXVkaW8gZG9lcyBub3QgY29t
ZSBvdXQuCj4gPiBGaXggdGhpcyBieSBlbmFibGluZyBhdWRpbyBjbG9jayBpbiBhdWRpb19zdGFy
dHVwIG9wcwo+ID4gYmVmb3JlIGh3X3BhcmFtIG9wcyBzZXR0aW5nIGZvcm1hdC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVk
aW8uYyB8IDkgKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWktaTJzLWF1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkt
aTJzLWF1ZGlvLmMKPiA+IGluZGV4IDVjYmI3MWE4NjZkNS4uMDhiNGFkYmIxZGRjIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRp
by5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJz
LWF1ZGlvLmMKPiA+IEBAIC02OSw2ICs2OSwxNCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2h3
X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiAgICAgICBoZG1pX3dy
aXRlKGF1ZGlvLCBjb25mMCwgSERNSV9BVURfQ09ORjApOwo+ID4gICAgICAgaGRtaV93cml0ZShh
dWRpbywgY29uZjEsIEhETUlfQVVEX0NPTkYxKTsKPiA+Cj4gPiArICAgICByZXR1cm4gMDsKPiA+
ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBkd19oZG1pX2kyc19hdWRpb19zdGFydHVwKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZHdfaGRt
aV9pMnNfYXVkaW9fZGF0YSAqYXVkaW8gPSBkYXRhOwo+ID4gKyAgICAgc3RydWN0IGR3X2hkbWkg
KmhkbWkgPSBhdWRpby0+aGRtaTsKPiA+ICsKPiA+ICAgICAgIGR3X2hkbWlfYXVkaW9fZW5hYmxl
KGhkbWkpOwo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4gQEAgLTEwNSw2ICsxMTMsNyBAQCBz
dGF0aWMgaW50IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50
ICpjb21wb25lbnQsCj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgc3RydWN0IGhkbWlfY29kZWNfb3Bz
IGR3X2hkbWlfaTJzX29wcyA9IHsKPiA+ICsgICAgIC5hdWRpb19zdGFydHVwID0gZHdfaGRtaV9p
MnNfYXVkaW9fc3RhcnR1cCwKPgo+IEEgc21hbGwgd2hpdGUgc3BhY2Ugbml0LCB0aGVyZSBzaG91
bGQgYmUgYSB0YWIgYW5kIG5vdCBzcGFjZSB0byBhbGlnbiB0aGUgZXF1YWwgc2lnbiBhYm92ZS4K
CkFDSy4gV2lsbCBmaXggaW4gdjIuCj4KPiBBbHNvIHRoaXMgcGF0Y2ggZG8gbm90IGNsZWFubHkg
YXBwbHkgdG8gZHJtLW1pc2MtbmV4dCBvciBsaW51eC1uZXh0IGFmdGVyCj4gZmMxY2E2ZTAxZDBh
ICJkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogYWRkIC5nZXRfZWxkIHN1cHBvcnQiIHdhcyBtZXJn
ZWQuCgpBQ0suIFdpbGwgcmViYXNlIGluIHYyLgo+Cj4KPgo+Cj4gVGhpcyBwYXRjaCBkb2VzIGZp
eCBhbiBpc3N1ZSBJIGhhdmUgb2JzZXJ2ZWQgb24gbXkgUm9ja2NoaXAgZGV2aWNlcyB3aGVyZSBh
dWRpbyB3b3VsZCBub3QgYWx3YXlzCj4gY2FtZSBvdXQgYWZ0ZXIgc3dpdGNoaW5nIGJldHdlZW4g
YXVkaW8gc3RyZWFtcyBoYXZpbmcgZGlmZmVyZW50IHJhdGUgYW5kIGNoYW5uZWxzIHBhcmFtZXRl
cnMuCj4gSSB1c2VkIHRvIGNhcnJ5IFsxXSB0byBmaXggdGhhdCBpc3N1ZSwgYnV0IHRoaXMgc2Vl
bXMgbGlrZSBhIG1vcmUgc2FuZSBmaXguCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL0t3aWJv
by9saW51eC1yb2NrY2hpcC9jb21taXQvNDg2MmU0MDQ0NTMyYjhiNDgwZmEzYTBmYWRkYzE5NzU4
NjYyMzgwOAo+Cj4gV2l0aCBhYm92ZSBmaXhlZCwKPgo+IFJldmlld2VkLWJ5OiBKb25hcyBLYXJs
bWFuIDxqb25hc0Brd2lib28uc2U+CgoKVGhhbmtzIGEgbG90IQoKPgo+Cj4gUmVnYXJkcywKPiBK
b25hcwo+Cj4gPiAgICAgICAuaHdfcGFyYW1zICAgICAgPSBkd19oZG1pX2kyc19od19wYXJhbXMs
Cj4gPiAgICAgICAuYXVkaW9fc2h1dGRvd24gPSBkd19oZG1pX2kyc19hdWRpb19zaHV0ZG93biwK
PiA+ICAgICAgIC5nZXRfZGFpX2lkICAgICA9IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQsCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
