Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C8C35BC13
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 10:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF06E223;
	Mon, 12 Apr 2021 08:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21696E222
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:26:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5-20020a05600c0245b029011a8273f85eso6363308wmj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UaKmap8VBg3qA/HYVgj8+5VJG7Je5+TY240hCc5hhQU=;
 b=D9bGG0D89YcdKYQVNMxqqEfkh5jnzAnYR+Z6iaiehla9H3/mJR7c0nc7W7/eAvgyum
 kRailtqXCfNQ85Q3Eb0gydmc0l+jUk4bujbqief4/2iss6t+H3yH1oR8OSj9Cgy+L2hv
 lXZHSsQGs71LQ4pU5ngrTQNTUmSIAaAHrTfgtNHcu4osdU0UFQBFfRDaNV/er6qwFjDY
 AGh8F6MyNG9DcSHPMH0q44SlYTFU7zLdKQAyiwLRoYgIxpZ6gg9UsCLqhqjwDBx20N2S
 boUYhk2Ybuy9TRkOE/X1wJGKMxWutsHaJvr30jjeTmKHh+K8exEx9l/3yks4rBBGn4N+
 /BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UaKmap8VBg3qA/HYVgj8+5VJG7Je5+TY240hCc5hhQU=;
 b=myHNKljKoxTxtTIv9RSDTSe5KannyoFWeipVj0uMhwYCFrhSgEp/tYlFAAer3G302b
 ab7miCEGp3vGQkwP/EpFcYd6aAhNkKJkX21bGuwO9mD/E7OefMoRGiWC2oyJMXo3cmrz
 BVG2HChpv6Mvy9F7TOMhVq8dgDT/LSGkOL6HO07G6Y3kGDyzUu3M6fOSn3DqjInhJ/0i
 7CU5dxzV5qXcD678OCNvBSan+5HyrFhCDqe3hfqBUEYP0aPJKDVOWnrj2PxCMzmoSTDl
 AhpkAShC0R1eNOIX+BTjwPwaXe3wZcY7Dgn0BlE14kBwNFdqHCVMK6TLSNiGHHu//OiC
 R4sQ==
X-Gm-Message-State: AOAM533JnnN+FqgWhYM9RXMFmRmmPs4GUgwYLzGck36pH0hEbJYiARbo
 miSRo3I3RtvL9aMMcUIazZN2Cw==
X-Google-Smtp-Source: ABdhPJwsfDxCETIVflyHJroKHGN4n7AsriRCdtoYopc7TlOeEXwsW8tArL9wGxUxG0peFRZCfJVPqA==
X-Received: by 2002:a1c:7ed3:: with SMTP id
 z202mr18155336wmc.136.1618215992476; 
 Mon, 12 Apr 2021 01:26:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4c21:b00e:ff79:bf20?
 ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id x25sm3642204wmj.34.2021.04.12.01.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 01:26:32 -0700 (PDT)
Subject: Re: [PATCH] gpu/drm: mediatek: hdmi: check for valid modes on MT8167
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20210409084308.481185-1-narmstrong@baylibre.com>
 <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e3bd95df-f5c9-2791-8112-348592b7a513@baylibre.com>
Date: Mon, 12 Apr 2021 10:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-gqN2HCLg6AABsXYzJoBxpN8FkMfjqWFu2q=6noiY1qg@mail.gmail.com>
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDQvMjAyMSAwMDo0MSwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiBIaSwgTmVpbDoKPiAK
PiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDIx5bm0NOac
iDnml6Ug6YCx5LqUIOS4i+WNiDQ6NDPlr6vpgZPvvJoKPj4KPj4gT24gTVQ4MTY3LCBvbmx5IENF
QSBtb2RlcyBhbmQgYW55dGhpbmcgdXNpbmcgYSBjbG9jayBiZWxvdyAxNDg1MDAgaXMKPj4gc3Vw
cG9ydGVkIGZvciBIRE1JLiBUaGlzIGNoYW5nZSBhZGRzIHNvbWUgY2hlY2tzIHRvIG1ha2Ugc3Vy
ZSB0aGUKPj4gdmlkZW8gZm9ybWF0IGlzIE9LIGZvciBNVDgxNjcuCj4gCj4gSSB0aGluayB0aGlz
IHBhdGNoIHNob3VsZCBiZSBzZXBhcmF0ZWQgdG8gMyBwYXRjaGVzLiBjaGVjayBDRUEgbW9kZSwK
PiBjaGVjayBjbG9jaywgYWRkIG10ODE2NyBoZG1pIHN1cHBvcnQuCgpPawoKPiAKPj4KPj4gU2ln
bmVkLW9mZi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4gLS0t
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDE3ICsrKysrKysrKysr
KysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+PiBpbmRleCA4ZWU1NWY5ZTI5NTQuLjk5MWUyZTkzNWI5
MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPj4gQEAgLTE0OCw2ICsx
NDgsOCBAQCBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSB7Cj4+Cj4+ICBzdHJ1Y3QgbXRrX2hkbWlf
Y29uZiB7Cj4+ICAgICAgICAgYm9vbCB0el9kaXNhYmxlZDsKPj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIG1heF9tb2RlX2Nsb2NrOwo+PiArICAgICAgIGJvb2wgY2VhX21vZGVzX29ubHk7Cj4+ICB9
Owo+Pgo+PiAgc3RydWN0IG10a19oZG1pIHsKPj4gQEAgLTEyNTksNiArMTI2MSwxMyBAQCBzdGF0
aWMgaW50IG10a19oZG1pX2Nvbm5fbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
biwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQkFEOwo+PiAgICAgICAg
IH0KPj4KPj4gKyAgICAgICBpZiAoaGRtaS0+Y29uZi0+Y2VhX21vZGVzX29ubHkgJiYgIWRybV9t
YXRjaF9jZWFfbW9kZShtb2RlKSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0JBRDsK
Pj4gKwo+PiArICAgICAgIGlmIChoZG1pLT5jb25mLT5tYXhfbW9kZV9jbG9jayAmJgo+PiArICAg
ICAgICAgICBtb2RlLT5jbG9jayA+IGhkbWktPmNvbmYtPm1heF9tb2RlX2Nsb2NrKQo+PiArICAg
ICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKPj4gKwo+PiAgICAgICAgIGlmICht
b2RlLT5jbG9jayA8IDI3MDAwKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tf
TE9XOwo+PiAgICAgICAgIGlmIChtb2RlLT5jbG9jayA+IDI5NzAwMCkKPj4gQEAgLTE4MTAsMTAg
KzE4MTksMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mIG10a19oZG1pX2Nv
bmZfbXQyNzAxID0gewo+PiAgICAgICAgIC50el9kaXNhYmxlZCA9IHRydWUsCj4+ICB9Owo+Pgo+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mIG10a19oZG1pX2NvbmZfbXQ4MTY3
ID0gewo+PiArICAgICAgIC5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMCwKPj4gKyAgICAgICAuY2Vh
X21vZGVzX29ubHkgPSB0cnVlLAo+PiArfTsKPj4gKwo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbXRrX2RybV9oZG1pX29mX2lkc1tdID0gewo+PiAgICAgICAgIHsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWhkbWkiLAo+PiAgICAgICAgICAgLmRhdGEgPSAmbXRr
X2hkbWlfY29uZl9tdDI3MDEsCj4+ICAgICAgICAgfSwKPj4gKyAgICAgICB7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE2Ny1oZG1pIiwKPiAKPiAibWVkaWF0ZWssbXQ4MTY3LWhkbWkiIGRv
ZXMgbm90IGV4aXN0IGluIGJpbmRpbmcgZG9jdW1lbnQsIHNvIGFkZCB0aGlzCj4gdG8gYmluZGlu
ZyBkb2N1bWVudCBmaXJzdC4KPiBJbiBhZGRpdGlvbiwgY291bGQgeW91IGFsc28gdHJhbnNmZXIg
bWVkaWF0ZWssaGRtaS50eHQgdG8geWFtbCBmb3JtYXQ/CgpTdXJlCgpUaGFua3MsCk5laWwKCj4g
Cj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+IAo+PiArICAgICAgICAgLmRhdGEgPSAmbXRrX2hk
bWlfY29uZl9tdDgxNjcsCj4+ICsgICAgICAgfSwKPj4gICAgICAgICB7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE3My1oZG1pIiwKPj4gICAgICAgICB9LAo+PiAgICAgICAgIHt9Cj4+IC0t
Cj4+IDIuMjUuMQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
