Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E064A47565
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 06:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F32010EA47;
	Thu, 27 Feb 2025 05:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="doscgK3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E1A10EA47
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 05:51:35 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54843052bcdso459213e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 21:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740635494; x=1741240294; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B1U19xvVdCKVbh6i51+4ZDFXiDIrMz27FSxrW/i0pKg=;
 b=doscgK3I7ptJW/ZRxmlo5Jdhr4jMlQzjrqsN0QkgEIzRcvKdMv3lLKRtZwjag3p6YJ
 JO/ZjGqmW+wt3ULdXAMs0LgqhJLjaxoLZU6psGWgrR6oR+HMJq624KksVWgMb/eYcMJq
 aG/nTp7nivmu+P4Xk//pcjmV3bMFjibqDXmt4CheK5fW1GVI/0UboNZrNUqU91oTzj2A
 TrjIPqAu3aJAkp3eYZun+MOWDy2jEbYTOlYcz15SHngbg03RQQmcbrC9j7SU50RjJ3JJ
 MGNZwSuTjartX2Xfo0BzTn96tPqWCXJosuXOxM4iN6d4R8ZpSW4iNLjaoYil04dyHZXc
 Wy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740635494; x=1741240294;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1U19xvVdCKVbh6i51+4ZDFXiDIrMz27FSxrW/i0pKg=;
 b=Sf/bfuel8m4hIeydLgJD1YJP1kPVet81Lj25gzw8or6SQYGMRKGGYiqekr04wejV+6
 5sL1sk0gZgdUSWjc/bqeS90zijT4tUf5ZmDLzfn/eLUjavgFxao8wWlvpA9jW0Z44GRK
 Gvx4mlr3MB9Fwxds1gcyIY5lBllneHT+uEE2dMfH8S0VNoGJHOo1Q7KDPRGymX63uadO
 tZxzv9VuC0a8Y/tolg8z37+aMfl/RHCSVIdGJeuthmkugPtD/FoEkl4ghK/aoVkb25/0
 BH0QnJ9iIxfDRFXT4gliT80AeNBvsYEDKaIOdyepG5u8gPkFhiNlrsJ3vRXeN+YPQo8L
 gebw==
X-Gm-Message-State: AOJu0Yy9JFJy0E93yUWWj/xXtco1X20gJ1Z7tBuEr9EwDIUebBxYGE2e
 q5BRJthAj49d0goh4Yps1xoDXiLc+Wo2qCyxlcyqmEa14w3HfepI3C7O2yLRa1A=
X-Gm-Gg: ASbGncut2DAVCCg7xEpbxFJOfDdRWOJHbV+f3Nwnt5p+M3/Nee/me4SUqKkdS9wADni
 y11pinFimH+H/3LNj7waqHiy94UdOuIf/Lg2mYo5RzhgKE5eFy9VvnAUkJESuhzK6zqdOKm0l3h
 JcpZR5/XHqIkPRSGHGvgv2gzjPxjEZR3pvC3x6hStPUzge6dbKMjMm8OmgciA0fXiI3RVkGcUhL
 OMqrZHblzUiCi3X8la4/O+lmd5zvWvCC38O0UAae+EvA9lSxNkIUbHnkHxP7uxW+xJsVK0VmlBK
 0u7qQ+eOmsTAUHVDODaJKh3nhiIbWoAlem0h/+swPlV0W0iyXuP3HPjLECbtR8J/0id+9oZppRq
 5kgg6zg==
X-Google-Smtp-Source: AGHT+IGVzSFVtQHVGFHQLcFNQCwlkvUFIDCBs957Ra7OLOtuklfdObqmMHtARrsJHtaIOaTCbUtWbw==
X-Received: by 2002:a05:6512:ba8:b0:545:746:f36a with SMTP id
 2adb3069b0e04-548510ed195mr7100964e87.34.1740635493780; 
 Wed, 26 Feb 2025 21:51:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443b1213sm75514e87.155.2025.02.26.21.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 21:51:32 -0800 (PST)
Date: Thu, 27 Feb 2025 07:51:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: remove CI_PRE_CLONE_SCRIPT
Message-ID: <ukzyfymij2yilyy7ofyi3hj4urlrxxbx5rre3f7qg4zgkc65u5@vbutj63ucctc>
References: <20250227043640.411696-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227043640.411696-1-vignesh.raman@collabora.com>
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

On Thu, Feb 27, 2025 at 10:06:24AM +0530, Vignesh Raman wrote:
> If we are not caching the git archive, do not
> set CI_PRE_CLONE_SCRIPT. Setting it makes CI
> try to download the cache first, and if it is
> missing, it tries to clone the repo within a
> time limit, which can cause build failures.

Please wrap the commit message according to the guidelines. 47 chars in
a line is way too short.

BTW: this didn't help with the python-artifacts issue. It still times
out.

> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index f4e324e156db..0bc4ac344757 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -13,12 +13,6 @@ variables:
>    FDO_UPSTREAM_REPO: helen.fornazier/linux   # The repo where the git-archive daily runs
>    MESA_TEMPLATES_COMMIT: &ci-templates-commit d5aa3941aa03c2f716595116354fb81eb8012acb
>    DRM_CI_PROJECT_URL: https://gitlab.freedesktop.org/${DRM_CI_PROJECT_PATH}
> -  CI_PRE_CLONE_SCRIPT: |-
> -          set -o xtrace
> -          curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s ${DRM_CI_PROJECT_URL}/-/raw/${DRM_CI_COMMIT_SHA}/.gitlab-ci/download-git-cache.sh -o download-git-cache.sh
> -          bash download-git-cache.sh
> -          rm download-git-cache.sh
> -          set +o xtrace
>    S3_JWT_FILE: /s3_jwt
>    S3_JWT_FILE_SCRIPT: |-
>        echo -n '${S3_JWT}' > '${S3_JWT_FILE}' &&
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
