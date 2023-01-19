Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4420673B52
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84DC10E94C;
	Thu, 19 Jan 2023 14:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411010E94C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=EgpLqnGYx9lstpO8MgRZFe/D8D+ZVTfQFqrLhQr9adg=;
 b=qgKS00gCz0weGryf95qiwnvsOiMVyymTKgqj4A+dww8VOQ/EdQv/Z4bnQsSfMXzNKt/dCS4FVJ+Z/
 IBZmai+vBIBMP2Yk/VpQySkRnO6sKB3heFmTX6VKiot7CrVFArlYJ50KbGdJyp5dwPSyzoNaavuDOT
 xj1hgz4DAi4za1IDxnrFYfmj9OfCbBS3MliYj3Y46owqDjXbgvkQbxHgbstZLxptDf4+NalvoRRMGZ
 LIZ/0Mk/oNWCXDupON5UTkuEF0kBB3F5Ky3bSif7SDiKJQNAW2Dt+1sfMwbMGPRYcecdqNKV3k7/Qm
 orTch8Z67UnNd+EQ6LOgXcgjIqrS9pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=EgpLqnGYx9lstpO8MgRZFe/D8D+ZVTfQFqrLhQr9adg=;
 b=jncknQsqQVn8In5+qTVXIGfb7o5/yjupSS/RQGk+82mOrStpX/YkpAKPUlJC3VwyUMfowEQkTjdQg
 LNSyIhNDw==
X-HalOne-ID: bad57db1-9802-11ed-bd40-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id bad57db1-9802-11ed-bd40-87783a957ad9;
 Thu, 19 Jan 2023 14:08:22 +0000 (UTC)
Date: Thu, 19 Jan 2023 15:08:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: vtdr6130: fix unused ret in
 visionox_vtdr6130_bl_update_status
Message-ID: <Y8lO1cSkh/eZFd23@ravnborg.org>
References: <20230119-topic-sm8550-vtdr6130-fixup-v1-1-82c4fb008138@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119-topic-sm8550-vtdr6130-fixup-v1-1-82c4fb008138@linaro.org>
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
Cc: kernel test robot <lkp@intel.com>, Richard Acayan <mailingradian@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 03:04:12PM +0100, Neil Armstrong wrote:
> Fix the following warning:
> panel-visionox-vtdr6130.c:249:12: warning: 'ret' is used uninitialized [-Wuninitialized]
> 
> Fixes: 9402cde9347e ("drm/panel: vtdr6130: Use 16-bit brightness function")
> Reported-by: Daniel Vetter <daniel@ffwll.ch>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index 1092075b31a5..bb0dfd86ea67 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -243,13 +243,8 @@ static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi = bl_get_data(bl);
>  	u16 brightness = backlight_get_brightness(bl);
> -	int ret;
>  
> -	mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> +	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>  }
>  
>  static const struct backlight_ops visionox_vtdr6130_bl_ops = {
> 
> ---
> base-commit: 43bde505d66a41c2ad706d603e97b2c8aa2fbe4a
> change-id: 20230119-topic-sm8550-vtdr6130-fixup-fb25f686ba59
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
