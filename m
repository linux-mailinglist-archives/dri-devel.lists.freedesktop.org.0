Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70A19B541
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 20:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ED68997A;
	Wed,  1 Apr 2020 18:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E83F8997A;
 Wed,  1 Apr 2020 18:19:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w10so1239060wrm.4;
 Wed, 01 Apr 2020 11:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OU74YOGHQ6ePRK+7shGUKVyt5Ht+V+76PPs499ObSJM=;
 b=rwAHBtNNyCB5iSJhLJ07g9Fr605TncEhdAYMDOk6W5ufpzoYn7GRHelRffmifTGQma
 1EpdwZApqeXI5lokgCmLM0vormbBT4jpiO49DayybE7G4KOp8IY0RJQasF4OX9mK/xKj
 zp8FoOo6TuYO50W3mTuty0aDfs89yvwHjdmbQ1Tr6gBjiqguifnO4Cbsutb9Ya24FyHe
 pSXxhxJwpeAHGG3GN/DJ6FiHaSWQzuaca0En3DiW0AfYcSLnoRrg+GiXvbclGTb6s3XA
 MWgKtWbhYYvWAHc3cAfpEOqrJQWZ4WiDSBHR12nyAdu9Oxd9yv5msuIqZtse2hOY/LgW
 BY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OU74YOGHQ6ePRK+7shGUKVyt5Ht+V+76PPs499ObSJM=;
 b=Lb/KgTB67+Ye97Zss6TTWbxu4kyZf2HGRA+JflFbpYdcPjTk7k942a6RGLTqooA8dT
 vDePiRyQ6rnGSRJUtACXONhiMzmhnDOCW4rs8O/k9Tl4/Vrz5djJQMpt+l3QZtnszbs9
 8SgsrNFq/j+Uiniki/XIg6dL6I5r2zQa+3I0+P9hb1cI0wD6TijUbuez+N9vRqNP+Ltf
 eQzP0TiST1PvN71X3thDzVv+/gOlterPjjAKjNjD9+BOxVHqmvBZbN8caqk2QfJ4UkUn
 oqa4ZO7lAZXQRXujtXlX7h4+6aufS9CDPlIPCff2Jd6RCRYLZ9sN/UFL/odK8le88c2K
 +6cA==
X-Gm-Message-State: ANhLgQ1AxXNTpC0u0t7VmVwmBpxs0bzQVDfKZ4vxM+JUGzVlAiQFOZ4J
 8tDjCxEtOV3NH07gQHSx4zN+SrdD5/WDs7f59Oo=
X-Google-Smtp-Source: ADFU+vtxzOFKz9YR0+J01r9kWIIlBM+Dy/RQq6SXU0xM1AAoM+6OT/HNf/VZj2/xK/RYU19ZCs2fiRGjks/KQYfYegQ=
X-Received: by 2002:a5d:6187:: with SMTP id j7mr28401577wru.419.1585765145756; 
 Wed, 01 Apr 2020 11:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200331212228.139219-1-lyude@redhat.com>
 <20200331212228.139219-3-lyude@redhat.com>
 <48f2037b-1939-2ad3-750e-4ad4601d88be@amd.com>
In-Reply-To: <48f2037b-1939-2ad3-750e-4ad4601d88be@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Apr 2020 14:18:54 -0400
Message-ID: <CADnq5_O0DHnqRVnrEB1uRgHO9JtHqbikevmdOmrN3qmX48svCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/dc: Kill dc_conn_log_hex_linux()
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Wyatt Wood <wyatt.wood@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 1, 2020 at 9:00 AM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2020-03-31 5:22 p.m., Lyude Paul wrote:
> > DRM already supports tracing DPCD transactions, there's no reason for
> > the existence of this function. Also, it prints one byte per-line which
> > is way too loud. So, just remove it.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Thanks for helping clean this up!
>
> Series is:
>
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>


Applied the series.  Thanks!

Alex

>
> Regards,
> Nicholas Kazlauskas
>
> > ---
> >   .../gpu/drm/amd/display/dc/basics/Makefile    |  3 +-
> >   .../drm/amd/display/dc/basics/log_helpers.c   | 39 -------------------
> >   .../amd/display/include/logger_interface.h    |  4 --
> >   3 files changed, 1 insertion(+), 45 deletions(-)
> >   delete mode 100644 drivers/gpu/drm/amd/display/dc/basics/log_helpers.c
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/basics/Makefile b/drivers/gpu/drm/amd/display/dc/basics/Makefile
> > index 7ad0cad0f4ef..01b99e0d788e 100644
> > --- a/drivers/gpu/drm/amd/display/dc/basics/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/basics/Makefile
> > @@ -24,8 +24,7 @@
> >   # It provides the general basic services required by other DAL
> >   # subcomponents.
> >
> > -BASICS = conversion.o fixpt31_32.o \
> > -     log_helpers.o vector.o dc_common.o
> > +BASICS = conversion.o fixpt31_32.o vector.o dc_common.o
> >
> >   AMD_DAL_BASICS = $(addprefix $(AMDDALPATH)/dc/basics/,$(BASICS))
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/basics/log_helpers.c b/drivers/gpu/drm/amd/display/dc/basics/log_helpers.c
> > deleted file mode 100644
> > index 26583f346c39..000000000000
> > --- a/drivers/gpu/drm/amd/display/dc/basics/log_helpers.c
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -/*
> > - * Copyright 2012-16 Advanced Micro Devices, Inc.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a
> > - * copy of this software and associated documentation files (the "Software"),
> > - * to deal in the Software without restriction, including without limitation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice shall be included in
> > - * all copies or substantial portions of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> > - *
> > - * Authors: AMD
> > - *
> > - */
> > -
> > -#include "core_types.h"
> > -#include "logger.h"
> > -#include "include/logger_interface.h"
> > -#include "dm_helpers.h"
> > -
> > -void dc_conn_log_hex_linux(const uint8_t *hex_data, int hex_data_count)
> > -{
> > -     int i;
> > -
> > -     if (hex_data)
> > -             for (i = 0; i < hex_data_count; i++)
> > -                     DC_LOG_DEBUG("%2.2X ", hex_data[i]);
> > -}
> > -
> > diff --git a/drivers/gpu/drm/amd/display/include/logger_interface.h b/drivers/gpu/drm/amd/display/include/logger_interface.h
> > index 6e008de25629..02c23b04d34b 100644
> > --- a/drivers/gpu/drm/amd/display/include/logger_interface.h
> > +++ b/drivers/gpu/drm/amd/display/include/logger_interface.h
> > @@ -40,8 +40,6 @@ struct dc_state;
> >    *
> >    */
> >
> > -void dc_conn_log_hex_linux(const uint8_t *hex_data, int hex_data_count);
> > -
> >   void pre_surface_trace(
> >               struct dc *dc,
> >               const struct dc_plane_state *const *plane_states,
> > @@ -102,14 +100,12 @@ void context_clock_trace(
> >   #define CONN_DATA_DETECT(link, hex_data, hex_len, ...) \
> >               do { \
> >                       (void)(link); \
> > -                     dc_conn_log_hex_linux(hex_data, hex_len); \
> >                       DC_LOG_EVENT_DETECTION(__VA_ARGS__); \
> >               } while (0)
> >
> >   #define CONN_DATA_LINK_LOSS(link, hex_data, hex_len, ...) \
> >               do { \
> >                       (void)(link); \
> > -                     dc_conn_log_hex_linux(hex_data, hex_len); \
> >                       DC_LOG_EVENT_LINK_LOSS(__VA_ARGS__); \
> >               } while (0)
> >
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
