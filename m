Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3733A473E4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 10:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264028916A;
	Sun, 16 Jun 2019 08:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6278916A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 08:59:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so3564258wme.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 01:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ITLiVQZ3ttHS2OCmJVdr2pwqDxExpjxblx6QJpo79NY=;
 b=hJmS01livgqw+cpLGK0YUb4DICNGtM/BDs63+jFrhgwdRQ8XXaCIcVGVmvZdS8uylI
 o5HMZtn9YJdPFb+LixmFYjVSgCw7CJ/u6fmhTJ+VGf16lnYdo5t0E9sVLDMgNaV/gZHc
 l7YW5K9QX2Zn93F1dv0MCNoKj1HL2C7J5hK3LiatQk74iziw/6pfJw8pIvdPeUJBijCX
 Ow5+gFPar52iw+8u3bnq5zGRbo5HPQDXGRCDsCBkKjK0QuIryK+vUme/YPu5q+PT/DIR
 gOZ8YOY94QuWWZPHagKqZlPTZuF6ouKTWNMgCunTN556rLAPdhqTL7jqdtM74YQI2+yh
 JtLw==
X-Gm-Message-State: APjAAAVTt62qw3vj8lQeZlQKuYOD6kN9sNddhntPAeRQukTkcNQCMTc/
 gZwDbr519aHK5WgLzc8gCWM=
X-Google-Smtp-Source: APXvYqzSFlADfZGpYrtAtOjU/NYmJZYEAkWsu4on1+2TMhvgCshgH31ng4O8HIUzQ+YcUwFU6kLTWA==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr9069782wmb.81.1560675571337; 
 Sun, 16 Jun 2019 01:59:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.186])
 by smtp.googlemail.com with ESMTPSA id s7sm4514716wmc.2.2019.06.16.01.59.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 16 Jun 2019 01:59:30 -0700 (PDT)
Date: Sun, 16 Jun 2019 10:59:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Kogut <joseph.kogut@gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Message-ID: <20190616085928.GB3826@kozik-lap>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614235719.8134-1-joseph.kogut@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kgene@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDQ6NTc6MTlQTSAtMDcwMCwgSm9zZXBoIEtvZ3V0IHdy
b3RlOgo+IEFkZCBkZXZpY2UgdHJlZSBub2RlIGZvciBtYWxpIGdwdSBvbiBPZHJvaWQgWFUzIFNv
Q3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwu
Y29tPgo+IC0tLQo+IAo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gLSBVc2UgaW50ZXJydXB0IG5hbWUg
b3JkZXJpbmcgZnJvbSBiaW5kaW5nIGRvYwo+IC0gU3BlY2lmeSBhIHNpbmdsZSBjbG9jayBmb3Ig
R1BVIG5vZGUKPiAtIEFkZCBncHUgb3BwIHRhYmxlCj4gLSBGaXggd2FybmluZ3MgZnJvbSBJUlFf
VFlQRV9OT05FCj4gCj4gIC4uLi9ib290L2R0cy9leHlub3M1NDIyLW9kcm9pZHh1My1jb21tb24u
ZHRzaSB8IDI2ICsrKysrKysrKysrKysrKysrKysKClRoaXMgc2hvdWxkIGdvIHRvIGV4eW5vczU0
MjItb2Ryb2lkLWNvcmUuZHRzaSBpbnN0ZWFkLCBiZWNhdXNlIGl0IGlzCmNvbW1vbiB0byBlbnRp
cmUgT2Ryb2lkIEV4eW5vczU0MjIgZmFtaWx5IChub3Qgb25seSBYVTMgZmFtaWx5KS4KCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kKPiBpbmRleCA5M2E0OGYyZGRh
NDkuLmI4YTQyNDZlM2IzNyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M1
NDIyLW9kcm9pZHh1My1jb21tb24uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCj4gQEAgLTQ4LDYgKzQ4LDMyIEBACj4gIAkJY29v
bGluZy1sZXZlbHMgPSA8MCAxMzAgMTcwIDIzMD47Cj4gIAl9Owo+IAo+ICsJZ3B1OiBncHVAMTE4
MDAwMDAgewo+ICsJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtbWFsaSIsICJhcm0sbWFs
aS10NjI4IjsKClRoaXMgaXMgY29tbW9uIHRvIGFsbCBFeHlub3M1NDJ4IGNoaXBzIHNvIGl0IHNo
b3VsZCBnbyB0bwpleHlub3M1NDIwLmR0c2kuIEhlcmUgeW91IHdvdWxkIG5lZWQgdG8gb25seSBl
bmFibGUgaXQgYW5kIHByb3ZpZGUKcmVndWxhdG9yLgoKUHJvYmFibHkgdGhpcyBzaG91bGQgYmUg
YWxzbyBhc3NvY2lhdGVkIHdpdGggdG11X2dwdSBhcyBhIGNvb2xpbmcgZGV2aWNlCihpZiBNYWxp
IHJlZ2lzdGVycyBhIGNvb2xpbmcgZGV2aWNlLi4uKS4gT3RoZXJ3aXNlIHRoZSB0bXVfZ3B1IGlz
IG5vdApyZWFsbHkgdXNlZCBmb3IgaXQuCgo+ICsJCXJlZyA9IDwweDExODAwMDAwIDB4NTAwMD47
Cj4gKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIxOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiAr
CQkJICAgICA8R0lDX1NQSSA3NCAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKwkJCSAgICAgPEdJ
Q19TUEkgMTE3IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCWludGVycnVwdC1uYW1lcyA9ICJq
b2IiLCAibW11IiwgImdwdSI7Cj4gKwkJY2xvY2tzID0gPCZjbG9jayBDTEtfRzNEPjsKPiArCQlt
YWxpLXN1cHBseSA9IDwmYnVjazRfcmVnPjsKClBsZWFzZSBjaGVjayBpZiBhbHdheXMtb24gcHJv
cGVydHkgY291bGQgYmUgcmVtb3ZlZCBmcm9tIGJ1Y2s0LiBBbHNvLAp3aGF0IGFib3V0IExETzI3
PyBJdCBzaG91bGQgYmUgdXNlZCBhcyB3ZWxsIChtYXliZSB0aHJvdWdoCnZlbmRvci1zcGVjaWZp
YyBwcm9wZXJ0aWVzIHdoaWNoIHdvdWxkIGp1c3RpZnkgdGhlIG5lZWQgb2YgbmV3IHZlbmRvcgpj
b21wYXRpYmxlKS4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKPiArCQlvcGVyYXRpbmctcG9p
bnRzLXYyID0gPCZncHVfb3BwX3RhYmxlPjsKPiArCX07Cj4gKwo+ICsJZ3B1X29wcF90YWJsZTog
Z3B1LW9wcC10YWJsZSB7Cj4gKwkJY29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYyIjsK
PiArCj4gKwkJb3BwLTE3NzAwMDAwMCB7Cj4gKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MTE3MDAw
MDAwPjsKPiArCQkJb3BwLW1pY3Jvdm9sdCA9IDw4MTI1MDA+Owo+ICsJCX07Cj4gKwo+ICsJCW9w
cC02MDAwMDAwMDAgewo+ICsJCQlvcHAtaHogPSAvYml0cy8gNjQgPDYwMDAwMDAwMD47Cj4gKwkJ
CW9wcC1taWNyb3ZvbHQgPSA8MTE1MDAwMD47Cj4gKwkJfTsKPiArCX07Cj4gKwo+ICAJdGhlcm1h
bC16b25lcyB7Cj4gIAkJY3B1MF90aGVybWFsOiBjcHUwLXRoZXJtYWwgewo+ICAJCQl0aGVybWFs
LXNlbnNvcnMgPSA8JnRtdV9jcHUwIDA+Owo+IC0tCj4gMi4yMi4wCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
