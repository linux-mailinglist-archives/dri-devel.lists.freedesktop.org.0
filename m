Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5677CCC4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 14:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BD010E178;
	Tue, 15 Aug 2023 12:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6C410E178
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:36:06 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1bb3df62b34so606927fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1692102966; x=1692707766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WVL87guyrjCBpvHgO84cKF3Q11DoY2+NXqHRgmv+xAI=;
 b=e+i3kUHJIwUJ0tRITL7y0wZfUDQu6vWVKymHJKJioIVNHrwqLuQzlk+CIvwJPwC+yV
 AywyVW9auTyI1wj//7akf32JDe3C2bnDOqB9qSgx30EImyJSeKP3L+vg8RM0n0W7lgcp
 mba4mOzv5Oq47gHPSgpdocy+fv+hOD2zieOGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692102966; x=1692707766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WVL87guyrjCBpvHgO84cKF3Q11DoY2+NXqHRgmv+xAI=;
 b=lX4WxvWeTcKH06ofozAiI+IUp+WYi0eOC6LeitGGZUqhwnkrp9CUN4hKf8gjvrjbO3
 WwrA2wsJVIHJ0EZDJM9pj8cIsTdwRd5q7IHcnzcrfxnNUBNvd9ucZbW9dRluzbH3t2lH
 5kjD1mGg5J38K1yEI+e4IO8zrAc/Pa305Xdj2NAemnj6rToUqTcMvLDEi48r66mgBf5n
 wyS8UyM+BYylJoQMW8o2McHymQJPEDIEnx8XpGxiEZ23nV5yZBRPqM/oRj+jKoa3w9NX
 NEWjxxZION4Lii88CMsnGtJ1o9X/lGmTSOV+8vc4ys0Ih1LeTQ2LKMFbYjGhmZYLSlx8
 FcbQ==
X-Gm-Message-State: AOJu0YyIC69Td5hmr0Mhs3XaL5WCXB+bzQpZclzJ9pd2mkhBtY+uCY85
 ISRt4DZxrHOwK+G287n3lEAdKK//j3D6vtptHTnQFw==
X-Google-Smtp-Source: AGHT+IERPMoNjjtyPhxTIBw8Q9A7abJznvQzaOgobDG1OzykjpPIu/34Q4Dlv/xVMwyGSnzoYT/6waLNy2K3hLYgeP4=
X-Received: by 2002:a05:6871:298:b0:1c3:c45b:92a7 with SMTP id
 i24-20020a056871029800b001c3c45b92a7mr10537623oae.0.1692102965854; Tue, 15
 Aug 2023 05:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <389b-64db6700-1-3dc04b80@31442286>
 <b278375f-4644-2db6-9a14-9088470d528c@suse.de>
In-Reply-To: <b278375f-4644-2db6-9a14-9088470d528c@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 15 Aug 2023 14:35:54 +0200
Message-ID: <CAKMK7uF1hv3S--=jsmFWG_tkOKavgMBOkWQt6VOSV0d1U7C0VA@mail.gmail.com>
Subject: Re: [PULL for v6.6] drm-misc-next
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>
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
Cc: daniels@collabora.com, robdclark@google.com, gustavo.padovan@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, robclark@freedesktop.org,
 david.heidelberg@collabora.com,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>, anholt@google.com,
 dri-devel@lists.freedesktop.org, emma@anholt.net, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Aug 2023 at 14:31, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi,
>
> thanks for your patchset.
>
> Am 15.08.23 um 13:53 schrieb Helen Mae Koike Fornazier:
> > On Tuesday, August 15, 2023 06:12 -03, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> >> On Mon, 14 Aug 2023, Helen Koike <helen.koike@collabora.com> wrote:
> >>> The following changes since commit f5d8f9c0d8b4bc8ad7e7b23a9f4d116e99202dd3:
> >>>
> >>>    drm/panel: JDI LT070ME05000 simplify with dev_err_probe() (2023-08-14 14:44:30 +0200)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    git@gitlab.freedesktop.org:helen.fornazier/linux.git tags/drm-ci-v13-drm-misc
> >>>
> >>> for you to fetch changes up to 60242246bc906a37a7eae2094633a38bda7d45e6:
> >>>
> >>>    drm: Add initial ci/ subdirectory (2023-08-14 20:47:37 -0300)
> >>>
> >>> ----------------------------------------------------------------
> >>> drm-ci for drm-misc-next
> >>
> >> FYI, usually the subject indicates the source or what to pull, not the
> >> destination. Was confused here for a bit. ;)
> >
> > Thanks for the info! Should I re-send this one?
>
> Yes, please.
>
> As a developer, you are not supposed to send pull requests or any other
> emails with [PULL] in their subject line. We don't merge pull requests
> into drm-misc.
>
> To get your patches merged, please make a patchset on top of the a
> recent checkout of drm-misc-next. Then send the patchset via
>
>    git send-email
>
> to dri-devel@lists.freedesktop.org and all the developers and
> maintainers that are affected by the changes. This will start the review
> process. After your patchset has entered the drm-misc-next branch, we
> (the maintainers of the drm-misc tree) will create the appropriate pull
> requests when the time has come.

I think we have a coordination problem, at least the rough plan I
discussed with Dave was that we'd do an entirely separate pull request
to Linus for the gitlab stuff, so that there's no surprises or "you
snuck this in without making it obvious" talk after the fact.

I'll check with Dave whether he wants to do the branch directly in
drm.git or whether we'll take the pull from Helen.

Cheers, Sima

>
> Best regards
> Thomas
>
> >
> > Regards,
> > Helen
> >
> >>
> >> BR,
> >> Jani.
> >>
> >>>
> >>> Here is the patch that adds a ci/ subdirectory to drm and allows
> >>> developers to easily execute tests.
> >>>
> >>> Developers can easily execute several tests on different devices
> >>> by just pushing their branch to their fork in a repository hosted
> >>> on gitlab.freedesktop.org which has an infrastructure to run jobs
> >>> in several runners and farms with different devices.
> >>>
> >>> The patch was acked and tested by others.
> >>>
> >>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>>
> >>> ----------------------------------------------------------------
> >>> Tomeu Vizoso (1):
> >>>        drm: Add initial ci/ subdirectory
> >>>
> >>>   Documentation/gpu/automated_testing.rst            |  144 +
> >>>   Documentation/gpu/index.rst                        |    1 +
> >>>   MAINTAINERS                                        |    8 +
> >>>   drivers/gpu/drm/ci/arm.config                      |   69 +
> >>>   drivers/gpu/drm/ci/arm64.config                    |  199 ++
> >>>   drivers/gpu/drm/ci/build-igt.sh                    |   35 +
> >>>   drivers/gpu/drm/ci/build.sh                        |  157 ++
> >>>   drivers/gpu/drm/ci/build.yml                       |  110 +
> >>>   drivers/gpu/drm/ci/check-patch.py                  |   57 +
> >>>   drivers/gpu/drm/ci/container.yml                   |   65 +
> >>>   drivers/gpu/drm/ci/gitlab-ci.yml                   |  251 ++
> >>>   drivers/gpu/drm/ci/igt_runner.sh                   |   77 +
> >>>   drivers/gpu/drm/ci/image-tags.yml                  |   15 +
> >>>   drivers/gpu/drm/ci/lava-submit.sh                  |   57 +
> >>>   drivers/gpu/drm/ci/static-checks.yml               |   12 +
> >>>   drivers/gpu/drm/ci/test.yml                        |  335 +++
> >>>   drivers/gpu/drm/ci/testlist.txt                    | 2912 ++++++++++++++++++++
> >>>   drivers/gpu/drm/ci/x86_64.config                   |  111 +
> >>>   drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   19 +
> >>>   drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |   21 +
> >>>   drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |    2 +
> >>>   drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   17 +
> >>>   drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |   32 +
> >>>   drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |    4 +
> >>>   drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |   58 +
> >>>   drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |    1 +
> >>>   drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |    6 +
> >>>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   18 +
> >>>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   38 +
> >>>   drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |    2 +
> >>>   drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   19 +
> >>>   drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |   41 +
> >>>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |    5 +
> >>>   drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   25 +
> >>>   drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |   26 +
> >>>   drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |    5 +
> >>>   drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   37 +
> >>>   drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt      |    5 +
> >>>   drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |   11 +
> >>>   drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   48 +
> >>>   drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |    1 +
> >>>   drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |    2 +
> >>>   .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   29 +
> >>>   .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |    0
> >>>   .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   10 +
> >>>   .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |   14 +
> >>>   drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   12 +
> >>>   drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt    |    4 +
> >>>   drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   15 +
> >>>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt   |    4 +
> >>>   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    2 +
> >>>   drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |    4 +
> >>>   drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |    2 +
> >>>   drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt     |   25 +
> >>>   drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt    |    7 +
> >>>   drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt     |   23 +
> >>>   drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   68 +
> >>>   drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |   11 +
> >>>   drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |    2 +
> >>>   .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   48 +
> >>>   .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |    9 +
> >>>   .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |   52 +
> >>>   .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   36 +
> >>>   .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   24 +
> >>>   .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |    5 +
> >>>   .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |   38 +
> >>>   .../gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt   |    0
> >>>   .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |    6 +
> >>>   68 files changed, 5508 insertions(+)
> >>>   create mode 100644 Documentation/gpu/automated_testing.rst
> >>>   create mode 100644 drivers/gpu/drm/ci/arm.config
> >>>   create mode 100644 drivers/gpu/drm/ci/arm64.config
> >>>   create mode 100644 drivers/gpu/drm/ci/build-igt.sh
> >>>   create mode 100644 drivers/gpu/drm/ci/build.sh
> >>>   create mode 100644 drivers/gpu/drm/ci/build.yml
> >>>   create mode 100755 drivers/gpu/drm/ci/check-patch.py
> >>>   create mode 100644 drivers/gpu/drm/ci/container.yml
> >>>   create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
> >>>   create mode 100755 drivers/gpu/drm/ci/igt_runner.sh
> >>>   create mode 100644 drivers/gpu/drm/ci/image-tags.yml
> >>>   create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
> >>>   create mode 100644 drivers/gpu/drm/ci/static-checks.yml
> >>>   create mode 100644 drivers/gpu/drm/ci/test.yml
> >>>   create mode 100644 drivers/gpu/drm/ci/testlist.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/x86_64.config
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
> >>>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> >>
> >> --
> >> Jani Nikula, Intel Open Source Graphics Center
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
