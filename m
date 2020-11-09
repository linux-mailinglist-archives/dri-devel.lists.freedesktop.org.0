Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D8B2AB2CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607F8967F;
	Mon,  9 Nov 2020 08:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E528914F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 05:44:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v18so8823503ljc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 21:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tP/FC+dGBVrN2Wu8oXQnKtpDTfMWbwFyza2NqExwg6k=;
 b=MF8cnp2AWnOeOFRVEsfISikechA/Ixz1dFtKA8EgNEABu0PMsQFBkxVZC9/X6pUcCe
 YCstLNYyQSqmrwsXdkEUDWuPG5PCoO2SSVswz61RwaNiabmwuGC3EC9eP4JjZ3wJeSko
 ZGU99oWOCzpS9yRI4Ql1qoXvkCMEw6ATGuaOQwRDMWXlQinOXCPAbWDVg+WLs/w3Lpg/
 bsINkLXHuxqm/a+sc+xKKFHnEbRzewuPpyGaSTK/KxjfNRNH1n4VXkLAss2GE2604eXS
 LT8gPvlTcD+f93W5lhLaMN86VYx2ryKNggibpsCNQqOr8rlh3BYSz6umwZJS4F7Oyd+G
 m1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tP/FC+dGBVrN2Wu8oXQnKtpDTfMWbwFyza2NqExwg6k=;
 b=OuQXf3RYgcNrRawU+HLSUNsnBJ4JH+zfdYXhXcQfafo0TVyOL+/fF9GnCeXNzf7H/a
 BYrL1QdQZqNk0qk6St8mhSN5lCe24x2r1QU3leVp6hHTdH4K3YWs0AHFE8sIemvnIw7a
 192Ffu7T59LG7702NtNe+2HDXRVqpkl5zjw1Kt/3AOX547/mYWAj70CvUev4bxzRuqyv
 Al/6ER+W0bEN25bGpoQL7M2fCCioUAij6+mgZr5pd8S3uWJLINJd/U4zp5QFWtBbcGpK
 AvmPjOm7tsJlwojneM8J0DwQEkOD6kAO3k4xe9XTfFophCCNY3l9vbtyHEpP3Z0wt9B4
 menQ==
X-Gm-Message-State: AOAM531Ce0Ok/7e4oqlTAbcv1gfWXqBxH6sKFT46FHuIGTlknTq5invL
 Q5Y5TMTevq4Vwk5QnsVdtyI=
X-Google-Smtp-Source: ABdhPJxu6oKJy+ZV+CaEDK/OMuxRF+UUWvmu4xrMjC+USQe4mAvLAS4RZx8UuslTomnJ7nU1Nr4O3g==
X-Received: by 2002:a2e:9e4b:: with SMTP id g11mr5749822ljk.337.1604900664608; 
 Sun, 08 Nov 2020 21:44:24 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id 4sm1672440lfi.150.2020.11.08.21.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 21:44:23 -0800 (PST)
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201104234427.26477-18-digetx@gmail.com>
 <CAOh2x==sy1w7_oEV8=toC6uQnSN44wyOixbP_X0BrMsnm1AUFg@mail.gmail.com>
 <6fa54ce6-d5ae-d04f-7c77-b62c148d92b7@gmail.com>
 <20201106061513.uyys7njcqcdlah67@vireshk-i7>
 <a6926456-8bce-a438-bfaa-be334208f004@gmail.com>
 <CAEExFWsp0DWw1yO84e3vzr_YZkqkd+pyPfQQR3J2W6n3wTX4Jw@mail.gmail.com>
 <20201109050010.g47zojh6wafvwqva@vireshk-i7>
 <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
 <20201109051014.oa6bt4g3ctm2hnuy@vireshk-i7>
 <4476fed9-a356-b7f1-32ee-935343e23038@gmail.com>
 <20201109053546.xupmmsx5qccn46tr@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <33a7ad95-a8cf-7b88-0f78-09086c1a4adf@gmail.com>
Date: Mon, 9 Nov 2020 08:44:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109053546.xupmmsx5qccn46tr@vireshk-i7>
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
 linux-pwm@vger.kernel.org, Frank Lee <tiny.windzz@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driver-dev <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
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

MDkuMTEuMjAyMCAwODozNSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMDktMTEtMjAs
IDA4OjE5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoYW5rcywgSSBtYWRlIGl0IGluIGEg
ZGlmZmVyZW50IHdheSBieSBzaW1wbHkgYWRkaW5nIGhlbHBlcnMgdG8gdGhlCj4+IHBtX29wcC5o
IHdoaWNoIHVzZSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKS4gVGhpcyBkb2Vzbid0IHJlcXVp
cmUgdG8KPj4gYWRkIG5ldyBrZXJuZWwgc3ltYm9scy4KPiAKPiBJIHdpbGwgcHJlZmVyIHRvIGFk
ZCBpdCBpbiBjb3JlLmMgaXRzZWxmLCBhbmQgeWVzCj4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0
KCkgbG9va3MgYmV0dGVyLiBCdXQgSSBhbSBzdGlsbCBub3Qgc3VyZSBmb3IKPiB3aGljaCBoZWxw
ZXJzIGRvIHdlIG5lZWQgdGhlIGRldm1fKigpIHZhcmlhbnRzLCBhcyB0aGlzIGlzIG9ubHkgdXNl
ZnVsCj4gZm9yIG5vbi1DUFUgZGV2aWNlcy4gQnV0IGlmIHdlIGhhdmUgdXNlcnMgdGhhdCB3ZSBj
YW4gYWRkIHJpZ2h0IG5vdywKPiB3aHkgbm90LgoKQWxsIGN1cnJlbnQgbm9uLUNQVSBkcml2ZXJz
IChkZXZmcmVxLCBtbWMsIG1lbW9yeSwgZXRjKSBjYW4gYmVuZWZpdCBmcm9tIGl0LgoKRm9yIFRl
Z3JhIGRyaXZlcnMgd2UgbmVlZCB0aGVzZSB2YXJpYW50czoKCmRldm1fcG1fb3BwX3NldF9zdXBw
b3J0ZWRfaHcoKQpkZXZtX3BtX29wcF9zZXRfcmVndWxhdG9ycygpIFtpZiB3ZSB3b24ndCB1c2Ug
R0VOUERdCmRldm1fcG1fb3BwX3NldF9jbGtuYW1lKCkKZGV2bV9wbV9vcHBfb2ZfYWRkX3RhYmxl
KCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
