Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50732AEA9F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AB46E03C;
	Wed, 11 Nov 2020 07:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DF589C97
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:32:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j205so193643lfj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Udf8izR79EOqP1ijS53zeM3N/JUnCwVrU1fnKC8yXBM=;
 b=TJmDKYdfhNndOw9Fc/1HEuqiqmcIfs67XGIMRW/n659q4NI/oyLnPwqYqDHpqqSze4
 yxRdw/JI8MhkLlhqv01SA66a1lehinyiB40p03H4fmPC4kXqdPdOR9DXXI+CA8FSqBk7
 w6wChwFGwttwXQX2Xdjz29Y+Hwu/v0WRMXMyYljuqE429oOhuZ7qiOzZFPxi1Rkyq/NW
 nVGYWY6zZm9eoNwo6SyRQJSccBYBxUNPG9MlrFkc8UTPfeDIiXk0WNTxV7mdyps+2+6X
 OXy/7b5VqZJ3lgMWmZYzyttqwfgys1sL/l1uEmuidS91VXkM+dhRqONrgFsT4PF6pA+C
 zF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Udf8izR79EOqP1ijS53zeM3N/JUnCwVrU1fnKC8yXBM=;
 b=Dd+OdwurhafKRKsnXa915YCIlPIbmTnlhiP2JP5nxV4jCidfnz4UQhZ8JDoRwEWmrc
 0c9vXYTAYjg7823hRFGq3hX8t6+QKfwoXxmb3Ktmmtf0QCUdlbOOEruRVQK0Ib28/H77
 GpARGDrg42B1P4Bz37dfEe6wedqdXB/6XZw+00110keSpLYJNv8F2NjeQuoH2N9xtDyp
 8dvon+lfYBNp771qExOsfhOnM6qasKLgqWFVE1Mu49wbBF534V/IeB0YNyTMHTVrUMT2
 hfL98BO6w9U6bC/x7hhdyGqjQJukkQDwC4Z7t6dj97jxJ726OAiLx7i3Rg40FbAK2izs
 n1tw==
X-Gm-Message-State: AOAM532OFmuob/lyw0kpWpbBngZemPoqTF0uZheV0F/STRO0p6kU9cBN
 5xZ+MofYhYk1ZwySuMPnxms=
X-Google-Smtp-Source: ABdhPJzgddle15uZzQkarcn6HNRYEMFyRgf1xVU2K+91PWIHM5P29WaFydPEJ+nc/MxNTQcdKv1N/w==
X-Received: by 2002:ac2:5e6e:: with SMTP id a14mr6600177lfr.595.1605043949411; 
 Tue, 10 Nov 2020 13:32:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id o12sm2721051ljc.59.2020.11.10.13.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 13:32:28 -0800 (PST)
Subject: Re: [PATCH v1 07/30] soc/tegra: Add sync state API
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-8-digetx@gmail.com> <20201110204727.GG2375022@ulmo>
 <71934373-8425-345b-7719-0903f846119f@gmail.com>
Message-ID: <7b6c7c62-495c-eeb8-9cdb-0c33be653e3d@gmail.com>
Date: Wed, 11 Nov 2020 00:32:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <71934373-8425-345b-7719-0903f846119f@gmail.com>
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

MTEuMTEuMjAyMCAwMDoyMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gSSBhZGRlZCBh
IHNwZWNpYWwgc3BlbGwgY2hlY2tpbmcgcnVsZSBmb3IgdGhpcyB0eXBvLCBidXQgaXQgZG9lcyBo
ZWxwCj4gcmVsaWFibHkuCgpkb2VzICpub3QqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
