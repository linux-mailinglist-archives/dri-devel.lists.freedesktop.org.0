Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2765535C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 18:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3501110E1BE;
	Fri, 23 Dec 2022 17:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC40810E1D0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 17:55:09 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id 128so5082562vsz.12
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 09:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27eFCLZ0btis0zjIHI05tSH6Ubiwv0zYnrDQpFFDB6c=;
 b=Vd/lKaZ2lX4EeAHsDcXRyH7IjTkoaJEaQZjqD2SOZu/IpN5u1mObTi087qo/EGgVks
 P2VOshXG9Lv8CFnEB5ZcdndU3OyvNCF9/hcpOVaN3RWcsT6OAo9i7ynsr4jOyGRiXmfa
 0C4rmiC9WGGyefIqAdloUIt5BQhH1kYsK12mUze5HxvJZMVwXYZxL3h8H+/pnhRXqmSi
 59iAEBjoGX9Rf6DYrenhxvu5rhrnEVDvV9gbEEYvS6Lagzp3nAk8a3WAoJdT0SgkfDrQ
 CHwFiz8PuCpcTMWzpNDFlxudaipCusMnGuQog3yVTaiClzJLRohzGOdshkUiRZOKwETU
 KbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27eFCLZ0btis0zjIHI05tSH6Ubiwv0zYnrDQpFFDB6c=;
 b=4OVBr6ZUQt13yV6Rrz+oJkld5HxOrEZX77mbCLlid4mDEd6Zp3Oni54SO522DYV11B
 UlcCzOiMwcrCu5lDEood7ZvEkEEryDhhVU4vnfI5V3KG1344rdsFUGHZnzbxszciMiSs
 AInRwCtjNwv8ivo24bYy9p+rCHNI72de+L8qT5MrUfzy4YlsTiVNBkAry95xSBj6DcTQ
 +d+TqgQ5cWI6V+2dj0YS57KZTyWGm3v8r6oyDtG/eevhgMHYK077pIdUolGE59N/M3je
 lGVhwcZvIngbllmdmluBwNwdeqz8ZYkouskFB5skrQLc5PBEO2sLxNx59Fo/A5vMfQMu
 Vynw==
X-Gm-Message-State: AFqh2kox25retvhW/RFsAUvid8B+y8SAttZNL3iFkSQqAn8+qyTBNBSQ
 8LdbRUj/f6Fv7aHrhNb5+JakLPr/qxyQj5nLrgY=
X-Google-Smtp-Source: AMrXdXu4qd+BDw6GwEQd1Njg9Y0LkQOjlgeGVXdxLTICX/U+t6Fv+7c8sVQJXnBq9kCpXk/VXmrMAwLUN3lUgu5D7d0=
X-Received: by 2002:a67:ff88:0:b0:3b3:1169:61b4 with SMTP id
 v8-20020a67ff88000000b003b3116961b4mr1277398vsq.56.1671818108634; Fri, 23 Dec
 2022 09:55:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671566741.git.code@siddh.me>
 <4d1acd84e914bafe491cfb42e7adab32d41ca0ab.1671566741.git.code@siddh.me>
 <877cyl2i0f.fsf@intel.com> <ee59de2d-6649-ad89-bf2f-c1c287221452@suse.de>
In-Reply-To: <ee59de2d-6649-ad89-bf2f-c1c287221452@suse.de>
From: jim.cromie@gmail.com
Date: Fri, 23 Dec 2022 10:54:42 -0700
Message-ID: <CAJfuBxyuc+NOxyhNRTfC8NpvKtcHJ9DT72PPjZ_fHeSH+9mutw@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm: Remove usage of deprecated DRM_DEBUG_DRIVER
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Siddh Raman Pant <code@siddh.me>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 21, 2022 at 3:14 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 21.12.22 um 11:00 schrieb Jani Nikula:
> > On Wed, 21 Dec 2022, Siddh Raman Pant <code@siddh.me> wrote:
> >> drm_print.h says DRM_DEBUG_DRIVER is deprecated.
> >> Thus, use newer drm_dbg_driver().
> >>
> >> Also fix the deprecation comment in drm_print.h which
> >> mentions drm_dbg() instead of drm_dbg_driver().
> >>
> >> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> >> ---
> >>   drivers/gpu/drm/drm_mipi_dbi.c | 10 +++++-----
> >>   include/drm/drm_print.h        |  2 +-
> >>   2 files changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi=
_dbi.c
> >> index 24af507bb687..6ad399f6ab03 100644
> >> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> >> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> >> @@ -69,11 +69,11 @@
> >>   #define MIPI_DBI_DEBUG_COMMAND(cmd, data, len) \
> >>   ({ \
> >>      if (!len) \
> >> -            DRM_DEBUG_DRIVER("cmd=3D%02x\n", cmd); \
> >> +            drm_dbg_driver(NULL, "cmd=3D%02x\n", cmd); \
> >>      else if (len <=3D 32) \
> >> -            DRM_DEBUG_DRIVER("cmd=3D%02x, par=3D%*ph\n", cmd, (int)le=
n, data);\
> >> +            drm_dbg_driver(NULL, "cmd=3D%02x, par=3D%*ph\n", cmd, (in=
t)len, data);\
> >>      else \
> >> -            DRM_DEBUG_DRIVER("cmd=3D%02x, len=3D%zu\n", cmd, len); \
> >> +            drm_dbg_driver(NULL, "cmd=3D%02x, len=3D%zu\n", cmd, len)=
; \
> >>   })
> >>
> >>   static const u8 mipi_dbi_dcs_read_commands[] =3D {
> >> @@ -632,7 +632,7 @@ bool mipi_dbi_display_is_on(struct mipi_dbi *dbi)
> >>          DCS_POWER_MODE_DISPLAY_NORMAL_MODE | DCS_POWER_MODE_SLEEP_MOD=
E))
> >>              return false;
> >>
> >> -    DRM_DEBUG_DRIVER("Display is ON\n");
> >> +    drm_dbg_driver(NULL, "Display is ON\n");
> >>
> >>      return true;
> >>   }
> >> @@ -1168,7 +1168,7 @@ int mipi_dbi_spi_init(struct spi_device *spi, st=
ruct mipi_dbi *dbi,
> >>
> >>      mutex_init(&dbi->cmdlock);
> >>
> >> -    DRM_DEBUG_DRIVER("SPI speed: %uMHz\n", spi->max_speed_hz / 100000=
0);
> >> +    drm_dbg_driver(NULL, "SPI speed: %uMHz\n", spi->max_speed_hz / 10=
00000);
> >>
> >>      return 0;
> >>   }
> >> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> >> index 53702d830291..10261faec8b6 100644
> >> --- a/include/drm/drm_print.h
> >> +++ b/include/drm/drm_print.h
> >> @@ -614,7 +614,7 @@ void __drm_err(const char *format, ...);
> >>   #define DRM_DEBUG(fmt, ...)                                         =
       \
> >>      __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
> >>
> >> -/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
> >> +/* NOTE: this is deprecated in favor of drm_dbg_driver(NULL, ...). */
> >
> > Way back the idea was to make the shorter drm_dbg() the driver debug,
> > and drm_dbg_core() the drm core debug, because the former vastly
> > outnumbers the the latter.
> >
> > I don't know if that changed with the dyndbg stuff.

well, there was:

commit 95a77b6331c2d2313aa843fa77ec91cd092ab0e4
Author: Jim Cromie <jim.cromie@gmail.com>
Date:   Sun Sep 11 23:28:49 2022 -0600

    drm-print: add drm_dbg_driver to improve namespace symmetry

    drm_print defines all of these:
        drm_dbg_{core,kms,prime,atomic,vbl,lease,_dp,_drmres}

    but not drm_dbg_driver itself, since it was the original drm_dbg.

    To improve namespace symmetry, change the drm_dbg defn to
    drm_dbg_driver, and redef grandfathered name to symmetric one.

>
> I've recently grepped for these macros and nothing uses drm_dbg_driver()
> directly.

I have a use-case for it, in an unready branch thats trying to adapt nouvea=
u
to use dyndbg.  Its presence allows macro constructs to paste 'driver'
onto the end, and have it resolve.  (see ##cat below)


--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -39,6 +39,7 @@
  */

 #include <linux/notifier.h>
+#include <linux/dynamic_debug.h>

 #include <nvif/client.h>
 #include <nvif/device.h>
@@ -263,13 +264,16 @@ void nouveau_drm_device_remove(struct drm_device *dev=
);
 #define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)

-#define NV_DEBUG(drm,f,a...) do {
         \
-       if (drm_debug_enabled(DRM_UT_DRIVER))                              =
    \
-               NV_PRINTK(info, &(drm)->client, f, ##a);                   =
    \
+#define NV_DRMDBG(cat,c,f,a...) do {                           \
+       struct nouveau_cli *_cli =3D (c);                         \
+       drm_dbg_##cat(_cli->drm->dev, "%s: "f, _cli->name, ##a); \
 } while(0)
-#define NV_ATOMIC(drm,f,a...) do {
         \
-       if (drm_debug_enabled(DRM_UT_ATOMIC))                              =
    \
-               NV_PRINTK(info, &(drm)->client, f, ##a);                   =
    \
+
+#define NV_DEBUG(drm,f,a...) do {                                      \
+       NV_DRMDBG(driver, &(drm)->client, f, ##a);                      \
+} while(0)
+#define NV_ATOMIC(drm,f,a...) do {                                     \
+       NV_DRMDBG(atomic, &(drm)->client, f, ##a);                      \
 } while(0)


That could probably be special-cased to avoid pasting "driver",
but it would be harder to read.

>
> I also wondered whether the driver debug macro makes much sense. For
> example, if a driver implements its own atomic helpers, it's much more
> useful to use drm_dbg_kms() within those functions. If enabled, their
> output would then blend into the overall KMS-related debugging.
> drm_dbg/drm_dbg_driver() appears to be mostly useful for init and status
> reporting.

This seems a larger, separate topic:
How to rationalize the broad sub-system-wide use of drm.debug ?
if we can veer onto that topic:

dyndbg has optional decorations, controlled by flags:
"mfl" ->   module.func.lineno

DRM has its own conventions, which I wont try to summarize or enumerate
beyond noting driver name can appear 2x
DRM_INFO  prefixes "[drm]", others too Im sure.

can they (the debug  anyway) be made optional - flag controlled ?
extending flags or even redefining them seems practical.

I have WIP  dyndbg-to-trace interface,
with a T flag to enable each drm-dbg callsite to write to tracefs
how would DRM / DRI best use this ?

Currently, drm -> tracefs works, but messages include trailing \n,
and 2nd is added by trace, giving blank lines.
Stripping it at runtime is possible, but cost >0,

stripping it in src from fmt strings, and restoring it in the underlying pr=
intk
is practical, but sorta flag-day.  Is it distasteful ?

is there any pr_cont() style use of drm.debug ?
that would interfere with \n stripping.

should drm.debug --> dyndbg --> tracefs messages
include the decorations ?
or a different form of them ?


Separately (while Im here), what tree does patchwork apply to ?
I seem to always guess wrong.


>
> Best regards
> Thomas
>
> >
> >
> > BR,
> > Jani.
> >
> >
> >>   #define DRM_DEBUG_DRIVER(fmt, ...)                                 \
> >>      __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
