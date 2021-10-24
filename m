Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A21438BCE
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 22:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A190C89FAC;
	Sun, 24 Oct 2021 20:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D8D89FAC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 20:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8O9gkYAmFcVK2IsDTWyn2VcW39mplgtD5t4PDmHXu1U=; b=nSaHE3DkXdmeZ1O0lor5XmoZPe
 AW5ZCFNAxuvaGwR9xicRQr5bwZzNSKltIJlzzKIfb2B41sFIiWKNLHMxaykVDRj1MhManwnqgrj/S
 x9ZQedtZPEiyRNOygnlTPudecxV3ArZrm3/abUvlXCE5ztjj0qNfwUwjLOdeaytVsz4+BQmuUtfKu
 IfshdYkYPo3di9x0o2/Dswha1avGXlmWtX9n1EQwYW5XDl8OuvEs3VIR+MXA4vtI6SMeI7B4nhLi/
 bCUHBXPGkqMQcySiXD1C4DcC1niCP7nlV+Bx4tLMqyIEP53flEsPKfa2yZXIi/Rn42ghwVnMeRJf4
 FofPugpg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55272)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mek49-0003Y2-8V; Sun, 24 Oct 2021 21:26:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mek46-0003JU-0B; Sun, 24 Oct 2021 21:25:58 +0100
Date: Sun, 24 Oct 2021 21:25:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 hsinyi@chromium.org, fshao@chromium.org, nancy.lin@mediatek.com,
 singo.chang@mediatek.com
Subject: Re: [PATCH] mailbox: remove the error message when gce clk is defer
Message-ID: <YXXBVTEbjPiBm1un@shell.armlinux.org.uk>
References: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
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

On Sun, Oct 24, 2021 at 12:48:31AM +0800, jason-jh.lin wrote:
> Remove the error message when gce clk is defer.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index fd5576a9f8b4..684b8aa1e445 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -577,7 +577,8 @@ static int cmdq_probe(struct platform_device *pdev)
>  				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
>  				cmdq->clocks[alias_id].id = clk_id;
>  				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
> -				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
> +				if (IS_ERR(cmdq->clocks[alias_id].clk) &&
> +				    PTR_ERR(cmdq->clocks[alias_id].clk) != -EPROBE_DEFER) {
>  					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
>  					return PTR_ERR(cmdq->clocks[alias_id].clk);
>  				}

So when you get -EPROBE_DEFER, you omit the error message _and_ ignore
the -EPROBE_DEFER. Is that really what you want to do?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
