Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A7116781
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 08:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD5389DB5;
	Mon,  9 Dec 2019 07:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7F589DB5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 07:26:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w15so14967625wru.4
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 23:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DkgP3tr+u0GOhGMReKoFV4Qzqh16I93viwjUtetMiRc=;
 b=F7/Ycd3hJEnEgTzbXGLosTYAmR5ffePYy1bfXHgRaSCm//S+QqzKIRmusoZ4KyTdPl
 b3RHRLFMDe4VU+Lr7t8SXBZP2vHX6uFZD+dWsPXZhdoCRfPJhZZJekOVzZjRN+ok1lYV
 2ULDq1M7y8QLPK3PgoULRF8pZ12oAqT8nuXtRgV1DlPgyn73lVoo5upzT+3Qplu/5Jp3
 KZ9Mdcdc444SZ+V7OCLmPVkz0bIfc8nZkB2/z/G5P3Xu2v63tr+tSMxWRicpK6qajyz9
 hXQUSJkfXT77gJ+qa1Ksa6FD6PZNy7eelonpn7caUc7QcvZUBwn7HrV5ZzhrE4Bcuwf7
 GlBw==
X-Gm-Message-State: APjAAAVds/hUhIV71WJcX3qRw5FHC+lOq5Y2B7IfVdXq43245OB4ucl+
 5a4icJhxFy4X6TNYta/MjZTVWw==
X-Google-Smtp-Source: APXvYqx8LvV+z/524sUB3qCQXocHg1Js1V+RkzXBzZrznh+w3JoOoARVx/R0HW2HhFxEE7bAjrvu2A==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr368996wrq.206.1575876370543; 
 Sun, 08 Dec 2019 23:26:10 -0800 (PST)
Received: from [192.168.1.62] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id v3sm12247212wml.47.2019.12.08.23.26.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Dec 2019 23:26:10 -0800 (PST)
Subject: Re: [PATCH v2 0/2] Meson VPU: fix CVBS output
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7cee86ab-5296-b944-49e0-54609c07eee4@baylibre.com>
Date: Mon, 9 Dec 2019 08:26:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DkgP3tr+u0GOhGMReKoFV4Qzqh16I93viwjUtetMiRc=;
 b=fDjFZ4nUdvvhPDwqLehZobt3LHgrYAhTs/YbYInvDXppNfnVH5cC0dEMC6YItMGpxU
 gEZIoGxdd0T6TMR6hDkNV07iUpW6DPYtMB9dXYampbzNNdpjjBF8AollGwBt8kw5gNeq
 eRKlPs2DXEJEjFn/5QebYHqfdvt0iE7NjEQilzxuaiVAAJrXqn40RjZR0+1k+CzPUvUy
 KgKnGDccaqOQ3OhIqOlz9FrsnQaJt/INFkaoOQ7p32j01HT8fgKVkNYVf1BdR4eUyizo
 YPen3JYbFpCNaDiQPqn4N7s7SZveFO4wKfTZRIGvhvmJqYD1EdL48rLkRYb7Cp9G58bW
 HIPg==
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
Cc: airlied@linux.ie, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMTIvMjAxOSAxODoxOCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBUaGUgZ29h
bCBvZiB0aGlzIHNlcmllcyBpcyB0byBmaXggdGhlIENWQlMgb3V0cHV0IHdpdGggdGhlIE1lc29u
IFZQVQo+IGRyaXZlci4gUHJpb3IgdG8gdGhpcyBzZXJpZXMga21zY3ViZSByZXBvcnRlZDoKPiAg
IGZhaWxlZCB0byBzZXQgbW9kZTogSW52YWxpZCBhcmd1bWVudAo+IAo+IENoYW5nZXMgc2luY2Ug
djEgYXQgWzBdOgo+IC0gYWRkIHBhdGNoIHRvIHJlbW92ZSBkdXBsaWNhdGUgY29kZSAodG8gbWF0
Y2ggcGF0Y2ggIzIgZWFzaWVyKQo+IC0gdXNlIGRybV9tb2RlX21hdGNoIHdpdGhvdXQgRFJNX01P
REVfTUFUQ0hfQVNQRUNUX1JBVElPIGFzIHN1Z2dlc3RlZAo+ICAgYnkgTmVpbAo+IAo+IAo+IFsw
XSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjY4MTYxLwo+IAo+IAo+IE1h
cnRpbiBCbHVtZW5zdGluZ2wgKDIpOgo+ICAgZHJtOiBtZXNvbjogdmVuYzogY3ZiczogZGVkdXBs
aWNhdGUgdGhlIG1lc29uX2N2YnNfbW9kZSBsb29rdXAgY29kZQo+ICAgZHJtOiBtZXNvbjogdmVu
YzogY3ZiczogZml4IENWQlMgbW9kZSBtYXRjaGluZwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdmVuY19jdmJzLmMgfCA0OCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiAKCkhtbSBz
ZWVtcyB5b3UgYXJlIG5vdCByZWdpc3RlcmVkIHRvIHRoZSBkcmktZGV2ZWwgTUwsIHNvIEkgbXVz
dCB3YWl0IGZvciB0aGUgTUwgbW9kZXJhdG9yIHRvIGFjY2VwdCB5b3VyIG1haWxzIHNvIHRoZXkg
YXBwZWFyIG9uIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy8uCgpDb3VsZCB5b3Ug
cmVnaXN0ZXIgYW5kIGRpc2FibGUgZW1haWxzIHJlY2VwdGlvbiBmcm9tIGRyaS1kZXZlbCA/IEkg
d2lsbCBiZSBlYXNpZXIgaW4gdGhlIGZ1dHVyZS4KCk5laWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
