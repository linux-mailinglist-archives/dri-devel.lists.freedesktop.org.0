Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447BDA2B7B5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 02:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C7E10E9CE;
	Fri,  7 Feb 2025 01:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ig9cufhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06F510E9CB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 01:18:10 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-307e4e72ef3so4454551fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 17:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738891089; x=1739495889; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AqDBg4JrDbDEdqCVDYeZfUdF14hB1bs2IvGtXbYbNwc=;
 b=Ig9cufhZSh7xF0cQMNoKXuhm5gNOPQ0OabzsxbRnoYbErAdSd8Q8yq1HIi5b1XTUey
 GsSiDr+0B4CXW/s2BFWyq9zVPvbxSPPWO+hnYh7BBf4n6o71pLjIObLQg7EGSSVwweIk
 JK/LMqGnkwZpaLW3fBQy18O/iyz+I+o3AAAJ+aGz87kzu/XraPQvVkpA4TBnru68DPuA
 qVWLfS4D3JoSrtZDhJub6Jixyb8WpSbTF762sSxOxZRY1JAxaK3KfGdxsgNlHmiT04Be
 XGRX3iHnXZkkGYizti3EaIMC8yHOI+ckd0SN1tGIe6kPtxj4CU9XayEW3PilUMg/V3LH
 H2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738891089; x=1739495889;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AqDBg4JrDbDEdqCVDYeZfUdF14hB1bs2IvGtXbYbNwc=;
 b=FVhA35wUkYn3dqWrdJud2/jy0H8qOeeDCSIu2YZ502gv/eRA5L3ZWJiKH+7vD7B4vR
 Yf6AIRpbFrB8qSuJYISq24d9uelVPn4P9AoZoda1+T/1ePHMVqFqqyFHfcxFNljuPeXY
 gIopEGZOO1m685M8U58bsl5KRhkLMk76sm+PQoOgCqtIGGQSWSpSXKH+wAR3YuJYcjy1
 zLT4xUxFtHyFZBPaFrlxtVIkfYISDi7kRA0etqNzisqa3YkH2l5kLLrP5cFKZpqZlgGR
 2G/ZmG2KD+KxkA+wr3vwhDrRIZ0lLsz8HU09BD6hSygkDL5BUzAtnoDmd+I9n5g9oc7y
 t1bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUNvE8Pfh0vXjY30Y3gnFv3aB/qcQlDKtQcP5FIyU/5DPNr5eJ0H9p8ThuVU52h/LNfJXj7kJXaEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVJcnHAYH3nJKigByTchxXenvRknGBJT81A/jzsHMDxZuvZhUo
 tSDGuW/LDt5EsKF4MbjaKITTgn35T3MWIgnEYGrIgxUIrfKfi2oj9ngqBfJaPfs=
X-Gm-Gg: ASbGncvtV4zq0VQ93A8chR/fQwH1pZYay0gFZvApfMeMtthMTgEkW5u/6jHrIIeJ4Kk
 Ql4mGLFbYaYAZ5+rYPXG7uq1Qum+HYfMUrteWV1t81EgerPt/dB1yFiN2q9HAfDbFAcgnPqe25p
 hZjV8QRJZQ/fUfYMCqcfb47JTeccYjo8C2xQ0RS1DxIOpdl3l16TQ9A3HUBUNYMgKUtNXTFY2bz
 cdn8zaHdfxv5Xd6MTCVesJ6F0WU5Cwi6Qlf31EZp2VadjDh9ZbYot5llJ0okulXErgM305e4vIp
 D2dRPrtoGTkZCzYAUy2C19JYZj6/0Dm6yoAJN9/dlgq+P6bcRndp1E0xeqB1r0pgMgYeLR8=
X-Google-Smtp-Source: AGHT+IG2lkzxSmUx82FzbPLQ/hW3rqWO15jMbDm5b1rlxpTED4CetvMVgKiWq8py3ZdXmyuNhOVP3Q==
X-Received: by 2002:a2e:ab19:0:b0:302:2cdf:7fbb with SMTP id
 38308e7fff4ca-307e57cb0bamr3045791fa.6.1738891088835; 
 Thu, 06 Feb 2025 17:18:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de177d0bsm2705741fa.17.2025.02.06.17.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 17:18:08 -0800 (PST)
Date: Fri, 7 Feb 2025 03:18:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 00/14] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Message-ID: <id3mz22ng424ywybruremw7gogbdesqmqyrulvwjwjwjlq3ixe@5t2pu6rcfzae>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <zoswzhubdq7ezxpecz72ki5kloyyedqo232toiol4r7hi244me@52rzudflyl52>
 <cbf66ae4-9f52-4f8f-b569-6a71f8b55a4f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbf66ae4-9f52-4f8f-b569-6a71f8b55a4f@quicinc.com>
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

On Thu, Feb 06, 2025 at 02:45:19PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/29/2025 9:51 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 07:20:32PM -0800, Jessica Zhang wrote:
> > > DPU supports a single writeback session running concurrently with primary
> > > display when the CWB mux is configured properly. This series enables
> > > clone mode for DPU driver and adds support for programming the CWB mux
> > > in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> > > the CWB hardware blocks have only been added to the SM8650
> > > hardware catalog and only DSI has been exposed as a possible_clone of WB.
> > > 
> > > This changes are split into two parts:
> > > 
> > > The first part of the series will pull in Dmitry's patches to refactor
> > > the DPU resource manager to be based off of CRTC instead of encoder.
> > > This includes some changes (noted in the relevant commits) by me and
> > > Abhinav to fix some issues with getting the global state and refactoring
> > > the CDM allocation to work with Dmitry's changes.
> > > 
> > > The second part of the series will add support for CWB by doing the
> > > following:
> > > 
> > > 1) Add the CWB mux to the hardware catalog and clarify the pingpong
> > >     block index enum to specifiy which pingpong blocks are dedicated to
> > >     CWB only and which ones are general use pingpong blocks
> > > 2) Add support for configuring the CWB mux via dpu_hw_cwb ops
> > > 3) Add pending flush support for CWB
> > > 4) Add support for validating clone mode in the DPU CRTC and setting up
> > >     CWB within the encoder
> > > 5) Adjust the encoder trigger flush, trigger start, and kickoff order to
> > >     accomodate clone mode
> > > 6) Adjust when the frame done timer is started for clone mode
> > > 7) Define the possible clones for DPU encoders so that WB encoders can
> > >     be cloned by non-WB encoders
> > > 
> > > The feature was tested on SM8650 using IGT's kms_writeback test with the
> > > following change [1] and dumping the writeback framebuffer when in clone
> > > mode. I haven't gotten the chance to test it on DP yet, but I've
> > > validated both single and dual LM on DSI.
> > > 
> > > To test CWB with IGT, you'll need to apply this series [1] and run the
> > > following command to dump the writeback buffer:
> > > 
> > > IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
> > > ./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \
> > > 
> > > You can also do CRC validation by running this command:
> > > 
> > > ./build/tests/kms_writeback [--run-subtest dump-valid-clones]
> > > 
> > > NOTE: this series depends on Dmitry's modeset fixes [2]
> > > 
> > > [1] https://patchwork.freedesktop.org/series/137933/
> > > [2] https://patchwork.freedesktop.org/series/142905/
> > > 
> > > ---
> > > Changes in v5:
> > > - Rebased onto MSM modeset fixes series (Dmitry)
> > > - Reordered RM refactor patches to prevent breaking CI and to avoid
> > >    breaking when partially applied (Dmitry)
> > > - Switch CWB resource reservation to reserve CWB mux first (Dmitry)
> > > - Reworded commit messages to be clearer (Dmitry)
> > > - Change CDM check to fail only if both DP and WB outputs are
> > >    requesting the CDM block simultaneously (Dmitry)
> > > - Use helper to grab dsc config in dpu_encoder_update_topology
> > > - Link to v4: https://lore.kernel.org/r/20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com
> > > 
> > > Changes in v4:
> > > - Rebased onto latest msm-next
> > > - Added kunit tests for framework changes
> > > - Skip valid clone check for encoders that don't have any possible clones set
> > >    (this is to avoid failing kunit tests, specifically the HDMI state helper tests)
> > > - Link to v3: https://lore.kernel.org/r/20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com
> > > 
> > > Changes in v3:
> > > - Dropped support for CWB on DP connectors for now
> > > - Dropped unnecessary PINGPONG array in *_setup_cwb()
> > > - Add a check to make sure CWB and CDM aren't supported simultaneously
> > >    (Dmitry)
> > > - Document cwb_enabled checks in dpu_crtc_get_topology() (Dmitry)
> > > - Moved implementation of drm_crtc_in_clone_mode() to drm_crtc.c (Jani)
> > > - Dropped duplicate error message for reserving CWB resources (Dmitry)
> > > - Added notes in framework changes about posting a separate series to
> > >    add proper KUnit tests (Maxime)
> > > - Added commit message note addressing Sima's comment on handling
> > >    mode_changed (Dmitry)
> > > - Formatting fixes (Dmitry)
> > > - Added proper kerneldocs (Dmitry)
> > > - Renamed dpu_encoder_helper_get_cwb() -> *_get_cwb_mask() (Dmitry)
> > > - Capitalize all instances of "pingpong" in comments (Dmitry)
> > > - Link to v2: https://lore.kernel.org/r/20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com
> > > 
> > > Changes in v2:
> > > - Moved CWB hardware programming to its own dpu_hw_cwb abstraction
> > >    (Dmitry)
> > > - Reserve and get assigned CWB muxes using RM API and KMS global state
> > >    (Dmitry)
> > > - Dropped requirement to have only one CWB session at a time
> > > - Moved valid clone mode check to DRM framework (Dmitry and Ville)
> > > - Switch to default CWB tap point to LM as the DSPP
> > > - Dropped printing clone mode status in atomic state (Dmitry)
> > > - Call dpu_vbif_clear_errors() before dpu_encoder_kickoff() (Dmitry)
> > > - Squashed setup_input_ctrl() and setup_input_mode() into a single
> > >    dpu_hw_cwb op (Dmitry)
> > > - Moved function comment docs to correct place and fixed wording of
> > >    comments/commit messages (Dmitry)
> > > - Grabbed old CRTC state using proper drm_atomic_state API in
> > >    dpu_crtc_atomic_check() (Dmitry)
> > > - Split HW catalog changes of adding the CWB mux block and changing the
> > >    dedicated CWB pingpong indices into 2 separate commits (Dmitry)
> > > - Moved clearing the dpu_crtc_state.num_mixers to "drm/msm/dpu: fill
> > >    CRTC resources in dpu_crtc.c" (Dmitry)
> > > - Fixed alignment and other formatting issues (Dmitry)
> > > - Link to v1: https://lore.kernel.org/r/20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com
> > > 
> > > ---
> > > Dmitry Baryshkov (3):
> > >        drm/msm/dpu: fill CRTC resources in dpu_crtc.c
> > >        drm/msm/dpu: move resource allocation to CRTC
> > >        drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
> > > 
> > > Jessica Zhang (11):
> > >        drm/msm/dpu: Add CWB to msm_display_topology
> > >        drm/msm/dpu: Require modeset if clone mode status changes
> > >        drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
> > >        drm/msm/dpu: Reserve resources for CWB
> > >        drm/msm/dpu: Configure CWB in writeback encoder
> > >        drm/msm/dpu: Support CWB in dpu_hw_ctl
> > >        drm/msm/dpu: Adjust writeback phys encoder setup for CWB
> > >        drm/msm/dpu: Start frame done timer after encoder kickoff
> > >        drm/msm/dpu: Skip trigger flush and start for CWB
> > >        drm/msm/dpu: Reorder encoder kickoff for CWB
> > >        drm/msm/dpu: Set possible clones for all encoders
> > > 
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 229 +++++++++++-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   3 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 416 ++++++++++++---------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
> > >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 293 ++++++++++-----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  14 +-
> > >   13 files changed, 752 insertions(+), 329 deletions(-)
> > > ---
> > > base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> > > change-id: 20240618-concurrent-wb-97d62387f952
> > > prerequisite-change-id: 20241209-abhinavk-modeset-fix-74864f1de08d:v3
> > > prerequisite-patch-id: a197a0cd4647cb189ea20a96583ea78d0c98b638
> > > prerequisite-patch-id: 112c8f1795cbed989beb02b72561854c0ccd59dd
> > 
> > No, it's not a full list. Please use b4 prep --check-deps to check
> > dependencies. See the following errors:
> 
> Hi Dmitry,
> 
> Ah, I should've put my changes on drm-misc-next instead of trying to pull in
> the merged drm changes on top of msm-next... The deps list is fixed now.

That's not a problem. I think your deps list was missing one series. I
was able to pick up something that made your patches apply cleanly.

> Thanks for the heads up,
> 
> Jessica Zhang
> 
> > 
> > $ b4 shazam -H 20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com
> > Grabbing thread from lore.kernel.org/all/20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com/t.mbox.gz
> > Checking for newer revisions
> > Grabbing search results from lore.kernel.org
> > Analyzing 15 messages in the thread
> > Analyzing 174 code-review messages
> > Checking attestation on all messages, may take a moment...
> > ---
> >    ✓ [PATCH v5 1/14] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
> >    ✓ [PATCH v5 2/14] drm/msm/dpu: move resource allocation to CRTC
> >    ✓ [PATCH v5 3/14] drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
> >    ✓ [PATCH v5 4/14] drm/msm/dpu: Add CWB to msm_display_topology
> >    ✓ [PATCH v5 5/14] drm/msm/dpu: Require modeset if clone mode status changes
> >    ✓ [PATCH v5 6/14] drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
> >    ✓ [PATCH v5 7/14] drm/msm/dpu: Reserve resources for CWB
> >    ✓ [PATCH v5 8/14] drm/msm/dpu: Configure CWB in writeback encoder
> >    ✓ [PATCH v5 9/14] drm/msm/dpu: Support CWB in dpu_hw_ctl
> >    ✓ [PATCH v5 10/14] drm/msm/dpu: Adjust writeback phys encoder setup for CWB
> >    ✓ [PATCH v5 11/14] drm/msm/dpu: Start frame done timer after encoder kickoff
> >    ✓ [PATCH v5 12/14] drm/msm/dpu: Skip trigger flush and start for CWB
> >    ✓ [PATCH v5 13/14] drm/msm/dpu: Reorder encoder kickoff for CWB
> >    ✓ [PATCH v5 14/14] drm/msm/dpu: Set possible clones for all encoders
> >    ---
> >    ✗ No key: ed25519/quic_jesszhan@quicinc.com
> >    ✓ Signed: DKIM/quicinc.com
> > ---
> > Total patches: 14
> > ---
> >   Base: using specified base-commit 86313a9cd152330c634b25d826a281c6a002eb77
> >   Deps: looking for dependencies matching 2 patch-ids
> >   Deps: Applying prerequisite patch: [PATCH v2 1/2] drm: allow encoder mode_set even when connectors change for crtc
> >   Deps: Applying prerequisite patch: [PATCH v3 2/2] drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
> > Magic: Preparing a sparse worktree
> > Unable to cleanly apply series, see failure log below
> > ---
> > Applying: drm: allow encoder mode_set even when connectors change for crtc
> > Applying: drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
> > Applying: drm/msm/dpu: fill CRTC resources in dpu_crtc.c
> > Patch failed at 0003 drm/msm/dpu: fill CRTC resources in dpu_crtc.c
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> > error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1230
> > error: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c: patch does not apply
> > error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:719
> > error: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: patch does not apply
> > hint: Use 'git am --show-current-patch=diff' to see the failed patch
> > 
> > 
> > > 
> > > Best regards,
> > > -- 
> > > Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry
