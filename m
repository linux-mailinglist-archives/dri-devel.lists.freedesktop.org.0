Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA5522564
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63910E2E5;
	Tue, 10 May 2022 20:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF79110E2E3;
 Tue, 10 May 2022 20:26:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t6so189304wra.4;
 Tue, 10 May 2022 13:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rRLHZFvGAKNWrvNc+yje96tlPVKCbZmRpHAoiSJ6gDQ=;
 b=ma7u8UVWnUFexllWVRd97T5TgU78Wn+divIk+hVeZqNLLkwl4nZ29lzRKoY1cXp8sZ
 J9DXCz3dOrYT37W0YppghJ5FEEDHoqN1W2ySrVTmRho86CZp/PwnYU1zgm+Bqs+R6b/4
 PV31rgIIz34cRRpY6MUvRIMOyhzBPnWOP19XJsb3asWI5GsMaHjZ6SFczS1asgn2PCMu
 3Dao8GslgNv53Ae+TkY4IYTwa68jTmS20p3+TY5MJhNaJsNr+SCLdP9tEQ9gduQgsAU5
 CwL7s96w2xqps6JX6S4o4s8HLxJvv+9wMyECKc/vC1KANYVYf3ZfFVECc/iLfsSmSomE
 kF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rRLHZFvGAKNWrvNc+yje96tlPVKCbZmRpHAoiSJ6gDQ=;
 b=o/LBL4/r0/kfBt1ew8B8eE0XNfPNrSWu+YIFstQazbrS5sJJ4y8Bhq+ScG0m2Oy+LF
 8lNH4p+Ulv0HrrrW8vYmarvpSaJiIeD1ti9xfCJdjN+N5xx3uC6h+V9xnMayrgCeXpuU
 mhRE7uxEilW2ipuw2aTkUmxJcIusaucNWi2a5r/tnNcfq8O9vtGyfeg6oBK+w5C63GXw
 R1MRcHigaq/h7acZETk6rEhtsu+cFUQR9U52rHr4GXI2D6Ad2H5p1hf2c/n3wvWLStRp
 dJmDLzZtiFPAuI47N//RdpWd7m+UJsnQINbef6iyLN5jFoALI9yn59plrt19srYS/sBv
 t03g==
X-Gm-Message-State: AOAM530bhqad2h7f+WhNzhfepzZfSXyO+Feqw3VsF96HrtfCAuHD8Hgo
 uETRx6kTR/dVD4Jg3zNAxkBnd89dO3no0vPb1n8=
X-Google-Smtp-Source: ABdhPJxO5OAvbhj7prhS2VtXsB9V63DU6ThVb3m8EAZFBefu6yatMkjcJ3XEmHSWF2dtLbkQUF7sSq0W9MHu9DmTVO4=
X-Received: by 2002:adf:d1ec:0:b0:20c:6228:e2c8 with SMTP id
 g12-20020adfd1ec000000b0020c6228e2c8mr20720150wrd.328.1652214365983; Tue, 10
 May 2022 13:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <e4e03cd8-3ebc-e5e1-e7d0-6bdc038049b5@quicinc.com>
In-Reply-To: <e4e03cd8-3ebc-e5e1-e7d0-6bdc038049b5@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 May 2022 13:25:50 -0700
Message-ID: <CAF6AEGueadnRMiatO3MoHS+NTQ1o1sgcV0cVjJM3iu-6JUNmNw@mail.gmail.com>
Subject: Re: [Freedreno] [RFC v2] drm/msm: Add initial ci/ subdirectory
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 12:39 PM Jessica Zhang
<quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 5/10/2022 7:13 AM, Tomeu Vizoso wrote:
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
> >
> > v2:
> >    - Fix names of result expectation files to match SoC
> >    - Don't execute tests that are going to skip on all boards
> >
> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > ---
> >   Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
> >   drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
> >   drivers/gpu/drm/msm/ci/msm.testlist           | 148 +++++++++++++++++=
+
> >   .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 140 +++++++++++++++++
> >   .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 140 +++++++++++++++++
> >   drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 141 +++++++++++++++++
> >   drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 141 +++++++++++++++++
> >   7 files changed, 791 insertions(+)
> >   create mode 100644 Documentation/gpu/msm_automated_testing.rst
> >   create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
> >   create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
> >   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
> >   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
> >   create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> >   create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
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
>
> Hey Tomeu,
>
> I like the overall idea of having this in as part of the repo, but just
> have a few questions on some details.
>
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
> > index 000000000000..8805a3bc7316
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm.testlist
> > @@ -0,0 +1,148 @@
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
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag
> > +igt@kms_addfb_basic@addfb25-bad-modifier
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
> > +igt@kms_atomic@crtc-invalid-params
> > +igt@kms_atomic@atomic-invalid-params
> > +igt@kms_atomic@atomic_plane_damage
> > +igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
> > +igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
>
> I see that there are some KMS subtests/tests are missing such as
> kms_atomic_transition -- are they unstable across all boards?
>
>  From what I've seen, kms_atomic_transition is unstable only on Trogdor,
> but has stable results on other boards.
>
> > +igt@kms_content_protection@LIC > +igt@kms_flip_event_leak
> > +igt@kms_getfb@getfb-handle-zero
> > +igt@kms_getfb@getfb-handle-valid
> > +igt@kms_getfb@getfb-handle-closed
> > +igt@kms_getfb@getfb-handle-not-fb
> > +igt@kms_getfb@getfb-addfb-different-handles
> > +igt@kms_getfb@getfb-repeated-different-handles
> > +igt@kms_getfb@getfb2-handle-zero
> > +igt@kms_getfb@getfb2-handle-closed
> > +igt@kms_getfb@getfb2-handle-not-fb
> > +igt@kms_getfb@getfb2-into-addfb2
> > +igt@kms_getfb@getfb-handle-protection
> > +igt@kms_getfb@getfb2-handle-protection
> > +igt@kms_hdmi_inject@inject-4k > +igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check
> > +igt@kms_pipe_crc_basic@bad-source
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
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
> > +igt@kms_setmode@basic@pipe-a-edp-1
> > +igt@kms_setmode@basic@pipe-b-edp-1
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
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
> > +igt@kms_vblank@invalid
> > +igt@kms_vblank@crtc-id
> > +igt@kms_vblank@pipe-a-query-idle
> > +igt@kms_vblank@pipe-a-query-forked
> > +igt@kms_vblank@pipe-a-query-busy
> > +igt@kms_vblank@pipe-a-query-forked-busy
> > +igt@kms_vblank@pipe-a-wait-idle
> > +igt@kms_vblank@pipe-a-wait-forked
> > +igt@kms_vblank@pipe-a-wait-busy
> > +igt@kms_vblank@pipe-a-wait-forked-busy
> > +igt@kms_vblank@pipe-a-ts-continuation-idle
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset
> > +igt@kms_vblank@pipe-b-accuracy-idle
> > +igt@kms_vblank@pipe-b-query-idle
> > +igt@kms_vblank@pipe-b-query-forked
> > +igt@kms_vblank@pipe-b-query-busy
> > +igt@kms_vblank@pipe-b-query-forked-busy
> > +igt@kms_vblank@pipe-b-wait-idle
> > +igt@kms_vblank@pipe-b-wait-forked
> > +igt@kms_vblank@pipe-b-wait-busy
> > +igt@kms_vblank@pipe-b-wait-forked-busy
> > +igt@kms_vblank@pipe-b-ts-continuation-idle
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset
> > diff --git a/drivers/gpu/drm/msm/ci/msm_apq8016_results.txt b/drivers/g=
pu/drm/msm/ci/msm_apq8016_results.txt
> > new file mode 100644
> > index 000000000000..2cad61d89faf
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
> > @@ -0,0 +1,140 @@
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
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,fail
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
> > +igt@kms_atomic@crtc-invalid-params,skip
> > +igt@kms_atomic@atomic-invalid-params,skip
> > +igt@kms_atomic@atomic_plane_damage,skip
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_flip_event_leak,skip
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,fail
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
> > +igt@kms_pipe_crc_basic@bad-source,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
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
> > +igt@kms_setmode@basic,skip
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
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
> > +igt@kms_vblank@invalid,skip
> > +igt@kms_vblank@crtc-id,skip
> > +igt@kms_vblank@pipe-a-query-idle,skip
> > +igt@kms_vblank@pipe-a-query-forked,skip
> > +igt@kms_vblank@pipe-a-query-busy,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy,skip
> > +igt@kms_vblank@pipe-a-wait-idle,skip
> > +igt@kms_vblank@pipe-a-wait-forked,skip
> > +igt@kms_vblank@pipe-a-wait-busy,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-b-accuracy-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle,skip
> > +igt@kms_vblank@pipe-b-query-forked,skip
> > +igt@kms_vblank@pipe-b-query-busy,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy,skip
> > +igt@kms_vblank@pipe-b-wait-idle,skip
> > +igt@kms_vblank@pipe-b-wait-forked,skip
> > +igt@kms_vblank@pipe-b-wait-busy,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
> > diff --git a/drivers/gpu/drm/msm/ci/msm_apq8096_results.txt b/drivers/g=
pu/drm/msm/ci/msm_apq8096_results.txt
> > new file mode 100644
> > index 000000000000..6f10941e5626
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
> > @@ -0,0 +1,140 @@
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
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,fail
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
> > +igt@kms_atomic@crtc-invalid-params,skip
> > +igt@kms_atomic@atomic-invalid-params,skip
> > +igt@kms_atomic@atomic_plane_damage,skip
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_flip_event_leak,skip
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,dmesg-warn
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
> > +igt@kms_pipe_crc_basic@bad-source,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
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
> > +igt@kms_setmode@basic,skip
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
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
> > +igt@kms_vblank@invalid,skip
> > +igt@kms_vblank@crtc-id,skip
> > +igt@kms_vblank@pipe-a-query-idle,skip
> > +igt@kms_vblank@pipe-a-query-forked,skip
> > +igt@kms_vblank@pipe-a-query-busy,skip
> > +igt@kms_vblank@pipe-a-query-forked-busy,skip
> > +igt@kms_vblank@pipe-a-wait-idle,skip
> > +igt@kms_vblank@pipe-a-wait-forked,skip
> > +igt@kms_vblank@pipe-a-wait-busy,skip
> > +igt@kms_vblank@pipe-a-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
> > +igt@kms_vblank@pipe-b-accuracy-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle,skip
> > +igt@kms_vblank@pipe-b-query-forked,skip
> > +igt@kms_vblank@pipe-b-query-busy,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy,skip
> > +igt@kms_vblank@pipe-b-wait-idle,skip
> > +igt@kms_vblank@pipe-b-wait-forked,skip
> > +igt@kms_vblank@pipe-b-wait-busy,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
> > diff --git a/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt b/drivers/gp=
u/drm/msm/ci/msm_sc7180_results.txt
> > new file mode 100644
> > index 000000000000..01f7b4b399b5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
> > @@ -0,0 +1,141 @@
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
>
> For test results on Trogdor, is is possible to have them be
> success/fail/skip only?
>
> Results such as dmesg-warn/dmesg-fail are igt_runner specific and
> because there isn't support for igt_runner on ChromeOS, they will be
> difficult to replicate and debug.

Actually, I wonder if it would be better to just treat
dmesg-warn/dmesg-fail as pass/fail?  I'd noticed some flakes on
rockchip which looked just like unrelated dmesg msg which just
happened to show up while the test was running.

Additionally, some of the tests, like msm_recovery, are *expected* to
generate some dmesg spam since they are intentionally triggering GPU
hangs to test the recovery mechanism.

BR,
-R

> > +igt@kms_addfb_basic@bo-too-small,pass
> > +igt@kms_addfb_basic@small-bo,pass
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,dmesg-warn
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
> > +igt@kms_atomic@crtc-invalid-params,pass
> > +igt@kms_atomic@atomic-invalid-params,pass
> > +igt@kms_atomic@atomic_plane_damage,pass
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_flip_event_leak,pass
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,skip
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
> > +igt@kms_pipe_crc_basic@bad-source,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,pass
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,pass
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
> > +igt@kms_setmode@basic@pipe-a-edp-1,pass
> > +igt@kms_setmode@basic@pipe-b-edp-1,pass
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
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,pass
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,fail
>
> We could probably skip checking the results for kms_universal_plane on
> Trogdor for now, since this is a test affected by the hack regression.
> There is an IGT patch in the works for fixing the
> disable-primary-vs-flip-pipe-b failure, so it should be updated pretty
> soon too.
>
> Thanks,
> Jessica Zhang
>
> > +igt@kms_vblank@invalid,pass
> > +igt@kms_vblank@crtc-id,pass
> > +igt@kms_vblank@pipe-a-query-idle,pass
> > +igt@kms_vblank@pipe-a-query-forked,pass
> > +igt@kms_vblank@pipe-a-query-busy,pass
> > +igt@kms_vblank@pipe-a-query-forked-busy,pass
> > +igt@kms_vblank@pipe-a-wait-idle,pass
> > +igt@kms_vblank@pipe-a-wait-forked,pass
> > +igt@kms_vblank@pipe-a-wait-busy,pass
> > +igt@kms_vblank@pipe-a-wait-forked-busy,pass
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,pass
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,pass
> > +igt@kms_vblank@pipe-b-accuracy-idle,pass
> > +igt@kms_vblank@pipe-b-query-idle,pass
> > +igt@kms_vblank@pipe-b-query-forked,pass
> > +igt@kms_vblank@pipe-b-query-busy,pass
> > +igt@kms_vblank@pipe-b-query-forked-busy,pass
> > +igt@kms_vblank@pipe-b-wait-idle,pass
> > +igt@kms_vblank@pipe-b-wait-forked,pass
> > +igt@kms_vblank@pipe-b-wait-busy,pass
> > +igt@kms_vblank@pipe-b-wait-forked-busy,pass
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,pass
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,pass
> > diff --git a/drivers/gpu/drm/msm/ci/msm_sdm845_results.txt b/drivers/gp=
u/drm/msm/ci/msm_sdm845_results.txt
> > new file mode 100644
> > index 000000000000..3df1e5ef6d80
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
> > @@ -0,0 +1,141 @@
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
> > +igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
> > +igt@kms_addfb_basic@addfb25-bad-modifier,dmesg-warn
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
> > +igt@kms_atomic@crtc-invalid-params,dmesg-warn
> > +igt@kms_atomic@atomic-invalid-params,dmesg-warn
> > +igt@kms_atomic@atomic_plane_damage,dmesg-warn
> > +igt@kms_atomic_interruptible@legacy-setmode,skip
> > +igt@kms_atomic_interruptible@atomic-setmode,skip
> > +igt@kms_atomic_interruptible@legacy-dpms,skip
> > +igt@kms_atomic_interruptible@legacy-pageflip,skip
> > +igt@kms_atomic_interruptible@legacy-cursor,skip
> > +igt@kms_atomic_interruptible@universal-setplane-primary,skip
> > +igt@kms_atomic_interruptible@universal-setplane-cursor,skip
> > +igt@kms_content_protection@lic,skip
> > +igt@kms_flip_event_leak,dmesg-warn
> > +igt@kms_getfb@getfb-handle-zero,pass
> > +igt@kms_getfb@getfb-handle-valid,pass
> > +igt@kms_getfb@getfb-handle-closed,pass
> > +igt@kms_getfb@getfb-handle-not-fb,pass
> > +igt@kms_getfb@getfb-addfb-different-handles,pass
> > +igt@kms_getfb@getfb-repeated-different-handles,pass
> > +igt@kms_getfb@getfb2-handle-zero,pass
> > +igt@kms_getfb@getfb2-handle-closed,pass
> > +igt@kms_getfb@getfb2-handle-not-fb,pass
> > +igt@kms_getfb@getfb2-into-addfb2,pass
> > +igt@kms_getfb@getfb-handle-protection,pass
> > +igt@kms_getfb@getfb2-handle-protection,pass
> > +igt@kms_hdmi_inject@inject-4k,skip
> > +igt@kms_multipipe_modeset@basic-max-pipe-crc-check,pass
> > +igt@kms_pipe_crc_basic@bad-source,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,pass
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,pass
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,dmesg-warn
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,dmesg-warn
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
> > +igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
> > +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
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
> > +igt@kms_setmode@basic@pipe-a-edp-1,dmesg-warn
> > +igt@kms_setmode@basic,skip
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
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,dmesg-warn
> > +igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
> > +igt@kms_vblank@invalid,dmesg-warn
> > +igt@kms_vblank@crtc-id,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-idle,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-forked,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-query-forked-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-idle,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-forked,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-wait-forked-busy,dmesg-warn
> > +igt@kms_vblank@pipe-a-ts-continuation-idle,dmesg-warn
> > +igt@kms_vblank@pipe-a-ts-continuation-modeset,dmesg-warn
> > +igt@kms_vblank@pipe-b-accuracy-idle,skip
> > +igt@kms_vblank@pipe-b-query-idle,skip
> > +igt@kms_vblank@pipe-b-query-forked,skip
> > +igt@kms_vblank@pipe-b-query-busy,skip
> > +igt@kms_vblank@pipe-b-query-forked-busy,skip
> > +igt@kms_vblank@pipe-b-wait-idle,skip
> > +igt@kms_vblank@pipe-b-wait-forked,skip
> > +igt@kms_vblank@pipe-b-wait-busy,skip
> > +igt@kms_vblank@pipe-b-wait-forked-busy,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-idle,skip
> > +igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
> > --
> > 2.31.1
> >
