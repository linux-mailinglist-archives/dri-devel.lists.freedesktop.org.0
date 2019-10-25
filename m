Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98EE5117
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 18:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F42389A94;
	Fri, 25 Oct 2019 16:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36F389A94
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 16:22:35 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d8so2444721otc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 09:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DcXI0ptEmLNRJ3ATloq3LFD9nbZMbeqbCJ87LxNGHWo=;
 b=GNo6YO9crbCx86foRroOhrP7xwLM8bIUJFEdQSkUExfGmxEVCB39TFg6A6z9GL97PW
 yxXwKwF22GDjwwJ0Qm+5pYg5OSUQG9C4ruDeYjF8dGdms8p+iL5VzmxmTc204Ro2qW8N
 lNsikUrmATXLOFVTaHD8ghlG0U9SOdx6+jhNP2tZKT9/NW+6w9kkrZn5mIpMvlYbKFe+
 364c6ihVAHO1f+PECnMq2BtJRloK+60o/PAqfrD6u2MvpP9eRGw6hzCe5ormumc04u8i
 XFAPBTEJUCTR01KYpBwIP2ThaaNHucgINe5mE1slqmb28iwIlZauWpRpq1PSDWh3t6wN
 N7gw==
X-Gm-Message-State: APjAAAU4/r78KnCEQtgmI0d7k+MfmuSdoWjWJhj7sbTlpNA16Dbv/HGl
 Q9KNJUNq0CTrUacga4RpiQ==
X-Google-Smtp-Source: APXvYqzzIuc1vcdp++0F80RLl8KAdKlip2Nqm2Fe6QaByRNOoVA8SwaqBnoVkTda+L/6FQKAQI1xRg==
X-Received: by 2002:a9d:3476:: with SMTP id v109mr3516135otb.211.1572020554577; 
 Fri, 25 Oct 2019 09:22:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i5sm836976otk.10.2019.10.25.09.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 09:22:33 -0700 (PDT)
Date: Fri, 25 Oct 2019 11:22:32 -0500
From: Rob Herring <robh@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v8 2/6] ASoC: rockchip-max98090: Support usage with and
 without HDMI
Message-ID: <20191025162232.GA23022@bogus>
References: <20191025133007.11190-1-cychiang@chromium.org>
 <20191025133007.11190-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025133007.11190-3-cychiang@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDk6MzA6MDNQTSArMDgwMCwgQ2hlbmctWWkgQ2hpYW5n
IHdyb3RlOgo+IFRoZXJlIHdpbGwgYmUgbXVsdGlwbGUgYm9hcmRzIHNoYXJpbmcgdGhpcyBtYWNo
aW5lIGRyaXZlci4KPiBVc2UgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3BlY2lmeSB0aGUgdXNlIGNh
c2UuCj4gCj4gInJvY2tjaGlwLHJvY2tjaGlwLWF1ZGlvLW1heDk4MDkwIiBmb3IgbWF4OTgwOTAt
b25seS4KPiAicm9ja2NoaXAscm9ja2NoaXAtYXVkaW8taGRtaSIgZm9yIEhETUktb25seQo+ICJy
b2NrY2hpcCxyb2NrY2hpcC1hdWRpby1tYXg5ODA5MC1oZG1pIiBmb3IgbWF4OTgwOTAgcGx1cwo+
IAo+IE1vdmUgdGhlc2UgcHJvcGVydGllcyB0byBvcHRpb25hbCBiZWNhdXNlIHRoZXkgYXJlIG5v
dCBuZWVkZWQgZm9yCj4gSERNSS1vbmx5IHVzZSBjYXNlLgo+ICJyb2NrY2hpcCxhdWRpby1jb2Rl
YyI6IFRoZSBwaGFuZGxlIG9mIHRoZSBNQVg5ODA5MCBhdWRpbyBjb2RlYwo+ICJyb2NrY2hpcCxo
ZWFkc2V0LWNvZGVjIjogVGhlIHBoYW5kbGUgb2YgRXh0IGNoaXAgZm9yIGphY2sgZGV0ZWN0aW9u
Cj4gCj4gVGhlIG1hY2hpbmUgZHJpdmVyIGNoYW5nZSB3aWxsIGFkZCBzdXBwb3J0IGZvciBIRE1J
IGNvZGVjIGluCj4gcm9ja2NoaXAtbWF4OTgwOTAuCj4gQWRkIG9uZSBvcHRpb25hbCBwcm9wZXJ0
eSAicm9ja2NoaXAsaGRtaS1jb2RlYyIgdG8gbGV0IHVzZXIgc3BlY2lmeSBIRE1JCj4gZGV2aWNl
IG5vZGUgaW4gRFRTIHNvIG1hY2hpbmUgZHJpdmVyIGNhbiBmaW5kIGhkbWktY29kZWMgZGV2aWNl
IG5vZGUgZm9yCj4gY29kZWMgREFJLgoKV2h5IG5vdCBqdXN0IHVzZSB0aGUgcHJlc2VuY2Ugb2Yg
cm9ja2NoaXAsaGRtaS1jb2RlYyB0byBlbmFibGUgSERNSSBvciAKbm90LiBNYXliZSB5b3Ugc3Rp
bGwgYWRkIHJvY2tjaGlwLHJvY2tjaGlwLWF1ZGlvLWhkbWkgZm9yIEhETUkgb25seS4KClJlYWxs
eSwgdGhlIHNhbWUgc2hvdWxkIGhhdmUgYmVlbiBkb25lIGZvciB3aGljaCBjb2RlYyBpcyB1c2Vk
IHRvbywgYnV0IApJIGd1ZXNzIHNvbWVvbmUgd2FudGVkIDIgbWFjaGluZSBkcml2ZXJzLgoKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4K
PiAtLS0KPiAgLi4uL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dCAgICAgIHwg
MzggKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
