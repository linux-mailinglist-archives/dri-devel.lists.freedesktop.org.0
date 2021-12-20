Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5100747B1AF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 17:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780C1121C9;
	Mon, 20 Dec 2021 16:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7868A1121C3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 16:55:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k23so17029689lje.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 08:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYOeRnlNUf07TGfNsuJo6tQ6jQaSc+naJyLeiGaU/PM=;
 b=i2Lh4c73LQtawr4+FXPbBN8NJ+/YjHYjuOMNiNRhJVvIqkS4Odq/zezzkNqxmif3ry
 vZTf0u+6aQEAQ66QNaUZsD3mqHFGG9ShyS3fDktq4PHSKw4ScgWBdHdQTkEwHwPUlz+u
 X65xpUeuS31mT+GbWwPKe+cyXHm0mdr8gMb3rHkJ05xW9bEXAVVwqf5eUJ7u5bIhQR8u
 ZBz98LYSfXWh7VvaVnx51vp4XDcnPfCSG1mOOiGklTv8a4NtpnMpu8QGMWHsw7CF5mD0
 6mRNtnOeig0ch63TZtBR6meqMAawwXJ0xZ4gIXYmwf0DsxuCWj4CGid8GKEqOsNL1+tc
 3FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYOeRnlNUf07TGfNsuJo6tQ6jQaSc+naJyLeiGaU/PM=;
 b=laOUey9pODbbgIAkIi7HNhq+lCzUSdVP8ZfgWc0kEZYQT+KRg/7Tt/ieXm9yA+a/de
 6mHb1e70LCdLOQpaqK3GWe98sc7K4gAM3UjX4cJ69IZpjRPiqi8mDRkMazuaddyEP1SU
 zDI3m2pfFkEHHm0XIoaV1EEqCcIOALIjeJTCA/nbWNRH42VyNQxBU9Zqwgm7f3gHu9M3
 kgLnHziolZu1+++nGqloxTaGrjzq/bh1AWi5I6cNUdwCBAWRqiKU4g3ucuAfMWomI+II
 TVVakR71hywYiZncOwwSZ2SkSWUutNeoiuc8/obEfUFgw7jvf3aKpE17Uf12Yxk+k9X2
 TqHQ==
X-Gm-Message-State: AOAM532MTPDJJD5b0WUDD6UvT3ktralcdxpm109UJ1GajBEJRsh+FKiE
 QwmMw5vb+LgIyeO4S28NnYvPzEuwgJs=
X-Google-Smtp-Source: ABdhPJwVJCUKxaMn3/LEvM3DAubj0wMR0qEfuZelSlQCYtNFut5rMLxzecTgz/VNmONcfZxloF0keQ==
X-Received: by 2002:a2e:b5b7:: with SMTP id f23mr15095546ljn.244.1640019352776; 
 Mon, 20 Dec 2021 08:55:52 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id bi8sm433697lfb.24.2021.12.20.08.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 08:55:52 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
Message-ID: <34cea860-9f5b-153e-6103-dadc7da11da4@gmail.com>
Date: Mon, 20 Dec 2021 19:55:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
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

20.12.2021 19:12, Dmitry Osipenko пишет:
> 20.12.2021 18:27, Thierry Reding пишет:
>> On Mon, Dec 20, 2021 at 05:45:41PM +0300, Dmitry Osipenko wrote:
>>> 20.12.2021 13:48, Thierry Reding пишет:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> Hi,
>>>>
>>>> this is an alternative proposal to fix panel support on Venice 2 and
>>>> Nyan. Dmitry had proposed a different solution that involved reverting
>>>> the I2C/DDC registration order and would complicate things by breaking
>>>> the encapsulation of the driver by introducing a global (though locally
>>>> scoped) variable[0].
>>>>
>>>> This set of patches avoids that by using the recently introduced DP AUX
>>>> bus infrastructure. The result is that the changes are actually less
>>>> intrusive and not a step back. Instead they nicely remove the circular
>>>> dependency that previously existed and caused these issues in the first
>>>> place.
>>>>
>>>> To be fair, this is not perfect either because it requires a device tree
>>>> change and hence isn't technically backwards-compatible. However, given
>>>> that the original device tree was badly broken in the first place, I
>>>> think we can make an exception, especially since it is not generally a
>>>> problem to update device trees on the affected devices.
>>>>
>>>> Secondly, this relies on infrastructure that was introduced in v5.15 and
>>>> therefore will be difficult to backport beyond that. However, since this
>>>> functionality has been broken since v5.13 and all of the kernel versions
>>>> between that and v5.15 are EOL anyway, there isn't much that we can do
>>>> to fix the interim versions anyway.
>>>>
>>>> Adding Doug and Laurent since they originally designed the AUX bus
>>>> patches in case they see anything in here that would be objectionable.
>>>>
>>>> Thierry
>>>>
>>>> [0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gmail.com/
>>>>
>>>> Thierry Reding (2):
>>>>   drm/tegra: dpaux: Populate AUX bus
>>>>   ARM: tegra: Move panels to AUX bus
>>>>
>>>>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>>>>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>>>>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>>>>  drivers/gpu/drm/tegra/Kconfig             |  1 +
>>>>  drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
>>>>  5 files changed, 33 insertions(+), 19 deletions(-)
>>>>
>>>
>>> It should "work" since you removed the ddc-i2c-bus phandle from the
>>> panel nodes, and thus, panel->ddc won't be used during panel-edp driver
>>> probe. But this looks like a hack rather than a fix.
>>
>> The AUX ->ddc will be used for panel->ddc if the ddc-i2c-bus property is
>> not specified. And that makes perfect sense because we'd basically just
>> be pointing back to the AUX node anyway.
>>
>>> I'm not sure why and how devm_of_dp_aux_populate_ep_devices() usage
>>> should be relevant here. The drm_dp_aux_register() still should to
>>> invoked before devm_of_dp_aux_populate_ep_devices(), otherwise
>>> panel->ddc adapter won't be registered.
>>
>> drm_dp_aux_register() is only needed to expose the device to userspace
>> and make the I2C adapter available to the rest of the system. But since
>> we already know the AUX and I2C adapter, we can use it directly without
>> doing a separate lookup. drm_dp_aux_init() should be enough to set the
>> adapter up to work for what we need.
>>
>> See also the kerneldoc for drm_dp_aux_register() where this is described
>> in a bit more detail.
> 
> Alright, so you fixed it by removing the ddc-i2c-bus phandles and I2C
> DDC will work properly anyways with that on v5.16.
> 
> But the aux-bus usage still is irrelevant for the fix. Let's not use it
> then.
> 
>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>> instantiated, AFAICS.
>>
>> I've tested this and it works fine on Venice 2. Since that was the
>> reference design for Nyan, I suspect that Nyan's will also work.
>>
>> It'd be great if Thomas or anyone else with access to a Nyan could
>> test this to verify that.
> 
> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
> 2023, hence we need to either use:
> 
> Approach #1:
> 
> 1. apply my variant of the fix
> 2. backport it to v5.15
> 3. apply your variant without aux-bus, replacing my fix on 5.16+

Although, I see that it doesn't make much sense to say "your variant
without aux-bus". "Remove ddc-i2c-bus phandles from DTs" will be better.

> Or
> 
> Approach #2:
> 
> 1. remove ddc-i2c-bus phandles in DTs
> 2. backport (?) it to v5.15
> 3. apply your variant without aux-bus
> 
> Or
> 
> Approach #3:
> 
> 1. ignore v5.15 and keep it screwed
> 2. apply your variant as is
> 
> Which approach will you prefer?
> 
> I'm not happy that older DTBs will be broken. Can we do better about it?
> 
> Is it possible to patch DT in the code by removing the ddc-i2c-bus phandle?
> 
> Or can we patch panel-simple on 5.15 and panel-edp on 5.16, making these
> drivers to skip ddc-i2c-bus on Tegra+eDP? The eDP driver fixup will be
> trivial, fixing older panel-simple will be more invasive.
> 
> I think the best solution will be to use Approach #1 and in the end
> complete it with this panel-edp workaround below. This approach will
> have minimal code impact on 5.16+ kernels and will keep older DTBs
> working. Are you okay with this?
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c
> b/drivers/gpu/drm/panel/panel-edp.c
> index 176ef0c3cc1d..4e5b84324659 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -793,7 +793,11 @@ static int panel_edp_probe(struct device *dev,
> const struct panel_desc *desc,
>  		return err;
>  	}
> 
> -	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
> +	if (of_machine_is_compatible("nvidia,tegra124"))
> +		ddc = NULL;
> +	else
> +		ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
> +
>  	if (ddc) {
>  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
>  		of_node_put(ddc);
> 

Another alternative that may work is to check whether ddc-i2c-bus and
DPAUX use the same node.

diff --git a/drivers/gpu/drm/panel/panel-edp.c
b/drivers/gpu/drm/panel/panel-edp.c
index 176ef0c3cc1d..c8cf5bc3d148 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -794,7 +794,7 @@ static int panel_edp_probe(struct device *dev, const
struct panel_desc *desc,
 	}

 	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
-	if (ddc) {
+	if (ddc && ddc != aux->dev->of_node) {
 		panel->ddc = of_find_i2c_adapter_by_node(ddc);
 		of_node_put(ddc);

