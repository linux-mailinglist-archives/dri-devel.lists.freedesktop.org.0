Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C19A2DB6E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 08:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FECC10E25A;
	Sun,  9 Feb 2025 07:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TaViGWNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B91A10E25A
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 07:01:29 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3086edccb4cso17973341fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 23:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739084488; x=1739689288; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Iq4qRSJV5uULnfmrLvFv7xZxubtH0jGdLt8QWyGqzOA=;
 b=TaViGWNPhil60byBhmxnKIQyqX5blfNnypNC5ra8fYv5enDBu8msRPz9lu6sNnWM3h
 tXYxTACzIyMIHdOIYNkG57wZc7zt4rGvIBFSOAcPrVE0es+yuk/CkJ+6DgmqTCS3JtyV
 S37S4nyNV3vOuiDnUGSm1KMdst4iw8hUyFJKD6ACyoL6UP+8M5jEo/QUE4YUvYzpRDoq
 APeyV6ydFQ5OdbxWBKgVIHF/Op914jk2dVB8bJG2Ew2aYOkjBnyo0Z8LmY3e8IlgBEmH
 fG0T79zKbMkCKIkqXKvJX+qH8u1ZWZU7y+Wbed8f2DtQqS3pKeboAZF+HMaqI0cmFvtF
 66aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739084488; x=1739689288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iq4qRSJV5uULnfmrLvFv7xZxubtH0jGdLt8QWyGqzOA=;
 b=nbyw7S242AAFtzY33Aw9kvAxEg00Hnqi9x+jAP8dZ8JXr6puJamTBbDHm3rREksaf4
 pcPwvXgjaHlS+YRN2REI8rpr2DIQ0ufAgPwK7NdHXPhoKoPnrFp9YCwe/gmMo+FAJwzE
 BMUvNo21YquGFYRaHsl45IEJMzhINUxcJBQ/pNufeysWwosfH1qHU7RYo8pMRVStzxPD
 1WXdtOV0gGp0AmfzGZnIAhiLVLnxxcwz5Ylz7WcLZ1iVD2ruttRdZSx09CU8dcJ1puEL
 jHPFmB4ncVG5BKN70xyx3tcYp9f+rnwQ+yvNoVil76KAwNF/Y/foLiIio0MlxV0s8wLx
 T82g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjd/k/1BdhTIt020o+26rxJS9VFJ+hrWEXneqnkwBRI24ZrVmMcCaqJy0rB5hNCQpNoVHiJOIUgrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgVFI0f/lmvZRrMrfssoWHISNPUwhOUtVNZVD7f+ujudAFdDkz
 KRvA3/Z2YzhOVYzlRuCxItkFYh3yQa4KIBW/Tr3sYTebUMUxFJcVKdrCSq5TqGQ=
X-Gm-Gg: ASbGnct9MiDvelty8g8+rzo7i1cB+8hTspUMn2ja4E0b1ayQcgDGC3db+5c+lokfSzT
 WVbE/1Mk4glqeZiP9n5XnjrdTcZ+1dsxDyy2fFI/IckHvHRiaDUvO1jKa7H7B6J1OEaBUj4qmoq
 iP8T3gI61tix4d7vgh6UjIBq5Uz3L1Zx/+avBzhtFUuNbmGa7qn6nf7rCwbHnyc7SCoQpDC30jX
 K9yrZUO440VvIPOH8eU0tXzRAZ4Ahdt9Fmp5vhF6XDRjBjqU0RzsufjCGSaONCrboxBc+Jd18Hz
 boTy+qNoNcjuhHcgO0QZQnevcLe/F/aKzNuD8eaH9dBBo/rWXuE8OnVAJ+LmMX8JUcFMtYk=
X-Google-Smtp-Source: AGHT+IE2JdpPRXE6BXPYqP41DnyeGkbzBX1fLmBvKaoIaPeVfLE7uZzzI3vSGU6XnQBVtX+HCEBANw==
X-Received: by 2002:a05:651c:2112:b0:300:2c9f:ac51 with SMTP id
 38308e7fff4ca-307e57cf74dmr29182731fa.2.1739084487750; 
 Sat, 08 Feb 2025 23:01:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308dd1c0ea2sm4365671fa.61.2025.02.08.23.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 23:01:26 -0800 (PST)
Date: Sun, 9 Feb 2025 09:01:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 31/35] drm/bridge: Make encoder pointer deprecated
Message-ID: <esxj7jknjhrdlio3gl3s6ec7h3ralblni5mwwc4s4krpqp35xm@n3t6i2bdvhjv>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-31-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-31-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:59PM +0100, Maxime Ripard wrote:
> Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> pointer to other currently bound entities. They are all considered
> relevant only for non-atomic drivers, and generally perceived as
> deprecated in favour of the equivalent pointers in the atomic states.
> 
> It used to be useful because we didn't have alternatives, but now that
> we do, let's make sure it's done for drm_bridge.encoder too.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_bridge.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
