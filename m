Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA33ABAB8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 19:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA226E971;
	Thu, 17 Jun 2021 17:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3268C6E970
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 17:36:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n23so3964896wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hRboyT3Px4Bh5KPhImfvUXYzcpIAxMeOVL/V1Z4UHPE=;
 b=RR+u6A/06lfdqDqYmXZVMQjZG2N60Diui/M/YZ2oB28+Wa74KYcN/p1pfKLaaIg3S0
 +E64VBEumEsYQsXjI26hKD1Kv9XL9B5fe4flODe3AZ9sxyuZOTGQ0Z8hFxDr77yEcqnU
 Z7y9+7J5h170T/OeO0cgC5cSsrimM4jZghHLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hRboyT3Px4Bh5KPhImfvUXYzcpIAxMeOVL/V1Z4UHPE=;
 b=Dp2BymNf5V7fWdLLKwBdvfm4fW5oB6qjlk8cSPsetDc5ng4cjGVw0U7DH9DnYsGwC+
 yZpUITDyrTD6YUP0LtwcdBVhIQjrYNDAKiHQ74RG9fgy1Za/Dz8aSTIifmdbaFS/Hp63
 JbuTXR6Kb5avSkDCSYkblbJenjkjC1Z4ar4YQUP0sMBc/7x+PljHgxm5HWlsy7IFC6jF
 VHW6HxqLscxol33j8Vc0NXj1R9OIi6vSUqgSaeTgFE+BBLEwGxDRvqF7HSmD4GBS6NC1
 rMUNhu7hEvUI/qVXBg7Q5VBWAewcUcm9ZmomcSuUCg6Jv3nLoBIY+NQ0DuzPduvYcAjF
 l2Jw==
X-Gm-Message-State: AOAM533jQ2n+qFsrWrGnMNNZslHHgjel4yz+cM2xx87AcSN1poqlFIBd
 X7yd4v8yPTrGWM/5f4Z93rFZ2g==
X-Google-Smtp-Source: ABdhPJymg8rF8PgFQgt+R9gf2l9QwPwixcZwWeo5KN3MgGywFLFVuPNg0334YonJgaX8o67kjenwdg==
X-Received: by 2002:a05:600c:2103:: with SMTP id
 u3mr6673005wml.0.1623951415925; 
 Thu, 17 Jun 2021 10:36:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o20sm8356179wms.3.2021.06.17.10.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:36:54 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:36:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm/i915: Remove duplicate include of intel_region_lmem.h
Message-ID: <YMuINKQ/ScxdkCSx@phenom.ffwll.local>
Mail-Followup-To: Wan Jiabing <wanjiabing@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 CQ Tang <cq.tang@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210615113522.6867-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615113522.6867-1-wanjiabing@vivo.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 07:35:20PM +0800, Wan Jiabing wrote:
> Fix the following checkinclude.pl warning:
> drivers/gpu/drm/i915/gt/intel_region_lmem.c
> 8	#include "intel_region_lmem.h"
>      12	#include "intel_region_lmem.h"
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Applied to drm-intel-gt-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index f7366b054f8e..119eeec98837 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -9,7 +9,6 @@
>  #include "intel_region_ttm.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
> -#include "intel_region_lmem.h"
>  
>  static int init_fake_lmem_bar(struct intel_memory_region *mem)
>  {
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
