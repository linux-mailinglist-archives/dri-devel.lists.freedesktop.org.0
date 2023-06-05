Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B05722092
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 10:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F04410E195;
	Mon,  5 Jun 2023 08:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32810E195
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 08:08:58 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1q65Gn-00021e-UX; Mon, 05 Jun 2023 10:08:53 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1q65Gi-0003OO-3S; Mon, 05 Jun 2023 10:08:48 +0200
Date: Mon, 5 Jun 2023 10:08:48 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH 9/9] drm/verisilicon: Add starfive hdmi driver
Message-ID: <20230605080848.GA4802@pengutronix.de>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-10-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602074043.33872-10-keith.zhao@starfivetech.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Keith,

On Fri, Jun 02, 2023 at 03:40:43PM +0800, Keith Zhao wrote:
> Add HDMI dirver for StarFive SoC JH7110.
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Kconfig         |  11 +
>  drivers/gpu/drm/verisilicon/Makefile        |   1 +
>  drivers/gpu/drm/verisilicon/starfive_hdmi.c | 928 ++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/starfive_hdmi.h | 296 +++++++
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   6 +
>  drivers/gpu/drm/verisilicon/vs_drv.h        |   4 +
>  6 files changed, 1246 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
> 
[...]
> diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.c b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> new file mode 100644
> index 000000000000..128ecca03309
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> @@ -0,0 +1,928 @@
[...]
> +static int starfive_hdmi_enable_clk_deassert_rst(struct device *dev, struct starfive_hdmi *hdmi)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(hdmi->sys_clk);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Cannot enable HDMI sys clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(hdmi->mclk);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Cannot enable HDMI mclk clock: %d\n", ret);
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(hdmi->bclk);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Cannot enable HDMI bclk clock: %d\n", ret);
> +		return ret;
> +	}
> +	ret = reset_control_deassert(hdmi->tx_rst);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to deassert tx_rst\n");

The error paths should clk_disable_unprepare() enabled clocks.

> +		return ret;
> +	}
> +	return 0;
> +}
> +
[...]
> +static int starfive_hdmi_get_clk_rst(struct device *dev, struct starfive_hdmi *hdmi)
> +{
> +	hdmi->sys_clk = devm_clk_get(dev, "sysclk");
> +	if (IS_ERR(hdmi->sys_clk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI sysclk clk\n");
> +		return PTR_ERR(hdmi->sys_clk);
> +	}
> +	hdmi->mclk = devm_clk_get(dev, "mclk");
> +	if (IS_ERR(hdmi->mclk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI mclk clk\n");
> +		return PTR_ERR(hdmi->mclk);
> +	}
> +	hdmi->bclk = devm_clk_get(dev, "bclk");
> +	if (IS_ERR(hdmi->bclk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI bclk clk\n");
> +		return PTR_ERR(hdmi->bclk);
> +	}
> +	hdmi->tx_rst = reset_control_get_shared(dev, "hdmi_tx");

Use devm_reset_control_get_shared() for consistency, otherwise this is missing
a reset_control_put() somewhere.

regards
Philipp
