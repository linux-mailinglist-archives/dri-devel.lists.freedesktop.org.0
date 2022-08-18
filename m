Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E18DB598248
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 13:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6337D0055;
	Thu, 18 Aug 2022 11:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A20D9340C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 11:33:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id t21so1411656ljc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 04:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=XV7o6VoA/foYENhSlwcR9LzNfzuZL9zSnfMTcBdlzkU=;
 b=DLLTtzRMoFSzlvDXNfWAs/5b6nkGZeYQQBFmtNHPM77XjF/MNDQTGJgCecdRKoXUXN
 tzQwxQZ1Minx4+qxe+GDvMjSQIYH49V6JCsZ3KlWyBmwtJG2AHcWIGimOZnagojXqp5U
 xFZbxiKQ0y+BPviS4vBVpSzoQl9MQSUS1MpH0G7pcS0TcxA61A9FEdSYYIXKui87zisL
 P9atfk3nRnh7wTq4O1w1SCzLh1UwKabAx222sHPJ8+2CeJNFVXEBSatzKqX8A1zUpOpc
 KO/taku9ptszlejU7vGtoXm9jXp2hrf88vsRUCWfJNMc63tQOXJoaDxnHGgJtazzuTuR
 k/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=XV7o6VoA/foYENhSlwcR9LzNfzuZL9zSnfMTcBdlzkU=;
 b=fffW0Ih8fifZXXzw78sj4oKrWWhATX0FIa/ErD8YLHcxJaqIO3fqF/LHrulI6ByH5T
 b06cNDzJIYvDcFGnDzWhB4ZQSDopFKMvRL85Z8qAH9CHRrabwfvN9/DRIxh9qqDxu4X+
 OJ9EhIWPjotYqJe2oZb4NDXtLOM6BXX+xCfRIec91WVXug+FNZWMQsz+GTiRkq439xzu
 bGeaNBYXHSmEI6LXzhhOh1I8gHiHypLrcdxgO1+YX98bGyv5nXoi4XCFF6fGyghLcZ5x
 JaByJE3PkH1AkOF6cnid25ypr0goMVWhFsiol1RKkoWt16WbJv0vjCsMnIqQYOjKpnvh
 5w6A==
X-Gm-Message-State: ACgBeo0OeA1/GGae5jXf8OCB1tUzGLbfgOPsovNrMEFPn71YX4PbhmVG
 Sn22dkNttCEnGnLOhxWxS+M=
X-Google-Smtp-Source: AA6agR4Vh+SHdQBIyBHvoqdFckErTl5MnC7H2o375cqIoP3U2g2zgTH9t3HaTX7yjMvi9hGCS1viPw==
X-Received: by 2002:a2e:a4aa:0:b0:260:5889:95f7 with SMTP id
 g10-20020a2ea4aa000000b00260588995f7mr755509ljm.530.1660822435325; 
 Thu, 18 Aug 2022 04:33:55 -0700 (PDT)
Received: from [172.16.193.151] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 18-20020a2e0912000000b0025e08d58e75sm190940ljj.133.2022.08.18.04.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 04:33:54 -0700 (PDT)
Message-ID: <52d307d7-04f2-89fd-ff4b-9a6c0d247350@gmail.com>
Date: Thu, 18 Aug 2022 14:33:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <166057828406.697572.228317501909350108.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-doc@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On 8/15/22 18:44, Mark Brown wrote:
> On Fri, 12 Aug 2022 13:08:17 +0300, Matti Vaittinen wrote:
>> Devm helpers for regulator get and enable
>>
>> First patch in the series is actually just a simple documentation fix
>> which could be taken in as it is now.
>>
>> A few* drivers seem to use pattern demonstrated by pseudocode:
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [1/7] docs: devres: regulator: Add missing devm_* functions to devres.rst
>        commit: 9b6744f60b6b47bc0757a1955adb4d2c3ab22e13
> [2/7] regulator: Add devm helpers for get and enable
>        (no commit info)
> 

I was planning to send out the v3 (where IIO patches are no longer 
squashed into one). I didn't spot the above mentioned patch 2/7 from 
regulator/for-next. I'd just like to get confirmation the 2/7 was not 
merged even though it's mentioned in this mail before re-spinning the 
series with it.

Best Regards
   --Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
