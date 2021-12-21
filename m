Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D347B995
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 06:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CF810E121;
	Tue, 21 Dec 2021 05:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B9510E121
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 05:35:21 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a37so19532155ljq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 21:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1XV16ViWbi8UOonPiG6SmegCY1/a6VNrUySiqZuhDmI=;
 b=YRAOn+N3wRYC4tO8w5tk9tA+ys68r/y2VyVGIh8vvtV2kWewI4IvVnlMzthG0NoUd3
 l9z+CflX+ojCC3TVfW5/aa6t63qXX30wMneJ5m7PfPja41qpTFup4y6HNdb/YZScX1Mg
 54oReQQv8ksbpkI6D2WoE44eL1aAK2RM23a6dco9ERoUSdS5HSa+pq18HE6O4gBYsInL
 9FuNef0lq2F7fvQHXPu3Sjm3Jc1Xiz7DrMc4oDeObs0HxDDK0+dBaCmcYqSr6idSYr0m
 QX5vTafVXWgQPJDHXSktVETBzNC6G6axvQnO1y3XG7Oa58DjZ9oom1T0DiwODi//5QxK
 RgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1XV16ViWbi8UOonPiG6SmegCY1/a6VNrUySiqZuhDmI=;
 b=6shpfAPcx+iRXx3kYH/9pAm9zxoP5t8diPOlFBQ1cZOXIlab3ec5Dnd7sdFd1TviM+
 lYWZ7MNfCjPUapLHBpQaYgYkmEpeYH3uN3QxIxiXLs9vI0o4Lf5oXowT7+rCvlDKivbb
 yxxvpCptStVdK8pVJXD5xb170bEopI1C+G/X9wQPFQoBClrH2kGAPmlvyaSChEfae2aR
 /k6R9/tMmpCwTAeYmLtCd/2M0fl43d8I4MjM6cWvjQ2cWaHG/l6WDrz7X21S59eiJGGn
 TAu3bq4mwtjGgNshJ+U+gr3Xz2b3I7f41nbzCgWUYppRvWsRqtlqthzygD5ZwqW7Blih
 ewXQ==
X-Gm-Message-State: AOAM531tzf1IgW9jLzuybja9q2pc8n//IPh9sfAppS4/XvahCPpnPadU
 qlPqMAEx7nB8z9ALIACsq1w=
X-Google-Smtp-Source: ABdhPJw4pj1EwEjLkFeiFPkVepM9LvL+knAap2pIRATQBEbEq8mmbMJNZXHGYBw2SHsq8fOkkWUi8w==
X-Received: by 2002:a2e:1644:: with SMTP id 4mr1252175ljw.312.1640064920212;
 Mon, 20 Dec 2021 21:35:20 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id u8sm2652802lje.91.2021.12.20.21.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 21:35:19 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
 <34cea860-9f5b-153e-6103-dadc7da11da4@gmail.com>
Message-ID: <135507a4-d8e4-53b1-8235-b1821d4d97e0@gmail.com>
Date: Tue, 21 Dec 2021 08:35:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <34cea860-9f5b-153e-6103-dadc7da11da4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

20.12.2021 19:55, Dmitry Osipenko пишет:
> 20.12.2021 19:12, Dmitry Osipenko пишет:
>> 20.12.2021 18:27, Thierry Reding пишет:
>>> On Mon, Dec 20, 2021 at 05:45:41PM +0300, Dmitry Osipenko wrote:
>>>> 20.12.2021 13:48, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> Hi,
>>>>>
>>>>> this is an alternative proposal to fix panel support on Venice 2 and
>>>>> Nyan. Dmitry had proposed a different solution that involved reverting
>>>>> the I2C/DDC registration order and would complicate things by breaking
>>>>> the encapsulation of the driver by introducing a global (though locally
>>>>> scoped) variable[0].
>>>>>
>>>>> This set of patches avoids that by using the recently introduced DP AUX
>>>>> bus infrastructure. The result is that the changes are actually less
>>>>> intrusive and not a step back. Instead they nicely remove the circular
>>>>> dependency that previously existed and caused these issues in the first
>>>>> place.
>>>>>
>>>>> To be fair, this is not perfect either because it requires a device tree
>>>>> change and hence isn't technically backwards-compatible. However, given
>>>>> that the original device tree was badly broken in the first place, I
>>>>> think we can make an exception, especially since it is not generally a
>>>>> problem to update device trees on the affected devices.
>>>>>
>>>>> Secondly, this relies on infrastructure that was introduced in v5.15 and
>>>>> therefore will be difficult to backport beyond that. However, since this
>>>>> functionality has been broken since v5.13 and all of the kernel versions
>>>>> between that and v5.15 are EOL anyway, there isn't much that we can do
>>>>> to fix the interim versions anyway.
>>>>>
>>>>> Adding Doug and Laurent since they originally designed the AUX bus
>>>>> patches in case they see anything in here that would be objectionable.
>>>>>
>>>>> Thierry
>>>>>
>>>>> [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gmail.com/
>>>>>
>>>>> Thierry Reding (2):
>>>>>   drm/tegra: dpaux: Populate AUX bus
>>>>>   ARM: tegra: Move panels to AUX bus
>>>>>
>>>>>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>>>>>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>>>>>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>>>>>  drivers/gpu/drm/tegra/Kconfig             |  1 +
>>>>>  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
>>>>>  5 files changed, 33 insertions(+), 19 deletions(-)
>>>>>
>>>>
>>>> It should "work" since you removed the ddc-i2c-bus phandle from the
>>>> panel nodes, and thus, panel->ddc won't be used during panel-edp driver
>>>> probe. But this looks like a hack rather than a fix.
>>>
>>> The AUX ->ddc will be used for panel->ddc if the ddc-i2c-bus property is
>>> not specified. And that makes perfect sense because we'd basically just
>>> be pointing back to the AUX node anyway.
>>>
>>>> I'm not sure why and how devm_of_dp_aux_populate_ep_devices() usage
>>>> should be relevant here. The drm_dp_aux_register() still should to
>>>> invoked before devm_of_dp_aux_populate_ep_devices(), otherwise
>>>> panel->ddc adapter won't be registered.
>>>
>>> drm_dp_aux_register() is only needed to expose the device to userspace
>>> and make the I2C adapter available to the rest of the system. But since
>>> we already know the AUX and I2C adapter, we can use it directly without
>>> doing a separate lookup. drm_dp_aux_init() should be enough to set the
>>> adapter up to work for what we need.
>>>
>>> See also the kerneldoc for drm_dp_aux_register() where this is described
>>> in a bit more detail.
>>
>> Alright, so you fixed it by removing the ddc-i2c-bus phandles and I2C
>> DDC will work properly anyways with that on v5.16.
>>
>> But the aux-bus usage still is irrelevant for the fix. Let's not use it
>> then.
>>
>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>> instantiated, AFAICS.
>>>
>>> I've tested this and it works fine on Venice 2. Since that was the
>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>
>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>> test this to verify that.
>>
>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>> 2023, hence we need to either use:
>>
>> Approach #1:
>>
>> 1. apply my variant of the fix
>> 2. backport it to v5.15
>> 3. apply your variant without aux-bus, replacing my fix on 5.16+
> 
> Although, I see that it doesn't make much sense to say "your variant
> without aux-bus". "Remove ddc-i2c-bus phandles from DTs" will be better.
> 
>> Or
>>
>> Approach #2:
>>
>> 1. remove ddc-i2c-bus phandles in DTs
>> 2. backport (?) it to v5.15
>> 3. apply your variant without aux-bus
>>
>> Or
>>
>> Approach #3:
>>
>> 1. ignore v5.15 and keep it screwed
>> 2. apply your variant as is
>>
>> Which approach will you prefer?
>>
>> I'm not happy that older DTBs will be broken. Can we do better about it?
>>
>> Is it possible to patch DT in the code by removing the ddc-i2c-bus phandle?
>>
>> Or can we patch panel-simple on 5.15 and panel-edp on 5.16, making these
>> drivers to skip ddc-i2c-bus on Tegra+eDP? The eDP driver fixup will be
>> trivial, fixing older panel-simple will be more invasive.
>>
>> I think the best solution will be to use Approach #1 and in the end
>> complete it with this panel-edp workaround below. This approach will
>> have minimal code impact on 5.16+ kernels and will keep older DTBs
>> working. Are you okay with this?
>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c
>> b/drivers/gpu/drm/panel/panel-edp.c
>> index 176ef0c3cc1d..4e5b84324659 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -793,7 +793,11 @@ static int panel_edp_probe(struct device *dev,
>> const struct panel_desc *desc,
>>  		return err;
>>  	}
>>
>> -	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
>> +	if (of_machine_is_compatible("nvidia,tegra124"))
>> +		ddc = NULL;
>> +	else
>> +		ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
>> +
>>  	if (ddc) {
>>  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
>>  		of_node_put(ddc);
>>
> 
> Another alternative that may work is to check whether ddc-i2c-bus and
> DPAUX use the same node.
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c
> b/drivers/gpu/drm/panel/panel-edp.c
> index 176ef0c3cc1d..c8cf5bc3d148 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -794,7 +794,7 @@ static int panel_edp_probe(struct device *dev, const
> struct panel_desc *desc,
>  	}
> 
>  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
> -	if (ddc) {
> +	if (ddc && ddc != aux->dev->of_node) {
>  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
>  		of_node_put(ddc);
> 

I see now that the aux pointer should be populated only if aux-bus is
used, so this won't work.
