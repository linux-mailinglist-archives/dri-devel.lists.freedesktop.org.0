Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55F5A5C68
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BEA10E58A;
	Tue, 30 Aug 2022 07:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEA110E561
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:05:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id p7so3123715lfu.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=JVbQO8NaIJX9r2XXsX5JS1XPjDhaNVf/tZE3BTjyue8=;
 b=aUvfBo7ge5wrT9PVdRa7n4WKc+KjoguCB0VGM5ArOYeVSOAtCGAZEIhVT1HktOBuXs
 xVuo8JAqwWgOvbrNiXwuPoqNnTLm8bwbpdzBVdW1XBIGIvvAobm/5fUU1DaMZxhXYMt5
 q9PRCAd0ycNSdCJ0SF3wM/sC/4Jv2wRlE5fJwmrsyHasgMrFm8hXCsm1aD90A+iBSqdp
 JGIlgxplMRXcg90us2nijNq9XvpwRKJHtXnnWe7UD0HWPdTTVSw6af7IiSvj3TkZZcSl
 I+qsTHUM5mofnppLxCg0Ch2lFK2+Sdu+1LslDLVXb/wyNEtQEALA7Ff4s3cbJgr4Eyrt
 eXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JVbQO8NaIJX9r2XXsX5JS1XPjDhaNVf/tZE3BTjyue8=;
 b=fVVXiUFmpYRUTRsUBaiwaFBCzXTFsGqUOsWGHTA6TklMBNiegUdwZSB4/jlfdEB/ev
 eu3rEmnIZwK5/5sLk1bNKY0KbY9v47gyMmTS2K+qcYTSXPr+fAqu1B1kfWA/Bso6fPqu
 2WBdqrkTO4wgTXfnZqcGzLspXE2keFkqeSHpAifuh8AkIfHT6qvR8oRb2J+w5xBOMAKc
 pOqbaNwLo+3BfrEJfPZ/Wxcg+SWrxf+92F7ZaG1HOzVIjkQr9gAm1HiGDhc1+lf5ZReB
 hj95V6v1YPZQ4B5HVcdrOOik/qpqaY4c+zT3g8YfWzqPoUySh25AyBrYMqB3fQOupnZh
 Tk8w==
X-Gm-Message-State: ACgBeo0VuyiHr6bYnmChVROex/WRKQ+UTgBXd0j2X3diMDelaTeFkmrm
 a6QFiSFAXXPjO4itG05kz6I=
X-Google-Smtp-Source: AA6agR5cFuxjTSbp2ILQnRmRzNd5Pjxhu1SWu2c7J9+e7QO7+oxCtHIczngbO2Ls5GyWNgJnT/iQrA==
X-Received: by 2002:ac2:58d5:0:b0:48b:3a88:641 with SMTP id
 u21-20020ac258d5000000b0048b3a880641mr6784864lfo.421.1661843106574; 
 Tue, 30 Aug 2022 00:05:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1?
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a056512359400b00492d1eb41dfsm1506038lfr.240.2022.08.30.00.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 00:05:05 -0700 (PDT)
Message-ID: <b5116f19-4b00-1717-a7ff-eac988bde4a4@gmail.com>
Date: Tue, 30 Aug 2022 10:04:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 03/14] gpu: drm: simplify drivers using
 devm_regulator_*get_enable*()
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>
References: <cover.1660934107.git.mazziesaccount@gmail.com>
 <3aacca7d9a0240d95dc3cf103d114b5c85392e71.1660934107.git.mazziesaccount@gmail.com>
 <CAG3jFyvQc4ZxEt8yRtiP6VAnurvfBdWzD7640DRXun+F7vDHog@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAG3jFyvQc4ZxEt8yRtiP6VAnurvfBdWzD7640DRXun+F7vDHog@mail.gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/29/22 17:25, Robert Foss wrote:

Thanks for the review Robert.

> Hi Matti,
> 
> On Fri, 19 Aug 2022 at 21:18, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>>
>> Simplify drivers using managed "regulator get and enable".
>>
>> meson:
>> Use the devm_regulator_get_enable_optional(). Also drop the seemingly
>> unused struct member 'hdmi_supply'.
>>
>> sii902x:
>> Simplify using devm_regulator_bulk_get_enable()
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> v2 => v3:
>> No changes
>>
>> RFCv1 => v2:
>> - Change also sii902x to use devm_regulator_bulk_get_enable()
>>
>> Please note - this is only compile-tested due to the lack of HW. Careful
>> review and testing is _highly_ appreciated.
>> ---
>>   drivers/gpu/drm/bridge/sii902x.c      | 22 +++-------------------
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>>   2 files changed, 6 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>> index 7ab38d734ad6..162f9c87eeb2 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -171,7 +171,6 @@ struct sii902x {
>>          struct drm_connector connector;
>>          struct gpio_desc *reset_gpio;
>>          struct i2c_mux_core *i2cmux;
>> -       struct regulator_bulk_data supplies[2];
>>          bool sink_is_hdmi;
>>          /*
>>           * Mutex protects audio and video functions from interfering
>> @@ -1072,6 +1071,7 @@ static int sii902x_probe(struct i2c_client *client,
>>          struct device *dev = &client->dev;
>>          struct device_node *endpoint;
>>          struct sii902x *sii902x;
>> +       static const char * const supplies[] = {"iovcc", "cvcc12"};
>>          int ret;
>>
>>          ret = i2c_check_functionality(client->adapter,
>> @@ -1122,27 +1122,13 @@ static int sii902x_probe(struct i2c_client *client,
>>
>>          mutex_init(&sii902x->mutex);
>>
>> -       sii902x->supplies[0].supply = "iovcc";
>> -       sii902x->supplies[1].supply = "cvcc12";
>> -       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(sii902x->supplies),
>> -                                     sii902x->supplies);
>> -       if (ret < 0)
>> -               return ret;
>> -
>> -       ret = regulator_bulk_enable(ARRAY_SIZE(sii902x->supplies),
>> -                                   sii902x->supplies);
>> +       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies), supplies);
>>          if (ret < 0) {
>>                  dev_err_probe(dev, ret, "Failed to enable supplies");
>>                  return ret;
>>          }
>>
>> -       ret = sii902x_init(sii902x);
>> -       if (ret < 0) {
>> -               regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
>> -                                      sii902x->supplies);
>> -       }
>> -
>> -       return ret;
>> +       return sii902x_init(sii902x);
>>   }
>>
>>   static int sii902x_remove(struct i2c_client *client)
>> @@ -1152,8 +1138,6 @@ static int sii902x_remove(struct i2c_client *client)
>>
>>          i2c_mux_del_adapters(sii902x->i2cmux);
>>          drm_bridge_remove(&sii902x->bridge);
>> -       regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
>> -                              sii902x->supplies);
>>
>>          return 0;
>>   }
> 
> Ideally this patch would be split into two parts here, due to
> maintainership boundaries.

Ok. I will in any case respin this series when the dependency patches 
from Mark's tree have been merged to the -rc1. I can split this to 
patch/driver if it is preferred. I just though I'll decrease amount of 
mails by squashing these almost trivial changes.

> 
> For the sii902x part, please add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
Thanks.

Best Regards
  -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
