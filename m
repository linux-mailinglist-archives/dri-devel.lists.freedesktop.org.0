Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F6504B9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 10:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E689875;
	Mon, 24 Jun 2019 08:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF13089875
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:42:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s49so20619825edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 01:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=X9V0I0rT3Iuwr77W2nr5FjsCxhtOBnuvS2mOp7LZweg=;
 b=BIAkll7Ud5G2ewTrj0FCjdjwfnc3g01KXEqqBXRcRK7U+/TvyPUDAqqe3vP6tHOtQS
 A95fi0Zm1MmyG09WQgrQLZx5rxGe1UddVfMQ/PhCLems1yuU/s0U6yDGZFwnBrQk49C/
 Q34kUaVXXHzBoZhkHqcVOIMPKVtNPrmc0qXqmBh9Oq+mBPL5SF6tsivhjctFBoP1oWFr
 w328OyXfexaPu7xswMg4/BNSI0KzJ96ZMw8wn2T8Pemsz7ukc0x5ZwpQMZHmF0qqyx5B
 a/bs2LI3ZxplnmxiM3NnogxqCsSBvnmmVhaFJUXIkbDJ6DKEkkmguU+9OjDRFB5gUYx1
 dwTw==
X-Gm-Message-State: APjAAAV2s8RYFBUlZMHeseEsjmD/GQ9mjbnliUuLCyyyqbo0q2mzqo6k
 8A2ypqKDzirytPW0HOl+bx73Fw==
X-Google-Smtp-Source: APXvYqwjxUt5EgAa2KN9wJES9BzXYjxnZlRD+K5nF0JIffYSpNBVeb7k63n+bBOh0BkltvgY/14EWw==
X-Received: by 2002:a17:906:d797:: with SMTP id
 pj23mr80092489ejb.223.1561365758561; 
 Mon, 24 Jun 2019 01:42:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l10sm1778061ejh.53.2019.06.24.01.42.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 01:42:37 -0700 (PDT)
Date: Mon, 24 Jun 2019 10:42:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Message-ID: <20190624084235.GN12905@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <085dc3be-20e5-b2fe-4c02-bf4a4d1473da@baylibre.com>
 <20190621090125.GX12905@phenom.ffwll.local>
 <20190623233017.GI6124@pendragon.ideasonboard.com>
 <58243243-fbd8-e67b-a050-baa9757be43e@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58243243-fbd8-e67b-a050-baa9757be43e@baylibre.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=X9V0I0rT3Iuwr77W2nr5FjsCxhtOBnuvS2mOp7LZweg=;
 b=H6hDKzNtCd7adLn/KUBkZ0Uf2qlQpq1e/fO+KMsRaIbR2iE4bsUAvqEWLCCKkI31mH
 YP899xwf3+kMbVMVar5LTtE7bcbyuc0PfsTEJY5W1Eky85kgxv7nHvMGPjLYXxRqmfKB
 YQEWgFzlolfDhKKUejA5VspYHSu33zngw0UEI=
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wens@csie.org" <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTA6MTk6MzRBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGkgRGFuaWVsLCBMYXVyZW50LCBBbmRyemVqLAo+IAo+IE9uIDI0LzA2LzIwMTkg
MDE6MzAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAyMSwgMjAxOSBh
dCAxMTowMToyNUFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+IE9uIFRodSwgSnVu
IDIwLCAyMDE5IGF0IDA0OjQwOjEyUE0gKzAyMDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+ID4+
PiBIaSBBbmRyemVqLAo+ID4+Pgo+ID4+PiBHZW50bGUgcGluZywgY291bGQgeW91IHJldmlldyB0
aGUgZHctaGRtaSBjaGFuZ2VzIGhlcmUgPwo+ID4+Cj4gPj4gYnR3IG5vdCBzdXJlIHlvdSBhYnNv
bHV0ZWx5IG5lZWQgcmV2aWV3IGZyb20gQW5kcnplaiwgd2UncmUgY3VycmVudGx5IGEKPiA+PiBi
aXQgdW5kZXJzdXBwbGllZCB3aXRoIGJyaWRnZSByZXZpZXdlcnMgSSB0aGluayAuLi4gQmV0dGVy
IHRvIHJhbXAgdXAKPiA+PiBtb3JlLgo+ID4gCj4gPiBJIHRyeSB0byByZXZpZXcgRFJNIGJyaWRn
ZSBwYXRjaGVzIHdoZW4gcG9zc2libGUsIGJ1dCBkdy1oZG1pIGlzIGEKPiA+IHNwZWNpYWwgY2Fz
ZS4gSSB3YXMgdG9sZCBieSB0aGUgc3VwcGxpZXIgb2YgYW4gU29DIGRhdGFzaGVldCB0aGF0Cj4g
PiBjb250YWlucyB0aGUgSERNSSBlbmNvZGVyIElQIGNvcmUgZG9jdW1lbnRhdGlvbiB0aGF0IFN5
bm9wc3lzIHJlcXVpcmVkCj4gPiB0aGVtIHRvIHJvdXRlIGFsbCBjb250cmlidXRpb25zIG1hZGUg
YmFzZWQgb24gdGhhdCBkb2N1bWVudGF0aW9uIHRocm91Z2gKPiA+IFN5bm9wc3lzJyBpbnRlcm5h
bCBsZWdhbCByZXZpZXcgYmVmb3JlIHB1Ymxpc2hpbmcgdGhlbS4gSSB0aHVzIGRlY2lkZWQKPiA+
IHRvIG5vdCBjb250cmlidXRlIHRvIHRoZSBkcml2ZXIgYW55bW9yZSwgYXQgbGVhc3QgZm9yIGFy
ZWFzIHRoYXQgcmVxdWlyZQo+ID4gYWNjZXNzIHRvIGRvY3VtZW50YXRpb24uCj4gCj4gSSdkIGxp
a2UgdG8gcHJvcG9zZSBteXNlbGYgYXMgY28tbWFpbnRhaW5lciBvZiB0aGUgRFJNIGJyaWRnZSBz
dWJzeXN0ZW0gaWYKPiBldmVyeWJvZHkgYWdyZWVzLCBmb2xsb3dpbmcgdGhlIGV4Y2VsbGVudCB3
b3JrIExhdXJlbnQgYW5kIEFuZHJ6ZWogZGlkLgo+IEkgaGF2ZSBhIHZlcnkgbGl0dGxlIGtub3ds
ZWRnZSBvZiBEU0ksICYgb3RoZXIgYnJpZGdlIGRyaXZlcnMsIGJ1dCBJJ2xsIGRvCj4gbXkgYmVz
dC4KCllheSB2b2x1bnRlZXJzIQoKTWFrZSBNQUlOVEFJTkVSUyBwYXRjaCB0byBhZGQgeW91LCBj
YyByZWxldmFudCBwZW9wbGUsIGdldCBhY2tzLCBtZXJnZSwKdGFnIHlvdSdyZSBpdCA6LSkgT2ss
IGNvLWl0LCB0aGUgcG9pbnQgaXMgdG8gaGF2ZSB0ZWFtcyBhcyBtdWNoIGFzCnBvc3NpYmxlLgoK
Q2hlZXJzLCBEYW5pZWwKPiAKPiBGb3IgdGhlIGR3LWhkbWkgZHJpdmVyLCB3ZSBoYXZlIGEgYmln
IHJvYWRtYXAgaW5jbHVkaW5nIDoKPiAtIEhEUiAodGhpcyBwYXRjaHNldCkKPiAtIEhEQ1AgMS8y
Cj4gLSBZVVY0MjAsIFlVVjQyMiwgWVVWNDQsIDEwYml0LzEyYml0LzE2Yml0IEhETUkgb3V0cHV0
Cj4gLSBFbmhhbmNlZCBhdWRpbyBzdXBwb3J0IGFuZCBFTEQgbm90aWZpY2F0aW9uIHRvIEFTb0MK
PiAuLi4KPiAKPiBIYXZpbmcgYSBtb3JlIGFjdGl2ZSBtYWludGFpbmVyL3Jldmlld2VyIHRlYW0g
d291bGQgYmUgbmVlZGVkLCBhdCBsZWFzdCBmb3IKPiB0aGUgZHctaGRtaSBicmlkZ2UuCj4gCj4g
SSdsbCBhbHNvIHByb3Bvc2UgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPiBhcyByZXZp
ZXdlciBzaW5jZSBoZSBpcyB2ZXJ5Cj4gYWN0aXZlIGZvciB0aGUgbXVsdGltZWRpYSBzdXBwb3J0
IG9uIFJvY2tDaGlwLCBBbGx3aW5uZXIgYW5kIEFtbG9naWMgU29Dcy4KPiBJJ2xsIGFsc28gcHJv
cG9zZSBKZXJuZWogU2tyYWJlY0BzaW9sLm5ldCA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+LCBp
ZiBoZSB3YW50cywKPiBhcyByZXZpZXdlciBzaW5jZSBoZSBpcyB2ZXJ5IGFjdGl2ZSBvbiB0aGUg
QWxsd2lubmVyIFNvQ3Mgc2lkZS4KPiAKPiBOZWlsCj4gCj4gPiAKPiA+Pj4gT24gMjYvMDUvMjAx
OSAyMzoxOCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiA+Pj4+IEFkZCBzdXBwb3J0IGZvciBIRFIg
bWV0YWRhdGEgdXNpbmcgdGhlIGhkcl9vdXRwdXRfbWV0YWRhdGEgY29ubmVjdG9yIHByb3BlcnR5
LAo+ID4+Pj4gY29uZmlndXJlIER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUg
YWNjb3JkaW5nbHkuCj4gPj4+Pgo+ID4+Pj4gQSBkcm1faW5mb2ZyYW1lIGZsYWcgaXMgYWRkZWQg
dG8gZHdfaGRtaV9wbGF0X2RhdGEgdGhhdCBwbGF0Zm9ybSBkcml2ZXJzCj4gPj4+PiBjYW4gdXNl
IHRvIHNpZ25hbCB3aGVuIER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBpbmZvZnJhbWVzIGlz
IHN1cHBvcnRlZC4KPiA+Pj4+IFRoaXMgZmxhZyBpcyBuZWVkZWQgYmVjYXVzZSBBbWxvZ2ljIEdY
QkIgYW5kIEdYTCByZXBvcnQgc2FtZSBEVy1IRE1JIHZlcnNpb24sCj4gPj4+PiBhbmQgb25seSBH
WEwgc3VwcG9ydCBEUk0gSW5mb0ZyYW1lLgo+ID4+Pj4KPiA+Pj4+IFRoZSBmaXJzdCBwYXRjaCBh
ZGQgZnVuY3Rpb25hbGl0eSB0byBjb25maWd1cmUgRFJNIEluZm9GcmFtZSBiYXNlZCBvbiB0aGUK
PiA+Pj4+IGhkcl9vdXRwdXRfbWV0YWRhdGEgY29ubmVjdG9yIHByb3BlcnR5Lgo+ID4+Pj4KPiA+
Pj4+IFRoZSByZW1haW5pbmcgcGF0Y2hlcyBzZXRzIHRoZSBkcm1faW5mb2ZyYW1lIGZsYWcgb24g
c29tZSBTb0NzIHN1cHBvcnRpbmcKPiA+Pj4+IER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBJ
bmZvRnJhbWUuCj4gPj4+Pgo+ID4+Pj4gTm90ZSB0aGF0IHRoaXMgd2FzIGJhc2VkIG9uIHRvcCBv
ZiBkcm0tbWlzYy1uZXh0IGFuZCBOZWlsIEFybXN0cm9uZydzCj4gPj4+PiAiZHJtL21lc29uOiBB
ZGQgc3VwcG9ydCBmb3IgSERNSTIuMCBZVVY0MjAgNGs2MCIgc2VyaWVzIGF0IFsxXQo+ID4+Pj4K
PiA+Pj4+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU4NzI1
LyNyZXYyCj4gPj4+Pgo+ID4+Pj4gSm9uYXMgS2FybG1hbiAoNCk6Cj4gPj4+PiAgIGRybS9icmlk
Z2U6IGR3LWhkbWk6IEFkZCBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgSW5mb0ZyYW1lIHN1
cHBvcnQKPiA+Pj4+ICAgZHJtL3JvY2tjaGlwOiBFbmFibGUgRFJNIEluZm9GcmFtZSBzdXBwb3J0
IG9uIFJLMzMyOCBhbmQgUkszMzk5Cj4gPj4+PiAgIGRybS9tZXNvbjogRW5hYmxlIERSTSBJbmZv
RnJhbWUgc3VwcG9ydCBvbiBHWEwsIEdYTSBhbmQgRzEyQQo+ID4+Pj4gICBkcm0vc3VuNGk6IEVu
YWJsZSBEUk0gSW5mb0ZyYW1lIHN1cHBvcnQgb24gSDYKPiA+Pj4+Cj4gPj4+PiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICB8IDEwOSArKysrKysrKysrKysrKysr
KysrKwo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oICAg
fCAgMzcgKysrKysrKwo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1p
LmMgICAgICAgfCAgIDUgKwo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1p
LXJvY2tjaGlwLmMgfCAgIDIgKwo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9k
d19oZG1pLmMgICAgICAgfCAgIDIgKwo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44
aV9kd19oZG1pLmggICAgICAgfCAgIDEgKwo+ID4+Pj4gIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19o
ZG1pLmggICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4+Pj4gIDcgZmlsZXMgY2hhbmdlZCwgMTU3
IGluc2VydGlvbnMoKykKPiA+IAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
