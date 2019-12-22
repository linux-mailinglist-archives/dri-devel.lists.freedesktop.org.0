Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E4128F03
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 18:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5B6E148;
	Sun, 22 Dec 2019 17:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F8D6E148
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 17:09:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 610842084D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577034559;
 bh=geqtjwNhYhPjKOQTr6T9PrwqzqjPWdQ7WW0r3/weydI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=07BQMQ6Hi57dx/JRXrxf2u1oNEjJQB034YRiconHLdRB0lLKc4Hwfe97RW05Uv/tq
 AKKDhe6nGpWcF/9npYiw5Fq7zftXQnLc13UPWdC0kF0ifrclA2+d+VZlDC8Ya5r7E8
 tfwfwll4JDkG/JDZSwUMYCfglmEytTVVBzC+tQJE=
Received: by mail-lf1-f50.google.com with SMTP id i23so10909632lfo.7
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 09:09:19 -0800 (PST)
X-Gm-Message-State: APjAAAVNJEy5DpiEjTjQhHyIAzpgnJJxiXDAgCCP1RINVcae3jurT3KE
 9/hVoXa79V3FLMcjhK/llbCeIxM1tQn25/hA38E=
X-Google-Smtp-Source: APXvYqwBbqcf1Pd8XBumubRFDeYehrjcMzLoDXNvGe/zro6dSDNnXlMk5m00bIDMFtqyXV44zbdUED/i0ZPagGGw2/Y=
X-Received: by 2002:ac2:5444:: with SMTP id d4mr15264932lfn.49.1577034557468; 
 Sun, 22 Dec 2019 09:09:17 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191220120143eucas1p1c9b01ae8c2e4ecd70423ef9d8001536f@eucas1p1.samsung.com>
 <20191220115653.6487-1-a.swigon@samsung.com>
 <20191220115653.6487-4-a.swigon@samsung.com>
In-Reply-To: <20191220115653.6487-4-a.swigon@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Mon, 23 Dec 2019 02:08:41 +0900
X-Gmail-Original-Message-ID: <CAGTfZH0zfvPYtTv6v+5nq99Gd2PVtg+O20dwf2nbV2j1U0nxCQ@mail.gmail.com>
Message-ID: <CAGTfZH0zfvPYtTv6v+5nq99Gd2PVtg+O20dwf2nbV2j1U0nxCQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/7] interconnect: Allow inter-provider pairs to be
 configured
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjAzIFBNIEFydHVyIMWad2lnb8WEIDxhLnN3
aWdvbkBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBJbiB0aGUgZXh5bm9zLWJ1cyBkZXZmcmVxIGRy
aXZlciBldmVyeSBidXMgaXMgcHJvYmVkIHNlcGFyYXRlbHkgYW5kIGlzCgpJTUhPLCB0aGUgcGF0
Y2ggZGVzY3JpcHRpb24gc2hvdWxkIHNwZWNpZnkgdGhlIG1vcmUgZ2VuZXJhbCBjYXVzZQp3aHkg
aGF2ZSB0byBiZSBjaGFuZ2VkLiBBY3R1YWxseSwgYWxtb3N0IHBlb3BsZSBtaWdodCBub3Qga25v
dwp0aGUgJ2V4eW5vcy1idXMnLiBTbywgZmlyc3RseSwgeW91IGhhdmUgdG8gc3BlY2lmeSB0aGUg
Z2VuZXJhbCBjYXVzZQp3aHkgdGhpcyBwYXRjaCBpcyBuZWNlc3Nhcnkgd2l0aG91dCAnZXh5bm9z
LWJ1cycgd29yZCBhbmQgdGhlbgphZGQgdGhlIHJlYWwgdXNlLWNhc2Ugd2l0aCAnZXh5bm9zLWJ1
cycgZXhhbXBsZS4KCj4gYXNzaWduZWQgYSBzZXBhcmF0ZSBpbnRlcmNvbm5lY3QgcHJvdmlkZXIu
IEhvd2V2ZXIsIHRoZSBpbnRlcmNvbm5lY3QKPiBmcmFtZXdvcmsgZG9lcyBub3QgY2FsbCB0aGUg
Jy0+c2V0JyBjYWxsYmFjayBmb3IgcGFpcnMgb2Ygbm9kZXMgd2hpY2gKPiBiZWxvbmcgdG8gZGlm
ZmVyZW50IHByb3ZpZGVycy4KPgo+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBhIG5ldyBi
b29sZWFuICdpbnRlcl9zZXQnIGZpZWxkIGluIHN0cnVjdAo+IGljY19wcm92aWRlci4gU2V0dGlu
ZyBpdCB0byAndHJ1ZScgZW5hYmxlcyBjYWxsaW5nICctPnNldCcgZm9yCj4gaW50ZXItcHJvdmlk
ZXIgbm9kZSBwYWlycy4gQWxsIGV4aXN0aW5nIHVzZXJzIG9mIHRoZSBpbnRlcmNvbm5lY3QKPiBm
cmFtZXdvcmsgYWxsb2NhdGUgdGhpcyBzdHJ1Y3R1cmUgd2l0aCBremFsbG9jLCBhbmQgYXJlIHRo
ZXJlZm9yZQo+IHVuYWZmZWN0ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8
YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUu
YyAgICAgICAgICAgfCAxMSArKysrKy0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L2ludGVyY29ubmVj
dC1wcm92aWRlci5oIHwgIDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29y
ZS5jIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCj4gaW5kZXggNzRjNjg4OThhMzUwLi5h
MjhiZDBmOGE0OTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCj4g
KysrIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCj4gQEAgLTI1OSwyMyArMjU5LDIyIEBA
IHN0YXRpYyBpbnQgYWdncmVnYXRlX3JlcXVlc3RzKHN0cnVjdCBpY2Nfbm9kZSAqbm9kZSkKPiAg
c3RhdGljIGludCBhcHBseV9jb25zdHJhaW50cyhzdHJ1Y3QgaWNjX3BhdGggKnBhdGgpCj4gIHsK
PiAgICAgICAgIHN0cnVjdCBpY2Nfbm9kZSAqbmV4dCwgKnByZXYgPSBOVUxMOwo+ICsgICAgICAg
c3RydWN0IGljY19wcm92aWRlciAqcDsKPiAgICAgICAgIGludCByZXQgPSAtRUlOVkFMOwo+ICAg
ICAgICAgaW50IGk7Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBwYXRoLT5udW1fbm9kZXM7
IGkrKykgewo+ICAgICAgICAgICAgICAgICBuZXh0ID0gcGF0aC0+cmVxc1tpXS5ub2RlOwo+ICsg
ICAgICAgICAgICAgICBwID0gbmV4dC0+cHJvdmlkZXI7Cj4KPiAtICAgICAgICAgICAgICAgLyoK
PiAtICAgICAgICAgICAgICAgICogQm90aCBlbmRwb2ludHMgc2hvdWxkIGJlIHZhbGlkIG1hc3Rl
ci1zbGF2ZSBwYWlycyBvZiB0aGUKPiAtICAgICAgICAgICAgICAgICogc2FtZSBpbnRlcmNvbm5l
Y3QgcHJvdmlkZXIgdGhhdCB3aWxsIGJlIGNvbmZpZ3VyZWQuCj4gLSAgICAgICAgICAgICAgICAq
Lwo+IC0gICAgICAgICAgICAgICBpZiAoIXByZXYgfHwgbmV4dC0+cHJvdmlkZXIgIT0gcHJldi0+
cHJvdmlkZXIpIHsKPiArICAgICAgICAgICAgICAgLyogYm90aCBlbmRwb2ludHMgc2hvdWxkIGJl
IHZhbGlkIG1hc3Rlci1zbGF2ZSBwYWlycyAqLwo+ICsgICAgICAgICAgICAgICBpZiAoIXByZXYg
fHwgKHAgIT0gcHJldi0+cHJvdmlkZXIgJiYgIXAtPmludGVyX3NldCkpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBwcmV2ID0gbmV4dDsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPiAgICAgICAgICAgICAgICAgfQo+Cj4gICAgICAgICAgICAgICAgIC8qIHNldCB0aGUg
Y29uc3RyYWludHMgKi8KPiAtICAgICAgICAgICAgICAgcmV0ID0gbmV4dC0+cHJvdmlkZXItPnNl
dChwcmV2LCBuZXh0KTsKPiArICAgICAgICAgICAgICAgcmV0ID0gcC0+c2V0KHByZXYsIG5leHQp
Owo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gb3V0Owo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXByb3Zp
ZGVyLmggYi9pbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oCj4gaW5kZXggY2M5
NjViOGZhYjUzLi5iNmFlMGVlNjg2YzUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pbnRl
cmNvbm5lY3QtcHJvdmlkZXIuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXBy
b3ZpZGVyLmgKPiBAQCAtNDEsNiArNDEsNyBAQCBzdHJ1Y3QgaWNjX25vZGUgKm9mX2ljY194bGF0
ZV9vbmVjZWxsKHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKnNwZWMsCj4gICAqIEB4bGF0ZTogcHJv
dmlkZXItc3BlY2lmaWMgY2FsbGJhY2sgZm9yIG1hcHBpbmcgbm9kZXMgZnJvbSBwaGFuZGxlIGFy
Z3VtZW50cwo+ICAgKiBAZGV2OiB0aGUgZGV2aWNlIHRoaXMgaW50ZXJjb25uZWN0IHByb3ZpZGVy
IGJlbG9uZ3MgdG8KPiAgICogQHVzZXJzOiBjb3VudCBvZiBhY3RpdmUgdXNlcnMKPiArICogQGlu
dGVyX3NldDogd2hldGhlciBpbnRlci1wcm92aWRlciBwYWlycyB3aWxsIGJlIGNvbmZpZ3VyZWQg
d2l0aCBAc2V0Cj4gICAqIEBkYXRhOiBwb2ludGVyIHRvIHByaXZhdGUgZGF0YQo+ICAgKi8KPiAg
c3RydWN0IGljY19wcm92aWRlciB7Cj4gQEAgLTUzLDYgKzU0LDcgQEAgc3RydWN0IGljY19wcm92
aWRlciB7Cj4gICAgICAgICBzdHJ1Y3QgaWNjX25vZGUqICgqeGxhdGUpKHN0cnVjdCBvZl9waGFu
ZGxlX2FyZ3MgKnNwZWMsIHZvaWQgKmRhdGEpOwo+ICAgICAgICAgc3RydWN0IGRldmljZSAgICAg
ICAgICAgKmRldjsKPiAgICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgIHVzZXJzOwo+ICsg
ICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgaW50ZXJfc2V0Owo+ICAgICAgICAgdm9pZCAg
ICAgICAgICAgICAgICAgICAgKmRhdGE7Cj4gIH07Cj4KPiAtLQo+IDIuMTcuMQo+CgoKLS0gCkJl
c3QgUmVnYXJkcywKQ2hhbndvbyBDaG9pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
