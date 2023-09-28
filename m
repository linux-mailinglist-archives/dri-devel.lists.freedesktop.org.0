Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B147B2166
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5656D10E5D7;
	Thu, 28 Sep 2023 15:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA9010E69A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 15:32:20 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-d89491dab33so8222362276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695915139; x=1696519939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8psAnvOZtbpDP4SLRmyJgzcjZciiw8nZc/0KRaOzIg=;
 b=tZUZ8WcuWfJMvuh0CyKDZEYOO/zXfKw5v7DE6mvL6QYKFbP/i8CFLsvlfyzPlxepld
 fpocBJSRj6+qCuHsRy6sdJ+rVSeFOi+1sVL8X/AqvglbW5JZWkEObgImB8yHQlPzE+mg
 0mKbyRIAMcOMGv6HBRRAN/9/+qYCWCTjzVjJKAhIU/VlojMi88zILTFHh+AuAw+Cwsmo
 bOeDaV6qh7fkYoOroCexOowI/+j5VtosjW4JmSHGMQSwYECIPQVphlIQTVGszItqqzAq
 r1QF3yganQWT5gsNcPTlRFmdh45vo1SxaXWZwlOa/FzVZMKR5SMOGi38nh64Dg7nEDnw
 hzAQ==
X-Gm-Message-State: AOJu0Yz8V+/q83BkYxpe983BhI5oBJYpKll2wNMYG9BnFa4qiTjacjxT
 /5fo0v3nk5tlzbfERWrH5+4u2a9oQSZIYJfG
X-Google-Smtp-Source: AGHT+IHA5kbuSCXNe8rXTOepFIuyfljJB4QChYsdvuBshjlHa+hnJKUtc2JJ8epJKZ2Mzgr00N38wg==
X-Received: by 2002:a25:d3c3:0:b0:d78:11a3:6800 with SMTP id
 e186-20020a25d3c3000000b00d7811a36800mr1498616ybf.61.1695915138858; 
 Thu, 28 Sep 2023 08:32:18 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 i137-20020a25d18f000000b00d81425266c1sm4290237ybg.42.2023.09.28.08.32.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 08:32:17 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-59f6e6b206fso111172487b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:32:17 -0700 (PDT)
X-Received: by 2002:a0d:d68e:0:b0:59b:f152:8997 with SMTP id
 y136-20020a0dd68e000000b0059bf1528997mr1733560ywd.0.1695915136921; Thu, 28
 Sep 2023 08:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695903065.git.geert+renesas@glider.be>
 <0f0eae276da4f8ed44cd1a15ffa138879d27b148.1695903065.git.geert+renesas@glider.be>
 <d9020d20-f512-42e6-8259-a7377c3d0d58@suse.de>
In-Reply-To: <d9020d20-f512-42e6-8259-a7377c3d0d58@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Sep 2023 17:32:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
Message-ID: <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
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

On Thu, Sep 28, 2023 at 3:59=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 28.09.23 um 14:16 schrieb Geert Uytterhoeven:
> > <drm/drm_modeset_helper_vtables.h> is the second largest header file in
> > the DRM subsystem, and declares helpers vtables for various DRM
> > components.  Several vtables contain methods with the same name, and al=
l
> > but one vtable do not fit on the screen, making it hard to navigate to
> > the actual method one is interested in.
> >
> > Make it easier for the casual reviewer to keep track by splitting
> > <drm/drm_modeset_helper_vtables.h> in multiple header files, one per DR=
M
> > component.
>
> I never liked this header either, but do we need new header files? Each
> struct could be appended to the end of the regular header: struct
> drm_plane_helper_funcs to drm_plane.h, drm_connector_helper_func to
> drm_connector.h and so on.

That would work for me, too.  But perhaps we want to maintain a clear
separation between core and helpers?

Note that moving the contents to *_helper.h would be another option,
drm_crtc_helper.h and drm_plane_helper.h already exist.

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > RFC, a future patch could replace inclusion of
> > <drm/drm_modeset_helper_vtables.h> by inclusion of one or more of the
> > new files, and reduce compilation time.
> > ---
> >   include/drm/drm_connector_helper_vtable.h   |  364 +++++
> >   include/drm/drm_crtc_helper_vtable.h        |  483 ++++++
> >   include/drm/drm_encoder_helper_vtable.h     |  381 +++++
> >   include/drm/drm_mode_config_helper_vtable.h |   97 ++
> >   include/drm/drm_modeset_helper_vtables.h    | 1466 +-----------------=
-
> >   include/drm/drm_plane_helper_vtable.h       |  297 ++++
> >   6 files changed, 1627 insertions(+), 1461 deletions(-)
> >   create mode 100644 include/drm/drm_connector_helper_vtable.h
> >   create mode 100644 include/drm/drm_crtc_helper_vtable.h
> >   create mode 100644 include/drm/drm_encoder_helper_vtable.h
> >   create mode 100644 include/drm/drm_mode_config_helper_vtable.h
> >   create mode 100644 include/drm/drm_plane_helper_vtable.h

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
