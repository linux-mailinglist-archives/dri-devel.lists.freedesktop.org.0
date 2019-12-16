Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590DB120F5E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782086E80B;
	Mon, 16 Dec 2019 16:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6826E80B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:27:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so7409794wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=6iDh7ptGa5FINfTEnKeoacqRd+FnaiCquHPFvhHMHN8=;
 b=u2A0W6PVBNr4QeLT8F6eZEY3giXLH63b9OEPbsZtVidO5Jx0DdTFJPCycPV9txuEw3
 tIl3Ztdh2Ulb2cqBeiZOMFkrY65f73ACqZwsPGjC36EPhuMsjJUGGs70iJ3Eh6UXUgkS
 DQEyEEjPcqQC/Y7psH5XTDIQfcqO1eRMldsIRwp5qdS1wTu7Bz4cZvntUDDeymJ+tz6E
 BrNtV5U7NTtFsn+vb14PpFL86HNC/cvxqpkK0CsGC+EEYTVCzfd0QWanp+PY+vP2jxYY
 ksSANKdlN0G6ppTZYcYiIF6jf1n7wdrGJfRnUhMzrOhsKv7y/zHT4k+iSB9vCe0w9B88
 iRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6iDh7ptGa5FINfTEnKeoacqRd+FnaiCquHPFvhHMHN8=;
 b=IxPjQEGAIR3n6wQzJeoMKVkiVzS8qhIOqdrAznF/w9Vjr1ccA3JjL+UQGekYPI8Nf2
 G/yre/mZYtUnvwZMS5mL0MojR4xFRKPTxxZnx01aj93QI8QhYktWyuOBSEC6AtGhhSe5
 vJGXvtO2O3UjjYavE0Gqq2E0GsNR8X3+JffsMpcaUUrgNZE3Aq6zAzTRuP0eYVLd1OTP
 /Mac3UTt646fQh2v27oywJex2XujjNdpc/NNkdX6j3ZAYpOqNwi1OCEdzGiIb6CEWtwb
 S7HfMJTFLLWgUVxRxm4oy9ah3hojTlNjRqbLZD4c6XvzilVanTyYoBroPACdXBmwP0el
 KR1g==
X-Gm-Message-State: APjAAAWI9uWfJZAbZP7pi9NQb+NtDy2ImoULlR2A6X4srMvdfrcofl9G
 4q1vtOWkgX9NWjD9fqh7ITP2UA==
X-Google-Smtp-Source: APXvYqzTYWrdPKHQWOtljE6zRtOLUeJGjoDkt/vYr6uewqm+sKGqkPTgCpGJNsosr75t7uzYkuY+3w==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr32259562wmk.68.1576513650736; 
 Mon, 16 Dec 2019 08:27:30 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id q8sm19044634wmq.3.2019.12.16.08.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 08:27:30 -0800 (PST)
Date: Mon, 16 Dec 2019 16:27:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: corgi: Convert to use GPIO descriptors
Message-ID: <20191216162729.GR2369@dell>
References: <20191203123143.118487-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203123143.118487-1-linus.walleij@linaro.org>
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

T24gVHVlLCAwMyBEZWMgMjAxOSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIGNvZGUgaW4g
dGhlIENvcmdpIGJhY2tsaWdodCBkcml2ZXIgY2FuIGJlIGNvbnNpZGVyYWJseQo+IHNpbXBsaWZp
ZWQgYnkgbW92aW5nIHRvIEdQSU8gZGVzY3JpcHRvcnMgYW5kIGxvb2t1cCB0YWJsZXMKPiBmcm9t
IHRoZSBib2FyZCBmaWxlcyBpbnN0ZWFkIG9mIHBhc3NpbmcgR1BJTyBudW1iZXJzIHVzaW5nCj4g
dGhlIG9sZCBBUEkuCj4gCj4gTWFrZSBzdXJlIHRvIGVuY29kZSBpbnZlcnNpb24gc2VtYW50aWNz
IGZvciB0aGUgQWtpdGEgYW5kCj4gU3BpdHogcGxhdGZvcm1zIGluc2lkZSB0aGUgR1BJTyBsb29r
dXAgdGFibGUgYW5kIGRyb3AgdGhlCj4gY3VzdG9tIGludmVyc2lvbiBzZW1hbnRpY3MgZnJvbSB0
aGUgZHJpdmVyLgo+IAo+IEFsbCBpbi10cmVlIHVzZXJzIGFyZSBjb252ZXJ0ZWQgaW4gdGhpcyBw
YXRjaC4KPiAKPiBDYzogQW5kcmVhIEFkYW1pIDxhbmRyZWEuYWRhbWlAZ21haWwuY29tPgo+IENj
OiBSb2JlcnQgSmFyem1payA8cm9iZXJ0LmphcnptaWtAZnJlZS5mcj4KPiBTaWduZWQtb2ZmLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGFyY2gv
YXJtL21hY2gtcHhhL2NvcmdpLmMgICAgICAgICAgIHwgMTIgKysrKy0KPiAgYXJjaC9hcm0vbWFj
aC1weGEvc3BpdHouYyAgICAgICAgICAgfCAzNCArKysrKysrKysrKy0tLS0KCkRvZXMgdGhpcyBo
YXZlIGFuIEFybSBBY2sgeWV0PwoKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvY29yZ2lfbGNk
LmMgfCA2OCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L3Nw
aS9jb3JnaV9sY2QuaCAgICAgICB8ICAzIC0tCgpXaGF0IGFib3V0IFNQST8KCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
