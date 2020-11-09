Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6012AB2D4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D967896E5;
	Mon,  9 Nov 2020 08:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6C3893EF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 05:09:02 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so10628135lfc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 21:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FeL/6AVX9ZUMu7dDHuIXkGUemXJf7ZARpxKlL5RCoNQ=;
 b=HASuQOXkF1RZA3cFoj4FpQvKgZV2Q1/lr5KDfeyQiu7UzOUcgR2MLIo0A9WjcfOmav
 ata3slrLCP7pYpjJJpH3hsWHJQhWDFD2MnuhKZ/K2Wi3PTDjn+6YANdF7+WLjyyARswK
 xjvHnNgEGoDtms4JWbiH/Eldmfj6//odfOM4UJkGJg1nbiyF9x+dhfPodAtsd68AVRQt
 aYvz1hbhU2LBNUEhS+Pd+SfaNp7EwpvEEKUFSYkSpU0qD7E4OjNohzH6JLJrfeYiaYh+
 TKX+gaGoXyq8SLKOzNJ4iFAJkgcC2xWjpa2lrpe34n1HFP7FxGpRlfeKBkcE/EIUJsh1
 aq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FeL/6AVX9ZUMu7dDHuIXkGUemXJf7ZARpxKlL5RCoNQ=;
 b=Wcn8hAyLDlxjfAEvVR5VTrvaIKsAH1slQDhtFnFQXTnIFPHDS8QoQ2qpUCQfZY0h78
 gYRWYLE0qNBYJVFUSkKJ0zcQHZWXh3TulRBvNxzzVCLL75X1H6I8Fcs6CW+6lfvaPnTW
 mXofcgMcvnxOwprHEd/BZmaIIZAkxs2UfObP8sN4wkAizlGOVtuxXzHydSFYUnIWMmtq
 gQMflY2DIXtFZZXUT2miotsyWyZMcftgBzalaM/Gj+T/VFIAVTntgJA9wrZuXuuogqHI
 x07k4/EGBJkAaOsZWOlJbx/mAsRJX6LfP9DnC/WuAbpnyKnqgdXWp5nWvDLD+4i5+m5f
 H/mQ==
X-Gm-Message-State: AOAM530lDdMfHgGD0OTCZRGyEEUY2YQSD3EvVPZFaDf1bMqGx5HlLx8A
 Wi6wXhMny0urbQ0cuNIDxqYEgLl4/1g=
X-Google-Smtp-Source: ABdhPJyKFQooKNzB6MtWOkwlVNrBylRoyZRaTFBouH4KLXv0r9LDeU3fC845u6KgAdZQGxa4Rr9biQ==
X-Received: by 2002:a19:c714:: with SMTP id x20mr2310703lff.537.1604898540523; 
 Sun, 08 Nov 2020 21:09:00 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id w22sm1662291ljm.20.2020.11.08.21.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 21:08:59 -0800 (PST)
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
To: Viresh Kumar <viresh.kumar@linaro.org>, Frank Lee <tiny.windzz@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-18-digetx@gmail.com>
 <CAOh2x==sy1w7_oEV8=toC6uQnSN44wyOixbP_X0BrMsnm1AUFg@mail.gmail.com>
 <6fa54ce6-d5ae-d04f-7c77-b62c148d92b7@gmail.com>
 <20201106061513.uyys7njcqcdlah67@vireshk-i7>
 <a6926456-8bce-a438-bfaa-be334208f004@gmail.com>
 <CAEExFWsp0DWw1yO84e3vzr_YZkqkd+pyPfQQR3J2W6n3wTX4Jw@mail.gmail.com>
 <20201109050010.g47zojh6wafvwqva@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
Date: Mon, 9 Nov 2020 08:08:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109050010.g47zojh6wafvwqva@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 DTML <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driver-dev <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMTEuMjAyMCAwODowMCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMDYtMTEtMjAs
IDIxOjQxLCBGcmFuayBMZWUgd3JvdGU6Cj4+IE9uIEZyaSwgTm92IDYsIDIwMjAgYXQgOToxOCBQ
TSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IDA2LjEx
LjIwMjAgMDk6MTUsIFZpcmVzaCBLdW1hciDQv9C40YjQtdGCOgo+Pj4+IFNldHRpbmcgcmVndWxh
dG9ycyBmb3IgY291bnQgYXMgMCBkb2Vzbid0IHNvdW5kIGdvb2QgdG8gbWUuCj4+Pj4KPj4+PiBC
dXQsIEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBkb24ndCB3YW50IHRvIGhhdmUgdGhhdCBpZiAoaGF2
ZV9yZWd1bGF0b3IpCj4+Pj4gY2hlY2ssIGFuZCBpdCBpcyBhIGZhaXIgcmVxdWVzdC4gV2hhdCBJ
IHdpbGwgaW5zdGVhZCBkbyBpcywgYWxsb3cgYWxsCj4+Pj4gZGV2X3BtX29wcF9wdXQqKCkgQVBJ
IHRvIHN0YXJ0IGFjY2VwdGluZyBhIE5VTEwgcG9pbnRlciBmb3IgdGhlIE9QUAo+Pj4+IHRhYmxl
IGFuZCBmYWlsIHNpbGVudGx5LiBBbmQgc28geW91IHdvbid0IGJlIHJlcXVpcmVkIHRvIGhhdmUg
dGhpcwo+Pj4+IHVud2FudGVkIGNoZWNrLiBCdXQgeW91IHdpbGwgYmUgcmVxdWlyZWQgdG8gc2F2
ZSB0aGUgcG9pbnRlciByZXR1cm5lZAo+Pj4+IGJhY2sgYnkgZGV2X3BtX29wcF9zZXRfcmVndWxh
dG9ycygpLCB3aGljaCBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8KPj4+PiBhbnl3YXlzLgo+Pj4K
Pj4+IFBlcmhhcHMgZXZlbiBhIGJldHRlciB2YXJpYW50IGNvdWxkIGJlIHRvIGFkZCBhIGRldm0g
dmVyc2lvbnMgb2YgdGhlIE9QUAo+Pj4gQVBJIGZ1bmN0aW9ucywgdGhlbiBkcml2ZXJzIHdvbid0
IG5lZWQgdG8gY2FyZSBhYm91dCBzdG9yaW5nIHRoZQo+Pj4gb3BwX3RhYmxlIHBvaW50ZXIgaWYg
aXQncyB1bnVzZWQgYnkgZHJpdmVycy4KPj4KPj4gSSB0aGluayBzby4gVGhlIGNvbnN1bWVyIG1h
eSBub3QgYmUgc28gY29uY2VybmVkIGFib3V0IHRoZSBzdGF0dXMgb2YKPj4gdGhlc2UgT1BQIHRh
Ymxlcy4KPj4gSWYgdGhlIGRyaXZlciBuZWVkcyB0byBtYW5hZ2UgdGhlIHJlbGVhc2UsIGl0IG5l
ZWRzIHRvIGFkZCBhIHBvaW50ZXIKPj4gdG8gdGhlaXIgZHJpdmVyIGdsb2JhbCBzdHJ1Y3R1cmUu
Cj4+Cj4+IE1heWJlIGl0J3Mgd29ydGggaGF2aW5nIHRoZXNlIGRldm0gaW50ZXJmYWNlcyBmb3Ig
b3BwLgo+IAo+IFN1cmUgaWYgdGhlcmUgYXJlIGVub3VnaCB1c2VycyBvZiB0aGlzLCBJIGFtIGFs
bCBmb3IgaXQuIEkgd2FzIGZpbmUKPiB3aXRoIHRoZSBwYXRjaGVzIHlvdSBzZW50LCBqdXN0IHRo
YXQgdGhlcmUgd2VyZSBub3QgYSBsb3Qgb2YgdXNlcnMgb2YKPiBpdCBhbmQgc28gSSBwdXNoZWQg
dGhlbSBiYWNrLiBJZiB3ZSBmaW5kIHRoYXQgd2UgaGF2ZSBtb3JlIHVzZXJzIG9mIGl0Cj4gbm93
LCB3ZSBjYW4gc3VyZWx5IGdldCB0aGF0IGJhY2suCj4gCgpUaGVyZSB3YXMgYWxyZWFkeSBhdHRl
bXB0IHRvIGFkZCB0aGUgZGV2bT8gQ291bGQgeW91IHBsZWFzZSBnaXZlIG1lIGEKbGluayB0byB0
aGUgcGF0Y2hlcz8KCkkgYWxyZWFkeSBwcmVwYXJlZCBhIHBhdGNoIHdoaWNoIGFkZHMgdGhlIGRl
dm0gaGVscGVycy4gSXQgaGVscHMgdG8ga2VlcApjb2RlIGNsZWFuZXIgYW5kIHJlYWRhYmxlLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
