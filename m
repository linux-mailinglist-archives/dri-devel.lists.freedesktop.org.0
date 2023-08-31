Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51378E77D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D5210E580;
	Thu, 31 Aug 2023 08:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FC210E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:01:47 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a9cedb9c8cso12195b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1693468906; x=1694073706; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4JfdZ+mSKoJZqw9WUXkE+SypSneLm2vVqhyV4pT/wH8=;
 b=BG/1KmgvbosB1nqaHoqUWPnWGeP6U7G6TdJ8txZf6tApAVIS78PQMbhvnkP1qRYtBZ
 WQmEEK1CM3xfKTJisY57O3xzHIIfnRN4nbT7lxoqtOy6ZctalidYRZl46mKrrk8EZi6x
 /IixBFdzKnyekQSneRdIOX1a0MUM8GEW8iUUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693468906; x=1694073706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4JfdZ+mSKoJZqw9WUXkE+SypSneLm2vVqhyV4pT/wH8=;
 b=N/6HBy5zOrFJBDtfeuMx4MPvreOMOwasvduHOddut1/ii69+hgHmjAV/9ZmpqHY5Oc
 EsWQn+hYR2ljy8O33zmM83tJiYMMAmwcQGSywxVHqLShjGUNnotTjWRIqC+Reznl1k4z
 4GfTaCJpW3EpMXcsbLh+GMqCvXmatY9/jIToE5ll7EpDRrZcGXKVEbXz09sMUj997EWK
 algqf0bAyJnozBgIGriWkYRj1rlHFqOUxbFe30pAdYlxAXRovrHaGuzeFVkLmDDaBRx7
 Ff4aCMM2jFsQJrB6T+HoJlxFSXoAExDf1wZ7PeIgDUcQ/BjnAfgiFO/2URUXMgYR/e6v
 +Q9w==
X-Gm-Message-State: AOJu0YwSrqtWbk93brHExxz9SjC7h6hyYw6dYOYsHQGv6oYAyaItyupv
 8XPR94StlYkMr3QV6kD4sT/Mb0wRjLonzLNtYnrJjA==
X-Google-Smtp-Source: AGHT+IFuRv0C/PixWf4cNZcQZ1FZV5y/wkAnQSWqCD86Ju0zsBIAPHTRcE1M5SpLPibvlexHqrqyGcFBW/k299Y7uE0=
X-Received: by 2002:a05:6808:2128:b0:3a7:2eb4:ce04 with SMTP id
 r40-20020a056808212800b003a72eb4ce04mr5221232oiw.5.1693468906336; Thu, 31 Aug
 2023 01:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
In-Reply-To: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 31 Aug 2023 10:01:34 +0200
Message-ID: <CAKMK7uGK_N1ReMDY_Os0dyRpE9XixuDkT=+WfL8c_=shSoQnzA@mail.gmail.com>
Subject: Re: [git pull] drm CI integration
To: Dave Airlie <airlied@gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 03:00, Dave Airlie <airlied@gmail.com> wrote:
>
> Hey Linus,
>
> This is a PR to add drm-ci support files to the upstream tree.
> This is a bunch of ci integration for the freedesktop gitlab instance
> where we currently do upstream userspace testing on diverse sets of GPU
> hardware. From my perspective I think it's an experiment worth going with
> and seeing how the benefits/noise playout keeping these files useful.
>
> Ideally I'd like to get this so we can do pre-merge testing on PRs eventually.
>
> Below is some info from danvet on why we've ended up making the
> decision and how we can roll it back if we decide it was a bad plan.
>
> Why in upstream?
>
> - like documentation, testcases, tools CI integration is one of these things
>   where you can waste endless amounts of time if you accidentally have a version
>   that doesn't match your source code
>
> - but also like the above, there's a balance, this is the initial cut of what we
>   think makes sense to keep in sync vs out-of-tree, probably needs adjustment
>
> - gitlab supports out-of-repo gitlab integration and that's what's been used for
>   the kernel in drm, but it results in per-driver fragmentation and lots of
>   duplicated effort. the simple act of smashing an arbitrary winner into a topic
>   branch already started surfacing patches on dri-devel and sparking good
>   cross driver team discussions
>
> Why gitlab?
>
> - it's not any more shit than any of the other CI
>
> - drm userspace uses it extensively for everything in userspace, we have a lot
>   of people and experience with this, including integration of hw testing labs
>
> - media userspace like gstreamer is also on gitlab.fd.o, and there's discussion
>   to extend this to the media subsystem in some fashion
>
> Can this be shared?
>
> - there's definitely a pile of code that could move to scripts/ if other
>   subsystem adopt ci integration in upstream kernel git. other bits are more
>   drm/gpu specific like the igt-gpu-tests/tools integration
>
> - docker images can be run locally or in other CI runners
>
> Will we regret this?
>
> - it's all in one directory, intentionally, for easy deletion
>
> - probably 1-2 years in upstream to see whether this is worth it or a Big
>   Mistake. that's roughly what it took to _really_ roll out solid CI in the
>   bigger userspace projects we have on gitlab.fd.o like mesa3d

Maybe a bit more on what scenarios I see over the next 1-2 year for this.

0. Utter Failure:

Currently we have the bad combo of shit drivers/shit igt tests/shit
ci, and the eye-gauging PR here is really just surfacing this mess and
bringing it into the spotlight. if things don't improve at all, and
we're still at the same point in 2 year as we are now, this was a
failure and drm/ci needs to be unceremonuously deleted.

I might head out and pick up goat farming in the alps in this case :-/

1. Better build testing:

- we manage to solidly integrate this into our PR and committer flows,
currently that's not really the case because of a bit a chicken/egg
situation. this is a ton of work, but 1-2 years should be enough for
results

- better build time testing hopefully encourages people to build more
kunit and other build time tests, especially for the more complex
libraries we have that are really hard to exhaustively test with real
hw, like the dp mst library

- in that case we'd keep drm/ci, but probably throw out the hw driver
testing integration and push that down into the per-driver separate
git repos. gitlab can cope with this and even in the driver repos with
the out-of-tree hw testing ci integration still include the build-time
testing targets from upstream and run them, so we'd still get much
better collaboration across drivers on the build testing

- this is kinda the "no more shit ci" achievement

2. Better igts for virtual drivers:

- better build testing, plus:

- media I think is really great here with having fully virtual
driverrs to validate any new interfaces and testcases against. we're
trying to build the same up with vgem/vkms since a few years, but it's
slow going. vgem/vkms integration isn't in this PR, but it's already
in the works, and I'm hoping that we can at least fix the igt test
quality mess a bit by getting to the point where igt tests for new kms
uapi must pass on vkms.

- in this case we might keep some of the hw driver testing integration
simply as a canary in the coal mine, but until we have some solid
drivers beyond vkms we'd have to limit that severely to not cause too
much eye gauging in that directory

- this would get us to the "no more shit igt tests" achievement

3. "We can dream":

- we also manage to fix up the shit driver sitatution for at least
some drivers, and can have a fairly broad selection of hw driver
testing in ci. Given how much intel gfx ci is struggling with this,
and for years, this might only be realistic for fairly small drivers
and in really well controlled settings

- realistically there's no way to get here in 2 years

- this would be the "at least some non-shit drivers" achievement

4. "It's time to retire, we achieved it all":

- igt test passing becomes a merge requirement for any new driver, and
the existing ones still in use are mostly fixed

- I'm planning to retire this decade, or the next :-)

Cheers, Daniel

>
> Dave + Daniel.
>
> topic/drm-ci-2023-08-31-1:
> drm ci for 6.6-rc1
>
> Add CI integration support files for drm subsystem to
> gitlab.freedesktop.org instance.
> The following changes since commit 3698a75f5a98d0a6599e2878ab25d30a82dd836a:
>
>   Merge tag 'drm-intel-next-fixes-2023-08-24' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-25
> 12:55:55 +1000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm tags/topic/drm-ci-2023-08-31-1
>
> for you to fetch changes up to ad6bfe1b66a5c146ec236847eca7af4c8806d666:
>
>   drm: ci: docs: fix build warning - add missing escape (2023-08-29
> 19:56:11 +0200)
>
> ----------------------------------------------------------------
> drm ci for 6.6-rc1
>
> Add CI integration support files for drm subsystem to
> gitlab.freedesktop.org instance.
>
> ----------------------------------------------------------------
> Helen Koike (1):
>       drm: ci: docs: fix build warning - add missing escape
>
> Tomeu Vizoso (1):
>       drm: Add initial ci/ subdirectory
>
>  Documentation/gpu/automated_testing.rst            |  144 +
>  Documentation/gpu/index.rst                        |    1 +
>  MAINTAINERS                                        |    8 +
>  drivers/gpu/drm/ci/arm.config                      |   69 +
>  drivers/gpu/drm/ci/arm64.config                    |  199 ++
>  drivers/gpu/drm/ci/build-igt.sh                    |   35 +
>  drivers/gpu/drm/ci/build.sh                        |  157 ++
>  drivers/gpu/drm/ci/build.yml                       |  110 +
>  drivers/gpu/drm/ci/check-patch.py                  |   57 +
>  drivers/gpu/drm/ci/container.yml                   |   65 +
>  drivers/gpu/drm/ci/gitlab-ci.yml                   |  251 ++
>  drivers/gpu/drm/ci/igt_runner.sh                   |   77 +
>  drivers/gpu/drm/ci/image-tags.yml                  |   15 +
>  drivers/gpu/drm/ci/lava-submit.sh                  |   57 +
>  drivers/gpu/drm/ci/static-checks.yml               |   12 +
>  drivers/gpu/drm/ci/test.yml                        |  335 +++
>  drivers/gpu/drm/ci/testlist.txt                    | 2912 ++++++++++++++++++++
>  drivers/gpu/drm/ci/x86_64.config                   |  111 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   19 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |   21 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   17 +
>  drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |   32 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |    4 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |   58 +
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |    1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |    6 +
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   18 +
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   38 +
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |    2 +
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   19 +
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |   41 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |    5 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   25 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |   26 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   37 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt      |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |   11 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   48 +
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |    1 +
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |    2 +
>  .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   29 +
>  .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |    0
>  .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   10 +
>  .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |   14 +
>  drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   12 +
>  drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt    |    4 +
>  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   15 +
>  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt   |    4 +
>  drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    2 +
>  drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |    4 +
>  drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |    2 +
>  drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |   25 +
>  drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |    7 +
>  drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |   23 +
>  drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   68 +
>  drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |   11 +
>  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |    2 +
>  .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   48 +
>  .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |    9 +
>  .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |   52 +
>  .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   37 +
>  .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   23 +
>  .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |    5 +
>  .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |   38 +
>  .../gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt   |    0
>  .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |    6 +
>  68 files changed, 5508 insertions(+)
>  create mode 100644 Documentation/gpu/automated_testing.rst
>  create mode 100644 drivers/gpu/drm/ci/arm.config
>  create mode 100644 drivers/gpu/drm/ci/arm64.config
>  create mode 100644 drivers/gpu/drm/ci/build-igt.sh
>  create mode 100644 drivers/gpu/drm/ci/build.sh
>  create mode 100644 drivers/gpu/drm/ci/build.yml
>  create mode 100755 drivers/gpu/drm/ci/check-patch.py
>  create mode 100644 drivers/gpu/drm/ci/container.yml
>  create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>  create mode 100755 drivers/gpu/drm/ci/igt_runner.sh
>  create mode 100644 drivers/gpu/drm/ci/image-tags.yml
>  create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
>  create mode 100644 drivers/gpu/drm/ci/static-checks.yml
>  create mode 100644 drivers/gpu/drm/ci/test.yml
>  create mode 100644 drivers/gpu/drm/ci/testlist.txt
>  create mode 100644 drivers/gpu/drm/ci/x86_64.config
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
