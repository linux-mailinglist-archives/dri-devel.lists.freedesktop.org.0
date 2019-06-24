Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30BA517C7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AAD89CB2;
	Mon, 24 Jun 2019 15:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8CE89CB2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:56:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k21so22524909edq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mMUgs4HoLKDmtg/T/uzM5Qeyyd0kP1F7cWc1uMkgeRs=;
 b=mXyOp1uEJf8vQqFCSsv4e1+1jOYuoxvHr4QkaGEwKItMEAxB7KU/CTqqJQNNtJIlnr
 OYMfTMVhV6NHkJnTYdIS2lOalXhH3PJQ6eJpC1kSHECLtQYk3ecZ3N3VJh/U9hPi8V9e
 ejil7BPKt3Lk3idxDELOwdxobXevLiuqhzhn9eoMB7wzkDvRmv6E//4G0W3ce6vhTivm
 W0Pq12f1gKRO2tEFx4Jbo6uXF/Pu2c14NgKb12D1vLAXCqYv2Lyx4TyDR1ZTAbkzONCc
 Fml0Oxmf9jblQUhnwomj+tomgwT6A4lEhpNPQju42/vlrj4uxG+ReEJVpfDTGoG/l8Xf
 x7CA==
X-Gm-Message-State: APjAAAXkKkqsMi7sLDC9h1L1zHxxcUCrfCwRpnK8XGsy6WRVJJ4OT0LJ
 E2jVfqlN5d176YmWoQkRd4YriDR2BuQ=
X-Google-Smtp-Source: APXvYqxgj+XY/24nGS3pAJvRV2bKdD6TgP4608lgR+f+3h62FxhqJdm2F4JumOWbLhR+Zjt+hv4tdw==
X-Received: by 2002:a17:906:4a0d:: with SMTP id
 w13mr75038199eju.103.1561391803605; 
 Mon, 24 Jun 2019 08:56:43 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id f24sm3942721edf.30.2019.06.24.08.56.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 08:56:42 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id x15so13305873wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:56:42 -0700 (PDT)
X-Received: by 2002:a1c:f512:: with SMTP id t18mr16201190wmh.47.1561391801973; 
 Mon, 24 Jun 2019 08:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <VI1PR03MB4206740285A775280063E303AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <baf95e6b-bfcf-27e7-1a00-ca877ae6f82d@samsung.com>
 <CGME20190624150546epcas1p1da19043e13dd3604a546f7983fc089b9@epcas1p1.samsung.com>
 <6819050.kFKQ8T6p8H@jernej-laptop>
 <3f9e51d5-8ca5-a439-943c-26de92dd52fe@samsung.com>
In-Reply-To: <3f9e51d5-8ca5-a439-943c-26de92dd52fe@samsung.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 24 Jun 2019 23:56:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v67FF3k9wZu7K+Z5yKFFeh8A_4iuEXfh+tO65UvVRfY-sA@mail.gmail.com>
Message-ID: <CAGb2v67FF3k9wZu7K+Z5yKFFeh8A_4iuEXfh+tO65UvVRfY-sA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NDkgUE0gQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBz
YW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBPbiAyNC4wNi4yMDE5IDE3OjA1LCBKZXJuZWogxaBrcmFi
ZWMgd3JvdGU6Cj4gPiBEbmUgcG9uZWRlbGplaywgMjQuIGp1bmlqIDIwMTkgb2IgMTc6MDM6MzEg
Q0VTVCBqZSBBbmRyemVqIEhhamRhIG5hcGlzYWwoYSk6Cj4gPj4gT24gMjYuMDUuMjAxOSAyMzoy
MCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiA+Pj4gVGhpcyBwYXRjaCBlbmFibGVzIER5bmFtaWMg
UmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUgb24gSDYuCj4gPj4+Cj4gPj4+IENjOiBNYXhp
bWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+ID4+PiBDYzogSmVybmVqIFNr
cmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKb25h
cyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4gPj4+IC0tLQo+ID4+Pgo+ID4+PiAgZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYyB8IDIgKysKPiA+Pj4gIGRyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmggfCAxICsKPiA+Pj4gIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4gPj4+IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhp
X2R3X2hkbWkuYyBpbmRleCAzOWQ4NTA5ZDk2YTAuLmI4MDE2NGRkOGFkOAo+ID4+PiAxMDA2NDQK
PiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+ID4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4gPj4+IEBAIC0xODks
NiArMTg5LDcgQEAgc3RhdGljIGludCBzdW44aV9kd19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAq
ZGV2LAo+ID4+PiBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsPgo+ID4+PiAgICAgc3VuOGlfaGRtaV9w
aHlfaW5pdChoZG1pLT5waHkpOwo+ID4+Pgo+ID4+PiAgICAgcGxhdF9kYXRhLT5tb2RlX3ZhbGlk
ID0gaGRtaS0+cXVpcmtzLT5tb2RlX3ZhbGlkOwo+ID4+Pgo+ID4+PiArICAgcGxhdF9kYXRhLT5k
cm1faW5mb2ZyYW1lID0gaGRtaS0+cXVpcmtzLT5kcm1faW5mb2ZyYW1lOwo+ID4+Pgo+ID4+PiAg
ICAgc3VuOGlfaGRtaV9waHlfc2V0X29wcyhoZG1pLT5waHksIHBsYXRfZGF0YSk7Cj4gPj4+Cj4g
Pj4+ICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBoZG1pKTsKPiA+Pj4KPiA+Pj4gQEAg
LTI1NSw2ICsyNTYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjhpX2R3X2hkbWlfcXVpcmtz
Cj4gPj4+IHN1bjhpX2E4M3RfcXVpcmtzID0gez4KPiA+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3VuOGlfZHdfaGRtaV9xdWlya3Mgc3VuNTBpX2g2X3F1aXJrcyA9IHsKPiA+Pj4KPiA+Pj4gICAg
IC5tb2RlX3ZhbGlkID0gc3VuOGlfZHdfaGRtaV9tb2RlX3ZhbGlkX2g2LAo+ID4+Pgo+ID4+PiAr
ICAgLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+ID4+Pgo+ID4+PiAgfTsKPiA+Pj4KPiA+Pj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN1bjhpX2R3X2hkbWlfZHRfaWRzW10gPSB7
Cj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdf
aGRtaS5oCj4gPj4+IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCBpbmRl
eCA3MjBjNWFhOGFkYzEuLjJhMGVjMDhlZTIzNgo+ID4+PiAxMDA2NDQKPiA+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+ID4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5oCj4gPj4+IEBAIC0xNzgsNiArMTc4LDcgQEAgc3Ry
dWN0IHN1bjhpX2R3X2hkbWlfcXVpcmtzIHsKPiA+Pj4KPiA+Pj4gICAgIGVudW0gZHJtX21vZGVf
c3RhdHVzICgqbW9kZV92YWxpZCkoc3RydWN0IGRybV9jb25uZWN0b3IKPiA+ICpjb25uZWN0b3Is
Cj4gPj4+Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IHN0cnVjdAo+ID4gZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4gPj4+Cj4gPj4+ICAgICB1bnNp
Z25lZCBpbnQgc2V0X3JhdGUgOiAxOwo+ID4+Pgo+ID4+PiArICAgdW5zaWduZWQgaW50IGRybV9p
bmZvZnJhbWUgOiAxOwo+ID4+IEFnYWluLCBkcm1faW5mb2ZyYW1lIHN1Z2dlc3RzIGl0IGNvbnRh
aW5zIGluZm9yZnJhbWUsIGJ1dCBpbiBmYWN0IGl0Cj4gPj4ganVzdCBpbmZvcm1zIGluZm9mcmFt
ZSBjYW4gYmUgdXNlZCwgc28gYWdhaW4gbXkgc3VnZ2VzdGlvbgo+ID4+IHVzZV9kcm1faW5mb2Zy
YW1lLgo+ID4+Cj4gPj4gTW9yZW92ZXIgYm9vbCB0eXBlIHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUg
aGVyZS4KPiA+IGNoZWNrcGF0Y2ggd2lsbCBnaXZlIHdhcm5pbmcgaWYgYm9vbCBpcyB1c2VkLgo+
Cj4KPiBUaGVuIEkgd291bGQgc2F5ICJmaXgvaWdub3JlIGNoZWNrcGF0Y2giIDopCj4KPiBCdXQg
bWF5YmUgdGhlcmUgaXMgYSByZWFzb24uCgpIZXJlJ3MgYW4gb2xkIG9uZSBmcm9tIExpbnVzOiBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxMy85LzEvMTU0CgpJJ2Qgc2F5IHRoYXQgYm9vbCBpbiBh
IHN0cnVjdCBpcyBhIHdhc3RlIG9mIHNwYWNlIGNvbXBhcmVkIHRvIGEgMSBiaXQgYml0ZmllbGQs
CmVzcGVjaWFsbHkgd2hlbiB0aGVyZSBhbHJlYWR5IGFyZSBvdGhlciBiaXRmaWVsZHMgaW4gdGhl
IHNhbWUgc3RydWN0LgoKPiBBbnl3YXkgSSd2ZSB0ZXN0ZWQgYW5kIEkgZG8gbm90IHNlZSB0aGUg
d2FybmluZywgY291bGQgeW91IGVsYWJvcmF0ZSBpdC4KCk1heWJlIGNoZWNrcGF0Y2gucGwgLS1z
dHJpY3Q/CgpDaGVuWXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
