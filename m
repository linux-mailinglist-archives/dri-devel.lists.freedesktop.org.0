Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8FA05E0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606DC89D5E;
	Wed, 28 Aug 2019 15:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACD689D5E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 15:14:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j11so144701wrp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cLVW54x6gnaRczK8Bj/tezWruOcIjVXwYoTBUAiZku8=;
 b=BsWr1M+/yEIo5b36l5lR3pT6wtQ4OfRmPEmFGjqxZ0IzSjkF90JBu+a8bovWale6/p
 7G8777sSIMQTUaG27dTnnaD1z1SNIoTJzpcBibR3mrl9Dx+AFJGeaynBSv6fZE7pFM96
 PurykWPmTAD8VibF1NUmo7ybcTE7UoULZOZYPDrfDjuLEKTanEGUix9l+Ne2gf9JmtrX
 QhAQ3/Oz4/XeVN9MOVVSr+7MBpzkZLIKK4mrAuk6vLE4zSMvcA4DG24S5tfP4Q9OQMgM
 9AKIzsZp8BoAOZCDbO0m9M5/Kw1Fvkl5fvf6QcLT1yfHQ6GyaUY5WiXd81KdF1ndNOWx
 tnuw==
X-Gm-Message-State: APjAAAVxb6a2wb+wB+MYgHSuQbgwTuTFMKhAoBY5pQ/r1KitQBgcCyTy
 jN3AtwY4xyyN41lrW/oypu5d1A==
X-Google-Smtp-Source: APXvYqzroMpLp4PWPoUAWt97ynHU1pwK7Cy2iL6Hh5V9n7I4wkF3jqPqK2v1w+rMhFUL4RvEqqmr3Q==
X-Received: by 2002:adf:f851:: with SMTP id d17mr5365855wrq.77.1567005265980; 
 Wed, 28 Aug 2019 08:14:25 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m6sm1754787wrq.95.2019.08.28.08.14.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 08:14:25 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm/meson: add resume/suspend hooks
To: Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20190827095825.21015-1-narmstrong@baylibre.com>
 <7h5zmixvrz.fsf@baylibre.com>
 <b8ea00c4-3749-e571-edb6-ae5091b23247@baylibre.com>
 <7htva1s4rt.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <f46be3c3-0baf-1280-f2cf-58b27843668b@baylibre.com>
Date: Wed, 28 Aug 2019 17:14:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7htva1s4rt.fsf@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cLVW54x6gnaRczK8Bj/tezWruOcIjVXwYoTBUAiZku8=;
 b=eH4oqM2eNeEBBzpvYZ3jsCnNkzjQ6R3iz/IFSGaWjd+PPn+vhcFEp7lGnYFqRGjeRc
 GXcrgkO1uwixBVgEacJnqXs5QJW67xD1z+RTdpIQnPAff+h8npp2UpI6PQsg3U+Bf1TB
 OF3A7Shrosvlcc/P6DweL1eoKvcn2+A6DTNk8Gx1K6wsbar2skwPwmKWcEO05tvhMA2I
 cPGcVem6TT+jDSMDwCWX2XQTlBURnFfTrB2PUhOJQ6X//dJB8XUKV6DgL6gCpsy2kaDY
 ZUHbXnI04Ybr4z42x2PJP1SOukYGiOAUPR6aavrfjWAJ2sGmQ/CIS+mMGkKKKbYnFvqT
 urtA==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDgvMjAxOSAxNzoxMiwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JpdGVzOgo+IAo+PiBPbiAyNy8wOC8yMDE5IDIx
OjE3LCBLZXZpbiBIaWxtYW4gd3JvdGU6Cj4+PiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+IHdyaXRlczoKPj4+Cj4+Pj4gVGhpcyBzZXJpZSBhZGRzIHRoZSByZXN1bWUv
c3VzcGVuZCBob29rcyBpbiB0aGUgQW1sb2dpYyBNZXNvbiBWUFUgbWFpbiBkcml2ZXIKPj4+PiBh
bmQgdGhlIERXLUhETUkgR2x1ZSBkcml2ZXIgdG8gY29ycmVjdGx5IHNhdmUgc3RhdGUgYW5kIGRp
c2FibGUgSFcgYmVmb3JlCj4+Pj4gc3VzcGVuZCwgYW5kIHN1Y2Nlc2Z1bGx5IHJlLWluaXQgdGhl
IEhXIHRvIHJlY292ZXIgZnVuY3Rpb25uYWwgZGlzcGxheQo+Pj4+IGFmdGVyIHJlc3VtZS4KPj4+
Pgo+Pj4+IFRoaXMgc2VyaWUgaGFzIGJlZW4gdGVzdGVkIG9uIEFtbG9naWMgRzEyQSBiYXNlZCBT
RUk1MTAgYm9hcmQsIHVzaW5nCj4+Pj4gdGhlIG5ld2x5IGFjY2VwdGVkIFZSVEMgZHJpdmVyIGFu
ZCB0aGUgcnRjd2FrZSB1dGlsaXR5Lgo+Pj4KPj4+IFRlc3RlZC1ieTogS2V2aW4gSGlsbWFuIDxr
aGlsbWFuQGJheWxpYnJlLmNvbT4KPj4+Cj4+PiBUZXN0ZWQgb24gbXkgRzEyQSBTRUk1MTAgYm9h
cmQsIGFuZCBJIHZlcmlmaWVkIHRoYXQgaXQgZml4ZXMKPj4+IHN1c3BlbmQvcmVzdW1lIGlzc3Vl
cyBwcmV2aW91c2x5IHNlZW4uCj4+Pgo+Pj4gS2V2aW4KPj4+Cj4+Cj4+IFRoYW5rcywKPj4KPj4g
QXBwbHlpbmcgdG8gZHJtLW1pc2MtbmV4dCAoZm9yIHY1LjUpLCB3aXRoIGEgdHlwbyBmaXggaW4g
dGhlIGZpcnN0IHBhdGNoIGNvbW1pdCBsb2c6Cj4+IHMvc3VzcGVucy9zdXNwZW5kCj4gCj4gSXMg
dGhlcmUgYW55IGNoYW5jZSBvZiBnZXR0aW5nIHRoaXMgaW4gYSBhIGZpeCBmb3IgdjUuNCBzbyB3
ZSBoYXZlIGEKPiB3b3JraW5nIHN1c3BlbmQvcmVzdW1lIGluIHY1LjQ/CgpOb3AsIGl0J3MgYWxy
ZWFkeSBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQgYW5kIGlzIGFscmVhZHkgb3V0IG9mIHRoZSB3
aW5kb3cKZm9yIDUuNCBhbnl3YXkuCgpOZWlsCgo+IAo+IFRoYW5rcywKPiAKPiBLZXZpbgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
