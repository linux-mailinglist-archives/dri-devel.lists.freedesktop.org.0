Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A508721530E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41C26E291;
	Mon,  6 Jul 2020 07:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88F76E192
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 08:41:18 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h22so28853205lji.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=94u4fadNGtidN2vaiyXlzWw+DxqIFzoI6bECvXw6Onc=;
 b=Rwjky4+fTcHJpBjZGyOurGK+bbTLYpMa1+miIEapCV2QYmnTJlRx+lbXF4XppXR4KP
 ehdKLNZRYaj5hPmxptVbfninuCrD1nDGglstkBWCsDZ/x+45XJt9jQNLoE5wg6sKcs5e
 r1u8drtFNmPJmN0ikR6asgq0lU1Z9PerEoyOcj+h8q8y/WmGU44iB7e3F+6PPriu4CKc
 wdgzD2y9QqrJstXhFQlETSGtPbCze3O4SeJ2IiqWpqH+m07PurDkSqPKu9cCD5vwayPL
 X49MryiptFeK3PzPBTXX+1ZPyS0w5pY25GOjNkZ2Fqq2wBEJ58ZB+8pN0ksGfMzSSkWS
 k0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=94u4fadNGtidN2vaiyXlzWw+DxqIFzoI6bECvXw6Onc=;
 b=VlaQ6k8E4XTqoLje2iPGW439LkuDyJBWq/O9ChV7x44rCzyz+LT/4c1tbsHGqCWuMq
 r4Hg4/RIbc8ozmzamQec7ZHgY/rKexs9NLQ/JrVbYQBGqQvEB5t9/ftV6VroCQbssh1i
 BjtXTF09UkzDWjqv2fxuAen8CrdzNHidZojXu1M0GQmx0ewcDxOOzph8nQEvWdjnQNey
 iPcip1RekG6C29ZFi4Jpq+2+d/pVlS03vLn7qAEnnMEB8dBoG5KYK5lD/6e6pA1avJt+
 cHvwV6yF7yXJ6rMB+Nb83aM+PIC8NAsc2kUjgTXtawXqROnNBCWb0P6gohJyNpSsSd4a
 dyQA==
X-Gm-Message-State: AOAM531o4N9yR6Cqh61TxlE8WiZCWBCPzst2nF7EQVZCvm4a1IPg9DPv
 dEzi5OJJbg6WeC9HhrcWr0w=
X-Google-Smtp-Source: ABdhPJzHywnF/v01Hll4ows4GlWRPjjUQx4ETYaAZkhy1uLq32oivsjtx3GFvxO1wnG+bHMUCD+SfQ==
X-Received: by 2002:a05:651c:50d:: with SMTP id
 o13mr20078873ljp.181.1593765677281; 
 Fri, 03 Jul 2020 01:41:17 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id y13sm3871513ljd.20.2020.07.03.01.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 01:41:16 -0700 (PDT)
Subject: Re: [PATCH v4 28/37] memory: tegra: Register as interconnect provider
To: Georgi Djakov <georgi.djakov@linaro.org>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-29-digetx@gmail.com>
 <aec831a6-a7ad-6bcc-4e15-c44582f7568e@linaro.org>
 <82d27a47-f189-6609-a584-c9ca1b35a76c@gmail.com>
 <05cb459d-fc10-1537-eaea-df06f7566b6a@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <31565962-a25c-324f-8319-b3e3ea66b4f1@gmail.com>
Date: Fri, 3 Jul 2020 11:41:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <05cb459d-fc10-1537-eaea-df06f7566b6a@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-tegra@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDIuMDcuMjAyMCAxNTozNiwgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGCOgouLi4KPj4+PiArCW1j
LT5wcm92aWRlci5kYXRhID0gZGF0YTsKPj4+PiArCW1jLT5wcm92aWRlci54bGF0ZSA9IG9mX2lj
Y194bGF0ZV9vbmVjZWxsOwo+Pj4+ICsJbWMtPnByb3ZpZGVyLmFnZ3JlZ2F0ZSA9IHRlZ3JhX21j
X2ljY19hZ2dyZWdhdGU7Cj4+Pj4gKwo+Pj4+ICsJZXJyID0gaWNjX3Byb3ZpZGVyX2FkZCgmbWMt
PnByb3ZpZGVyKTsKPj4+PiArCWlmIChlcnIpCj4+Pj4gKwkJZ290byBlcnJfbXNnOwo+Pj4KPj4+
IE5pdDogSSBhbSBwbGFubmluZyB0byByZS1vcmdhbml6ZSBzb21lIG9mIHRoZSBleGlzdGluZyBk
cml2ZXJzIHRvIGNhbGwKPj4+IGljY19wcm92aWRlcl9hZGQoKSBhZnRlciB0aGUgdG9wb2xvZ3kg
aXMgcG9wdWxhdGVkLiBDb3VsZCB5b3UgcGxlYXNlIG1vdmUKPj4+IHRoaXMgYWZ0ZXIgdGhlIG5v
ZGVzIGFyZSBjcmVhdGVkIGFuZCBsaW5rZWQuCj4+Cj4+IEFyZSB5b3UgcGxhbm5pbmcgdG8gcmVt
b3ZlIHRoZSBwcm92aWRlcidzIGxpc3QtaGVhZCBpbml0aWFsaXphdGlvbiBmcm9tCj4+IHRoZSBp
Y2NfcHJvdmlkZXJfYWRkKCkgWzFdIGFuZCBtb3ZlIGl0IHRvIHRoZSBpbmRpdmlkdWFsIHByb3Zp
ZGVyCj4+IGRyaXZlcnMsIGNvcnJlY3Q/Cj4gCj4gWWVzLCB0aGF0IHdvdWxkIGJlIHRoZSBmaXJz
dCBzdGVwLCBidXQgaSBuZWVkIHRvIHBvc3Qgc29tZSBwYXRjaGVzIGZpcnN0LAo+IHNvIGxldCdz
IGtlZXAgaXQgYXMtaXMgZm9yIG5vdy4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24uCgpObyBwcm9i
bGVtcywgSSdsbCBrZWVwIGFuIGV5ZSBvbiB0aGUgSUNDIGNvcmUgY2hhbmdlcyEKUGxlYXNlIGZl
ZWwgZnJlZSB0byB0aGUgQ0MgbWUgb24gdGhlIHBhdGNoZXMsIEkgbWF5IGdpdmUgdGhlbSBhIHdo
aXJsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
