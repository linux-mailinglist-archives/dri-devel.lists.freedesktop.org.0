Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988508B989
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E446E127;
	Tue, 13 Aug 2019 13:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58B06E127
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:07:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z23so1395761wmf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KmXzoBUXHxJHjlg46FMW0dxa2W5o60aTpodhS2kVwmg=;
 b=SchodV7Jw/7o8XRqzmPayP7ICsf2xPBTP4h1Kfm+1FJ+qE47z5gBlSAERSATTFDL1C
 6WJhxBJ/lyn2zVRDkDy34i28YOrgHkWKeQIsesv5k/eNQiff6/wA89YBKuUkGCovSEDe
 BbrllEBXWzWSU6VXIG99q5UOxkI9P5HXv83iQa+BS5nvUjaUl6mVfeYciW1JY/YHcx/a
 wOFGRZRZn4kdG8KWPko9p/SgD/EXClqf4BjLkCW/syzhGCJp/zEbu4kpEwOHeuUtOmDz
 X8ukflQL1tAkyOr7U9XYRLG5GtR1rvuYMJGCXU/JqwnjpQoAqHnCj2FeTAxsJ06Z8Vot
 9IUg==
X-Gm-Message-State: APjAAAWiCoLdIPAaY1v02O8UMddnbFwfh7TzQgeZiAm7KORNLvVMxGiD
 t1OMcdg9kwzPP69WRaxjOUkS6DuhJEw5Ww==
X-Google-Smtp-Source: APXvYqzgdp3Zndn5v43elyX6+pgrtPRawNnwaXyyK9Bsc/ODHIW3Y8r2UqJevJcTDJI1GDGwc8PXYQ==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr2825550wml.87.1565701656014;
 Tue, 13 Aug 2019 06:07:36 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a8sm1442855wma.31.2019.08.13.06.07.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 06:07:35 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Remove completed features still in TODO
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190802195727.1963-1-robh@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c9f7a287-cad7-9741-1aa2-923ce7e56bd2@baylibre.com>
Date: Tue, 13 Aug 2019 15:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802195727.1963-1-robh@kernel.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KmXzoBUXHxJHjlg46FMW0dxa2W5o60aTpodhS2kVwmg=;
 b=jv0CD5EWIWYQWFzeIlnKRLPpV+XGtvWK3ez4lxCM49ltOhIT03sctRdd0/puWgWh/E
 /u1YmORPJhNRrSmLdiLf88dQeMPjHNWM4o+gXyDDsAvPGhXlk/7XyuXmbTEtS6uyci0l
 SoiHGVeygMv7+8uXztrVmLk5CrVn5msBy6cio8fhLoC/c+zirYOVHaOfoR9qPyViEUCo
 YiSHrg4dXiWcNji8+RPTFFT35bs/sU/ubjoTgyjTdfbtk9/rG4PvKzmXX3QK9EwkTZj/
 M2nF0T50mQXyeYz7e3+Fjita7Hb4btubpY7AWe5OhgTyvvQMN1GbpmxT6zBzGDdX0/lV
 jPPA==
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMDgvMjAxOSAyMTo1NywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gVGhlcmUncyBhIGZldyBm
ZWF0dXJlcyB0aGUgZHJpdmVyIHN1cHBvcnRzIHdoaWNoIHdlIGZvcmdvdCB0byByZW1vdmUsIHNv
Cj4gcmVtb3ZlIHRoZW0gbm93Lgo+IAo+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bj
b2xsYWJvcmEuY29tPgo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xs
YWJvcmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPIHwgOSAtLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9UT0RPIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8KPiBp
bmRleCBjMmU0NGFkZDM3ZDguLjJhYzk3MmEzNDY5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvVE9ETwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RP
Cj4gQEAgLTEsMTUgKzEsOSBAQAo+IC0tIFRoZXJtYWwgc3VwcG9ydC4KPiAtCj4gIC0gQmlmcm9z
dCBzdXBwb3J0Ogo+ICAgIC0gRFQgYmluZGluZ3MgKE5laWwsIFdJUCkKClRoZSBiaWZyb3N0ciBi
aW5kaW5ncyBhcmUgdXBzdHJlYW0sIGJ1dCBub3QgaW4gWUFNTCwgeW91IHNob3VsZCBtb3ZlIGFu
ZCB0cmFuc2Zvcm0gdGhpcyBsaW5lIGludG8gOgoKICAgIC0gRFQgYmluZGluZ3MgaW4gWUFNTCBz
Y2hlbWEKCk5laWwKCj4gICAgLSBNTVUgcGFnZSB0YWJsZSBmb3JtYXQgYW5kIGFkZHJlc3Mgc3Bh
Y2Ugc2V0dXAKPiAgICAtIEJpZnJvc3Qgc3BlY2lmaWMgZmVhdHVyZSBhbmQgaXNzdWUgaGFuZGxp
bmcKPiAgICAtIENvaGVyZW50IERNQSBzdXBwb3J0Cj4gIAo+IC0tIFN1cHBvcnQgZm9yIDJNQiBw
YWdlcy4gVGhlIGlvLXBndGFibGUgY29kZSBhbHJlYWR5IHN1cHBvcnRzIHRoaXMuIEZpbmlzaGlu
Zwo+IC0gIHN1cHBvcnQgaW52b2x2ZXMgZWl0aGVyIGNvcHlpbmcgb3IgYWRhcHRpbmcgdGhlIGlv
bW11IEFQSSB0byBoYW5kbGUgcGFzc2luZwo+IC0gIGFsaWduZWQgYWRkcmVzc2VzIGFuZCBzaXpl
cyB0byB0aGUgaW8tcGd0YWJsZSBjb2RlLgo+IC0KPiAgLSBQZXIgRkQgYWRkcmVzcyBzcGFjZSBz
dXBwb3J0LiBUaGUgaC93IHN1cHBvcnRzIG11bHRpcGxlIGFkZHJlc3NlcyBzcGFjZXMuCj4gICAg
VGhlIGhhcmQgcGFydCBpcyBoYW5kbGluZyB3aGVuIG1vcmUgYWRkcmVzcyBzcGFjZXMgYXJlIG5l
ZWRlZCB0aGFuIHdoYXQKPiAgICB0aGUgaC93IHByb3ZpZGVzLgo+IEBAIC0yMiw2ICsxNiwzIEBA
Cj4gIAo+ICAtIENvbXB1dGUgam9iIHN1cHBvcnQuIFNvIGNhbGxlZCAnY29tcHV0ZSBvbmx5JyBq
b2JzIG5lZWQgdG8gYmUgcGx1bWJlZCB1cCB0bwo+ICAgIHVzZXJzcGFjZS4KPiAtCj4gLS0gUGVy
Zm9ybWFuY2UgY291bnRlciBzdXBwb3J0LiAoQm9yaXMpCj4gLQo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
