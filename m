Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB8B2AEA64
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1633D89E3F;
	Wed, 11 Nov 2020 07:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8F89C84
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:50:42 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so14788534ljo.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QumWPjldyhkIYYrKZybLDjf0NEcp9tE/cFj+ALYFR9A=;
 b=JajzXzj+taW37LHKKk1rBUu2Z4ElUMNSSHS0K95OnI5UImwAIF74Qu+QTmiVzypvAS
 gAQiDrdU4a2B6Z9A/XX/OOpJu3zamPLYGVpiOdVUDJw7ZsRpBauLkm/3QQp5PvJ2UM4A
 LlfneuREhApeooZpB9lnnAX6U7j1XdRX88sCUzdxugTvIG1jP5PTHJPC3/8IUgW/bc/i
 LWgLoXa7caMAbqITehUnmz/UH2tBulw/gQUU8Cd3shJtQ+zvYfoUG1N8jDZq2ZIllOe/
 aCD81lT6Dj2NRU8sGRrZHHc26lsCxBQnWNgpAjWLB1z+6WE0AmdSq+A5dXHYbs0KDWUd
 P/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QumWPjldyhkIYYrKZybLDjf0NEcp9tE/cFj+ALYFR9A=;
 b=NJt87CAThKJB2/WmwEdsclYUHdR14CyK7ZR8piI4h3Tukt2KS4AhxgklYZpEkreWgs
 6YW4A91+EZFx2RFnXHT2iExBQ0mRIqRj4aHL/9ClxeJWQh/G20yJWqzB+fOKbkfYhiZY
 5Fw4xLD0DSKywKGVzVfLO/s4AxDuUfQIoqbRld39HaALjC7wdKGH6/he3CqpZrez8OFK
 pgJVyrSUET1mpx4kP09jKfXxbqT23zP8EL6GV+dtno0YFhRSKM0OPpE2cCbGeTghsNTh
 8oTsoDbbjEEzip3WqES3Ci3hh6aitXD4Y6AKEw0uRvnN5swDQ5YrSrJFvOu7K2yWnMIn
 LlIg==
X-Gm-Message-State: AOAM5326hMlVbmQngwTGXGtt9zqmkrdl3RRSGUQXT6p3jcBA31CNLO3u
 kRHMtYUsIwHpI1SiNjTFRtY=
X-Google-Smtp-Source: ABdhPJxca3fiSpZnzLwSSmf1STAmFU4WFUoLoBVs2ZCeEEkdDu9neVJtNB2ucZnGCMuP/Af+mNHRXw==
X-Received: by 2002:a2e:9583:: with SMTP id w3mr9542353ljh.25.1605045040627;
 Tue, 10 Nov 2020 13:50:40 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id x9sm12074lfg.93.2020.11.10.13.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 13:50:39 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-12-digetx@gmail.com> <20201110202945.GF2375022@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7b0052e1-0ea7-b28f-ae46-52e669a980ac@gmail.com>
Date: Wed, 11 Nov 2020 00:50:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110202945.GF2375022@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMTEuMjAyMCAyMzoyOSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gKwkvKiBsZWdh
Y3kgZGV2aWNlLXRyZWVzIGRvbid0IGhhdmUgT1BQIHRhYmxlICovCj4+ICsJaWYgKCFkZXZpY2Vf
cHJvcGVydHlfcHJlc2VudChkYy0+ZGV2LCAib3BlcmF0aW5nLXBvaW50cy12MiIpKQo+PiArCQly
ZXR1cm4gMDsKPiAiTGVnYWN5IiBpcyBhIGJpdCBjb25mdXNpbmcgaGVyZS4gRm9yIG9uZSwgbm8g
ZGV2aWNlIHRyZWVzIGN1cnJlbnRseQo+IGhhdmUgdGhlc2UgdGFibGVzIGFuZCBzZWNvbmRseSwg
Zm9yIG5ld2VyIFNvQ3Mgd2UgbWF5IG5ldmVyIG5lZWQgdGhlbS4KPiAKCkkgaGFkIHRoZSBzYW1l
IHRob3VnaHQgYW5kIGFscmVhZHkgaW1wcm92ZWQgc3VjaCBjb21tZW50cyBhIGRheSBhZ28uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
