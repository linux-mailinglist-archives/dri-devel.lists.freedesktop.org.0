Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A55B558037
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 18:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A6010E4A2;
	Thu, 23 Jun 2022 16:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE8A10E212
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 16:46:58 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id y14so153641qvs.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B1jvVdluJ66W41UOcamwBo/85mg4sSq7LE7oRZc9/Ws=;
 b=CQgpPxqnnpqAloyO7Cx3oS7JP5gZQB3Qg0Mw2O4cWqw3cPSl/gs3pEoUgwTf3F2ERo
 dqIndkVy6qNbaczXA18ui/W1Uf2EYbUGkmckXM1NOGViyBpaCUtGPOXa2WE1WTX9e1SY
 WML0WjDpL/clGTLZdmKiq6o2tGLLrdlI9gHCS10Mi/kIkpec+p5IdmoZ1XFY7puK4uUH
 BOawN171/X8635YxQHiPx4XzloEvkwByWBIBZEK6EdI0XLNGOUpp6hZiKZvi2jJngvF0
 B9azYvIFMbctnuc1A9kMbnzp+BAbHnl6yOUVoDpD9sY5t2AHKxM4D6ijomMyR/wV0j+M
 MQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B1jvVdluJ66W41UOcamwBo/85mg4sSq7LE7oRZc9/Ws=;
 b=UsUWOZt45RYNYH6p1Jx7mjb+q13sFyInCiSaffjWtgzhamHKpx5Jo99K+807AJRbaS
 d5B6oxwzrA0RkKu9jbfCwIUSW2GbkXzh2VwTYtSSB5vRu/L30DE1xRfzWP0twnAt1UE+
 FXlikxDDRsOdsr0Q8xVl5yvBs0chUOwMWFTLL9RNEb4qw0TCxuSE4xKyY03/qjR1LcTY
 eRsUm9bvb+2x+z9Bu9QrEAtAwbjSJx7fbP1txpHdVkc1m6GKumUx9+nGDCyb5dwN7DmI
 GNJzUBcI/uc2Wj87SpEdRk3T/AqorwEcE1zmDBaRZpmORFVvnhtfIqG/j2VWdsgp5jH6
 /rug==
X-Gm-Message-State: AJIora+QQatUibwCFeq7DVbBVgqLK78WL2Xdf+xVIWMYKSIgXuFZ1gSK
 ktZXqgA6MkgKKyOh1Oraan6GiA==
X-Google-Smtp-Source: AGRyM1vxTXHu+RcB3wUEKbXav6TTh4Vf0ZudnPRdRYthYM9mf8uEoaiSOtHZwJ2Xro3RBhPUjeOqUA==
X-Received: by 2002:ac8:5a04:0:b0:304:f19e:5fe4 with SMTP id
 n4-20020ac85a04000000b00304f19e5fe4mr8951799qta.374.1656002817837; 
 Thu, 23 Jun 2022 09:46:57 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 x28-20020ac8701c000000b00316022dcc08sm3157121qtm.11.2022.06.23.09.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 09:46:57 -0700 (PDT)
Date: Thu, 23 Jun 2022 16:46:56 +0000
From: Sean Paul <sean@poorly.run>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] drm/rockchip: vop: Don't crash for invalid
 duplicate_state()
Message-ID: <YrSZAMYzEkXUExNG@art_vandelay>
References: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
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
 dri-devel@lists.freedesktop.org, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 05:26:52PM -0700, Brian Norris wrote:
> It's possible for users to try to duplicate the CRTC state even when the
> state doesn't exist. drm_atomic_helper_crtc_duplicate_state() (and other
> users of __drm_atomic_helper_crtc_duplicate_state()) already guard this
> with a WARN_ON() instead of crashing, so let's do that here too.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Thanks for this patch!

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 74562d40f639..daf192881353 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1570,6 +1570,9 @@ static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
>  	struct rockchip_crtc_state *rockchip_state;
>  
> +	if (WARN_ON(!crtc->state))
> +		return NULL;
> +
>  	rockchip_state = kzalloc(sizeof(*rockchip_state), GFP_KERNEL);
>  	if (!rockchip_state)
>  		return NULL;
> -- 
> 2.36.1.476.g0c4daa206d-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
