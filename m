Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD83AC0CC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 04:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1676E95C;
	Fri, 18 Jun 2021 02:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBA96E95C;
 Fri, 18 Jun 2021 02:31:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ji1so7143914ejc.4;
 Thu, 17 Jun 2021 19:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9yyyMKBrphDCvLIddP9ExwdOR8yx43CwQU58A8Mo1ww=;
 b=O+dgbFp2mVh4QjCx+3yoci5Uy6VErpQ3ZEdgcCGibpOzManzD/fqTPoASpkxldm7WX
 R2z/jpyo1cDqKF6UuSwOJJHl18CkCVdBpasuLXVFNt9lGP1vNG6vmbPjs3P1CLkZ3SDs
 9y0grF+3s5jHP5G3OkEggW1xxZhk5I5EbjEot5UHSMcT5vy/kfVBFeIz3VkdGpKMbnve
 Y2c1aMg7qVyZTBc9gyC63SqRZkwZyEZBHUX1/jvZzzNF3Cdd/TlP9Or8yQi1GukAGkEW
 jFAeYc+gd8HhFJ4Pere4GQtVJdHl8oLUYWWJwoE1QPjTDhNzHOzMBwmWkagxTx7f4TJB
 TLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9yyyMKBrphDCvLIddP9ExwdOR8yx43CwQU58A8Mo1ww=;
 b=oCoAPvir6yQhgCnZKH90g2ktkzUwKipkkmU4VhiOnMJGzZSFCCOxPRjfJWMegtPMyE
 SWZ/9HLNVQgaC0AUnSSAro9kdN8pU16fvRSPUzEqliXaElT5Nql/nhCLYywjSqiE6hkw
 sv/3L4IE+QKWRJ3JiFMgDJaiq4q1t/Vbvo+ASbUd20uP1zazll2wONaei8DE3poUAtm5
 1EqnH5tci8c7MDTh6PCnMvwJagP2tKVFc6YD/zlKK3rchgNEoj3M+JOctveF6UDuu8b6
 SXgr0jf+RpY9QEjDWd3RxUrfRkhipBdBkHabeD82UDYFk3BguH2GNo//ZJeOL7A93nyf
 V75w==
X-Gm-Message-State: AOAM533W8xt+lPLsrwqUFpR6AlsJuTibOT2PCdviXPx8VVKnaQyA3+A1
 yIUCxgh2k7lfDdPDrocrDgMPN8TQOqX06eYfgQgfQTFYbDE=
X-Google-Smtp-Source: ABdhPJxoUgOAMMVdZNTVGxwg01ArBwMp09+yJRs+7IiV5Ux0OaRp7DPZ4tKclos5bp4REsMEcf2s/3qRFIDnGsbHteY=
X-Received: by 2002:a17:907:d92:: with SMTP id
 go18mr8577855ejc.317.1623983462682; 
 Thu, 17 Jun 2021 19:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <YMpDYfRjFqjfrMke@linux-uq9g.fritz.box>
 <CAPM=9tz-8WVAt5r_P+fH+SLnfnaPw-u-u9h8PvcioxVn6Ye_Fg@mail.gmail.com>
In-Reply-To: <CAPM=9tz-8WVAt5r_P+fH+SLnfnaPw-u-u9h8PvcioxVn6Ye_Fg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Jun 2021 12:30:51 +1000
Message-ID: <CAPM=9tyQMXVTaggmiTrqXkaH_RsTOcNW9CA98CbFf0kwqP_T5Q@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next-fixes
To: Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Jun 2021 at 12:26, Dave Airlie <airlied@gmail.com> wrote:
>
> when I pulled this in drm-next I got these.
>
> were the mst fixes meant for next or fixes btw? I'm not really sure,
> but either way I don't think this is a local reason it doesn't build
> or did I miss something?

Hi Thomas,

Please resend with the fix Lyude has pushed (just keep building, just
keep building).

Thanks,
Dave.
>
> Dave.
>
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:
> In function =E2=80=98drm_dp_update_payload_part1=E2=80=99:
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:27:
> error: request for member =E2=80=98dev=E2=80=99 in something not a struct=
ure or union
>   450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_A=
RGS__)
>       |                           ^~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:=
3392:5:
> note: in expansion of macro =E2=80=98drm_dbg_kms=E2=80=99
>  3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\n"=
, i);
>       |     ^~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:=
3392:68:
> warning: passing argument 3 of =E2=80=98drm_dev_dbg=E2=80=99 makes pointe=
r from
> integer without a cast [-Wint-conversion]
>  3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\n"=
, i);
>       |                                                                  =
  ^
>       |                                                                  =
  |
>       |                                                                  =
  int
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:53:
> note: in definition of macro =E2=80=98drm_dbg_kms=E2=80=99
>   450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_A=
RGS__)
>       |                                                     ^~~
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:338:16:
> note: expected =E2=80=98const char *=E2=80=99 but argument is of type =E2=
=80=98int=E2=80=99
>   338 |    const char *format, ...);
>       |    ~~~~~~~~~~~~^~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:=
3407:53:
> error: macro "drm_dbg_kms" requires 3 arguments, but only 1 given
>  3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
>       |                                                     ^
> In file included from
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:=
45:
> /home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:449: note:
> macro "drm_dbg_kms" defined here
>   449 | #define drm_dbg_kms(drm, fmt, ...)     \
>       |
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:=
3407:7:
> error: =E2=80=98drm_dbg_kms=E2=80=99 undeclared (first use in this functi=
on)
>  3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
>       |       ^~~~~~~~~~~
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:=
3407:7:
> note: each undeclared identifier is reported only once for each
> function it appears in
> make[4]: *** [/home/airlied/devel/kernel/dim/src/scripts/Makefile.build:2=
72:
> drivers/gpu/drm/drm_dp_mst_topology.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>
> On Thu, 17 Jun 2021 at 04:30, Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
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
> >  * hyperv: advertise the correct formatmodifiers for its primary plane
> >  * dp_mst: VCPI fixes to make it work with StarTech hub
> >
> > The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a=
67c2:
> >
> >   Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm=
/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +10=
00)
> >
> > are available in the Git repository at:
> >
> >   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2=
021-06-16
> >
> > for you to fetch changes up to 3769e4c0af5b82c8ea21d037013cb9564dfaa51f=
:
> >
> >   drm/dp_mst: Avoid to mess up payload table by ports in stale topology=
 (2021-06-16 12:57:46 -0400)
> >
> > ----------------------------------------------------------------
> > Short summary of fixes pull:
> >
> >  * hyperv: advertise the correct formatmodifiers for its primary plane
> >  * dp_mst: VCPI fixes to make it work with StarTech hub
> >
> > ----------------------------------------------------------------
> > Pu Lehui (1):
> >       drm/hyperv: Fix unused const variable 'hyperv_modifiers'
> >
> > Wayne Lin (2):
> >       drm/dp_mst: Do not set proposed vcpi directly
> >       drm/dp_mst: Avoid to mess up payload table by ports in stale topo=
logy
> >
> >  drivers/gpu/drm/drm_dp_mst_topology.c       | 65 +++++++++++++++++----=
--------
> >  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  2 +-
> >  2 files changed, 40 insertions(+), 27 deletions(-)
> >
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > (HRB 36809, AG N=C3=BCrnberg)
> > Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
