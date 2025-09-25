Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79786B9FB7B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D190B10E94D;
	Thu, 25 Sep 2025 13:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FT0zNm6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65F310E944
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758808581;
 bh=slNJrvUvalJgEjRI/QEKcr3aGOrfhEydMGMtAVNpyJw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FT0zNm6Cs8dDXxwnnuxI31+IadOQgL7lnHkydqOVyqj3SQP3cOM/C24DaaY+cp4qc
 pPwxjcLKL3IwhPhH3G/nMeleevEm5JI0zEYV9GXy6zkEGbOxpkBq542U0A56ACw/iR
 h9zTEDTTc+Rghe0k1eWbqRxnQUuAingw9b+IKUpHQ2RK/lOuRL9WamARWubnKmwDuv
 68y31Sg1x2rsI/oIvabWpYcrhUUZQyq3grNscXkEUVsQS9sVu5lgku6M6HeZUOgG8h
 5/PeRvAD1IzfKxEBnW/uEa+Z401p5oEVdNuwNaYFvreZ4M06fvZ02CGe9r06Z8zGdr
 V9FEMKRD8irFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5280E17E0FBA;
 Thu, 25 Sep 2025 15:56:20 +0200 (CEST)
Message-ID: <a8014179-14a9-41e1-b023-826b1d5dd8fc@collabora.com>
Date: Thu, 25 Sep 2025 15:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com>
 <673af008-04a8-432d-9517-ca2255e6b35f@collabora.com>
 <13851204.uLZWGnKmhe@workhorse>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <13851204.uLZWGnKmhe@workhorse>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/09/25 21:11, Nicolas Frattaroli ha scritto:
> On Tuesday, 23 September 2025 18:25:53 Central European Summer Time AngeloGioacchino Del Regno wrote:
>> Il 23/09/25 13:40, Nicolas Frattaroli ha scritto:
>>> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
>>> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
>>> integration silicon is required to power on the GPU.
>>>
>>> This glue silicon is in the form of an embedded microcontroller running
>>> special-purpose firmware, which autonomously adjusts clocks and
>>> regulators.
>>>
>>> Implement a driver, modelled as a pmdomain driver with a
>>> set_performance_state operation, to support these SoCs.
>>>
>>> The driver also exposes the actual achieved clock rate, as read back
>>> from the MCU, as common clock framework clocks, by acting as a clock
>>> provider as well.
>>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>> ---
>>>    drivers/pmdomain/mediatek/Kconfig            |  16 +
>>>    drivers/pmdomain/mediatek/Makefile           |   1 +
>>>    drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 928 +++++++++++++++++++++++++++
>>>    3 files changed, 945 insertions(+)
>>>
>>> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
>>> index 0e34a517ab7d5a867bebaab11c0d866282a15e45..2abf78c85d017b1e3526b41c81f274f78d581fd0 100644
>>> [ ... snip ...]
>>> +
>>> +/*
>>> + * This enum is part of the ABI of the GPUEB firmware. Don't change the
>>> + * numbering, as you would wreak havoc.
>>> + */
>>> +enum mtk_mfg_ipi_cmd {
>>> +	CMD_INIT_SHARED_MEM		= 0,
>>> +	CMD_GET_FREQ_BY_IDX		= 1,
>>> +	CMD_GET_POWER_BY_IDX		= 2,
>>> +	CMD_GET_OPPIDX_BY_FREQ		= 3,
>>> +	CMD_GET_LEAKAGE_POWER		= 4,
>>> +	CMD_SET_LIMIT			= 5,
>>> +	CMD_POWER_CONTROL		= 6,
>>> +	CMD_ACTIVE_SLEEP_CONTROL	= 7,
>>> +	CMD_COMMIT			= 8,
>>> +	CMD_DUAL_COMMIT			= 9,
>>> +	CMD_PDCA_CONFIG			= 10,
>>> +	CMD_UPDATE_DEBUG_OPP_INFO	= 11,
>>> +	CMD_SWITCH_LIMIT		= 12,
>>> +	CMD_FIX_TARGET_OPPIDX		= 13,
>>> +	CMD_FIX_DUAL_TARGET_OPPIDX	= 14,
>>> +	CMD_FIX_CUSTOM_FREQ_VOLT	= 15,
>>> +	CMD_FIX_DUAL_CUSTOM_FREQ_VOLT	= 16,
>>> +	CMD_SET_MFGSYS_CONFIG		= 17,
>>> +	CMD_MSSV_COMMIT			= 18,
>>> +	CMD_NUM				= 19,
>>
>> I don't really like seeing index assignments to enumeration, especially when there
>> are no holes... and you have also clearly written that this is ABI-do-not-touch so
>> I'm not sure that having those numbers here is improving anything.
>>
>> I also haven't got strong opinions about that, anyway.
> 
> My main worry is that someone comes by and alphabetically sorts them
> with either some style linter script and does not think to read the
> comment, and it's either an overworked maintainer or get acked by
> an overworked maintainer.
> 
>> [... snip ...]
>>> +
>>> +static int mtk_mfg_eb_off(struct mtk_mfg *mfg)
>>> +{
>>> +	struct device *dev = &mfg->pdev->dev;
>>> +	struct mtk_mfg_ipi_sleep_msg msg = {
>>
>> Can this be constified?
> 
> No :( mbox_send_message's msg parameter is not const, so it'd discard
> the qualifier, and instead of explicitly discarding the qualifier
> (which would be a very stinky code smell) we would have to look into
> whether the mailbox subsystem is cool with const void* for messages,
> and whether all the mailbox drivers are fine with that too.
> 
>>> +		.event = 0,
>>> +		.state = 0,
>>> +		.magic = GPUEB_SLEEP_MAGIC
>>> +	};
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = mbox_send_message(mfg->slp_mbox->ch, &msg);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Cannot send sleep command: %pe\n", ERR_PTR(ret));
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
>>> +				 !(val & PWR_ACK_M), GPUEB_POLL_US,
>>> +				 GPUEB_TIMEOUT_US);
>>> +
>>> +	if (ret)
>>> +		dev_err(dev, "timed out waiting for EB to power off, val=0x%08X\n",
>>> +			val);
>>
>> 90 columns is fine, one line please.
>>
>>> +
>>> +	return ret;
>>> +}
>>> +
>> [... snip ...]
>>> +
>>> +static int mtk_mfg_attach_dev(struct generic_pm_domain *pd, struct device *dev)
>>> +{
>>> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
>>> +	struct dev_pm_opp_data *opps = mfg->gpu_opps;
>>> +	int i, ret;
>>> +
>>> +	for (i = mfg->num_opps - 1; i >= 0; i--) {
>>> +		if ((i == mfg->num_opps - 1) || (opps[i].freq != opps[i + 1].freq)) {
>>
>> 		/* Add a comment here, because you're using a trick, and it's not
>> 		 * very fast to read, as in, if you skim through that, you're most
>> 		 * probably losing the fact that the first OPP is always added
>> 		 * regardless of anything.
>> 		 */
>> 		if ((i != mfg->num_opps - 1) || (opps[i].freq == opps[i + 1].freq))
>> 			continue;
>>
>> 		/* Reduced indentation :-) */
>> 		ret = dev_pm_opp_add_dynamic(.....) etc
>>
> 
> Sure, but not before properly applying De Morgan's law here ;) It
> should be the following as far as I can tell:

WHOOOOOOPS! That was quite a bad typo :D
(yes, of course it's &&)

> 
>      if ((i != mfg->num_opps - 1) && (opps[i].freq == opps[i + 1].freq))
> 			    continue;
> 
>>> +			ret = dev_pm_opp_add_dynamic(dev, &opps[i]);
>>> +			if (ret) {
>>> +				dev_err(dev, "Failed to add OPP level %u from PD %s\n",
>>> +					opps[i].level, pd->name);
>>> +				dev_pm_opp_remove_all_dynamic(dev);
>>> +				return ret;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>> [... snip ...]
>>> +
>>> +static int mtk_mfg_probe(struct platform_device *pdev)
>>> +{
>> [... snip ...]
>>> +
>>> +	ret = clk_prepare_enable(mfg->clk_eb);
>>> +	if (ret)
>>> +		return dev_err_probe(dev, ret, "failed to turn on EB clock\n");
>>
>> What happens if the `gpu_regs` regulator(s) is/are not enabled at boot?
>>
>> I am guessing that the EB doesn't depend at all on these being enabled, as it
>> should be powered by the internal vscp or sspm - but still asking to make sure
>> that this wasn't an overlook.
> 
> Yeah, the EB doesn't need those regulators on. After somewhat fixing module
> unload and reload on my side, I can now confirm that it doesn't appear to
> need them during probe.
> 
>>
>>> +	mfg->ipi_magic = readl(mfg->gpr + GPR_IPI_MAGIC);
>>> +	/* Downstream does this, don't know why. */
>>
>> Preventing reinitialization?
>> Did you try to avoid that write? What happens in that case?
>>
>> Also, if you unload this module and reload it, are you able to reinitialize the EB,
>> or are you reading zero in GPR_IPI_MAGIC (preventing you from correctly reinit this
>> driver again)?
> 
> Okay so this led me down a deep rabbit hole and I realised that so far, we
> could only read the IPI magic because the bootloader helpfully left MFG on
> for us. So on second probe, we'd get a magic number of 0, and all IPI comms
> that use it would fail.

I had a hunch ;-)

> 
> Fix is simple though, just read the magic in power_on. I also left out the
> 0 write but I might experimentally add it back in to see if it changes any
> of the other behaviour I'm currently chasing.
> 

Yeah, we don't know what this write is all about and it logically doesn't make
much sense - so if it works without, let's just leave it out.

>>
>>> +	writel(0x0, mfg->gpr + GPR_IPI_MAGIC);
>>> +
>>> +	ret = mtk_mfg_init_mbox(mfg);
>>> +	if (ret) {
>>> +		ret = dev_err_probe(dev, ret, "Couldn't initialise mailbox\n");
>>> +		goto out;
>>> +	}
>>> +
>>> +	mfg->last_opp = -1;
>>> +
>>> +	ret = mtk_mfg_power_on(&mfg->pd);
>>> +	clk_disable_unprepare(mfg->clk_eb);
>>> +	if (ret)
>>> +		return dev_err_probe(dev, ret, "Failed to power on MFG\n");
>>> +
>>> +	ret = mtk_mfg_init_shared_mem(mfg);
>>> +	if (ret) {
>>> +		dev_err(dev, "Couldn't initialize EB SRAM: %pe\n", ERR_PTR(ret));
>>> +		goto out;
>>> +	}
>>> +
>>> +	ret = mtk_mfg_read_opp_tables(mfg);
>>> +	if (ret) {
>>> +		dev_err(dev, "Error reading OPP tables from EB: %pe\n",
>>> +			ERR_PTR(ret));
>>> +		goto out;
>>> +	}
>>> +
>>> +	ret = mtk_mfg_init_clk_provider(mfg);
>>> +	if (ret)
>>> +		goto out;
>>> +
>>> +	ret = of_genpd_add_provider_simple(pdev->dev.of_node, &mfg->pd);
>>> +	if (ret) {
>>> +		ret = dev_err_probe(dev, ret, "Failed to add pmdomain provider\n");
>>> +		goto out;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +out:
>>> +	mtk_mfg_power_off(&mfg->pd);
>>> +	return ret;
>>> +}
>>
>> static void mtk_mfg_remove(struct platform_device *pdev)
>> {
>> 	struct mtk_mfg *mfg = dev_get_drvdata(&pdev->dev);
>>
>> 	of_genpd_del_provider(....)
>>
>> 	pm_genpd_remove(....)
>>
>> 	mtk_mfg_power_off(...)
> 
> Unconditional power_off will go poorly if the thing isn't powered
> on at removal time, so I need to figure out something more clever.
> 
> Unfortunately, that something more clever isn't "dev_pm_genpd_is_on"
> because that has a case where it will return false and then devres
> kicks in and says hey you left your regulators on that's not cool.
> 
> I'll have to spend another day at the debug print factory until
> I can figure out what's wrong there, and if I can't, then I guess
> we'll add our own pd_on counting.

I did suspect that unconditional poweroff could be possibly wreaking havoc, and
I also knew that you'd see that in case, so I didn't write anything about my own
suspects :-P

But then, good. Since we don't care about refcounting in this case, I guess that
if there's no other way, eventually just a bool to track off/on state is enough.

Cheers!

> 
>>
>> 	mbox_free_channel(mfg->gf_mbox->ch);
>> 	mfg->gf_mbox->ch = NULL;
>>
>> 	mbox_free_channel(mfg->slp_mbox->ch);
>> 	mfg->slp_mbox->ch = NULL;
>>
>>
>> }
>>
>>> +
>>> +static struct platform_driver mtk_mfg_driver = {
>>> +	.driver = {
>>> +		.name = "mtk-mfg-pmdomain",
>>> +		.of_match_table = mtk_mfg_of_match,
>>> +	},
>>> +	.probe = mtk_mfg_probe,
>>
>> 	.remove = mtk_mfg_remove,
>>
>>> +};
>>> +module_platform_driver(mtk_mfg_driver);
>>> +
>>> +MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
>>> +MODULE_DESCRIPTION("MediaTek MFlexGraphics Power Domain Driver");
>>> +MODULE_LICENSE("GPL");
>>>
>>
>> There might be more, but for now, I'm done with this review round :-)
>>
>> Cheers,
>> Angelo
>>
> 
> Thanks for the review. Assume all comments I didn't reply to (including
> the big one) are acknowledged and will be addressed.
> 
> Kind regards,
> Nicolas Frattaroli
> 
> 

