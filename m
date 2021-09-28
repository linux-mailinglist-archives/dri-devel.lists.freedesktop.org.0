Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C841B89F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 22:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12EF6E97F;
	Tue, 28 Sep 2021 20:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A69C6E97F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 20:48:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210928204857euoutp01101683fa158ae484657e4aa11fa9e143~pF3ZeyQDY1906219062euoutp01J
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 20:48:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210928204857euoutp01101683fa158ae484657e4aa11fa9e143~pF3ZeyQDY1906219062euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632862137;
 bh=JqQcJWuucF1Di6oZBaFJ+R/AZbadXvZOkHGN9UBCKqg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=t5rW4VtzZcKNxwSwo8NmYdNpkpY/b5ItEg5rkJdljxtsqQ38IAwqR1tgDlG6nAZcx
 6z4oS3Iwos6y4PwnrK6PACyI+/L3fRUfwOTJb6sYFkbMCXCOq480QxItXipVxaiShD
 aBd4rJ+DHq/IjZQMzkNONMdn4FN8gwt2dnmYykig=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210928204856eucas1p18343490b71251588bd82e60410a75427~pF3YiuvkV2222522225eucas1p1b;
 Tue, 28 Sep 2021 20:48:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 87.D3.45756.7BF73516; Tue, 28
 Sep 2021 21:48:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210928204855eucas1p2c087c233ca4f685bddb4293283e8b7c6~pF3X-Vjko2706227062eucas1p2P;
 Tue, 28 Sep 2021 20:48:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210928204855eusmtrp2665eecc47a106f3b6dbe246484ce2420~pF3X_uOHF2073220732eusmtrp2J;
 Tue, 28 Sep 2021 20:48:55 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-7e-61537fb7bb7d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.54.20981.7BF73516; Tue, 28
 Sep 2021 21:48:55 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210928204855eusmtip1de1158938d0fee7434cac6eb4fb24274~pF3XmT0NR1529415294eusmtip1U;
 Tue, 28 Sep 2021 20:48:55 +0000 (GMT)
Message-ID: <35b4b0de-7b15-f6b3-bc1d-bcaf284102c9@samsung.com>
Date: Tue, 28 Sep 2021 22:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
Subject: Re: [PATCH v2 2/2] drm: rcar-du: Add R-Car DSI driver
Content-Language: pl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, LUU
 HOAI <hoai.luu.ub@renesas.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <YUuu/UCZVxMnUUvd@pendragon.ideasonboard.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduzned3t9cGJBj29VhZXvr5ns3j7ay6L
 xbbTv1ktOicuYbfY+vIdkwOrx+yOmawe97uPM3l8OzORxePzJrkAligum5TUnMyy1CJ9uwSu
 jM9fTrEUPA6puNWwh7mB8ZZLFyMnh4SAicSH3p3sXYxcHEICKxglvs05zAjhfGGUWDRjKguE
 85lRonn9LyaYlplnW9kgEssZJV6+OgDV/55RoqflKBtIFa+AncT7BT3MIDaLgKrEs4kTmCHi
 ghInZz5hAbFFBRIkXt/bBFTPwSEMVD/7bBlImFlAROLGoxZGEFtEwEKid9F0sJOYBRYwStx5
 tgXsCjYBTYm/m2+C7eIUsJL4dO0gI0SzvETz1tnMIA0SAic4JPbdusEKcbaLxM2eOcwQtrDE
 q+Nb2CFsGYn/O+dDvVYvcX9FC1RzB6PE1g07oRqsJe6c+wV2KTPQ5vW79CHCjhLfnrxlAQlL
 CPBJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVihL3z26FGigusfTCV7YJjEqzkEJlFpL3ZyH5ZhbC
 3gWMLKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzEC08zpf8c/7WCc++qj3iFGJg7GQ4wS
 HMxKIrw/xIMThXhTEiurUovy44tKc1KLDzFKc7AoifOumr0mXkggPbEkNTs1tSC1CCbLxMEp
 1cDUWO+9M0x6NWfuo1l7/PSPe6jO2jEjQ7F+zZ8TYr8OxQSEBEple5elfXIoW+EZcV7AvMlP
 JbzG8dSW33zG01d5NaiZGkommL1+/m22iqD12ugX8exqH9tV0zu4fn7dZed/m3HimtX8jd6x
 /1UyMj6oJK06Esh5etrH1zO8i4+z3XW/cdP1zTxlrsDEhywPn4iG75iw31Xw+bvM3zH8izTn
 f7i9fPPXQC6dHXx11bwT26JDLDl05m3+I+KxNnvFvgnlP6cc2KHwQbPjvceNlZOnti8t49Do
 PvW166rM4/e/f5+14qwSjptoM/PFZQVJhpWqNqnzz3xyOtTBebnq9r22+JvRfw5KhhhahKhU
 bTqsxFKckWioxVxUnAgAWFhIw6IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7rb64MTDR5dE7O48vU9m8XbX3NZ
 LLad/s1q0TlxCbvF1pfvmBxYPWZ3zGT1uN99nMnj25mJLB6fN8kFsETp2RTll5akKmTkF5fY
 KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZXz+coql4HFIxa2GPcwNjLdc
 uhg5OSQETCRmnm1lA7GFBJYySjT9F4OIi0vsnv+WGcIWlvhzrQuohguo5i2jxOXDP8AaeAXs
 JN4v6AErYhFQlXg2cQIzRFxQ4uTMJywgtqhAgsTkm/NYuxg5OISB6mefLQMJMwuISNx41MII
 YosIWEj0LprOCDKfWWABo8Tz3u9MEMv+MElcW7uQCaSKTUBT4u/mm2CLOQWsJD5dO8gIMclM
 omtrF5QtL9G8dTbzBEahWUjumIVk4SwkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yf
 u4kRGFfbjv3csoNx5auPeocYmTgYDzFKcDArifD+EA9OFOJNSaysSi3Kjy8qzUktPsRoCgyM
 icxSosn5wMjOK4k3NDMwNTQxszQwtTQzVhLnNTmyJl5IID2xJDU7NbUgtQimj4mDU6qBKWzl
 ze4ZLy5LZM7MYL61yLeO/5xeoZH5YzmtX+8KT3/1nrHsKkdD/JN20bIM7p/neteUXvkctCz0
 vpVGnKb0DQ/De1J8CTZibN0ut9dvYhDVy07y2een/KNQQE7xDpcI91WtG8Vt4ZfssqQuSnAt
 kliQZlyv5cJcvWPfNoX+V7fkJtxQvil/4cGU5wHTTzJbxZw2X/to4mztH06+YWcfLZt24cO1
 3pk99zpemKYweb6+vVbtzZ7bRldZlh+ZXzb/z9TkK//sbbKXqLbm/O+5vOdGpCf31QAT9ptr
 eX7dP/f744GJV17a3An1srYI/qO27HLdKUc7S/lG6S0lgg8jipyWbPa3NTbN2f/TazfHHCWW
 4oxEQy3mouJEAKxoY7k0AwAA
X-CMS-MailID: 20210928204855eucas1p2c087c233ca4f685bddb4293283e8b7c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210623135723eucas1p20cda75f712144a9ffd3ad22401123063
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210623135723eucas1p20cda75f712144a9ffd3ad22401123063
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <CGME20210623135723eucas1p20cda75f712144a9ffd3ad22401123063@eucas1p2.samsung.com>
 <20210623135639.17125-3-laurent.pinchart+renesas@ideasonboard.com>
 <162326cb-1291-b6e0-3a70-177229be4aa7@samsung.com>
 <YUqHAi/Vv27zYSlo@pendragon.ideasonboard.com>
 <YUuu/UCZVxMnUUvd@pendragon.ideasonboard.com>
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

Hi,

Sorry, I missed this email.


W dniu 23.09.2021 o 00:32, Laurent Pinchart pisze:
> Hi Andrzej,
>
> On Wed, Sep 22, 2021 at 04:29:39AM +0300, Laurent Pinchart wrote:
>> On Tue, Sep 21, 2021 at 09:42:11PM +0200, Andrzej Hajda wrote:
>>> W dniu 23.06.2021 o 15:56, Laurent Pinchart pisze:
>>>> From: LUU HOAI <hoai.luu.ub@renesas.com>
>>>>
>>>> The driver supports the MIPI DSI/CSI-2 TX encoder found in the R-Car V3U
>>>> SoC. It currently supports DSI mode only.
>>>>
>>>> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/gpu/drm/rcar-du/Kconfig              |   6 +
>>>>    drivers/gpu/drm/rcar-du/Makefile             |   1 +
>>>>    drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 827 +++++++++++++++++++
>>>>    drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h | 172 ++++
>>>>    4 files changed, 1006 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>>>>    create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
...
>>>> +
>>>> +	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
>>>> +					  &dsi->next_bridge);
>>> You are looking for sink but DSI host is not yet registered, thus DSI
>>> child devices not yet created/bound,  so in case of DSI-controlled sinks
>>> it will be always error.
>> Correct, it will not work for a sink that is controlled through DSI.
>> We've tested this with a sink controlled through I2C, as that's all we
>> have on the development board. That won't be very future-proof of
>> course.
>>
>>> Please look at pending documentation patch[1] for more in-depth explanation.
>>>
>>> [1]: https://protect2.fireeye.com/v1/url?k=ccc70571-935c3c5e-ccc68e3e-0cc47a31cdf8-cd122187fddf557d&q=1&e=311a381f-74cc-4b35-a344-362bc742c941&u=https%3A%2F%2Flkml.org%2Flkml%2F2021%2F9%2F10%2F165
>> I'll review that series.
> To clarify your point, do you consider this a blocker for merging this
> series, or something that can be addressed on top ?


The best would be to fix it before merge - the rule of thumb is that bad 
patterns spread quite fast :)

If there is good reason to postpone the fix, please send it ASAP.


Regards

Andrzej

>
>>>> +	if (ret) {
>>>> +		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	if (!dsi->next_bridge) {
>>>> +		dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
>>>> +		if (IS_ERR(dsi->next_bridge)) {
>>>> +			dev_err(dsi->dev, "failed to create panel bridge\n");
>>>> +			return PTR_ERR(dsi->next_bridge);
>>>> +		}
>>>> +	}
>>>> +
>>>> +	/* Initialize the DSI host. */
>>>> +	dsi->host.dev = dsi->dev;
>>>> +	dsi->host.ops = &rcar_mipi_dsi_host_ops;
>>>> +	ret = mipi_dsi_host_register(&dsi->host);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	/* Initialize the DRM bridge. */
>>>> +	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
>>>> +	dsi->bridge.of_node = dsi->dev->of_node;
>>>> +	drm_bridge_add(&dsi->bridge);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int rcar_mipi_dsi_remove(struct platform_device *pdev)
>>>> +{
>>>> +	struct rcar_mipi_dsi *dsi = platform_get_drvdata(pdev);
>>>> +
>>>> +	drm_bridge_remove(&dsi->bridge);
>>>> +
>>>> +	mipi_dsi_host_unregister(&dsi->host);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct of_device_id rcar_mipi_dsi_of_table[] = {
>>>> +	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx" },
>>>> +	{ }
>>>> +};
>>>> +
>>>> +MODULE_DEVICE_TABLE(of, rcar_mipi_dsi_of_table);
>>>> +
>>>> +static struct platform_driver rcar_mipi_dsi_platform_driver = {
>>>> +	.probe          = rcar_mipi_dsi_probe,
>>>> +	.remove         = rcar_mipi_dsi_remove,
>>>> +	.driver         = {
>>>> +		.name   = "rcar-mipi-dsi",
>>>> +		.of_match_table = rcar_mipi_dsi_of_table,
>>>> +	},
>>>> +};
>>>> +
>>>> +module_platform_driver(rcar_mipi_dsi_platform_driver);
>>>> +
>>>> +MODULE_DESCRIPTION("Renesas R-Car MIPI DSI Encoder Driver");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
>>>> new file mode 100644
>>>> index 000000000000..0e7a9274749f
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
>>>> @@ -0,0 +1,172 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * rcar_mipi_dsi_regs.h  --  R-Car MIPI DSI Interface Registers Definitions
>>>> + *
>>>> + * Copyright (C) 2020 Renesas Electronics Corporation
>>>> + */
>>>> +
>>>> +#ifndef __RCAR_MIPI_DSI_REGS_H__
>>>> +#define __RCAR_MIPI_DSI_REGS_H__
>>>> +
>>>> +#define LINKSR				0x010
>>>> +#define LINKSR_LPBUSY			(1 << 1)
>>>> +#define LINKSR_HSBUSY			(1 << 0)
>>>> +
>>>> +/*
>>>> + * Video Mode Register
>>>> + */
>>>> +#define TXVMSETR			0x180
>>>> +#define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
>>>> +#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
>>>> +#define TXVMSETR_VSTPM			(1 << 15)
>>>> +#define TXVMSETR_PIXWDTH		(1 << 8)
>>>> +#define TXVMSETR_VSEN_EN		(1 << 4)
>>>> +#define TXVMSETR_VSEN_DIS		(0 << 4)
>>>> +#define TXVMSETR_HFPBPEN_EN		(1 << 2)
>>>> +#define TXVMSETR_HFPBPEN_DIS		(0 << 2)
>>>> +#define TXVMSETR_HBPBPEN_EN		(1 << 1)
>>>> +#define TXVMSETR_HBPBPEN_DIS		(0 << 1)
>>>> +#define TXVMSETR_HSABPEN_EN		(1 << 0)
>>>> +#define TXVMSETR_HSABPEN_DIS		(0 << 0)
>>>> +
>>>> +#define TXVMCR				0x190
>>>> +#define TXVMCR_VFCLR			(1 << 12)
>>>> +#define TXVMCR_EN_VIDEO			(1 << 0)
>>>> +
>>>> +#define TXVMSR				0x1a0
>>>> +#define TXVMSR_STR			(1 << 16)
>>>> +#define TXVMSR_VFRDY			(1 << 12)
>>>> +#define TXVMSR_ACT			(1 << 8)
>>>> +#define TXVMSR_RDY			(1 << 0)
>>>> +
>>>> +#define TXVMSCR				0x1a4
>>>> +#define TXVMSCR_STR			(1 << 16)
>>>> +
>>>> +#define TXVMPSPHSETR			0x1c0
>>>> +#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
>>>> +#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
>>>> +#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
>>>> +#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
>>>> +#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
>>>> +
>>>> +#define TXVMVPRMSET0R			0x1d0
>>>> +#define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
>>>> +#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17)
>>>> +#define TXVMVPRMSET0R_VSPOL_HIG		(0 << 16)
>>>> +#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16)
>>>> +#define TXVMVPRMSET0R_CSPC_RGB		(0 << 4)
>>>> +#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4)
>>>> +#define TXVMVPRMSET0R_BPP_16		(0 << 0)
>>>> +#define TXVMVPRMSET0R_BPP_18		(1 << 0)
>>>> +#define TXVMVPRMSET0R_BPP_24		(2 << 0)
>>>> +
>>>> +#define TXVMVPRMSET1R			0x1d4
>>>> +#define TXVMVPRMSET1R_VACTIVE(x)	(((x) & 0x7fff) << 16)
>>>> +#define TXVMVPRMSET1R_VSA(x)		(((x) & 0xfff) << 0)
>>>> +
>>>> +#define TXVMVPRMSET2R			0x1d8
>>>> +#define TXVMVPRMSET2R_VFP(x)		(((x) & 0x1fff) << 16)
>>>> +#define TXVMVPRMSET2R_VBP(x)		(((x) & 0x1fff) << 0)
>>>> +
>>>> +#define TXVMVPRMSET3R			0x1dc
>>>> +#define TXVMVPRMSET3R_HACTIVE(x)	(((x) & 0x7fff) << 16)
>>>> +#define TXVMVPRMSET3R_HSA(x)		(((x) & 0xfff) << 0)
>>>> +
>>>> +#define TXVMVPRMSET4R			0x1e0
>>>> +#define TXVMVPRMSET4R_HFP(x)		(((x) & 0x1fff) << 16)
>>>> +#define TXVMVPRMSET4R_HBP(x)		(((x) & 0x1fff) << 0)
>>>> +
>>>> +/*
>>>> + * PHY-Protocol Interface (PPI) Registers
>>>> + */
>>>> +#define PPISETR				0x700
>>>> +#define PPISETR_DLEN_0			(0x1 << 0)
>>>> +#define PPISETR_DLEN_1			(0x3 << 0)
>>>> +#define PPISETR_DLEN_2			(0x7 << 0)
>>>> +#define PPISETR_DLEN_3			(0xf << 0)
>>>> +#define PPISETR_CLEN			(1 << 8)
>>>> +
>>>> +#define PPICLCR				0x710
>>>> +#define PPICLCR_TXREQHS			(1 << 8)
>>>> +#define PPICLCR_TXULPSEXT		(1 << 1)
>>>> +#define PPICLCR_TXULPSCLK		(1 << 0)
>>>> +
>>>> +#define PPICLSR				0x720
>>>> +#define PPICLSR_HSTOLP			(1 << 27)
>>>> +#define PPICLSR_TOHS			(1 << 26)
>>>> +#define PPICLSR_STPST			(1 << 0)
>>>> +
>>>> +#define PPICLSCR			0x724
>>>> +#define PPICLSCR_HSTOLP			(1 << 27)
>>>> +#define PPICLSCR_TOHS			(1 << 26)
>>>> +
>>>> +#define PPIDLSR				0x760
>>>> +#define PPIDLSR_STPST			(0xf << 0)
>>>> +
>>>> +/*
>>>> + * Clocks registers
>>>> + */
>>>> +#define LPCLKSET			0x1000
>>>> +#define LPCLKSET_CKEN			(1 << 8)
>>>> +#define LPCLKSET_LPCLKDIV(x)		(((x) & 0x3f) << 0)
>>>> +
>>>> +#define CFGCLKSET			0x1004
>>>> +#define CFGCLKSET_CKEN			(1 << 8)
>>>> +#define CFGCLKSET_CFGCLKDIV(x)		(((x) & 0x3f) << 0)
>>>> +
>>>> +#define DOTCLKDIV			0x1008
>>>> +#define DOTCLKDIV_CKEN			(1 << 8)
>>>> +#define DOTCLKDIV_DOTCLKDIV(x)		(((x) & 0x3f) << 0)
>>>> +
>>>> +#define VCLKSET				0x100c
>>>> +#define VCLKSET_CKEN			(1 << 16)
>>>> +#define VCLKSET_COLOR_RGB		(0 << 8)
>>>> +#define VCLKSET_COLOR_YCC		(1 << 8)
>>>> +#define VCLKSET_DIV(x)			(((x) & 0x3) << 4)
>>>> +#define VCLKSET_BPP_16			(0 << 2)
>>>> +#define VCLKSET_BPP_18			(1 << 2)
>>>> +#define VCLKSET_BPP_18L			(2 << 2)
>>>> +#define VCLKSET_BPP_24			(3 << 2)
>>>> +#define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
>>>> +
>>>> +#define VCLKEN				0x1010
>>>> +#define VCLKEN_CKEN			(1 << 0)
>>>> +
>>>> +#define PHYSETUP			0x1014
>>>> +#define PHYSETUP_HSFREQRANGE(x)		(((x) & 0x7f) << 16)
>>>> +#define PHYSETUP_HSFREQRANGE_MASK	(0x7f << 16)
>>>> +#define PHYSETUP_CFGCLKFREQRANGE(x)	(((x) & 0x3f) << 8)
>>>> +#define PHYSETUP_SHUTDOWNZ		(1 << 1)
>>>> +#define PHYSETUP_RSTZ			(1 << 0)
>>>> +
>>>> +#define CLOCKSET1			0x101c
>>>> +#define CLOCKSET1_LOCK_PHY		(1 << 17)
>>>> +#define CLOCKSET1_LOCK			(1 << 16)
>>>> +#define CLOCKSET1_CLKSEL		(1 << 8)
>>>> +#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
>>>> +#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
>>>> +#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
>>>> +#define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
>>>> +#define CLOCKSET1_UPDATEPLL		(1 << 0)
>>>> +
>>>> +#define CLOCKSET2			0x1020
>>>> +#define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
>>>> +#define CLOCKSET2_VCO_CNTRL(x)		(((x) & 0x3f) << 8)
>>>> +#define CLOCKSET2_N(x)			(((x) & 0xf) << 0)
>>>> +
>>>> +#define CLOCKSET3			0x1024
>>>> +#define CLOCKSET3_PROP_CNTRL(x)		(((x) & 0x3f) << 24)
>>>> +#define CLOCKSET3_INT_CNTRL(x)		(((x) & 0x3f) << 16)
>>>> +#define CLOCKSET3_CPBIAS_CNTRL(x)	(((x) & 0x7f) << 8)
>>>> +#define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
>>>> +
>>>> +#define PHTW				0x1034
>>>> +#define PHTW_DWEN			(1 << 24)
>>>> +#define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
>>>> +#define PHTW_CWEN			(1 << 8)
>>>> +#define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
>>>> +
>>>> +#define PHTC				0x103c
>>>> +#define PHTC_TESTCLR			(1 << 0)
>>>> +
>>>> +#endif /* __RCAR_MIPI_DSI_REGS_H__ */
