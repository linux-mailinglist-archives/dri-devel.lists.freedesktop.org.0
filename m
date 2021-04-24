Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C7369DC8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 02:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C046D6ECCF;
	Sat, 24 Apr 2021 00:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FC66ECCF
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 00:24:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 389066144A
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 00:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619223897;
 bh=JUtYUFPq9g527zehS3r3trQprwKqTKRWX2ZmF5KthfI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AXIRmdEEXTTTcqBDHEPz1I1nmt8HMK1D2iAXTYn2nwINJpOvTJnFJxd3aPfpCjRym
 wRYr/iZ9HqdNPRslb2DKYUfnoY57wuZDG2BiCzSywUDACGi/yows4t3dKfD/8WdKN0
 TybE6+JBuZqHJwoiRRcCxbBEOmGWoFaJSJhfdSXKoWbzBwz4I+xZMUAmWXhmDEAMKr
 c9wXyBqjLUodk3/krfZdRmb0AZolokR1MTx7xSSTqfgSGqrKClzLBJVae5mQzlCSHm
 sMCdSeVFphtUA1iGX3FgJEQ/HuMwQh9gWHHRTqvY/oedqgG9bj+BUgImEEaEf6DIOL
 oJ8n9bODCW3Fw==
Received: by mail-ed1-f53.google.com with SMTP id g17so58581273edm.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:24:57 -0700 (PDT)
X-Gm-Message-State: AOAM531VJ8FdAv+mSGMGuxLExrkyezf9nnAARFHs2/nQtnO7TlmT/tf7
 DZx63O27LNRWvvai78ZE7bTopsp1gjcKevF96w==
X-Google-Smtp-Source: ABdhPJyFg/YGdVA+cnxdfhz7C/WrfEW6PAyHJGolTksIoWi6zl62XnlcHbtRzFYYVuxL2wWnJJTuCSRLpqM2wLP13MY=
X-Received: by 2002:a05:6402:8d4:: with SMTP id
 d20mr7402937edz.49.1619223895851; 
 Fri, 23 Apr 2021 17:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-5-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-5-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 08:24:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-N4D2PJR0-YG3r+tLg0kcFZh8zyN=7kBNJsghpZG4nDA@mail.gmail.com>
Message-ID: <CAAOTY_-N4D2PJR0-YG3r+tLg0kcFZh8zyN=7kBNJsghpZG4nDA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpu/drm: mediatek: hdmi: add optional limit on
 maximal HDMI mode clock
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDE55pelIOmAseS4gCDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBTb21lIFNvQ3Mg
bGlrZSB0aGUgTVQ4MTY3IGhhdmUgYSBoYXJkIGxpbWl0IG9uIHRoZSBtYXhpbWFsIHN1cHBvcnRl
ZCBIRE1JIFRNRFMKPiBjbG9jaywgc28gYWRkIGEgY29uZmlndXJhdGlvbiB2YWx1ZSB0byBmaWx0
ZXIgb3V0IHRob3NlIG1vZGVzLgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJl
bnRAYmF5bGlicmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gaW5kZXggMDUzOTI2MmU2OWQzLi5iYzUwZDk3
ZjI1NTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0xNDksNiAr
MTQ5LDcgQEAgc3RydWN0IGhkbWlfYXVkaW9fcGFyYW0gewo+ICBzdHJ1Y3QgbXRrX2hkbWlfY29u
ZiB7Cj4gICAgICAgICBib29sIHR6X2Rpc2FibGVkOwo+ICAgICAgICAgYm9vbCBjZWFfbW9kZXNf
b25seTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbWF4X21vZGVfY2xvY2s7Cj4gIH07Cj4KPiAg
c3RydWN0IG10a19oZG1pIHsKPiBAQCAtMTIyNiw2ICsxMjI3LDEwIEBAIHN0YXRpYyBpbnQgbXRr
X2hkbWlfYnJpZGdlX21vZGVfdmFsaWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgICAg
ICAgIGlmIChoZG1pLT5jb25mLT5jZWFfbW9kZXNfb25seSAmJiAhZHJtX21hdGNoX2NlYV9tb2Rl
KG1vZGUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTU9ERV9CQUQ7Cj4KPiArICAgICAgIGlm
IChoZG1pLT5jb25mLT5tYXhfbW9kZV9jbG9jayAmJgo+ICsgICAgICAgICAgIG1vZGUtPmNsb2Nr
ID4gaGRtaS0+Y29uZi0+bWF4X21vZGVfY2xvY2spCj4gKyAgICAgICAgICAgICAgIHJldHVybiBN
T0RFX0NMT0NLX0hJR0g7Cj4gKwo+ICAgICAgICAgaWYgKG1vZGUtPmNsb2NrIDwgMjcwMDApCj4g
ICAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0xPVzsKPiAgICAgICAgIGlmIChtb2Rl
LT5jbG9jayA+IDI5NzAwMCkKPiAtLQo+IDIuMjUuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
