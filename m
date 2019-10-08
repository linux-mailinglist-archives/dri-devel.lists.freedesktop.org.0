Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08517D07F8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685866E8FB;
	Wed,  9 Oct 2019 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81536E87A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 17:17:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w12so20347881wro.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 10:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZE8PGEIi76YGMsXY8il0PtLXvzSxK3hR1oe5Tgh3d28=;
 b=Uz3YsBFWNAAWHjzIc7VnZmq7crlyWRtuI6zjlmHLowzri9VdhD5ABrURDaKX1Pm+tw
 rA5M2VYNiGlPS4BU51z6djERYun9TSc02yeMQyCl46M0uCIojyoBmYs8hp45pBeYz3oo
 OXbXd2yTSrXR/7r8z7Vgvzz0pLERlIFwg6WaxzGhRF3xCE37mPjTiDnlukZERHWJSJnR
 Fd3po/t0u7tnkJbZm2O0XWNddgQ97dk3uJIA7KpHVBfXGpGyBCrQ18dlTN2kHOPgG3mT
 hRAsRK6U+Y6CiFX1CiG7hXJ4qy/S2PIudCK73z6B/9nfPG2+IkDGxE1/c1kxP/OsQL7J
 GACg==
X-Gm-Message-State: APjAAAWqbSjYsuCNL1MCY373O3BxuT+/NtU8Im/n5yUiiWVxN4Tv9d69
 sZ9HACVeKLPot9B0tl2LBJsz+zxp
X-Google-Smtp-Source: APXvYqwdvHBwsG2mR58wj08mieKyPRIn3OlKuHJNjL0SDJXT3RQKCGDdtrc6V1G1wPnCYqtirzLW8Q==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr6371932wrw.294.1570555053468; 
 Tue, 08 Oct 2019 10:17:33 -0700 (PDT)
Received: from [192.168.1.19] (bgs228.neoplus.adsl.tpnet.pl. [83.28.82.228])
 by smtp.gmail.com with ESMTPSA id t123sm4621928wma.40.2019.10.08.10.17.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 10:17:32 -0700 (PDT)
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To: Rob Herring <robh+dt@kernel.org>, Jean-Jacques Hiblot <jjhiblot@ti.com>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
 <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
 <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <80378f6c-24ed-ff6b-fef5-1865c3f84b60@gmail.com>
Date: Tue, 8 Oct 2019 19:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZE8PGEIi76YGMsXY8il0PtLXvzSxK3hR1oe5Tgh3d28=;
 b=Cu35hN4/32NXTftmvQFvaafUTxd+iPBleiXiw2Ks90GzL30vMoWvDweANUS8D9JqlC
 mwMIbnX7h19b95PsHYAOQ2qP6wjwLRf5+ZQWojwf/07NznY4AF4Q9lpo1jCyMC0K6mmA
 A0tHJFLGCONzrPvtzsJu5lyImqH4odlEr5NoGNiVr/OcKrlIvV0gutSashqEfWpY4SBb
 eYE9/ODb5Rgsut9KNYw+7LXDWvwcunScgV5MW1P10IN1BJgAui4R8kAcQshqcuPnsD0Y
 hSdx794zEJs2pAIsQusO1VDxDz0PQQlPToOyGvQ60vCdyaiQ9bPQxm4DxlmFJ/F5VOvB
 endA==
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvOC8xOSA1OjAwIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUdWUsIE9jdCA4LCAy
MDE5IGF0IDg6MzAgQU0gSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPiB3cm90
ZToKPj4KPj4gUm9iLAo+Pgo+PiBPbiAwOC8xMC8yMDE5IDE0OjUxLCBKZWFuLUphY3F1ZXMgSGli
bG90IHdyb3RlOgo+Pj4gSGkgUm9iLAo+Pj4KPj4+IE9uIDA3LzEwLzIwMTkgMTg6MTUsIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+Pj4+IFBsZWFzZSBzZW5kIERUIGJpbmRpbmdzIHRvIERUIGxpc3Qgb3Ig
aXQncyBuZXZlciBpbiBteSBxdWV1ZS4gSU9XLAo+Pj4+IHNlbmQgcGF0Y2hlcyB0byB0aGUgbGlz
dHMgdGhhdCBnZXRfbWFpbnRhaW5lcnMucGwgdGVsbHMgeW91IHRvLgo+Pj4+Cj4+Pj4gT24gTW9u
LCBPY3QgNywgMjAxOSBhdCA3OjQ1IEFNIEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRp
LmNvbT4KPj4+PiB3cm90ZToKPj4+Pj4gQWRkIERUIGJpbmRpbmcgZm9yIGxlZC1iYWNrbGlnaHQu
Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90
QHRpLmNvbT4KPj4+Pj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21w
c29uQGxpbmFyby5vcmc+Cj4+Pj4+IFJldmlld2VkLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2Vi
YXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgLi4uL2JpbmRp
bmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjgKPj4+Pj4gKysrKysrKysr
KysrKysrKysrKwo+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4+Pj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4+Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+Pj4+IFBsZWFzZSBtYWtlIHRo
aXMgYSBEVCBzY2hlbWEuCj4+Pgo+Pj4gT0suCj4+Pgo+Pj4gQlRXIEkgdXNlZCAibWFrZSBkdF9i
aW5kaW5nX2NoZWNrIiBidXQgaGFkIHRvIGZpeCBhIGNvdXBsZSBvZiBZQU1Mcwo+Pj4gZmlsZSB0
byBnZXQgaXQgdG8gd29yay4gRG8geW91IGhhdmUgYSBrZXJuZWwgdHJlZSB3aXRoIGFscmVhZHkg
YWxsIHRoZQo+Pj4gWUFNTCBmaWxlcyBpbiBnb29kIHNoYXBlID8gT3IgZG8geW91IHdhbnQgbWUg
dG8gcG9zdCB0aGUgY2hhbmdlcyB0bwo+Pj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcgPwo+
Pj4KPj4+Cj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdAo+Pj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+Pj4+PiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xp
Z2h0LnR4dAo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAwMDAw
MDAuLjRjN2RmYmU3ZjY3YQo+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+ICsrKwo+Pj4+PiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xp
Z2h0LnR4dAo+Pj4+PiBAQCAtMCwwICsxLDI4IEBACj4+Pj4+ICtsZWQtYmFja2xpZ2h0IGJpbmRp
bmdzCj4+Pj4+ICsKPj4+Pj4gK1RoaXMgYmluZGluZyBpcyB1c2VkIHRvIGRlc2NyaWJlIGEgYmFz
aWMgYmFja2xpZ2h0IGRldmljZSBtYWRlIG9mCj4+Pj4+IExFRHMuCj4+Pj4+ICtJdCBjYW4gYWxz
byBiZSB1c2VkIHRvIGRlc2NyaWJlIGEgYmFja2xpZ2h0IGRldmljZSBjb250cm9sbGVkIGJ5Cj4+
Pj4+IHRoZSBvdXRwdXQgb2YKPj4+Pj4gK2EgTEVEIGRyaXZlci4KPj4+Pj4gKwo+Pj4+PiArUmVx
dWlyZWQgcHJvcGVydGllczoKPj4+Pj4gKyAgLSBjb21wYXRpYmxlOiAibGVkLWJhY2tsaWdodCIK
Pj4+Pj4gKyAgLSBsZWRzOiBhIGxpc3Qgb2YgTEVEcwo+Pj4+ICdsZWRzJyBpcyBhbHJlYWR5IHVz
ZWQgYXMgYSBub2RlIG5hbWUgYW5kIG1peGluZyBpcyBub3QgaWRlYWwuCgpmb3IgdGhlIHJlY29y
ZDogY2hpbGQgbm9kZSBuYW1lcyAoaWYgdGhhdCB3YXMgd2hhdCB5b3UgaGFkIG9uIG1pbmQpCmhh
dmUgc2luZ3VsYXIgZm9ybSAnbGVkJy4KCj4+Pj4gV2UgYWxyZWFkeSBoYXZlICdmbGFzaC1sZWRz
JyBpbiB1c2UgYW5kIHdpdGggdGhlIHNhbWUgZGVmaW5pdGlvbiwgc28KPj4+PiBsZXRzIGNvbnRp
bnVlIHRoYXQgYW5kIHVzZSAnYmFja2xpZ2h0LWxlZHMnLgo+Pj4gT0sKPj4KPj4gSSBhbSB0YWtp
bmcgdGhhdCBiYWNrLiBJIGhhdmUgYWRkZWQgb2ZfZ2V0X2xlZCgpIGFuZCBkZXZtX29mX2dldF9s
ZWQoKQo+PiB0byB0aGUgTEVEIGNvcmUgdG8gbWFrZSBpdCBlYXNpZXIgdG8gZ2V0IGEgTEVEIGZy
b20gdGhlIERULiBJIG1vZGVsZWQKPj4gdGhlIGludGVyZmFjZSBsaWtlIGl0IGlzIGRvbmUgZm9y
IFBXTSwgUEhZcyBvciBjbG9ja3MuIFRoZSBwcm9wZXJ0eQo+PiBjb250YWluaW5nIGxpc3QvYXJy
YXkgb2YgcGhhbmRsZSAgaXMgYWx3YXlzIG5hbWVkIHRoZSBzYW1lLiBUbyBnZXQgb25lCj4+IHBh
cnRpY3VsYXIgUFdNL1BIWS9jbG9jaywgYSBpZGVudGlmaWVyIChuYW1lIG9yIGludGVnZXIpIG11
c3QgYmUgcHJvdmlkZWQuCj4gCj4gSXQgY2FuIGJlIGRvbmUgYXMgd2UgZG8gc3VwcG9ydCB0aGF0
IHdpdGggJy1ncGlvcycsIGJ1dCB5ZXMsIGl0IGlzIGEKPiBiaXQgbW9yZSBwYWluZnVsIHRvIGRl
YWwgd2l0aC4KPiAKPj4gU28gdW5sZXNzIHRoZXJlIGlzIGEgc3Ryb25nIGluY2VudGl2ZSB0byBk
byBvdGhlcndpc2UgSSdzIHJhdGhlciBrZWVwCj4+IHRoaXMgbmFtZSBoZXJlLgo+IAo+IEluIHRo
YXQgY2FzZSwgdGhpcyBuZWVkcyB0byBiZSBkb2N1bWVudGVkIGFzIGEgY29tbW9uIExFRCBiaW5k
aW5nLCBub3QKPiBzb21ldGhpbmcgaGlkZGVuIGF3YXkgaW4gdGhpcyBiaW5kaW5nLgo+IAo+IFJv
Ygo+IAoKLS0gCkJlc3QgcmVnYXJkcywKSmFjZWsgQW5hc3pld3NraQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
