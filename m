Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890774FDA6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403FE89956;
	Sun, 23 Jun 2019 18:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130016E856
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:40:12 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id s16so1159883vke.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 02:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vCdcbqoZQ1U1i7mBxY4bPH1TOrRBXQaqjxbkNh/nbQ=;
 b=N37zt3+ZeOfRHVIwT7QSV3Sru7nKGkzjueDWMxXAdDSvnyd13/Kf1pmMmyfZvN8onL
 uSkQHBO+4V7LitnXjmU17B5DgK2ls0YIFLKoVSh88XyXN9rikiF4EEUBzF0HptvkJJOo
 pZZZ8+81Ryljjxq7mffo7zhrlJW29zb0W7Od8OwFsPUqi8GC5R2Jpu5UsHPlv5uSBxjI
 s4Fe30XZHlNOHhVXkvcg/2MrWszlAO34IKDAivJch1ZalnBCHCQYOyclir8pyQzrUjQu
 7lnZqAY4Ql4hpgyXY8N10AAs5hh/7MH1pj+yvXwEPxRgK9x3HYavXYV8Ogh2tIpS7vP4
 sOMA==
X-Gm-Message-State: APjAAAUaN3wkWOSkmiyF2TVjfecJxlTAq4oHtEgb1ug3rh5KgyT4Qlx6
 8EC13s8IVAOgPdunLJn9gQHg/uTPpHSDm3SOVo83pw==
X-Google-Smtp-Source: APXvYqzqmaV63/sDh2pA+DmjqQt0rIScMqSjGIjM8UgwlzzNNUo2pMiNP3RyCDxLsaSVfiTVd9xkzA40WBjyjKt8VfQ=
X-Received: by 2002:a1f:3692:: with SMTP id d140mr9227965vka.88.1561110010447; 
 Fri, 21 Jun 2019 02:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190603080931.GG21222@phenom.ffwll.local>
 <CAFv8Nw+1sB8i1d87vLeKxRricZOi4gnXFSgOzW9k0sa_Tzybjg@mail.gmail.com>
 <20190604072411.GP21222@phenom.ffwll.local>
 <CAFv8NwKL9ZL=gNpDmdRV+R9eq22+Da_1kzuYBv8kMMyV3Hq14g@mail.gmail.com>
 <20190611123455.GD2458@phenom.ffwll.local>
 <CAFv8NwJxs-R=ehgeqyx=e+T5OmUBsk3uWnUb2t0cC-LDPS7G5w@mail.gmail.com>
 <20190618121220.GU12905@phenom.ffwll.local>
 <CAFv8NwLci2ALi3V-e=8jjatciHWOoOj-FeajwNLWRpWRtqgBdg@mail.gmail.com>
 <20190620092506.GP12905@phenom.ffwll.local>
 <CAFv8NwLbS_f4cfeorzqtmRzQSY0u1tgM7fitAokg_QfViPvq=Q@mail.gmail.com>
 <20190620211204.GW12905@phenom.ffwll.local>
In-Reply-To: <20190620211204.GW12905@phenom.ffwll.local>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 21 Jun 2019 17:39:43 +0800
Message-ID: <CAFv8Nw+m-+pshD_cxKe4Nc_4wP3ttpAfDU7EFb-e+ZBcYNA51Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] video: add HDMI state notifier support
To: Cheng-yi Chiang <cychiang@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Doug Anderson <dianders@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 tzungbi@chromium.org, linux-media@vger.kernel.org, 
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Dariusz Marcinkiewicz <darekm@google.com>
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8vCdcbqoZQ1U1i7mBxY4bPH1TOrRBXQaqjxbkNh/nbQ=;
 b=aISYU0AuOWSMAGgxgMsNgcwyyCsQfgC0WTiJZVc6DjDjjnxMKUEageDY0FcrkMp5o7
 ifs6RlrFO0OjnAJaxSecDeakh4ZBOJPZ3vTpXi66AbMzyFoXJ4nrLFwPI1pk8zMLyg1v
 CuJnbc9bE0uzsi55qKLvlz/emOEVFfRxcBzaA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgNToxMiBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gTWFzc2l2ZWx5IGN1dHRpbmcgdGhpcyB0aHJlYWQsIHNpbmNlIGhh
bGZ3YXkgdGhyb3VnaCBpbiBteSBwcmV2aW91cyByZXBseQo+IEkgcmVhbGl6ZWQgdGhhdCBtYXli
ZSBoZG1pX2NvZGVjIGlzIGEgbXVjaCBiZXR0ZXIgc3RhcnRpbmcgcG9pbnQuCj4KQUNLCj4gT24g
VGh1LCBKdW4gMjAsIDIwMTkgYXQgMDk6MjM6MjNQTSArMDgwMCwgQ2hlbmcteWkgQ2hpYW5nIHdy
b3RlOgo+ID4gT24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgNToyNSBQTSBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gPiBZZWFoIGZ1bGx5IGFncmVlaW5nIHRoYXQgaGRt
aV9hdWRpb19jb2RlIGlzIHByb2JhYmx5IGEgYmV0dGVyIHN0YXJ0aW5nCj4gPiA+IHBvaW50LiBQ
cm9ibGVtIGlzIHRoYXQgYmVjdWFzZSBoZG1pX2NvZGVjIGlzIGJ1aWx0IG9uIHRvcCBvZiBwbGF0
Zm9ybQo+ID4gPiBkZXZpY2UgaXQncyBxdWl0ZSBhIGJpdCBoYXJkZXIgdG8gZXh0ZW5kIHdpdGgg
Y2FsbGJhY2tzIGFuZCB0aGluZ3MgbGlrZQo+ID4gPiB0aGF0LCB3aXRob3V0IGJyZWFraW5nIHRo
ZSBkcml2ZXIgbW9kZWwuCj4gPiA+Cj4gPiA+IEkgbmVlZCB0byB0aGluayBhYm91dCB0aGlzIG1v
cmUsIGJ1dCBpZiBhbGwgd2UgbmVlZCB0byBsb29rIGF0IGlzCj4gPiA+IGhkbWlfY29kZWMsIHRo
ZW4gSSB0aGluayB0aGlzIGJlY29tZXMgYSBsb3QgZWFzaWVyLiBBbmQgd2UgY2FuIGlnbm9yZQo+
ID4gPiBkcm1fYXVkaW9fY29tcG9uZW50LmggY29tcGxldGVseS4KPiA+Cj4gPgo+ID4gSXQgaXMg
c3VycHJpc2luZyB0aGF0IHlvdSB0aGluayB0aGlzIHdheS4KPiA+IE1heWJlIHRoZSBvcmlnaW5h
bCBwYXRjaCBiZWZvcmUgaGRtaS1ub3RpZmllciB3YXMgaW50cm9kdWNlZCBpcyB0aGUKPiA+IGJl
dHRlciB3YXkgdG8gc29sdmUgdGhpcyBpc3N1ZSwgaWYgd2Ugb25seSBuZWVkIHRvIGxvb2sgYXQg
aGRtaV9jb2RlYy4KPiA+Cj4gPiBUaGUgaGlzdG9yeSBvZiBoZG1pX2NvZGVjIGRyaXZlciBpcyBp
biB0aGlzIHBhdGNoIHNlcmllczoKPiA+Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvNTM5NjU2Lwo+Cj4gSG0sIHRoaXMgZG9lc24ndCBzZWVtIHRvIGJlIHRoZSBo
ZG1pX2NvZGVjIGRyaXZlciBJIG1lYW50LCBidXQgYW5vdGhlciwKPiBuZXcgb25lLiBJIHdhcyB0
YWxraW5nIGFib3V0IFNORF9TT0NfSERNSV9DT0RFQy4KPgpZZXMgeW91IGFyZSByaWdodC4gVGhl
eSBhcmUgZGlmZmVyZW50IGNvZGVjIGRyaXZlcnMuClNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLiBX
aGF0IEkgbWVhbnQgd2FzIHRoYXQgbXkgdXNlIGNhc2Ugb24gUkszMjg4CndhcyB1c2luZyBkdy1o
ZG1pLWF1ZGlvLmMgY29kZWMgZHJpdmVyLAp3aGljaCB3YXMgbGF0ZXIgcmVwbGFjZWQgYnkgYSBt
b3JlIGdlbmVyYWwgdmVyc2lvbiBoZG1pLWNvZGVjLmMuCgo+ID4gVGhlcmUgd2FzIGEgY2FsbGJh
Y2sgbWVjaGFuaXNtIGltcGxlbWVudGVkIGJldHdlZW4gZHctaGRtaSBhbmQgaGRtaQo+ID4gY29k
ZWMgZHJpdmVyLgo+ID4gSXQgd2FzIGxhdGVyIGNvbnNvbGlkYXRlZCBieSBEb3VnIGluIHRoaXMg
cGF0Y2ggZm9yIGJldHRlciBqYWNrIHN0YXR1cwo+ID4gcmVwb3J0aW5nOgo+ID4KPiA+IGh0dHBz
Oi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9jaHJvbWl1bW9zL3RoaXJkX3Bh
cnR5L2tlcm5lbC8rLzMwMzU3My8KPgo+IEhtIHRoYXQgc3RpbGwgc2VlbXMgZW50aXJlbHkgc2Vw
YXJhdGUgaGRtaS1jb2RlYyBzcGVjaWZpYyB0byBkdy1oZG1pIG9ubHkKPiAuLi4KPgpBZ2FpbiB5
b3UgYXJlIHJpZ2h0LiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4gV2hhdCBJIG1lYW50IGlzIHRo
YXQKdGhpcyBjYWxsYmFjayBtZWNoYW5pc20gc2hvdWxkIHdvcmsgb24gaGRtaS1jb2RlYy5jIGRy
aXZlciBhcyB3ZWxsLgoKPiA+IEkgYW0gbm90IHN1cmUgd2h5IHRoZSBvcmlnaW5hbCBwYXRjaCBz
ZXJpZXMgZGlkIG5vdCBnZXQgZnVsbHkgYWNjZXB0ZWQKPiA+IGluIHRoZSB1cHN0cmVhbS4KPiA+
IEl0IHdhcyBxdWl0ZSBsb25nIHRpbWUgYWdvLgo+ID4KPiA+IEJ1dCBpZiB5b3UgdGhpbmsgdGhp
cyBtaWdodCBiZSB0aGUgcmlnaHQgd2F5IHRvIGRvLCB0aGVuIGl0IGlzIGV2ZW4KPiA+IGJldHRl
ciBmb3IgdXMgYmVjYXVzZSB0aGUgcGF0Y2ggc2VyaWVzIGFuZCBEb3VnJ3MgcGF0Y2ggaGFkIGJl
ZW4gcXVpdGUKPiA+IHN0YWJsZQo+ID4gb24gb3VyIFJLMzI4OCBwcm9kdWN0cyBmb3IgYWJvdXQg
Zm91ciB5ZWFycyB3aXRoIHBsZW50eSBvZiB1c2Vycywgc28KPiA+IHdlIGhhdmUgbXVjaCBoaWdo
ZXIgY29uZmlkZW5jZSBpbiB0aGVtLgo+ID4gSSBjYW4gcmViYXNlIGFuZCBjbGVhbiB1cCB0aGVt
IGFuZCBwb3N0IGFub3RoZXIgcGF0Y2ggZm9yIHJldmlldy4KPiA+Cj4gPiBQbGVhc2UgbGV0IG1l
IGtub3cgd2hhdCBhcHByb2FjaCB5b3UgZmVlbCBpcyBiZXR0ZXIuCj4gPiBUaGFua3MgYWdhaW4h
Cj4KPiBOb3Qgc3VyZSB3ZSdyZSB0YWxraW5nIGFib3V0IHRoZSBzYW1lLiBXaGF0IEkgaGFkIGlu
IG1pbmQgaXMgdG8gYWRkIGphY2sKPiBzdGF0dXMgdG8gdGhlIGhkbWktY29kZWMuYyBzdHVmZiwg
d2hpY2ggaXMgdXNlZCBieSBtdWx0aXBsZSBzb2MgZHJtCj4gZGlzcGxheSBkcml2ZXJzIGFscmVh
ZHkuIExvb2tpbmcgYXQgZ2l0IGdyZXAgb3V0cHV0LCB0aGVyZSBzZWVtcyB0byBiZQo+IGFscmVh
ZHkgc29tZSBzdXBwb3J0IGZvciBkdy1oZG1pIHN5bm9wc3lzIGRybV9icmlkZ2UgZHJpdmVyLiBJ
IHRob3VnaHQgb2YKPiBleHRlbmRpbmcgdGhhdC4gRG9lcyB0aGF0IG5vdCB3b3JrIGZvciB5b3U/
Cj4KSSB0aGluayBleHRlbmRpbmcgY3VycmVudCBpbnRlcmZhY2Ugd2lsbCB3b3JrLgpUaGVyZSBp
cyBhIHN0cnVjdCBoZG1pX2NvZGVjX3BkYXRhIHRvIGxldCBBTFNBIGNvZGVjIGRyaXZlciBhY2Nl
c3MKc29tZSBvcHMgdGhyb3VnaCBwbGF0Zm9ybSBkYXRhLgpBbmQgYWZ0ZXIgdGhpcyBwYXRjaAoK
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzY5MjMyNC8KCkFMU0EgY29k
ZWMgZHJpdmVyIGNhbiBnZXQgYWNjZXNzIHRvIHRoZSBzdHJ1Y3Qgb24gRFJNIHNpZGUuCkJhc2Vk
IG9uIHRoaXMgSSBjYW4gYWRkIGEgbmV3IG9wcyB0byByZWdpc3RlciBjYWxsYmFjayBmdW5jdGlv
biBmb3IgamFjayBzdGF0dXMuCkl0IHdpbGwgYmUgc2ltaWxhciB0byBEb3VnJ3MgY2hyb21pdW0g
cGF0Y2ggYWJvdmUuCkkgdGhpbmsgdGhhdCBpcyBxdWl0ZSBhIGZlYXNpYmxlIHdheSwgYW5kIGNh
biBiZW5lZml0IGFsbCBib2FyZHMgdXNpbmcKaGRtaS1jb2RlYy5jLgoKVGhhbmtzIGEgbG90ISEK
Cj4gVGhhbmtzLCBEYW5pZWwKPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
