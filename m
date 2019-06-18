Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4F498C3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 08:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED746E0C5;
	Tue, 18 Jun 2019 06:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50FB6E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:12:43 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id f97so5256708plb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 23:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=6ls+i1u+lWJagjHM7534F8Uv5sC5LPRBjSxm2ecigcI=;
 b=uhkf4IFDFIDs5QqauYr4exChAzaTZqKgNtowzgB89+i6/y88hS0IIdJe/Qk38KFMGr
 ORQ7h1d8KCPV6c6rMnFM/qMHfm6B3tEMOG3vlBKp/FKMV9Vra3hVfSRrv0cOFHRejLGO
 vkkui+Hce4sl/0GeagmnFRKzin2Gg3uPYGYGF+VxR5tDXmHlL/j/ZXRC69STKtuAn8ji
 xwRPp8cC4DPxV+TfLYLRk7MmrxIWjkE2YscQS2bpzs6uYr7x39eQvgd7zOaQgd1K6OHp
 kh8VtbuoZ5FnB84XWXBYkPYqGNn00N1teHJwe9oXWbAtBM2VIXsTXzh9KD7YmUmcl6fe
 /RoA==
X-Gm-Message-State: APjAAAWXhZAUXQ3Gh+ubH8pmfLjQsRYLOvqZFCp9wXlfQVTl7lWr45a+
 FMUHKSVS57if2t9ZFxQPs16NX9Vo
X-Google-Smtp-Source: APXvYqyINnOm+mjTZ+CUFcz86nookJ6AW/68jaX/bNlGiAR7RzP3b1FIxJN6D1gmjwWmvIHE04lGQA==
X-Received: by 2002:a17:902:a504:: with SMTP id
 s4mr42724651plq.117.1560838363437; 
 Mon, 17 Jun 2019 23:12:43 -0700 (PDT)
Received: from PSXP216MB0662.KORP216.PROD.OUTLOOK.COM ([40.100.44.181])
 by smtp.gmail.com with ESMTPSA id m96sm1195616pjb.1.2019.06.17.23.12.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 23:12:42 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: add COMPILE_TEST support
Thread-Topic: [PATCH] video: fbdev: s3c-fb: add COMPILE_TEST support
Thread-Index: AWIzNHA0y3vT+npVfJhuNQKkYC3mSWVjM2Fi4rm3H+w=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Tue, 18 Jun 2019 06:12:27 +0000
Message-ID: <PSXP216MB0662B10864E4DDEC1EC1823CAAEA0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
References: <CGME20190614144634eucas1p1b04dcfcc040c3c886d2b33592c501d3b@eucas1p1.samsung.com>
 <e771b89b-0e38-a712-b635-8d53cbf95a8e@samsung.com>
In-Reply-To: <e771b89b-0e38-a712-b635-8d53cbf95a8e@samsung.com>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=6ls+i1u+lWJagjHM7534F8Uv5sC5LPRBjSxm2ecigcI=;
 b=WUyn0HUpRkDvaQuENXAK0PGnCB5TxeJa5MJFSJVY5qlfM2PUnK5Rh65Uup9Zxg+KlC
 Sd7mPCIvGKAePXHwuo+zAEW9XGDehg/1O3k+rWNlq4dsrDKDlTqcZ7Krh/T2g686FARo
 Y92y/YV8KouEjNRAqpL94FZuxw3zyVxYzezozpU8W826c6QXnef6F2C45Pvx/FX4i23d
 7wHDKsUcvU7W4QE2h3LvEKfROtqzhJB0WnLsRhzQn6x2sAR+arNrGkHwRn7UeY+dOm3r
 jWWxUQXsgdp9BpXZVBvrscdbNgS4iVXRHYv2mvojh4ZIfG8xhb+7MV44tCh8qitjES6f
 buoQ==
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
Cc: Han Jingoo <jingoohan1@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xNC8xOSwgMTE6NDYgUE0sIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4g
Cj4gQWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIHMzYy1mYiBkcml2ZXIgZm9yIGJldHRlciBj
b21waWxlCj4gdGVzdGluZyBjb3ZlcmFnZS4KPgo+IENjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4x
QGdtYWlsLmNvbT4KQWNrZWQtYnk6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBz
YW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIHwgICAgMyAr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
SW5kZXg6IGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnCj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
S2NvbmZpZwo+IEBAIC0xODc3LDcgKzE4NzcsOCBAQCBjb25maWcgRkJfVE1JT19BQ0NFTEwKPiAg
Cj4gIGNvbmZpZyBGQl9TM0MKPiAgCXRyaXN0YXRlICJTYW1zdW5nIFMzQyBmcmFtZWJ1ZmZlciBz
dXBwb3J0Igo+IC0JZGVwZW5kcyBvbiBGQiAmJiAoQ1BVX1MzQzI0MTYgfHwgQVJDSF9TM0M2NFhY
KQo+ICsJZGVwZW5kcyBvbiBGQiAmJiBIQVZFX0NMSyAmJiBIQVNfSU9NRU0KPiArCWRlcGVuZHMg
b24gKENQVV9TM0MyNDE2IHx8IEFSQ0hfUzNDNjRYWCkgfHwgQ09NUElMRV9URVNUCj4gIAlzZWxl
Y3QgRkJfQ0ZCX0ZJTExSRUNUCj4gIAlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBCj4gIAlzZWxlY3Qg
RkJfQ0ZCX0lNQUdFQkxJVApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
