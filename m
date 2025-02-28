Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F328AA491D1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 07:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742BF10E1DF;
	Fri, 28 Feb 2025 06:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D0amX5d1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FAE10E1DF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 06:58:57 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso17409581fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 22:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740725935; x=1741330735; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oQkBn9pZaZLQM8Ql4ItONo7JwUM9lavMBRm7WilNhdQ=;
 b=D0amX5d1OkTGshfZN+J1VlDmd6w9jbSt/hSTrJHuAYDVOOOjZ93+WEv+wcUbpNTCXJ
 ZBiGLZmDbjhG8J7kqFTkQMCv5sRUt8wjJ/zO7Xr3eHpmTRLb0E3V1Q3jbuNvs8SKjacN
 iqWuk5xXKorSdcZ+lAWszf8D25harjrkooL2i9cu8n9EH2q6HpBGjM0nt/ltl6bGaCio
 bDBptRXokSBTUo7DiwHXJDGAUj/dCwjvlWYEvfyhcVgq/d7SjgPX3t7BUQ181LWpHGNL
 zGBRSgEo/6ymVQAg8xlbZbgwS8hN6EyKY57yAEojc3ZGpWN0Yi0BjYLSTfebUWI8R7xd
 4iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740725935; x=1741330735;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQkBn9pZaZLQM8Ql4ItONo7JwUM9lavMBRm7WilNhdQ=;
 b=G6xKS6xpAfh2s+9FKz79NLRcTXsFdqbwEPAL3XYlYX2+VAhgWMTeoKdYxGJFFFs+Sh
 +KOqSw4Bw8Kl0KQLWQZWqLnC/tPFDClvmMIoSpwlab/ibmp4apweRZTogZSRJJvba1w2
 YifQFs/wA4waAmwjpTrTI+Rk0wJXsPvc81DkRHSunMWo3XEhFeHcgm2R7+najvM7xyJL
 odFgqLEhT6mGMutyPMgWgso1XwhsMPcVv5l07sB9y9dzY2WyUcNqFxkqAPXNZMZpqoqM
 dGCxN1UdkxfTb4fjngUkGCbfXtSaRoO+34qcS/xmi/hE8wN86/eQsbStmYI0Re4NE+jT
 OAgw==
X-Gm-Message-State: AOJu0Yx3n86wwOl/QlfNWa/6ZVgQ70SUWMKJrN61doQJYP878asDPpcf
 DhCTsnyQMFofuub9vqjrbHn2rL65R+cezx9QOuGDeCFn9zWagDbONPn4R4mXC2E=
X-Gm-Gg: ASbGncvFiIKZCzkWKUKSIrlocluzR9bmeRK+Vk0zvsszBE8WwKj2qsLQhP5nHQdvf4z
 qW62VuQQ6U184ekOBkfQQgaYkc+NAshqOmzv5YDQ3xgxRSevmDKdlhBmhcKwTnnPqZmzaI/gpav
 /SMSFiMWyowQv7+jkR2MvHD4XsMMaw2Ta/LW9T5CD2gL8DpJswgSM8X2Wl1nCp78xh0h3ZALfbZ
 Kmpgv/0Qo3HioKqcjRp1VUeaf1nhA6/aAkkDneM0OFU+StIOLSNSWigovYxq2X/quvxY97ZYZRO
 ppXp62LSuFiTlLOqCfciHe2VKp3BJsWu4phSoEfoLZA1OLuy8378NgTkLI/qBuAX+UM2nN2SSja
 aft3mSQ==
X-Google-Smtp-Source: AGHT+IFDMeoDRWEnz1lfwT4TgHJX3JoksLPN52Cp1f9xNEKdtsShVpbuBeVPqD0tmnmNbGvoSmxnyg==
X-Received: by 2002:a2e:bc17:0:b0:308:f01f:183b with SMTP id
 38308e7fff4ca-30b932004e7mr5943981fa.2.1740725935453; 
 Thu, 27 Feb 2025 22:58:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b86875f3csm4094371fa.93.2025.02.27.22.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 22:58:53 -0800 (PST)
Date: Fri, 28 Feb 2025 08:58:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: fix merge request rules
Message-ID: <ondpwjsgujhk7wo3gaajoeamcf4gkp424cxmyslwsybrlkzo5f@xh3yx2r2mp6k>
References: <20250227042058.409003-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227042058.409003-1-vignesh.raman@collabora.com>
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

On Thu, Feb 27, 2025 at 09:50:50AM +0530, Vignesh Raman wrote:
> Merge request pipelines were only created when changes
> were made to drivers/gpu/drm/ci/, causing MRs that
> didn't touch this path to break. Fix MR pipeline rules
> to trigger jobs for all changes.
> 
> Run jobs automatically for marge-bot and scheduled
> pipelines, but in all other cases run manually. Also
> remove CI_PROJECT_NAMESPACE checks specific to mesa.
> 
> Fixes: df54f04f2020 ("drm/ci: update gitlab rules")
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Run jobs automatically for marge-bot and scheduled
>     pipelines, but in all other cases run manually. Also
>     remove CI_PROJECT_NAMESPACE checks specific to mesa.
> 
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index f04aabe8327c..f4e324e156db 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -143,11 +143,11 @@ stages:
>      # Pre-merge pipeline
>      - if: &is-pre-merge $CI_PIPELINE_SOURCE == "merge_request_event"
>      # Push to a branch on a fork
> -    - if: &is-fork-push $CI_PROJECT_NAMESPACE != "mesa" && $CI_PIPELINE_SOURCE == "push"
> +    - if: &is-fork-push $CI_PIPELINE_SOURCE == "push"
>      # nightly pipeline
>      - if: &is-scheduled-pipeline $CI_PIPELINE_SOURCE == "schedule"
>      # pipeline for direct pushes that bypassed the CI
> -    - if: &is-direct-push $CI_PROJECT_NAMESPACE == "mesa" && $CI_PIPELINE_SOURCE == "push" && $GITLAB_USER_LOGIN != "marge-bot"
> +    - if: &is-direct-push $CI_PIPELINE_SOURCE == "push" && $GITLAB_USER_LOGIN != "marge-bot"
>  
>  
>  # Rules applied to every job in the pipeline
> @@ -170,26 +170,15 @@ stages:
>      - !reference [.disable-farm-mr-rules, rules]
>      # Never run immediately after merging, as we just ran everything
>      - !reference [.never-post-merge-rules, rules]
> -    # Build everything in merge pipelines, if any files affecting the pipeline
> -    # were changed
> +    # Build everything in merge pipelines
>      - if: *is-merge-attempt
> -      changes: &all_paths
> -      - drivers/gpu/drm/ci/**/*
>        when: on_success
>      # Same as above, but for pre-merge pipelines
>      - if: *is-pre-merge
> -      changes:
> -        *all_paths
> -      when: manual
> -    # Skip everything for pre-merge and merge pipelines which don't change
> -    # anything in the build
> -    - if: *is-merge-attempt
> -      when: never
> -    - if: *is-pre-merge
> -      when: never
> +    - when: manual

I believe there should be no dash on this line

>      # Build everything after someone bypassed the CI
>      - if: *is-direct-push
> -      when: on_success
> +    - when: manual

And on this line too.

>      # Build everything in scheduled pipelines
>      - if: *is-scheduled-pipeline
>        when: on_success
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
