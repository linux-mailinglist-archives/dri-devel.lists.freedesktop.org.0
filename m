Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E968596AD
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 12:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8500710E08B;
	Sun, 18 Feb 2024 11:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="AAa0zM2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 653 seconds by postgrey-1.36 at gabe;
 Sun, 18 Feb 2024 11:25:59 UTC
Received: from mail-m254101.xmail.ntesmail.com
 (mail-m254101.xmail.ntesmail.com [103.129.254.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9610E08B
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 11:25:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=AAa0zM2E+Q12+GcmuIFv1U7goDU0DJKrvIT/J3L5khHV86ESFhoQJ+kNQZR+FX6N4AuyM0Mah3+XdQWYwe4YpfrkXIkDw4Zvv1ZPS9vZx/xurswQ+lIplIZwnB7GIDwYfYx5WGSL1QtX+PCB2h1akWZd5Cly6IX/L1rqef6XDEw=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=z/dQY2HoW+YQ89aYc9H+gh/iwK6p8BunDVlsiz6zZYc=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id 920A584021C;
 Sun, 18 Feb 2024 19:14:56 +0800 (CST)
Message-ID: <4c66c084-5af6-43fb-a256-4746b2e00192@rock-chips.com>
Date: Sun, 18 Feb 2024 19:14:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: rockchip: Don't require MIPI DSI device when it's
 used for ISP
Content-Language: en-US
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
References: <20240217183941.1752463-1-megi@xff.cz>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20240217183941.1752463-1-megi@xff.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhOGVZNTUpIGRofSk5DHx5VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5IVUpLS1VKQk
 tLWQY+
X-HM-Tid: 0a8dbbed244003a4kunm920a584021c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46Ijo5VjMcHy4dMg4NCz80
 AlEKFEJVSlVKTEtDSU5PQ0JMTkNCVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0JMTzcG
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

On 2/18/24 02:39, Ondřej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> On RK3399 one MIPI DSI device can be alternatively used with the ISP1,
> to provide RX DPHY. When this is the case (ISP1 is enabled in device
> tree), probe success of DRM is tied to probe success of ISP1 connected
> camera sensor. This can fail if the user is able to killswitch the camera
> power, like on Pinephone Pro.
> 
> Detect use of MIPI DSI controller by ISP, and don't include it in
> component match list in that case.
> 

Isn't this supposed to be taken care of within the dts?
Since DPHY1 should exclusively used by MIPI DSI1 and ISP1, then if
a device want to use ISP1, the DSI1 should be disabled in dts.
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 47 +++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index ab55d7132550..f47de94ad576 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -354,6 +354,43 @@ static void rockchip_drm_match_remove(struct device *dev)
>   		device_link_del(link);
>   }
>   
> +/*
> + * Check if ISP block linked to a mipi-dsi device via phys phandle is
> + * enabled in device tree.
> + */
> +static bool rockchip_drm_is_mipi1_and_used_by_isp(struct device *dev)
> +{
> +	struct device_node *np = NULL, *phy_np;
> +
> +	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3399-mipi-dsi"))
> +		return false;
> +
> +	while (true) {
> +		np = of_find_compatible_node(np, NULL, "rockchip,rk3399-cif-isp");
> +		if (!np)
> +			break;
> +
> +		if (!of_device_is_available(np)) {
> +			of_node_put(np);
> +			continue;
> +		}
> +
> +		phy_np = of_parse_phandle(np, "phys", 0);
> +		if (!phy_np) {
> +			of_node_put(np);
> +			continue;
> +		}
> +
> +		of_node_put(phy_np);
> +		of_node_put(np);
> +
> +		if (phy_np == dev->of_node)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   static struct component_match *rockchip_drm_match_add(struct device *dev)
>   {
>   	struct component_match *match = NULL;
> @@ -371,6 +408,16 @@ static struct component_match *rockchip_drm_match_add(struct device *dev)
>   			if (!d)
>   				break;
>   
> +			/*
> +			 * If mipi1 is connected to ISP, we don't want to wait for mipi1 component,
> +			 * because it will not be used by DRM anyway, to not tie success of camera
> +			 * driver probe to display pipeline initialization.
> +			 */
> +			if (rockchip_drm_is_mipi1_and_used_by_isp(d)) {
> +				dev_info(d, "used by ISP1, skipping from DRM\n");
> +				continue;
> +			}
> +
>   			device_link_add(dev, d, DL_FLAG_STATELESS);
>   			component_match_add(dev, &match, component_compare_dev, d);
>   		} while (true);
