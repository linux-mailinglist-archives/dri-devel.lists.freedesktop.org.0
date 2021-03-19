Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1D3418AD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE706E9BF;
	Fri, 19 Mar 2021 09:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5D66E9BF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:45:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z2so8427152wrl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7xA9jaLU9Hl7W/xOhqOO8+Qa+G/0S2lX+mubfTHzlQw=;
 b=dhKvPIrmJH4OIa3k2RSaNrNYI+lonJrCW74vwxYlGEhmAtwglM/39kN7teRcwrEh5e
 RMWHIJU6Oli0crfPtx7p2SMj4C6cyQ0zXme/xp+/IAoZyuvz01e8f0JdRYYTcOonC1qN
 ykMzvFFn58atqAqqFw9RAON5PTDKPeurszUc06CElgboWYF6tMOyo/uXVEesQtbc/ruc
 ol4Ff+ai+OX6BLZxn8laYk6uP8DJMjGLuXHqF0B73bf0yQQQaIxQdzQjPRbhTHqtQdqG
 C1eE09wkXmVuIxYPM31TPIWSMyEWuPoCgKCAPjPdNTedsL1m4eO+JrOVqTu9gwj/X3o5
 YiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7xA9jaLU9Hl7W/xOhqOO8+Qa+G/0S2lX+mubfTHzlQw=;
 b=JluHQcu9our3qDqtrqatex9z6juhnL0R3NhaIBKHzMuuhs/mDjOQFBm0Hy3Wj1T1pJ
 kh3J09UXrKQ+8wCOvMjvk5ah1dmqbwUO7VP1LpgzE1FA4JP2TF5q2LDiGhVnwTvBbSk6
 LdknBhi8uke0L2Z/PsozA7OPBuCiAtTyGGx8RLL4w7BBEPKeFRgrly1bcONsBumh4g6t
 ZNzXWqEWTNcZmCNHlAVIt1/WVngDrdekb/1KmnEqckUO9kWHJVYoPISPZ6vClupUaU9D
 RJpbiOC1Bqx/jlRrGVg2Kp+4cH0OmGYes4NN+7xzCSTQ/HBG7KOiqnIl+owL7B7qp0h9
 3ayQ==
X-Gm-Message-State: AOAM5334WGW8miu4MiZoiu/WjjGlGR3exCMs70+y+Or48yskA0Bz9B0N
 WI7HeH5PWk6EEifhKqk9PgUf4jBhShRy6h10
X-Google-Smtp-Source: ABdhPJwb5PjyRRgZpq6eA2shGJPS1aMcCsJlMkXaGceBPF/XtFPh1KHUyPSV/hD4aBq78JgCn2I7zA==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr3640168wrm.413.1616147099606; 
 Fri, 19 Mar 2021 02:44:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:62a:14da:7a4b:4aee?
 ([2a01:e0a:90c:e290:62a:14da:7a4b:4aee])
 by smtp.gmail.com with ESMTPSA id 9sm5491611wmf.13.2021.03.19.02.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 02:44:59 -0700 (PDT)
Subject: Re: [PATCH 02/18] drm/bridge: Add HDMI output fmt helper
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-3-maxime@cerno.tech>
 <38906681-737b-462a-d10d-7fb9def141d2@baylibre.com>
 <3312709.MrizLCItEp@kista>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <18084f61-1cc6-2b88-f551-25fbccdc100b@baylibre.com>
Date: Fri, 19 Mar 2021 10:44:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3312709.MrizLCItEp@kista>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDMvMjAyMSAxOTozMSwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IERuZSBzcmVkYSwg
MTcuIG1hcmVjIDIwMjEgb2IgMTc6MDg6MDcgQ0VUIGplIE5laWwgQXJtc3Ryb25nIG5hcGlzYWwo
YSk6Cj4+IE9uIDE3LzAzLzIwMjEgMTY6NDMsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+PiBUaGUg
YXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMgYnJpZGdlIGNhbGxiYWNrIGlzIHRoZXJlIHRvIGxp
c3QgdGhlCj4+PiBhdmFpbGFibGUgZm9ybWF0cyBmb3Igb3V0cHV0IGJ5IGRlY3JlYXNpbmcgb3Jk
ZXIgb2YgcHJlZmVyZW5jZS4KPj4+Cj4+PiBPbiBIRE1JIGNvbnRyb2xsZXJzLCB3ZSBoYXZlIGEg
ZmFpcmx5IHN0YXRpYyBsaXN0IHRoYXQgd2lsbCBkZXBlbmQgb24KPj4+IHdoYXQgdGhlIEhETUkg
c2luayBpcyBjYXBhYmxlIG9mIGFuZCB0aGUgQlBDIG91ciBjb250cm9sbGVyIGNhbiBvdXRwdXQu
Cj4+Pgo+Pj4gVGhlIGR3LWhkbWkgZHJpdmVyIGFscmVhZHkgaGFzIHRoYXQgY29kZSBkb25lIGlu
IGEgZmFpcmx5IGdlbmVyaWMKPj4+IG1hbm5lciwgc28gbGV0J3MgdHVybiB0aGF0IGNvZGUgaW50
byBhbiBoZWxwZXIgZm9yIGFsbCB0aGUgSERNSQo+Pj4gY29udHJvbGxlcnMgdG8gcmV1c2UuCj4+
Cj4+IFRoaXMgY29kZSB3YXMgYmFzZWQgb24gdGhlIGNhcGFiaWxpdGllcyBvZiB0aGUgRFctSERN
SSBJUCwgY29weWluZyBpdCBhcy1pcwo+PiBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSwgd2Ugc2hv
dWxkIGJlIGFibGUgdG8gZmlsdGVyIG91dCBmb3JtYXRzIHRoZSBIRE1JIElQCj4+IGRvZXNuJ3Qg
c3VwcG9ydC4KPiAKPiBIRE1JIHN0YW5kYXJkIGhhcyBwcmV0dHkgc3RyaWN0IHJlcXVpcmVtZW50
cyB3aGljaCBmb3JtYXRzIHNob3VsZCBiZSAKPiBzdXBwb3J0ZWQsIHNvIGNvcmVzIHNob3VsZCBo
YXZlIHZlcnkgc2ltaWxhciBjYXBhYmlsaXRpZXMuCgpZZXMgZm9yIG91dHB1dCBmb3JtYXRzICh3
ZSBzdGlsbCBtYXkgbmVlZCB0byBmaWx0ZXIgb3V0IDQyMCwgNDIyIGZvciBleGFtcGxlKSwKCk5v
IGZvciBpbnB1dCBmb3JtYXRzLCBzaW5jZSBpdCBkZXBlbmRzIGVudGlyZWx5IG9uIHRoZSBjYXBh
YmlsaXR5IG9mIHRoZSB0cmFuc2NlaXZlcgppbiB0ZXJtcyBvZiBmb3JtYXQgY29udmVyc2lvbi4K
Ck5laWwKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEplcm5lago+IAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
