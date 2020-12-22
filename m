Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472632E1B1F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51DA6E8DE;
	Wed, 23 Dec 2020 10:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121426E175
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:14:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o19so34584983lfo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JeqU2hjek5wLw0+7xrlLc11caNI578OgYNY2jwkqzNY=;
 b=bHwBuHMIyebkzyuUuOWBtzvheNh3xobf36Fa7wYQWSsb5947FwMxh5EXX1ORm+eEbW
 9s5TZRAW81SHivJZRvgjBliVL48suJOSz1Q3fByGDaGgZSnCbxhaiAyXQaEZBI91Yzfk
 Da8F8JtXO/zjgcfIz/rgqYIhHzUMN4koFL/LTO+qm6b0E4aQxq5kQ5cCtBnX91oQRcbd
 G9iKKoovYg35LssxUr4eWNW7/z6lzqiVA17GKXw1DgN7UnKw56gr4BczhuG99aRzMmZF
 7jXf+V/o4Q+Dp0H9EG+kujNeGdrVmzHpfpd/8stsHWBUWPBM1U+22zpgewqWife2rV0Z
 M8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JeqU2hjek5wLw0+7xrlLc11caNI578OgYNY2jwkqzNY=;
 b=XUwMsInVcVb7KBTyWGvLTBr4fZp1VEJupPFyWn5CQ3EdxrfScxuKWcQzAgLPgc26CN
 Ue2CEqo5rHuSJi9vR9QJtkLxdvZG5zjEOgzwibooFTZ6Enm9GEfRlrdkGsOx5HZ4H3VH
 TCWMJayPzNzZg1uxNJaN0o6VRY3+OZdLqMU9mzrOjSwzNEfl7QfsZ1f+p7SwGYck/S4S
 s5wVn4az7lwYz/at+epjSAG8Fjb8A3+e+8TydGzV/4bZ79ZATkhmNhFuYTSSqi+SZUwn
 hnHB4EOBo+dz1id4VuUG8CZprkwkcW9wZnGhnu4AgbJ/R4UEYDmbLajjKLPrF6clGrL2
 1tAA==
X-Gm-Message-State: AOAM531smBKY3gEPCcZkHDRqfz+omGlkWGnPz/i6ccTc90wJkBgZL8RX
 sIIdrONCTrixuUGlWibt0+8=
X-Google-Smtp-Source: ABdhPJxaybHg4decfemE6k9xrHb2rcpd4r/utxUsMuqV39rH7BRNKVoTVuvzmCmXKUkMGne9zGMDhg==
X-Received: by 2002:a19:6447:: with SMTP id b7mr9495186lfj.206.1608664484582; 
 Tue, 22 Dec 2020 11:14:44 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id x8sm2779029lfn.226.2020.12.22.11.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:14:44 -0800 (PST)
Subject: Re: [PATCH v2 13/48] opp: Add resource-managed versions of OPP API
 functions
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-14-digetx@gmail.com>
 <20201222085556.kce4dcwumk4u6ttm@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0ffd2ada-b279-a319-5d5c-b2bf1a49ca35@gmail.com>
Date: Tue, 22 Dec 2020 22:14:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222085556.kce4dcwumk4u6ttm@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMTIuMjAyMCAxMTo1NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMTItMjAs
IDIxOjA2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEFkZCByZXNvdXJjZS1tYW5hZ2VkIHZl
cnNpb25zIG9mIE9QUCBBUEkgZnVuY3Rpb25zLiBUaGlzIHJlbW92ZXMgYSBuZWVkCj4+IGZyb20g
ZHJpdmVycyB0byBzdG9yZSBhbmQgbWFuYWdlIE9QUCB0YWJsZSBwb2ludGVycy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4g
IGRyaXZlcnMvb3BwL2NvcmUuYyAgICAgfCAxNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gIGRyaXZlcnMvb3BwL29mLmMgICAgICAgfCAgMjUgKysrKysrCj4+
ICBpbmNsdWRlL2xpbnV4L3BtX29wcC5oIHwgIDUxICsrKysrKysrKysrKwo+PiAgMyBmaWxlcyBj
aGFuZ2VkLCAyNDkgaW5zZXJ0aW9ucygrKQo+IAo+IFBsZWFzZSBzZW5kIGEgcGF0Y2hzZXQgb2Yg
aXRzIG93biBmb3IgdGhpcyBwYXRjaCwgYWxvbmcgd2l0aCB1cGRhdGVzIHRvIGFsbCB0aGUKPiBl
eGlzdGluZyBjb2RlIHRoYXQgY2FuIG1ha2UgdXNlIG9mIHRoZXNlLgo+IAoKb2sKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
