Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628724E280
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 11:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289276E82C;
	Fri, 21 Jun 2019 09:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3223B6E82C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:01:35 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a14so8964182edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 02:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Xgdrm/+uDzgv3SzhRxL0tfed3iEPzeIqwWeZ4LUbXGY=;
 b=THyAWEu6G8F5mej6Eq7RkDt7n3JfNJvlpZqhcM6LUKQ0mHwTWCQeLL+A6LCEComABk
 uvMrfoh9BygiTf5ypCKrK6xbc14+s2nlaMOkMGu4bCMtzog3fDHzt1XC6KpdDRcw+Xby
 Ng4KLVmDJMA8RAEctaNCP9AnCOcmbWCEx5q45WXbt8rtRlM255vdM7bRRMcC1CAXh3oN
 JiqFmZtAuBN9JWCRKlUsQN7okcMm/BIlAwRXLTrHAwVlTOfHZYfFuCMD1X9EoMNDdjq6
 +yDaq8SyZpvC2iDaypFWLenVdPBYtrZXLhlKpjCpNYzHE/trvmdQrj79/aJPjbH2PKK4
 5OZQ==
X-Gm-Message-State: APjAAAW0mpYBvADUsvwvV8SekggcmV/HkMy38IQESspaDTVScFV+XeHF
 LMzSwlXoe1w5pSLLCxBFCi8FzQ==
X-Google-Smtp-Source: APXvYqznrdn8j6NIihoYPfy33vPTVa+X0ZBuzxvWDrMGfyNYMVq6ZP0YVj6cK3KfmQdSrvV8TaEBdA==
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr98973416ejb.189.1561107693780; 
 Fri, 21 Jun 2019 02:01:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w35sm658424edd.32.2019.06.21.02.01.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 02:01:32 -0700 (PDT)
Date: Fri, 21 Jun 2019 11:01:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Message-ID: <20190621090125.GX12905@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <085dc3be-20e5-b2fe-4c02-bf4a4d1473da@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <085dc3be-20e5-b2fe-4c02-bf4a4d1473da@baylibre.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xgdrm/+uDzgv3SzhRxL0tfed3iEPzeIqwWeZ4LUbXGY=;
 b=cMQ/vDuRGUEoyum98yMdueDd2jydiu/6afc0tmWAZBeP10inFyVjuZChKUqT4PiHp4
 ZaSOaO0GrmX6Pzrpoc89zr4LDXG1Rs6RAUq+EHe/URL5DxcN/rxWzl7evg9hSMa3R+ai
 uAt/AmC9AhH4m47gSgcwZtfZUKFOEVgKQDP5k=
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
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDQ6NDA6MTJQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGkgQW5kcnplaiwKPiAKPiBHZW50bGUgcGluZywgY291bGQgeW91IHJldmlldyB0
aGUgZHctaGRtaSBjaGFuZ2VzIGhlcmUgPwoKYnR3IG5vdCBzdXJlIHlvdSBhYnNvbHV0ZWx5IG5l
ZWQgcmV2aWV3IGZyb20gQW5kcnplaiwgd2UncmUgY3VycmVudGx5IGEKYml0IHVuZGVyc3VwcGxp
ZWQgd2l0aCBicmlkZ2UgcmV2aWV3ZXJzIEkgdGhpbmsgLi4uIEJldHRlciB0byByYW1wIHVwCm1v
cmUuCi1EYW5pZWwKCj4gCj4gVGhhbmtzLAo+IE5laWwKPiAKPiBPbiAyNi8wNS8yMDE5IDIzOjE4
LCBKb25hcyBLYXJsbWFuIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIEhEUiBtZXRhZGF0YSB1
c2luZyB0aGUgaGRyX291dHB1dF9tZXRhZGF0YSBjb25uZWN0b3IgcHJvcGVydHksCj4gPiBjb25m
aWd1cmUgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBhY2NvcmRpbmdseS4K
PiA+IAo+ID4gQSBkcm1faW5mb2ZyYW1lIGZsYWcgaXMgYWRkZWQgdG8gZHdfaGRtaV9wbGF0X2Rh
dGEgdGhhdCBwbGF0Zm9ybSBkcml2ZXJzCj4gPiBjYW4gdXNlIHRvIHNpZ25hbCB3aGVuIER5bmFt
aWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBpbmZvZnJhbWVzIGlzIHN1cHBvcnRlZC4KPiA+IFRoaXMg
ZmxhZyBpcyBuZWVkZWQgYmVjYXVzZSBBbWxvZ2ljIEdYQkIgYW5kIEdYTCByZXBvcnQgc2FtZSBE
Vy1IRE1JIHZlcnNpb24sCj4gPiBhbmQgb25seSBHWEwgc3VwcG9ydCBEUk0gSW5mb0ZyYW1lLgo+
ID4gCj4gPiBUaGUgZmlyc3QgcGF0Y2ggYWRkIGZ1bmN0aW9uYWxpdHkgdG8gY29uZmlndXJlIERS
TSBJbmZvRnJhbWUgYmFzZWQgb24gdGhlCj4gPiBoZHJfb3V0cHV0X21ldGFkYXRhIGNvbm5lY3Rv
ciBwcm9wZXJ0eS4KPiA+IAo+ID4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIHNldHMgdGhlIGRybV9p
bmZvZnJhbWUgZmxhZyBvbiBzb21lIFNvQ3Mgc3VwcG9ydGluZwo+ID4gRHluYW1pYyBSYW5nZSBh
bmQgTWFzdGVyaW5nIEluZm9GcmFtZS4KPiA+IAo+ID4gTm90ZSB0aGF0IHRoaXMgd2FzIGJhc2Vk
IG9uIHRvcCBvZiBkcm0tbWlzYy1uZXh0IGFuZCBOZWlsIEFybXN0cm9uZydzCj4gPiAiZHJtL21l
c29uOiBBZGQgc3VwcG9ydCBmb3IgSERNSTIuMCBZVVY0MjAgNGs2MCIgc2VyaWVzIGF0IFsxXQo+
ID4gCj4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81ODcy
NS8jcmV2Mgo+ID4gCj4gPiBKb25hcyBLYXJsbWFuICg0KToKPiA+ICAgZHJtL2JyaWRnZTogZHct
aGRtaTogQWRkIER5bmFtaWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUgc3VwcG9ydAo+
ID4gICBkcm0vcm9ja2NoaXA6IEVuYWJsZSBEUk0gSW5mb0ZyYW1lIHN1cHBvcnQgb24gUkszMzI4
IGFuZCBSSzMzOTkKPiA+ICAgZHJtL21lc29uOiBFbmFibGUgRFJNIEluZm9GcmFtZSBzdXBwb3J0
IG9uIEdYTCwgR1hNIGFuZCBHMTJBCj4gPiAgIGRybS9zdW40aTogRW5hYmxlIERSTSBJbmZvRnJh
bWUgc3VwcG9ydCBvbiBINgo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMgICB8IDEwOSArKysrKysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oICAgfCAgMzcgKysrKysrKwo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgICAgfCAgIDUgKwo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAgIDIgKwo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmMgICAgICAgfCAgIDIgKwo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmggICAgICAgfCAgIDEgKwo+ID4gIGluY2x1
ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIDcgZmls
ZXMgY2hhbmdlZCwgMTU3IGluc2VydGlvbnMoKykKPiA+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
