Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9461859E48B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 15:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF2D12B6B3;
	Tue, 23 Aug 2022 13:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6876B14BB12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 13:37:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98B62113E;
 Tue, 23 Aug 2022 06:37:06 -0700 (PDT)
Received: from [10.57.15.51] (unknown [10.57.15.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A63F03F70D;
 Tue, 23 Aug 2022 06:37:01 -0700 (PDT)
Message-ID: <48f4a56f-0586-9e9d-c121-6309be65b803@arm.com>
Date: Tue, 23 Aug 2022 14:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/exynos: fix repeated words in comments
Content-Language: en-GB
To: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org
References: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-23 13:21, Jilin Yuan wrote:
>   Delete the redundant word 'next'.

 From the context, I'm not sure it is redundant - as far as I can tell 
this comment seems to be describing a sequence of 3 commands, where 
"current" is the first, "next" is the second, and "next next" implies 
the third. The whole comment could certainly be reworded more clearly, 
but as it stands I suspect a replacement like s/next next/next+1/ is 
more likely to be correct.

Robin.

> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 471fd6c8135f..4f9edca66632 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -1195,7 +1195,7 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
>   	 * If don't clear SFR registers, the cmdlist is affected by register
>   	 * values of previous cmdlist. G2D hw executes SFR clear command and
>   	 * a next command at the same time then the next command is ignored and
> -	 * is executed rightly from next next command, so needs a dummy command
> +	 * is executed rightly from next command, so needs a dummy command
>   	 * to next command of SFR clear command.
>   	 */
>   	cmdlist->data[cmdlist->last++] = G2D_SOFT_RESET;
