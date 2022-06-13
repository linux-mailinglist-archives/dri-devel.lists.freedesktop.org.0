Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A93548206
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA18210E029;
	Mon, 13 Jun 2022 08:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AA2E10E029
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 08:55:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A74D1042
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 01:55:02 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E87C3F66F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 01:55:02 -0700 (PDT)
Date: Mon, 13 Jun 2022 09:54:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: 1064094935@qq.com
Subject: Re: [PATCH 1/5] drm/arm: Fix spelling typo in comments
Message-ID: <Yqb7XpHyay80PiQY@e110455-lin.cambridge.arm.com>
References: <tencent_3F6C6B27BB06D7A05825908262DBE693E906@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_3F6C6B27BB06D7A05825908262DBE693E906@qq.com>
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
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 27, 2022 at 11:39:03AM +0800, 1064094935@qq.com wrote:
> From: pengfuyuan <pengfuyuan@kylinos.cn>
> 
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

I've got only patch 1 of 5, so I'm going to assume that you're going to get the
series merged via some other way. If that's not the case, please let me know.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
>  drivers/gpu/drm/arm/malidp_regs.h                          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> index e672b9cffee3..3276a3e82c62 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> @@ -1271,7 +1271,7 @@ int komeda_release_unclaimed_resources(struct komeda_pipeline *pipe,
>  	return 0;
>  }
>  
> -/* Since standalong disabled components must be disabled separately and in the
> +/* Since standalone disabled components must be disabled separately and in the
>   * last, So a complete disable operation may needs to call pipeline_disable
>   * twice (two phase disabling).
>   * Phase 1: disable the common components, flush it.
> diff --git a/drivers/gpu/drm/arm/malidp_regs.h b/drivers/gpu/drm/arm/malidp_regs.h
> index 514c50dcb74d..59f63cc2b304 100644
> --- a/drivers/gpu/drm/arm/malidp_regs.h
> +++ b/drivers/gpu/drm/arm/malidp_regs.h
> @@ -145,7 +145,7 @@
>  #define     MALIDP_SE_COEFFTAB_DATA_MASK	0x3fff
>  #define     MALIDP_SE_SET_COEFFTAB_DATA(x) \
>  		((x) & MALIDP_SE_COEFFTAB_DATA_MASK)
> -/* Enhance coeffents reigster offset */
> +/* Enhance coeffents register offset */
>  #define MALIDP_SE_IMAGE_ENH			0x3C
>  /* ENH_LIMITS offset 0x0 */
>  #define     MALIDP_SE_ENH_LOW_LEVEL		24
> -- 
> 2.25.1
> 
> 
> No virus found
> 		Checked by Hillstone Network AntiVirus

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
