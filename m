Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5D4CFDBE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 13:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771FF10F7A0;
	Mon,  7 Mar 2022 12:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3CB10EA1C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 12:06:15 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 1C9D7AC0245;
 Mon,  7 Mar 2022 20:06:11 +0800 (CST)
Message-ID: <1483d5c1-1a4b-615c-b7c0-41da51b5f38c@rock-chips.com>
Date: Mon, 7 Mar 2022 20:06:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 15/24] drm/rockchip: dw_hdmi: add default 594Mhz clk
 for 4K@60hz
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-16-s.hauer@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220225075150.2729401-16-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRoeTxlWH0xKHRpJHx
 5IQk4aVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NTI6Khw4Aj4MKzMxKEgPPygj
 HzBPCgxVSlVKTU9NTU5PTExKTUhMVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElOSzcG
X-HM-Tid: 0a7f6445d0eeb039kuuu1c9d7ac0245
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi:

  I have a test with the 24 patches applied on Linux-5.17-rc5 on 
rk3568-evb1-v10 board with Sony XR-75z9j  HDMI TV,

4K don't work, the tv shows no signal.

1080P can work.

On 2/25/22 15:51, Sascha Hauer wrote:
> From: Nickey Yang <nickey.yang@rock-chips.com>
>
> add 594Mhz configuration parameters in rockchip_phy_config
>
> Signed-off-by: Nickey Yang <nickey.yang@rock-chips.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>
> Notes:
>      Changes since v3:
>      - new patch
>
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index e97ba072a097b..03cda7229e559 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -192,6 +192,7 @@ static const struct dw_hdmi_phy_config rockchip_phy_config[] = {
>   	{ 74250000,  0x8009, 0x0004, 0x0272},
>   	{ 148500000, 0x802b, 0x0004, 0x028d},
>   	{ 297000000, 0x8039, 0x0005, 0x028d},
> +	{ 594000000, 0x8039, 0x0000, 0x019d},
>   	{ ~0UL,	     0x0000, 0x0000, 0x0000}
>   };
>   
