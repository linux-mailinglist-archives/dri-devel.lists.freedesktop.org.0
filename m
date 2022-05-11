Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE2523413
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 15:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A76510FB25;
	Wed, 11 May 2022 13:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDF110FB1B;
 Wed, 11 May 2022 13:20:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j25so1954537wrc.9;
 Wed, 11 May 2022 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxBAEgkqPwjl7j2IRT0qwSbmvKmtMj9Uu/0rfJ9C3HY=;
 b=BFtrKj/WbzGddmQvEk3VMnzWRw/Gm8bqNWgAL4/V5F5ORGU/W+I2X+NRXETzGq4amf
 6zH2AEWErpG7i8W7RiUS4//aVUpKqlh0Sr/aMR+7ASspn0/PCyZ03Qdvt0F+2t48G/kq
 5CCvXmXubgkQQZvMu0/F4ff5eesEhAHHwFAWhJYWcFHKLwjlOa26aQT/lAOB2i18VVYN
 5QtKqLq4MZW7MZONTfYwK+HQBCO0oh6XpFj90Ac2Hlf8u2LliKuINKVPSPPTpyYgnm5R
 qyl64VtVW2CszZWmkOjshlLFYkcQVOBoXLciBSPETQvRTgDhgJDodoxEzbMVqqSzhQq7
 F7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxBAEgkqPwjl7j2IRT0qwSbmvKmtMj9Uu/0rfJ9C3HY=;
 b=DbX4+C4Faalr9O/iUWsH3YjlkvtwoPbsfQQJJ+D9CF0MdSa0c+ZbhTMntqIwIeYgLt
 j997bYrMVHBNIbFvHJS/8jB/E0ZY5rpt/6dFTIJXV6LSbRoMsjOD557vA58V43HWfp26
 yjNla6HN27YH2Fdi/q/29mChksaR455kIgbvyK9lmR3/2QtT2UPVmn2hihq4dtW934MU
 NyIF7uDEOpLJ/DHnAqW719P4POKiK3mnSez9ipyfWWrkfcDaKEYebvS3VQmA+z87yUWC
 6S/UC7rLeq4cJEirq4E9WNVlq1SKddz808/JeHp3+76pg7ZJ/Lwif1fuFswKKzS3YTdP
 8VEA==
X-Gm-Message-State: AOAM530LiX2IQfpGhWEPbbfjDqyBzk8mCr0H3UUE5p2QqlTo7D8Jc3X1
 Mq/Lq2+zY3Q5LGay833yCHZaWpp9J0hfwyiN73A=
X-Google-Smtp-Source: ABdhPJwMEuHOME5RAqLJg1dKTW2d5wEp9Fa+vDbBzf5cIsjIT1fvYzWr1ATGYW77vkjZEgwUvYYcJm1ccXNbRGIpIUw=
X-Received: by 2002:a05:6000:1a87:b0:20c:687f:6d10 with SMTP id
 f7-20020a0560001a8700b0020c687f6d10mr22188924wry.574.1652275246816; Wed, 11
 May 2022 06:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <20220511061533.56881-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220511061533.56881-1-tomeu.vizoso@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 06:20:36 -0700
Message-ID: <CAF6AEGts6cKOrmRruo8uSXSW=Kq58VZxdPuS13Q7jVajbvga-g@mail.gmail.com>
Subject: Re: [RFC v3] drm/msm: Add initial ci/ subdirectory
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-doc@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 11:15 PM Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
>
> And use it to store expectations about what the drm/msm driver is
> supposed to pass in the IGT test suite.
>
> Also include a configuration file that points to the out-of-tree CI
> scripts.
>
> By storing the test expectations along the code we can make sure both
> stay in sync with each other, and so we can know when a code change
> breaks those expectations.
>
> This will allow all contributors to drm/msm to reuse the infrastructure
> already in gitlab.freedesktop.org to test the driver on several
> generations of the hardware.
>
> v2:
>   - Fix names of result expectation files to match SoC
>   - Don't execute tests that are going to skip on all boards
>
> v3:
>   - Remove tracking of dmesg output during test execution
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
>  drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
>  drivers/gpu/drm/msm/ci/msm.testlist           | 144 ++++++++++++++++++
>  .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 141 +++++++++++++++++
>  .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 141 +++++++++++++++++
>  drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 142 +++++++++++++++++
>  drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 142 +++++++++++++++++
>  7 files changed, 791 insertions(+)
>  create mode 100644 Documentation/gpu/msm_automated_testing.rst
>  create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
>  create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
>  create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
>  create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
>  create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
>  create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
>

[snip]

> diff --git a/drivers/gpu/drm/msm/ci/gitlab-ci.yml b/drivers/gpu/drm/msm/ci/gitlab-ci.yml
> new file mode 100644
> index 000000000000..9b7caa7fcab2
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/ci/gitlab-ci.yml
> @@ -0,0 +1,11 @@
> +variables:
> +  # Change this to use your fork of drm-ci
> +  DRM_CI_PROJECT_PATH: &drm-ci-project-path gfx-ci/drm-ci
> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha msm

btw, shouldn't we list an exact commit sha (or tag) for drm-ci, or am
I overlooking something?  We want to be able to uprev the drm-ci
version (and therefore igt version) in sync with any necessary updates
to the expectations

BR,
-R

> +
> +include:
> +  - project: *drm-ci-project-path
> +    ref: *drm-ci-commit-sha
> +    file:
> +      - '.msm-gitlab-ci.yml'
> +      - '.gitlab-ci.yml'
