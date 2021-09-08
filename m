Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C3403E36
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 19:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3210D6E214;
	Wed,  8 Sep 2021 17:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CB96E214
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 17:13:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id e21so5595378ejz.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=94RfL+XQJazAGxoDLsJBPk4y2Cmj3BLmNWDabKgbvBo=;
 b=TfRslReoIaZtyNR/fIDuNfW/Da+aBlcZMFJ8/jUAcIzOaBjUQ9S51BuA7yLlCkCUHN
 5IZV+0gS1+GmsJRN9e+KMlb2+9a1jRNm71j0kybuMXGH6USHvFfYSg6i02nMlZH+y7cy
 VDu+QJiW0Gve+5e8j2KclF6rQHzmPc7SvMDpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=94RfL+XQJazAGxoDLsJBPk4y2Cmj3BLmNWDabKgbvBo=;
 b=xpLsCzZWBPRUQju4dzWQbxvNc4Rp/cci4Hmopx06s06py95mKSocpJlp110GcofKIG
 gK8swuzsGb04Nht+rD/1lbTtTGwjcHQNhw4nPoPYp+ju9uW8u338I4Q6G8FThA/cMKCv
 ERwrOMC5oQNja3aMhxw+d4uoZQMSkOAl6Vx3y9iasPtuZ1IGwqQzp8Iqp6zomd9UVsbY
 0tijxzkdz/ZO1Rtx04BWnOR4RbJbBKOboBKtZEfUKW/3j3uqWvPPAPe1+EW/SVSDl1u2
 M0tkijFu1i1lEhEj1brKNfgFxSd2VNItGZ0xJdJ5JaLaq6IzpiMcNi7mE42Q10seNkuX
 I7IA==
X-Gm-Message-State: AOAM532CgNwbV0yJXhAdYHsT5pUFU5AdFdR1aOq+ME7O8eGIIdhd7syt
 vw2gZKtIVrGXqUQEMtiLPtgyUQ==
X-Google-Smtp-Source: ABdhPJxBatGiw03lcpCbxiZWOnM2wBapIEG0A8UmwJ2+oLJ4x93tKMCbvGGv2mCJwmWmgOKYGZBisQ==
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr932125eje.165.1631121191251; 
 Wed, 08 Sep 2021 10:13:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id qx18sm1324868ejb.75.2021.09.08.10.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:13:10 -0700 (PDT)
Date: Wed, 8 Sep 2021 19:13:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin King <colin.king@canonical.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915: clean up inconsistent indenting
Message-ID: <YTjvJFeMs6+Hi3IR@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902215737.55570-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902215737.55570-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Sep 02, 2021 at 10:57:37PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented one character too deeply,
> clean this up.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued to drm-intel-gt-next, thanks for patch.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de5f9c86b9a4..aeb324b701ec 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2565,7 +2565,7 @@ __execlists_context_pre_pin(struct intel_context *ce,
>  	if (!__test_and_set_bit(CONTEXT_INIT_BIT, &ce->flags)) {
>  		lrc_init_state(ce, engine, *vaddr);
>  
> -		 __i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
> +		__i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
>  	}
>  
>  	return 0;
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
