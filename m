Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A093AC0BF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 04:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FB16E3D2;
	Fri, 18 Jun 2021 02:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DBD6E0CA;
 Fri, 18 Jun 2021 02:26:15 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b11so6463077edy.4;
 Thu, 17 Jun 2021 19:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zbQ3wEPDlSgI1Zbp8Vwvhn7SFRoEjoeQY2pTW+hAH3A=;
 b=Atu5AIYFMjUHudrarYRTqGvl9d+KA+6MwOoHbfR9gBq+027OOe9Z7u2w0yGvBTzYFK
 K2W54c80hvq7LoCttwNL5bWTuntmwHirR8/HrOryjubxjfn2qWbo6Oa43LeOg3mCbioH
 tomRjLvG2RCbmbNmMgUk/6NH4NlrHnwFR51Llp7Q+WVKO960xtXVfHbAvoG+5Q1l63x3
 t+l5BMAoCmn3FA7N4h7cMvIhhe89QV8DyUhJqW9waY5rkYbk24Cwm8DucBQVdrNUpNib
 roZlJrVLuMz4y468OvI3spejRpPyPBlvQMfzZWqyH610kDE6vLp0ZDc4qRKbXHgPDn+S
 aamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zbQ3wEPDlSgI1Zbp8Vwvhn7SFRoEjoeQY2pTW+hAH3A=;
 b=V/icscGPGVLpQj2QcTtQYDJDX1USZE3LusLOvO8s2G+IkAf9nWS17lXnQ3uR4ElOYK
 Pv9KZjEY+KOcEVOh2zPpxlokkrlTd57NBY+SbWCrZ226Vh4Bj62oqT4kz20rvcdT7+HY
 8+UmKKyiut6odSiOqx0+n1CaUr/pmg2n4kzBcdvK2dNYR0SEYRCi0T0VvIRqN5Hz2yAf
 JpXYxLcyVO3VVG0+JnWR1lXmRShR6hhvZwh6e842C4gI2X9WbsFs+JW0NqphOAoWn68D
 b9MfS7jqaeNIaOIQ9+JW9sVhBSUODtZs6j1enPDd+CYyBR2gcXl7uPCshEVW4+zQHFaU
 X1PQ==
X-Gm-Message-State: AOAM533Mj8CFy+dFxMNk5uA9no/CaeCTb+lIWVJQ072iebvgFLrLr2Et
 AFFIMcbXRTo/84HBJQxBQ57rloNkznG3QJFLL5s=
X-Google-Smtp-Source: ABdhPJyeg5ZVXf2wunBBoMOKHECIBpYZvVJ8HPRV16vc3jLiuuTawZcqYZAFMUNP28HwYTRgwpLMVK0jO/J/sjET010=
X-Received: by 2002:a05:6402:2049:: with SMTP id
 bc9mr1855920edb.298.1623983173746; 
 Thu, 17 Jun 2021 19:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <YMpDYfRjFqjfrMke@linux-uq9g.fritz.box>
In-Reply-To: <YMpDYfRjFqjfrMke@linux-uq9g.fritz.box>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Jun 2021 12:26:02 +1000
Message-ID: <CAPM=9tz-8WVAt5r_P+fH+SLnfnaPw-u-u9h8PvcioxVn6Ye_Fg@mail.gmail.com>
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

when I pulled this in drm-next I got these.

were the mst fixes meant for next or fixes btw? I'm not really sure,
but either way I don't think this is a local reason it doesn't build
or did I miss something?

Dave.

/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:
In function =E2=80=98drm_dp_update_payload_part1=E2=80=99:
/home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:27:
error: request for member =E2=80=98dev=E2=80=99 in something not a structur=
e or union
  450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARG=
S__)
      |                           ^~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:33=
92:5:
note: in expansion of macro =E2=80=98drm_dbg_kms=E2=80=99
 3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\n", =
i);
      |     ^~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:33=
92:68:
warning: passing argument 3 of =E2=80=98drm_dev_dbg=E2=80=99 makes pointer =
from
integer without a cast [-Wint-conversion]
 3392 |     drm_dbg_kms("Virtual channel %d is not in current topology\n", =
i);
      |                                                                    =
^
      |                                                                    =
|
      |                                                                    =
int
/home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:450:53:
note: in definition of macro =E2=80=98drm_dbg_kms=E2=80=99
  450 |  drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARG=
S__)
      |                                                     ^~~
/home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:338:16:
note: expected =E2=80=98const char *=E2=80=99 but argument is of type =E2=
=80=98int=E2=80=99
  338 |    const char *format, ...);
      |    ~~~~~~~~~~~~^~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:34=
07:53:
error: macro "drm_dbg_kms" requires 3 arguments, but only 1 given
 3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
      |                                                     ^
In file included from
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:45=
:
/home/airlied/devel/kernel/dim/src/include/drm/drm_print.h:449: note:
macro "drm_dbg_kms" defined here
  449 | #define drm_dbg_kms(drm, fmt, ...)     \
      |
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:34=
07:7:
error: =E2=80=98drm_dbg_kms=E2=80=99 undeclared (first use in this function=
)
 3407 |       drm_dbg_kms("Fail:set payload to invalid sink");
      |       ^~~~~~~~~~~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/drm_dp_mst_topology.c:34=
07:7:
note: each undeclared identifier is reported only once for each
function it appears in
make[4]: *** [/home/airlied/devel/kernel/dim/src/scripts/Makefile.build:272=
:
drivers/gpu/drm/drm_dp_mst_topology.o] Error 1
make[4]: *** Waiting for unfinished jobs....

On Thu, 17 Jun 2021 at 04:30, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi Dave and Daniel,
>
> here's this week's PR for drm-misc-next-fixes.
>
> Best regards
> Thomas
>
> drm-misc-next-fixes-2021-06-16:
> Short summary of fixes pull:
>
>  * hyperv: advertise the correct formatmodifiers for its primary plane
>  * dp_mst: VCPI fixes to make it work with StarTech hub
>
> The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67=
c2:
>
>   Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1000=
)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-202=
1-06-16
>
> for you to fetch changes up to 3769e4c0af5b82c8ea21d037013cb9564dfaa51f:
>
>   drm/dp_mst: Avoid to mess up payload table by ports in stale topology (=
2021-06-16 12:57:46 -0400)
>
> ----------------------------------------------------------------
> Short summary of fixes pull:
>
>  * hyperv: advertise the correct formatmodifiers for its primary plane
>  * dp_mst: VCPI fixes to make it work with StarTech hub
>
> ----------------------------------------------------------------
> Pu Lehui (1):
>       drm/hyperv: Fix unused const variable 'hyperv_modifiers'
>
> Wayne Lin (2):
>       drm/dp_mst: Do not set proposed vcpi directly
>       drm/dp_mst: Avoid to mess up payload table by ports in stale topolo=
gy
>
>  drivers/gpu/drm/drm_dp_mst_topology.c       | 65 +++++++++++++++++------=
------
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  2 +-
>  2 files changed, 40 insertions(+), 27 deletions(-)
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
