Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EF227A74
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840496E28E;
	Tue, 21 Jul 2020 08:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jul 2020 08:28:13 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564CF89F6B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 08:28:13 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id 7E21012011F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 16:22:41 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.231])
 by regular2.263xmail.com (Postfix) with ESMTP id 438F12B5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 16:22:33 +0800 (CST)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id ADD4715E5;
 Mon, 20 Jul 2020 16:22:26 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.230] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P17843T139820244399872S1595233344948995_; 
 Mon, 20 Jul 2020 16:22:26 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <ee61f11e52c0f1bdab7b994fbb736568>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_2/5=5d_drm=3a_rockchip=3a_add_missing_regi?=
 =?UTF-8?B?c3RlcnMgZm9yIFJLMzE4OOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJv?=
 =?UTF-8?Q?ckchip-bounces+andy=2eyan=3drock-chips=2ecom=40lists=2einfradead?=
 =?UTF-8?B?Lm9yZ+S7o+WPkeOAkQ==?=
To: Alex Bee <knaerzche@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20200718200323.3559-1-knaerzche@gmail.com>
 <20200718200323.3559-3-knaerzche@gmail.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <871ce1ac-2d5b-c0a2-60a6-6aba0f296c18@rock-chips.com>
Date: Mon, 20 Jul 2020 16:22:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200718200323.3559-3-knaerzche@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex:

On 7/19/20 4:03 AM, Alex Bee wrote:
> This patch adds dither_up, dsp_lut_en, data_blank and dsp_data_swap
> registers to enable their respective functionality for RK3188's VOP.
>
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> index b046910129fb..971a6bda7458 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -512,6 +512,10 @@ static const struct vop_common rk3188_common = {
>   	.dither_down_en = VOP_REG(RK3188_DSP_CTRL0, 0x1, 11),
>   	.dither_down_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 10),
>   	.dsp_blank = VOP_REG(RK3188_DSP_CTRL1, 0x3, 24),
> +	.dither_up = VOP_REG(RK3188_DSP_CTRL0, 0x1, 9),
> +	.dsp_lut_en = VOP_REG(RK3188_SYS_CTRL, 0x1, 28),
> +	.data_blank = VOP_REG(RK3188_DSP_CTRL1, 0x1, 25),
> +	.dsp_data_swap = VOP_REG(RK3188_DSP_CTRL1, 0x1f, 26),



I can't find the definition of dsp_data_swap, or I missed something?



>   };
>   
>   static const struct vop_win_data rk3188_vop_win_data[] = {


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
