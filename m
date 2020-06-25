Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5820F20AD57
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549D6E44D;
	Fri, 26 Jun 2020 07:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6936E045
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 22:47:50 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d21so4100122lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 15:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C4vrGywFSXvGLVoOss5hU28tEX4KZdVDOtq3n+dB2dc=;
 b=TSe5FwAqquY2gAjRl1KrSZ7igP7mNtiIVOuWjnXnZZMPF0k5TjmHtZn24t5OZuAaJ/
 vGKqZKRgtyDjOPot8FJx4LAIm4xyu5/8eMsB2Up2pE5w+cSnBCXgmZWPNp0JatBduk6d
 skpVkVQ5eQY75vrblIsNa7imNRJYpUj3vFvsR4YSKUsRT/hfcI5PrFb3avOV3gm5lop5
 AknFehxKoAgiP5TRSB4+P/+Uo7J8k0xMfc9wg6jsTse3bF1a7+cskhSNFHMIgObPwnhV
 IQRpTzg8wMWAELa9uap3hvagGROhGpeYCkSQOYUoe/s7nBsubteAvy4+pLmcIRNpxMnV
 xIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C4vrGywFSXvGLVoOss5hU28tEX4KZdVDOtq3n+dB2dc=;
 b=dAvdi9rgWMW7edNF7WuESENS1ikSkITYrIZIT7KQVfmNAneMEJlUom6s6U4vLNk7GU
 z3rUt5i4LPMXWF0CINnnFuF1cd4jXlfCoxvhm72sm1fgAVWmDzRsYb830DX2R0q46AxH
 RxoC72ax+/ZJlXr7dsq+j1fxLSTZ8f3yBriGzBI9UfQQs4abOMljsn/KOIS2szHqOMAY
 4KBrtwiSA1nYk93lDwoZWJFKaFhkhP+tbVknC3XPUbm9smRb9tJlY9ewrIl98TvYYI0h
 AI1DsEIe+ewbVDhgCNS/Imyb+jh1hyL0L3fp+2MA3AUvXazkwkWTYq+YlYrQstx5Osr2
 MWaA==
X-Gm-Message-State: AOAM532/yu+I/G9+LgIsVlNCtY3W0C3EqzKFzbY7Nr34e35F0DWL5OHs
 OT8pY+fpm1qKwCxJo8TGRgc=
X-Google-Smtp-Source: ABdhPJyQAh4jIqAraYem2WT7HVJwLp3BcQAOVVikYwcjix7YREyqGXMA62a1zb8hkoobWlBfBqeHKg==
X-Received: by 2002:a19:ccc5:: with SMTP id c188mr145881lfg.163.1593125269067; 
 Thu, 25 Jun 2020 15:47:49 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id f12sm5052806ljk.44.2020.06.25.15.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 15:47:48 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_channel_map)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
Date: Fri, 26 Jun 2020 01:47:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gIyMjIERSTV9U
RUdSQV9DSEFOTkVMX01BUAo+IAo+IE1ha2UgbWVtb3J5IGFjY2Vzc2libGUgYnkgdGhlIGVuZ2lu
ZSB3aGlsZSBleGVjdXRpbmcgd29yayBvbiB0aGUgY2hhbm5lbC4KPiAKPiBgYGAKPiAjZGVmaW5l
IERSTV9URUdSQV9DSEFOTkVMX01BUF9SRUFEV1JJVEXCoMKgwqDCoMKgwqDCoCAoMTw8MCkKPiAK
PiBzdHJ1Y3QgZHJtX3RlZ3JhX2NoYW5uZWxfbWFwIHsKPiDCoMKgwqDCoMKgwqDCoCAvKgo+IMKg
wqDCoMKgwqDCoMKgwqAgKiBbaW5dIElEIG9mIHRoZSBjaGFubmVsIGZvciB3aGljaCB0byBtYXAg
bWVtb3J5IHRvLgo+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBj
aGFubmVsX2lkOwo+IMKgwqDCoMKgwqDCoMKgIC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0g
R0VNIGhhbmRsZSBvZiB0aGUgbWVtb3J5IHRvIG1hcC4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4g
wqDCoMKgwqDCoMKgwqAgX191MzIgaGFuZGxlOwo+IAo+IMKgwqDCoMKgwqDCoMKgIC8qCj4gwqDC
oMKgwqDCoMKgwqDCoCAqIFtpbl0gT2Zmc2V0IGluIEdFTSBoYW5kbGUgb2YgdGhlIG1lbW9yeSBh
cmVhIHRvIG1hcC4KPiDCoMKgwqDCoMKgwqDCoMKgICoKPiDCoMKgwqDCoMKgwqDCoMKgICogTXVz
dCBiZSBhbGlnbmVkIGJ5IDRLLgo+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDC
oCBfX3U2NCBvZmZzZXQ7CgpDb3VsZCB5b3UgcGxlYXNlIGdpdmUgYSB1c2UtY2FzZSBleGFtcGxl
IGZvciB0aGlzIHBhcnRpYWwgbWFwcGluZz8KCkkgdmFndWVseSByZWNhbGxpbmcgdGhhdCBtYXli
ZSBpdCB3YXMgbWUgd2hvIHN1Z2dlc3RlZCB0aGlzIGluIHRoZSBwYXN0Li4KCkkga2luZGEgc2Vl
IHRoYXQgdGhpcyBjb3VsZCBiZSB1c2VmdWwgZm9yIGEgY2FzZSB3aGVyZSB1c2Vyc3BhY2UKYWxs
b2NhdGVzIGEgbGFyZ2UgY2h1bmsgb2YgbWVtb3J5IGFuZCB0aGVuIHBlcmZvcm1zIHN1Yi1hbGxv
Y2F0aW9ucyBpbgp0aGUgdXNlcnNwYWNlIGRyaXZlci4gQnV0IGRvIHdlIGhhdmUgYSByZWFsLXdv
cmxkIGV4YW1wbGUgZm9yIHRoaXMgcmlnaHQKbm93PwoKUGxlYXNlIHNlZSBtb3JlIGJlbG93LgoK
PiDCoMKgwqDCoMKgwqDCoCAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBbaW5dIExlbmd0aCBvZiBt
ZW1vcnkgYXJlYSB0byBtYXAgaW4gYnl0ZXMuCj4gwqDCoMKgwqDCoMKgwqDCoCAqCj4gwqDCoMKg
wqDCoMKgwqDCoCAqIE11c3QgYmUgYWxpZ25lZCBieSA0Sy4KPiDCoMKgwqDCoMKgwqDCoMKgICov
Cj4gwqDCoMKgwqDCoMKgwqAgX191NjQgbGVuZ3RoOwo+IAo+IMKgwqDCoMKgwqDCoMKgIC8qCj4g
wqDCoMKgwqDCoMKgwqDCoCAqIFtvdXRdIElPVkEgb2YgbWFwcGVkIG1lbW9yeS4gVXNlcnNwYWNl
IGNhbiB1c2UgdGhpcyBJT1ZBCj4gwqDCoMKgwqDCoMKgwqDCoCAqwqDCoCBkaXJlY3RseSB0byBy
ZWZlciB0byB0aGUgbWVtb3J5IHRvIHNraXAgdXNpbmcgcmVsb2NhdGlvbnMuCj4gwqDCoMKgwqDC
oMKgwqDCoCAqwqDCoCBPbmx5IGF2YWlsYWJsZSBpZiBoYXJkd2FyZSBtZW1vcnkgaXNvbGF0aW9u
IGlzIGVuYWJsZWQuCj4gwqDCoMKgwqDCoMKgwqDCoCAqCj4gwqDCoMKgwqDCoMKgwqDCoCAqwqDC
oCBXaWxsIGJlIHNldCB0byAweGZmZmZfZmZmZl9mZmZmX2ZmZmYgaWYgdW5hdmFpbGFibGUuCj4g
wqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgIF9fdTY0IGlvdmE7Cj4gCj4gwqDC
oMKgwqDCoMKgwqAgLyoKPiDCoMKgwqDCoMKgwqDCoMKgICogW291dF0gSUQgY29ycmVzcG9uZGlu
ZyB0byB0aGUgbWFwcGVkIG1lbW9yeSB0byBiZSB1c2VkIGZvcgo+IMKgwqDCoMKgwqDCoMKgwqAg
KsKgwqAgcmVsb2NhdGlvbnMgb3IgdW5tYXBwaW5nLgo+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDC
oMKgwqDCoMKgwqDCoCBfX3UzMiBtYXBwaW5nX2lkOwo+IMKgwqDCoMKgwqDCoMKgIC8qCj4gwqDC
oMKgwqDCoMKgwqDCoCAqIFtpbl0gRmxhZ3MuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDC
oMKgwqDCoMKgIF9fdTMyIGZsYWdzOwo+IAo+IMKgwqDCoMKgwqDCoMKgIF9fdTMyIHJlc2VydmVk
WzZdOwo+IH07CgpJdCBsb29rcyB0byBtZSB0aGF0IHdlIGFjdHVhbGx5IG5lZWQgYSBiaXQgZGlm
ZmVyZW50IHRoaW5nIGhlcmUuCgpUaGlzIE1BUCBJT0NUTCBtYXBzIGEgcG9ydGlvbiBvZiBhIEdF
TSBhbmQgdGhlbiByZXR1cm5zIHRoZSBtYXBwaW5nX2lkLgpBbmQgSSB0aGluayB3ZSBuZWVkIHNv
bWV0aGluZyBtb3JlIGZsZXhpYmxlIHRoYXQgd2lsbCBhbGxvdyB1cyB0byB1c2UKR0VNIGhhbmRs
ZXMgZm9yIHRoZSByZWxvY2F0aW9uIElEcywgd2hpY2ggc2hvdWxkIGZpdCBuaWNlbHkgd2l0aCB0
aGUKRE1BLXJlc2VydmF0aW9ucy4KCldoYXQgYWJvdXQgYW4gSU9DVEwgdGhhdCB3cmFwcyBHRU0g
aW50byBhbm90aGVyIEdFTT8gV2UgY291bGQgd3JhcCBhCnBvcnRpb24gb2YgR0VNX0EgaW50byBh
IEdFTV9CLCBhbmQgdGhlbiBtYXAgdGhlIEdFTV9CIHVzaW5nIHRoZSBNQVAgSU9DVEwuCgpJdCBj
b3VsZCBiZSBzb21ldGhpbmcgbGlrZSB0aGlzOgoKIyMjIERSTV9URUdSQV9CT19XUkFQCgpzdHJ1
Y3QgZHJtX3RlZ3JhX3dyYXBfYm8gewoJX191MzIgYm9faGFuZGxlX3dyYXBwZWQ7IC8vIG91dAoJ
X191MzIgYm9faGFuZGxlOyAgICAgICAgIC8vIGluCglfX3U2NCBvZmZzZXQ7CglfX3U2NCBsZW5n
dGg7Cn07CgojIyMgRFJNX1RFR1JBX0NIQU5ORUxfTUFQCgpzdHJ1Y3QgZHJtX3RlZ3JhX2NoYW5u
ZWxfbWFwIHsKICAgICAgICBfX3UzMiBjaGFubmVsc19tYXNrOwoJX191MzIgbWFwcGluZ19pZDsK
ICAgICAgICBfX3UzMiBib19oYW5kbGU7CiAgICAgICAgX191MzIgZmxhZ3M7CiAgICAgICAgX191
NjQgaW92YTsKfTsKCj09PQoKVGhpcyBhbGxvd3MgbXVsdGlwbGUgbWFwcGluZ19pZHMgdG8gaGF2
ZSB0aGUgc2FtZSBiYWNraW5nIEdFTSwgc28gdGhlCm1hcHBpbmdfaWQgY291bGQgYmUgcmVzb2x2
ZWQgaW50byBhIEJPIGR1cmluZyBvZiBqb2IncyBzdWJtaXNzaW9uIGZvcgp0aGUgRE1BLXJlc2Vy
dmF0aW9ucyBoYW5kbGluZy4KCkFsc286CgogIDEuIE1heWJlIHRoZSBXUkFQIElPQ1RMIGNvdWxk
IGJlIGEgZ2VuZXJpYyBHRU0gSU9DVEw/CgogIDIuIEkgZ3Vlc3Mgd2UgY291bGQgc3RhcnQgZWFz
eSB3aXRob3V0IHRoZSBXUkFQIElPQ1RMIGFuZAogICAgIGFkZCBpdCBsYXRlciBvbiBvbmNlIHRo
ZXJlIHdpbGwgYmUgYSByZWFsLXdvcmxkIG5lZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
