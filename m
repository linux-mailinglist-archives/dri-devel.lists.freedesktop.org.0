Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CDA642B5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B81089C17;
	Wed, 10 Jul 2019 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EDD89A56
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 04:12:17 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id h28so589631vsl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 21:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsT84thXZgrjljKWPHUjY7JeFgImc9+U4hEoxyiTJcc=;
 b=eb/8y8T13HlCjXcVuyLseps0XTIbcMRA+bcp0eTjKGi2ml+p9q6UBjxnjbo1eWodjt
 wRTm02rk3yEEhCUS+QxkYVp/ptoXQkP0yWVkqXPhlUWyS+WzApdQJXxcyN4c9KS5XFPn
 aOWUUKS9KnhiAWZdNHrpY/Cu+qVDtu5DpOuH8jXpiZcPHdtd0geOZiTye+pbU2gpJ9DR
 MVfUmc2+QgvYbFMJusPpW9BkJ+KoSamrMyVM3zOzMteoysiMBY8f4WyKrbHyHLchdkbm
 zA+u1rDiqGcQbQjK455rDyUUooloJoo/EcKhifGcrMr1wq5bFiWKGf+FvlBsHtFyt8PL
 ElUA==
X-Gm-Message-State: APjAAAWaI32hsr3gi8YD0O06QkyoFOCuurn56kq2wCaXvw+KqVgKnxRN
 coNhbm5pdpBLfjWQu3tGEsm09nuB/D6XQpmu3POxgQ==
X-Google-Smtp-Source: APXvYqwRDoiekjMfVg1dAkd95CbZGZ3jhAzyHEQ1N/LeXKKIJksHQNLAm0BnKpQtXYeH+ZnDwbVN+JmCCFjQkCNhqMc=
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr14190782vsp.163.1562731935844; 
 Tue, 09 Jul 2019 21:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190603043251.226549-1-cychiang@chromium.org>
 <20190603043251.226549-6-cychiang@chromium.org> <20190709200121.GA19118@bogus>
In-Reply-To: <20190709200121.GA19118@bogus>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 10 Jul 2019 12:11:48 +0800
Message-ID: <CAFv8NwLiKu055S7apzj+gTYh0neQ5rLmPYEYkEj6Zf3hikWWpA@mail.gmail.com>
Subject: Re: [PATCH 5/7] ASoC: rockchip: rockchip-max98090: Add node for HDMI
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jsT84thXZgrjljKWPHUjY7JeFgImc9+U4hEoxyiTJcc=;
 b=bWsVGu9ZtrSBJl4JbELamsoGGvbUEuoJyLkzEdD/lBLkOe2SuDywqNJvjhLcdkFQIV
 uQzhsHZfClHSSErFS8YngoK5icUK/zOzfk2MyJE77f/EpBtLGiDl5OLXwZaYMg1H4xvi
 8bZw2KyzNEgXQhxeZxd3j43hSpSd9KAK3Vxwk=
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
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgNDowMSBBTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDEyOjMyOjQ5UE0gKzA4MDAs
IENoZW5nLVlpIENoaWFuZyB3cm90ZToKPiA+IExldCB1c2VyIHNwZWNpZnkgSERNSSBub2RlIHNv
IG1hY2hpbmUgZHJpdmVyIGNhbiB1c2UgaXQgdG8gbGV0IGNvZGVjCj4gPiBkcml2ZXIgcmVnaXN0
ZXIgY2FsbGJhY2sgb24gY29ycmVjdCBoZG1pLW5vdGlmaWVyLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkw
LnR4dCB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2Nr
Y2hpcC1tYXg5ODA5MC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvcm9ja2NoaXAtbWF4OTgwOTAudHh0Cj4gPiBpbmRleCBhODA1YWE5OWFkNzUuLmRhZTU3YzE0
ODY0ZSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9yb2NrY2hpcC1tYXg5ODA5MC50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9yb2NrY2hpcC1tYXg5ODA5MC50eHQKPiA+IEBAIC03LDYgKzcs
NyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gICAgY29ubmVjdGVkIHRvIHRoZSBDT0RFQwo+
ID4gIC0gcm9ja2NoaXAsYXVkaW8tY29kZWM6IFRoZSBwaGFuZGxlIG9mIHRoZSBNQVg5ODA5MCBh
dWRpbyBjb2RlYwo+ID4gIC0gcm9ja2NoaXAsaGVhZHNldC1jb2RlYzogVGhlIHBoYW5kbGUgb2Yg
RXh0IGNoaXAgZm9yIGphY2sgZGV0ZWN0aW9uCj4gPiArLSByb2NrY2hpcCxoZG1pOiBUaGUgcGhh
bmRsZSBvZiBIRE1JIG5vZGUgZm9yIEhETUkgamFjayBkZXRlY3Rpb24KPiA+Cj4gPiAgRXhhbXBs
ZToKPiA+Cj4gPiBAQCAtMTYsNCArMTcsNSBAQCBzb3VuZCB7Cj4gPiAgICAgICByb2NrY2hpcCxp
MnMtY29udHJvbGxlciA9IDwmaTJzPjsKPiA+ICAgICAgIHJvY2tjaGlwLGF1ZGlvLWNvZGVjID0g
PCZtYXg5ODA5MD47Cj4gPiAgICAgICByb2NrY2hpcCxoZWFkc2V0LWNvZGVjID0gPCZoZWFkc2V0
Y29kZWM+Owo+ID4gKyAgICAgcm9ja2NoaXAsaGRtaT0gPCZoZG1pPjsKPgo+IHNwYWNlICAgICAg
ICAgICAgICAgIF4KPgo+IFdpdGggdGhhdCwKPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+CkhpIFJvYiwKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgpCdXQgSSBo
YXZlIGNoYW5nZWQgdGhlIGFwcHJvYWNoIGluIHYyIHNvIHRoZXJlIGlzIG5vIG5lZWQgZm9yIG1h
Y2hpbmUKZHJpdmVyIHRvIGV4cG9zZSB0aGlzIHByb3BlcnR5LgpUaGFua3MhCj4gPiAgfTsKPiA+
IC0tCj4gPiAyLjIyLjAucmMxLjI1Ny5nMzEyMGExODI0NC1nb29nCj4gPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
