Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951723AC6A7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 10:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363A76E9B0;
	Fri, 18 Jun 2021 08:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9616E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 08:58:18 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 k10-20020a056830168ab029044d922f6a45so637860otr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 01:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NPNbXHye30H91qovWBEnOtDajX5FK6NKrmCWrgyVNy8=;
 b=VFuG09iw0j/Nj2bdktNMG4smD6d5Dje67n99jc2Tlr8KeB4rBmvWxNKD9abJpck4Mf
 QqwS6SyiQVqsEaJzlZ1psp0eu3nxjJlk3wZpWzA/+lNB/im2UCkbtue+45E/NLivPHnl
 fAC/bI7qc95uQ+9OItWx3JxMdk2ysDhyo2DtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NPNbXHye30H91qovWBEnOtDajX5FK6NKrmCWrgyVNy8=;
 b=LZyMNXA2ExrxjdpvXOwmOONbE31X7Rt6tNIMBwpkTGKeWg3yohh+YMELCqZXfnN1Dz
 vR5Ea78BAiLpeVov8i00EZsuS3wy4ZA/IW7ioAwxjgOxUEhmcPiSgy+Iu+zuD0Cu+ZIt
 gYRDxi7LCFkJSJkfDB5PmvmeXnRbY351qf6iQUVxbSQMRQ88JeA5wyittWgd+UTrFoei
 wabz5plnLmdpGtL09Wv2r3WJGJfyy4mJGefLceA4MWOTfDcjOe22gVRD8NtR3qCA1QUk
 KbuMaRFzyKk7kQ66Lh/SBmijPgOD/RRsgEuhMQF9F5GsXrNnmdi+LIG0VTXNtkqc6TUO
 y0iQ==
X-Gm-Message-State: AOAM532RHMcM2TN8zwAUjTJSzoYsW46wfVnKizt3gnJ84sZTPCyX1Fk+
 bfZDg76vuooHYPFEXfa1LnV3VA0tkODUVmKYBXZr2Q==
X-Google-Smtp-Source: ABdhPJz7pTU2lDn29u5LbRjh1L7P3pdVyEM6infQjk3JZ6xD8WF1JVzROitJUhwqKdhs1QZef40H3FOjR3E5kKFbCs8=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr8385381otb.281.1624006697682; 
 Fri, 18 Jun 2021 01:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <YMpDYfRjFqjfrMke@linux-uq9g.fritz.box>
 <CAPM=9tz-8WVAt5r_P+fH+SLnfnaPw-u-u9h8PvcioxVn6Ye_Fg@mail.gmail.com>
 <CAPM=9tyQMXVTaggmiTrqXkaH_RsTOcNW9CA98CbFf0kwqP_T5Q@mail.gmail.com>
In-Reply-To: <CAPM=9tyQMXVTaggmiTrqXkaH_RsTOcNW9CA98CbFf0kwqP_T5Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 18 Jun 2021 10:58:06 +0200
Message-ID: <CAKMK7uGUuBc_cCyh1Z-Pj6uw8UxLSb8817e3tmcU5vzcDjpA-w@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next-fixes
To: Dave Airlie <airlied@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 4:31 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 18 Jun 2021 at 12:26, Dave Airlie <airlied@gmail.com> wrote:
> >
> > when I pulled this in drm-next I got these.
> >
> > were the mst fixes meant for next or fixes btw? I'm not really sure,
> > but either way I don't think this is a local reason it doesn't build
> > or did I miss something?
>
> Hi Thomas,
>
> Please resend with the fix Lyude has pushed (just keep building, just
> keep building).

Yeah I think both committer when applying and probably also maintainer
before sending pull should have rechecked the works. Until we have CI
on gitlab this grunk work is just needed because a ton of people don't
do it - as this patch shows, where out of 4 people only seems to have
fired up the compiler :-)
-Daniel

>
> Thanks,
> Dave.
> >
> > Dave.
> >
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.=
c:
> > In function =E2=80=98drm_dp_update_payload_part1=E2=80=99:
> > /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:27:
> > error: request for member =E2=80=98dev=E2=80=99 in something not a stru=
cture or union
> >   450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA=
_ARGS__)
> >       |                           ^~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.=
c:3392:5:
> > note: in expansion of macro =E2=80=98drm_dbg_kms=E2=80=99
> >  3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\=
n", i);
> >       |     ^~~~~~~~~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.=
c:3392:68:
> > warning: passing argument 3 of =E2=80=98drm_dev_dbg=E2=80=99 makes poin=
ter from
> > integer without a cast [-Wint-conversion]
> >  3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\=
n", i);
> >       |                                                                =
    ^
> >       |                                                                =
    |
> >       |                                                                =
    int
> > /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:53:
> > note: in definition of macro =E2=80=98drm_dbg_kms=E2=80=99
> >   450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA=
_ARGS__)
> >       |                                                     ^~~
> > /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:338:16:
> > note: expected =E2=80=98const char *=E2=80=99 but argument is of type =
=E2=80=98int=E2=80=99
> >   338 |    const char *format, ...);
> >       |    ~~~~~~~~~~~~^~~~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.=
c:3407:53:
> > error: macro "drm_dbg_kms" requires 3 arguments, but only 1 given
> >  3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
> >       |                                                     ^
> > In file included from
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.=
c:45:
> > /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:449: note:
> > macro "drm_dbg_kms" defined here
> >   449 | #define drm_dbg_kms(drm, fmt, ...)     \
> >       |
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.=
c:3407:7:
> > error: =E2=80=98drm_dbg_kms=E2=80=99 undeclared (first use in this func=
tion)
> >  3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
> >       |       ^~~~~~~~~~~
> > /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.=
c:3407:7:
> > note: each undeclared identifier is reported only once for each
> > function it appears in
> > make[4]: *** [/home/airlied/devel/kernel/dim/src/scripts/Makefile.build=
:272:
> > drivers/gpu/drm/drm_dp_mst_topology.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> >
> > On Thu, 17 Jun 2021 at 04:30, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> > >
> > > Hi Dave and Daniel,
> > >
> > > here's this week's PR for drm-misc-next-fixes.
> > >
> > > Best regards
> > > Thomas
> > >
> > > drm-misc-next-fixes-2021-06-16:
> > > Short summary of fixes pull:
> > >
> > >  * hyperv: advertise the correct formatmodifiers for its primary plan=
e
> > >  * dp_mst: VCPI fixes to make it work with StarTech hub
> > >
> > > The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d=
1a67c2:
> > >
> > >   Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +=
1000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes=
-2021-06-16
> > >
> > > for you to fetch changes up to 3769e4c0af5b82c8ea21d037013cb9564dfaa5=
1f:
> > >
> > >   drm/dp_mst: Avoid to mess up payload table by ports in stale topolo=
gy (2021-06-16 12:57:46 -0400)
> > >
> > > ----------------------------------------------------------------
> > > Short summary of fixes pull:
> > >
> > >  * hyperv: advertise the correct formatmodifiers for its primary plan=
e
> > >  * dp_mst: VCPI fixes to make it work with StarTech hub
> > >
> > > ----------------------------------------------------------------
> > > Pu Lehui (1):
> > >       drm/hyperv: Fix unused const variable 'hyperv_modifiers'
> > >
> > > Wayne Lin (2):
> > >       drm/dp_mst: Do not set proposed vcpi directly
> > >       drm/dp_mst: Avoid to mess up payload table by ports in stale to=
pology
> > >
> > >  drivers/gpu/drm/drm_dp_mst_topology.c       | 65 +++++++++++++++++--=
----------
> > >  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  2 +-
> > >  2 files changed, 40 insertions(+), 27 deletions(-)
> > >
> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > > (HRB 36809, AG N=C3=BCrnberg)
> > > Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
