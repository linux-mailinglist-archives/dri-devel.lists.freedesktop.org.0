Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691873AC0CB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 04:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2A26E954;
	Fri, 18 Jun 2021 02:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D769A6E952
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623983457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75acMXfQufxPOmXT2cEK94W/sSOXGRevSe0lqgsLwk8=;
 b=JE+KikAkhiJl0sYSrgeW2+AKZJKgKtwab3AP2H22Yy0b5Rs3EfOPZE3JKeeC5XHPI535rH
 HMwP2uBCMPDI7RQ2FDwM5jigbKJESJONK0aTXjHn25y/NSi84E3VTNoAGaeywSZLNTOASw
 CcIHJ2fk54Vp/Rde4hUkxjiw2CKqrUI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-JjJ4C_EYMvyyenzPXxeJvQ-1; Thu, 17 Jun 2021 22:30:56 -0400
X-MC-Unique: JjJ4C_EYMvyyenzPXxeJvQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 n3-20020a0cee630000b029020e62abfcbdso4184999qvs.16
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=75acMXfQufxPOmXT2cEK94W/sSOXGRevSe0lqgsLwk8=;
 b=tw33w/EULS607gQhc6aRvRAKyLHjBHk+ro2nOuk3DalsqJSGX4f7/M4+ya0TxpDcDQ
 Rzn9QifFBLWcS+mawxszeb2ytHNcWUK0o6+F5nJ2dp6V9RGwZFo7tORHD10Dl3XpXWUx
 3OBxllZ/6na6lbyrTtiMuoeAhevknIfC9QpTP3Gv1cgbq/+inzQkYjMycTFk2vzXG1Oq
 ISjCXFB8ZtzjVi/h6stg+gqZ1BBL64/99sMrgqpIIMKrlLxt8mWkDpZx4j03cs5iTnz7
 4Ia+BhJCRGvXjWC3rw3hqeOuwL/F25UQAd8Q3aBlAexCl/AR1FSh9buIeAYbk9hlbyfa
 pjPw==
X-Gm-Message-State: AOAM530Rl71XTleWKeu+2U+Xa2thqMEisXc/YUDemRUIOv8shjmXhUM7
 uFu+463CvrvJMRYzSqvXAbcDCgzIXYaFJRch1rso0lJ1Crv+ICnG04PD0sfT+/aOkukOs6Xu1Y9
 GS5SmiKBx9ErGM7ydtNIBL2DftgUb
X-Received: by 2002:ac8:6686:: with SMTP id d6mr8394820qtp.51.1623983455991;
 Thu, 17 Jun 2021 19:30:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysCoz89mPHqk8CVryIpIqYL1d1sKJ9p1X2NJZ6vFcEV6h4cgTYWVlAVookWqCUFPvdO0y4Og==
X-Received: by 2002:ac8:6686:: with SMTP id d6mr8394797qtp.51.1623983455735;
 Thu, 17 Jun 2021 19:30:55 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g82sm3109969qke.119.2021.06.17.19.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 19:30:55 -0700 (PDT)
Message-ID: <5d496314e16623b06833e309837019abc411d9a6.camel@redhat.com>
Subject: Re: [PULL] drm-misc-next-fixes
From: Lyude Paul <lyude@redhat.com>
To: Dave Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 17 Jun 2021 22:30:53 -0400
In-Reply-To: <CAPM=9tz-8WVAt5r_P+fH+SLnfnaPw-u-u9h8PvcioxVn6Ye_Fg@mail.gmail.com>
References: <YMpDYfRjFqjfrMke@linux-uq9g.fritz.box>
 <CAPM=9tz-8WVAt5r_P+fH+SLnfnaPw-u-u9h8PvcioxVn6Ye_Fg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: "DRM maintainer tools announcements,
 discussion, and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

22:27 <Lyude> airlied: re: the pull, I should have pushed a fix for the
compilation error today. that was something I pulled in from amd that they
didn't compile check and I missed :S
22:28 <Lyude> airlied: 24ff3dc18b99c4b912ab1746e803ddb3be5ced4c in drm-
misc/drm-misc-next-fixes

sorry about this - I already talked to hwentlan the other day about trying to
make sure that AMD is more on top of actually making sure things compile
before submitting them, was my fault for missing this during the initial
review of that fix.

On Fri, 2021-06-18 at 12:26 +1000, Dave Airlie wrote:
> when I pulled this in drm-next I got these.
> 
> were the mst fixes meant for next or fixes btw? I'm not really sure,
> but either way I don't think this is a local reason it doesn't build
> or did I miss something?
> 
> Dave.
> 
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:
> In function ‘drm_dp_update_payload_part1’:
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:27:
> error: request for member ‘dev’ in something not a structure or union
>   450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt,
> ##__VA_ARGS__)
>       |                           ^~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:3392:
> 5:
> note: in expansion of macro ‘drm_dbg_kms’
>  3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\n", i);
>       |     ^~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:3392:
> 68:
> warning: passing argument 3 of ‘drm_dev_dbg’ makes pointer from
> integer without a cast [-Wint-conversion]
>  3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\n", i);
>       |                                                                    ^
>       |                                                                    |
>       |                                                                    int
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:53:
> note: in definition of macro ‘drm_dbg_kms’
>   450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt,
> ##__VA_ARGS__)
>       |                                                     ^~~
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:338:16:
> note: expected ‘const char *’ but argument is of type ‘int’
>   338 |    const char *format, ...);
>       |    ~~~~~~~~~~~~^~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:3407:
> 53:
> error: macro "drm_dbg_kms" requires 3 arguments, but only 1 given
>  3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
>       |                                                     ^
> In file included from
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:45:
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:449: note:
> macro "drm_dbg_kms" defined here
>   449 | #define drm_dbg_kms(drm, fmt, ...)     \
>       |
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:3407:
> 7:
> error: ‘drm_dbg_kms’ undeclared (first use in this function)
>  3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
>       |       ^~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:3407:
> 7:
> note: each undeclared identifier is reported only once for each
> function it appears in
> make[4]: *** [/home/airlied/devel/kernel/dim/src/scripts/Makefile.build:272:
> drivers/gpu/drm/drm_dp_mst_topology.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> 
> On Thu, 17 Jun 2021 at 04:30, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > 
> > Hi Dave and Daniel,
> > 
> > here's this week's PR for drm-misc-next-fixes.
> > 
> > Best regards
> > Thomas
> > 
> > drm-misc-next-fixes-2021-06-16:
> > Short summary of fixes pull:
> > 
> >  * hyperv: advertise the correct formatmodifiers for its primary plane
> >  * dp_mst: VCPI fixes to make it work with StarTech hub
> > 
> > The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2:
> > 
> >   Merge tag 'exynos-drm-next-for-v5.14' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-
> > next (2021-06-11 14:19:12 +1000)
> > 
> > are available in the Git repository at:
> > 
> >   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-
> > 06-16
> > 
> > for you to fetch changes up to 3769e4c0af5b82c8ea21d037013cb9564dfaa51f:
> > 
> >   drm/dp_mst: Avoid to mess up payload table by ports in stale topology
> > (2021-06-16 12:57:46 -0400)
> > 
> > ----------------------------------------------------------------
> > Short summary of fixes pull:
> > 
> >  * hyperv: advertise the correct formatmodifiers for its primary plane
> >  * dp_mst: VCPI fixes to make it work with StarTech hub
> > 
> > ----------------------------------------------------------------
> > Pu Lehui (1):
> >       drm/hyperv: Fix unused const variable 'hyperv_modifiers'
> > 
> > Wayne Lin (2):
> >       drm/dp_mst: Do not set proposed vcpi directly
> >       drm/dp_mst: Avoid to mess up payload table by ports in stale topology
> > 
> >  drivers/gpu/drm/drm_dp_mst_topology.c       | 65 +++++++++++++++++---------
> > ---
> >  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  2 +-
> >  2 files changed, 40 insertions(+), 27 deletions(-)
> > 
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Maxfeldstr. 5, 90409 Nürnberg, Germany
> > (HRB 36809, AG Nürnberg)
> > Geschäftsführer: Felix Imendörffer
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

