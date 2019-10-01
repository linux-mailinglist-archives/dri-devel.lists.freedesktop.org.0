Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0BC2F09
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 10:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4FE6E575;
	Tue,  1 Oct 2019 08:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780FA6E575
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 08:41:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so2228721wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 01:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gANP79Qhf4Qum3OnGQ3uGBx5LD3Xosxk9jJ+94ZFLQw=;
 b=oa2Xm9OBOc/auyuEfgyuGIUPhGt5dMHkY0FfYT2JC6kcMG5e7pxm06NOv4o2hAJCIH
 rwci0aD5sl6vLvJbrWkV57/YidNvpujp+C+lTvwQQHCHZAT7LrLY8/stfWA0KQXWvzOU
 QZtKeeLyFHsCb2DrKNdLksgAUrMStHR4GKOiyZmyPN75UiX3v2MTmqpwRp89hHm1PJ2k
 Rq5C+A346wz7dEtKJyBlqIAncCgNMZh3lKEdgWX64O4ZCH7519JMHyO/oa7z+KsR9LHW
 5ZuKkcDiANprBzbIpfd10Hs88VcnzVNGsA6v/Py+vTthT3+gBo0FVjYD7mhUHFPFLIAW
 WwXw==
X-Gm-Message-State: APjAAAXogOnWUWYKNNaBgLr/pR5SnjlKN8h81eKSKThPji9irN4HUzZY
 86rP3tzza+6h1xjrtIHDPibF2o9SntpTrw==
X-Google-Smtp-Source: APXvYqwp8hMIMy8eYiI4bu8yAKWoqzeGfb2c2jpIsjbtu5dBXyDQGwr+YLWEBW79kkrf0gCY2MRcbA==
X-Received: by 2002:a1c:4108:: with SMTP id o8mr2792638wma.129.1569919269864; 
 Tue, 01 Oct 2019 01:41:09 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 a192sm2698278wma.1.2019.10.01.01.41.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 01:41:09 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: enable runtime PM
To: Kevin Hilman <khilman@baylibre.com>, Kevin Hilman <khilman@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <20190925193154.20732-1-khilman@kernel.org>
 <c0db12a0-66c3-7636-a7bd-b071d0820426@baylibre.com>
 <7ho8z1g5mq.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3705c301-225c-5de1-206c-c6ab6f497a46@baylibre.com>
Date: Tue, 1 Oct 2019 10:41:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ho8z1g5mq.fsf@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gANP79Qhf4Qum3OnGQ3uGBx5LD3Xosxk9jJ+94ZFLQw=;
 b=KPsybExV9+c82HdeJij/4YvSc7UphL6q5gSEs/zuM8YC+8a4sfUDk+OLEqWvVd4fax
 dPaTJwtzXGnub1qcguJZhOx0NNAxv9JJ4khBsdquvMAWUWlhK+OsQYf997xxm/WFda5a
 aybJjDhyVDwRieo7OtQ6dElNwD/otCF1o6FjxXLUDY15N1XEr0fKxX3q4LeBAQqD6NW+
 JW629NhjyfAP9161d+QYN5gL3ZQxkAHh3aePpbQ5lNX3HRAtXEx5YhUYZbDOiJ/wmpFT
 270lPeGv+2rfx2nK21cLLDKtvSqkwbD0Rey3+oTndJCJqVqCAjA0qa7wacjGVFGcT69M
 mwUg==
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDkvMjAxOSAxNzozNCwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JpdGVzOgo+IAo+PiBIaSBLZXZpbiwKPj4KPj4g
T24gMjUvMDkvMjAxOSAyMTozMSwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+Pj4gRnJvbTogS2V2aW4g
SGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KPj4+Cj4+PiBPbiBzb21lIFNvQ3MsIHRoZSBW
UFUgaXMgaW4gYSBwb3dlci1kb21haW4gYW5kIG5lZWRzIHJ1bnRpbWUgUE0KPj4+IGVuYWJsZWQg
YW5kIHVzZWQgaW4gb3JkZXIgdG8ga2VlcCB0aGUgcG93ZXIgZG9tYWluIG9uLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Cj4+PiAtLS0K
Pj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgfCA0ICsrKysKPj4+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuYwo+Pj4gaW5kZXggMjMxMGM5NmZmZjQ2Li4yNTZiNmEwZTljNmIgMTAwNjQ0Cj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+Pj4gQEAgLTE0LDYgKzE0LDcgQEAKPj4+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+PiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVu
dC5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51
eC9wbV9ydW50aW1lLmg+Cj4+PiAgCj4+PiAgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4+PiAgI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+Cj4+PiBAQCAtMjc0LDYgKzI3NSw3IEBAIHN0YXRpYyBp
bnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBoYXNfY29t
cG9uZW50cykKPj4+ICAKPj4+ICAJLyogSGFyZHdhcmUgSW5pdGlhbGl6YXRpb24gKi8KPj4+ICAK
Pj4+ICsJcG1fcnVudGltZV9nZXRfc3luYyhkZXYpOwo+Pj4gIAltZXNvbl92cHVfaW5pdChwcml2
KTsKPj4+ICAJbWVzb25fdmVuY19pbml0KHByaXYpOwo+Pj4gIAltZXNvbl92cHBfaW5pdChwcml2
KTsKPj4+IEBAIC00MTYsNiArNDE4LDcgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+ICAJc3RydWN0IGRldmljZV9ub2RlICplcCwg
KnJlbW90ZTsKPj4+ICAJaW50IGNvdW50ID0gMDsKPj4+ICAKPj4+ICsJcG1fcnVudGltZV9lbmFi
bGUoJnBkZXYtPmRldik7Cj4+PiAgCWZvcl9lYWNoX2VuZHBvaW50X29mX25vZGUobnAsIGVwKSB7
Cj4+PiAgCQlyZW1vdGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVwKTsKPj4+
ICAJCWlmICghcmVtb3RlIHx8ICFvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKHJlbW90ZSkpIHsKPj4+
IEBAIC00NDAsNiArNDQzLDcgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPj4+ICAJfQo+Pj4gIAo+Pj4gIAkvKiBJZiBubyBvdXRwdXQg
ZW5kcG9pbnRzIHdlcmUgYXZhaWxhYmxlLCBzaW1wbHkgYmFpbCBvdXQgKi8KPj4+ICsJcG1fcnVu
dGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+Pj4gIAlyZXR1cm4gMDsKPj4+ICB9Owo+Pj4gIAo+
Pj4KPj4KPj4gSSdsbCByYXRoZXIgaW1wbGVtZW50IHRydWUgcnVudGltZSBQTSBpbnN0ZWFkLAo+
IAo+IFdoaWxlIHRoaXMgaXMgYSBtaW5pbXVtIGltcGxlbWVudGF0aW9uLCBjYW4geW91IGV4cGxh
aW4gd2hhdCB5b3UgbWVhbiBieQo+ICJ0cnVlIiBydW50aW1lIFBNPwoKSW1wbGVtZW50aW5nIHJ1
bnRpbWVfc3luYygpL19wdXQgd2hlbiB0aGUgZGlzcGxheSBpcyB1c2VkL3VudXNlZC4KCkFSTSBk
aWQgYSBnb29kIGpvYiBpbiB0aGVpciBtYWxpZHAgZHJpdmVyLgoKTmVpbAoKPiAKPiBLZXZpbgo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
