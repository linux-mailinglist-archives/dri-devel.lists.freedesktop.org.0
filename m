Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA48666AF7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 06:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344C710E878;
	Thu, 12 Jan 2023 05:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FAD10E878
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 05:50:13 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f34so26847663lfv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lGcnxSvWxRWSn9PS7ZT4pBpd8udr62wROyikBYb2lg8=;
 b=pgCckdgUYOyzn4nBv4xRCD62BFDENk27wHATkQXP+fubiRlgLBZ3504Ir7XhJdCDEA
 VoUZJ3QL7KEW2PzVRcHyNK0Wdm/XaK2SreTYuQuAX0x+Ejc61J9glxeAK+sj+X8Bm+pe
 brWS4ZUnE9XAfufpbnONk6cPmb+FqkzeSHj4N517yv2hdHTCl/8794c4G4y6A9dy9eyZ
 qGmFoqkUdyA8yjThsg6eSwa0XtOgS7NclSWy5xN0+O/8zfAEJ8FIhdFWEiushQasj6c3
 si3ZknI6mZc6cwqGGIoGMn+KV/riJPlA+Sn8axTgIn6JKkay+SPLvDGJS/76MIUpWX4R
 gKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lGcnxSvWxRWSn9PS7ZT4pBpd8udr62wROyikBYb2lg8=;
 b=VkXAr2e4XQcD/o9bu0wCoO3IuBgb4jQIEavFiCo06yjDW9OkOeppEff6aztIrvXi5A
 JoIYcRuzfYb/ea442p8Wzzs+dqsWFHvC7rf6lrJL7hanfEkh29PANX6KOAYG3dZWti3w
 bUAdU1spQTbmz+t3I7TtOCUHiN9W+BWhhJEin1OeOE53YPuqBWSzNUCgqE74/YrKmsa4
 Q6ndiumzE0MtUqWrTFKyJt43BKhTdtdnE961fSZJP3eqeqa6nIR1lLiP62rYm25ZCgkM
 WRVWINra53IE5oh+WFEZ4CrM6EIsrb5Q+XHl1yg1cn+Z2bSu24SrAHqWverpu5WB6ALh
 32HA==
X-Gm-Message-State: AFqh2kq+dsOJfCS2TlsyvPyGPrO58N5FSC/HRGoBA5kYSbd0NnRyB6c1
 ZzLXM4H/mcNuwXEOOFuNu5avVw==
X-Google-Smtp-Source: AMrXdXs7D+NmoaqyDhYbSynRH192jtp+5AkzETCjN7fr8RvPNHj/9cpzhaK2bKTBHNW1bnene3ek8Q==
X-Received: by 2002:a05:6512:1281:b0:4cc:8682:ec65 with SMTP id
 u1-20020a056512128100b004cc8682ec65mr4287026lfs.39.1673502612152; 
 Wed, 11 Jan 2023 21:50:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm3105024lfv.128.2023.01.11.21.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 21:50:11 -0800 (PST)
Message-ID: <ca54d156-b38f-677e-2f48-8146323014b3@linaro.org>
Date: Thu, 12 Jan 2023 07:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 3/9] drm/display: Add Type-C switch helpers
Content-Language: en-GB
To: Pin-yen Lin <treapking@chromium.org>
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-4-treapking@chromium.org>
 <ccea730e-c5cb-4225-8d1e-97a0a7cb2e34@linaro.org>
 <CAEXTbpek=5xqo2j0yKkC90+Oy1rXWQLJWu3X6vx6y-SqvxTvnA@mail.gmail.com>
 <e98a42d5-b97a-5482-1bad-478c234444ce@linaro.org>
 <CAEXTbpfrZCD-53wx2RaboH4rYPF7qm7TrhxyN80k++CZ2UqTKA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAEXTbpfrZCD-53wx2RaboH4rYPF7qm7TrhxyN80k++CZ2UqTKA@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 shaomin Deng <dengshaomin@cdjrlc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 07:48, Pin-yen Lin wrote:
> On Thu, Jan 12, 2023 at 1:24 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 12/01/2023 07:19, Pin-yen Lin wrote:
>>> Hi Dmitry,
>>>
>>> Thanks for the review.
>>>
>>> On Thu, Jan 12, 2023 at 12:40 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On 12/01/2023 06:20, Pin-yen Lin wrote:
>>>>> Add helpers to register and unregister Type-C "switches" for bridges
>>>>> capable of switching their output between two downstream devices.
>>>>>
>>>>> The helper registers USB Type-C mode switches when the "mode-switch"
>>>>> and the "data-lanes" properties are available in Device Tree.
>>>>>
>>>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>>>>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Changes in v10:
>>>>> - Collected Reviewed-by and Tested-by tags
>>>>> - Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
>>>>> - Print out the node name when errors on parsing DT
>>>>> - Use dev_dbg instead of dev_warn when no Type-C switch nodes available
>>>>> - Made the return path of drm_dp_register_mode_switch clearer
>>>>>
>>>>> Changes in v8:
>>>>> - Fixed the build issue when CONFIG_TYPEC=m
>>>>> - Fixed some style issues
>>>>>
>>>>> Changes in v7:
>>>>> - Extracted the common codes to a helper function
>>>>> - New in v7
>>>>>
>>>>>     drivers/gpu/drm/display/drm_dp_helper.c | 134 ++++++++++++++++++++++++
>>>>>     include/drm/display/drm_dp_helper.h     |  17 +++
>>>>>     2 files changed, 151 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>>>>> index 16565a0a5da6..a2ec40a621cb 100644
>>>>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>>>>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>>>>> @@ -30,11 +30,13 @@
>>>>>     #include <linux/sched.h>
>>>>>     #include <linux/seq_file.h>
>>>>>     #include <linux/string_helpers.h>
>>>>> +#include <linux/usb/typec_mux.h>
>>>>>     #include <linux/dynamic_debug.h>
>>>>>
>>>>>     #include <drm/display/drm_dp_helper.h>
>>>>>     #include <drm/display/drm_dp_mst_helper.h>
>>>>>     #include <drm/drm_edid.h>
>>>>> +#include <drm/drm_of.h>
>>>>>     #include <drm/drm_print.h>
>>>>>     #include <drm/drm_vblank.h>
>>>>>     #include <drm/drm_panel.h>
>>>>> @@ -3891,3 +3893,135 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
>>>>>     EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>>>>>
>>>>>     #endif
>>>>> +
>>>>> +#if IS_REACHABLE(CONFIG_TYPEC)
>>>>> +static int drm_dp_register_mode_switch(struct device *dev, struct device_node *node,
>>>>> +                                    struct drm_dp_typec_switch_desc *switch_desc,
>>>>> +                                    void *data, typec_mux_set_fn_t mux_set)
>>>>> +{
>>>>> +     struct drm_dp_typec_port_data *port_data;
>>>>> +     struct typec_mux_desc mux_desc = {};
>>>>> +     char name[32];
>>>>> +     u32 dp_lanes[2];
>>>>> +     int ret, num_lanes, port_num = -1;
>>>>> +
>>>>> +     num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
>>>>
>>>> 2 looks incorrect. IIRC DP altmode can support up to 4 lanes.
>>>
>>> This function is implemented for 4-lane DP bridges to switch its
>>> outputs between 2 downstreams. So, I assume that there will only be at
>>> most 2 lanes for each downstream. I don't think a 4-lane downstream
>>> makes sense for mode switches unless we want to support bridges with
>>> more than 4 lanes.
>>
>> Yes. However by using 4 here you'd make the helper generic and cover
>> both your case and the generic case. We don't need this for the msm case
>> (since the mux is handled by the PHY). But if not for the PHY, I'd have
>> used such helper (with max_lanes = 4).
>>
> I wonder if simply using 4 here really makes it more generic here.
> This function assumes the mapping between "data-lanes" and the port
> number (e.g., 0/1 --> port 0) and hard-coded the way to parse the
> property.
> 
> Is it better to use "reg" instead of "data-lanes" to determine the
> port number? The drivers can still read the DT node to get the
> "data-lanes" property if they want to do some fancy stuffs around
> that.

Yes, I admit, this sounds more logical.

>>>>
>>>>> +     if (num_lanes <= 0) {
>>>>> +             dev_err(dev, "Error on getting data lanes count from %s: %d\n",
>>>>> +                     node->name, num_lanes);
>>>>> +             return num_lanes;
>>>>> +     }
>>>>> +
>>>>> +     ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
>>>>> +     if (ret) {
>>>>> +             dev_err(dev, "Failed to read the data-lanes variable from %s: %d\n",
>>>>> +                     node->name, ret);
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     port_num = dp_lanes[0] / 2;
>>>>> +
>>>>> +     port_data = &switch_desc->typec_ports[port_num];
>>>>> +     port_data->data = data;
>>>>> +     mux_desc.fwnode = &node->fwnode;
>>>>> +     mux_desc.drvdata = port_data;
>>>>> +     snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
>>>>> +     mux_desc.name = name;
>>>>> +     mux_desc.set = mux_set;
>>>>> +
>>>>> +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
>>>>> +     if (IS_ERR(port_data->typec_mux)) {
>>>>> +             ret = PTR_ERR(port_data->typec_mux);
>>>>> +             dev_err(dev, "Mode switch register for port %d failed: %d\n",
>>>>> +                     port_num, ret);
>>>>> +
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_dp_register_typec_switches() - register Type-C switches
>>>>> + * @dev: Device that registers Type-C switches
>>>>> + * @port: Device node for the switch
>>>>> + * @switch_desc: A Type-C switch descriptor
>>>>> + * @data: Private data for the switches
>>>>> + * @mux_set: Callback function for typec_mux_set
>>>>> + *
>>>>> + * This function registers USB Type-C switches for DP bridges that can switch
>>>>> + * the output signal between their output pins.
>>>>> + *
>>>>> + * Currently only mode switches are implemented, and the function assumes the
>>>>> + * given @port device node has endpoints with "mode-switch" property.
>>>>> + * Register the endpoint as port 0 if the "data-lanes" property falls in 0/1,
>>>>> + * and register it as port 1 if "data-lanes" falls in 2/3.
>>>>> + */
>>>>> +int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
>>>>> +                                struct drm_dp_typec_switch_desc *switch_desc,
>>>>> +                                void *data, typec_mux_set_fn_t mux_set)
>>>>> +{
>>>>> +     struct device_node *sw;
>>>>> +     int ret;
>>>>> +
>>>>> +     for_each_child_of_node(port, sw) {
>>>>> +             if (of_property_read_bool(sw, "mode-switch"))
>>>>> +                     switch_desc->num_typec_switches++;
>>>>> +     }
>>>>> +
>>>>> +     if (!switch_desc->num_typec_switches) {
>>>>> +             dev_dbg(dev, "No Type-C switches node found\n");
>>>>> +             return 0;
>>>>> +     }
>>>>> +
>>>>> +     switch_desc->typec_ports = devm_kcalloc(
>>>>> +             dev, switch_desc->num_typec_switches,
>>>>> +             sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
>>>>> +
>>>>> +     if (!switch_desc->typec_ports)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     /* Register switches for each connector. */
>>>>> +     for_each_child_of_node(port, sw) {
>>>>> +             if (!of_property_read_bool(sw, "mode-switch"))
>>>>> +                     continue;
>>>>> +             ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
>>>>> +             if (ret)
>>>>> +                     goto err_unregister_typec_switches;
>>>>> +     }
>>>>> +
>>>>> +     return 0;
>>>>> +
>>>>> +err_unregister_typec_switches:
>>>>> +     of_node_put(sw);
>>>>> +     drm_dp_unregister_typec_switches(switch_desc);
>>>>> +     dev_err(dev, "Failed to register mode switch: %d\n", ret);
>>>>> +     return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_dp_register_typec_switches);
>>>>> +
>>>>> +/**
>>>>> + * drm_dp_unregister_typec_switches() - unregister Type-C switches
>>>>> + * @switch_desc: A Type-C switch descriptor
>>>>> + */
>>>>> +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
>>>>> +{
>>>>> +     int i;
>>>>> +
>>>>> +     for (i = 0; i < switch_desc->num_typec_switches; i++)
>>>>> +             typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
>>>>> +#else
>>>>> +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
>>>>> +{
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_dp_register_typec_switches);
>>>>> +int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
>>>>> +                                struct drm_dp_typec_switch_desc *switch_desc,
>>>>> +                                void *data, typec_mux_set_fn_t mux_set)
>>>>> +{
>>>>> +     return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
>>>>> +#endif
>>>>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>>>>> index ab55453f2d2c..5a3824f13b4e 100644
>>>>> --- a/include/drm/display/drm_dp_helper.h
>>>>> +++ b/include/drm/display/drm_dp_helper.h
>>>>> @@ -25,6 +25,7 @@
>>>>>
>>>>>     #include <linux/delay.h>
>>>>>     #include <linux/i2c.h>
>>>>> +#include <linux/usb/typec_mux.h>
>>>>>
>>>>>     #include <drm/display/drm_dp.h>
>>>>>     #include <drm/drm_connector.h>
>>>>> @@ -763,4 +764,20 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
>>>>>                                                const u8 port_cap[4], u8 color_spc);
>>>>>     int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
>>>>>
>>>>> +struct drm_dp_typec_port_data {
>>>>> +     struct typec_mux_dev *typec_mux;
>>>>> +     void *data;
>>>>> +     bool dp_connected;
>>>>> +};
>>>>> +
>>>>> +struct drm_dp_typec_switch_desc {
>>>>> +     int num_typec_switches;
>>>>> +     struct drm_dp_typec_port_data *typec_ports;
>>>>> +};
>>>>> +
>>>>> +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc);
>>>>> +int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
>>>>> +                                struct drm_dp_typec_switch_desc *switch_desc,
>>>>> +                                void *data, typec_mux_set_fn_t mux_set);
>>>>> +
>>>>>     #endif /* _DRM_DP_HELPER_H_ */
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>>>
>>>
>>> Best regards,
>>> Pin-yen
>>
>> --
>> With best wishes
>> Dmitry
>>
> Best regards,
> Pin-yen

-- 
With best wishes
Dmitry

