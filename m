Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BDE440128
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 19:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9BD6EA82;
	Fri, 29 Oct 2021 17:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C60F6EA82
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635528063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6KkLL2REtCcTJ3EYiPtG6PZeIFE0c1iduujBq53Vr4=;
 b=EmprfksSjpik6VHiDHyYaoM3JTBOpg3ZpNJ2OPKV7afYcsZ/P1jANU8yMTlpgL9fZGQILA
 h3BXQx6huazSPINFL3VN35rBS7E5ke/VwqqjnJgmMp1Qt08YVyKOT4cUS0jrbmCLPPYGhC
 qW85bYghuUUOSeWtmr7E13kHpuGOApw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-08KmeOV2MuKtY3cnfiJsuw-1; Fri, 29 Oct 2021 13:21:01 -0400
X-MC-Unique: 08KmeOV2MuKtY3cnfiJsuw-1
Received: by mail-qv1-f69.google.com with SMTP id
 gs5-20020a056214226500b00382f5609124so8327757qvb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 10:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=/6KkLL2REtCcTJ3EYiPtG6PZeIFE0c1iduujBq53Vr4=;
 b=D0wL1M4DaybbNcy9UlwuhFG/9O1ghcTDSen50TZY4v3cO6KAu/N+9SAM3NlZM2N2Ip
 NIMe9xK/Fp6j+fW1TCVwPwKF6iuI09YkX3uNYQ1mVTVRWNXSLkVj5o+CwnY+Hr3eQJ+n
 5mLtGMei+RSke/qZxNE3tke9dDsTYKOLTkd8/77CXn+k1Yj4JnTRgYdYiKqNXxRVDR4+
 d2+U9N3LmwweYRR3ajBKNZBzJHkNvUzFqqBgdomdfP0Lusc7STDnpJ2WFtI++/LBfrCB
 /Y2OqHzaSK5Wixxt6D8SYLtZkmeRUDG2hOi7d1tKRPCcO+KFXrFlLwt0l+D6QMTSELoD
 bESQ==
X-Gm-Message-State: AOAM531E6NlwMN5RVqa+6jQqsupkN1voTbdEsoSYZIfmCACk+hyVM7Bb
 OrZ51uLi//QmxENXZkdz+TNE1kG9+a6gSMA/PS7eIqvHes0O1Jzo+UfklqtAHz1ecpNY7Gg2jy8
 mXqmsMPtiSdTb+OoNcZICMw67+Luz
X-Received: by 2002:ac8:5f0c:: with SMTP id x12mr13303213qta.309.1635528061060; 
 Fri, 29 Oct 2021 10:21:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVhGn3Nz4iVlNN8qIbkf0g/TuAmLtJcCgKTQxgIwt3qvliu3I0n89YmYIFjUMUEAJr9Ls/RQ==
X-Received: by 2002:ac8:5f0c:: with SMTP id x12mr13303177qta.309.1635528060829; 
 Fri, 29 Oct 2021 10:21:00 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id f39sm1437472qtb.20.2021.10.29.10.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 10:21:00 -0700 (PDT)
Message-ID: <b5974f5e128ea18ff383ac9fcdc9a2c56b2136e9.camel@redhat.com>
Subject: Re: [PULL] topic/amdgpu-dp2.0-mst
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
Date: Fri, 29 Oct 2021 13:20:59 -0400
In-Reply-To: <87pmrodson.fsf@intel.com>
References: <bf8e724cc0c8803d58a8d730fd6883c991376a76.camel@redhat.com>
 <87sfwkdt8w.fsf@intel.com> <87pmrodson.fsf@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

JFYI - the wrapping was because of evolution, sorry about that. Going to make
sure that gets fixed the next time I have to send out a topic branch

On Fri, 2021-10-29 at 13:35 +0300, Jani Nikula wrote:
> On Fri, 29 Oct 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Wed, 27 Oct 2021, Lyude Paul <lyude@redhat.com> wrote:
> > > topic/amdgpu-dp2.0-mst-2021-10-27:
> > > UAPI Changes:
> > > Nope!
> > > 
> > > Cross-subsystem Changes:
> > > drm_dp_update_payload_part1() takes a new argument for specifying what
> > > the
> > > VCPI slot start is
> > > 
> > > Core Changes:
> > > Make the DP MST helpers aware of the current starting VCPI slot/VCPI
> > > total
> > > slot count...
> > > 
> > > Driver Changes:
> > > ...and then add support for taking advantage of this for 128b/132b links
> > > on DP
> > > 2.0 for amdgpu
> > > The following changes since commit
> > > 6f2f7c83303d2227f47551423e507d77d9ea01c7:
> > > 
> > >   Merge tag 'drm-intel-gt-next-2021-10-21' of
> > > git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-10-22
> > > 06:30:34
> > > +1000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://anongit.freedesktop.org/drm/drm-misc tags/topic/amdgpu-dp2.0-
> > > mst-2021-
> > > 10-27
> > 
> > I'm curious, how did you generate and send this pull request? The lines
> > are wrapped with newlines, and you have non-breaking spaces instead of
> > regular spaces there.
> > 
> > So for me this fails with:
> > 
> > Pulling   git://anongit.freedesktop.org/drm/drm-misc tags/topic/amdgpu-
> > dp2.0-mst-2021- 10-27 ...
> > fatal: invalid refspec 'git://anongit.freedesktop.org/drm/drm-misc'
> 
> Fixed manually, but I can't pull this into drm-intel-next directly after
> all, because the baseline is not in drm-intel-next history. The diffstat
> for drm-intel-next is:
> 
> 65 files changed, 3656 insertions(+), 780 deletions(-)
> 
> I asked for this to be a topic branch so I could pull it into
> drm-intel-next. I guess I'll just have to do a drm-next backmerge
> instead.
> 
> BR,
> Jani.
> 
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > 
> > > for you to fetch changes up to 00f965e700ef5aa2d889e7e65c7458531d2a4bcf:
> > > 
> > >   drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not set
> > > (2021-
> > > 10-27 19:50:26 -0400)
> > > 
> > > ----------------------------------------------------------------
> > > UAPI Changes:
> > > Nope!
> > > 
> > > Cross-subsystem Changes:
> > > drm_dp_update_payload_part1() takes a new argument for specifying what
> > > the
> > > VCPI slot start is
> > > 
> > > Core Changes:
> > > Make the DP MST helpers aware of the current starting VCPI slot/VCPI
> > > total
> > > slot count...
> > > 
> > > Driver Changes:
> > > ...and then add support for taking advantage of this for 128b/132b links
> > > on DP
> > > 2.0 for amdgpu
> > > 
> > > ----------------------------------------------------------------
> > > Alex Deucher (1):
> > >       drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not
> > > set
> > > 
> > > Bhawanpreet Lakha (3):
> > >       drm: Remove slot checks in dp mst topology during commit
> > >       drm: Update MST First Link Slot Information Based on Encoding
> > > Format
> > >       drm/amd/display: Add DP 2.0 MST DM Support
> > > 
> > > Fangzhi Zuo (1):
> > >       drm/amd/display: Add DP 2.0 MST DC Support
> > > 
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  29 ++
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   3 +
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   7 +-
> > >  drivers/gpu/drm/amd/display/dc/core/dc.c           |  14 +
> > >  drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 292
> > > +++++++++++++++++++++
> > >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  19 ++
> > >  drivers/gpu/drm/amd/display/dc/dc_link.h           |   7 +
> > >  drivers/gpu/drm/amd/display/dc/dc_stream.h         |  13 +
> > >  drivers/gpu/drm/drm_dp_mst_topology.c              |  42 ++-
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c        |   4 +-
> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c            |   2 +-
> > >  drivers/gpu/drm/radeon/radeon_dp_mst.c             |   4 +-
> > >  include/drm/drm_dp_mst_helper.h                    |   5 +-
> > >  13 files changed, 425 insertions(+), 16 deletions(-)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

