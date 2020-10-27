Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2529CEA9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3FE6EB7D;
	Wed, 28 Oct 2020 08:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36D26EC1B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:19:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 126so3774504lfi.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/pIfDJ0AkidTbcRkJJnWMl8aJ4kgSl+CTCoDBuFpBc0=;
 b=UScwURpxgTZFS8xiQzfvvhi+CifiknqBp6iMvNs+6Wb0nNRNnC/zO0J9OaAsHDwEZT
 AQJCazQGt04Yo6sPjoxHdIsrvc+4mtm2MIpr/EsQqQ9AzCuHfILl9/kpzyROX9v/JMYh
 hXtkpgUdjMsyskYAoVVEgMI+bty9hBevb4OzTpddCLlrGqpxJDVcjsQVr2AyZTTrzOE9
 KzIdDAACwwH3hsvPHxXp7Kth5lFvX9PR6NnbIPoKL8MjSpnBTdqR/EcRmXU8n7pH5oK6
 l6PNRg2eUhOyB1zu0DnQwDhkNAchozPRXy1xsP3Elsx7h+RkngwlCaKL+TlX8jcE8jhB
 06bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/pIfDJ0AkidTbcRkJJnWMl8aJ4kgSl+CTCoDBuFpBc0=;
 b=TxJ9nUxdiYdFx7EIign0Z4iCfiXaQ+3sejvRugIRxz2Jli40KhyIH7I9DuZ2arh9rq
 8hPUBbI5VVzjS0Te/6sYDUey+aodRJPkRmkBTVz0fwZl8uYCVoLHledSxe3itVSgpdNN
 ATLWHLma/NGrRyHzQBAaZjhwAdxXmJxVrQeOy8ZDQt71Jim/qLQPca7A24kUv2CE+37/
 6SUINpI6CeVgxmNsd1PQFrvW9Oiuni30IGnRrt1Xp4pCjoUck+K/upVUGKtSqVxSC+gD
 +hcZqVpJ4wWFN2pSyYFKnKF68e8aCHdn4TKfERp39q8cvY4y1yfDZUBe03h2KtebMKwm
 zhzQ==
X-Gm-Message-State: AOAM533MRWvdam5hm/tV2NFubXYgGWyVywHvGrwib+HRta8Azle/ws8o
 SHr+HAkX668o09FxGk4lzUQ=
X-Google-Smtp-Source: ABdhPJzrLiSB7V8GZRxzvrHOF+cQNWPrcMqy1pZLxufDhMT9At8Xhhbg8y/oFfWB+HSFnV39X9bidw==
X-Received: by 2002:a19:4ac1:: with SMTP id x184mr989056lfa.140.1603826370353; 
 Tue, 27 Oct 2020 12:19:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id q15sm260867lfb.231.2020.10.27.12.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:19:29 -0700 (PDT)
Subject: Re: [PATCH v6 13/52] dt-bindings: memory: tegra124: emc: Document new
 interconnect property
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-14-digetx@gmail.com> <20201027102506.GB17089@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f38984b6-d53f-a43d-0387-e787b3c1924d@gmail.com>
Date: Tue, 27 Oct 2020 22:19:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027102506.GB17089@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxMzoyNSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjU2QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gRXh0ZXJuYWwgbWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBt
ZW1vcnkgY29udHJvbGxlciBhbmQKPj4gd2l0aCBleHRlcm5hbCBtZW1vcnkuIERvY3VtZW50IG5l
dyBpbnRlcmNvbm5lY3QgcHJvcGVydHkgd2hpY2ggdHVybnMKPj4gRXh0ZXJuYWwgTWVtb3J5IENv
bnRyb2xsZXIgaW50byBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAuLi4vYmluZGlu
Z3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTEyNC1lbWMueWFtbCAgIHwgNyArKysr
KysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252
aWRpYSx0ZWdyYTEyNC1lbWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMTI0LWVtYy55YW1sCj4+IGluZGV4IDI3
ODU0OWY5ZTA1MS4uYWMwMDgzMmNlYWMxIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTEyNC1lbWMu
eWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNv
bnRyb2xsZXJzL252aWRpYSx0ZWdyYTEyNC1lbWMueWFtbAo+PiBAQCAtMjksNiArMjksOSBAQCBw
cm9wZXJ0aWVzOgo+PiAgICAgIGl0ZW1zOgo+PiAgICAgICAgLSBjb25zdDogZW1jCj4+ICAKPj4g
KyAgIiNpbnRlcmNvbm5lY3QtY2VsbHMiOgo+PiArICAgIGNvbnN0OiAwCj4+ICsKPj4gICAgbnZp
ZGlhLG1lbW9yeS1jb250cm9sbGVyOgo+PiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3BoYW5kbGUKPj4gICAgICBkZXNjcmlwdGlvbjoKPj4gQEAgLTMyNyw2ICsz
MzAsNyBAQCByZXF1aXJlZDoKPj4gICAgLSBjbG9ja3MKPj4gICAgLSBjbG9jay1uYW1lcwo+PiAg
ICAtIG52aWRpYSxtZW1vcnktY29udHJvbGxlcgo+PiArICAtICIjaW50ZXJjb25uZWN0LWNlbGxz
Igo+IAo+IEFub3RoZXIgcmVxdWlyZWQgcHJvcGVydHksIHdoYXQgYWJvdXQgYWxsIGV4aXN0aW5n
IHVzZXJzIG9mIHRoaXMgYmluZGluZz8KCkVNQy9kZXZmcmVxIGRyaXZlcnMgY2hlY2sgcHJlc2Vu
Y2Ugb2YgdGhlIG5ldyBwcm9wZXJ0aWVzIGFuZCBhc2sgdXNlcnMKdG8gdXBncmFkZSB0aGUgRFQu
IFRoZSBrZXJuZWwgd2lsbCBjb250aW51ZSB0byB3b3JrIGZpbmUgdXNpbmcgb2xkZXIKRFRCcywg
YnV0IGRldmZyZXEgZHJpdmVyIHdvbid0IGxvYWQuCgo+PiAgYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCj4+ICAKPj4gQEAgLTM0NSw2ICszNDksNyBAQCBleGFtcGxlczoKPj4gIAo+PiAgICAg
ICAgICAjaW9tbXUtY2VsbHMgPSA8MT47Cj4+ICAgICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsK
Pj4gKyAgICAgICAgI2ludGVyY29ubmVjdC1jZWxscyA9IDwxPjsKPiAKPiBZb3UgbWVhbnQgJzAn
PwoKJzEnIGlzIGZvciB0aGUgIm1jIiBub2RlIGluIHRoZSBleGFtcGxlIChub3QgImVtYyIgbm9k
ZSkuCgpBbnl3YXlzLCBJJ2xsIG1vdmUgdGhpcyBodW5rIHRvIHRoZSBwcmV2aW91cyBwYXRjaCBp
biBvcmRlciB0byBmaXggdGhlCmtlcm5lbCBib3Qgd2FybmluZy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
