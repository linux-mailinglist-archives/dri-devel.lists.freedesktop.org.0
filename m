Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5A1DB4A8
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE686E847;
	Wed, 20 May 2020 13:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33D06E843
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:12:15 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id j8so2968778iog.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwLB+XS8V/twBVsuqmDPcRGrpZLTnUmWmiqdd43XxJc=;
 b=cKR10APcTZ6EslpPCRg204pANwqayB77e4VAU1tyasP2DmdPiQtbmLy/1AQdyt0CDc
 9DIT2lZBoKmqOA2Qwj6gHeOqOFbt68JqBc8+zT70hCBoggszyzplMeLXPRrAcuU8x5Gr
 TiHFhwQjvCCQ4NVJsI0952r2LyGzvKP9S8jRkzvjOJiG98LKzmT6FhTvM7It4415Bgrk
 Hx0HEtmSDAmDwVfnyV5iSsyOmbt34w2xN/pVFyOnQZ2+EUPmuiwtG4DHC1RmZ6aCdBoO
 xSTk1nfqal92mW3n2xvWgDCSZRAb0LcxXX8gs4jRx64lRN64DOGF1UAdcMsdPgfqg3p4
 22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwLB+XS8V/twBVsuqmDPcRGrpZLTnUmWmiqdd43XxJc=;
 b=Da+gQnLebgEvJuiXI8T2POBbzNc8Z9FA0W2dlfG0KRPkL7BPXXy8Nz2AP1SbdFIzHJ
 KJfcqBbU+hoDgfxiRw5qv01gIeaKDcuUDV+ISuHQiApojwUzFlq9AGjRisKdP/aUSbwg
 QmB5UmUTrzQhDOT0XLABY9wvCgDLvHXPzkGykFV1vo1kS7CMDUwwI7u5SqJmGx+vfdv8
 Bb4e+yr0VE+ssCGE4c9vvHS3H1UwGOFg/WxSqXUwfQZzjc+1Sp4tgw5K3C0ygB07gTHn
 CeGbmvE2VbGTsnbwsmLdMqUA6QRm2uMSKbzccCPv49ASXdee4sktQIM99uufy5dhM7h4
 u9/A==
X-Gm-Message-State: AOAM533XRcEv2dkFYEIHXodgB9zwfhAJQFz4PYuoFYK58mW97VRoHgFf
 m3YEfvQ9eVDBT410gTdEnSEk+uE9BynSIMV0t9ludw==
X-Google-Smtp-Source: ABdhPJwvS5i+129vMx+jKarCr41FpUoSU+d9Oap1UWrdqUC9A4xgI7LrpFZLLknQTgUXBN9UHt+H2DT8l5ylUI6Zjms=
X-Received: by 2002:a6b:e509:: with SMTP id y9mr3301388ioc.67.1589980335016;
 Wed, 20 May 2020 06:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200429195502.39919-1-sean@poorly.run>
 <20200515144812.GB11877@intel.com>
 <CAMavQKKv-3Wh=9QP=2Bf_FsSVcp4eXxPB9c80nDZwz-Wmvmz=w@mail.gmail.com>
 <20200518164130.GA14897@intel.com>
In-Reply-To: <20200518164130.GA14897@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 20 May 2020 09:11:38 -0400
Message-ID: <CAMavQKL495j9aVj_0_jnwATW-rmyU5V=coBB-keQ78+1bmREUg@mail.gmail.com>
Subject: Re: [PATCH v6 00/16] drm/i915: Add support for HDCP 1.4 over MST
 connectors
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Juston Li <juston.li@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 12:41 PM Ramalingam C <ramalingam.c@intel.com> wrote:
>
> On 2020-05-18 at 10:32:09 -0400, Sean Paul wrote:
> > On Fri, May 15, 2020 at 10:48 AM Ramalingam C <ramalingam.c@intel.com> wrote:
> > >
> > > On 2020-04-29 at 15:54:46 -0400, Sean Paul wrote:
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > Changes in v6:
> > > > -Rebased on -tip
> > > > -Disabled HDCP over MST on GEN12
> > > > -Addressed Lyude's review comments in the QUERY_STREAM_ENCRYPTION_STATUS patch
> > >
> > > Sean,
> > >
> > > What is the test setup you have used?
> > >
> >
> > Hi Ram,
> > Thanks for the feedback. To be completely honest it's really
> > frustrating that I'm just now getting questions and review feedback
> > (which I've been begging for on IRC) on this review that could have
> > been addressed ~5 months ago. It's super disruptive to have to keep
> > switching back to this after a long hiatus and many i915 refactors
> > complicating my rebases.
> Hi Sean,
>
> As a developer I really feel bad for the delay happened in review.
> I couldn't spend required time for understanding MST part hence I
> couldn't review.
>
> Just for this series now I have started preparing myself on these topics,
> hence started reviewing the series.
>
> If you are still interested to work on this, I can commit for regular reviews.
>

Thanks Ram. I'm still incentivized to get this in. Once you have had a
chance to look over the whole series, I'll revise again.

Sean



> Thanks,
> Ram.
> >
> > If no one wants this patchset, that's fine, please just let me know so
> > I don't waste any more time. If Intel is interested, could we please
> > stop the review trickle and lay out exactly what needs to be done to
> > get this landed?
> >
> > Sean
> >
> >
> > > I am afraid our CI dont have the coverage for MST capability yet to provide
> > > the functional status of the code.
> > >
> > > -Ram.
> > > >
> > > > Sean Paul (16):
> > > >   drm/i915: Fix sha_text population code
> > > >   drm/i915: Clear the repeater bit on HDCP disable
> > > >   drm/i915: WARN if HDCP signalling is enabled upon disable
> > > >   drm/i915: Intercept Aksv writes in the aux hooks
> > > >   drm/i915: Use the cpu_transcoder in intel_hdcp to toggle HDCP
> > > >     signalling
> > > >   drm/i915: Factor out hdcp->value assignments
> > > >   drm/i915: Protect workers against disappearing connectors
> > > >   drm/i915: Don't fully disable HDCP on a port if multiple pipes are
> > > >     using it
> > > >   drm/i915: Support DP MST in enc_to_dig_port() function
> > > >   drm/i915: Use ddi_update_pipe in intel_dp_mst
> > > >   drm/i915: Factor out HDCP shim functions from dp for use by dp_mst
> > > >   drm/i915: Plumb port through hdcp init
> > > >   drm/i915: Add connector to hdcp_shim->check_link()
> > > >   drm/mst: Add support for QUERY_STREAM_ENCRYPTION_STATUS MST sideband
> > > >     message
> > > >   drm/i915: Print HDCP version info for all connectors
> > > >   drm/i915: Add HDCP 1.4 support for MST connectors
> > > >
> > > >  drivers/gpu/drm/drm_dp_mst_topology.c         | 142 ++++
> > > >  drivers/gpu/drm/i915/Makefile                 |   1 +
> > > >  drivers/gpu/drm/i915/display/intel_ddi.c      |  29 +-
> > > >  drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
> > > >  .../drm/i915/display/intel_display_debugfs.c  |  21 +-
> > > >  .../drm/i915/display/intel_display_types.h    |  30 +-
> > > >  drivers/gpu/drm/i915/display/intel_dp.c       | 654 +--------------
> > > >  drivers/gpu/drm/i915/display/intel_dp.h       |   9 +
> > > >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 743 ++++++++++++++++++
> > > >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  19 +
> > > >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 217 +++--
> > > >  drivers/gpu/drm/i915/display/intel_hdcp.h     |   2 +-
> > > >  drivers/gpu/drm/i915/display/intel_hdmi.c     |  25 +-
> > > >  .../drm/selftests/test-drm_dp_mst_helper.c    |  17 +
> > > >  include/drm/drm_dp_helper.h                   |   3 +
> > > >  include/drm/drm_dp_mst_helper.h               |  44 ++
> > > >  include/drm/drm_hdcp.h                        |   3 +
> > > >  17 files changed, 1235 insertions(+), 726 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > >
> > > > --
> > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
