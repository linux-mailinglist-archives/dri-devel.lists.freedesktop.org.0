Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9F338E9B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 14:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432426F61F;
	Fri, 12 Mar 2021 13:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF416F61D;
 Fri, 12 Mar 2021 13:19:17 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m22so45673071lfg.5;
 Fri, 12 Mar 2021 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eRvXvpISF4IBOtvYHqIw0A7WGfnjimCkRZ9ja9m0ckM=;
 b=Ut4qFXpcbkXJ22fKP6ZhuibyOgP96LyuXM/q1+jciXezVPuz/jxw6QKj6NuFX+A8sM
 Z24vGAlcKIxP07ikydnjBeYEye0+2Q7JDXOPU6lIX+XaRsFrKKr3um681kRjPJZrSRUp
 eq1JM3cs50lT4lyB9Q4dkTEpyA8USDUYlpj5qmZUY4MXfcP95ewRNJy9Nr+9JEy4KOQL
 o5kGwjT7Ha1fQEK2V8Fgv9whnKvDILXVU/mNw9cisfDHr5RHMcZm1P090BCHyKsItgDK
 8pK2wrIS0v0jwm1Gfa9g5rcIlLK4s9gS9RXRX3GlZzQf2Hm2p0knhCQeC4spgT4WR+3f
 cXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eRvXvpISF4IBOtvYHqIw0A7WGfnjimCkRZ9ja9m0ckM=;
 b=Ei4XxPFVPo2mPZT0kReSjHdMC/PgzJfZxApET8N+XHs9oVg3eIsIrjk9iG3WLXJIB/
 uB5WT3MuGICTzLdIAOXXX86oDXDUvv9K45vzt+XnqvO81oWfaxD98XksPtXLNZMBTKXx
 //Y7DbXCbPxb3IWzvmqvXPCx3scdp3K6QEyj2R8BSgfw/jLIqzTSbqBnQZGFEq0je9Ft
 /3Wu1KfYTj+lWEuQAN/TqE5opc9DkXhtFn3DsBTR8FcbX7nC84tWe8NdCg0v2/aIeV7K
 semk6CVZv8p0hgVv2FU4qmi9E0k7C8Xhs0ZNRa4tCgVb/G9Q4moWKmIvDC9aUdujKA7G
 Rosw==
X-Gm-Message-State: AOAM530xfbUEf/uAbQyWMQeMF/r4JvfJVHrjP8ZWf8BTiNhwAUzNVeYD
 S+WssILO3ENjFkCNR19KaGCRasDPMys=
X-Google-Smtp-Source: ABdhPJyGS6708sF0bdyf6iWMHpkhy9JBsuOZ8wSAehH9LCLLnfAoUBl4FILaQoGRMgX23tFnvBnr5g==
X-Received: by 2002:a19:a409:: with SMTP id q9mr5244748lfc.654.1615555155774; 
 Fri, 12 Mar 2021 05:19:15 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id x4sm1950915ljj.91.2021.03.12.05.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 05:19:15 -0800 (PST)
Subject: Re: [PATCH v2 01/14] opp: Add devres wrapper for
 dev_pm_opp_set_clkname
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-2-digetx@gmail.com>
 <20210312053312.zgke2mzjkqmwn67i@vireshk-i7>
 <CAPDyKFqrUCjTfrNqZ4gFfQS6LpoQCevGc-tv4WVOwuGhx5iiBg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c9cb7a53-ece7-d71d-7ee2-abb959076954@gmail.com>
Date: Fri, 12 Mar 2021 16:19:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqrUCjTfrNqZ4gFfQS6LpoQCevGc-tv4WVOwuGhx5iiBg@mail.gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qiang Yu <yuq825@gmail.com>, freedreno <freedreno@lists.freedesktop.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTIuMDMuMjAyMSAxMzozNiwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPiBPbiBGcmksIDEyIE1h
ciAyMDIxIGF0IDA2OjMzLCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPiB3
cm90ZToKPj4KPj4gT24gMTEtMDMtMjEsIDIyOjIwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
PiArc3RydWN0IG9wcF90YWJsZSAqZGV2bV9wbV9vcHBfc2V0X2Nsa25hbWUoc3RydWN0IGRldmlj
ZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lKQo+Pj4gK3sKPj4+ICsgICAgIHN0cnVjdCBvcHBfdGFi
bGUgKm9wcF90YWJsZTsKPj4+ICsgICAgIGludCBlcnI7Cj4+PiArCj4+PiArICAgICBvcHBfdGFi
bGUgPSBkZXZfcG1fb3BwX3NldF9jbGtuYW1lKGRldiwgbmFtZSk7Cj4+PiArICAgICBpZiAoSVNf
RVJSKG9wcF90YWJsZSkpCj4+PiArICAgICAgICAgICAgIHJldHVybiBvcHBfdGFibGU7Cj4+PiAr
Cj4+PiArICAgICBlcnIgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBkZXZtX3BtX29w
cF9jbGtuYW1lX3JlbGVhc2UsIG9wcF90YWJsZSk7Cj4+PiArICAgICBpZiAoZXJyKQo+Pj4gKyAg
ICAgICAgICAgICBvcHBfdGFibGUgPSBFUlJfUFRSKGVycik7Cj4+PiArCj4+PiArICAgICByZXR1
cm4gb3BwX3RhYmxlOwo+Pj4gK30KPj4KPj4gSSB3b25kZXIgaWYgd2Ugc3RpbGwgbmVlZCB0byBy
ZXR1cm4gb3BwX3RhYmxlIGZyb20gaGVyZSwgb3IgYSBzaW1wbGUKPj4gaW50ZWdlciBpcyBmaW5l
Li4gVGhlIGNhbGxlcnMgc2hvdWxkbid0IGJlIHJlcXVpcmVkIHRvIHVzZSB0aGUgT1BQCj4+IHRh
YmxlIGRpcmVjdGx5IGFueW1vcmUgSSBiZWxpZXZlIGFuZCBzbyBiZXR0ZXIgc2ltcGxpZnkgdGhl
IHJldHVybgo+PiBwYXJ0IG9mIHRoaXMgYW5kIGFsbCBvdGhlciByb3V0aW5lcyB5b3UgYXJlIGFk
ZGluZyBoZXJlLi4KPiAKPiBZZXMsIHBsZWFzZS4gSSB3YXMgdGhpbmtpbmcgYWxvbmcgdGhlIHNh
bWUgbGluZXMsIHdoZW4gSSByZXZpZXdlZCB0aGUKPiBtbWMgcGF0Y2ggKHBhdGNoOSkuCj4gCj4+
Cj4+IElmIHRoZXJlIGlzIGEgdXNlciB3aGljaCBuZWVkcyB0aGUgb3BwX3RhYmxlLCBsZXQgaXQg
dXNlIHRoZSByZWd1bGFyCj4+IG5vbi1kZXZtIHZhcmlhbnQuCgpJbmRlZWQsIHRoYXQncyBhIHZl
cnkgZ29vZCBzdWdnZXN0aW9uISBUaGUgb3BwX3RhYmxlIGlzbid0IG5lZWRlZCBieSB0aGUKZGV2
bSB1c2VycywgSSdsbCBjaGFuZ2UgaXQgaW4gdjMsIHRoYW5rcyEKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
