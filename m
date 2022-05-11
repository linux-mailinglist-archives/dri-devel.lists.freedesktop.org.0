Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378215235D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 16:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCFB10FB57;
	Wed, 11 May 2022 14:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9E210FB56;
 Wed, 11 May 2022 14:42:14 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s15so2018117wrb.7;
 Wed, 11 May 2022 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NsJm3k6hRMQu+zmyrIEIhuPLb1RRTJI9xJNcFhSVp8A=;
 b=cJMTSE2F+Y4SfBXU+FjyPPyRuiQAt8ExDUlyfI9APFRg2+wAsqKTS7Chjv76TO/10v
 aLuQFeyFe96rolu/Sr/hfqSWlLX9qCUGuoCcGb3+cLuIMaW550E5DTZUzyQs9qoSdBjz
 /f+WO3kHULvcObvNQqKM03gthqEfPpJTnjbT/YkHAao6SkAgJyqmWDyQ8LTDnGXsVNzl
 weGSXBhth3eAJLGAPRFwmuJFQdjfUYnUDzjRYXT9c30p6uCEbTeHG7f4aYl/3Xf9iNBO
 wg7cXC0+HzZcRDrq8VI9QBJMtz0VF50ljdjP2o8aWD1hXrKyQakfcK1OQp5YSgOfmEcJ
 icug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NsJm3k6hRMQu+zmyrIEIhuPLb1RRTJI9xJNcFhSVp8A=;
 b=irh+JiQ2XYTAJNWBsp4RbIXdtuVS6WZ45NQr2/c46HUiMhz0I5n3c90JKjJSN7HArK
 Wxt8O0SMB7kL4DqPesSKtWm7LNdQ84Ldv5r+nShgFmjzTVvdDGr39HHqqckXevpW8zKf
 kAIPP4LWr+5vxAU93aJ/pxFg5zDmkC6vUNdHazxDi1mPpBLiOStcLp1RND08XmT8x7Ki
 f88oU6tceGdofZbYyOJiDWw34UFyqW+nu2WfmkcHBo2lN1ZfTksoXIXKqf7S2OEuTEwS
 KkRCIh5jCIZ4Rs/qmj8JH49ipy1SwEEXcq3EWxvJ+Y80Bp1eWmSZBbXe8w6MH6hC4xuF
 OqaQ==
X-Gm-Message-State: AOAM530o3Kz/tDZvUzhiucXr5O7UXwp9H3nOVC80CUu16VISRR7hJSeR
 /0jeUe9m0Y3gA79ecG6AFJLcJ9HQUUOQIe2FRns=
X-Google-Smtp-Source: ABdhPJxPnPpBkMxIjlZKQL50nvCi2YN9s0Vgo7nU4Xaib28JRgvWLUfkhIx6tSifbuoGiLhJSY9uw3xHz29418yu0oA=
X-Received: by 2002:a05:6000:719:b0:20c:7894:22e1 with SMTP id
 bs25-20020a056000071900b0020c789422e1mr23073681wrb.93.1652280132594; Wed, 11
 May 2022 07:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <87mtfoi1rk.fsf@intel.com>
In-Reply-To: <87mtfoi1rk.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 07:41:59 -0700
Message-ID: <CAF6AEGsw4YE6nrJkU5_0bCag7kySFxHwzCFuF5jM4fcvFM2V6A@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add initial ci/ subdirectory
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arkadiusz Hiler <arek@hiler.eu>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 7:26 AM Jani Nikula <jani.nikula@linux.intel.com> w=
rote:
>
> On Tue, 10 May 2022, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> > And use it to store expectations about what the drm/msm driver is
> > supposed to pass in the IGT test suite.
> >
> > Also include a configuration file that points to the out-of-tree CI
> > scripts.
> >
> > By storing the test expectations along the code we can make sure both
> > stay in sync with each other, and so we can know when a code change
> > breaks those expectations.
> >
> > This will allow all contributors to drm/msm to reuse the infrastructure
> > already in gitlab.freedesktop.org to test the driver on several
> > generations of the hardware.
>
> Cc: Petri and Arek
>
> The tests and subtests and their names are inevitably going to change
> over time. I don't think there are any guarantees that they're
> stable. How are you going to handle such changes with the test names and
> results committed to the kernel tree?
>

drivers/gpu/drm/msm/ci/gitlab-ci.yml will (in next iteration of this
RFC) point at a specific commit SHA in the gfx-ci/drm-ci tree.  That
tree points at a specific i-g-t (and in future, deqp/etc) commit SHA.
So we can update the expectation in sync with upreving i-g-t, just
like we do with mesa CI.

BR,
-R

>
> BR,
> Jani.
>
>
> >
> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > ---
> >  Documentation/gpu/msm_automated_testing.rst |  70 ++++
> >  drivers/gpu/drm/msm/ci/gitlab-ci.yml        |  11 +
> >  drivers/gpu/drm/msm/ci/msm.testlist         | 429 ++++++++++++++++++++
> >  drivers/gpu/drm/msm/ci/msm_a360_results.txt | 421 +++++++++++++++++++
> >  drivers/gpu/drm/msm/ci/msm_a530_results.txt | 421 +++++++++++++++++++
> >  drivers/gpu/drm/msm/ci/msm_a618_results.txt | 422 +++++++++++++++++++
> >  drivers/gpu/drm/msm/ci/msm_a630_results.txt | 422 +++++++++++++++++++
> >  7 files changed, 2196 insertions(+)
> >  create mode 100644 Documentation/gpu/msm_automated_testing.rst
> >  create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
> >  create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
> >  create mode 100644 drivers/gpu/drm/msm/ci/msm_a360_results.txt
> >  create mode 100644 drivers/gpu/drm/msm/ci/msm_a530_results.txt
> >  create mode 100644 drivers/gpu/drm/msm/ci/msm_a618_results.txt
> >  create mode 100644 drivers/gpu/drm/msm/ci/msm_a630_results.txt
> >
> > diff --git a/Documentation/gpu/msm_automated_testing.rst b/Documentatio=
n/gpu/msm_automated_testing.rst
> > new file mode 100644
> > index 000000000000..fe59474569c2
> > --- /dev/null
> > +++ b/Documentation/gpu/msm_automated_testing.rst
> > @@ -0,0 +1,70 @@
> > +.. SPDX-License-Identifier: GPL-2.0+
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Automated testing of MSM DRM driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Making sure that changes to a driver don't introduce regressions can b=
e very time consuming when lots of different hardware configurations need t=
o be tested. Moreover, it isn't practical for each person interested in thi=
s testing to have to acquire and maintain what can be a considerable amount=
 of hardware.
> > +
> > +Also, it is desirable for developers to check for regressions in their=
 code by themselves, instead of relying on the maintainer finding them and =
then reporting back.
> > +
> > +There are facilities in gitlab.freedesktop.org to automatically test M=
esa that can be used as well for testing DRM drivers such as drm/msm. This =
document explains how people interested in testing the drm/msm driver can u=
se this shared infrastructure to save quite some time and effort.
> > +
> > +
> > +Relevant files
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +drivers/gpu/drm/msm/ci/gitlab-ci.yml
> > +------------------------------------
> > +
> > +Specifies the specific version of the scripts to be used. GitLab CI wi=
ll use the values defined in this file to fetch the right scripts.
> > +
> > +
> > +drivers/gpu/drm/msm/ci/msm.testlist
> > +-----------------------------------
> > +
> > +Specifies the tests that the current code is expected to be able to re=
liably run. These tests are expected to not hang the DUT (device under test=
ing) when running on the revision they belong to, and to give consistent re=
sults.
> > +
> > +
> > +drivers/gpu/drm/msm/ci/msm_*_results.txt
> > +----------------------------------------
> > +
> > +Specifies the expected results of running this specific kernel revisio=
n on a given hardware configuration.
> > +
> > +
> > +How to enable automated testing on your tree
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't=
 have one yet
> > +
> > +2. In your kernel repo's configuration (eg. https://gitlab.freedesktop=
.org/tomeu/linux/-/settings/ci_cd), change the CI/CD configuration file fro=
m .gitlab-ci.yml to drivers/gpu/drm/msm/ci/gitlab-ci.yml.
> > +
> > +3. Next time you push to this repository, you will see a CI pipeline b=
eing created (eg. https://gitlab.freedesktop.org/tomeu/linux/-/pipelines)
> > +
> > +4. The various jobs will be run and when the pipeline is finished, all=
 jobs should be green unless a regression has been found.
> > +
> > +
> > +How to update test expectations
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +If your changes to the code fix any tests, you will have to update one=
 or more of the files in drivers/gpu/drm/msm/ci/msm_*_results.txt, for each=
 of the test platforms affected by the change.
> > +
> > +If you have run a pipeline and it failed because of a mismatched test =
result, you will have been offered a patch at the end of the run that you c=
an apply after reviewing it.
> > +
> > +
> > +How to expand coverage
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +If your code changes makes it possible to run more tests (by solving r=
eliability issues, for example), more tests can be added to this list, and =
then the expected results updated with the patch file that will be printed =
at the end of each job.
> > +
> > +If there is a need for updating the version of IGT being used (maybe y=
ou have added more tests to it), follow the instructions at https://gitlab.=
freedesktop.org/gfx-ci/drm-ci/-/tree/msm#upreving-igt.
> > +
> > +
> > +How to test your changes to the scripts
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +For testing changes to the scripts in the drm-ci repo, change the DRM_=
CI_PROJECT_PATH variable in drivers/gpu/drm/msm/ci/gitlab-ci.yml to match y=
our fork of the project (eg. tomeu/drm-ci). This fork needs to be in https:=
//gitlab.freedesktop.org/.
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/msm/ci/gitlab-ci.yml b/drivers/gpu/drm/msm=
/ci/gitlab-ci.yml
> > new file mode 100644
> > index 000000000000..9b7caa7fcab2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/gitlab-ci.yml
> > @@ -0,0 +1,11 @@
> > +variables:
> > +  # Change this to use your fork of drm-ci
> > +  DRM_CI_PROJECT_PATH: &drm-ci-project-path gfx-ci/drm-ci
> > +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha msm
> > +
> > +include:
> > +  - project: *drm-ci-project-path
> > +    ref: *drm-ci-commit-sha
> > +    file:
> > +      - '.msm-gitlab-ci.yml'
> > +      - '.gitlab-ci.yml'
> > diff --git a/drivers/gpu/drm/msm/ci/msm.testlist b/drivers/gpu/drm/msm/=
ci/msm.testlist
> > new file mode 100644
> > index 000000000000..7c771471dfa2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm.testlist
> > @@ -0,0 +1,429 @@
> > +# Keep alphabetically sorted by default
> > +
> > +igt@core_auth@getclient-simple
> > +igt@core_auth@getclient-master-drop
> > +igt@core_auth@basic-auth
> > +igt@core_auth@many-magics
> > +igt@core_getclient
> > +igt@core_getstats
> > +igt@core_getversion
> > +igt@core_setmaster_vs_auth
> > +igt@drm_read@invalid-buffer
> > +igt@drm_read@fault-buffer
> > +igt@drm_read@empty-block
> > +igt@drm_read@empty-nonblock
> > +igt@drm_read@short-buffer-block
> > +igt@drm_read@short-buffer-nonblock
> > +igt@drm_read@short-buffer-wakeup
> > +igt@kms_addfb_basic@unused-handle
> > +igt@kms_addfb_basic@unused-pitches
> > +igt@kms_addfb_basic@unused-offsets
> > +igt@kms_addfb_basic@unused-modifier
> > +igt@kms_addfb_basic@clobberred-modifier
> > +igt@kms_addfb_basic@invalid-smem-bo-on-discrete
> > +igt@kms_addfb_basic@legacy-format
> > +igt@kms_addfb_basic@no-handle
> > +igt@kms_addfb_basic@basic
> > +igt@kms_addfb_basic@bad-pitch-0
> > +igt@kms_addfb_basic@bad-pitch-32
> > +igt@kms_addfb_basic@bad-pitch-63
> > +igt@kms_addfb_basic@bad-pitch-128
> > +igt@kms_addfb_basic@bad-pitch-256
> > +igt@kms_addfb_basic@bad-pitch-1024
> > +igt@kms_addfb_basic@bad-pitch-999
> > +igt@kms_addfb_basic@bad-pitch-65536
> > +igt@kms_addfb_basic@size-max
> > +igt@kms_addfb_basic@too-wide
> > +igt@kms_addfb_basic@too-high
> > +igt@kms_addfb_basic@bo-too-small
> > +igt@kms_addfb_basic@small-bo
> > +igt@kms_addfb_basic@bo-too-small-due-to-tiling
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag
> > +igt@kms_addfb_basic@addfb25-bad-modifier
> > +igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
> > +igt@kms_addfb_basic@addfb25-x-tiled-legacy
> > +igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
> > +igt@kms_addfb_basic@addfb25-y-tiled-legacy
> > +igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> > +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> > +igt@kms_addfb_basic@addfb25-4-tiled
> > +igt@kms_addfb_basic@basic-x-tiled-legacy
> > +igt@kms_addfb_basic@framebuffer-vs-set-tiling
> > +igt@kms_addfb_basic@tile-pitch-mismatch
> > +igt@kms_addfb_basic@basic-y-tiled-legacy
> > +igt@kms_addfb_basic@invalid-get-prop-any
> > +igt@kms_addfb_basic@invalid-get-prop
> > +igt@kms_addfb_basic@invalid-set-prop-any
> > +igt@kms_addfb_basic@invalid-set-prop
> > +igt@kms_addfb_basic@master-rmfb
> > +igt@kms_atomic@plane-overlay-legacy
> > +igt@kms_atomic@plane-primary-legacy
> > +igt@kms_atomic@plane-primary-overlay-mutable-zpos
> > +igt@kms_atomic@plane-immutable-zpos
> > +igt@kms_atomic@test-only
> > +igt@kms_atomic@plane-cursor-legacy
> > +igt@kms_atomic@plane-invalid-params
> > +igt@kms_atomic@plane-invalid-params-fence
> > +igt@kms_atomic@crtc-invalid-params
> > +igt@kms_atomic@crtc-invalid-params-fence
> > +igt@kms_atomic@atomic-invalid-params
> > +igt@kms_atomic@atomic_plane_damage
> > +igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
> > +igt@kms_content_protection@legacy
> > +igt@kms_content_protection@atomic
> > +igt@kms_content_protection@atomic-dpms
> > +igt@kms_content_protection@LIC
> > +igt@kms_content_protection@type1
> > +igt@kms_content_protection@mei_interface
> > +igt@kms_content_protection@content_type_change
> > +igt@kms_content_protection@uevent
> > +igt@kms_content_protection@srm
> > +igt@kms_content_protection@dp-mst-type-0
> > +igt@kms_content_protection@dp-mst-lic-type-0
> > +igt@kms_content_protection@dp-mst-type-1
> > +igt@kms_content_protection@dp-mst-lic-type-1
> > +igt@kms_dp_aux_dev
> > +igt@kms_flip_event_leak
> > +igt@kms_getfb@getfb-handle-zero
> > +igt@kms_getfb@getfb-handle-valid
> > +igt@kms_getfb@getfb-handle-closed
> > +igt@kms_getfb@getfb-handle-not-fb
> > +igt@kms_getfb@getfb-addfb-different-handles
> > +igt@kms_getfb@getfb-repeated-different-handles
> > +igt@kms_getfb@getfb-reject-ccs
> > +igt@kms_getfb@getfb2-handle-zero
> > +igt@kms_getfb@getfb2-handle-closed
> > +igt@kms_getfb@getfb2-handle-not-fb
> > +igt@kms_getfb@getfb2-accept-ccs
> > +igt@kms_getfb@getfb2-into-addfb2
> > +igt@kms_getfb@getfb-handle-protection
> > +igt@kms_getfb@getfb2-handle-protection
> > +igt@kms_hdmi_inject@inject-4k
> > +igt@kms_hdmi_inject@inject-audio
> > +igt@kms_hdr@bpc-switch
> > +igt@kms_hdr@bpc-switch-dpms
> > +igt@kms_hdr@static-toggle
> > +igt@kms_hdr@static-toggle-dpms
> > +igt@kms_hdr@static-swap
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check
> > +igt@kms_pipe_crc_basic@bad-source
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-b
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-c
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-d
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-e
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-f
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f
> > +igt@kms_plane_lowres@pipe-a-tiling-none
> > +igt@kms_plane_lowres@pipe-a-tiling-x
> > +igt@kms_plane_lowres@pipe-a-tiling-y
> > +igt@kms_plane_lowres@pipe-a-tiling-yf
> > +igt@kms_plane_lowres@pipe-a-tiling-4
> > +igt@kms_plane_lowres@pipe-b-tiling-none
> > +igt@kms_plane_lowres@pipe-b-tiling-x
> > +igt@kms_plane_lowres@pipe-b-tiling-y
> > +igt@kms_plane_lowres@pipe-b-tiling-yf
> > +igt@kms_plane_lowres@pipe-b-tiling-4
> > +igt@kms_plane_lowres@pipe-c-tiling-none
> > +igt@kms_plane_lowres@pipe-c-tiling-x
> > +igt@kms_plane_lowres@pipe-c-tiling-y
> > +igt@kms_plane_lowres@pipe-c-tiling-yf
> > +igt@kms_plane_lowres@pipe-c-tiling-4
> > +igt@kms_plane_lowres@pipe-d-tiling-none
> > +igt@kms_plane_lowres@pipe-d-tiling-x
> > +igt@kms_plane_lowres@pipe-d-tiling-y
> > +igt@kms_plane_lowres@pipe-d-tiling-yf
> > +igt@kms_plane_lowres@pipe-d-tiling-4
> > +igt@kms_plane_lowres@pipe-e-tiling-none
> > +igt@kms_plane_lowres@pipe-e-tiling-x
> > +igt@kms_plane_lowres@pipe-e-tiling-y
> > +igt@kms_plane_lowres@pipe-e-tiling-yf
> > +igt@kms_plane_lowres@pipe-e-tiling-4
> > +igt@kms_plane_lowres@pipe-f-tiling-none
> > +igt@kms_plane_lowres@pipe-f-tiling-x
> > +igt@kms_plane_lowres@pipe-f-tiling-y
> > +igt@kms_plane_lowres@pipe-f-tiling-yf
> > +igt@kms_plane_lowres@pipe-f-tiling-4
> > +igt@kms_prop_blob@basic
> > +igt@kms_prop_blob@blob-prop-core
> > +igt@kms_prop_blob@blob-prop-validate
> > +igt@kms_prop_blob@blob-prop-lifetime
> > +igt@kms_prop_blob@blob-multiple
> > +igt@kms_prop_blob@invalid-get-prop-any
> > +igt@kms_prop_blob@invalid-get-prop
> > +igt@kms_prop_blob@invalid-set-prop-any
> > +igt@kms_prop_blob@invalid-set-prop
> > +igt@kms_rmfb@rmfb-ioctl
> > +igt@kms_rmfb@close-fd
> > +igt@kms_rotation_crc@primary-rotation-90
> > +igt@kms_rotation_crc@primary-rotation-180
> > +igt@kms_rotation_crc@primary-rotation-270
> > +igt@kms_rotation_crc@sprite-rotation-90
> > +igt@kms_rotation_crc@sprite-rotation-180
> > +igt@kms_rotation_crc@sprite-rotation-270
> > +igt@kms_rotation_crc@cursor-rotation-180
> > +igt@kms_rotation_crc@sprite-rotation-90-pos-100-0
> > +igt@kms_rotation_crc@bad-pixel-format
> > +igt@kms_rotation_crc@bad-tiling
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-0
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-180
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-0
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-90
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-180
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-270
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-0
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-180
> > +igt@kms_rotation_crc@multiplane-rotation
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-top
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-bottom
> > +igt@kms_rotation_crc@exhaust-fences
> > +igt@kms_selftest@all
> > +igt@kms_setmode@basic@pipe-a-edp-1
> > +igt@kms_setmode@basic@pipe-b-edp-1
> > +igt@kms_setmode@basic-clone-single-crtc
> > +igt@kms_setmode@invalid-clone-single-crtc
> > +igt@kms_setmode@invalid-clone-exclusive-crtc
> > +igt@kms_setmode@clone-exclusive-crtc
> > +igt@kms_setmode@invalid-clone-single-crtc-stealing
> > +
> > +# Flakes on a530 with:
> > +# arm-smmu b40000.iommu: Unhandled context fault: fsr=3D0x408, iova=3D=
0x01003000, fsynr=3D0x13, cbfrsynra=3D0x0, cb=3D0
> > +# igt@msm_mapping@ring
> > +
> > +igt@msm_mapping@sqefw
> > +igt@msm_mapping@shadow
> > +igt@msm_recovery@hangcheck
> > +igt@msm_recovery@gpu-fault
> > +igt@msm_recovery@iova-fault
> > +igt@msm_submit@empty-submit
> > +igt@msm_submit@invalid-queue-submit
> > +igt@msm_submit@invalid-flags-submit
> > +igt@msm_submit@invalid-in-fence-submit
> > +igt@msm_submit@invalid-duplicate-bo-submit
> > +igt@msm_submit@invalid-cmd-idx-submit
> > +igt@msm_submit@invalid-cmd-type-submit
> > +igt@msm_submit@valid-submit
> > +igt@kms_sysfs_edid_timing
> > +igt@kms_universal_plane@universal-plane-pipe-a-functional
> > +igt@kms_universal_plane@universal-plane-pipe-a-sanity
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-a
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-a
> > +igt@kms_universal_plane@universal-plane-pipe-b-functional
> > +igt@kms_universal_plane@universal-plane-pipe-b-sanity
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-b
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-b
> > +igt@kms_universal_plane@universal-plane-pipe-c-functional
> > +igt@kms_universal_plane@universal-plane-pipe-c-sanity
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-c
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-c
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-c
> > +igt@kms_universal_plane@universal-plane-pipe-d-functional
> > +igt@kms_universal_plane@universal-plane-pipe-d-sanity
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-d
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-d
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-d
> > +igt@kms_universal_plane@universal-plane-pipe-e-functional
> > +igt@kms_universal_plane@universal-plane-pipe-e-sanity
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-e
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-e
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-e
> > +igt@kms_universal_plane@universal-plane-pipe-f-functional
> > +igt@kms_universal_plane@universal-plane-pipe-f-sanity
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-f
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-f
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-f
> > +igt@kms_vblank@invalid
> > +igt@kms_vblank@crtc-id
> > +igt@kms_vblank@pipe-a-query-idle
> > +igt@kms_vblank@pipe-a-query-idle-hang
> > +igt@kms_vblank@pipe-a-query-forked
> > +igt@kms_vblank@pipe-a-query-forked-hang
> > +igt@kms_vblank@pipe-a-query-busy
> > +igt@kms_vblank@pipe-a-query-busy-hang
> > +igt@kms_vblank@pipe-a-query-forked-busy
> > +igt@kms_vblank@pipe-a-query-forked-busy-hang
> > +igt@kms_vblank@pipe-a-wait-idle
> > +igt@kms_vblank@pipe-a-wait-idle-hang
> > +igt@kms_vblank@pipe-a-wait-forked
> > +igt@kms_vblank@pipe-a-wait-forked-hang
> > +igt@kms_vblank@pipe-a-wait-busy
> > +igt@kms_vblank@pipe-a-wait-busy-hang
> > +igt@kms_vblank@pipe-a-wait-forked-busy
> > +igt@kms_vblank@pipe-a-wait-forked-busy-hang
> > +igt@kms_vblank@pipe-a-ts-continuation-idle
> > +igt@kms_vblank@pipe-a-ts-continuation-idle-hang
> > +igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-hang
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm
> > +igt@kms_vblank@pipe-b-accuracy-idle
> > +igt@kms_vblank@pipe-b-query-idle
> > +igt@kms_vblank@pipe-b-query-idle-hang
> > +igt@kms_vblank@pipe-b-query-forked
> > +igt@kms_vblank@pipe-b-query-forked-hang
> > +igt@kms_vblank@pipe-b-query-busy
> > +igt@kms_vblank@pipe-b-query-busy-hang
> > +igt@kms_vblank@pipe-b-query-forked-busy
> > +igt@kms_vblank@pipe-b-query-forked-busy-hang
> > +igt@kms_vblank@pipe-b-wait-idle
> > +igt@kms_vblank@pipe-b-wait-idle-hang
> > +igt@kms_vblank@pipe-b-wait-forked
> > +igt@kms_vblank@pipe-b-wait-forked-hang
> > +igt@kms_vblank@pipe-b-wait-busy
> > +igt@kms_vblank@pipe-b-wait-busy-hang
> > +igt@kms_vblank@pipe-b-wait-forked-busy
> > +igt@kms_vblank@pipe-b-wait-forked-busy-hang
> > +igt@kms_vblank@pipe-b-ts-continuation-idle
> > +igt@kms_vblank@pipe-b-ts-continuation-idle-hang
> > +igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-hang
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm
> > +igt@kms_vblank@pipe-c-accuracy-idle
> > +igt@kms_vblank@pipe-c-query-idle
> > +igt@kms_vblank@pipe-c-query-idle-hang
> > +igt@kms_vblank@pipe-c-query-forked
> > +igt@kms_vblank@pipe-c-query-forked-hang
> > +igt@kms_vblank@pipe-c-query-busy
> > +igt@kms_vblank@pipe-c-query-busy-hang
> > +igt@kms_vblank@pipe-c-query-forked-busy
> > +igt@kms_vblank@pipe-c-query-forked-busy-hang
> > +igt@kms_vblank@pipe-c-wait-idle
> > +igt@kms_vblank@pipe-c-wait-idle-hang
> > +igt@kms_vblank@pipe-c-wait-forked
> > +igt@kms_vblank@pipe-c-wait-forked-hang
> > +igt@kms_vblank@pipe-c-wait-busy
> > +igt@kms_vblank@pipe-c-wait-busy-hang
> > +igt@kms_vblank@pipe-c-wait-forked-busy
> > +igt@kms_vblank@pipe-c-wait-forked-busy-hang
> > +igt@kms_vblank@pipe-c-ts-continuation-idle
> > +igt@kms_vblank@pipe-c-ts-continuation-idle-hang
> > +igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-hang
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm
> > +igt@kms_vblank@pipe-d-accuracy-idle
> > +igt@kms_vblank@pipe-d-query-idle
> > +igt@kms_vblank@pipe-d-query-idle-hang
> > +igt@kms_vblank@pipe-d-query-forked
> > +igt@kms_vblank@pipe-d-query-forked-hang
> > +igt@kms_vblank@pipe-d-query-busy
> > +igt@kms_vblank@pipe-d-query-busy-hang
> > +igt@kms_vblank@pipe-d-query-forked-busy
> > +igt@kms_vblank@pipe-d-query-forked-busy-hang
> > +igt@kms_vblank@pipe-d-wait-idle
> > +igt@kms_vblank@pipe-d-wait-idle-hang
> > +igt@kms_vblank@pipe-d-wait-forked
> > +igt@kms_vblank@pipe-d-wait-forked-hang
> > +igt@kms_vblank@pipe-d-wait-busy
> > +igt@kms_vblank@pipe-d-wait-busy-hang
> > +igt@kms_vblank@pipe-d-wait-forked-busy
> > +igt@kms_vblank@pipe-d-wait-forked-busy-hang
> > +igt@kms_vblank@pipe-d-ts-continuation-idle
> > +igt@kms_vblank@pipe-d-ts-continuation-idle-hang
> > +igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-hang
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm
> > +igt@kms_vblank@pipe-e-accuracy-idle
> > +igt@kms_vblank@pipe-e-query-idle
> > +igt@kms_vblank@pipe-e-query-idle-hang
> > +igt@kms_vblank@pipe-e-query-forked
> > +igt@kms_vblank@pipe-e-query-forked-hang
> > +igt@kms_vblank@pipe-e-query-busy
> > +igt@kms_vblank@pipe-e-query-busy-hang
> > +igt@kms_vblank@pipe-e-query-forked-busy
> > +igt@kms_vblank@pipe-e-query-forked-busy-hang
> > +igt@kms_vblank@pipe-e-wait-idle
> > +igt@kms_vblank@pipe-e-wait-idle-hang
> > +igt@kms_vblank@pipe-e-wait-forked
> > +igt@kms_vblank@pipe-e-wait-forked-hang
> > +igt@kms_vblank@pipe-e-wait-busy
> > +igt@kms_vblank@pipe-e-wait-busy-hang
> > +igt@kms_vblank@pipe-e-wait-forked-busy
> > +igt@kms_vblank@pipe-e-wait-forked-busy-hang
> > +igt@kms_vblank@pipe-e-ts-continuation-idle
> > +igt@kms_vblank@pipe-e-ts-continuation-idle-hang
> > +igt@kms_vblank@pipe-e-ts-continuation-dpms-rpm
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-hang
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-rpm
> > +igt@kms_vblank@pipe-f-accuracy-idle
> > +igt@kms_vblank@pipe-f-query-idle
> > +igt@kms_vblank@pipe-f-query-idle-hang
> > +igt@kms_vblank@pipe-f-query-forked
> > +igt@kms_vblank@pipe-f-query-forked-hang
> > +igt@kms_vblank@pipe-f-query-busy
> > +igt@kms_vblank@pipe-f-query-busy-hang
> > +igt@kms_vblank@pipe-f-query-forked-busy
> > +igt@kms_vblank@pipe-f-query-forked-busy-hang
> > +igt@kms_vblank@pipe-f-wait-idle
> > +igt@kms_vblank@pipe-f-wait-idle-hang
> > +igt@kms_vblank@pipe-f-wait-forked
> > +igt@kms_vblank@pipe-f-wait-forked-hang
> > +igt@kms_vblank@pipe-f-wait-busy
> > +igt@kms_vblank@pipe-f-wait-busy-hang
> > +igt@kms_vblank@pipe-f-wait-forked-busy
> > +igt@kms_vblank@pipe-f-wait-forked-busy-hang
> > +igt@kms_vblank@pipe-f-ts-continuation-idle
> > +igt@kms_vblank@pipe-f-ts-continuation-idle-hang
> > +igt@kms_vblank@pipe-f-ts-continuation-dpms-rpm
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-hang
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-rpm
> > +igt@kms_vrr@flip-basic
> > +igt@kms_vrr@flip-dpms
> > +igt@kms_vrr@flipline
> > +igt@kms_async_flip@async-flip-with-page-flip-events
> > +igt@kms_async_flip@alternate-sync-async-flip
> > +igt@kms_async_flip@test-time-stamp
> > +igt@kms_async_flip@test-cursor
> > +igt@kms_async_flip@invalid-async-flip
> > +igt@kms_async_flip@crc
> > diff --git a/drivers/gpu/drm/msm/ci/msm_a360_results.txt b/drivers/gpu/=
drm/msm/ci/msm_a360_results.txt
> > new file mode 100644
> > index 000000000000..fd80d2bf2bcb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_a360_results.txt
> > @@ -0,0 +1,421 @@
> > +igt@core_auth@getclient-simple,pass
> > +igt@core_auth@getclient-master-drop,pass
> > +igt@core_auth@basic-auth,pass
> > +igt@core_auth@many-magics,pass
> > +igt@core_getclient,pass
> > +igt@core_getstats,pass
> > +igt@core_getversion,pass
> > +igt@core_setmaster_vs_auth,pass
> > +igt@drm_read@invalid-buffer,skip
> > +igt@drm_read@fault-buffer,skip
> > +igt@drm_read@empty-block,skip
> > +igt@drm_read@empty-nonblock,skip
> > +igt@drm_read@short-buffer-block,skip
> > +igt@drm_read@short-buffer-nonblock,skip
> > +igt@drm_read@short-buffer-wakeup,skip
> > +igt@kms_addfb_basic@unused-handle,pass
> > +igt@kms_addfb_basic@unused-pitches,pass
> > +igt@kms_addfb_basic@unused-offsets,pass
> > +igt@kms_addfb_basic@unused-modifier,pass
> > +igt@kms_addfb_basic@clobberred-modifier,skip
> > +igt@kms_addfb_basic@invalid-smem-bo-on-discrete,skip
> > +igt@kms_addfb_basic@legacy-format,dmesg-warn
> > +igt@kms_addfb_basic@no-handle,pass
> > +igt@kms_addfb_basic@basic,pass
> > +igt@kms_addfb_basic@bad-pitch-0,pass
> > +igt@kms_addfb_basic@bad-pitch-32,pass
> > +igt@kms_addfb_basic@bad-pitch-63,pass
> > +igt@kms_addfb_basic@bad-pitch-128,pass
> > +igt@kms_addfb_basic@bad-pitch-256,pass
> > +igt@kms_addfb_basic@bad-pitch-1024,pass
> > +igt@kms_addfb_basic@bad-pitch-999,pass
> > +igt@kms_addfb_basic@bad-pitch-65536,pass
> > +igt@kms_addfb_basic@size-max,pass
> > +igt@kms_addfb_basic@too-wide,pass
> > +igt@kms_addfb_basic@too-high,dmesg-warn
> > +igt@kms_addfb_basic@bo-too-small,pass
> > +igt@kms_addfb_basic@small-bo,pass
> > +igt@kms_addfb_basic@bo-too-small-due-to-tiling,skip
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,fail
> > +igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy,skip
> > +igt@kms_addfb_basic@addfb25-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-yf-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy,skip
> > +igt@kms_addfb_basic@addfb25-4-tiled,skip
> > +igt@kms_addfb_basic@basic-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@tile-pitch-mismatch,skip
> > +igt@kms_addfb_basic@basic-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@invalid-get-prop-any,pass
> > +igt@kms_addfb_basic@invalid-get-prop,pass
> > +igt@kms_addfb_basic@invalid-set-prop-any,pass
> > +igt@kms_addfb_basic@invalid-set-prop,pass
> > +igt@kms_addfb_basic@master-rmfb,pass
> > +igt@kms_atomic@plane-overlay-legacy,skip
> > +igt@kms_atomic@plane-primary-legacy,skip
> > +igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
> > +igt@kms_atomic@plane-immutable-zpos,skip
> > +igt@kms_atomic@test-only,skip
> > +igt@kms_atomic@plane-cursor-legacy,skip
> > +igt@kms_atomic@plane-invalid-params,skip
> > +igt@kms_atomic@plane-invalid-params-fence,skip
> > +igt@kms_atomic@crtc-invalid-params,skip
> > +igt@kms_atomic@crtc-invalid-params-fence,skip
> > +igt@kms_atomic@atomic-invalid-params,skip
> > +igt@kms_atomic@atomic_plane_damage,skip
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@legacy,skip
> > +igt@kms_content_protection@atomic,skip
> > +igt@kms_content_protection@atomic-dpms,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_content_protection@type1,skip
> > +igt@kms_content_protection@mei_interface,skip
> > +igt@kms_content_protection@content_type_change,skip
> > +igt@kms_content_protection@uevent,skip
> > +igt@kms_content_protection@srm,skip
> > +igt@kms_content_protection@dp-mst-type-0,skip
> > +igt@kms_content_protection@dp-mst-lic-type-0,skip
> > +igt@kms_content_protection@dp-mst-type-1,skip
> > +igt@kms_content_protection@dp-mst-lic-type-1,skip
> > +igt@kms_dp_aux_dev,skip
> > +igt@kms_flip_event_leak,skip
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb-reject-ccs,skip
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-accept-ccs,skip
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,fail
> > +igt@kms_hdmi_inject@inject-audio,skip
> > +igt@kms_hdr@bpc-switch,skip
> > +igt@kms_hdr@bpc-switch-dpms,skip
> > +igt@kms_hdr@static-toggle,skip
> > +igt@kms_hdr@static-toggle-dpms,skip
> > +igt@kms_hdr@static-swap,skip
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
> > +igt@kms_pipe_crc_basic@bad-source,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-4,skip
> > +igt@kms_prop_blob@basic,pass
> > +igt@kms_prop_blob@blob-prop-core,pass
> > +igt@kms_prop_blob@blob-prop-validate,pass
> > +igt@kms_prop_blob@blob-prop-lifetime,pass
> > +igt@kms_prop_blob@blob-multiple,pass
> > +igt@kms_prop_blob@invalid-get-prop-any,pass
> > +igt@kms_prop_blob@invalid-get-prop,pass
> > +igt@kms_prop_blob@invalid-set-prop-any,pass
> > +igt@kms_prop_blob@invalid-set-prop,pass
> > +igt@kms_rmfb@rmfb-ioctl,skip
> > +igt@kms_rmfb@close-fd,skip
> > +igt@kms_rotation_crc@primary-rotation-90,skip
> > +igt@kms_rotation_crc@primary-rotation-180,skip
> > +igt@kms_rotation_crc@primary-rotation-270,skip
> > +igt@kms_rotation_crc@sprite-rotation-90,skip
> > +igt@kms_rotation_crc@sprite-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-270,skip
> > +igt@kms_rotation_crc@cursor-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-90-pos-100-0,skip
> > +igt@kms_rotation_crc@bad-pixel-format,skip
> > +igt@kms_rotation_crc@bad-tiling,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@multiplane-rotation,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-top,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-bottom,skip
> > +igt@kms_rotation_crc@exhaust-fences,skip
> > +igt@kms_selftest@all,skip
> > +igt@kms_setmode@basic,skip
> > +igt@kms_setmode@basic-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-exclusive-crtc,skip
> > +igt@kms_setmode@clone-exclusive-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc-stealing,skip
> > +igt@msm_mapping@sqefw,skip
> > +igt@msm_mapping@shadow,skip
> > +igt@msm_recovery@hangcheck,skip
> > +igt@msm_recovery@gpu-fault,skip
> > +igt@msm_recovery@iova-fault,skip
> > +igt@msm_submit@empty-submit,pass
> > +igt@msm_submit@invalid-queue-submit,pass
> > +igt@msm_submit@invalid-flags-submit,pass
> > +igt@msm_submit@invalid-in-fence-submit,pass
> > +igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
> > +igt@msm_submit@valid-submit,pass
> > +igt@kms_sysfs_edid_timing,pass
> > +igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-a-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-c,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-d,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-e,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-f,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-f,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-f,skip
> > +igt@kms_vblank@invalid,skip
> > +igt@kms_vblank@crtc-id,skip
> > +igt@kms_vblank@pipe-a-query-idle,skip
> > +igt@kms_vblank@pipe-a-query-idle-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked,skip
> > +igt@kms_vblank@pipe-a-query-forked-hang,skip
> > +igt@kms_vblank@pipe-a-query-busy,skip
> > +igt@kms_vblank@pipe-a-query-busy-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-idle,skip
> > +igt@kms_vblank@pipe-a-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked,skip
> > +igt@kms_vblank@pipe-a-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-a-wait-busy,skip
> > +igt@kms_vblank@pipe-a-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-b-accuracy-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked,skip
> > +igt@kms_vblank@pipe-b-query-forked-hang,skip
> > +igt@kms_vblank@pipe-b-query-busy,skip
> > +igt@kms_vblank@pipe-b-query-busy-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-idle,skip
> > +igt@kms_vblank@pipe-b-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked,skip
> > +igt@kms_vblank@pipe-b-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-b-wait-busy,skip
> > +igt@kms_vblank@pipe-b-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-c-accuracy-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked,skip
> > +igt@kms_vblank@pipe-c-query-forked-hang,skip
> > +igt@kms_vblank@pipe-c-query-busy,skip
> > +igt@kms_vblank@pipe-c-query-busy-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-idle,skip
> > +igt@kms_vblank@pipe-c-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked,skip
> > +igt@kms_vblank@pipe-c-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-c-wait-busy,skip
> > +igt@kms_vblank@pipe-c-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-d-accuracy-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked,skip
> > +igt@kms_vblank@pipe-d-query-forked-hang,skip
> > +igt@kms_vblank@pipe-d-query-busy,skip
> > +igt@kms_vblank@pipe-d-query-busy-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-idle,skip
> > +igt@kms_vblank@pipe-d-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked,skip
> > +igt@kms_vblank@pipe-d-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-d-wait-busy,skip
> > +igt@kms_vblank@pipe-d-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-e-accuracy-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked,skip
> > +igt@kms_vblank@pipe-e-query-forked-hang,skip
> > +igt@kms_vblank@pipe-e-query-busy,skip
> > +igt@kms_vblank@pipe-e-query-busy-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-idle,skip
> > +igt@kms_vblank@pipe-e-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked,skip
> > +igt@kms_vblank@pipe-e-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-e-wait-busy,skip
> > +igt@kms_vblank@pipe-e-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-f-accuracy-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked,skip
> > +igt@kms_vblank@pipe-f-query-forked-hang,skip
> > +igt@kms_vblank@pipe-f-query-busy,skip
> > +igt@kms_vblank@pipe-f-query-busy-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-idle,skip
> > +igt@kms_vblank@pipe-f-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked,skip
> > +igt@kms_vblank@pipe-f-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-f-wait-busy,skip
> > +igt@kms_vblank@pipe-f-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-rpm,skip
> > +igt@kms_vrr@flip-basic,skip
> > +igt@kms_vrr@flip-dpms,skip
> > +igt@kms_vrr@flipline,skip
> > +igt@kms_async_flip@async-flip-with-page-flip-events,skip
> > +igt@kms_async_flip@alternate-sync-async-flip,skip
> > +igt@kms_async_flip@test-time-stamp,skip
> > +igt@kms_async_flip@test-cursor,skip
> > +igt@kms_async_flip@invalid-async-flip,skip
> > +igt@kms_async_flip@crc,skip
> > diff --git a/drivers/gpu/drm/msm/ci/msm_a530_results.txt b/drivers/gpu/=
drm/msm/ci/msm_a530_results.txt
> > new file mode 100644
> > index 000000000000..d5bf402f830c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_a530_results.txt
> > @@ -0,0 +1,421 @@
> > +igt@core_auth@getclient-simple,pass
> > +igt@core_auth@getclient-master-drop,pass
> > +igt@core_auth@basic-auth,pass
> > +igt@core_auth@many-magics,pass
> > +igt@core_getclient,pass
> > +igt@core_getstats,pass
> > +igt@core_getversion,pass
> > +igt@core_setmaster_vs_auth,pass
> > +igt@drm_read@invalid-buffer,skip
> > +igt@drm_read@fault-buffer,skip
> > +igt@drm_read@empty-block,skip
> > +igt@drm_read@empty-nonblock,skip
> > +igt@drm_read@short-buffer-block,skip
> > +igt@drm_read@short-buffer-nonblock,skip
> > +igt@drm_read@short-buffer-wakeup,skip
> > +igt@kms_addfb_basic@unused-handle,pass
> > +igt@kms_addfb_basic@unused-pitches,pass
> > +igt@kms_addfb_basic@unused-offsets,pass
> > +igt@kms_addfb_basic@unused-modifier,pass
> > +igt@kms_addfb_basic@clobberred-modifier,skip
> > +igt@kms_addfb_basic@invalid-smem-bo-on-discrete,skip
> > +igt@kms_addfb_basic@legacy-format,dmesg-warn
> > +igt@kms_addfb_basic@no-handle,pass
> > +igt@kms_addfb_basic@basic,pass
> > +igt@kms_addfb_basic@bad-pitch-0,pass
> > +igt@kms_addfb_basic@bad-pitch-32,pass
> > +igt@kms_addfb_basic@bad-pitch-63,pass
> > +igt@kms_addfb_basic@bad-pitch-128,pass
> > +igt@kms_addfb_basic@bad-pitch-256,pass
> > +igt@kms_addfb_basic@bad-pitch-1024,pass
> > +igt@kms_addfb_basic@bad-pitch-999,pass
> > +igt@kms_addfb_basic@bad-pitch-65536,pass
> > +igt@kms_addfb_basic@size-max,pass
> > +igt@kms_addfb_basic@too-wide,pass
> > +igt@kms_addfb_basic@too-high,dmesg-warn
> > +igt@kms_addfb_basic@bo-too-small,pass
> > +igt@kms_addfb_basic@small-bo,pass
> > +igt@kms_addfb_basic@bo-too-small-due-to-tiling,skip
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,fail
> > +igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy,skip
> > +igt@kms_addfb_basic@addfb25-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-yf-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy,skip
> > +igt@kms_addfb_basic@addfb25-4-tiled,skip
> > +igt@kms_addfb_basic@basic-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@tile-pitch-mismatch,skip
> > +igt@kms_addfb_basic@basic-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@invalid-get-prop-any,pass
> > +igt@kms_addfb_basic@invalid-get-prop,pass
> > +igt@kms_addfb_basic@invalid-set-prop-any,pass
> > +igt@kms_addfb_basic@invalid-set-prop,pass
> > +igt@kms_addfb_basic@master-rmfb,pass
> > +igt@kms_atomic@plane-overlay-legacy,skip
> > +igt@kms_atomic@plane-primary-legacy,skip
> > +igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
> > +igt@kms_atomic@plane-immutable-zpos,skip
> > +igt@kms_atomic@test-only,skip
> > +igt@kms_atomic@plane-cursor-legacy,skip
> > +igt@kms_atomic@plane-invalid-params,skip
> > +igt@kms_atomic@plane-invalid-params-fence,skip
> > +igt@kms_atomic@crtc-invalid-params,skip
> > +igt@kms_atomic@crtc-invalid-params-fence,skip
> > +igt@kms_atomic@atomic-invalid-params,skip
> > +igt@kms_atomic@atomic_plane_damage,skip
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@legacy,skip
> > +igt@kms_content_protection@atomic,skip
> > +igt@kms_content_protection@atomic-dpms,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_content_protection@type1,skip
> > +igt@kms_content_protection@mei_interface,skip
> > +igt@kms_content_protection@content_type_change,skip
> > +igt@kms_content_protection@uevent,skip
> > +igt@kms_content_protection@srm,skip
> > +igt@kms_content_protection@dp-mst-type-0,skip
> > +igt@kms_content_protection@dp-mst-lic-type-0,skip
> > +igt@kms_content_protection@dp-mst-type-1,skip
> > +igt@kms_content_protection@dp-mst-lic-type-1,skip
> > +igt@kms_dp_aux_dev,skip
> > +igt@kms_flip_event_leak,skip
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb-reject-ccs,skip
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-accept-ccs,skip
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,dmesg-warn
> > +igt@kms_hdmi_inject@inject-audio,skip
> > +igt@kms_hdr@bpc-switch,skip
> > +igt@kms_hdr@bpc-switch-dpms,skip
> > +igt@kms_hdr@static-toggle,skip
> > +igt@kms_hdr@static-toggle-dpms,skip
> > +igt@kms_hdr@static-swap,skip
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
> > +igt@kms_pipe_crc_basic@bad-source,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-4,skip
> > +igt@kms_prop_blob@basic,pass
> > +igt@kms_prop_blob@blob-prop-core,pass
> > +igt@kms_prop_blob@blob-prop-validate,pass
> > +igt@kms_prop_blob@blob-prop-lifetime,pass
> > +igt@kms_prop_blob@blob-multiple,pass
> > +igt@kms_prop_blob@invalid-get-prop-any,pass
> > +igt@kms_prop_blob@invalid-get-prop,pass
> > +igt@kms_prop_blob@invalid-set-prop-any,pass
> > +igt@kms_prop_blob@invalid-set-prop,pass
> > +igt@kms_rmfb@rmfb-ioctl,skip
> > +igt@kms_rmfb@close-fd,skip
> > +igt@kms_rotation_crc@primary-rotation-90,skip
> > +igt@kms_rotation_crc@primary-rotation-180,skip
> > +igt@kms_rotation_crc@primary-rotation-270,skip
> > +igt@kms_rotation_crc@sprite-rotation-90,skip
> > +igt@kms_rotation_crc@sprite-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-270,skip
> > +igt@kms_rotation_crc@cursor-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-90-pos-100-0,skip
> > +igt@kms_rotation_crc@bad-pixel-format,skip
> > +igt@kms_rotation_crc@bad-tiling,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@multiplane-rotation,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-top,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-bottom,skip
> > +igt@kms_rotation_crc@exhaust-fences,skip
> > +igt@kms_selftest@all,skip
> > +igt@kms_setmode@basic,skip
> > +igt@kms_setmode@basic-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-exclusive-crtc,skip
> > +igt@kms_setmode@clone-exclusive-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc-stealing,skip
> > +igt@msm_mapping@sqefw,skip
> > +igt@msm_mapping@shadow,skip
> > +igt@msm_recovery@hangcheck,skip
> > +igt@msm_recovery@gpu-fault,skip
> > +igt@msm_recovery@iova-fault,skip
> > +igt@msm_submit@empty-submit,pass
> > +igt@msm_submit@invalid-queue-submit,pass
> > +igt@msm_submit@invalid-flags-submit,pass
> > +igt@msm_submit@invalid-in-fence-submit,pass
> > +igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
> > +igt@msm_submit@valid-submit,pass
> > +igt@kms_sysfs_edid_timing,pass
> > +igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-a-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-c,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-d,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-e,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-f,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-f,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-f,skip
> > +igt@kms_vblank@invalid,skip
> > +igt@kms_vblank@crtc-id,skip
> > +igt@kms_vblank@pipe-a-query-idle,skip
> > +igt@kms_vblank@pipe-a-query-idle-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked,skip
> > +igt@kms_vblank@pipe-a-query-forked-hang,skip
> > +igt@kms_vblank@pipe-a-query-busy,skip
> > +igt@kms_vblank@pipe-a-query-busy-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-idle,skip
> > +igt@kms_vblank@pipe-a-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked,skip
> > +igt@kms_vblank@pipe-a-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-a-wait-busy,skip
> > +igt@kms_vblank@pipe-a-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-b-accuracy-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked,skip
> > +igt@kms_vblank@pipe-b-query-forked-hang,skip
> > +igt@kms_vblank@pipe-b-query-busy,skip
> > +igt@kms_vblank@pipe-b-query-busy-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-idle,skip
> > +igt@kms_vblank@pipe-b-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked,skip
> > +igt@kms_vblank@pipe-b-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-b-wait-busy,skip
> > +igt@kms_vblank@pipe-b-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-c-accuracy-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked,skip
> > +igt@kms_vblank@pipe-c-query-forked-hang,skip
> > +igt@kms_vblank@pipe-c-query-busy,skip
> > +igt@kms_vblank@pipe-c-query-busy-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-idle,skip
> > +igt@kms_vblank@pipe-c-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked,skip
> > +igt@kms_vblank@pipe-c-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-c-wait-busy,skip
> > +igt@kms_vblank@pipe-c-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-d-accuracy-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked,skip
> > +igt@kms_vblank@pipe-d-query-forked-hang,skip
> > +igt@kms_vblank@pipe-d-query-busy,skip
> > +igt@kms_vblank@pipe-d-query-busy-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-idle,skip
> > +igt@kms_vblank@pipe-d-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked,skip
> > +igt@kms_vblank@pipe-d-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-d-wait-busy,skip
> > +igt@kms_vblank@pipe-d-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-e-accuracy-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked,skip
> > +igt@kms_vblank@pipe-e-query-forked-hang,skip
> > +igt@kms_vblank@pipe-e-query-busy,skip
> > +igt@kms_vblank@pipe-e-query-busy-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-idle,skip
> > +igt@kms_vblank@pipe-e-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked,skip
> > +igt@kms_vblank@pipe-e-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-e-wait-busy,skip
> > +igt@kms_vblank@pipe-e-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-f-accuracy-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked,skip
> > +igt@kms_vblank@pipe-f-query-forked-hang,skip
> > +igt@kms_vblank@pipe-f-query-busy,skip
> > +igt@kms_vblank@pipe-f-query-busy-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-idle,skip
> > +igt@kms_vblank@pipe-f-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked,skip
> > +igt@kms_vblank@pipe-f-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-f-wait-busy,skip
> > +igt@kms_vblank@pipe-f-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-rpm,skip
> > +igt@kms_vrr@flip-basic,skip
> > +igt@kms_vrr@flip-dpms,skip
> > +igt@kms_vrr@flipline,skip
> > +igt@kms_async_flip@async-flip-with-page-flip-events,skip
> > +igt@kms_async_flip@alternate-sync-async-flip,skip
> > +igt@kms_async_flip@test-time-stamp,skip
> > +igt@kms_async_flip@test-cursor,skip
> > +igt@kms_async_flip@invalid-async-flip,skip
> > +igt@kms_async_flip@crc,skip
> > diff --git a/drivers/gpu/drm/msm/ci/msm_a618_results.txt b/drivers/gpu/=
drm/msm/ci/msm_a618_results.txt
> > new file mode 100644
> > index 000000000000..6e42262bf61b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_a618_results.txt
> > @@ -0,0 +1,422 @@
> > +igt@core_auth@getclient-simple,dmesg-warn
> > +igt@core_auth@getclient-master-drop,pass
> > +igt@core_auth@basic-auth,pass
> > +igt@core_auth@many-magics,pass
> > +igt@core_getclient,pass
> > +igt@core_getstats,pass
> > +igt@core_getversion,pass
> > +igt@core_setmaster_vs_auth,pass
> > +igt@drm_read@invalid-buffer,pass
> > +igt@drm_read@fault-buffer,pass
> > +igt@drm_read@empty-block,pass
> > +igt@drm_read@empty-nonblock,pass
> > +igt@drm_read@short-buffer-block,pass
> > +igt@drm_read@short-buffer-nonblock,pass
> > +igt@drm_read@short-buffer-wakeup,pass
> > +igt@kms_addfb_basic@unused-handle,pass
> > +igt@kms_addfb_basic@unused-pitches,pass
> > +igt@kms_addfb_basic@unused-offsets,pass
> > +igt@kms_addfb_basic@unused-modifier,pass
> > +igt@kms_addfb_basic@clobberred-modifier,skip
> > +igt@kms_addfb_basic@invalid-smem-bo-on-discrete,skip
> > +igt@kms_addfb_basic@legacy-format,dmesg-warn
> > +igt@kms_addfb_basic@no-handle,pass
> > +igt@kms_addfb_basic@basic,pass
> > +igt@kms_addfb_basic@bad-pitch-0,pass
> > +igt@kms_addfb_basic@bad-pitch-32,pass
> > +igt@kms_addfb_basic@bad-pitch-63,pass
> > +igt@kms_addfb_basic@bad-pitch-128,pass
> > +igt@kms_addfb_basic@bad-pitch-256,pass
> > +igt@kms_addfb_basic@bad-pitch-1024,pass
> > +igt@kms_addfb_basic@bad-pitch-999,pass
> > +igt@kms_addfb_basic@bad-pitch-65536,pass
> > +igt@kms_addfb_basic@size-max,pass
> > +igt@kms_addfb_basic@too-wide,pass
> > +igt@kms_addfb_basic@too-high,dmesg-warn
> > +igt@kms_addfb_basic@bo-too-small,pass
> > +igt@kms_addfb_basic@small-bo,pass
> > +igt@kms_addfb_basic@bo-too-small-due-to-tiling,skip
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,dmesg-warn
> > +igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy,skip
> > +igt@kms_addfb_basic@addfb25-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-yf-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy,skip
> > +igt@kms_addfb_basic@addfb25-4-tiled,skip
> > +igt@kms_addfb_basic@basic-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@tile-pitch-mismatch,skip
> > +igt@kms_addfb_basic@basic-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@invalid-get-prop-any,pass
> > +igt@kms_addfb_basic@invalid-get-prop,pass
> > +igt@kms_addfb_basic@invalid-set-prop-any,pass
> > +igt@kms_addfb_basic@invalid-set-prop,pass
> > +igt@kms_addfb_basic@master-rmfb,pass
> > +igt@kms_atomic@plane-overlay-legacy,skip
> > +igt@kms_atomic@plane-primary-legacy,pass
> > +igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
> > +igt@kms_atomic@plane-immutable-zpos,pass
> > +igt@kms_atomic@test-only,pass
> > +igt@kms_atomic@plane-cursor-legacy,pass
> > +igt@kms_atomic@plane-invalid-params,pass
> > +igt@kms_atomic@plane-invalid-params-fence,skip
> > +igt@kms_atomic@crtc-invalid-params,pass
> > +igt@kms_atomic@crtc-invalid-params-fence,skip
> > +igt@kms_atomic@atomic-invalid-params,pass
> > +igt@kms_atomic@atomic_plane_damage,pass
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@legacy,skip
> > +igt@kms_content_protection@atomic,skip
> > +igt@kms_content_protection@atomic-dpms,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_content_protection@type1,skip
> > +igt@kms_content_protection@mei_interface,skip
> > +igt@kms_content_protection@content_type_change,skip
> > +igt@kms_content_protection@uevent,skip
> > +igt@kms_content_protection@srm,skip
> > +igt@kms_content_protection@dp-mst-type-0,skip
> > +igt@kms_content_protection@dp-mst-lic-type-0,skip
> > +igt@kms_content_protection@dp-mst-type-1,skip
> > +igt@kms_content_protection@dp-mst-lic-type-1,skip
> > +igt@kms_dp_aux_dev,skip
> > +igt@kms_flip_event_leak,pass
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb-reject-ccs,skip
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-accept-ccs,skip
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,skip
> > +igt@kms_hdmi_inject@inject-audio,skip
> > +igt@kms_hdr@bpc-switch,skip
> > +igt@kms_hdr@bpc-switch-dpms,skip
> > +igt@kms_hdr@static-toggle,skip
> > +igt@kms_hdr@static-toggle-dpms,skip
> > +igt@kms_hdr@static-swap,skip
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
> > +igt@kms_pipe_crc_basic@bad-source,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,pass
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-4,skip
> > +igt@kms_prop_blob@basic,pass
> > +igt@kms_prop_blob@blob-prop-core,pass
> > +igt@kms_prop_blob@blob-prop-validate,pass
> > +igt@kms_prop_blob@blob-prop-lifetime,pass
> > +igt@kms_prop_blob@blob-multiple,pass
> > +igt@kms_prop_blob@invalid-get-prop-any,pass
> > +igt@kms_prop_blob@invalid-get-prop,pass
> > +igt@kms_prop_blob@invalid-set-prop-any,pass
> > +igt@kms_prop_blob@invalid-set-prop,pass
> > +igt@kms_rmfb@rmfb-ioctl,pass
> > +igt@kms_rmfb@close-fd,fail
> > +igt@kms_rotation_crc@primary-rotation-90,skip
> > +igt@kms_rotation_crc@primary-rotation-180,skip
> > +igt@kms_rotation_crc@primary-rotation-270,skip
> > +igt@kms_rotation_crc@sprite-rotation-90,skip
> > +igt@kms_rotation_crc@sprite-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-270,skip
> > +igt@kms_rotation_crc@cursor-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-90-pos-100-0,skip
> > +igt@kms_rotation_crc@bad-pixel-format,skip
> > +igt@kms_rotation_crc@bad-tiling,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@multiplane-rotation,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-top,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-bottom,skip
> > +igt@kms_rotation_crc@exhaust-fences,skip
> > +igt@kms_selftest@all,skip
> > +igt@kms_setmode@basic@pipe-a-edp-1,pass
> > +igt@kms_setmode@basic@pipe-b-edp-1,pass
> > +igt@kms_setmode@basic-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-exclusive-crtc,skip
> > +igt@kms_setmode@clone-exclusive-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc-stealing,skip
> > +igt@msm_mapping@sqefw,dmesg-fail
> > +igt@msm_mapping@shadow,dmesg-fail
> > +igt@msm_recovery@hangcheck,dmesg-warn
> > +igt@msm_recovery@gpu-fault,dmesg-warn
> > +igt@msm_recovery@iova-fault,dmesg-warn
> > +igt@msm_submit@empty-submit,pass
> > +igt@msm_submit@invalid-queue-submit,pass
> > +igt@msm_submit@invalid-flags-submit,pass
> > +igt@msm_submit@invalid-in-fence-submit,pass
> > +igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
> > +igt@msm_submit@valid-submit,pass
> > +igt@kms_sysfs_edid_timing,pass
> > +igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-a-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,pass
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,fail
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-c,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-d,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-e,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-f,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-f,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-f,skip
> > +igt@kms_vblank@invalid,pass
> > +igt@kms_vblank@crtc-id,pass
> > +igt@kms_vblank@pipe-a-query-idle,pass
> > +igt@kms_vblank@pipe-a-query-idle-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked,pass
> > +igt@kms_vblank@pipe-a-query-forked-hang,skip
> > +igt@kms_vblank@pipe-a-query-busy,pass
> > +igt@kms_vblank@pipe-a-query-busy-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy,pass
> > +igt@kms_vblank@pipe-a-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-idle,pass
> > +igt@kms_vblank@pipe-a-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked,pass
> > +igt@kms_vblank@pipe-a-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-a-wait-busy,pass
> > +igt@kms_vblank@pipe-a-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy,pass
> > +igt@kms_vblank@pipe-a-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,pass
> > +igt@kms_vblank@pipe-a-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,pass
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-b-accuracy-idle,pass
> > +igt@kms_vblank@pipe-b-query-idle,pass
> > +igt@kms_vblank@pipe-b-query-idle-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked,pass
> > +igt@kms_vblank@pipe-b-query-forked-hang,skip
> > +igt@kms_vblank@pipe-b-query-busy,pass
> > +igt@kms_vblank@pipe-b-query-busy-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy,pass
> > +igt@kms_vblank@pipe-b-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-idle,pass
> > +igt@kms_vblank@pipe-b-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked,pass
> > +igt@kms_vblank@pipe-b-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-b-wait-busy,pass
> > +igt@kms_vblank@pipe-b-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy,pass
> > +igt@kms_vblank@pipe-b-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,pass
> > +igt@kms_vblank@pipe-b-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,pass
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-c-accuracy-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked,skip
> > +igt@kms_vblank@pipe-c-query-forked-hang,skip
> > +igt@kms_vblank@pipe-c-query-busy,skip
> > +igt@kms_vblank@pipe-c-query-busy-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-idle,skip
> > +igt@kms_vblank@pipe-c-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked,skip
> > +igt@kms_vblank@pipe-c-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-c-wait-busy,skip
> > +igt@kms_vblank@pipe-c-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-d-accuracy-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked,skip
> > +igt@kms_vblank@pipe-d-query-forked-hang,skip
> > +igt@kms_vblank@pipe-d-query-busy,skip
> > +igt@kms_vblank@pipe-d-query-busy-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-idle,skip
> > +igt@kms_vblank@pipe-d-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked,skip
> > +igt@kms_vblank@pipe-d-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-d-wait-busy,skip
> > +igt@kms_vblank@pipe-d-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-e-accuracy-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked,skip
> > +igt@kms_vblank@pipe-e-query-forked-hang,skip
> > +igt@kms_vblank@pipe-e-query-busy,skip
> > +igt@kms_vblank@pipe-e-query-busy-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-idle,skip
> > +igt@kms_vblank@pipe-e-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked,skip
> > +igt@kms_vblank@pipe-e-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-e-wait-busy,skip
> > +igt@kms_vblank@pipe-e-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-f-accuracy-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked,skip
> > +igt@kms_vblank@pipe-f-query-forked-hang,skip
> > +igt@kms_vblank@pipe-f-query-busy,skip
> > +igt@kms_vblank@pipe-f-query-busy-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-idle,skip
> > +igt@kms_vblank@pipe-f-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked,skip
> > +igt@kms_vblank@pipe-f-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-f-wait-busy,skip
> > +igt@kms_vblank@pipe-f-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-rpm,skip
> > +igt@kms_vrr@flip-basic,skip
> > +igt@kms_vrr@flip-dpms,skip
> > +igt@kms_vrr@flipline,skip
> > +igt@kms_async_flip@async-flip-with-page-flip-events,skip
> > +igt@kms_async_flip@alternate-sync-async-flip,skip
> > +igt@kms_async_flip@test-time-stamp,skip
> > +igt@kms_async_flip@test-cursor,skip
> > +igt@kms_async_flip@invalid-async-flip,skip
> > +igt@kms_async_flip@crc,skip
> > diff --git a/drivers/gpu/drm/msm/ci/msm_a630_results.txt b/drivers/gpu/=
drm/msm/ci/msm_a630_results.txt
> > new file mode 100644
> > index 000000000000..18ebfae09f1a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_a630_results.txt
> > @@ -0,0 +1,422 @@
> > +igt@core_auth@getclient-simple,dmesg-warn
> > +igt@core_auth@getclient-master-drop,pass
> > +igt@core_auth@basic-auth,pass
> > +igt@core_auth@many-magics,pass
> > +igt@core_getclient,pass
> > +igt@core_getstats,pass
> > +igt@core_getversion,pass
> > +igt@core_setmaster_vs_auth,pass
> > +igt@drm_read@invalid-buffer,pass
> > +igt@drm_read@fault-buffer,pass
> > +igt@drm_read@empty-block,pass
> > +igt@drm_read@empty-nonblock,pass
> > +igt@drm_read@short-buffer-block,pass
> > +igt@drm_read@short-buffer-nonblock,pass
> > +igt@drm_read@short-buffer-wakeup,pass
> > +igt@kms_addfb_basic@unused-handle,pass
> > +igt@kms_addfb_basic@unused-pitches,pass
> > +igt@kms_addfb_basic@unused-offsets,pass
> > +igt@kms_addfb_basic@unused-modifier,pass
> > +igt@kms_addfb_basic@clobberred-modifier,skip
> > +igt@kms_addfb_basic@invalid-smem-bo-on-discrete,skip
> > +igt@kms_addfb_basic@legacy-format,dmesg-warn
> > +igt@kms_addfb_basic@no-handle,pass
> > +igt@kms_addfb_basic@basic,pass
> > +igt@kms_addfb_basic@bad-pitch-0,pass
> > +igt@kms_addfb_basic@bad-pitch-32,pass
> > +igt@kms_addfb_basic@bad-pitch-63,pass
> > +igt@kms_addfb_basic@bad-pitch-128,pass
> > +igt@kms_addfb_basic@bad-pitch-256,pass
> > +igt@kms_addfb_basic@bad-pitch-1024,pass
> > +igt@kms_addfb_basic@bad-pitch-999,pass
> > +igt@kms_addfb_basic@bad-pitch-65536,pass
> > +igt@kms_addfb_basic@size-max,pass
> > +igt@kms_addfb_basic@too-wide,pass
> > +igt@kms_addfb_basic@too-high,dmesg-warn
> > +igt@kms_addfb_basic@bo-too-small,pass
> > +igt@kms_addfb_basic@small-bo,pass
> > +igt@kms_addfb_basic@bo-too-small-due-to-tiling,skip
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,dmesg-warn
> > +igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy,skip
> > +igt@kms_addfb_basic@addfb25-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-yf-tiled-legacy,skip
> > +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy,skip
> > +igt@kms_addfb_basic@addfb25-4-tiled,skip
> > +igt@kms_addfb_basic@basic-x-tiled-legacy,skip
> > +igt@kms_addfb_basic@framebuffer-vs-set-tiling,skip
> > +igt@kms_addfb_basic@tile-pitch-mismatch,skip
> > +igt@kms_addfb_basic@basic-y-tiled-legacy,skip
> > +igt@kms_addfb_basic@invalid-get-prop-any,pass
> > +igt@kms_addfb_basic@invalid-get-prop,pass
> > +igt@kms_addfb_basic@invalid-set-prop-any,pass
> > +igt@kms_addfb_basic@invalid-set-prop,pass
> > +igt@kms_addfb_basic@master-rmfb,pass
> > +igt@kms_atomic@plane-overlay-legacy,dmesg-warn
> > +igt@kms_atomic@plane-primary-legacy,dmesg-warn
> > +igt@kms_atomic@plane-primary-overlay-mutable-zpos,dmesg-warn
> > +igt@kms_atomic@plane-immutable-zpos,dmesg-warn
> > +igt@kms_atomic@test-only,dmesg-warn
> > +igt@kms_atomic@plane-cursor-legacy,dmesg-warn
> > +igt@kms_atomic@plane-invalid-params,dmesg-warn
> > +igt@kms_atomic@plane-invalid-params-fence,skip
> > +igt@kms_atomic@crtc-invalid-params,dmesg-warn
> > +igt@kms_atomic@crtc-invalid-params-fence,skip
> > +igt@kms_atomic@atomic-invalid-params,dmesg-warn
> > +igt@kms_atomic@atomic_plane_damage,dmesg-warn
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@legacy,skip
> > +igt@kms_content_protection@atomic,skip
> > +igt@kms_content_protection@atomic-dpms,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_content_protection@type1,skip
> > +igt@kms_content_protection@mei_interface,skip
> > +igt@kms_content_protection@content_type_change,skip
> > +igt@kms_content_protection@uevent,skip
> > +igt@kms_content_protection@srm,skip
> > +igt@kms_content_protection@dp-mst-type-0,skip
> > +igt@kms_content_protection@dp-mst-lic-type-0,skip
> > +igt@kms_content_protection@dp-mst-type-1,skip
> > +igt@kms_content_protection@dp-mst-lic-type-1,skip
> > +igt@kms_dp_aux_dev,skip
> > +igt@kms_flip_event_leak,dmesg-warn
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb-reject-ccs,skip
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-accept-ccs,skip
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,skip
> > +igt@kms_hdmi_inject@inject-audio,skip
> > +igt@kms_hdr@bpc-switch,skip
> > +igt@kms_hdr@bpc-switch-dpms,skip
> > +igt@kms_hdr@static-toggle,skip
> > +igt@kms_hdr@static-toggle-dpms,skip
> > +igt@kms_hdr@static-swap,skip
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,pass
> > +igt@kms_pipe_crc_basic@bad-source,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,dmesg-warn
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,dmesg-warn
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-c,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-d,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-e,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@hang-read-crc-pipe-f,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-a-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-b-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-c-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-d-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-e-tiling-4,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-none,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-x,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-y,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-yf,skip
> > +igt@kms_plane_lowres@pipe-f-tiling-4,skip
> > +igt@kms_prop_blob@basic,pass
> > +igt@kms_prop_blob@blob-prop-core,pass
> > +igt@kms_prop_blob@blob-prop-validate,pass
> > +igt@kms_prop_blob@blob-prop-lifetime,pass
> > +igt@kms_prop_blob@blob-multiple,pass
> > +igt@kms_prop_blob@invalid-get-prop-any,pass
> > +igt@kms_prop_blob@invalid-get-prop,pass
> > +igt@kms_prop_blob@invalid-set-prop-any,pass
> > +igt@kms_prop_blob@invalid-set-prop,pass
> > +igt@kms_rmfb@rmfb-ioctl,pass
> > +igt@kms_rmfb@close-fd,fail
> > +igt@kms_rotation_crc@primary-rotation-90,skip
> > +igt@kms_rotation_crc@primary-rotation-180,skip
> > +igt@kms_rotation_crc@primary-rotation-270,skip
> > +igt@kms_rotation_crc@sprite-rotation-90,skip
> > +igt@kms_rotation_crc@sprite-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-270,skip
> > +igt@kms_rotation_crc@cursor-rotation-180,skip
> > +igt@kms_rotation_crc@sprite-rotation-90-pos-100-0,skip
> > +igt@kms_rotation_crc@bad-pixel-format,skip
> > +igt@kms_rotation_crc@bad-tiling,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-x-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-y-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-0,skip
> > +igt@kms_rotation_crc@primary-4-tiled-reflect-x-180,skip
> > +igt@kms_rotation_crc@multiplane-rotation,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-top,skip
> > +igt@kms_rotation_crc@multiplane-rotation-cropping-bottom,skip
> > +igt@kms_rotation_crc@exhaust-fences,skip
> > +igt@kms_selftest@all,skip
> > +igt@kms_setmode@basic@pipe-a-edp-1,dmesg-warn
> > +igt@kms_setmode@basic,skip
> > +igt@kms_setmode@basic-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc,skip
> > +igt@kms_setmode@invalid-clone-exclusive-crtc,skip
> > +igt@kms_setmode@clone-exclusive-crtc,skip
> > +igt@kms_setmode@invalid-clone-single-crtc-stealing,skip
> > +igt@msm_mapping@sqefw,dmesg-fail
> > +igt@msm_mapping@shadow,dmesg-fail
> > +igt@msm_recovery@hangcheck,dmesg-warn
> > +igt@msm_recovery@gpu-fault,dmesg-warn
> > +igt@msm_recovery@iova-fault,dmesg-warn
> > +igt@msm_submit@empty-submit,pass
> > +igt@msm_submit@invalid-queue-submit,pass
> > +igt@msm_submit@invalid-flags-submit,pass
> > +igt@msm_submit@invalid-in-fence-submit,pass
> > +igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
> > +igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
> > +igt@msm_submit@valid-submit,pass
> > +igt@kms_sysfs_edid_timing,pass
> > +igt@kms_universal_plane@universal-plane-pipe-a-functional,dmesg-fail
> > +igt@kms_universal_plane@universal-plane-pipe-a-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,dmesg-warn
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-a,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-b-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-b,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-c-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-c,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-c,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-d-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-d,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-d,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-e-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-e,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-e,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-functional,skip
> > +igt@kms_universal_plane@universal-plane-pipe-f-sanity,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-f,skip
> > +igt@kms_universal_plane@cursor-fb-leak-pipe-f,skip
> > +igt@kms_universal_plane@universal-plane-gen9-features-pipe-f,skip
> > +igt@kms_vblank@invalid,dmesg-warn
> > +igt@kms_vblank@crtc-id,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-idle,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-idle-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-forked-hang,skip
> > +igt@kms_vblank@pipe-a-query-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-busy-hang,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-idle,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-a-wait-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,dmesg-warn
> > +igt@kms_vblank@pipe-a-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,dmesg-warn
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-b-accuracy-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked,skip
> > +igt@kms_vblank@pipe-b-query-forked-hang,skip
> > +igt@kms_vblank@pipe-b-query-busy,skip
> > +igt@kms_vblank@pipe-b-query-busy-hang,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-idle,skip
> > +igt@kms_vblank@pipe-b-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked,skip
> > +igt@kms_vblank@pipe-b-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-b-wait-busy,skip
> > +igt@kms_vblank@pipe-b-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-c-accuracy-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle,skip
> > +igt@kms_vblank@pipe-c-query-idle-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked,skip
> > +igt@kms_vblank@pipe-c-query-forked-hang,skip
> > +igt@kms_vblank@pipe-c-query-busy,skip
> > +igt@kms_vblank@pipe-c-query-busy-hang,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy,skip
> > +igt@kms_vblank@pipe-c-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-idle,skip
> > +igt@kms_vblank@pipe-c-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked,skip
> > +igt@kms_vblank@pipe-c-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-c-wait-busy,skip
> > +igt@kms_vblank@pipe-c-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-c-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-d-accuracy-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle,skip
> > +igt@kms_vblank@pipe-d-query-idle-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked,skip
> > +igt@kms_vblank@pipe-d-query-forked-hang,skip
> > +igt@kms_vblank@pipe-d-query-busy,skip
> > +igt@kms_vblank@pipe-d-query-busy-hang,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy,skip
> > +igt@kms_vblank@pipe-d-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-idle,skip
> > +igt@kms_vblank@pipe-d-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked,skip
> > +igt@kms_vblank@pipe-d-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-d-wait-busy,skip
> > +igt@kms_vblank@pipe-d-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-d-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-e-accuracy-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle,skip
> > +igt@kms_vblank@pipe-e-query-idle-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked,skip
> > +igt@kms_vblank@pipe-e-query-forked-hang,skip
> > +igt@kms_vblank@pipe-e-query-busy,skip
> > +igt@kms_vblank@pipe-e-query-busy-hang,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy,skip
> > +igt@kms_vblank@pipe-e-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-idle,skip
> > +igt@kms_vblank@pipe-e-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked,skip
> > +igt@kms_vblank@pipe-e-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-e-wait-busy,skip
> > +igt@kms_vblank@pipe-e-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-e-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-e-ts-continuation-modeset-rpm,skip
> > +igt@kms_vblank@pipe-f-accuracy-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle,skip
> > +igt@kms_vblank@pipe-f-query-idle-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked,skip
> > +igt@kms_vblank@pipe-f-query-forked-hang,skip
> > +igt@kms_vblank@pipe-f-query-busy,skip
> > +igt@kms_vblank@pipe-f-query-busy-hang,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy,skip
> > +igt@kms_vblank@pipe-f-query-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-idle,skip
> > +igt@kms_vblank@pipe-f-wait-idle-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked,skip
> > +igt@kms_vblank@pipe-f-wait-forked-hang,skip
> > +igt@kms_vblank@pipe-f-wait-busy,skip
> > +igt@kms_vblank@pipe-f-wait-busy-hang,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-f-wait-forked-busy-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-idle-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-dpms-rpm,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-hang,skip
> > +igt@kms_vblank@pipe-f-ts-continuation-modeset-rpm,skip
> > +igt@kms_vrr@flip-basic,skip
> > +igt@kms_vrr@flip-dpms,skip
> > +igt@kms_vrr@flipline,skip
> > +igt@kms_async_flip@async-flip-with-page-flip-events,skip
> > +igt@kms_async_flip@alternate-sync-async-flip,skip
> > +igt@kms_async_flip@test-time-stamp,skip
> > +igt@kms_async_flip@test-cursor,skip
> > +igt@kms_async_flip@invalid-async-flip,skip
> > +igt@kms_async_flip@crc,skip
>
> --
> Jani Nikula, Intel Open Source Graphics Center
