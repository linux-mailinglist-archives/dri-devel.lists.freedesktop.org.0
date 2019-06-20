Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCE4DC44
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 23:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4476E58E;
	Thu, 20 Jun 2019 21:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F976E58E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 21:12:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so6608600edr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=959ru36WY2J0Xrly1vs1MXuZnqXsrreyoL0xoecTXQA=;
 b=ONj6ovH4hjty7RrlkKejp9GQX43lLcp6VCPqZE3BIYHLMAEG6CMIFCcf8pe4AyLh7q
 sPnByY17gMYxxAqIALiV6/H8qGbqd0dl7GqmHUc0u7rwt45qAgq+y0kk8/iCykJOG/eP
 t2POSahdclB8F0WTjat8D9G+C7zYwZAZX+pb41EWNALxu/hiSEePtRxAsI3pz84lzZcX
 HKhUG9X03KqR7EDbLSJK7LMA/IgVe7nq+9h+FPTU4gh2SdV8Qlwv6MTYsMI0MYrjGxO6
 AAcqvzm1U6FPzCp72R8JaB7slmqMkvRKWs9UwBbiQoEoolcuRTuDX6GOD1/r/f2RO8kK
 mqqQ==
X-Gm-Message-State: APjAAAWInssitko5bXnwO0w1+9tg4qryrsSrmY/TjOiZGhc00arbVvED
 onVoJ0jFqeiZ61dKdEVzBEVMuw==
X-Google-Smtp-Source: APXvYqx3EnsHuhcIFTP2RIslvwoM3AQZ6N+bN+bCoN37PG+nA2hCPhd0nIWscWNoh843HbyPEoTJjw==
X-Received: by 2002:a17:906:2510:: with SMTP id
 i16mr98153366ejb.130.1561065130725; 
 Thu, 20 Jun 2019 14:12:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id p18sm76849ejr.61.2019.06.20.14.12.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 14:12:09 -0700 (PDT)
Date: Thu, 20 Jun 2019 23:12:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Cheng-yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH 1/7] video: add HDMI state notifier support
Message-ID: <20190620211204.GW12905@phenom.ffwll.local>
Mail-Followup-To: Cheng-yi Chiang <cychiang@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Doug Anderson <dianders@chromium.org>,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 linux-media@vger.kernel.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, 
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Dariusz Marcinkiewicz <darekm@google.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFv8NwLbS_f4cfeorzqtmRzQSY0u1tgM7fitAokg_QfViPvq=Q@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=959ru36WY2J0Xrly1vs1MXuZnqXsrreyoL0xoecTXQA=;
 b=ZyyEIWc8g9qNg4ofLToKGhgAmro8fi/qsiplRDzzYnsQzgUBFe4c86Ee/wR4SebDjt
 d63ZPlgcJxB1wYNf1eIPn3M3bB13fdEww4NsSF+uA3/ahauLDZUM1S12sFjWLoIzrkEq
 HMbsASyI+4J0m7OfyVxoUW085H+KZiQlel8eY=
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
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFzc2l2ZWx5IGN1dHRpbmcgdGhpcyB0aHJlYWQsIHNpbmNlIGhhbGZ3YXkgdGhyb3VnaCBpbiBt
eSBwcmV2aW91cyByZXBseQpJIHJlYWxpemVkIHRoYXQgbWF5YmUgaGRtaV9jb2RlYyBpcyBhIG11
Y2ggYmV0dGVyIHN0YXJ0aW5nIHBvaW50LgoKT24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDk6MjM6
MjNQTSArMDgwMCwgQ2hlbmcteWkgQ2hpYW5nIHdyb3RlOgo+IE9uIFRodSwgSnVuIDIwLCAyMDE5
IGF0IDU6MjUgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+IFll
YWggZnVsbHkgYWdyZWVpbmcgdGhhdCBoZG1pX2F1ZGlvX2NvZGUgaXMgcHJvYmFibHkgYSBiZXR0
ZXIgc3RhcnRpbmcKPiA+IHBvaW50LiBQcm9ibGVtIGlzIHRoYXQgYmVjdWFzZSBoZG1pX2NvZGVj
IGlzIGJ1aWx0IG9uIHRvcCBvZiBwbGF0Zm9ybQo+ID4gZGV2aWNlIGl0J3MgcXVpdGUgYSBiaXQg
aGFyZGVyIHRvIGV4dGVuZCB3aXRoIGNhbGxiYWNrcyBhbmQgdGhpbmdzIGxpa2UKPiA+IHRoYXQs
IHdpdGhvdXQgYnJlYWtpbmcgdGhlIGRyaXZlciBtb2RlbC4KPiA+Cj4gPiBJIG5lZWQgdG8gdGhp
bmsgYWJvdXQgdGhpcyBtb3JlLCBidXQgaWYgYWxsIHdlIG5lZWQgdG8gbG9vayBhdCBpcwo+ID4g
aGRtaV9jb2RlYywgdGhlbiBJIHRoaW5rIHRoaXMgYmVjb21lcyBhIGxvdCBlYXNpZXIuIEFuZCB3
ZSBjYW4gaWdub3JlCj4gPiBkcm1fYXVkaW9fY29tcG9uZW50LmggY29tcGxldGVseS4KPiAKPiAK
PiBJdCBpcyBzdXJwcmlzaW5nIHRoYXQgeW91IHRoaW5rIHRoaXMgd2F5Lgo+IE1heWJlIHRoZSBv
cmlnaW5hbCBwYXRjaCBiZWZvcmUgaGRtaS1ub3RpZmllciB3YXMgaW50cm9kdWNlZCBpcyB0aGUK
PiBiZXR0ZXIgd2F5IHRvIHNvbHZlIHRoaXMgaXNzdWUsIGlmIHdlIG9ubHkgbmVlZCB0byBsb29r
IGF0IGhkbWlfY29kZWMuCj4gCj4gVGhlIGhpc3Rvcnkgb2YgaGRtaV9jb2RlYyBkcml2ZXIgaXMg
aW4gdGhpcyBwYXRjaCBzZXJpZXM6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3
b3JrL3BhdGNoLzUzOTY1Ni8KCkhtLCB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgaGRtaV9j
b2RlYyBkcml2ZXIgSSBtZWFudCwgYnV0IGFub3RoZXIsCm5ldyBvbmUuIEkgd2FzIHRhbGtpbmcg
YWJvdXQgU05EX1NPQ19IRE1JX0NPREVDLgoKPiBUaGVyZSB3YXMgYSBjYWxsYmFjayBtZWNoYW5p
c20gaW1wbGVtZW50ZWQgYmV0d2VlbiBkdy1oZG1pIGFuZCBoZG1pCj4gY29kZWMgZHJpdmVyLgo+
IEl0IHdhcyBsYXRlciBjb25zb2xpZGF0ZWQgYnkgRG91ZyBpbiB0aGlzIHBhdGNoIGZvciBiZXR0
ZXIgamFjayBzdGF0dXMKPiByZXBvcnRpbmc6Cj4gCj4gaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcu
Z29vZ2xlc291cmNlLmNvbS9jL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvMzAzNTcz
LwoKSG0gdGhhdCBzdGlsbCBzZWVtcyBlbnRpcmVseSBzZXBhcmF0ZSBoZG1pLWNvZGVjIHNwZWNp
ZmljIHRvIGR3LWhkbWkgb25seQouLi4KCj4gSSBhbSBub3Qgc3VyZSB3aHkgdGhlIG9yaWdpbmFs
IHBhdGNoIHNlcmllcyBkaWQgbm90IGdldCBmdWxseSBhY2NlcHRlZAo+IGluIHRoZSB1cHN0cmVh
bS4KPiBJdCB3YXMgcXVpdGUgbG9uZyB0aW1lIGFnby4KPiAKPiBCdXQgaWYgeW91IHRoaW5rIHRo
aXMgbWlnaHQgYmUgdGhlIHJpZ2h0IHdheSB0byBkbywgdGhlbiBpdCBpcyBldmVuCj4gYmV0dGVy
IGZvciB1cyBiZWNhdXNlIHRoZSBwYXRjaCBzZXJpZXMgYW5kIERvdWcncyBwYXRjaCBoYWQgYmVl
biBxdWl0ZQo+IHN0YWJsZQo+IG9uIG91ciBSSzMyODggcHJvZHVjdHMgZm9yIGFib3V0IGZvdXIg
eWVhcnMgd2l0aCBwbGVudHkgb2YgdXNlcnMsIHNvCj4gd2UgaGF2ZSBtdWNoIGhpZ2hlciBjb25m
aWRlbmNlIGluIHRoZW0uCj4gSSBjYW4gcmViYXNlIGFuZCBjbGVhbiB1cCB0aGVtIGFuZCBwb3N0
IGFub3RoZXIgcGF0Y2ggZm9yIHJldmlldy4KPiAKPiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCBh
cHByb2FjaCB5b3UgZmVlbCBpcyBiZXR0ZXIuCj4gVGhhbmtzIGFnYWluIQoKTm90IHN1cmUgd2Un
cmUgdGFsa2luZyBhYm91dCB0aGUgc2FtZS4gV2hhdCBJIGhhZCBpbiBtaW5kIGlzIHRvIGFkZCBq
YWNrCnN0YXR1cyB0byB0aGUgaGRtaS1jb2RlYy5jIHN0dWZmLCB3aGljaCBpcyB1c2VkIGJ5IG11
bHRpcGxlIHNvYyBkcm0KZGlzcGxheSBkcml2ZXJzIGFscmVhZHkuIExvb2tpbmcgYXQgZ2l0IGdy
ZXAgb3V0cHV0LCB0aGVyZSBzZWVtcyB0byBiZQphbHJlYWR5IHNvbWUgc3VwcG9ydCBmb3IgZHct
aGRtaSBzeW5vcHN5cyBkcm1fYnJpZGdlIGRyaXZlci4gSSB0aG91Z2h0IG9mCmV4dGVuZGluZyB0
aGF0LiBEb2VzIHRoYXQgbm90IHdvcmsgZm9yIHlvdT8KClRoYW5rcywgRGFuaWVsCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
