Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D851806
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E01F89CC4;
	Mon, 24 Jun 2019 16:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D8B89CC4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:07:38 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r12so22574383edo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pWYsiKGg/zyVesxoNDfGpttEfT3N8EUCOmxzrH5E//Q=;
 b=JCCQCOevqSouv1chzm02tNldwfqfUa5bPq/d/Qfw7D+hDiQNZ29xbo8KfrMBF4P3z5
 C+BPW4v9VTH3BEgbSlIYdgqjeONTJiPhL1jU4Z5aR4BNAsLLCG5AW+iynOTV1fAvUmPN
 5sIobTcV/iQZ30prGHKk9VuLbHK28apR6xFu4YIo7edBpTeb5RbNhmIPl2q/l9DUW5Ud
 AMv0/ru2bY+iwPanHsti/8sSVcLVBW/lesUA/ZPTknWl5fUXt07DoMaX/Lz6iDJtAvCD
 LJR6xSwbpnjNSDoQ+YBuMPEyC9NeW6qtg1I6zrD0j8ph7XtPB9D1QW/XdN8sr9ve/3Ni
 hlzQ==
X-Gm-Message-State: APjAAAUO394a5x+Do3p6JQKG7ueLsAcUbttnrQBzV/DQLNnmjLDl1oy3
 +QEXLVwZSeNdUcmSYRAFn5f4CMnp/E4=
X-Google-Smtp-Source: APXvYqwEk64ddg3BhdilCRFENMNOMiVdTrDqisEPtHUa6MR1rDw0K+16O9sGnArhuYb6NBnLDBKdlQ==
X-Received: by 2002:a17:906:4555:: with SMTP id
 s21mr22531395ejq.199.1561392456050; 
 Mon, 24 Jun 2019 09:07:36 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id z12sm3839653edq.57.2019.06.24.09.07.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 09:07:35 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id u8so13958623wmm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:07:35 -0700 (PDT)
X-Received: by 2002:a7b:c051:: with SMTP id u17mr16105850wmc.25.1561392454870; 
 Mon, 24 Jun 2019 09:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <3f9e51d5-8ca5-a439-943c-26de92dd52fe@samsung.com>
 <CAGb2v67FF3k9wZu7K+Z5yKFFeh8A_4iuEXfh+tO65UvVRfY-sA@mail.gmail.com>
 <44611965.cJa5QBey4U@jernej-laptop>
In-Reply-To: <44611965.cJa5QBey4U@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Jun 2019 00:07:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v67T-nOqxkjekcc1ze9otVrzJb5KEtdJuMMk+dEGgAn1pQ@mail.gmail.com>
Message-ID: <CAGb2v67T-nOqxkjekcc1ze9otVrzJb5KEtdJuMMk+dEGgAn1pQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTI6MDMgQU0gSmVybmVqIMWga3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BzaW9sLm5ldD4gd3JvdGU6Cj4KPiBEbmUgcG9uZWRlbGplaywgMjQuIGp1bmlqIDIw
MTkgb2IgMTc6NTY6MzAgQ0VTVCBqZSBDaGVuLVl1IFRzYWkgbmFwaXNhbChhKToKPiA+IE9uIE1v
biwgSnVuIDI0LCAyMDE5IGF0IDExOjQ5IFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+IHdyb3RlOgo+ID4gPiBPbiAyNC4wNi4yMDE5IDE3OjA1LCBKZXJuZWogxaBrcmFiZWMg
d3JvdGU6Cj4gPiA+ID4gRG5lIHBvbmVkZWxqZWssIDI0LiBqdW5paiAyMDE5IG9iIDE3OjAzOjMx
IENFU1QgamUgQW5kcnplaiBIYWpkYQo+IG5hcGlzYWwoYSk6Cj4gPiA+ID4+IE9uIDI2LjA1LjIw
MTkgMjM6MjAsIEpvbmFzIEthcmxtYW4gd3JvdGU6Cj4gPiA+ID4+PiBUaGlzIHBhdGNoIGVuYWJs
ZXMgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBvbiBINi4KPiA+ID4gPj4+
Cj4gPiA+ID4+PiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
PiA+ID4gPj4+IENjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4g
PiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4g
PiA+ID4+PiAtLS0KPiA+ID4gPj4+Cj4gPiA+ID4+PiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjhpX2R3X2hkbWkuYyB8IDIgKysKPiA+ID4gPj4+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfZHdfaGRtaS5oIHwgMSArCj4gPiA+ID4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPiA+ID4gPj4+Cj4gPiA+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX2R3X2hkbWkuYwo+ID4gPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfZHdfaGRtaS5jIGluZGV4Cj4gPiA+ID4+PiAzOWQ4NTA5ZDk2YTAuLmI4MDE2NGRkOGFkOAo+
ID4gPiA+Pj4gMTAwNjQ0Cj4gPiA+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfZHdfaGRtaS5jCj4gPiA+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlf
ZHdfaGRtaS5jCj4gPiA+ID4+PiBAQCAtMTg5LDYgKzE4OSw3IEBAIHN0YXRpYyBpbnQgc3VuOGlf
ZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ID4gPj4+IHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciw+Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gICAgIHN1bjhpX2hkbWlfcGh5X2luaXQoaGRt
aS0+cGh5KTsKPiA+ID4gPj4+Cj4gPiA+ID4+PiAgICAgcGxhdF9kYXRhLT5tb2RlX3ZhbGlkID0g
aGRtaS0+cXVpcmtzLT5tb2RlX3ZhbGlkOwo+ID4gPiA+Pj4KPiA+ID4gPj4+ICsgICBwbGF0X2Rh
dGEtPmRybV9pbmZvZnJhbWUgPSBoZG1pLT5xdWlya3MtPmRybV9pbmZvZnJhbWU7Cj4gPiA+ID4+
Pgo+ID4gPiA+Pj4gICAgIHN1bjhpX2hkbWlfcGh5X3NldF9vcHMoaGRtaS0+cGh5LCBwbGF0X2Rh
dGEpOwo+ID4gPiA+Pj4KPiA+ID4gPj4+ICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBo
ZG1pKTsKPiA+ID4gPj4+Cj4gPiA+ID4+PiBAQCAtMjU1LDYgKzI1Niw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3VuOGlfZHdfaGRtaV9xdWlya3MKPiA+ID4gPj4+IHN1bjhpX2E4M3RfcXVpcmtz
ID0gez4KPiA+ID4gPj4+Cj4gPiA+ID4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW44aV9kd19o
ZG1pX3F1aXJrcyBzdW41MGlfaDZfcXVpcmtzID0gewo+ID4gPiA+Pj4KPiA+ID4gPj4+ICAgICAu
bW9kZV92YWxpZCA9IHN1bjhpX2R3X2hkbWlfbW9kZV92YWxpZF9oNiwKPiA+ID4gPj4+Cj4gPiA+
ID4+PiArICAgLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+ID4gPiA+Pj4KPiA+ID4gPj4+ICB9Owo+
ID4gPiA+Pj4KPiA+ID4gPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdW44
aV9kd19oZG1pX2R0X2lkc1tdID0gewo+ID4gPiA+Pj4KPiA+ID4gPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5oCj4gPiA+ID4+PiBiL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmggaW5kZXgKPiA+ID4gPj4+IDcyMGM1YWE4YWRj
MS4uMmEwZWMwOGVlMjM2Cj4gPiA+ID4+PiAxMDA2NDQKPiA+ID4gPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmgKPiA+ID4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmgKPiA+ID4gPj4+IEBAIC0xNzgsNiArMTc4LDcgQEAg
c3RydWN0IHN1bjhpX2R3X2hkbWlfcXVpcmtzIHsKPiA+ID4gPj4+Cj4gPiA+ID4+PiAgICAgZW51
bSBkcm1fbW9kZV9zdGF0dXMgKCptb2RlX3ZhbGlkKShzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+ID4g
PiA+Cj4gPiA+ID4gKmNvbm5lY3RvciwKPiA+ID4gPgo+ID4gPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0Cj4gPiA+ID4KPiA+ID4gPiBkcm1f
ZGlzcGxheV9tb2RlICptb2RlKTsKPiA+ID4gPgo+ID4gPiA+Pj4gICAgIHVuc2lnbmVkIGludCBz
ZXRfcmF0ZSA6IDE7Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gKyAgIHVuc2lnbmVkIGludCBkcm1faW5m
b2ZyYW1lIDogMTsKPiA+ID4gPj4KPiA+ID4gPj4gQWdhaW4sIGRybV9pbmZvZnJhbWUgc3VnZ2Vz
dHMgaXQgY29udGFpbnMgaW5mb3JmcmFtZSwgYnV0IGluIGZhY3QgaXQKPiA+ID4gPj4ganVzdCBp
bmZvcm1zIGluZm9mcmFtZSBjYW4gYmUgdXNlZCwgc28gYWdhaW4gbXkgc3VnZ2VzdGlvbgo+ID4g
PiA+PiB1c2VfZHJtX2luZm9mcmFtZS4KPiA+ID4gPj4KPiA+ID4gPj4gTW9yZW92ZXIgYm9vbCB0
eXBlIHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUgaGVyZS4KPiA+ID4gPgo+ID4gPiA+IGNoZWNrcGF0
Y2ggd2lsbCBnaXZlIHdhcm5pbmcgaWYgYm9vbCBpcyB1c2VkLgo+ID4gPgo+ID4gPiBUaGVuIEkg
d291bGQgc2F5ICJmaXgvaWdub3JlIGNoZWNrcGF0Y2giIDopCj4gPiA+Cj4gPiA+IEJ1dCBtYXli
ZSB0aGVyZSBpcyBhIHJlYXNvbi4KPiA+Cj4gPiBIZXJlJ3MgYW4gb2xkIG9uZSBmcm9tIExpbnVz
OiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxMy85LzEvMTU0Cj4gPgo+ID4gSSdkIHNheSB0aGF0
IGJvb2wgaW4gYSBzdHJ1Y3QgaXMgYSB3YXN0ZSBvZiBzcGFjZSBjb21wYXJlZCB0byBhIDEgYml0
Cj4gPiBiaXRmaWVsZCwgZXNwZWNpYWxseSB3aGVuIHRoZXJlIGFscmVhZHkgYXJlIG90aGVyIGJp
dGZpZWxkcyBpbiB0aGUgc2FtZQo+ID4gc3RydWN0Lgo+ID4gPiBBbnl3YXkgSSd2ZSB0ZXN0ZWQg
YW5kIEkgZG8gbm90IHNlZSB0aGUgd2FybmluZywgY291bGQgeW91IGVsYWJvcmF0ZSBpdC4KPiA+
Cj4gPiBNYXliZSBjaGVja3BhdGNoLnBsIC0tc3RyaWN0Pwo+Cj4gSXQgc2VlbXMgdGhleSByZW1v
dmVkIHRoYXQgY2hlY2s6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvPwo+IGlkPTc5Njc2NTZmZmJmYTQ5
M2Y1NTQ2YzBmMQo+Cj4gQWZ0ZXIgcmVhZGluZyB0aGF0IGJsb2NrIG9mIHRleHQsIEknbSBub3Qg
c3VyZSB3aGF0IHdvdWxkIGJlIHByZWZlcmVkIHdheSBmb3IKPiB0aGlzIGNhc2UuCgpUaGlzOgoK
K0lmIGEgc3RydWN0dXJlIGhhcyBtYW55IHRydWUvZmFsc2UgdmFsdWVzLCBjb25zaWRlciBjb25z
b2xpZGF0aW5nIHRoZW0gaW50byBhCitiaXRmaWVsZCB3aXRoIDEgYml0IG1lbWJlcnMsIG9yIHVz
aW5nIGFuIGFwcHJvcHJpYXRlIGZpeGVkIHdpZHRoIHR5cGUsIHN1Y2ggYXMKK3U4LgoKd291bGQg
c3VnZ2VzdCB1c2luZyBhIGJpdGZpZWxkLCBvciBmbGFncyB3aXRoaW4gYSBmaXhlZCB3aWR0aCB0
eXBlPwoKQ2hlbll1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
