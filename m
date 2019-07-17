Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFC6BD9C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EC76E02B;
	Wed, 17 Jul 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1685F6E288
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 08:14:03 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id y16so15837805vsc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mOxb5tg5seSjtQqIorgKM+Di7ixuS6uqfAgdFu5RpzA=;
 b=Ael/V3knkqvVohENPXjjTNwV6mP4osK42MQhigSGiv5Bw8emekVXopbsJrx0CDe/L3
 F2u2M5y0tKt5/E99EXMU0bL0ysWiqv1O4JTgbzvZ5TKq9yBdo6UMeJdZe2diDhTJ//3p
 L0dH+kPttKBHDD3pBX1Tu9jCKnybpAVRGxMfpYtW+UoOsc664brX/wR7S4w/w4vjCr8J
 TPpAvWRC1kmfHx30lD3W3Exy0yVNRnm6CWazYdXSbx3Th9eJekSCI9MKHWZ33CT8mlDM
 TgroMKsuBFSkY2fU5RdkKfr5Kr6tFKpcJgSj/wxj/4XoFVWoJm1IjgWgSMVV7SPl/9z6
 udXQ==
X-Gm-Message-State: APjAAAUvzrCJ12GeA1+9lGRuaHigZ4P+F/lGUBepjv5J8nHKvlvA7ACZ
 5EIyooImxKDeQhXPNY5TMuZOeEP39nXxmkBgRzZf4g==
X-Google-Smtp-Source: APXvYqwumLX15i5KhdhsUxIfW0Chce/ceicYE3QuO3Xntx39jQED40S5LxMsWwDhbGTmvCiWV49cMhif6dAhO+pZRnI=
X-Received: by 2002:a67:eb12:: with SMTP id a18mr1522512vso.119.1563351241789; 
 Wed, 17 Jul 2019 01:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-6-cychiang@chromium.org>
 <CA+Px+wXK9gJKZwzsG8BXh1gmoEyscxtMzB_VCrHz-nenBEL9AQ@mail.gmail.com>
In-Reply-To: <CA+Px+wXK9gJKZwzsG8BXh1gmoEyscxtMzB_VCrHz-nenBEL9AQ@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 17 Jul 2019 16:13:35 +0800
Message-ID: <CAFv8NwKJ4SEbN34EyS7wA33z9+bCCM2mzQRUBfDLr9Vg5CP9jQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] ASoC: rockchip_max98090: Add HDMI jack support
To: Tzung-Bi Shih <tzungbi@google.com>
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mOxb5tg5seSjtQqIorgKM+Di7ixuS6uqfAgdFu5RpzA=;
 b=G9skQ3aRbgwXpozrH+1DO97KndwvPNLHeERqMmQDZWWaONNCADEoaOMvPkA0sFj53o
 phoK8JUmNVcvN1zKr+0kawyF+mSilxU7i4gtAoMto3xyO9TQG5uMPuI/UfH3wukUoDOc
 j6XhR7QyCsO7y931Q57UTyK2rbsj1P5my0hS0=
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTA6MTYgUE0gVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDc6NTggUE0gQ2hl
bmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAuYyBiL3NvdW5kL3Nv
Yy9yb2NrY2hpcC9yb2NrY2hpcF9tYXg5ODA5MC5jCj4gPiBpbmRleCBjODI5NDhlMzgzZGEuLmM4
MWM0YWNkYTkxNyAxMDA2NDQKPiA+IC0tLSBhL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9t
YXg5ODA5MC5jCj4gPiArKysgYi9zb3VuZC9zb2Mvcm9ja2NoaXAvcm9ja2NoaXBfbWF4OTgwOTAu
Ywo+ID4gK3N0YXRpYyBzdHJ1Y3Qgc25kX3NvY19qYWNrIHJrX2hkbWlfamFjazsKPiA+ICsKPiA+
ICtzdGF0aWMgaW50IHJrX2hkbWlfaW5pdChzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnVu
dGltZSkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQgPSBydW50
aW1lLT5jYXJkOwo+ID4gKyAgICAgICBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVu
dCA9IHJ1bnRpbWUtPmNvZGVjX2RhaS0+Y29tcG9uZW50Owo+ID4gKyAgICAgICBpbnQgcmV0Owo+
ID4gKwo+ID4gKyAgICAgICAvKiBlbmFibGUgamFjayBkZXRlY3Rpb24gKi8KPiA+ICsgICAgICAg
cmV0ID0gc25kX3NvY19jYXJkX2phY2tfbmV3KGNhcmQsICJIRE1JIEphY2siLCBTTkRfSkFDS19M
SU5FT1VULAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJrX2hkbWlf
amFjaywgTlVMTCwgMCk7Cj4gPiArICAgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAg
ICBkZXZfZXJyKGNhcmQtPmRldiwgIkNhbid0IG5ldyBIRE1JIEphY2sgJWRcbiIsIHJldCk7Cj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAg
ICAgICByZXR1cm4gaGRtaV9jb2RlY19zZXRfamFja19kZXRlY3QoY29tcG9uZW50LCAmcmtfaGRt
aV9qYWNrKTsKPiA+ICt9Cj4gSW4gdGhlIHBhdGNoLCB5b3Ugc2hvdWxkIHNlbGVjdCBTTkRfU09D
X0hETUlfQ09ERUMsIGJlY2F1c2UgdGhlIHBhdGNoCj4gdXNlcyBoZG1pX2NvZGVjX3NldF9qYWNr
X2RldGVjdCB3aGljaCBkZXBlbmRzIG9uIGhkbWktY29kZWMuYy4KVGhhbmtzISBJJ2xsIGZpeCBp
biB2NS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
