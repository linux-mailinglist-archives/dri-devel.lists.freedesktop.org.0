Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035E879A8DB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 16:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3130B10E30F;
	Mon, 11 Sep 2023 14:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3056910E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 14:46:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA90E1007
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 07:46:49 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 881173F738
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 07:46:12 -0700 (PDT)
Date: Mon, 11 Sep 2023 15:46:08 +0100
From: "liviu.dudau@arm.com" <liviu.dudau@arm.com>
To: Liu =?utf-8?B?THVjYXMv5YiY5L+d5p+x?= <lucas.liu@siengine.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= drm/komeda: add
 NV12 format to support writeback layer type
Message-ID: <ZP8oMFLFc_Lr090h@e110455-lin.cambridge.arm.com>
References: <20230829093004.22860-1-lucas.liu@siengine.com>
 <b393669c80274dfcbcf94c60fea8ae76@siengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b393669c80274dfcbcf94c60fea8ae76@siengine.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Sorry about the delay, I was on holiday until 28th and while cleaning up the backlog I've accidentally marked the email
as read and did not reply.


On Fri, Sep 08, 2023 at 08:11:44AM +0000, Liu Lucas/刘保柱 wrote:
> Hi  all,
> 
> 	Do you have any suggestions for the patch I submitted? Please also let me know, thank you!
> 
> Best Regards,
> baozhu.liu
> -----邮件原件-----
> 发件人: baozhu.liu <lucas.liu@siengine.com> 
> 发送时间: 2023年8月29日 17:30
> 收件人: liviu.dudau@arm.com; airlied@gmail.com; daniel@ffwll.ch
> 抄送: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Liu Lucas/刘保柱 <lucas.liu@siengine.com>
> 主题: [PATCH] drm/komeda: add NV12 format to support writeback layer type
> 
> When testing the d71 writeback layer function, the output format is set to NV12, and the following error message is displayed:
> 
> [drm:komeda_fb_is_layer_supported] Layer TYPE: 4 doesn't support fb FMT: NV12 little-endian (0x3231564e) with modifier: 0x0..
> 
> Check the d71 data manual, writeback layer output formats includes NV12 format.
> 
> Signed-off-by: baozhu.liu <lucas.liu@siengine.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

I will push the patch this week into drm-misc-next.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> index 6c56f5662bc7..80973975bfdb 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -521,7 +521,7 @@ static struct komeda_format_caps d71_format_caps_table[] = {
>  	{__HW_ID(5, 1),	DRM_FORMAT_YUYV,	RICH,		Rot_ALL_H_V,	LYT_NM, AFB_TH}, /* afbc */
>  	{__HW_ID(5, 2),	DRM_FORMAT_YUYV,	RICH,		Flip_H_V,		0, 0},
>  	{__HW_ID(5, 3),	DRM_FORMAT_UYVY,	RICH,		Flip_H_V,		0, 0},
> -	{__HW_ID(5, 6),	DRM_FORMAT_NV12,	RICH,		Flip_H_V,		0, 0},
> +	{__HW_ID(5, 6),	DRM_FORMAT_NV12,	RICH_WB,	Flip_H_V,		0, 0},
>  	{__HW_ID(5, 6),	DRM_FORMAT_YUV420_8BIT,	RICH,		Rot_ALL_H_V,	LYT_NM, AFB_TH}, /* afbc */
>  	{__HW_ID(5, 7),	DRM_FORMAT_YUV420,	RICH,		Flip_H_V,		0, 0},
>  	/* YUV 10bit*/
> --
> 2.17.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
