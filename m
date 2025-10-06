Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ECABBDE22
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025CE10E34B;
	Mon,  6 Oct 2025 11:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pYdlA9Ow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB8810E30C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759750650;
 bh=OCo3Y1mMSATVLIHgm7jliFk9xOitHLwpDahp1KfGqfY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pYdlA9OwTrBcGXXp6JR53CLqQMc8z5UkPIbAPwMuX3s1qU5vuG6OezO7F3vbuYdsP
 dvsfDXEcKPM9KpXuffM4FEkAJGizjPGBK43joCPBTNDc+P0u2tqEVjkKeKT6K8UHjd
 WXbALCk/4j9L8ZpO9psBUN6aGBDKAbrRbEAy/dFw7GCyr8O39uYKcZuclaVZVSZ/bY
 v807XZcYJe2h6tKHzabTYLE8bA1BkQ7KbhiiGBIlXdyRdpSPIln+Nt62hTMgYh5e4n
 phUUi9K5AAlR6C3V42HvTAEMhPQdqSJpN61KTdwN8MzfRLs7synvGRCF0CIExhHCfC
 ESKWJ+8rmT3qQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 114AB17E0B83;
 Mon,  6 Oct 2025 13:37:29 +0200 (CEST)
Message-ID: <94866bc6-0fdb-4e6c-ba78-5ebd7138f193@collabora.com>
Date: Mon, 6 Oct 2025 13:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-7-76498ad61d9e@collabora.com>
 <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
 <8586490.T7Z3S40VBb@workhorse>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8586490.T7Z3S40VBb@workhorse>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/10/25 12:58, Nicolas Frattaroli ha scritto:
> On Friday, 3 October 2025 23:41:16 Central European Summer Time Chia-I Wu wrote:
>> On Fri, Oct 3, 2025 at 1:16 PM Nicolas Frattaroli
>> <nicolas.frattaroli@collabora.com> wrote:
>>>
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
>> I like this model a lot. Thanks!
>>
>> panthor might potentially need to interact with this driver beyond
>> what pmdomain provides. I am thinking about querying
>> GF_REG_SHADER_PRESENT. Not sure if we've heard back from the vendor.
> 
> We did. The vendor confirmed this value is read by the EB firmware
> from an efuse, but considers the efuse address to be confidential.
> Consequently, we are not allowed to know the efuse address, or any
> of the other information required to read the efuse ourselves
> directly, such as what clocks and power domains it depends on.
> 
> We therefore likely need to pass GF_REG_SHADER_PRESENT onward, but
> I do have an idea for that: struct generic_pm_domain has a member
> "cpumask_var_t cpus", which is there to communicate a mask of which
> CPUs are attached to a power domain if the power domain has the flag
> GENPD_FLAG_CPU_DOMAIN set. If the flag isn't set, the member is
> unused.

cpumask_var_t is not going to be the right type for anything else that is
not a cpumask, as that is limited by NR_CPUS.

You'd have to declare a new bitmap, suitable for generic devices, which may
get a little complicated on deciding how many bits would be enough... and
if we look at GPUs... AMD and nV have lots of cores, so that becomes a bit
unfeasible to put in a bitmap.

Not sure then how generic that would be.

> 
> This means we could overload its meaning, e.g. with a new flag, to
> communicate such masks for other purposes, since it's already the
> right type and all. This would be quite a generic way for hardware
> other than cpus to communicate such core masks. I was planning to
> develop and send out an RFC series for this, to gauge how much Ulf
> Hansson hates that approach.
> 
> A different solution could be that mtk-mfg-pmdomain could act as an
> nvmem provider, and then we integrate generic "shader_present is
> stored in nvmem" support in panthor, and adjust the DT binding for
> this.
> 
> This approach would again be generic across vendors from panthor's
> perspective. It would, however, leak into DT the fact that we have
> to implement this in the gpufreq device, rather than having the
> efuse read directly.
> 
>> Have you considered moving this to drivers/soc/mediatek such that we
>> can provide include/linux/mtk-mfg.h to panthor?
> 
> Having panthor read data structures from mtk-mfg-pmdomain would be a
> last resort for me if none of the other approaches work out, as I'm
> not super keen on adding vendor-specific code paths to panthor
> itself. A new generic code path in panthor that is only used by one
> vendor for now is different in that it has the potential to be used
> by a different vendor's integration logic in the future as well.
> 
> So for now I'd like to keep it out of public includes and panthor as
> much as possible, unless the two other approaches don't work out for
> us.
> 

I don't really like seeing more and more vendor specific APIs: MediaTek does
suffer quite a lot from that, with cmdq being one of the examples - and the
fact that it's not just MediaTek having those, but also others like Qualcomm,
Rockchip, etc, is not an excuse to keep adding new ones when there are other
alternatives.

Also another fact there is that I don't think that panthor should get any
vendor specific "things" added (I mean, that should be avoided as much as
possible).

That said - what you will be trying to pass is really a value that is read
from eFuse, with the EB firmware being a wrapper over that: if we want, we
could see that yet-another-way of interfacing ourselves with reading nvmem
where, instead of a direct MMIO read, we're asking a firmware to give us a
readout.

This leads me to think that one of the possible options could be to actually
register (perhaps as a new platform device, because I'm not sure that it could
be feasible to register a pmdomain driver as a nvmem provider, but ultimately
that is Ulf and Srinivas' call I guess) a nvmem driver that makes an IPI call
to GPUEB and gives back the value to panthor through generic bindings.

>>>
>>> The driver also exposes the actual achieved clock rate, as read back
>>> from the MCU, as common clock framework clocks, by acting as a clock
>>> provider as well.
>>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>> ---
>>>   drivers/pmdomain/mediatek/Kconfig            |   16 +
>>>   drivers/pmdomain/mediatek/Makefile           |    1 +
>>>   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 1027 ++++++++++++++++++++++++++
>>>   3 files changed, 1044 insertions(+)
>> [...]
>>> +static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
>>> +{
>>> +       struct device *dev = &mfg->pdev->dev;
>>> +       struct mtk_mfg_ipi_msg msg = {};
>>> +       int ret;
>>> +
>>> +       dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", mfg->shared_mem_size);
>>> +       memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
>>> +
>>> +       msg.cmd = CMD_INIT_SHARED_MEM;
>>> +       msg.u.shared_mem.base = mfg->shared_mem_phys;
>>> +       msg.u.shared_mem.size = mfg->shared_mem_size;
>>> +
>>> +       ret = mtk_mfg_send_ipi(mfg, &msg);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       if (readl(mfg->shared_mem) != GPUEB_MEM_MAGIC) {
>> Add the offset GF_REG_MAGIC, even though it is 0.
> 
> Good catch, will do!
> 
>>
>>> +               dev_err(dev, "EB did not initialise shared memory correctly\n");
>>> +               return -EIO;
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>> [...]
>>> +static int mtk_mfg_mt8196_init(struct mtk_mfg *mfg)
>>> +{
>>> +       void __iomem *e2_base;
>>> +
>>> +       e2_base = devm_platform_ioremap_resource_byname(mfg->pdev, "hw-revision");
>>> +       if (IS_ERR(e2_base))
>>> +               return dev_err_probe(&mfg->pdev->dev, PTR_ERR(e2_base),
>>> +                                    "Couldn't get hw-revision register\n");
>>> +
>>> +       if (readl(e2_base) == MFG_MT8196_E2_ID)
>>> +               mfg->ghpm_en_reg = RPC_DUMMY_REG_2;
>>> +       else
>>> +               mfg->ghpm_en_reg = RPC_GHPM_CFG0_CON;
>>> +
>>> +       return 0;
>>> +};
>> Extraneous semicolon.
> 
> Good catch, will fix!
> 
>>
>>> +static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
>>> +{
>>> +       struct device *dev = &mfg->pdev->dev;
>>> +       struct mtk_mfg_mbox *gf;
>>> +       struct mtk_mfg_mbox *slp;
>>> +
>>> +       gf = devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
>>> +       if (!gf)
>>> +               return -ENOMEM;
>>> +
>>> +       gf->rx_data = devm_kzalloc(dev, GPUEB_MBOX_MAX_RX_SIZE, GFP_KERNEL);
>> It looks like gfx->rx_data can simply be "struct mtk_mfg_ipi_msg rx_data;".
> 
> Hmmm, good point. I'll change it to that.
> 

Honestly, I prefer the current version. No strong opinions though.

>>
>>> +       if (!gf->rx_data)
>>> +               return -ENOMEM;
>>> +
>>> +       gf->mfg = mfg;
>>> +       init_completion(&gf->rx_done);
>>> +       gf->cl.dev = dev;
>>> +       gf->cl.rx_callback = mtk_mfg_mbox_rx_callback;
>>> +       gf->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
>>> +       gf->ch = mbox_request_channel_byname(&gf->cl, "gpufreq");
>>> +       if (IS_ERR(gf->ch))
>>> +               return PTR_ERR(gf->ch);
>>> +
>>> +       mfg->gf_mbox = gf;
>>> +
>>> +       slp = devm_kzalloc(dev, sizeof(*slp), GFP_KERNEL);
>>> +       if (!slp)
>>> +               return -ENOMEM;
>>> +
>>> +       slp->mfg = mfg;
>>> +       init_completion(&slp->rx_done);
>>> +       slp->cl.dev = dev;
>>> +       slp->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
>>> +       slp->cl.tx_block = true;
>>> +       slp->ch = mbox_request_channel_byname(&slp->cl, "sleep");
>>> +       if (IS_ERR(slp->ch))
>>> +               return PTR_ERR(slp->ch);
>> Free gf->ch.
> 
> Good catch! Will do.
> 
>>> +
>>> +       mfg->slp_mbox = slp;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int mtk_mfg_init_clk_provider(struct mtk_mfg *mfg)
>>> +{
>>> +       struct device *dev = &mfg->pdev->dev;
>>> +       struct clk_hw_onecell_data *clk_data;
>>> +       int ret;
>>> +
>>> +       clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, 2), GFP_KERNEL);
>>> +       if (!clk_data)
>>> +               return -ENOMEM;
>>> +
>>> +       clk_data->num = 2;
>>> +
>>> +       mfg->clk_core_hw.init = &mtk_mfg_clk_gpu_init;
>>> +       mfg->clk_stack_hw.init = &mtk_mfg_clk_stack_init;
>>> +
>>> +       ret = devm_clk_hw_register(dev, &mfg->clk_core_hw);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Couldn't register GPU core clock\n");
>>> +
>>> +       ret = devm_clk_hw_register(dev, &mfg->clk_stack_hw);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Couldn't register GPU stack clock\n");
>>> +
>>> +       clk_data->hws[0] = &mfg->clk_core_hw;
>>> +       clk_data->hws[1] = &mfg->clk_stack_hw;
>>> +
>>> +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Couldn't register clock provider\n");
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int mtk_mfg_probe(struct platform_device *pdev)
>>> +{
>>> +       struct device_node *shmem __free(device_node);
>>> +       struct mtk_mfg *mfg;
>>> +       struct device *dev = &pdev->dev;
>>> +       const struct mtk_mfg_variant *data = of_device_get_match_data(dev);
>>> +       struct resource res;
>>> +       int ret, i;
>>> +
>>> +       mfg = devm_kzalloc(dev, sizeof(*mfg), GFP_KERNEL);
>>> +       if (!mfg)
>>> +               return -ENOMEM;
>>> +
>>> +       mfg->pdev = pdev;
>>> +       mfg->variant = data;
>>> +
>>> +       dev_set_drvdata(dev, mfg);
>>> +
>>> +       mfg->gpr = devm_platform_ioremap_resource(pdev, 0);
>>> +       if (IS_ERR(mfg->gpr))
>>> +               return dev_err_probe(dev, PTR_ERR(mfg->gpr),
>>> +                                    "Couldn't retrieve GPR MMIO registers\n");
>>> +
>>> +       mfg->rpc = devm_platform_ioremap_resource(pdev, 1);
>>> +       if (IS_ERR(mfg->rpc))
>>> +               return dev_err_probe(dev, PTR_ERR(mfg->rpc),
>>> +                                    "Couldn't retrieve RPC MMIO registers\n");
>>> +
>>> +       mfg->clk_eb = devm_clk_get(dev, "eb");
>>> +       if (IS_ERR(mfg->clk_eb))
>>> +               return dev_err_probe(dev, PTR_ERR(mfg->clk_eb),
>>> +                                    "Couldn't get 'eb' clock\n");
>>> +
>>> +       mfg->gpu_clks = devm_kcalloc(dev, data->num_clks, sizeof(*mfg->gpu_clks),
>>> +                                    GFP_KERNEL);
>>> +       if (!mfg->gpu_clks)
>>> +               return -ENOMEM;
>>> +
>>> +       for (i = 0; i < data->num_clks; i++)
>>> +               mfg->gpu_clks[i].id = data->clk_names[i];
>>> +
>>> +       ret = devm_clk_bulk_get(dev, data->num_clks, mfg->gpu_clks);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Couldn't get GPU clocks\n");
>>> +
>>> +       mfg->gpu_regs = devm_kcalloc(dev, data->num_regulators,
>>> +                                    sizeof(*mfg->gpu_regs), GFP_KERNEL);
>>> +       if (!mfg->gpu_regs)
>>> +               return -ENOMEM;
>>> +
>>> +       for (i = 0; i < data->num_regulators; i++)
>>> +               mfg->gpu_regs[i].supply = data->regulator_names[i];
>>> +
>>> +       ret = devm_regulator_bulk_get(dev, data->num_regulators, mfg->gpu_regs);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Couldn't get GPU regulators\n");
>>> +
>>> +       ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Couldn't get GPUEB shared memory\n");
>>> +
>>> +       mfg->shared_mem = devm_ioremap(dev, res.start, resource_size(&res));
>>> +       if (!mfg->shared_mem)
>>> +               return dev_err_probe(dev, -ENOMEM, "Can't ioremap GPUEB shared memory\n");
>>> +       mfg->shared_mem_size = resource_size(&res);
>>> +       mfg->shared_mem_phys = res.start;
>>> +
>>> +       if (data->init) {
>>> +               ret = data->init(mfg);
>>> +               if (ret)
>>> +                       return dev_err_probe(dev, ret, "Variant init failed\n");
>>> +       }
>>> +
>>> +       mfg->pd.name = dev_name(dev);
>>> +       mfg->pd.attach_dev = mtk_mfg_attach_dev;
>>> +       mfg->pd.detach_dev = mtk_mfg_detach_dev;
>>> +       mfg->pd.power_off = mtk_mfg_power_off;
>>> +       mfg->pd.power_on = mtk_mfg_power_on;
>>> +       mfg->pd.set_performance_state = mtk_mfg_set_performance;
>>> +       mfg->pd.flags = GENPD_FLAG_OPP_TABLE_FW;
>>> +
>>> +       ret = pm_genpd_init(&mfg->pd, NULL, false);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Failed to initialise power domain\n");
>> We need to clean up mgf->md on errors from this point on. Maybe we can
>> move this to a later point?
>>
>>> +
>>> +       ret = mtk_mfg_init_mbox(mfg);
>>> +       if (ret)
>>> +               return dev_err_probe(dev, ret, "Couldn't initialise mailbox\n");
>> We need to free the mboxes from this point on.
>>
> 
> For this and the one above, does .remove not get called on probe failure? If not,
> I'll definitely do this. Otherwise it seems redundant, though with the added
> concern that .remove does not check before calling those functions.
> 

Failing during probe doesn't make this much of a working (probed -> bound) device,
so no, .remove() is not going to get called upon probe failure.

Cheers,
Angelo
