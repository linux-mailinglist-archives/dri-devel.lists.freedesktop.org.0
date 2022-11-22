Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52619633FA1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABD810E402;
	Tue, 22 Nov 2022 14:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C2210E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:59:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 189-20020a1c02c6000000b003d02dd48c45so244886wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 06:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LhmDVFPi+nRjH1SiUZ4CgNLHOOBTy/Y9YuPSElfH8aY=;
 b=UyxCYENrxcNJB0XEEcZY7l+2jxVUuOcFAD+5ORxNbtdsRtFofYdI4lvwj2uCU0OhH4
 RLkpRy3agAayRmHLYv4pFq36wxsV+U1l9VjlA0Iusfr0pRi7NLxBya3Nc7jl1BPHxVYI
 vxetXquMBAOI6pSHadNEEuisGsd9r0FHUVT1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhmDVFPi+nRjH1SiUZ4CgNLHOOBTy/Y9YuPSElfH8aY=;
 b=YVomztqcKrjLY0Qm2Avb08owlEjjhuz847CqV4rghtMQB5/yTuqBuP6BWRDExm5BXO
 RmSldo+QNQvFLXY+jJb0GoECKE05sKxHXZiChHX1yQUIQvtEUG7oCB7Nh+Y6S7y3Tpu/
 keBIp2QBLqMbBhBVuPP2qlYys7ULEfbfZxwwFfuQDyxL+UfBzjs0we3YgpcPAWS5PnZ4
 LigPcK9apTJ1DpYaBRVivApHSbLT0DMo+PgUErwY+spzYJKzD0rx5kNEhAsuEn2mix/h
 26EmbniWagTJo4FeDwhccnZa3iJcexXgkWU2LsbRYmiYmlIqkh59KoGUjV4DcBYZ7Cwj
 RuuQ==
X-Gm-Message-State: ANoB5plzTQ/VY9FGuaYS0zg/V4IvAk3dgR7Bk+sSQzQSxRvAUwX58EZi
 PGxyiWrMJ10Y6gHldIbNNo3ebA==
X-Google-Smtp-Source: AA0mqf4RzFqtTLS34nij10Kc2ZFArD6T7Pxx8/0WrX6CSOKGs/Yg0XMN8lfPUIxAT6rIPpi1cbiVyA==
X-Received: by 2002:a05:600c:468e:b0:3cf:7b67:f692 with SMTP id
 p14-20020a05600c468e00b003cf7b67f692mr9843465wmo.139.1669129152504; 
 Tue, 22 Nov 2022 06:59:12 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6101000000b002365cd93d05sm13962692wrt.102.2022.11.22.06.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:59:12 -0800 (PST)
Date: Tue, 22 Nov 2022 15:59:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [MAINTAINER TOOLS] docs: updated rules for topic/core-for-CI
 commit management
Message-ID: <Y3zjvobswUkJFPV1@phenom.ffwll.local>
References: <20221122131714.3443238-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122131714.3443238-1-jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 03:17:14PM +0200, Jani Nikula wrote:
> Introduce stricter rules for topic/core-for-CI management. Way too many
> commits have been added over the years, with insufficient rationale
> recorded in the commit message, and insufficient follow-up with removing
> the commits from the topic branch.
> 
> New rules:
> 
> 1. Require maintainer ack for rebase. Have better gating on when rebases
>    happen and on which baselines.
> 
> 2. Require maintainer/committer ack for adding/removing commits. No
>    single individual should decide.
> 
> 3. Require gitlab issues for new commits added. Improve tracking for
>    removing the commits.
> 
> Also use the stronger "must" for commit message requiring the
> justification for the commit being in topic/core-for-CI.
> 
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: dim-tools@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drm-tip.rst | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drm-tip.rst b/drm-tip.rst
> index deae95cdd2fe..24036e2ef576 100644
> --- a/drm-tip.rst
> +++ b/drm-tip.rst
> @@ -203,11 +203,13 @@ justified exception. The primary goal is to fix issues originating from Linus'
>  tree. Issues that would need drm-next or other DRM subsystem tree as baseline
>  should be fixed in the offending DRM subsystem tree.
>  
> -Only rebase the branch if you really know what you're doing. When in doubt, ask
> -the maintainers. You'll need to be able to handle any conflicts in non-drm code
> -while rebasing.
> +Only rebase the branch if you really know what you're doing. You'll need to be
> +able to handle any conflicts in non-drm code while rebasing.
>  
> -Simply drop fixes that are already available in the new baseline.
> +Always ask for maintainer ack before rebasing. IRC ack is sufficient.
> +
> +Simply drop fixes that are already available in the new baseline. Close the
> +associated gitlab issue when removing commits.
>  
>  Force pushing a rebased topic/core-for-CI requires passing the ``--force``
>  parameter to git::
> @@ -225,11 +227,22 @@ judgement call.
>  Only add or remove commits if you really know what you're doing. When in doubt,
>  ask the maintainers.
>  
> -Apply new commits on top with regular push. The commit message needs to explain
> -why the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
> +Always ask for maintainer/committer ack before adding/removing commits. IRC ack
> +is sufficient. Record the ``Acked-by:`` in commits being added.
> +
> +Apply new commits on top with regular push. The commit message must explain why
> +the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
>  another subsystem, please reference the commit with ``git cherry-pick -x``
>  option. If it's a patch from another subsystem, please reference the patch on
>  the mailing list with ``Link:`` tag.
>  
> +New commits always need an associated gitlab issue for tracking purposes. The
> +goal is to have as few commits in topic/core-for-CI as possible, and we need to
> +be able to track the progress in making that happen. Reference the issue with
> +``References:`` tag. Add the ``core-for-CI`` label to the issue. (Note: Do not
> +use ``Closes:`` because the logic here is backwards; the issue is having the
> +commit in the branch in the first place.)
> +
>  Instead of applying reverts, just remove the commit. This implies ``git rebase
> --i`` on the current baseline; see directions above.
> +-i`` on the current baseline; see directions above. Close the associated gitlab
> +issue when removing commits.
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
