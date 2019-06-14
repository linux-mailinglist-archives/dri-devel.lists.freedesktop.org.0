Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C84546A72
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7178940F;
	Fri, 14 Jun 2019 20:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444C7894DE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:58 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E22921851
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:57 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id n11so4031196qtl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:57 -0700 (PDT)
X-Gm-Message-State: APjAAAVfFXKVpGgwspzc6zIMi/R+UKrGRCJvsu+xWMNl9FG0SwZ5c1oy
 lpYLFp/JpY/d9djUL/pHnas86Ta4UfDNpgpSCQ==
X-Google-Smtp-Source: APXvYqyWRzWEZ0HIsQNXaYvRLs4N5ZiA6PSR36infTnI62eYz0wn0LN3U9LzbcQ569w7rU4GDgO6FBTD8OY61VcRQO8=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr10202928qve.72.1560544616863; 
 Fri, 14 Jun 2019 13:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
 <20190614203144.3850-2-joseph.kogut@gmail.com>
In-Reply-To: <20190614203144.3850-2-joseph.kogut@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 14 Jun 2019 14:36:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJjqCRU2a9sfMimTJoMQnR6CjqAqjHRAxyaebWAad299g@mail.gmail.com>
Message-ID: <CAL_JsqJjqCRU2a9sfMimTJoMQnR6CjqAqjHRAxyaebWAad299g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560544617;
 bh=BMo9z7ktz9HuAZSsZMrvij5s/QTJTao6137g4UhlIgs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vWedKb+jbEbTSmw49dIs6fTCJMj1eNLfzV8lZhNRiHHoNikTzq2f3wdnIMZkVCQyL
 knYe1cDPqn1d10QezlNcqa/UafNrHuBUfY7wb2TBsdKdscj2QcfL0si88DVa5eR8xe
 an96ZnAgozIFPA2aIN/tmAjrRvruXjj6fWhglrLM=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjozMSBQTSBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1
dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGRldmljZSB0cmVlIG5vZGUgZm9yIG1hbGkgZ3B1
IG9uIE9kcm9pZCBYVTMgU29Dcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9z
ZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4uL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ry
b2lkeHUzLWNvbW1vbi5kdHNpICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kKPiBpbmRleCA5M2E0OGYyZGRhNDkuLjFmMmFl
MTlkMDFhZiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIyLW9kcm9p
ZHh1My1jb21tb24uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ry
b2lkeHUzLWNvbW1vbi5kdHNpCj4gQEAgLTQ4LDYgKzQ4LDI0IEBACj4gICAgICAgICAgICAgICAg
IGNvb2xpbmctbGV2ZWxzID0gPDAgMTMwIDE3MCAyMzA+Owo+ICAgICAgICAgfTsKPgo+ICsgICAg
ICAgZ3B1OiBncHVAMTE4MDAwMDAgewo+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNh
bXN1bmcsZXh5bm9zLW1hbGkiLCAiYXJtLG1hbGktdDYyOCI7Cj4gKyAgICAgICAgICAgICAgIHJl
ZyA9IDwweDExODAwMDAwIDB4NTAwMD47Cj4gKyAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8
MCAxMTcgMD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAyMTkgMD4sCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8MCA3NCAgMD47Cj4gKyAgICAgICAgICAgICAgIGlu
dGVycnVwdC1uYW1lcyA9ICJncHUiLCAiam9iIiwgIm1tdSI7CgpQbGVhc2UgdXNlIHRoZSBvcmRl
ciBkZWZpbmVkIGluIHRoZSBiaW5kaW5nIGRvYy4KCj4gKyAgICAgICAgICAgICAgIGNsb2NrcyA9
IDwmY2xvY2sgQ0xLX0czRD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xvY2sgQ0xL
X0RPVVRfQUNMS19HM0Q+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICA8JmNsb2NrIENMS19G
T1VUX1ZQTEw+OwoKVGhlIGJpbmRpbmcgZG9jIHNheXMgYSBzaW5nbGUgY2xvY2suCgo+ICsgICAg
ICAgICAgICAgICBtYWxpLXN1cHBseSA9IDwmYnVjazRfcmVnPjsKPiArICAgICAgICAgICAgICAg
b3BlcmF0aW5nLXBvaW50cyA9IDwKClRoZSBiaW5kaW5nIGRvYyBzYXlzIG9wZXJhdGluZy1wb2lu
dHMtdjIuCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIEtIeiAgdVYgICAqLwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIDYwMDAwMCAgMTE1MDAwMAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIDE3NzAwMCAgODEyNTAwCj4gKyAgICAgICAgICAgICAgID47Cj4gKyAgICAgICB9Owo+ICsK
PiAgICAgICAgIHRoZXJtYWwtem9uZXMgewo+ICAgICAgICAgICAgICAgICBjcHUwX3RoZXJtYWw6
IGNwdTAtdGhlcm1hbCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdGhlcm1hbC1zZW5zb3Jz
ID0gPCZ0bXVfY3B1MCAwPjsKPiAtLQo+IDIuMjIuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
