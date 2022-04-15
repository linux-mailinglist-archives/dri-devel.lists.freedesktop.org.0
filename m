Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48160501FC5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 02:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CEA10E6B3;
	Fri, 15 Apr 2022 00:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43C710E68C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 00:47:00 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bj36so2103528ljb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 17:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=csxGDJowjwfPfYbPWapMKvmutL0jsjVI2/38LVM08ks=;
 b=YEZiGpver9sFJAEaj/Wlc4KH7/QjuuTQm2INVtXsCnOkKyaMHHV1B/AAm8WGVpIXk7
 0mzrr4pHLliyFt4W/TtUbcGNt5ksYaZFWIoHKEfsC5c2np5ZrRJHb0DGd3WWVWu7NXeA
 mBEU9/Pyv+9Ihhrwh7Tv3nwTrZBtqFFWoR+D2eHXew++ORh8dY5Lbvct+tUEJMHt8Qhq
 /+0modCBYvkaxfVGNr2OcPuBF/yIfAY48MqAdz2eOuUOLF/7Z/ZMdrswEWrT5jpgF78B
 cF+tCvv/CY4HHtzt8UdZn94RJm+pNsvWyAt9Ok16y1RwGnd1wcboD1VmP+P6SsvaQyIZ
 3EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=csxGDJowjwfPfYbPWapMKvmutL0jsjVI2/38LVM08ks=;
 b=H2U9dwwO1MBwfYhAgz0YffnORVnx2GTBy837E7Iekdn3jg7nGy5dGLzygHarWYALmG
 sncANETLqc7gr6fF6HDqtkQiq784vd/rrAk3O+XsTEA/XAFklZWlR/wrIoh8XOzGKP7i
 x7Qa9gZeiVGEypFsLPei5nIWo1sJr13UqMON/wpg8xsbZ3ig42elpNs6MOutpUImvwrP
 UmYOdYiFpVZFYQoEr3ieQUTBwmzbHv5DwaL26Q26Bk40ULDfFU/YJXUfiguXhlFWiOGx
 HpMdRSP7e7SE2wNcWkLXgjcNN/vK6pVdkgEVgndgxjPncrq5mO65mPP+0w1iA78j93PC
 qmjg==
X-Gm-Message-State: AOAM530FpVwRQjY6UOV6IJid8MwVsuj9orEZbKzqr8StOMc9VQTOD1uO
 md4Dbds3ZAC5G8ebLiky0MWOhQ==
X-Google-Smtp-Source: ABdhPJz8ARF1bAttr+X+fmpQu7JeALGm9/J2SuNy0Vpm6dv70D2A/C7tDUMqp9sKKWsLpLzVIesHAA==
X-Received: by 2002:a2e:3a1a:0:b0:24b:59d4:7006 with SMTP id
 h26-20020a2e3a1a000000b0024b59d47006mr3024682lja.392.1649983618953; 
 Thu, 14 Apr 2022 17:46:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a0565120c1800b0044add225193sm156525lfu.228.2022.04.14.17.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 17:46:58 -0700 (PDT)
Message-ID: <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
Date: Fri, 15 Apr 2022 03:46:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/04/2022 05:36, Douglas Anderson wrote:
> As talked about in the kerneldoc for "struct dp_aux_ep_client" in this
> patch and also in the past in commit a1e3667a9835 ("drm/bridge:
> ti-sn65dsi86: Promote the AUX channel to its own sub-dev"), to use the
> DP AUX bus properly we really need two "struct device"s. One "struct
> device" is in charge of providing the DP AUX bus and the other is
> where we'll try to get a reference to the newly probed endpoint
> devices.
> 
> In ti-sn65dsi86 this wasn't too difficult to accomplish. That driver
> is already broken up into several "struct devices" anyway because it
> also provides a PWM and some GPIOs. Adding one more wasn't that
> difficult / ugly.
> 
> When I tried to do the same solution in parade-ps8640, it felt like I
> was copying too much boilerplate code. I made the realization that I
> didn't _really_ need a separate "driver" for each person that wanted
> to do the same thing. By putting all the "driver" related code in a
> common place then we could save a bit of hassle. This change
> effectively adds a new "ep_client" driver that can be used by
> anyone. The devices instantiated by this driver will just call through
> to the probe/remove/shutdown calls provided.
> 
> At the moment, the "ep_client" driver is backed by the Linux auxiliary
> bus (unfortunate naming--this has nothing to do with DP AUX). I didn't
> want to expose this to clients, though, so as far as clients are
> concerned they get a vanilla "struct device".

I have been thinking about your approach for quite some time. I think 
that enforcing a use of auxilliary device is an overkill. What do we 
really need is the the set callbacks in the bus struct or a notifier. We 
have to notify the aux_bus controller side that the client has been 
probed successfully or that the client is going to be removed. And this 
approach would make driver's life easier, since e.g. the bus code can 
pm_get the EP device before calling callbacks/notifiers and 
pm_put_autosuspend it afterwards.

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/dp/drm_dp_aux_bus.c | 165 +++++++++++++++++++++++++++-
>   include/drm/dp/drm_dp_aux_bus.h     |  58 ++++++++++
>   2 files changed, 222 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/dp/drm_dp_aux_bus.c b/drivers/gpu/drm/dp/drm_dp_aux_bus.c
> index 415afce3cf96..5386ceacf133 100644
> --- a/drivers/gpu/drm/dp/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/dp/drm_dp_aux_bus.c
> @@ -12,6 +12,7 @@
>    * to perform transactions on that bus.
>    */
>   
> +#include <linux/auxiliary_bus.h>
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> @@ -299,6 +300,163 @@ void dp_aux_dp_driver_unregister(struct dp_aux_ep_driver *drv)
>   }
>   EXPORT_SYMBOL_GPL(dp_aux_dp_driver_unregister);
>   
> +/* -----------------------------------------------------------------------------
> + * DP AUX EP Client
> + */
> +
> +struct dp_aux_ep_client_data {
> +	struct dp_aux_ep_client *client;
> +	struct auxiliary_device adev;
> +};
> +
> +static int dp_aux_ep_client_probe(struct auxiliary_device *adev,
> +				  const struct auxiliary_device_id *id)
> +{
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	if (!data->client->probe)
> +		return 0;
> +
> +	return data->client->probe(&adev->dev, data->client);
> +}
> +
> +static void dp_aux_ep_client_remove(struct auxiliary_device *adev)
> +{
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	if (data->client->remove)
> +		data->client->remove(&adev->dev, data->client);
> +}
> +
> +static void dp_aux_ep_client_shutdown(struct auxiliary_device *adev)
> +{
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	if (data->client->shutdown)
> +		data->client->shutdown(&adev->dev, data->client);
> +}
> +
> +static void dp_aux_ep_client_dev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +	struct dp_aux_ep_client_data *data =
> +		container_of(adev, struct dp_aux_ep_client_data, adev);
> +
> +	kfree(data);
> +}
> +
> +/**
> + * dp_aux_register_ep_client() - Register an DP AUX EP client
> + * @client: The structure describing the client. It's the client's
> + *          responsibility to keep this memory around until
> + *          dp_aux_unregister_ep_client() is called, either explicitly or
> + *          implicitly via devm.
> + *
> + * See the description of "struct dp_aux_ep_client" for a full explanation
> + * of when you should use this and why.
> + *
> + * Return: 0 if no error or negative error code.
> + */
> +int dp_aux_register_ep_client(struct dp_aux_ep_client *client)
> +{
> +	struct dp_aux_ep_client_data *data;
> +	int ret;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	data->adev.name = "ep_client";
> +	data->adev.dev.parent = client->aux->dev;
> +	data->adev.dev.release = dp_aux_ep_client_dev_release;
> +	device_set_of_node_from_dev(&data->adev.dev, client->aux->dev);
> +
> +	ret = auxiliary_device_init(&data->adev);
> +	if (ret) {
> +		/*
> +		 * NOTE: if init doesn't fail then it takes ownership
> +		 * of memory and this kfree() is magically part of
> +		 * auxiliary_device_uninit().
> +		 */
> +		kfree(data);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(&data->adev);
> +	if (ret)
> +		goto err_did_init;
> +
> +	client->_opaque = data;
> +
> +	return 0;
> +
> +err_did_init:
> +	auxiliary_device_uninit(&data->adev);
> +	return ret;
> +}
> +
> +/**
> + * dp_aux_unregister_ep_client() - Inverse of dp_aux_register_ep_client()
> + * @client: The structure describing the client.
> + *
> + * If dp_aux_register_ep_client() returns no error then you should call this
> + * to free resources.
> + */
> +void dp_aux_unregister_ep_client(struct dp_aux_ep_client *client)
> +{
> +	struct dp_aux_ep_client_data *data = client->_opaque;
> +
> +	auxiliary_device_delete(&data->adev);
> +	auxiliary_device_uninit(&data->adev);
> +}
> +
> +static void dp_aux_unregister_ep_client_void(void *data)
> +{
> +	dp_aux_unregister_ep_client(data);
> +}
> +
> +/**
> + * devm_dp_aux_register_ep_client() - devm wrapper for dp_aux_register_ep_client()
> + * @client: The structure describing the client.
> + *
> + * Handles freeing w/ devm on the device "client->aux->dev".
> + *
> + * Return: 0 if no error or negative error code.
> + */
> +int devm_dp_aux_register_ep_client(struct dp_aux_ep_client *client)
> +{
> +	int ret;
> +
> +	ret = dp_aux_register_ep_client(client);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(client->aux->dev,
> +					dp_aux_unregister_ep_client_void,
> +					client);
> +}
> +
> +static const struct auxiliary_device_id dp_aux_ep_client_id_table[] = {
> +	{ .name = "drm_dp_aux_bus.ep_client", },
> +	{},
> +};
> +
> +static struct auxiliary_driver dp_aux_ep_client_driver = {
> +	.name = "ep_client",
> +	.probe = dp_aux_ep_client_probe,
> +	.remove = dp_aux_ep_client_remove,
> +	.shutdown = dp_aux_ep_client_shutdown,
> +	.id_table = dp_aux_ep_client_id_table,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Module init
> + */
> +
>   static int __init dp_aux_bus_init(void)
>   {
>   	int ret;
> @@ -307,11 +465,16 @@ static int __init dp_aux_bus_init(void)
>   	if (ret)
>   		return ret;
>   
> -	return 0;
> +	ret = auxiliary_driver_register(&dp_aux_ep_client_driver);
> +	if (ret)
> +		bus_unregister(&dp_aux_bus_type);
> +
> +	return ret;
>   }
>   
>   static void __exit dp_aux_bus_exit(void)
>   {
> +	auxiliary_driver_unregister(&dp_aux_ep_client_driver);
>   	bus_unregister(&dp_aux_bus_type);
>   }
>   
> diff --git a/include/drm/dp/drm_dp_aux_bus.h b/include/drm/dp/drm_dp_aux_bus.h
> index 4f19b20b1dd6..ecf68b6873bd 100644
> --- a/include/drm/dp/drm_dp_aux_bus.h
> +++ b/include/drm/dp/drm_dp_aux_bus.h
> @@ -54,4 +54,62 @@ int __dp_aux_dp_driver_register(struct dp_aux_ep_driver *aux_ep_drv,
>   				struct module *owner);
>   void dp_aux_dp_driver_unregister(struct dp_aux_ep_driver *aux_ep_drv);
>   
> +/**
> + * struct dp_aux_ep_device - Helper for clients of DP AUX EP devices
> + *
> + * The DP AUX bus can be a bit tricky to use properly. Usually, the way
> + * things work is that:
> + * - The DP controller driver provides the DP AUX bus and would like to probe
> + *   the endpoints on the DP AUX bus (AKA the panel) as part of its probe
> + *   routine.
> + * - The DP controller driver would also like to acquire a reference to the
> + *   DP AUX endpoints (AKA the panel) as part of its probe.
> + *
> + * The problem is that the DP AUX endpoints aren't guaranteed to complete their
> + * probe right away. They could be probing asynchronously or they simply might
> + * fail to acquire some resource and return -EPROBE_DEFER.
> + *
> + * The best way to solve this is to break the DP controller's probe into
> + * two parts. The first part will create the DP AUX bus. The second part will
> + * acquire the reference to the DP AUX endpoint. The first part can complete
> + * finish with no problems and be "done" even if the second part ends up
> + * deferring while waiting for the DP AUX endpoint.
> + *
> + * The dp_aux_ep_client structure and associated functions help with managing
> + * this common case. They will create/add a second "struct device" for you.
> + * In the probe for this second "struct device" (known as the "clientdev" here)
> + * you can acquire references to the AUX DP endpoints and can freely return
> + * -EPROBE_DEFER if they're not ready yet.
> + *
> + * A few notes:
> + * - The parent of the clientdev is guaranteed to be aux->dev
> + * - The of_node of the clientdev is guaranteed to be the same as the of_node
> + *   of aux->dev, copied with device_set_of_node_from_dev().
> + * - If you're doing "devm" type things in the clientdev's probe you should
> + *   use the clientdev. This makes lifetimes be managed properly.
> + *
> + * NOTE: there's no requirement to use these helpers if you have solved the
> + * problem described above in some other way.
> + */
> +struct dp_aux_ep_client {
> +	/** @probe: The second half of the probe */
> +	int (*probe)(struct device *clientdev, struct dp_aux_ep_client *client);
> +
> +	/** @remove: Remove function corresponding to the probe */
> +	void (*remove)(struct device *clientdev, struct dp_aux_ep_client *client);
> +
> +	/** @shutdown: Shutdown function corresponding to the probe */
> +	void (*shutdown)(struct device *clientdev, struct dp_aux_ep_client *client);
> +
> +	/** @aux: The AUX bus */
> +	struct drm_dp_aux *aux;
> +
> +	/** @_opaque: Used by the implementation */
> +	void *_opaque;
> +};
> +
> +int dp_aux_register_ep_client(struct dp_aux_ep_client *client);
> +void dp_aux_unregister_ep_client(struct dp_aux_ep_client *client);
> +int devm_dp_aux_register_ep_client(struct dp_aux_ep_client *client);
> +
>   #endif /* _DP_AUX_BUS_H_ */


-- 
With best wishes
Dmitry
