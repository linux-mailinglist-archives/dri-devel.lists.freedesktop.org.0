Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DDE6E17
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6F16E47B;
	Mon, 28 Oct 2019 08:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069216E34D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 02:32:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n15so8171405wrw.13
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 19:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7WLAChacz4cdQUuGvSzDH2SDjigryRCbt+WDbtW90s=;
 b=YfT4Ng1NcfHf2HMryhX0VQwoYra//GkR9MNHkuhGqn9c5vcUyGR7b0ZAPpx9okjTJH
 vQUGq5uj0BxEvD0EYbOJqcSh0j66DqqooTa3eJcFUlpI5+hN2dbUGsXS/Y6/dZ3zX9y/
 WifVNowueahn8uHVRaTiSwHgWKj/uIpAxh+xTQv19ue99oMuQuHJ3PcWbwCoAu8xqfFi
 dqjK5s8SAoSR2HtFWm81DfAwWHEcFPqEf081wgfLxLqg7IuJmhkFPzKOZFSBOY9IxfvK
 w8Ehtdid+D7hNrCzudb0xwGqyMc64yN1LhiuMvvv0IUCExH8LF2YXg+ebdnCUClzpYKr
 cyAQ==
X-Gm-Message-State: APjAAAU6e7BWmNhC4iOmW8MpN9rtXW+G489atTlK8dm/BoFKcs1AerWX
 7d9I6PvPFg1tgMJBCF0ofZDisI4l/McG5XPpPnwIYw==
X-Google-Smtp-Source: APXvYqzK0YBdyQgsMLm2ci9Dx4kOzJFycGTSzYpVPVfKV8gCZkiX6U1k76C9C14EYAVMDUxQGFHxdvyM+PTOBO8Lys4=
X-Received: by 2002:adf:b1d1:: with SMTP id r17mr12904765wra.201.1572229970951; 
 Sun, 27 Oct 2019 19:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191025133007.11190-1-cychiang@chromium.org>
 <20191025133007.11190-3-cychiang@chromium.org>
 <20191025162232.GA23022@bogus>
In-Reply-To: <20191025162232.GA23022@bogus>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 28 Oct 2019 10:32:24 +0800
Message-ID: <CAFv8NwKhe=CEuMCgeP1G0-Az4GEdMGPMMhvM3oY2=KmZNGrcRw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] ASoC: rockchip-max98090: Support usage with and
 without HDMI
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w7WLAChacz4cdQUuGvSzDH2SDjigryRCbt+WDbtW90s=;
 b=IysszB7/4YwlqN2hIxbjmBzRqB+jb5hB3Tg+ljjzuq3A+FEhC3OFZFMovTbRT0LJfK
 H4qNyEspy1rpsUjibdaW/gAWpBeFZqCkQNS/a6m2giKGzWFHNCZXv+UikEp3b05qqUYQ
 XL2aGPYxYupmlhSDoZ4ce3ZDLKnBEnisKO4aE=
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
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMjYsIDIwMTkgYXQgMTI6MjIgQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAyNSwgMjAxOSBhdCAwOTozMDowM1BNICswODAw
LCBDaGVuZy1ZaSBDaGlhbmcgd3JvdGU6Cj4gPiBUaGVyZSB3aWxsIGJlIG11bHRpcGxlIGJvYXJk
cyBzaGFyaW5nIHRoaXMgbWFjaGluZSBkcml2ZXIuCj4gPiBVc2UgY29tcGF0aWJsZSBzdHJpbmcg
dG8gc3BlY2lmeSB0aGUgdXNlIGNhc2UuCj4gPgo+ID4gInJvY2tjaGlwLHJvY2tjaGlwLWF1ZGlv
LW1heDk4MDkwIiBmb3IgbWF4OTgwOTAtb25seS4KPiA+ICJyb2NrY2hpcCxyb2NrY2hpcC1hdWRp
by1oZG1pIiBmb3IgSERNSS1vbmx5Cj4gPiAicm9ja2NoaXAscm9ja2NoaXAtYXVkaW8tbWF4OTgw
OTAtaGRtaSIgZm9yIG1heDk4MDkwIHBsdXMKPiA+Cj4gPiBNb3ZlIHRoZXNlIHByb3BlcnRpZXMg
dG8gb3B0aW9uYWwgYmVjYXVzZSB0aGV5IGFyZSBub3QgbmVlZGVkIGZvcgo+ID4gSERNSS1vbmx5
IHVzZSBjYXNlLgo+ID4gInJvY2tjaGlwLGF1ZGlvLWNvZGVjIjogVGhlIHBoYW5kbGUgb2YgdGhl
IE1BWDk4MDkwIGF1ZGlvIGNvZGVjCj4gPiAicm9ja2NoaXAsaGVhZHNldC1jb2RlYyI6IFRoZSBw
aGFuZGxlIG9mIEV4dCBjaGlwIGZvciBqYWNrIGRldGVjdGlvbgo+ID4KPiA+IFRoZSBtYWNoaW5l
IGRyaXZlciBjaGFuZ2Ugd2lsbCBhZGQgc3VwcG9ydCBmb3IgSERNSSBjb2RlYyBpbgo+ID4gcm9j
a2NoaXAtbWF4OTgwOTAuCj4gPiBBZGQgb25lIG9wdGlvbmFsIHByb3BlcnR5ICJyb2NrY2hpcCxo
ZG1pLWNvZGVjIiB0byBsZXQgdXNlciBzcGVjaWZ5IEhETUkKPiA+IGRldmljZSBub2RlIGluIERU
UyBzbyBtYWNoaW5lIGRyaXZlciBjYW4gZmluZCBoZG1pLWNvZGVjIGRldmljZSBub2RlIGZvcgo+
ID4gY29kZWMgREFJLgo+Cj4gV2h5IG5vdCBqdXN0IHVzZSB0aGUgcHJlc2VuY2Ugb2Ygcm9ja2No
aXAsaGRtaS1jb2RlYyB0byBlbmFibGUgSERNSSBvcgo+IG5vdC4gTWF5YmUgeW91IHN0aWxsIGFk
ZCByb2NrY2hpcCxyb2NrY2hpcC1hdWRpby1oZG1pIGZvciBIRE1JIG9ubHkuCj4KPiBSZWFsbHks
IHRoZSBzYW1lIHNob3VsZCBoYXZlIGJlZW4gZG9uZSBmb3Igd2hpY2ggY29kZWMgaXMgdXNlZCB0
b28sIGJ1dAo+IEkgZ3Vlc3Mgc29tZW9uZSB3YW50ZWQgMiBtYWNoaW5lIGRyaXZlcnMuCgpIaSBS
b2IsClRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlcGx5LgpJIGNhbiBtYWtlIGNoYW5nZSBpbiBtYWNo
aW5lIGRyaXZlciBzbyB0aGF0Ci0gVGhlIHByZXNlbmNlIG9mIHJvY2tjaGlwLGF1ZGlvLWNvZGVj
IGVuYWJsZSBtYXg5ODA5MAotIFRoZSBwcmVzZW5jZSBvZiByb2NrY2hpcCxoZG1pLWNvZGVjIGVu
YWJsZSBIRE1JLgoKV2l0aCB0aGF0LCB3ZSBkb24ndCBuZWVkIHRoZSB0aHJlZSBwcm9wZXJ0aWVz
IGFkZGVkIGluIHRoaXMgcGF0Y2g6CiJyb2NrY2hpcCxyb2NrY2hpcC1hdWRpby1tYXg5ODA5MCIg
Zm9yIG1heDk4MDkwLW9ubHkuCiJyb2NrY2hpcCxyb2NrY2hpcC1hdWRpby1oZG1pIiBmb3IgSERN
SS1vbmx5CiJyb2NrY2hpcCxyb2NrY2hpcC1hdWRpby1tYXg5ODA5MC1oZG1pIiBmb3IgbWF4OTgw
OTAgcGx1cyBIRE1JLgoKSSB3aWxsIHBvc3QgYW4gdXBkYXRlIHNvb24uIFRoYW5rcyEKCj4KPgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0u
b3JnPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4
dCAgICAgIHwgMzggKysrKysrKysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
