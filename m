Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9887FAD3F6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C28889904;
	Mon,  9 Sep 2019 07:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D959B89904
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 07:37:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r17so12211041wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 00:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C61hu19UgGucmrYuoBwTjUFso09YsVAftS75zhud7R8=;
 b=hsr9oH/44dhxtrI4QLXuV0NJKdZUz0Z0CxAM7wFLegds+e4ZvlLsdrCABCZHVO9n+b
 ZwNiJ/vdzDbqPebbTm7YmW7GdTbjfAdgFS36g4CrzCVpZqx5JXm+swtA/UXkQT3GHASv
 7pCcxBSgn/LAhkmXnbFBdvTsnLrT9eNoPDqFsqPV/OX5nKtMpA6TUmfXLT4bTMFgZ40Q
 e9KmdxJlTKARdecQTyj+lUEU+O8C11tyIZrR5T3+aU7ZOA30NfigDtK1wuWFWWbv5sBa
 8VdmwAmNAnY+6bBQUPzTfw88i7gXBWkIXCKi6TDzEXxrzMtr8Lv9uobkTmWupJImNWVl
 44QQ==
X-Gm-Message-State: APjAAAW8ln2llB0bQ554ZuxqquCOA3FPq1r8qGhw9wQSOc1ELs9nG7U7
 xSua8ZxJtD4gfwQFfpxtewSRjQ==
X-Google-Smtp-Source: APXvYqwqem4JaRVt1Ka0A3Upy4Do0PDGMEq6Q2jgQuinbXUS3O/forbymGJTUNAvqbpYOJbmwusGUQ==
X-Received: by 2002:a1c:4082:: with SMTP id
 n124mr18414442wma.154.1568014637273; 
 Mon, 09 Sep 2019 00:37:17 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f23sm15551165wmf.1.2019.09.09.00.37.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 00:37:16 -0700 (PDT)
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
To: Cheng-yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
 <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
Date: Mon, 9 Sep 2019 09:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C61hu19UgGucmrYuoBwTjUFso09YsVAftS75zhud7R8=;
 b=BN1zfYL1DoYhf+cqmjAWCUt5p4HtFLlARZJumMC5228FCeSACdmC70AqcQXfjF4/yk
 /FDUTTpkV3Eh5pqWjfKgpGL0a2qYBd1O0IqS2X7Wt2JkJJhmANZJ85dlKjpflEUNeTcb
 k7hxNUPVmtEr0j3v8bIXM0t3T8mGjVPa+kRVJoXKwrCGP2he61Lia01MxBxKG1v+4Ovo
 TRH12pgqsfQN9l0TKgz3ZdCWpcUkhEfBqTyz7oYyYc1w7gfDwlImfsde6vMBDPmCK3Sj
 RcN6AmewL+HJuYT3bErWL/l0r+/Cz+5jlurPNTGru3Cv+VjF809CuyKjoAHC5MZiuQC6
 I23Q==
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
 ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwOC8wOS8yMDE5IDE1OjUxLCBDaGVuZy15aSBDaGlhbmcgd3JvdGU6Cj4gT24gRnJp
LCBBdWcgMzAsIDIwMTkgYXQgMTA6NTUgQU0gQ2hlbmcteWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCA2OjI4IFBNIFR6
dW5nLUJpIFNoaWggPHR6dW5nYmlAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24gV2VkLCBK
dWwgMTcsIDIwMTkgYXQgNDozMyBQTSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVt
Lm9yZz4gd3JvdGU6Cj4+Pj4KPj4+PiBUaGlzIHBhdGNoIHNlcmllcyBzdXBwb3J0cyBIRE1JIGph
Y2sgcmVwb3J0aW5nIG9uIFJLMzI4OCwgd2hpY2ggdXNlcwo+Pj4+IERSTSBkdy1oZG1pIGRyaXZl
ciBhbmQgaGRtaS1jb2RlYyBjb2RlYyBkcml2ZXIuCj4+Pj4KPj4+PiBUaGUgcHJldmlvdXMgZGlz
Y3Vzc2lvbiBhYm91dCByZXBvcnRpbmcgamFjayBzdGF0dXMgdXNpbmcgaGRtaS1ub3RpZmllcgo+
Pj4+IGFuZCBkcm1fYXVkaW9fY29tcG9uZW50IGlzIGF0Cj4+Pj4KPj4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA4MzAyNy8KPj4+Pgo+Pj4+IFRoZSBuZXcgYXBw
cm9hY2ggaXMgdG8gdXNlIGEgY2FsbGJhY2sgbWVjaGFuaXNtIHRoYXQgaXMKPj4+PiBzcGVjaWZp
YyB0byBoZG1pLWNvZGVjLgo+Pj4+Cj4+Pj4gQ2hhbmdlcyBmcm9tIHY0IHRvIHY1Ogo+Pj4+IC0g
c3lub3BzeXMvS2NvbmZpZzogUmVtb3ZlIHRoZSBpbmNvcnJlY3QgZGVwZW5kZW5jeSBjaGFuZ2Ug
aW4gdjQuCj4+Pj4gLSByb2NrY2hpcC9LY29uZmlnOiBBZGQgZGVwZW5kZW5jeSBvZiBoZG1pLWNv
ZGVjIHdoZW4gaXQgaXMgcmVhbGx5IG5lZWQKPj4+PiAgIGZvciBqYWNrIHN1cHBvcnQuCj4+Pj4K
Pj4+PiBDaGVuZy1ZaSBDaGlhbmcgKDUpOgo+Pj4+ICAgQVNvQzogaGRtaS1jb2RlYzogQWRkIGFu
IG9wIHRvIHNldCBjYWxsYmFjayBmdW5jdGlvbiBmb3IgcGx1ZyBldmVudAo+Pj4+ICAgZHJtOiBi
cmlkZ2U6IGR3LWhkbWk6IFJlcG9ydCBjb25uZWN0b3Igc3RhdHVzIHVzaW5nIGNhbGxiYWNrCj4+
Pj4gICBkcm06IGR3LWhkbWktaTJzOiBVc2UgZml4ZWQgaWQgZm9yIGNvZGVjIGRldmljZQo+Pj4+
ICAgQVNvQzogcm9ja2NoaXBfbWF4OTgwOTA6IEFkZCBkYWlfbGluayBmb3IgSERNSQo+Pj4+ICAg
QVNvQzogcm9ja2NoaXBfbWF4OTgwOTA6IEFkZCBIRE1JIGphY2sgc3VwcG9ydAo+Pj4+Cj4+PiBM
R1RNLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBUenVuZy1CaSBTaGloIDx0enVuZ2JpQGdvb2dsZS5j
b20+Cj4+Cj4+IEhpIERhbmllbCwKPj4gRG8geW91IGhhdmUgZnVydGhlciBjb25jZXJuIG9uIHRo
aXMgcGF0Y2ggc2VyaWVzIHJlbGF0ZWQgdG8gaGRtaS1jb2RlYwo+PiBhbmQgZHJtIHBhcnQgPwo+
PiBXZSB3b3VsZCBsaWtlIHRvIG1lcmdlIHRoaXMgcGF0Y2ggc2VyaWVzIGlmIHBvc3NpYmxlLgo+
PiBUaGV5IHdpbGwgYmUgbmVlZGVkIGluIG1hbnkgZnV0dXJlIGNocm9tZSBwcm9qZWN0cyBmb3Ig
SERNSSBhdWRpbyBqYWNrCj4+IGRldGVjdGlvbi4KPj4gVGhhbmtzIGEgbG90IQo+IAo+IEhpIE5l
aWwsCj4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIHBhdGNoIHNlcmllcyBpcyB1bmRlciB5b3VyIHJh
ZGFyLgo+IFdvdWxkIHlvdSBtaW5kIHRha2luZyBhIGxvb2sgPwo+IFRoaXMgcGF0Y2ggc2VyaWVz
IGhhcyBiZWVuIGZvbGxvd2luZyBncmVhdCBzdWdnZXN0aW9ucyBmcm9tIHZhcmlvdXMKPiByZXZp
ZXdlcnMsIHNvIEkgaG9wZSBpdCBpcyBmaW5lIG5vdy4KCkknZCBsaWtlIHNvbWUgcmV2aWV3IGZy
b20gQVNvQyBwZW9wbGUgYW5kIG90aGVyIGRybSBicmlkZ2UgcmV2aWV3ZXJzLApKZXJuZWosIEpv
bmFzICYgQW5kcnplai4KCkpvbmFzIGNvdWxkIGhhdmUgc29tZSBjb21tZW50cyBvbiB0aGUgb3Zl
cmFsbCBwYXRjaHNldC4KCj4gCj4gQXVkaW8gamFjayByZXBvcnRpbmcgZm9yIEhETUkgbWlnaHQg
bm90IGJlIG5lZWRlZCBmb3Igb3RoZXIgT1MsIGJ1dCBpdAo+IGlzIGEgbXVzdCBvbiBDaHJvbWVP
Uy4KPiBXZSBoYXZlIG1hbnkgcHJldmlvdXMgcHJvamVjdHMgdXNpbmcgZGlmZmVyZW50IGxvY2Fs
IHBhdGNoIHNldHMgdG8KPiBhY2hpZXZlIEhETUkgamFjayByZXBvcnRpbmcuCj4gSSBob3BlIHRo
YXQgd2UgY2FuIGFjaGlldmUgYSBwcm9wZXIgd2F5IGFuZCByZWFsbHkgZ2V0IHRoZSBwYXRjaGVz
Cj4gbWVyZ2VkIHRvIG1haW5saW5lLgo+IFRoYW5rcyBhIGxvdCEKPiAKClN1cmUsCkRvbid0IGZv
cmdldCB0byBwdXQgSmVybmVqLCBKb25hcywgYW5kIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5
bGlicmUuY29tPiB3aG8gaXMKd29ya2luZyBvbiBpbnRlZ3JhdGluZyBhdWRpbyBvbiB0aGUgQW1s
b2dpYyBTb0NzLgoKTmVpbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
