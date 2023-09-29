Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E97B2D18
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CBC10E6C5;
	Fri, 29 Sep 2023 07:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3A510E6C5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 07:34:09 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6c4fc2ce697so3420086a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 00:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695972848; x=1696577648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUWQxOTsSrkcrkTI16CKvhBBl32jDdZTQBwnUO0YWt4=;
 b=hrUp9AoU9UefseR3SVFw0WJdmQhUHV40iZWm+99rBSGvT/2DojCM6uZwBy7AehXfZj
 9Po5hT+0Ju4D3yvx34zTZ5a6ncjzUEsM5qJqb2ohu4O4TqsCk4gG7kuaCW+r6SGt88Uh
 rB03e/s3uEuD8nwr78oVogVAwuVcJHwfcbe2WnZ3KMzsGywMaFZSPeVzb+NGDDIvDUW3
 71SZfQD4Ewgh2x0rsyd6zdU4JNdfTM/+0/xUzqXnrZK06U+pLW5vl23XHlWnA74nFm7n
 WHK2n9OSjwRf+ClCGyqsVDdLhxWttTuiZZr+RNkZw22mmTA3KDk6xBZ4A+1eHB7EzAQ1
 I1mw==
X-Gm-Message-State: AOJu0Yx43W5gFv0clET1MSYE6F1+u99/CvxLRG9OrEQ2DO23epWKzDGz
 /+VWazB3MQIalMbiiw8aB/69C38XYgJ0M5uw
X-Google-Smtp-Source: AGHT+IGAty4QpyqEA5/LEbNB2Mm/5A2kN9K/hN4m3kOSAGzUW4TtUjaqLiAGtdlXvbh9gsg9cjkXVw==
X-Received: by 2002:a05:6830:11d8:b0:6bc:f6d0:87d9 with SMTP id
 v24-20020a05683011d800b006bcf6d087d9mr3659053otq.5.1695972848289; 
 Fri, 29 Sep 2023 00:34:08 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 t141-20020a0dea93000000b005a20ab8a184sm1744249ywe.31.2023.09.29.00.34.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 00:34:07 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-5a1ec43870cso70585677b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 00:34:07 -0700 (PDT)
X-Received: by 2002:a81:9152:0:b0:59b:c11:ad7c with SMTP id
 i79-20020a819152000000b0059b0c11ad7cmr3474689ywg.18.1695972847371; Fri, 29
 Sep 2023 00:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695903065.git.geert+renesas@glider.be>
 <0f0eae276da4f8ed44cd1a15ffa138879d27b148.1695903065.git.geert+renesas@glider.be>
 <d9020d20-f512-42e6-8259-a7377c3d0d58@suse.de>
 <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
 <9af0ab00-7afd-493b-848a-a433e9b9e182@suse.de>
In-Reply-To: <9af0ab00-7afd-493b-848a-a433e9b9e182@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Sep 2023 09:33:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWRgL0uxLXt7geDCuHdQ=CDPhOzE7WCa4f4wRFvD50sw@mail.gmail.com>
Message-ID: <CAMuHMdXWRgL0uxLXt7geDCuHdQ=CDPhOzE7WCa4f4wRFvD50sw@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/3] drm: Split drm_modeset_helper_vtables.h
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Sep 29, 2023 at 9:11=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 28.09.23 um 17:32 schrieb Geert Uytterhoeven:
> > On Thu, Sep 28, 2023 at 3:59=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Am 28.09.23 um 14:16 schrieb Geert Uytterhoeven:
> >>> <drm/drm_modeset_helper_vtables.h> is the second largest header file =
in
> >>> the DRM subsystem, and declares helpers vtables for various DRM
> >>> components.  Several vtables contain methods with the same name, and =
all
> >>> but one vtable do not fit on the screen, making it hard to navigate t=
o
> >>> the actual method one is interested in.
> >>>
> >>> Make it easier for the casual reviewer to keep track by splitting
> >>> <drm/drm_modeset_helper_vtables.h> in multiple header files, one per =
DRM
> >>> component.
> >>
> >> I never liked this header either, but do we need new header files? Eac=
h
> >> struct could be appended to the end of the regular header: struct
> >> drm_plane_helper_funcs to drm_plane.h, drm_connector_helper_func to
> >> drm_connector.h and so on.
> >
> > That would work for me, too.  But perhaps we want to maintain a clear
> > separation between core and helpers?
> >
> > Note that moving the contents to *_helper.h would be another option,
> > drm_crtc_helper.h and drm_plane_helper.h already exist.
>
> I've taken a closer look at the users of the _vtables header. There's
> code in drm_atomic_helper.c or drm_probe_helper.c that invokes the
> callback functions.
>
> The drivers fill the pointers with code that often comes from other
> helper modules. That code is in files like drm_plane_helper.c or
> drm_crtc_helper.c. There header files are drm_plane_helper.h, etc.
>
> In that context, the _vtables header makes sense, as it separates the
> callers from the callees. Putting the structs into headers like
> drm_plane_helper.h would move it to the callee side.
>
> I suggest to leave the header as it is. The fallout to the code base
> from refactoring seems worse than the current state.

To clarify: do you mean keeping the single big drm_modeset_helper_vtables.h=
,
or the split drm_*_helper_vtable.h set?

Thanks!

> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> ---
> >>> RFC, a future patch could replace inclusion of
> >>> <drm/drm_modeset_helper_vtables.h> by inclusion of one or more of the
> >>> new files, and reduce compilation time.
> >>> ---
> >>>    include/drm/drm_connector_helper_vtable.h   |  364 +++++
> >>>    include/drm/drm_crtc_helper_vtable.h        |  483 ++++++
> >>>    include/drm/drm_encoder_helper_vtable.h     |  381 +++++
> >>>    include/drm/drm_mode_config_helper_vtable.h |   97 ++
> >>>    include/drm/drm_modeset_helper_vtables.h    | 1466 +--------------=
----
> >>>    include/drm/drm_plane_helper_vtable.h       |  297 ++++
> >>>    6 files changed, 1627 insertions(+), 1461 deletions(-)
> >>>    create mode 100644 include/drm/drm_connector_helper_vtable.h
> >>>    create mode 100644 include/drm/drm_crtc_helper_vtable.h
> >>>    create mode 100644 include/drm/drm_encoder_helper_vtable.h
> >>>    create mode 100644 include/drm/drm_mode_config_helper_vtable.h
> >>>    create mode 100644 include/drm/drm_plane_helper_vtable.h

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
