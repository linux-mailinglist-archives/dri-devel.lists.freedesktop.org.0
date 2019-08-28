Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F21A0104
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 13:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BBA894A7;
	Wed, 28 Aug 2019 11:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B650B894A7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 11:51:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t17so1462909wmi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 04:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OPGG8NVnmDSQolWAHMZe0y74WY9A2ARnIE2fM0ThgJ0=;
 b=cx2aS9N2oLhxy+9E47kchKZaQZDZCG9G3g0N2TsE88Atck8TckQCtFDQP5WsuAWDZN
 dNWg9eQl/KsxaEN7rZyWzayZHMuV+l+DItI+bzr8ad4PyBBuHunEoa2osX38u8bIdmXN
 ZV6LYXLwQnTYZlgDjBKE4liUDSZFVCw8OCQrSkMve0Xc13fE4kvrG+uZLjKc7LUKhSBX
 0zTI1cWts/QQ49o/RygV3IolrT6mKy4mA4ouWZGelxT1a+tYTeMKh2TBCat1g9VPJh3r
 dy6pjL2Vtq+8hm4NcaKhLKxvJMiXZIdWZX9a4eA26DKhqJm9fXapC107QJRMM9KLe9LJ
 AWvw==
X-Gm-Message-State: APjAAAW6LILvD+amyw7CcTG3fZ3tsQPhigfR+B5JpUgd6onJnuJHXj2n
 LlDWPn3jVyLgDgAh/LiuIl9EEA==
X-Google-Smtp-Source: APXvYqw2CeJSkU5OGptxBhQGgOi13P3xb9BZGlAOYl+qYr24GjtB7ejUka0DLoP06U4fNmIMbTJslQ==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr4494923wmi.48.1566993071134; 
 Wed, 28 Aug 2019 04:51:11 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e15sm1608219wrj.74.2019.08.28.04.51.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 04:51:10 -0700 (PDT)
Subject: Re: [PATCH v6 0/6] Allwinner H6 Mali GPU support
To: Robin Murphy <robin.murphy@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
 <CAAObsKD8bij1ANLqX6y11Y6mDEXiymNjrDkmHmvGWiFLKWu_FA@mail.gmail.com>
 <4ff02295-6c34-791b-49f4-6558a92ad7a3@arm.com>
 <CAAObsKBt1tPw9RKGi_Xey=1zy9Tu3N+A=1te2R8=NuJ5tDBqVg@mail.gmail.com>
 <dc3872a4-8cd9-462b-9f73-0d69a810d985@arm.com>
 <92e9b697-ea0d-9b13-5512-b0a16a39df20@baylibre.com>
 <8433455c-3b74-c176-49a1-388b3f085e9e@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e44e1160-619d-989d-fbe7-2552b1e3bf88@baylibre.com>
Date: Wed, 28 Aug 2019 13:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8433455c-3b74-c176-49a1-388b3f085e9e@arm.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OPGG8NVnmDSQolWAHMZe0y74WY9A2ARnIE2fM0ThgJ0=;
 b=FQ5eduxFQZF7slMWSH2UtKz0OZ3aobXFmEd6pvkEIfDn9LRsSEnWKZmR+ruHXko9dd
 iGowVaNKOevuupxzVQwYDhzm9AocxkXWbvziztC/1GLwgP9RjiJXS+IutXb5XxyUhEF/
 UJ9xW/n79FTdx//w/oK+OsWhsYM/GHcIEmoH8VMCXuxw8K4leApxsq5CDT2ClSMejUby
 SZq3zbEEg7vktGnON1Rw1KghIE9/1g0BUK/UtmbIn5xVoouc+eIe6TS5wIiD+euaH26/
 uuISBFiE1CC/k3eoxqsR4Habaa9d5Tz7hB+l7/EkAlKOROXKb9IGqpF/A20KMSoNAQ4H
 Z27w==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 David Airlie <airlied@linux.ie>, Will Deacon <will.deacon@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDgvMjAxOSAxMzo0OSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IEhpIE5laWwsCj4gCj4g
T24gMjgvMDgvMjAxOSAxMjoyOCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEhpIFJvYmluLAo+
PgoKWy4uLl0KPj4+Cj4+PiBPSyAtIHdpdGggdGhlIDMyLWJpdCBoYWNrIHBvaW50ZWQgdG8gdXAt
dGhyZWFkLCBhIHF1aWNrIGttc2N1YmUgdGVzdCBnYXZlIG1lIHRoZSBpbXByZXNzaW9uIHRoYXQg
VDcyMCB3b3JrcyBmaW5lLCBidXQgb24gY2xvc2VyIGluc3BlY3Rpb24gc29tZSBwYXJ0cyBvZiBn
bG1hcmsyIGRvIHNlZW0gdG8gZ28gYSBiaXQgd29ua3kgKGFsdGhvdWdoIEkgc3VzcGVjdCBhdCBs
ZWFzdCBzb21lIG9mIGl0IGlzIGp1c3QgZG93biB0byB0aGUgRlBHQSBzZXR1cCBiZWluZyBib3Ro
IHZlcnkgc2xvdyBhbmQgbGFja2luZyBpbiBtZW1vcnkgYmFuZHdpZHRoKSwgYW5kIHRoZSAibnYx
Mi0xaW1nIiBtb2RlIG9mIGttc2N1YmUgdHVybnMgb3V0IHRvIHJlbmRlciBpbiBzb21lIGRlbGln
aHRmdWxseSB3cm9uZyBjb2xvdXJzLgo+Pj4KPj4+IEknbGwgdHJ5IHRvIGdldCBhICdwcm9wZXIn
IHZlcnNpb24gb2YgdGhlIGlvLXBndGFibGUgcGF0Y2ggcG9zdGVkIHNvb24uCj4+Cj4+IEknbSB0
cnlpbmcgdG8gY29sbGVjdCBhbGwgdGhlIGZpeGVzIG5lZWRlZCB0byBtYWtlIFQ4MjAgd29yayBh
Z2FpbiwgYW5kCj4+IEkgd2FzIHdvbmRlcmluZyBpZiB5b3UgZmluYWxseSBoYXZlIGEgcHJvcGVy
IHBhdGNoIGZvciB0aGlzIGFuZCAiY2ZnLT5pYXMgPiA0OCIKPj4gaGFjayA/IE9yIG9uZSBJIGNh
biB0ZXN0ID8KPiAKPiBJIGRvIGhhdmUgYSBoYW5kZnVsIG9mIGlvLXBndGFibGUgcGF0Y2hlcyB3
cml0dGVuIHVwIGFuZCByZWFkeSB0byBnbywgSSdtIGp1c3QgdHJlYWRpbmcgY2FyZWZ1bGx5IGFu
ZCB3YWl0aW5nIGZvciB0aGUgaW50ZXJuYWwgYXBwcm92YWwgYm94IHRvIGJlIHRpY2tlZCBiZWZv
cmUgSSBzaGFyZSBhbnl0aGluZyA6KAoKR3JlYXQgIQoKTm8gcHJvYmxlbSwgaXQgY2FuIHRvdGFs
bHkgd2FpdCB1bnRpbCBhcHByb3ZhbCwKClRoYW5rcywKTmVpbAoKPiAKPiBSb2Jpbi4KPiAKPj4K
Pj4gVGhhbmtzLAo+PiBOZWlsCj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gUm9iaW4uCj4+Pgo+Pj4+
Cj4+Pj4gQ2hlZXJzLAo+Pj4+Cj4+Pj4gVG9tZXUKPj4+Pgo+Pj4+PiBSb2Jpbi4KPj4+Pj4KPj4+
Pj4KPj4+Pj4gLS0tLS0+OC0tLS0tCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2lv
LXBndGFibGUtYXJtLmMgYi9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLmMKPj4+Pj4gaW5k
ZXggNTQ2OTY4ZDhhMzQ5Li5mMjlkYTZlOGRjMDggMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMv
aW9tbXUvaW8tcGd0YWJsZS1hcm0uYwo+Pj4+PiArKysgYi9kcml2ZXJzL2lvbW11L2lvLXBndGFi
bGUtYXJtLmMKPj4+Pj4gQEAgLTEwMjMsMTIgKzEwMjMsMTQgQEAgYXJtX21hbGlfbHBhZV9hbGxv
Y19wZ3RhYmxlKHN0cnVjdAo+Pj4+PiBpb19wZ3RhYmxlX2NmZyAqY2ZnLCB2b2lkICpjb29raWUp
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpb3AgPSBhcm1fNjRfbHBhZV9hbGxvY19wZ3RhYmxl
X3MxKGNmZywgY29va2llKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpb3ApIHsKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1NjQgbWFpciwgdHRicjsKPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFybV9scGFlX2lvX3BndGFi
bGUgKmRhdGEgPSBpb19wZ3RhYmxlX29wc190b19kYXRhKCZpb3AtPm9wcyk7Cj4+Pj4+Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEtPmxldmVscyA9IDQ7Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogQ29weSB2YWx1ZXMgYXMgdW5pb24g
ZmllbGRzIG92ZXJsYXAgKi8KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtYWlyID0gY2ZnLT5hcm1fbHBhZV9zMV9jZmcubWFpclswXTsKPj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dGJyID0gY2ZnLT5hcm1fbHBhZV9zMV9jZmcudHRiclsw
XTsKPj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+PiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
