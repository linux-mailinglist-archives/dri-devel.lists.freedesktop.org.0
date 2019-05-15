Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502991F9AD
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 20:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC018929B;
	Wed, 15 May 2019 18:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F2A8929B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 18:01:42 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id a95so184624uaa.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 11:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOlh4dTx7Vxhh5KS401+ytTuib/HBS2y3FGyL2kxQBo=;
 b=lFyM8l3livVMxDaJ+YJm5S4Bfw7o19ul+nhnOsmK6xenfvcyiw/ztLrNPi4hHTYfOk
 ubrqFVUcuXL4mCrr6r4gvwLuUUNstizREPRDSrUcsWkHDXrgLaQUDx4JVUhF5LbHGiiU
 t3DzVqQOvi0KmIwyCn5KDFastzlrj36K3dkyf1HrBD6apEF4lKQdJPRPO81D3SV7ALn4
 ICErsgDI8sIA9xW/RhxxfqsrrBaoQaxldDIL/jK9QaOZI2acVtXs9O0yo1fxtZpk0uQI
 h6lmeX0Ak9NPUZmnrbIbfHuT5a7jDD4cigO81N0vy6xxISaCZGLRIkE2s89UOciN3hDX
 ULMA==
X-Gm-Message-State: APjAAAUTiYdODexOgi3u64EqkQJD3Gl8SXf7qMZZOVEjitFM2k8GbmeH
 C2ZAfL/eJfcHNQxYDleWKWsO0iIGAIc=
X-Google-Smtp-Source: APXvYqzcusYWOS5tYT2iRbuIqR3/vq1VBLBkFKMYd8I57IcaW3YHlDzef2p0ZpapunNGd+isCoQzGg==
X-Received: by 2002:ab0:23cb:: with SMTP id c11mr20353064uan.140.1557943301084; 
 Wed, 15 May 2019 11:01:41 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id j78sm872573vkj.47.2019.05.15.11.01.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 11:01:39 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id q64so540358vsd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 11:01:38 -0700 (PDT)
X-Received: by 2002:a67:f60b:: with SMTP id k11mr14004140vso.111.1557943298290; 
 Wed, 15 May 2019 11:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190502223808.185180-1-dianders@chromium.org>
 <20190515175826.GT17077@art_vandelay>
In-Reply-To: <20190515175826.GT17077@art_vandelay>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 May 2019 11:01:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=ScK0H-ZNcOeEta2BL+f4TSAmXS=D585omXxbRVZcyQ@mail.gmail.com>
Message-ID: <CAD=FV=X=ScK0H-ZNcOeEta2BL+f4TSAmXS=D585omXxbRVZcyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Add hooks for suspend/resume
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GOlh4dTx7Vxhh5KS401+ytTuib/HBS2y3FGyL2kxQBo=;
 b=nAu9PbC6WUHU/fSI4IYsoxpnM/EQB4isVALdhOLUwqXWeRYNm+Ao3nLr92q9A+3UlN
 6iZPhlFXWl24Wsk78ch56s1us49NagE5IYyR/a0VhbVwp+b6KvWJgyRB2aP+NFC0D+rA
 tpZXjs0CFoouD5hfxeRvD6orP7xjpL43qbcqI=
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
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMDo1OCBBTSBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4gd3JvdGU6Cgo+IE9uIFRodSwgTWF5IDAyLCAyMDE5IGF0IDAzOjM4OjA3UE0gLTA3
MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBPbiBSb2NrY2hpcCByazMyODgtYmFzZWQg
Q2hyb21lYm9va3Mgd2hlbiB5b3UgZG8gYSBzdXNwZW5kL3Jlc3VtZQo+ID4gY3ljbGU6Cj4gPgo+
ID4gMS4gWW91IGxvc2UgdGhlIGFiaWxpdHkgdG8gZGV0ZWN0IGFuIEhETUkgZGV2aWNlIGJlaW5n
IHBsdWdnZWQgaW4uCj4gPgo+ID4gMi4gSWYgeW91J3JlIHVzaW5nIHRoZSBpMmMgYnVzIGJ1aWx0
IGluIHRvIGR3X2hkbWkgdGhlbiBpdCBzdG9wcwo+ID4gd29ya2luZy4KPiA+Cj4gPiBMZXQncyBh
ZGQgYSBob29rIHRvIHRoZSBjb3JlIGR3LWhkbWkgZHJpdmVyIHNvIHRoYXQgd2UgY2FuIGNhbGwg
aXQgaW4KPiA+IGR3X2hkbWktcm9ja2NoaXAgaW4gdGhlIG5leHQgY29tbWl0Lgo+ID4KPiA+IE5P
VEU6IHRoZSBleGFjdCBzZXQgb2Ygc3RlcHMgSSd2ZSBkb25lIGhlcmUgaW4gcmVzdW1lIGNvbWUg
ZnJvbQo+ID4gbG9va2luZyBhdCB0aGUgbm9ybWFsIGR3X2hkbWkgaW5pdCBzZXF1ZW5jZSBpbiB1
cHN0cmVhbSBMaW51eCBwbHVzIHRoZQo+ID4gc2VxdWVuY2UgdGhhdCB3ZSBkaWQgaW4gZG93bnN0
cmVhbSBDaHJvbWUgT1MgMy4xNC4gIFRlc3Rpbmcgc2hvdyB0aGF0Cj4gPiBpdCBzZWVtcyB0byB3
b3JrLCBidXQgaWYgYW4gZXh0cmEgc3RlcCBpcyBuZWVkZWQgb3Igc29tZXRoaW5nIGhlcmUgaXMK
PiA+IG5vdCBuZWVkZWQgd2UgY291bGQgaW1wcm92ZSBpdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+Cj4g
PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAyMSArKysrKysr
KysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAg
ICAgICB8ICAzICsrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gPiBpbmRleCBk
Yjc2MTMyOWExZTMuLjRiMzhiZmQ0M2U1OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gQEAgLTI3ODAsNiArMjc4MCwyNyBAQCB2b2lkIGR3
X2hkbWlfdW5iaW5kKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+ID4gIH0KPiA+ICBFWFBPUlRfU1lN
Qk9MX0dQTChkd19oZG1pX3VuYmluZCk7Cj4gPgo+ID4gK2ludCBkd19oZG1pX3N1c3BlbmQoc3Ry
dWN0IGR3X2hkbWkgKmhkbWkpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4g
K0VYUE9SVF9TWU1CT0xfR1BMKGR3X2hkbWlfc3VzcGVuZCk7Cj4gPiArCj4gPiAraW50IGR3X2hk
bWlfcmVzdW1lKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+ID4gK3sKPiA+ICsgICAgIGluaXRpYWxp
emVfaGRtaV9paF9tdXRlcyhoZG1pKTsKPiA+ICsKPiA+ICsgICAgIGR3X2hkbWlfc2V0dXBfaTJj
KGhkbWkpOwo+ID4gKyAgICAgaWYgKGhkbWktPmkyYykKPiA+ICsgICAgICAgICAgICAgZHdfaGRt
aV9pMmNfaW5pdChoZG1pKTsKPiA+ICsKPiA+ICsgICAgIGlmIChoZG1pLT5waHkub3BzLT5zZXR1
cF9ocGQpCj4gPiArICAgICAgICAgICAgIGhkbWktPnBoeS5vcHMtPnNldHVwX2hwZChoZG1pLCBo
ZG1pLT5waHkuZGF0YSk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArRVhQ
T1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9yZXN1bWUpOwo+Cj4gQm90aCBwYXRjaGVzIGxvb2sgZ29v
ZCB0byBtZSwgSSdkIHByb2JhYmx5IHByZWZlciB0byBqdXN0IHNtYXNoIHRoZW0gdG9nZXRoZXIs
Cj4gYnV0IG1laC4KPgo+IElmIG5vIG9uZSBtb3JlIGF1dGhvcml0YXRpdmUgY2hpbWVzIGluLCBJ
J2xsIGFwcGx5IHRoZW0gdG8gLW1pc2MgaW4gYSBmZXcgZGF5cy4KClN1cmUuICBJIGNhbiBzbWFz
aCB0aGVtIGFuZCByZS1wb3N0IG9yIHlvdSBjYW4gc21hc2ggdGhlbSBmb3IgbWUgb3Igd2UKY2Fu
IGtlZXAgdGhlbSBhcy1pcy4gIEkgb3JpZ2luYWxseSBzZXBhcmF0ZWQgYmVjYXVzZSBJIHdhc24n
dCBzdXJlIGlmCnRoZXknZCBldmVudHVhbGx5IGdvIHRocm91Z2ggZGlmZmVyZW50IHRyZWVzLiAg
SnVzdCBsZXQgbWUga25vdyEgIDotKQoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
