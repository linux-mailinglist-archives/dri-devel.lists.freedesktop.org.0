Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734234F2D3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 23:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9A96E981;
	Tue, 30 Mar 2021 21:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2726E981
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 21:12:22 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a1so21468114ljp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=txu5B3L7eP4j1N+cIql31D7dSawJ91f2aT78Kr4BqJo=;
 b=WoSJr6x1WghvNNJvOK+/G4gU9L6G25yzlwxCHbTdAnjh/grTv28MleTfUTuvApL1Kk
 l7e2p4TeoThi6NZSLvqqgXGWHRnRxniAlPOnhJH4kibG9S6de5iaVUXFhx6PpvoDDpZ+
 aDKzYYZvascaVa01OzxEoWfZQkmAwKSDSC19X3eMM2jZcw++M3sSwd13hwbCgb+ZdImg
 Mjt731XJ9TJrcF8QGt3tCuVT/GWixmMPmtIsq+dBYOyZOrmUt5ghXt1g+ebXAzDbSQvK
 uPSrMSp5JhlaMcylAOU/jU8mu3ian4eiSg+3GPbzPdPFvP4+dYY5FkvfkaCAXskFLQ1H
 GLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=txu5B3L7eP4j1N+cIql31D7dSawJ91f2aT78Kr4BqJo=;
 b=tK76gLBVylmEFkyCQxOLqEaOBUbdV5J2y7yhXvUsjcnp3/sh/ieS1LUG4OW+dimeLl
 Rk1CuWGqlRKJgIqL7s1SHmLdgGHI6jauJ97lGT1wbQj+pSaNCvt4XSmY7S8wQBTquG3x
 6kcWQfmQBrZPU+mB2IRLQdCFnlKDkbCYoAPYyK9qYYyjPuXLaKKKUfJiwwl4ZXLZoFy0
 EaHFz2LgKypB+Xo0WRaEPLlPEhkfTWbO6x6MRUakELsVpIIDkYmhtWrp6r8s5YObTmkm
 EBNcCyPqWQ8Lmt4uHahI+/Kx20l2WdfIRmz7DXEOu9y5uN1bswg8TkCiP+dlvPCPCBit
 4axw==
X-Gm-Message-State: AOAM532o5gFC4NXlmUjZmTS0CQhnSul9zLyXPssc8Kq1gqEwk1IWlsZa
 NVGmGmMAApyKYBugTxzFHP4OfkEMtow=
X-Google-Smtp-Source: ABdhPJw8qo2aRrzetMrR0iXScpsd9j7WHeMPS5ueABHKr08dQHrWy9prL/yRc6Zn//UEXUEg6AliaQ==
X-Received: by 2002:a2e:9bd0:: with SMTP id w16mr58429ljj.465.1617138741316;
 Tue, 30 Mar 2021 14:12:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru.
 [109.252.193.98])
 by smtp.googlemail.com with ESMTPSA id f17sm2748lfh.21.2021.03.30.14.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 14:12:21 -0700 (PDT)
Subject: Re: [PATCH v6 03/10] gpu: host1x: Show number of pending waiters in
 debugfs
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-4-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ecc00d79-6963-c18b-36df-c8c57e2824ea@gmail.com>
Date: Wed, 31 Mar 2021 00:12:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329133836.2115236-4-mperttunen@nvidia.com>
Content-Language: en-US
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjkuMDMuMjAyMSAxNjozOCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gU2hvdyB0aGUg
bnVtYmVyIG9mIHBlbmRpbmcgd2FpdGVycyBpbiB0aGUgZGVidWdmcyBzdGF0dXMgZmlsZS4KPiBU
aGlzIGlzIHVzZWZ1bCBmb3IgdGVzdGluZyB0byB2ZXJpZnkgdGhhdCB3YWl0ZXJzIGRvIG5vdCBs
ZWFrCj4gb3IgYWNjdW11bGF0ZSBpbmNvcnJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtr
byBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
aG9zdDF4L2RlYnVnLmMgfCAxNCArKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvaG9zdDF4L2RlYnVnLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYwo+IGluZGV4IDFi
NDk5N2JkYTFjNy4uOGExNDg4MGM2MWJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2hvc3Qx
eC9kZWJ1Zy5jCj4gKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMKPiBAQCAtNjksNiAr
NjksNyBAQCBzdGF0aWMgaW50IHNob3dfY2hhbm5lbChzdHJ1Y3QgaG9zdDF4X2NoYW5uZWwgKmNo
LCB2b2lkICpkYXRhLCBib29sIHNob3dfZmlmbykKPiAgCj4gIHN0YXRpYyB2b2lkIHNob3dfc3lu
Y3B0cyhzdHJ1Y3QgaG9zdDF4ICptLCBzdHJ1Y3Qgb3V0cHV0ICpvKQo+ICB7Cj4gKwlzdHJ1Y3Qg
bGlzdF9oZWFkICpwb3M7Cj4gIAl1bnNpZ25lZCBpbnQgaTsKPiAgCj4gIAlob3N0MXhfZGVidWdf
b3V0cHV0KG8sICItLS0tIHN5bmNwdHMgLS0tLVxuIik7Cj4gQEAgLTc2LDEyICs3NywxOSBAQCBz
dGF0aWMgdm9pZCBzaG93X3N5bmNwdHMoc3RydWN0IGhvc3QxeCAqbSwgc3RydWN0IG91dHB1dCAq
bykKPiAgCWZvciAoaSA9IDA7IGkgPCBob3N0MXhfc3luY3B0X25iX3B0cyhtKTsgaSsrKSB7Cj4g
IAkJdTMyIG1heCA9IGhvc3QxeF9zeW5jcHRfcmVhZF9tYXgobS0+c3luY3B0ICsgaSk7Cj4gIAkJ
dTMyIG1pbiA9IGhvc3QxeF9zeW5jcHRfbG9hZChtLT5zeW5jcHQgKyBpKTsKPiArCQl1bnNpZ25l
ZCBpbnQgd2FpdGVycyA9IDA7Cj4gIAo+IC0JCWlmICghbWluICYmICFtYXgpCj4gKwkJc3Bpbl9s
b2NrKCZtLT5zeW5jcHRbaV0uaW50ci5sb2NrKTsKPiArCQlsaXN0X2Zvcl9lYWNoKHBvcywgJm0t
PnN5bmNwdFtpXS5pbnRyLndhaXRfaGVhZCkKPiArCQkJd2FpdGVycysrOwo+ICsJCXNwaW5fdW5s
b2NrKCZtLT5zeW5jcHRbaV0uaW50ci5sb2NrKTsKPiArCj4gKwkJaWYgKCFtaW4gJiYgIW1heCAm
JiAhd2FpdGVycykKPiAgCQkJY29udGludWU7Cj4gIAo+IC0JCWhvc3QxeF9kZWJ1Z19vdXRwdXQo
bywgImlkICV1ICglcykgbWluICVkIG1heCAlZFxuIiwKPiAtCQkJCSAgICBpLCBtLT5zeW5jcHRb
aV0ubmFtZSwgbWluLCBtYXgpOwo+ICsJCWhvc3QxeF9kZWJ1Z19vdXRwdXQobywKPiArCQkJCSAg
ICAiaWQgJXUgKCVzKSBtaW4gJWQgbWF4ICVkICglZCB3YWl0ZXJzKVxuIiwKPiArCQkJCSAgICBp
LCBtLT5zeW5jcHRbaV0ubmFtZSwgbWluLCBtYXgsIHdhaXRlcnMpOwo+ICAJfQo+ICAKPiAgCWZv
ciAoaSA9IDA7IGkgPCBob3N0MXhfc3luY3B0X25iX2Jhc2VzKG0pOyBpKyspIHsKPiAKClRlc3Rl
ZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
