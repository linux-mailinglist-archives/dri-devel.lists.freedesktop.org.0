Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AB438425
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 17:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589EA6E05F;
	Sat, 23 Oct 2021 15:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF536E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=8WjsifxMEzwDn1bVZQuBHqGF9kBDXxwzGqyMOEK0hBQ=; b=VyHGKkIXT6nN2C6ClgziZsDpIP
 CYqys9He8Gwx/VK5XYVY7/bu05m9ZVpdpqcf1+kjvl7ycA9C8HxK6BvkN9RlHdWj8asb+5OSkJ7E/
 l6xBfBT5LbF+n1NYjiDgHVMhQsjHYVcvUbWfFvw+skl5zznn/iM+3Uf1eJ2QLiuzVwHvAfW9uJedS
 sOXeI0/AK7BVC2bY5IJ9zu9/LEtnN/Q6fbIHaIslq6QxIo0WboyOds4wkfFcT7NRHjD+8NyF4ySVu
 v7LC5wCF9JqLH01cTejK5bJ2EJg3dOWFSCyy1FbvuQIi3+JK8MbTfdFC+Nc1FqToeG5Q57yfbdzlB
 mrdcoiRg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meJHM-00CuB8-W3; Sat, 23 Oct 2021 15:49:53 +0000
Subject: Re: [RFC 06/13] soc: mediatek: apu: Add apu core driver
To: Flora Fu <flora.fu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-7-flora.fu@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <35b6b7af-87f1-4390-faf8-9f44c192aedd@infradead.org>
Date: Sat, 23 Oct 2021 08:49:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-7-flora.fu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi,

On 10/23/21 4:14 AM, Flora Fu wrote:
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d9bac2710494..074b0cf24c44 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -24,6 +24,24 @@ config MTK_APU_PM
>   	  APU power domain shall be enabled before accessing the
>   	  internal sub modules.
>   
> +config MTK_APU
> +	tristate "MediaTek APUSYS Support"
> +	select REGMAP
> +	select MTK_APU_PM
> +	select MTK_SCP
> +	help
> +	  Say yes here to add support for the APU tinysys. The tinsys is

	                                                       tinysys runs on

> +	  running on a micro processor in APU.

	  a microprocessor in the APU.

> +	  Its firmware is load and boot from Kernel side. Kernel and tinysys use

	               is loaded and booted

> +	  IPI to tx/rx messages.

	      to send/receive messages.

> +
> +config MTK_APU_DEBUG
> +	tristate "MediaTek APUSYS debug functions"
> +	depends on MTK_APU
> +	help
> +	  Say yes here to enalbe debug on APUSYS.

	                  enable

> +	  Disable it if you don't need them.


-- 
~Randy
