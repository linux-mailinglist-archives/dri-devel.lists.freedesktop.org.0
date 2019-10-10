Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC300D2889
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 13:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5500B6EB10;
	Thu, 10 Oct 2019 11:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9646EB0B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:59:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b9so7579540wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PJZr84+VWbsWIjXLii4Or5cL9nSL6s5rcELJwr9d/D8=;
 b=cqNGaBAUgbTBUp5aS6SyBiCQvL5xbzqVeia3t7zPp7RQCCqreN2nnPFFsP12QNvC4K
 FvmFdpIMHYaYnFqRLqQcsNqe1+p8x19RHL+0aUtOarrp6YpZdCrWNysVuVdTmIXQxSqu
 /EzjicjRYGXkbBuWe5oSsXSd56B5CGcoIqkG2td9TW1zfwuZ3DRDP4LeEOB1gv/H5c1r
 859FUFKuQhwEvbjOxKU6Hs1DeoyQ9tipHXlyqXPXFL99cSQW0gNiUSleMnkms3P2t9YS
 Hyt/ZCnRbPK0QToz6zObJa86Rlf3vc85zSwKeeLIWhvvPWgMc843/dArKqKyYGZJWQw/
 IumQ==
X-Gm-Message-State: APjAAAWxpEGdvwSmkq+1GWEBYvi/JsTg1inTe9Z7SFp7oPt0o7bkKgwz
 dvXOK+i1OJvywQFIBUW2l0Hnsw==
X-Google-Smtp-Source: APXvYqyWiaeO/zLQuFUGupvyPhy9Um/jfOMVPRooKc1FIiqgVcdz4J3ZYRzJTzUnlAV7FTuxANrASA==
X-Received: by 2002:a5d:514c:: with SMTP id u12mr8225996wrt.147.1570708776846; 
 Thu, 10 Oct 2019 04:59:36 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e17sm4257938wma.15.2019.10.10.04.59.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 04:59:36 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>
References: <HE1PR06MB401113BF395C06E96503344FAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <8aa67433-d956-4faf-f038-b6b365349ac0@baylibre.com>
Date: Thu, 10 Oct 2019 13:59:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <HE1PR06MB401113BF395C06E96503344FAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PJZr84+VWbsWIjXLii4Or5cL9nSL6s5rcELJwr9d/D8=;
 b=qDTO3/w7ASqdBzyV4GajpJuGZ28qdRHgYPKhSjEgbMiHbLJC3tZTDI4JGjITkaxRNd
 xD9EbXNQM+OLe2ovF1r+3hKPBRHauMaspkKTjtZdFU8E/uDhUeqx9IboqUxioIU8Kbsb
 um5bvQ1szFJA1MNTN3cLHWBhEeZ5LW0ZIYMMwQwkdsM7+T6nhLJ0aGVNi+Xqkl47sv5t
 lxuEOOJeUXyj1LgWtMzawugA0HNRL2uXFkTlJoMRn44+zcmw1FiTEyVga3nVZRHMy0gT
 cgiqkozTZCdJkgto1xOB/fvZLL9buk9REPJu9VQuuSIsHASeAhvEuf/NZhY/QOHm1tnP
 nIvA==
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
 Kevin Hilman <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMTAvMjAxOSAyMToxOSwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBBZGQgc3VwcG9ydCBm
b3IgSERSIG1ldGFkYXRhIHVzaW5nIHRoZSBoZHJfb3V0cHV0X21ldGFkYXRhIGNvbm5lY3RvciBw
cm9wZXJ0eSwKPiBjb25maWd1cmUgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFt
ZSBhY2NvcmRpbmdseS4KPiAKPiBBIHVzZV9kcm1faW5mb2ZyYW1lIGZsYWcgaXMgYWRkZWQgdG8g
ZHdfaGRtaV9wbGF0X2RhdGEgdGhhdCBwbGF0Zm9ybSBkcml2ZXJzCj4gY2FuIHVzZSB0byBzaWdu
YWwgd2hlbiBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcgaW5mb2ZyYW1lcyBpcyBzdXBwb3J0
ZWQuCj4gVGhpcyBmbGFnIGlzIG5lZWRlZCBiZWNhdXNlIEFtbG9naWMgR1hCQiBhbmQgR1hMIHJl
cG9ydCBzYW1lIERXLUhETUkgdmVyc2lvbiwKPiBhbmQgb25seSBHWEwgc3VwcG9ydCBEUk0gSW5m
b0ZyYW1lLgo+IAo+IFRoZSBmaXJzdCBwYXRjaCBhZGQgZnVuY3Rpb25hbGl0eSB0byBjb25maWd1
cmUgRFJNIEluZm9GcmFtZSBiYXNlZCBvbiB0aGUKPiBoZHJfb3V0cHV0X21ldGFkYXRhIGNvbm5l
Y3RvciBwcm9wZXJ0eS4KPiAKPiBUaGUgcmVtYWluaW5nIHBhdGNoZXMgc2V0cyB0aGUgdXNlX2Ry
bV9pbmZvZnJhbWUgZmxhZyBvbiBzb21lIFNvQ3Mgc3VwcG9ydGluZwo+IER5bmFtaWMgUmFuZ2Ug
YW5kIE1hc3RlcmluZyBJbmZvRnJhbWUuCj4gCj4gdjIgaGFzIGJlZW4gcnVudGltZSB0ZXN0ZWQg
b24gYSBSb2NrNjQgKFJLMzMyOCkgYW5kIFJvY2sgUGkgNCAoUkszMzk5KSwKPiBvbmx5IGJ1aWxk
IHRlc3RlZCBmb3IgQW1sb2dpYyBhbmQgQWxsd2lubmVyLgo+IAo+IENoYW5nZXMgaW4gdjI6Cj4g
ICAqIGFkZHJlc3MgY29tbWVudHMgZnJvbSBBbmRyemVqIEhhamRhCj4gICAtIHJlbmFtZWQgYmxv
Yl9lcXVhbCB0byBoZHJfbWV0YWRhdGFfZXF1YWwKPiAgIC0gcmVuYW1lZCBkcm1faW5mb2ZyYW1l
IGZsYWcgdG8gdXNlX2RybV9pbmZvZnJhbWUKPiAgIC0gdXNlIGhkbWlfZHJtX2luZm9mcmFtZV9w
YWNrIGFuZCBhIGxvb3AgdG8gd3JpdGUgcmVncwo+ICAgLSByZW1vdmUgaGRtaSB2ZXJzaW9uIGNo
ZWNrIGluIGhkbWlfY29uZmlnX2RybV9pbmZvZnJhbWUKPiAKPiBKb25hcyBLYXJsbWFuICg0KToK
PiAgIGRybS9icmlkZ2U6IGR3LWhkbWk6IEFkZCBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJpbmcg
SW5mb0ZyYW1lIHN1cHBvcnQKPiAgIGRybS9yb2NrY2hpcDogRW5hYmxlIERSTSBJbmZvRnJhbWUg
c3VwcG9ydCBvbiBSSzMzMjggYW5kIFJLMzM5OQo+ICAgZHJtL21lc29uOiBFbmFibGUgRFJNIElu
Zm9GcmFtZSBzdXBwb3J0IG9uIEdYTCwgR1hNIGFuZCBHMTJBCj4gICBkcm0vc3VuNGk6IEVuYWJs
ZSBEUk0gSW5mb0ZyYW1lIHN1cHBvcnQgb24gSDYKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMgICB8IDgxICsrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCAgIHwgMzcgKysrKysrKysrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jICAgICAgIHwgIDUgKysKPiAg
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYyB8ICAyICsKPiAgZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYyAgICAgICB8ICAyICsKPiAgZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCAgICAgICB8ICAxICsKPiAgaW5jbHVkZS9k
cm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgICB8ICAxICsKPiAgNyBmaWxlcyBjaGFu
Z2VkLCAxMjkgaW5zZXJ0aW9ucygrKQo+IAoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LAoKVGhh
bmtzLApOZWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
