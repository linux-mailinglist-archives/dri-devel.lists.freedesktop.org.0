Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797A16FDF5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE686E8A9;
	Wed, 26 Feb 2020 11:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FA06E8A9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:39:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a5so2674449wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=+yNkgRJCCvk3tR2+uPD+CChEBKU7rqj+dbVRvM8ZFcU=;
 b=fCmN9NUvUfc8ONnST8aw+RwfQnci2MXR3hrYVz/j8GCG+asjcTYdlE+5qvJc5kMLfm
 /wbwFYnwf4wSuv4z+nnnUkMZZwP6N9WO/Yk30OGxs/FP8H1yH4H4tQsw9aZfJHIFEiax
 tANgvRUtghcnMc0/MYkb6GAbEEs7E6reMHDwiSR9H3TeXHsbAyElxt2E7+QGj6bB7FR7
 ciGbOh6qVZbUKXZOLYChtfyFPzluhOkYSpGB/t9cO2P8nhcnZ+rOrw0utxl/7Ku/FBCx
 9au5Q2lM23LpaztgQy5zZiS/UtMRDgboJXCpbp3tYRqaX3odCMtohnIVCmcEMQisgJFU
 cfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+yNkgRJCCvk3tR2+uPD+CChEBKU7rqj+dbVRvM8ZFcU=;
 b=gyaEd302paL+lz5nirFsvPgKXFDAigMJx/JzzoOrkcDR5GgSHY3Hi1tMmNWkvZgvKe
 p9wuM3rKayGjQBu55sur7wQbRqKqqbn3eOUvAPMgSlmZaQWSz/xK8Go8MCq+WHm3VWZA
 UHR6cMFQsv15xax4EMr6JjlXESJvuBb2VxHQ0HEefqYvz+CvhKDYdSMRuG18DxUoFzzr
 S0QeH0BpozZHy18YbZ0hnGQYDRWG8Vj4jSKnwp5Oc+6Kg64zgCKCv4mKHFXR8u94vRYA
 WmYvm3o3mhtvIccEAhbS4tt2xtGagtk6L+CpASJJup0M2HfjF0QlJYrkGEy3EjfjRb7K
 OZJw==
X-Gm-Message-State: APjAAAXscwqYilMM9ScdpjStqu7Oga/9MGAoE2+7WCDj2hzMZ4OJIQAT
 m4g69f8a2Lkv0Vo/LM0OYCNB7Q==
X-Google-Smtp-Source: APXvYqx8QfWBNI5rnWygwDxpONx0q7SQ0E36AQFRrCJEeuMmEwBzIe71UvoEvU+a/uiYsg5Kvif3aQ==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr5071570wmk.172.1582717149272; 
 Wed, 26 Feb 2020 03:39:09 -0800 (PST)
Received: from dell ([2.31.163.122])
 by smtp.gmail.com with ESMTPSA id s1sm2882178wro.66.2020.02.26.03.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 03:39:08 -0800 (PST)
Date: Wed, 26 Feb 2020 11:39:40 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] backlight: corgi: Convert to use GPIO descriptors
Message-ID: <20200226113940.GN3494@dell>
References: <20200220090032.6635-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220090032.6635-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andrea Adami <andrea.adami@gmail.com>, dri-devel@lists.freedesktop.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMCBGZWIgMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIGNvZGUgaW4g
dGhlIENvcmdpIGJhY2tsaWdodCBkcml2ZXIgY2FuIGJlIGNvbnNpZGVyYWJseQo+IHNpbXBsaWZp
ZWQgYnkgbW92aW5nIHRvIEdQSU8gZGVzY3JpcHRvcnMgYW5kIGxvb2t1cCB0YWJsZXMKPiBmcm9t
IHRoZSBib2FyZCBmaWxlcyBpbnN0ZWFkIG9mIHBhc3NpbmcgR1BJTyBudW1iZXJzIHVzaW5nCj4g
dGhlIG9sZCBBUEkuCj4gCj4gTWFrZSBzdXJlIHRvIGVuY29kZSBpbnZlcnNpb24gc2VtYW50aWNz
IGZvciB0aGUgQWtpdGEgYW5kCj4gU3BpdHogcGxhdGZvcm1zIGluc2lkZSB0aGUgR1BJTyBsb29r
dXAgdGFibGUgYW5kIGRyb3AgdGhlCj4gY3VzdG9tIGludmVyc2lvbiBzZW1hbnRpY3MgZnJvbSB0
aGUgZHJpdmVyLgo+IAo+IEFsbCBpbi10cmVlIHVzZXJzIGFyZSBjb252ZXJ0ZWQgaW4gdGhpcyBw
YXRjaC4KPiAKPiBDYzogQW5kcmVhIEFkYW1pIDxhbmRyZWEuYWRhbWlAZ21haWwuY29tPgo+IEFj
a2VkLWJ5OiBSb2JlcnQgSmFyem1payA8cm9iZXJ0LmphcnptaWtAZnJlZS5mcj4KPiBTaWduZWQt
b2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gLS0tCj4g
Q2hhbmdlTG9nIHYyLT52MzoKPiAtIFN3aXRjaCB0aGUgU1BJIGJ1cyBuYW1lIHRvICJzcGkxLjEi
IHJhdGhlciB0aGFuICJzcGkwLjEiIGZvcgo+ICAgQ29yZ2kgYW5kICJzcGkyLjEiIHJhdGhlciB0
aGFuICJzcGkwLjEiIGZvciBTcGl0eiwgYXMKPiAgIHB4YTJ4eF9zZXRfc3BpX2luZm8oKSBzZXRz
IHRoZSBidXMgbnVtYmVyIHRvIDEgYW5kIDIKPiAgIHJlc3BlY3RpdmVseS4KPiBDaGFuZ2VMb2cg
djEtPnYyOgo+IC0gQ29sbGVjdCBSb2JlcnQncyBBQ0suCj4gLS0tCj4gIGFyY2gvYXJtL21hY2gt
cHhhL2NvcmdpLmMgICAgICAgICAgIHwgMTIgKysrKy0KPiAgYXJjaC9hcm0vbWFjaC1weGEvc3Bp
dHouYyAgICAgICAgICAgfCAzNCArKysrKysrKysrKy0tLS0KPiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvY29yZ2lfbGNkLmMgfCA2OCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBp
bmNsdWRlL2xpbnV4L3NwaS9jb3JnaV9sY2QuaCAgICAgICB8ICAzIC0tCj4gIDQgZmlsZXMgY2hh
bmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCgpBcHBsaWVkLCB0aGFua3Mu
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVh
ZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
