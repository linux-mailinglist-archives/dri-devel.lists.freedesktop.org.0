Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91531BA76
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 14:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9BB6E20A;
	Mon, 15 Feb 2021 13:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779646E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 13:39:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l17so6268578wmq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WcZeMgKeQNRpvq9MwPMNYubvJxyegqMh4KmSZYLEgx0=;
 b=IF4PpdTkKaaOLwi0u+yBfhkCaYn4Ag1tecxGGrBrgFIwtFNE5F8a78ID3gdbtn5oZc
 4Wf2b+2kHqFZ3e8neThdlFjIPl0oUZLmneft7f2jb7VkX4TXgH4dFLQqLrWDXab63i+U
 yh7/cGsOUea+K43WYOw8qCz5bAHio+PrZEW48uBlMpxpv941e5RWc1EkmnjXQbBDZz+N
 VSUMPBER0flbnqgCmTgs+aPGv25NV6v/5G3Yes2yWxlsXSgkHzpYaQks4iGwhWlQHG/F
 dBklwiI/1CpfKx91+9z8nnIa3zV4ljtU9sjWzTQpaNckJf/LvVcnLZP86pQO1s6QEgoc
 LapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WcZeMgKeQNRpvq9MwPMNYubvJxyegqMh4KmSZYLEgx0=;
 b=dW28aDTe8zPuER1rHkIIk6u2wj4k7nkNVRMkVbna2E49+GdMX+LFzSIYDTBW4Xgbkb
 brFvzxymCgfxYdjdSDa/KPR59ma/Xs6TnFdMd3+u+2lc2XMroaiU4JuciGBECKEaBNbe
 LvbFa5fLQDesohBneSHso5G2MFjujVfnkINM0P92f03T5jA9hsbceXFN964Hh92x70gk
 pLHbSkc2xT1QV+eJRiIf60z1NNllfrCLl05H8GcQB5gP9x4CLdNEm6L1V+cwj7Vn6gN8
 2EwTzetdIofrtyf4C/TxiXtktR3uHMkUHho3JVFXE0H3rT969n0j4vXW6ZnBVY+JFv/Q
 gVew==
X-Gm-Message-State: AOAM530CupxDqDb1Fzh8u9TNXvvEq0TBGJlfxE7C4OtYKBARZaYiom2K
 Q4zO5WGdFDiLMhqDonKL87dtlOtoQERRAJwa
X-Google-Smtp-Source: ABdhPJwAkxP9CDsfIB26tbaGMKucmjEkYEj36UELHihnOGTXWbtqqHHyhk2PcolSrGjEspD6bFU8xg==
X-Received: by 2002:a05:600c:1552:: with SMTP id
 f18mr14675089wmg.46.1613396375693; 
 Mon, 15 Feb 2021 05:39:35 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:3627:e500:c425:5f5c?
 ([2a01:e0a:90c:e290:3627:e500:c425:5f5c])
 by smtp.gmail.com with ESMTPSA id d20sm24654853wrc.12.2021.02.15.05.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 05:39:35 -0800 (PST)
Subject: Re: ITE66121 HDMI driver
To: Paul Cercueil <paul@crapouillou.net>
References: <DRRHOQ.EW1770YWN4DN@crapouillou.net>
 <828487f5-1cbf-1763-94c3-f0c722fcf2aa@baylibre.com>
 <U2KKOQ.KC88EH9WAG4I@crapouillou.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <499fa56b-f808-41f9-aa41-8c959cc4699a@baylibre.com>
Date: Mon, 15 Feb 2021 14:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <U2KKOQ.KC88EH9WAG4I@crapouillou.net>
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
Cc: Phong LE <ple@baylibre.com>, od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTUvMDIvMjAyMSAxMzowMSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiAKPiAKPiBMZSBsdW4u
IDE1IGbDqXZyLiAyMDIxIMOgIDEwOjA1LCBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+IGEgw6ljcml0IDoKPj4gSGksCj4+Cj4+IE9uIDE0LzAyLzIwMjEgMDA6NTQsIFBh
dWwgQ2VyY3VlaWwgd3JvdGU6Cj4+PiDCoEhpIFBob25nIGFuZCBOZWlsLAo+Pj4KPj4+IMKgSSBz
ZWUgeW91IHNlbnQgYSBwYXRjaHNldCB0byBzdXBwb3J0IHRoZSBJVEU2NjEyMSBIRE1JIHRyYW5z
bWl0dGVyLCBsYXN0IHZlcnNpb24gYmVpbmcgdGhlIFYyIGJhY2sgaW4gTWFyY2ggMjAyMC4KPj4+
Cj4+PiDCoERvIHlvdSBzdGlsbCBwbGFuIHRvIG1haW5saW5lIGl0Pwo+Pgo+PiBZZXMsIHdlIHN0
aWxsIHBsYW4gdG8gbWFpbmxpbmUgaXQuCj4gCj4gT2ssIGdyZWF0IQo+IAo+Pj4KPj4+IMKgSSBk
byBoYXZlIGEgZGV2aWNlIHdpdGggYSBJVEU2NjEyMSBjaGlwLCBzbyBJIGNhbiBoZWxwIHRvIGNs
ZWFuIHRoZSBkcml2ZXIgYW5kIGhhdmUgaXQgbWFpbmxpbmVkLiBCdXQgcmlnaHQgbm93IEkgY2Fu
bm90IGdldCB0aGUgZHJpdmVyIHRvIHdvcmssIHdoaWxlIHRoZSBjaGlwIGlzIHByb3Blcmx5IGRl
dGVjdGVkIGFuZCBjb3JyZWN0IEREQyBkYXRhIGlzIHJlYWQsLCBteSBQQyBtb25pdG9yIGRvZXMg
bm90IGRldGVjdCBhbnkgc2lnbmFsLgo+Pgo+PiBIYXZpbmcgRERDIHJlYWQgd29ya2luZyBpcyBh
IGdvb2QgcG9pbnQuLi4KPj4KPj4gRGlkIHlvdSBjaGVjayB0aGUgRFBJIGRhdGEgc2V0dXAgPyB0
aGUgY2hpcCBzdXBwb3J0cyBkdWFsIGRhdGEgcmF0ZSBpbnB1dCwgYW5kIHRoZSBsYXN0IHZlcnNp
b24gb25seSBzdXBwb3J0ZWQgaXQgdmlhIGEgRFQgcHJvcGVydHkuCj4gCj4gSWYgImR1YWwgZGF0
YSByYXRlIiBtZWFucyB0d28gcGl4ZWxzIHBlciBwaXhjbG9jayB0aWNrLCB0aGVuIG15IFNvQyBk
b2VzIG5vdCBzdXBwb3J0IGl0LiBJIGRpZCB0cnkgYm90aCBtb2RlcyB0aG91Z2guCj4gCj4gVGhl
IG90aGVyIHRoaW5nIGlzIHRoYXQgbXkgU29DIGhhcyBubyBWREUvSERFIHBpbnMsIHNvIChhY2Nv
cmRpbmcgdG8gdGhlIG1hbnVhbCkgSSBoYXZlIHRvIGhhdmUgdGhlIGNoaXAgcmVjcmVhdGUgdGhl
c2Ugc2lnbmFscyBmcm9tIHZpZGVvbW9kZSBpbmZvcm1hdGlvbi4gV2hpY2ggSSBkaWQsIGFuZCBJ
IGdldCB0aGUgInZpZGVvIHN0YWJsZSIgc3RhdHVzIGJpdCwgYnV0IEkgc3RpbGwgY2Fubm90IGdl
dCBhbnl0aGluZyBvbiBzY3JlZW4uCgpXaGF0IGlzIHRoZSBtb2RlIHlvdSdyZSB0cnlpbmcgdG8g
YWNoaWV2ZSA/CgpsZXQgbWUgc2VuZCBhIHYzIHdpdGggYWxsIHRoZSBjb21tZW50cyBmcm9tIHYy
IGZpeGVkIGFuZCByZS1zdGFydCBhIGRpc2N1c3Npb24gZnJvbSB0aGlzIHBhdGNoc2V0LgoKTmVp
bAoKPiAKPiBDaGVlcnMsCj4gLVBhdWwKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
