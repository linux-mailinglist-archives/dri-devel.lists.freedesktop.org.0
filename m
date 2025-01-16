Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB499A13901
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364D10E943;
	Thu, 16 Jan 2025 11:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XS83S7X1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B860A10E943
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 11:31:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so433561f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 03:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737027114; x=1737631914; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnd6sU73jYDmsrBRXokzbmxa4aS7E80YMwt2n/oQ3g0=;
 b=XS83S7X1Y/2wFOqhlKSVm3MJyoDdo0IXacV1itVMcwaFwgb49/+6+L6FbJNiAkVLUR
 2IedooeTFxl1VQPkNP7G3Ry7Tpau5EmyEcKpdTSjghmQfswfIwA6W0CnS+9+rLx0JHp1
 TJ/CUGojy6tqDJVhVV5bXbJ/wH68N6cfhvEU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737027114; x=1737631914;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnd6sU73jYDmsrBRXokzbmxa4aS7E80YMwt2n/oQ3g0=;
 b=owLbXUNvBmD3NqcSUnMehMRJJAILhMgJxM60eFv/RlppaZ5JzInBeDv4Mjw0A69jd6
 biPbwK6Lj+E26erx+Ue+3Wt8bfRC6BdpUcVqYvkuN9BhJGl9qINx6v2oGOadsDkhPhkr
 nolQ9F/Zv6I02J0w65UwQCq2eQcxwpYjz+zp64Q6Bcv+b3liUyNJ/PNVA8fT3iS8xPhs
 bJeXydg59hrQfCNTKXkr8eemPtcLn/Pb4gKHcmW3lwaxcJaHzQLs+jNnxEYXBW1VdugF
 jLsfCMmen86Ugf+LY8dW8yHVneRd61hJoW8K4k/5l6ei9vhkzZjPr/HIQnirr17TBLIn
 44OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX77jwyZZvPiBlrlg+9BOf5pHG6J4I4sOYDVm+tsRTG91g4A2Fmc6DBIayhBClQZPNbhz2Yhvk8RNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnW3SfKo6WIU4Yc8TvJvp8dw+A0rZ2YQgNKbs1hUz+I5jKSXUi
 EptHMmqqEFms8O3bTMXGcKO1tVYQSIWidyZOamdkl8AaWJzKsaaWmMiJ9XGRnaE=
X-Gm-Gg: ASbGnctpldhlDEQ8CEaewCRRsNjpqUbjVIGnsq2If9SRUn2eswKSUVVK5VSL8aPTsjL
 YaFLubsejv+mIowUiQ7u/ycCp/R0+A96BRZ+kQWqlPVkq3WFY/hJPKparHPAJOnvxEGnLYxDI57
 JWTBl+DWzBCXEOf3ZQTgtUoYENoahkizmhDhSGELJibciVAoUBmeMc5FfoJ+BQi7EAu0CQMz5Uy
 iVVISxwxXVQCQTfNWzURJtuJ2BLouc+EHVXapkOblwJy2lEu2KREffD8iJYoH5sFNuH
X-Google-Smtp-Source: AGHT+IE8MJdwU7wMyzkJzaEaeAjpV4//EE99bMcQNBFtw2uWo0ACj81i58fz6k6usIbP+ONeTfig4A==
X-Received: by 2002:a5d:64eb:0:b0:386:41bd:53a3 with SMTP id
 ffacd0b85a97d-38a87310667mr28551284f8f.50.1737027114242; 
 Thu, 16 Jan 2025 03:31:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e384054sm20295886f8f.36.2025.01.16.03.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 03:31:53 -0800 (PST)
Date: Thu, 16 Jan 2025 12:31:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/29] drm/bridge: Provide a helper to get the global
 state from a bridge state
Message-ID: <Z4juJy7kKPbI2BDb@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-24-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-24-9a2fecd886a6@kernel.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 15, 2025 at 10:05:31PM +0100, Maxime Ripard wrote:
> We have access to the global drm_atomic_state from a drm_bridge_state,
> but since it's fairly indirect it's not as obvious as it can be for
> other KMS entities.
> 
> Provide a helper to make it easier to figure out.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..bd7959ae312c99c0a0034d36378ae44f04f6a374 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1183,10 +1183,26 @@ static inline struct drm_bridge_state *
>  drm_priv_to_bridge_state(struct drm_private_state *priv)
>  {
>  	return container_of(priv, struct drm_bridge_state, base);
>  }
>  
> +/**
> + * @drm_bridge_state_get_atomic_state() - Get the atomic state from a bridge state
> + * @bridge_state: bridge state object
> + *
> + * RETURNS:
> + * The global atomic state @bridge_state is a part of, or NULL if there is none.
> + */
> +static inline struct drm_atomic_state *
> +drm_bridge_state_get_atomic_state(struct drm_bridge_state *bridge_state)

So this one is nasty, because we clear out these backpointers once we push
the states into obj->state (because they can then outlive the
drm_atomic_state). Which means you can't use this in commit callbacks. Or
the bridge code has a really bad use-after-free when it doesn't clear out
these backpointers when we swap in the new states in
drm_atomic_helper_swap_state().

The better pattern is to just ditch passing individual states to callbacks
and just pass the entire drm_atomic_state container, and let callbacks
fish out what exactly they need. And also provide all necessary helpers to
find the right states and all that stuff.

We should probably also document that design approach in the kerneldoc for
drm_atomic_state, or wherever there's a good place for that.

See also my other reply for some of the history of why we have this mess.

Cheers, Sima

> +{
> +	if (!bridge_state)
> +		return NULL;
> +
> +	return bridge_state->base.state;
> +}
> +
>  struct drm_bridge_state *
>  drm_atomic_get_bridge_state(struct drm_atomic_state *state,
>  			    struct drm_bridge *bridge);
>  struct drm_bridge_state *
>  drm_atomic_get_old_bridge_state(const struct drm_atomic_state *state,
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
