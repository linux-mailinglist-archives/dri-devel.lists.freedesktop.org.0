Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64239FB25B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BED10E35F;
	Mon, 23 Dec 2024 16:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HLyCRIZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5EC10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 16:17:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA8D75C596B;
 Mon, 23 Dec 2024 16:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A86C4CED3;
 Mon, 23 Dec 2024 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734970632;
 bh=U+r0l82EYvI04zf6st2atiHtEKZrPRSvnnX9tISQoao=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HLyCRIZRn2YdQ1X9NnEVSIx7ti5xIOEfdjXFOzbWEF91fdAO6iqOH8Uy2HGdAB1bq
 vfec9xmHItDBgVzrIRBSK9KhIJLdi+Ab5LFuTRpwLO0Iy7+NLp+9YxR5QmflTVByiC
 Rk9+UtqkmZg6cYr1xD5FSiXxaeTrWAQk45M2k8iZ0/nIyXqWSupzWHk5EHMYM7FKxM
 +KHnY+F63sI1myS2vaK54LWldBECTaZNBNqtsLEZjsnHf1o7DI5XOEk/ytaO6isAA4
 bSbbrF/JvPnpxs0NTAa/j/hskINol3WcISIFgWG/Ooqx/fijc++6TONatwpovUXycX
 K7pAFb5NssRCg==
Message-ID: <ef07641d-ced2-4a45-89cd-d119e503dd14@kernel.org>
Date: Mon, 23 Dec 2024 17:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/19] firmware: thead: Add AON firmware protocol
 driver
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125607eucas1p1eac1c05d699337f9af118c1885b14b1d@eucas1p1.samsung.com>
 <20241223125553.3527812-6-m.wilczynski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241223125553.3527812-6-m.wilczynski@samsung.com>
Content-Type: text/plain; charset=UTF-8
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

On 23/12/2024 13:55, Michal Wilczynski wrote:
> The T-Head TH1520 SoC uses an E902 co-processor running Always-On (AON)
> firmware to manage power, clock, and other system resources [1]. This
> patch introduces a driver implementing the AON firmware protocol,
> allowing the Linux kernel to communicate with the firmware via mailbox
> channels.  Through an RPC-based interface, the kernel can initiate power
> state transitions, update resource configurations, and perform other
> AON-related tasks.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                                   |   2 +
>  drivers/firmware/Kconfig                      |   9 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/thead,th1520-aon.c           | 203 ++++++++++++++++++
>  .../linux/firmware/thead/thead,th1520-aon.h   | 186 ++++++++++++++++
>  5 files changed, 401 insertions(+)
>  create mode 100644 drivers/firmware/thead,th1520-aon.c
>  create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7705d1b6dd7a..42aef66bd257 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20196,10 +20196,12 @@ F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/thead,th1520-power.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
> +F:	drivers/firmware/thead,th1520-aon.c
>  F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
> +F:	include/linux/firmware/thead/thead,th1520-aon.h
>  
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 71d8b26c4103..e08e01de3ee3 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -212,6 +212,15 @@ config SYSFB_SIMPLEFB
>  
>  	  If unsure, say Y.
>  
> +config TH1520_AON_PROTOCOL
> +	tristate "Always-On firmware protocol"
> +	depends on THEAD_TH1520_MBOX

Would:
	|| COMPILE_TEST
work?

What sort of dependency is this? Build time? Runtime? If runtime, this
should be just dependency on ARCH_THEAD (or whatever is there)

> +	help
> +	  Power, clock, and resource management capabilities on the TH1520 SoC are
> +	  managed by the E902 core. Firmware running on this core communicates with
> +	  the kernel through the Always-On protocol, using hardware mailbox as a medium.
> +	  Say yes if you need such capabilities.
> +


...

> +static void th1520_aon_rx_callback(struct mbox_client *c, void *rx_msg)
> +{
> +	struct th1520_aon_chan *aon_chan =
> +		container_of(c, struct th1520_aon_chan, cl);
> +	struct th1520_aon_rpc_msg_hdr *hdr =
> +		(struct th1520_aon_rpc_msg_hdr *)rx_msg;
> +	u8 recv_size = sizeof(struct th1520_aon_rpc_msg_hdr) + hdr->size;
> +
> +	if (recv_size != sizeof(struct th1520_aon_rpc_ack_common)) {
> +		dev_err(c->dev, "Invalid ack size, not completing\n");
> +		return;
> +	}
> +
> +	memcpy(&aon_chan->ack_msg, rx_msg, recv_size);
> +	complete(&aon_chan->done);
> +}
> +

You need proper (and useful) kerneldoc for all exported functions.

> +int th1520_aon_call_rpc(struct th1520_aon_chan *aon_chan, void *msg)
> +{
> +	struct th1520_aon_rpc_msg_hdr *hdr = msg;
> +	int ret;
> +
> +	mutex_lock(&aon_chan->transaction_lock);
> +	reinit_completion(&aon_chan->done);
> +
> +	RPC_SET_VER(hdr, TH1520_AON_RPC_VERSION);
> +	RPC_SET_SVC_ID(hdr, hdr->svc);
> +	RPC_SET_SVC_FLAG_MSG_TYPE(hdr, RPC_SVC_MSG_TYPE_DATA);
> +	RPC_SET_SVC_FLAG_ACK_TYPE(hdr, RPC_SVC_MSG_NEED_ACK);
> +
> +	ret = mbox_send_message(aon_chan->ch, msg);
> +	if (ret < 0) {
> +		dev_err(aon_chan->cl.dev, "RPC send msg failed: %d\n", ret);
> +		goto out;
> +	}
> +
> +	if (!wait_for_completion_timeout(&aon_chan->done, MAX_RX_TIMEOUT)) {
> +		dev_err(aon_chan->cl.dev, "RPC send msg timeout\n");
> +		mutex_unlock(&aon_chan->transaction_lock);
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = aon_chan->ack_msg.err_code;
> +
> +out:
> +	mutex_unlock(&aon_chan->transaction_lock);
> +
> +	return th1520_aon_to_linux_errno(ret);
> +}
> +EXPORT_SYMBOL_GPL(th1520_aon_call_rpc);
> +

Here as well.

> +int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
> +			    bool power_on)
> +{
> +	struct th1520_aon_msg_req_set_resource_power_mode msg = {};
> +	struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
> +	int ret;
> +
> +	hdr->svc = TH1520_AON_RPC_SVC_PM;
> +	hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
> +	hdr->size = TH1520_AON_RPC_MSG_NUM;
> +
> +	RPC_SET_BE16(&msg.resource, 0, rsrc);
> +	RPC_SET_BE16(&msg.resource, 2,
> +		     (power_on ? TH1520_AON_PM_PW_MODE_ON :
> +				 TH1520_AON_PM_PW_MODE_OFF));
> +
> +	ret = th1520_aon_call_rpc(aon_chan, &msg);
> +	if (ret)
> +		dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
> +			power_on ? "up" : "off", rsrc, ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(th1520_aon_power_update);
> +
> +static int th1520_aon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct th1520_aon_chan *aon_chan;
> +	struct mbox_client *cl;
> +	int ret;
> +
> +	aon_chan = devm_kzalloc(dev, sizeof(*aon_chan), GFP_KERNEL);
> +	if (!aon_chan)
> +		return -ENOMEM;
> +
> +	cl = &aon_chan->cl;
> +	cl->dev = dev;
> +	cl->tx_block = true;
> +	cl->tx_tout = MAX_TX_TIMEOUT;
> +	cl->rx_callback = th1520_aon_rx_callback;
> +
> +	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
> +	if (IS_ERR(aon_chan->ch)) {
> +		ret = PTR_ERR(aon_chan->ch);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to request aon mbox chan ret %d\n",
> +				ret);

You just open-coded dev_err_probe. Syntax is:

return dev_err_probe()

> +		return ret;
> +	}
> +
> +	mutex_init(&aon_chan->transaction_lock);
> +	init_completion(&aon_chan->done);
> +
> +	platform_set_drvdata(pdev, aon_chan);
> +
> +	return devm_of_platform_populate(dev);
> +}
> +

No remove() callback to free mbox channel? Looks like a leak.



Best regards,
Krzysztof
