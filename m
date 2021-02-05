Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC1F310DDF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CC06E0EE;
	Fri,  5 Feb 2021 16:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C346E0EE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 16:28:37 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u25so10730296lfc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 08:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A18d3pB/vKIfoZwd9hT2XkXbAHUUomY9AFW5el5Iv+w=;
 b=Wudm5iQjkI3ZTaWcshAyr4CMdeBbU31TKDmJCwTwxF6ChJTngmVQnyhA7rdZheQG+0
 fqmEed/ZrJYX6V6flP1hUaFw1yL2WzQ9KjarqIvJxan086aVhJk5qabj1V5A97B7l+t5
 o7+sMYHV6UK1QeQsRWytnw1C3Q4II/V+RocHdRlju4uVns1Ohyn0kCmzrr1cTbKpjE2E
 yCT+wIZvaLBbwZUKOWA1to2JOpbrSAeTN2my3tjXeMSjr5UDk0q1kXdGEROprc/lXhgD
 ClAUG6exGry7iA+QMG9dw1fLznsk3itm9zcYZ4FNqNg8eBed0hHRgjXuYuabW7YTW3Os
 eAeA==
X-Gm-Message-State: AOAM53310dx6tE/hxwQJ60cwcYgrkrbP25ocSsz4No61VU5YtP+w8hH2
 RVnYYj9PtVFM7e2Bx6JzfDQqHZ/AfaPxmQ==
X-Google-Smtp-Source: ABdhPJx/5FEZaQlGemo7IJRPvUoENnI5uQd5KjnXOHzGn+091E1hwVS7ChlFhr9Sf94DwwtOv2/m3A==
X-Received: by 2002:a19:e10:: with SMTP id 16mr2732517lfo.625.1612542515850;
 Fri, 05 Feb 2021 08:28:35 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id 186sm1033172lff.154.2021.02.05.08.28.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:28:35 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id t8so8410415ljk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 08:28:34 -0800 (PST)
X-Received: by 2002:a2e:9d04:: with SMTP id t4mr3147625lji.56.1612542514337;
 Fri, 05 Feb 2021 08:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
 <20210205160130.ccp7jfcaa5hgyekb@gilmour> <2156838.FvJGUiYDvf@kista>
In-Reply-To: <2156838.FvJGUiYDvf@kista>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 6 Feb 2021 00:28:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
Message-ID: <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
Subject: Re: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1
 channel
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBGZWIgNiwgMjAyMSBhdCAxMjoyMSBBTSBKZXJuZWogxaBrcmFiZWMgPGplcm5lai5z
a3JhYmVjQHNpb2wubmV0PiB3cm90ZToKPgo+IERuZSBwZXRlaywgMDUuIGZlYnJ1YXIgMjAyMSBv
YiAxNzowMTozMCBDRVQgamUgTWF4aW1lIFJpcGFyZCBuYXBpc2FsKGEpOgo+ID4gT24gRnJpLCBG
ZWIgMDUsIDIwMjEgYXQgMTE6MjE6MjJBTSArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOgo+ID4g
PiBPbiBGcmksIEZlYiA1LCAyMDIxIGF0IDI6NDggQU0gSmVybmVqIFNrcmFiZWMgPGplcm5lai5z
a3JhYmVjQHNpb2wubmV0Pgo+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gQ2hhbm5lbCAxIGhhcyBw
b2xhcml0eSBiaXRzIGZvciB2c3luYyBhbmQgaHN5bmMgc2lnbmFscyBidXQgZHJpdmVyIG5ldmVy
Cj4gPiA+ID4gc2V0cyB0aGVtLiBJdCB0dXJucyBvdXQgdGhhdCB3aXRoIHByZS1IRE1JMiBjb250
cm9sbGVycyBzZWVtaW5nbHkgdGhlcmUKPiA+ID4gPiBpcyBubyBpc3N1ZSBpZiBwb2xhcml0eSBp
cyBub3Qgc2V0LiBIb3dldmVyLCB3aXRoIEhETUkyIGNvbnRyb2xsZXJzCj4gPiA+ID4gKEg2KSB0
aGVyZSBvZnRlbiBjb21lcyB0byBkZS1zeW5jaHJvbml6YXRpb24gZHVlIHRvIHBoYXNlIHNoaWZ0
LiBUaGlzCj4gPiA+ID4gY2F1c2VzIGZsaWNrZXJpbmcgc2NyZWVuLiBJdCdzIHNhZmUgdG8gYXNz
dW1lIHRoYXQgc2ltaWxhciBpc3N1ZXMgbWlnaHQKPiA+ID4gPiBoYXBwZW4gYWxzbyB3aXRoIHBy
ZS1IRE1JMiBjb250cm9sbGVycy4KPiA+ID4gPgo+ID4gPiA+IFNvbHZlIGlzc3VlIHdpdGggc2V0
dGluZyB2c3luYyBhbmQgaHN5bmMgcG9sYXJpdHkuIE5vdGUgdGhhdCBkaXNwbGF5Cj4gPiA+ID4g
c3RhY2tzIHdpdGggdGNvbiB0b3AgaGF2ZSBwb2xhcml0eSBiaXRzIGFjdHVhbGx5IGluIHRjb24w
IHBvbGFyaXR5Cj4gPiA+ID4gcmVnaXN0ZXIuCj4gPiA+ID4KPiA+ID4gPiBGaXhlczogOTAyNmUw
ZDEyMmFjICgiZHJtOiBBZGQgQWxsd2lubmVyIEExMCBEaXNwbGF5IEVuZ2luZSBzdXBwb3J0IikK
PiA+ID4gPiBUZXN0ZWQtYnk6IEFuZHJlIEhlaWRlciA8YS5oZWlkZXJAZ21haWwuY29tPgo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5l
dD4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24u
YyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNGlfdGNvbi5oIHwgIDUgKysrKysKPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
OSBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS8KPiBzdW40aV90
Y29uLmMKPiA+ID4gPiBpbmRleCA2YjlhZjRjMDhjZDYuLjBkMTMyZGFlNThjMCAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwo+ID4gPiA+IEBAIC02NzIsNiAr
NjcyLDI5IEBAIHN0YXRpYyB2b2lkIHN1bjRpX3Rjb24xX21vZGVfc2V0KHN0cnVjdCBzdW40aV90
Y29uCj4gKnRjb24sCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgU1VONElfVENPTjFfQkFT
SUM1X1ZfU1lOQyh2c3luYykgfAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgIFNVTjRJX1RD
T04xX0JBU0lDNV9IX1NZTkMoaHN5bmMpKTsKPiA+ID4gPgo+ID4gPiA+ICsgICAgICAgLyogU2V0
dXAgdGhlIHBvbGFyaXR5IG9mIHN5bmMgc2lnbmFscyAqLwo+ID4gPiA+ICsgICAgICAgaWYgKHRj
b24tPnF1aXJrcy0+cG9sYXJpdHlfaW5fY2gwKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHZh
bCA9IDA7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAobW9kZS0+ZmxhZ3Mg
JiBEUk1fTU9ERV9GTEFHX1BIU1lOQykKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB2
YWwgfD0gU1VONElfVENPTjBfSU9fUE9MX0hTWU5DX1BPU0lUSVZFOwo+ID4gPiA+ICsKPiA+ID4g
PiArICAgICAgICAgICAgICAgaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19QVlNZTkMp
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmFsIHw9IFNVTjRJX1RDT04wX0lPX1BP
TF9WU1lOQ19QT1NJVElWRTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJlZ21h
cF93cml0ZSh0Y29uLT5yZWdzLCBTVU40SV9UQ09OMF9JT19QT0xfUkVHLCB2YWwpOwo+ID4gPiA+
ICsgICAgICAgfSBlbHNlIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgdmFsID0gU1VONElfVENP
TjFfSU9fUE9MX1VOS05PV047Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgYSBjb21tZW50IGZvciB0aGUg
b3JpZ2luIG9mIHRoaXMgaXMgd2FycmFudGVkLgo+ID4KPiA+IElmIGl0J3MgYW55dGhpbmcgbGlr
ZSBUQ09OMCwgaXQncyB0aGUgcGl4ZWwgY2xvY2sgcG9sYXJpdHkKPgo+IEhhcmQgdG8gc2F5LCBE
VyBIRE1JIGNvbnRyb2xsZXIgaGFzICJkYXRhIGVuYWJsZSIgcG9sYXJpdHkgYWxvbmcgaHN5bmMg
YW5kCj4gdnN5bmMuIEl0IGNvdWxkIGJlIGVpdGhlciBvciBub25lIG9mIHRob3NlLgo+Cj4gV2hh
dCBzaG91bGQgSSB3cml0ZSBpbiBjb21tZW50PyBCU1AgZHJpdmVycyBhbmQgZG9jdW1lbnRhdGlv
biB1c2Ugb25seSBnZW5lcmljCj4gbmFtZXMgbGlrZSBpbzJfaW52LgoKSnVzdCBzYXkgdGhhdCB3
ZSBkb24ndCBrbm93IGV4YWN0bHkgd2hhdCBpdCBpcywgYnV0IGl0IGlzIHJlcXVpcmVkIGZvciB0
aGluZ3MKdG8gd29yayBwcm9wZXJseT8gV291bGQgYmUgaW50ZXJlc3RpbmcgdG8ga25vdyB3aGF0
IGhhcHBlbnMgaWYgeW91IGRvbid0IHNldAp0aGlzIGJpdCwgYnV0IGRvIHNldCBWU1lOQy9IU1lO
QyBwb2xhcml0eSBwcm9wZXJseS4KCkNoZW5ZdQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
