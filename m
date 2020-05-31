Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E61E9496
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 02:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235F389F5F;
	Sun, 31 May 2020 00:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A443089F5F
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 00:01:38 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F6E720776
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 00:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590883298;
 bh=2p4SBOzIcxqldDQV+EgA8g75sZR4n3jmr6ytOgA1hPs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LAZ2ml8d4tllly6yUKcA/bFgxj/GgNzOm0gXCJCNiuDci5YuQ5r4pMox+T1OJYV72
 5PjXNv1Y5hW8w24ZrhtxIMQ3p8jB3cTQoOBZT4n+D+hRCfoeplyK67Lrya9geraBXN
 ab34i9F2dcOBC5NYC1slzpGFwKQ7Cuys08WeKMAk=
Received: by mail-lj1-f169.google.com with SMTP id u10so2481847ljj.9
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 17:01:38 -0700 (PDT)
X-Gm-Message-State: AOAM531KmhskLtFW85B4NyJl/l++ZWGTxQpK0UIDnalt4Eel+ndPwTjk
 3Tmd1H62NliDnNLYD34SJL0MMdPfQ5w8DGBJ5ow=
X-Google-Smtp-Source: ABdhPJzU/8i47JcqsMEUq8jJ7WZ2YavPcT4Y4tu7MIIVGyb75w7ekgPJ3jPOCNAUup5FQRQs5D0G9kNh1jYivsMC+Lo=
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr7700307ljn.100.1590883296477; 
 Sat, 30 May 2020 17:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e@eucas1p2.samsung.com>
 <20200529163200.18031-1-s.nawrocki@samsung.com>
 <20200529163200.18031-2-s.nawrocki@samsung.com>
In-Reply-To: <20200529163200.18031-2-s.nawrocki@samsung.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 31 May 2020 09:01:00 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1yM0KRaEF5VTs2juTm+yrK9VqQZxWjdNf_ffjGHWPLsg@mail.gmail.com>
Message-ID: <CAGTfZH1yM0KRaEF5VTs2juTm+yrK9VqQZxWjdNf_ffjGHWPLsg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/6] dt-bindings: exynos-bus: Add documentation for
 interconnect properties
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3lsd2VzdGVyLAoKCk9uIFNhdCwgTWF5IDMwLCAyMDIwIGF0IDE6MzIgQU0gU3lsd2VzdGVy
IE5hd3JvY2tpCjxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEFkZCBkb2N1bWVu
dGF0aW9uIGZvciBuZXcgb3B0aW9uYWwgcHJvcGVydGllcyBpbiB0aGUgZXh5bm9zIGJ1cyBub2Rl
czoKPiBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQsICNpbnRlcmNvbm5lY3QtY2VsbHMuCj4g
VGhlc2UgcHJvcGVydGllcyBhbGxvdyB0byBzcGVjaWZ5IHRoZSBTb0MgaW50ZXJjb25uZWN0IHN0
cnVjdHVyZSB3aGljaAo+IHRoZW4gYWxsb3dzIHRoZSBpbnRlcmNvbm5lY3QgY29uc3VtZXIgZGV2
aWNlcyB0byByZXF1ZXN0IHNwZWNpZmljCj4gYmFuZHdpZHRoIHJlcXVpcmVtZW50cy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBTeWx3ZXN0ZXIgTmF3cm9ja2kgPHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+Cj4g
LS0tCj4gQ2hhbmdlcyBmb3IgdjU6Cj4gIC0gZXh5bm9zLGludGVyY29ubmVjdC1wYXJlbnQtbm9k
ZSByZW5hbWVkIHRvIHNhbXN1bmcsaW50ZXJjb25uZWN0LXBhcmVudAo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4dCB8IDE1ICsr
KysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kZXZmcmVxL2V4eW5vcy1idXMudHh0Cj4gaW5kZXggZTcxZjc1Mi4uZTBkMmRhYSAxMDA2
NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlu
b3MtYnVzLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kZXZm
cmVxL2V4eW5vcy1idXMudHh0Cj4gQEAgLTUxLDYgKzUxLDExIEBAIE9wdGlvbmFsIHByb3BlcnRp
ZXMgb25seSBmb3IgcGFyZW50IGJ1cyBkZXZpY2U6Cj4gIC0gZXh5bm9zLHNhdHVyYXRpb24tcmF0
aW86IHRoZSBwZXJjZW50YWdlIHZhbHVlIHdoaWNoIGlzIHVzZWQgdG8gY2FsaWJyYXRlCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgdGhlIHBlcmZvcm1hbmNlIGNvdW50IGFnYWluc3QgdG90YWwg
Y3ljbGUgY291bnQuCj4KPiArT3B0aW9uYWwgcHJvcGVydGllcyBmb3IgaW50ZXJjb25uZWN0IGZ1
bmN0aW9uYWxpdHkgKFFvUyBmcmVxdWVuY3kgY29uc3RyYWludHMpOgo+ICstIHNhbXN1bmcsaW50
ZXJjb25uZWN0LXBhcmVudDogcGhhbmRsZSB0byB0aGUgcGFyZW50IGludGVyY29ubmVjdCBub2Rl
OyBmb3IKPiArICBwYXNzaXZlIGRldmljZXMgc2hvdWxkIHBvaW50IHRvIHNhbWUgbm9kZSBhcyB0
aGUgZXh5bm9zLHBhcmVudC1idXMgcHJvcGVydHkuCj4gKy0gI2ludGVyY29ubmVjdC1jZWxsczog
c2hvdWxkIGJlIDAKPiArCj4gIERldGFpbGVkIGNvcnJlbGF0aW9uIGJldHdlZW4gc3ViLWJsb2Nr
cyBhbmQgcG93ZXIgbGluZSBhY2NvcmRpbmcgdG8gRXh5bm9zIFNvQzoKPiAgLSBJbiBjYXNlIG9m
IEV4eW5vczMyNTAsIHRoZXJlIGFyZSB0d28gcG93ZXIgbGluZSBhcyBmb2xsb3dpbmc6Cj4gICAg
ICAgICBWRERfTUlGIHwtLS0gRE1DCj4gQEAgLTE4NSw4ICsxOTAsOSBAQCBFeGFtcGxlMToKPiAg
ICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPgo+ICBFeGFtcGxlMiA6Cj4gLSAgICAgICBUaGUgYnVzIG9mIERNQyAoRHluYW1p
YyBNZW1vcnkgQ29udHJvbGxlcikgYmxvY2sgaW4gZXh5bm9zMzI1MC5kdHNpCj4gLSAgICAgICBp
cyBsaXN0ZWQgYmVsb3c6Cj4gKyAgICAgICBUaGUgYnVzIG9mIERNQyAoRHluYW1pYyBNZW1vcnkg
Q29udHJvbGxlcikgYmxvY2sgaW4gZXh5bm9zMzI1MC5kdHNpIGlzCj4gKyAgICAgICBsaXN0ZWQg
YmVsb3cuIEFuIGludGVyY29ubmVjdCBwYXRoICJidXNfbGNkMCAtLSBidXNfbGVmdGJ1cyAtLSBi
dXNfZG1jIgo+ICsgICAgICAgaXMgZGVmaW5lZCBmb3IgZGVtb25zdHJhdGlvbiBwdXJwb3Nlcy4K
Pgo+ICAgICAgICAgYnVzX2RtYzogYnVzX2RtYyB7Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAic2Ftc3VuZyxleHlub3MtYnVzIjsKPiBAQCAtMzc2LDEyICszODIsMTUgQEAgRXhhbXBs
ZTIgOgo+ICAgICAgICAgJmJ1c19kbWMgewo+ICAgICAgICAgICAgICAgICBkZXZmcmVxLWV2ZW50
cyA9IDwmcHBtdV9kbWMwXzM+LCA8JnBwbXVfZG1jMV8zPjsKPiAgICAgICAgICAgICAgICAgdmRk
LXN1cHBseSA9IDwmYnVjazFfcmVnPjsgICAgICAvKiBWRERfTUlGICovCj4gKyAgICAgICAgICAg
ICAgICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4gICAgICAgICAgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiAgICAgICAgIH07Cj4KPiAgICAgICAgICZidXNfbGVmdGJ1cyB7Cj4gICAgICAg
ICAgICAgICAgIGRldmZyZXEtZXZlbnRzID0gPCZwcG11X2xlZnRidXNfMz4sIDwmcHBtdV9yaWdo
dGJ1c18zPjsKPiAgICAgICAgICAgICAgICAgdmRkLXN1cHBseSA9IDwmYnVjazNfcmVnPjsKPiAr
ICAgICAgICAgICAgICAgc2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFyZW50ID0gPCZidXNfZG1jPjsK
PiArICAgICAgICAgICAgICAgI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPiAgICAgICAgICAg
ICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICAgICAgICAgfTsKPgo+IEBAIC0zOTIsNiArNDAxLDgg
QEAgRXhhbXBsZTIgOgo+Cj4gICAgICAgICAmYnVzX2xjZDAgewo+ICAgICAgICAgICAgICAgICBk
ZXZmcmVxID0gPCZidXNfbGVmdGJ1cz47Cj4gKyAgICAgICAgICAgICAgIHNhbXN1bmcsaW50ZXJj
b25uZWN0LXBhcmVudCA9IDwmYnVzX2xlZnRidXM+Owo+ICsgICAgICAgICAgICAgICAjaW50ZXJj
b25uZWN0LWNlbGxzID0gPDA+Owo+ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4g
ICAgICAgICB9Owo+Cj4gLS0KPiAyLjcuNAo+CgpJZiB5b3UgYWRkIHRoZSB1c2FnZSBleGFtcGxl
IGxpa2UgdGhlIG1peGVyIGRldmljZSBvZiBwYXRjaDUgdG8gdGhpcwpkdC1iaW5kaW5nIGRvY3Vt
ZW50LApJIHRoaW5rIGl0IGlzIHZlcnkgYmVuZWZpY2lhbCBhbmQgbW9yZSBoZWxwZnVsIGZvciB1
c2VyIG9mCmV4eW5vcy1idXMvZXh5bm9zLWdlbmVyaWMtaWNjLgoKQWNrZWQtYnk6IENoYW53b28g
Q2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPgoKLS0KQmVzdCBSZWdhcmRzLApDaGFud29vIENo
b2kKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
