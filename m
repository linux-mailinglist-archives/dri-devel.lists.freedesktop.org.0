Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE6E21A97
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 17:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D889829;
	Fri, 17 May 2019 15:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7E589829
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 15:33:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 15so3126097wmg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 08:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DdDzZysLfVadqvsMQnFeoRHP4htFWBYVVUq169MuOcc=;
 b=ICBJiew+qGih4fACQ2I3zIvojWP+1Zj6POBQF0GhyV2LuEQCtpJZmrYXMtuopyd9Fx
 d1ShhhQjLNnF+L1WPauPtpN48+vjO7atmYB+kMcOqrqyqmRrK2rmMI7GSzudgvIwyhuO
 mPBQICwymeyPq4jrFlPCsFQzTKyBbvtlVfCrK1oVSm+5Wdng9Pz8Ua6vkNrHy9mR1WfU
 EqUuWi0ZjCscxIS4vNnjARLQLP5op+oagVAz09CT/1iLme58oc0sKDy8qeyZij9yyhtS
 6cHlFa0g7i/X8M/MFj+OdL5fAq8JdEsMhjtOqFbs5tb4nLfScBf3XeNEJSwKG1I+K8o3
 UZUA==
X-Gm-Message-State: APjAAAUv6Fj6FDWEPTCQ7BiRZGDiwAaUDVNIJL1tgEbmQSDLnFInJ14I
 fYTlZ1iZRgRGoyx6qPW0LHUgQtuGA+09Hw==
X-Google-Smtp-Source: APXvYqzTR6eRQd6k3I2+euwW92LODOfma6L53u97OA0EwBDlYYeAkLW9Rh1Y6xYWUq6XHGqTG/NCUw==
X-Received: by 2002:a1c:e3d7:: with SMTP id a206mr32803221wmh.7.1558107210333; 
 Fri, 17 May 2019 08:33:30 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s13sm7449103wmh.31.2019.05.17.08.33.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 08:33:29 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Select devfreq
To: Ezequiel Garcia <ezequiel@collabora.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190517150042.776-1-ezequiel@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d3feaa58-ff8f-614e-0aad-969a8b1c950c@baylibre.com>
Date: Fri, 17 May 2019 17:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517150042.776-1-ezequiel@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DdDzZysLfVadqvsMQnFeoRHP4htFWBYVVUq169MuOcc=;
 b=k2wqQ+jCLKoMNfF3zGbhphOmaqKX92fHXer0kMJTXQeA+yRcAkmR9KlbJTwic5dc/A
 gVNoQ6P/f7MCXzI0vaAtM7T5g5QbNZuHM2vBNRDQGeG0pM+A805QMQf8Ric8awd5jmGK
 Im+GoJgMEvbCUZESt61NXmp5u5pc6XtFWhgL/UWf4KPNHnMfF6dVciWEc2aQfwiJ7AKN
 XBK5L+Eqci82Z9ZbPzvDI/q93xlK1f3QEa2oR1lIqNnOongBsSexpz8JRw8ClCzoS3nI
 lRqXTc3gMEz10oamkEPiu7RRsXcvRaKT6/em9oHw1QgGuMJ2VvpSgEFOHRY3+z81kdbX
 zuXQ==
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDUvMjAxOSAxNzowMCwgRXplcXVpZWwgR2FyY2lhIHdyb3RlOgo+IEN1cnJlbnRseSwg
dGhlcmUgaXMgc29tZSBsb2dpYyBmb3IgdGhlIGRyaXZlciB0byB3b3JrIHdpdGhvdXQgZGV2ZnJl
cS4KPiBIb3dldmVyLCB0aGUgZHJpdmVyIGFjdHVhbGx5IGZhaWxzIHRvIHByb2JlIGlmICFDT05G
SUdfUE1fREVWRlJFUS4KPiAKPiBGaXggdGhpcyBieSBzZWxlY3RpbmcgZGV2ZnJlcSwgYW5kIGRy
b3AgdGhlIGFkZGl0aW9uYWwgY2hlY2tzCj4gZm9yIGRldmZyZXEuCj4gCgpQbGVhc2UgYWRkIGEg
Rml4ZXMgdGFnLgoKTmVpbAoKPiBTaWduZWQtb2ZmLWJ5OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1
aWVsQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9LY29u
ZmlnICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMgfCAxMyArKy0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvS2NvbmZpZwo+
IGluZGV4IDU5MTYxMWRjNGUzNC4uODE5NjNlOTY0YjBmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L0tjb25maWcKPiBAQCAtOSw2ICs5LDcgQEAgY29uZmlnIERSTV9QQU5GUk9TVAo+ICAJc2VsZWN0
IElPTU1VX1NVUFBPUlQKPiAgCXNlbGVjdCBJT01NVV9JT19QR1RBQkxFX0xQQUUKPiAgCXNlbGVj
dCBEUk1fR0VNX1NITUVNX0hFTFBFUgo+ICsJc2VsZWN0IFBNX0RFVkZSRVEKPiAgCWhlbHAKPiAg
CSAgRFJNIGRyaXZlciBmb3IgQVJNIE1hbGkgTWlkZ2FyZCAoVDZ4eCwgVDd4eCwgVDh4eCkgYW5k
Cj4gIAkgIEJpZnJvc3QgKEczeCwgRzV4LCBHN3gpIEdQVXMuCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXggMjM4YmQxZDg5ZDQzLi4yOWZjZmZk
ZjJkNTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVx
LmMKPiBAQCAtMTQwLDggKzE0MCw4IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJcmV0ID0gZGV2
X3BtX29wcF9vZl9hZGRfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYpOwo+IC0JaWYgKHJldCA9PSAt
RU5PREVWKSAvKiBPcHRpb25hbCwgY29udGludWUgd2l0aG91dCBkZXZmcmVxICovCj4gLQkJcmV0
dXJuIDA7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gIAo+ICAJcGFuZnJvc3RfZGV2
ZnJlcV9yZXNldChwZmRldik7Cj4gIAo+IEBAIC0xNzAsOSArMTcwLDYgQEAgdm9pZCBwYW5mcm9z
dF9kZXZmcmVxX3Jlc3VtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgewo+ICAJ
aW50IGk7Cj4gIAo+IC0JaWYgKCFwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQo+IC0JCXJldHVybjsK
PiAtCj4gIAlwYW5mcm9zdF9kZXZmcmVxX3Jlc2V0KHBmZGV2KTsKPiAgCWZvciAoaSA9IDA7IGkg
PCBOVU1fSk9CX1NMT1RTOyBpKyspCj4gIAkJcGZkZXYtPmRldmZyZXEuc2xvdFtpXS5idXN5ID0g
ZmFsc2U7Cj4gQEAgLTE4Miw5ICsxNzksNiBAQCB2b2lkIHBhbmZyb3N0X2RldmZyZXFfcmVzdW1l
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAKPiAgdm9pZCBwYW5mcm9zdF9kZXZm
cmVxX3N1c3BlbmQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gIHsKPiAtCWlmICgh
cGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkKPiAtCQlyZXR1cm47Cj4gLQo+ICAJZGV2ZnJlcV9zdXNw
ZW5kX2RldmljZShwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKTsKPiAgfQo+ICAKPiBAQCAtMTk0LDkg
KzE4OCw2IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2RldmZyZXFfdXBkYXRlX3V0aWxpemF0aW9u
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBpCj4gIAlrdGltZV90IG5vdzsKPiAgCWt0
aW1lX3QgbGFzdDsKPiAgCj4gLQlpZiAoIXBmZGV2LT5kZXZmcmVxLmRldmZyZXEpCj4gLQkJcmV0
dXJuOwo+IC0KPiAgCW5vdyA9IGt0aW1lX2dldCgpOwo+ICAJbGFzdCA9IHBmZGV2LT5kZXZmcmVx
LnNsb3Rbc2xvdF0udGltZV9sYXN0X3VwZGF0ZTsKPiAgCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
