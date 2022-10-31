Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2471E612FBB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 06:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0410E117;
	Mon, 31 Oct 2022 05:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD43510E117
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 05:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=T0w8ULuDyhUzxWFGtdLWGl/ewEQE0OtdcowCqfo6WeA=; b=T/0p12qG95i6nUZEza6hIJNdwg
 0oomTKzWnqoox+ypNCTjuNN1oj/VGrHPrwrX0ooLYG0nq2DT94hhR5IE3rsIQ/tV5PdmvSzLWW4ln
 7vOGwGCC0Qa9gzt8AhpySjagNIYIiiiqVo0cUP2OLRXAwncKzHCb/scKqW39FusN2IgPWFAzbjbO/
 4NMzMvTke9/NPUvWdt3WIbH97+Cc1r7/GXiJnZQhrdSrzkpExsrgaY66XUHdENx0WFD+s3M+eI4Um
 q95mpsjTvJLchYvnJYnGs1Xj1la9eE5/eVGKVub4IXT4cpHLYZqwlJNePrNbdq0AjMRLYfcabW/cy
 nb97Q1Qg==;
Received: from [2601:1c2:d80:3110::a2e7]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1opNTs-008MYF-OV; Mon, 31 Oct 2022 05:37:04 +0000
Message-ID: <93ffb3eb-8e79-2c71-cba6-db8109956e49@infradead.org>
Date: Sun, 30 Oct 2022 22:37:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Modify mismatched function name
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, hyun.kwon@xilinx.com
References: <20221031052621.121867-1-jiapeng.chong@linux.alibaba.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221031052621.121867-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, michal.simek@xilinx.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/30/22 22:26, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/xlnx/zynqmp_dp.c:793: warning: expecting prototype for zynqmp_dp_link_train(). Prototype was for zynqmp_dp_train() instead.
> 

Note that this warning is from scripts/kernel-doc.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2666
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 7c9ae167eac7..176d752782df 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -784,7 +784,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
>  }
>  
>  /**
> - * zynqmp_dp_link_train - Train the link
> + * zynqmp_dp_train - Train the link
>   * @dp: DisplayPort IP core structure
>   *
>   * Return: 0 if all trains are done successfully, or corresponding error code.

-- 
~Randy
