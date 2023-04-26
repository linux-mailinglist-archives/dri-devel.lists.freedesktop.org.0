Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD7A6EF873
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 18:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A56F10E694;
	Wed, 26 Apr 2023 16:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEE910E694
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 16:29:35 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-32b437f4607so19610575ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682526574; x=1685118574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIDVwkBe6JgOdUFARGozlMNyy0dDCnMU/+lG8y5/nQs=;
 b=HhH07mrJyVPtG+A5yd+gCDQTNCaWN0cP1T+mOlyXKoDKPqFFksp35Db/YKxiBoQpl2
 HFmTTsdj20uGHkBhRB0xifTgmU6xN08rxUkxt+3ziH+SbP+/GiL8uZdIS53O6SmbGFvp
 t3IQ3BWxW9UtdGB8ixKBblxlfcjreuYdRjUGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526574; x=1685118574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIDVwkBe6JgOdUFARGozlMNyy0dDCnMU/+lG8y5/nQs=;
 b=Faat++MwhZLFgZSJ3lvPcLYdDaINTO12285wgEbgdgxPhUSapUw7MYm/YSTxo0/g6c
 lw6vFOMc6gMaPzYFLcX0jw8sbizTcfu1w1+pM9W2PA6vRbeamVnH/ksOSuacDBDUkxp3
 C4Z9MAHarT7EY/A0YwLMYG6J5gt2N/4jD4LFoOj3ex125xEjiyCTeVtdIbnb9aywR6f+
 +v7a/CEjLKu97bAFX2duYbyhvDDvqhvTraiV8nEfHQvgCesTTe+9Uzq4I/Mjr7+6qjHD
 4nArRNUEYGo5othcnC43gI2F56uAUcFvZedMUVyaz4o/FyeVm+Sd6YjeT4zwbf5GKYyv
 s88g==
X-Gm-Message-State: AAQBX9fAyQkImWB6P7LCpuKsgFDIaWpmZIltYkTeySDQBWZa8D+6xOdW
 w8j6S9N4qEBSee4XYQZfHV5L/zgiAZhYiSqFie8=
X-Google-Smtp-Source: AKy350blMenZTRgCwaA50x1cMjKJ41UQezi4D3DXX6Jf4oUQ5GT5L1k4KCK/srAHk3iKGqfZhJX3Bw==
X-Received: by 2002:a92:d20a:0:b0:32a:db9c:8044 with SMTP id
 y10-20020a92d20a000000b0032adb9c8044mr11004443ily.29.1682526573801; 
 Wed, 26 Apr 2023 09:29:33 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173]) by smtp.gmail.com with ESMTPSA id
 ch17-20020a0566383e9100b0040380d7c768sm5001065jab.106.2023.04.26.09.29.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 09:29:29 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-316d901b2ecso286925ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 09:29:28 -0700 (PDT)
X-Received: by 2002:a05:6e02:1e0a:b0:32b:1de1:17de with SMTP id
 g10-20020a056e021e0a00b0032b1de117demr419402ila.2.1682526568182; Wed, 26 Apr
 2023 09:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230419154321.1993419-1-markyacoub@google.com>
In-Reply-To: <20230419154321.1993419-1-markyacoub@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Apr 2023 09:29:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1+PMH3YGOcnvziOC7-_NY1yO4w=b4q2RLCdtEtETB3Q@mail.gmail.com>
Message-ID: <CAD=FV=V1+PMH3YGOcnvziOC7-_NY1yO4w=b4q2RLCdtEtETB3Q@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, seanpaul@chromium.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 19, 2023 at 8:43=E2=80=AFAM Mark Yacoub <markyacoub@chromium.or=
g> wrote:
>
> Hi all,
> This is v10 of the HDCP patches. The patches are authored by Sean Paul.
> I rebased and addressed the review comments in v6-v10.
>
> Main change in v10 is handling the kernel test bot warnings.
>
> Patches 1-4 focus on moving the common HDCP helpers to common DRM.
> This introduces a slight change in the original intel flow
> as it splits the unique driver protocol from the generic implementation.
>
> Patches 5-7 split the HDCP flow on the i915 driver to make use of the com=
mon DRM helpers.
>
> Patches 8-10 implement HDCP on MSM driver.
>
> Thanks,
> -Mark Yacoub
>
> Sean Paul (10):
>   drm/hdcp: Add drm_hdcp_atomic_check()
>   drm/hdcp: Avoid changing crtc state in hdcp atomic check
>   drm/hdcp: Update property value on content type and user changes
>   drm/hdcp: Expand HDCP helper library for enable/disable/check
>   drm/i915/hdcp: Consolidate HDCP setup/state cache
>   drm/i915/hdcp: Retain hdcp_capable return codes
>   drm/i915/hdcp: Use HDCP helpers for i915
>   dt-bindings: msm/dp: Add bindings for HDCP registers
>   arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
>   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
>
>  .../bindings/display/msm/dp-controller.yaml   |    7 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
>  drivers/gpu/drm/display/drm_hdcp_helper.c     | 1224 +++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_atomic.c   |    8 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   32 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   12 +-
>  .../drm/i915/display/intel_display_types.h    |   51 +-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  352 ++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   16 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1060 +++-----------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   48 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  267 ++--
>  drivers/gpu/drm/msm/Kconfig                   |    1 +
>  drivers/gpu/drm/msm/Makefile                  |    1 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c           |  156 +++
>  drivers/gpu/drm/msm/dp/dp_catalog.h           |   18 +
>  drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
>  drivers/gpu/drm/msm/dp/dp_debug.h             |   11 +-
>  drivers/gpu/drm/msm/dp/dp_display.c           |   39 +-
>  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |   39 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h               |    7 +
>  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  389 ++++++
>  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   33 +
>  drivers/gpu/drm/msm/dp/dp_parser.c            |   14 +
>  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>  drivers/gpu/drm/msm/dp/dp_reg.h               |   30 +-
>  drivers/gpu/drm/msm/msm_atomic.c              |   19 +
>  include/drm/display/drm_hdcp.h                |  296 ++++
>  include/drm/display/drm_hdcp_helper.h         |   23 +
>  30 files changed, 2867 insertions(+), 1349 deletions(-)

Mark asked me if I had any advice for getting this patch series
landed. I haven't been following the patch series super closely, but
as I understand it:

1. The first several patches (the generic ones) seem fairly well
reviewed and haven't changed in any significant ways in a while. The
ideal place to land these would be drm-misc, I think.

2. The i915 patches also seem OK to land. The ideal place would be the
Intel DRM tree, I think.

3. The msm patches are not fully baked yet. Not only is there a kernel
bot complaint on patch #10, but Mark also said that comments from v6
haven't yet fully been addressed and he's talked with Dmitry on IRC
about this and has a plan to move forward.


The question becomes: can/should we land the generic and maybe the
i915 patches now while the msm patches are reworked. Do folks have an
opinion here? If we're OK landing some of the patches, I guess we have
a few options:

a) Just land the generic patches to drm-misc and put the i915 ones on
the backburner until drm-misc has made it to somewhere that the
drm-intel tree is based on. If we want to go this route and nobody
objects, I don't mind being the person who does the gruntwork of
actually landing them on drm-misc-next, though I certainly wouldn't
rush to make sure that nobody is unhappy with this idea.

b) Land the generic patches in some type of immutable branch so they
can be pulled into drm-misc and the Intel DRM tree. Someone more
senior to me would need to help with this, but if we really want to go
this way I can poke folks on IRC.

c) Land the generic and Intel patches in the Intel tree. The msm
patches would not be able to land until these trickled up the chain,
but the msm patches aren't fully ready yet anyway so maybe this is OK.

d) Land the generic and Intel patches in the drm-misc tree. If folks
are OK with this I can be the person to pull the trigger, but I'd want
to be very sure that Intel DRM folks are on board. :-)


My preference would be c), then d), then a), then b). ...this is all
assuming, of course, that nobody on this thread objects to landing the
generic/i195 patches now.


-Doug
