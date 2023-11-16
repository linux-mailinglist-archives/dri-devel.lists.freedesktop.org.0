Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF87EE5CE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 18:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F5510E64C;
	Thu, 16 Nov 2023 17:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25B10E64C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 17:19:08 +0000 (UTC)
Message-ID: <61f1dc2f-84f8-4f04-8348-7a4470a1276c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700155146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TARHde0sFs8qgNsgLPodLMIcclZW4YUzjnq82Sj4biw=;
 b=xQLmjonW5st3kklBD1rTDmDRv2AUILW3a57R3WgGtQbdgdl7n5lAd/Y3Qg0lCmCGojHEmQ
 vhD8DlzIIJ30vIcq7pX46tNnot7hKxhlJv8W/eEeMh5wmf85FAZhwzbe93JmC3PgRd3mwQ
 yelPe+wcdCT6TdvMPTYH/fPGeZWyBLc=
Date: Fri, 17 Nov 2023 01:18:49 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
 <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/11/16 23:23, Dmitry Baryshkov wrote:
> On Thu, 16 Nov 2023 at 14:08, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>
>> On 2023/11/16 19:53, Sui Jingfeng wrote:
>>> Hi,
>>>
>>>
>>> On 2023/11/16 19:29, Dmitry Baryshkov wrote:
>>>> On Thu, 16 Nov 2023 at 13:18, Sui Jingfeng <sui.jingfeng@linux.dev>
>>>> wrote:
>>>>> Hi,
>>>>>
>>>>>
>>>>> On 2023/11/15 00:30, Dmitry Baryshkov wrote:
>>>>>>> +
>>>>>>> +               ctx->connector = connector;
>>>>>>> +       }
>>>>>>>
>>>>>>>            if (ctx->info->id == ID_IT66121) {
>>>>>>>                    ret = regmap_write_bits(ctx->regmap,
>>>>>>> IT66121_CLK_BANK_REG,
>>>>>>> @@ -1632,16 +1651,13 @@ static const char * const
>>>>>>> it66121_supplies[] = {
>>>>>>>            "vcn33", "vcn18", "vrf12"
>>>>>>>     };
>>>>>>>
>>>>>>> -static int it66121_probe(struct i2c_client *client)
>>>>>>> +int it66121_create_bridge(struct i2c_client *client, bool
>>>>>>> of_support,
>>>>>>> +                         bool hpd_support, bool audio_support,
>>>>>>> +                         struct drm_bridge **bridge)
>>>>>>>     {
>>>>>>> +       struct device *dev = &client->dev;
>>>>>>>            int ret;
>>>>>>>            struct it66121_ctx *ctx;
>>>>>>> -       struct device *dev = &client->dev;
>>>>>>> -
>>>>>>> -       if (!i2c_check_functionality(client->adapter,
>>>>>>> I2C_FUNC_I2C)) {
>>>>>>> -               dev_err(dev, "I2C check functionality failed.\n");
>>>>>>> -               return -ENXIO;
>>>>>>> -       }
>>>>>>>
>>>>>>>            ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>>>>>            if (!ctx)
>>>>>>> @@ -1649,24 +1665,19 @@ static int it66121_probe(struct i2c_client
>>>>>>> *client)
>>>>>>>
>>>>>>>            ctx->dev = dev;
>>>>>>>            ctx->client = client;
>>>>>>> -       ctx->info = i2c_get_match_data(client);
>>>>>>> -
>>>>>>> -       ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
>>>>>>> -       if (ret)
>>>>>>> -               return ret;
>>>>>>> -
>>>>>>> -       ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
>>>>>>> -       if (ret)
>>>>>>> -               return ret;
>>>>>>> -
>>>>>>> -       i2c_set_clientdata(client, ctx);
>>>>>>>            mutex_init(&ctx->lock);
>>>>>>>
>>>>>>> -       ret = devm_regulator_bulk_get_enable(dev,
>>>>>>> ARRAY_SIZE(it66121_supplies),
>>>>>>> - it66121_supplies);
>>>>>>> -       if (ret) {
>>>>>>> -               dev_err(dev, "Failed to enable power supplies\n");
>>>>>>> -               return ret;
>>>>>>> +       if (of_support) {
>>>>>>> +               ret = it66121_of_read_bus_width(dev,
>>>>>>> &ctx->bus_width);
>>>>>>> +               if (ret)
>>>>>>> +                       return ret;
>>>>>>> +
>>>>>>> +               ret = it66121_of_get_next_bridge(dev,
>>>>>>> &ctx->next_bridge);
>>>>>>> +               if (ret)
>>>>>>> +                       return ret;
>>>>>>> +       } else {
>>>>>>> +               ctx->bus_width = 24;
>>>>>>> +               ctx->next_bridge = NULL;
>>>>>>>            }
>>>>>> A better alternative would be to turn OF calls into fwnode calls and
>>>>>> to populate the fwnode properties. See
>>>>>> drivers/platform/x86/intel/chtwc_int33fe.c for example.
>>>>> Honestly, I don't want to leave any scratch(breadcrumbs).
>>>>> I'm worries about that turn OF calls into fwnode calls will leave
>>>>> something unwanted.
>>>>>
>>>>> Because I am not sure if fwnode calls will make sense in the DT
>>>>> world, while my patch
>>>>> *still* be useful in the DT world.
>>>> fwnode calls work for both DT and non-DT cases. In the DT case they
>>>> work with DT nodes and properties. In the non-DT case, they work with
>>>> manually populated properties.
>>>>
>>>>> Because the newly introduced it66121_create_bridge()
>>>>> function is a core. I think It's better leave this task to a more
>>>>> advance programmer.
>>>>> if there have use case. It can be introduced at a latter time,
>>>>> probably parallel with
>>>>> the DT.
>>>>>
>>>>> I think DT and/or ACPI is best for integrated devices, but it66121
>>>>> display bridges is
>>>>> a i2c slave device. Personally, I think slave device shouldn't be
>>>>> standalone. I'm more
>>>>> prefer to turn this driver to support hot-plug, even remove the
>>>>> device on the run time
>>>>> freely when detach and allow reattach. Like the I2C EEPROM device in
>>>>> the monitor (which
>>>>> contains the EDID, with I2C slave address 0x50). The I2C EEPROM
>>>>> device *also* don't has
>>>>> a corresponding struct device representation in linux kernel.
>>>> It has. See i2c_client::dev.
>>> No, what I mean is that there don't have a device driver for
>>> monitor(display) hardware entity.
>>> And the drm_do_probe_ddc_edid() is the static linked driver, which is
>>> similar with the idea
>>> this series want to express.
> Because the monitor is not a part of the display pipeline.
>
I think the monitor *is definitely* part of the display pipeline, and it
is the most important part of the entire display pipeline.

1)

DPMS, self-refreshing, display timings, resolutions supported, HDR, DSC,
gsync and freesync etc can be part of whole mode-set. Please consider
what the various ->mode_valid() and -> the atomic_check() are for?

2)

If the monitor is not a part of the display pipeline, then the various
display panels hardware should also not be part of the display pipeline.
Because they are all belong to display category.
  
the monitor = panel + panel drive IC(such as RTD2281CL, HT1622, ssd130x).

There are panel bridges which abstract the panel + connector as a drm bridge,
why the bare panel can be part of the display pipeline, while the more complex
monitor can't be?

