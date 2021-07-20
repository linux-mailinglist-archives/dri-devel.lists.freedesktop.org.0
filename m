Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F33CFA1E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20BF6E2D5;
	Tue, 20 Jul 2021 13:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD0D6E2C7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:08:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c15so2349416wrs.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvHTohQOXUo1eNzTbptDnQ980SKchLpYfyQkug8oLsM=;
 b=FZ7B87n7ZKH5WlwYufOcG72EJmbAaUBUE4aFuEpuEsqmjOIyRz6/XyFpVO7exRf5Wb
 dyZrHG+WOrHkEo9owvwnpXCrJcTd7X4Frz4ddtsdLCY2qk9tlFUBWk94lopmcQM3+zt6
 BjfmggyN4mvYvqpXEhBlTfCVoea5a0qDcd/Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uvHTohQOXUo1eNzTbptDnQ980SKchLpYfyQkug8oLsM=;
 b=kK8LJfJ3Q/SKLuydHBDpaLbb5hYxUHY0/VP/IEwldBFJB3YH3qO734MlV81gjCtkvB
 RX3rbQnD9JFH94ftQzb77Pnx9t/twA9kU7S0AQ+NYae7r2UMOcd7aftMYkJOuttCEHjv
 Mj0BmNrtecWqbqT09Pb2y5IbDj6fQo+8a8YGour8Tn4D0198aLQw6KRIuCRpfkIVXuxq
 yq+JnZen79gMyajVy8/oBdTpPy/Kd0WhTRF1Qk5d732iddDYxLURKf39TGIKyJ81yPgq
 Y0KTFhwhd5+V4Jt8IWj35jMGtXc36omXBgxVPX2prf7XtDRbfXVIImEwUs1e0ppcepBS
 JGjw==
X-Gm-Message-State: AOAM533HMGyCkd/5IJfShwD3X7TskP/V9aBjnrLR13TjZ+zW6XtzeXTm
 UuAHGyJMCw7pZdFP0wCKorlPeA==
X-Google-Smtp-Source: ABdhPJyUbagFa2jJYY8PhdxQ3iWQEkYXCDmIYQQXB8xNIPSArbgllu0G7MR5Pi9l2jz7RgWOZA4nAw==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr35043388wry.128.1626786493358; 
 Tue, 20 Jul 2021 06:08:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r17sm2423906wmq.13.2021.07.20.06.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:08:12 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:08:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v3 1/5] drm/print: fixup spelling in a comment
Message-ID: <YPbKukQVbHt1Yuin@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jbaron@akamai.com
References: <20210714175138.319514-1-jim.cromie@gmail.com>
 <20210714175138.319514-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714175138.319514-2-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 11:51:34AM -0600, Jim Cromie wrote:
> s/prink/printk/ - no functional changes
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  include/drm/drm_print.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9b66be54dd16..15a089a87c22 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -327,7 +327,7 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>  /*
>   * struct device based logging
>   *
> - * Prefer drm_device based logging over device or prink based logging.
> + * Prefer drm_device based logging over device or printk based logging.
>   */
>  
>  __printf(3, 4)
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
