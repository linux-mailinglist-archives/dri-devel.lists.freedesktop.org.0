Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE36649A39
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 09:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0634810E071;
	Mon, 12 Dec 2022 08:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A604910E071
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:42:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96BD860F24;
 Mon, 12 Dec 2022 08:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D89C433EF;
 Mon, 12 Dec 2022 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670834519;
 bh=bp9hj0RVByKQktcC0dW/qzUFrg5xq9JprWMyU7tTG14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iQcLCJ7aZQwe9+6zjZl79n61zWOtEzrvlyRFS1IxQ0qOhRvjjHH4mhH5YEbUQqiPB
 WT4Y1hJABUHLJW2mUZ7fSej1hdbKx4jtK++PEaBOUoMIvedc/WJ/FavPwfaInmpgDa
 lKwGagt0HpwSXYINnsdB7CP4dhu48s8V0BaS8KKTLckjse2E1WCS28BTsVZ6f2MH6g
 xU7+bfVfkWm57KxjxqX94YqiU2GmN8zJGy8rkV9b17a7baqd8Ob1ON5Adh/zsweIno
 k78qYH/dihM4JAKwwh+aWTPbNKd3HbE043YdYhVoK3PPR9Q5LC4JmXIqnk48/vkSmU
 R57tb+YXlX7lg==
Date: Mon, 12 Dec 2022 10:41:54 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] net: ksz884x: Remove the unused function
 port_cfg_force_flow_ctrl()
Message-ID: <Y5bpUnqOij8HduWh@unreal>
References: <20221212035309.33507-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212035309.33507-1-jiapeng.chong@linux.alibaba.com>
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
Cc: netdev@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 davem@davemloft.net, linaro-mm-sig@lists.linaro.org, kuba@kernel.org,
 pabeni@redhat.com, sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 11:53:09AM +0800, Jiapeng Chong wrote:
> The function port_cfg_force_flow_ctrl() is defined in the ksz884x.c file,
> but not called elsewhere, so remove this unused function.
> 
> drivers/net/ethernet/micrel/ksz884x.c:2212:20: warning: unused function 'port_cfg_force_flow_ctrl'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3418
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/net/ethernet/micrel/ksz884x.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
> index e6acd1e7b263..46f1fbf58b5a 100644
> --- a/drivers/net/ethernet/micrel/ksz884x.c
> +++ b/drivers/net/ethernet/micrel/ksz884x.c
> @@ -2209,12 +2209,6 @@ static inline void port_cfg_back_pressure(struct ksz_hw *hw, int p, int set)
>  		KS8842_PORT_CTRL_2_OFFSET, PORT_BACK_PRESSURE, set);
>  }
>  
> -static inline void port_cfg_force_flow_ctrl(struct ksz_hw *hw, int p, int set)
> -{
> -	port_cfg(hw, p,
> -		KS8842_PORT_CTRL_2_OFFSET, PORT_FORCE_FLOW_CTRL, set);
> -}
> -
>  static inline int port_chk_back_pressure(struct ksz_hw *hw, int p)

This function is not called too. Many functions in that file can be
removed. Please do it in one patch.

Thanks

>  {
>  	return port_chk(hw, p,
> -- 
> 2.20.1.7.g153144c
> 
