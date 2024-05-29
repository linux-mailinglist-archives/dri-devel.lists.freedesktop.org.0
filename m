Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1F38D3878
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 15:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CEB11398F;
	Wed, 29 May 2024 13:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TUCBfWLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72610FF9D;
 Wed, 29 May 2024 13:55:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f47f07aceaso17814565ad.0; 
 Wed, 29 May 2024 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716990913; x=1717595713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGlIeA8hMcr9Fm/VlCdK2KdthFpKjfRPf//jK9Gb9e8=;
 b=TUCBfWLwtJOkG92TNhQLvv2yhimHWbtByHBI3dL1Vqv5SN8vq8hCot65ULH3f1Dxq6
 dEDZAKBsarz3L1QMfDVN6PiIh6MCxQSjTPGVnt3nQSR55lUPUrvYltKBu/C+N2AkWfFG
 PTrCLxPQzaP54ml+GNrzikzA1RzhrnLxgAHC1b9oFi/Vfb4DESV02laRf3LJOu3lz1ZB
 KI6ckSQvoAPUqYFVGOX1W9zZb/wGe1lejO+Z8zOeWR/Rr5qy+7Ikhf4C5sMHbn53iybA
 W++Z1IbCwQ/vbuUhbErUcS+RxbNvKOhuSfTCxdTakECvVkNo//hOggYlZzDljvGaKZH3
 tfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716990913; x=1717595713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGlIeA8hMcr9Fm/VlCdK2KdthFpKjfRPf//jK9Gb9e8=;
 b=PySX3Ds2/3MBBOAnmZbO86+qbf9x9U//r+nb5PcVN/83vWBLzmXd1HnMrL1eoXzmFM
 Vb+bpoy+uf6VKbbp9YBgdS40lsTm8dr9GcMuF0THvoyz+YAqiL2do14RmrLz4fmqDUWu
 Ray8k7cQ7ZYHG7769CbvhojIplEezgYknmMewardS5vexLsldjX/339xKqHb5eSVOJXh
 ZgHiTkkg/On8JLRM7R2k+xUjHkYWG4UY3IcC4k3ZNjBxmt7yZ7PgZVMfcQMOrEyKEZDh
 re0795/SqMxARwyNFLis1w7AK8z1p+oFYItRB3/YIxqame1N+1/nvbub1Ob4eXG/MbsR
 9U6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfiaGRIFIQ+x+3GMMMcWzJXW394fen193YnzneqkK9RlRGSMURGYwt2UcmNrbz6WdoETVBuInKB601Gr5MuI3x3AZL+m81vN3gwCXqPfybi3u4xiK/vHMFMAjgu6ydVqC8Lr45hoI5e/6StwI2dw==
X-Gm-Message-State: AOJu0YydXplNjKtJ4WCI/wApifEQoJCFidFoJhBO3B1KzzDqrH1aaSMo
 wIse/Bp2aKh6/miXHd0Lw/MKvT+inOzmmnq2z7emkBcggZ/v3e8zCBhEG/eG7gXEqxlh/BMwzmv
 l2lgpqP+GiiTqRMYO98jxbihLYRY=
X-Google-Smtp-Source: AGHT+IHm0zRTpU3i/A0JVmM25LoggLAhFbg2a1hrsXcUm7MHJr4WHud5PBcWgghHM0zxa3+8cHQc/tmkKlFrhHf/w18=
X-Received: by 2002:a17:903:188:b0:1f4:ee68:3bc5 with SMTP id
 d9443c01a7336-1f4ee683c53mr18900995ad.57.1716990913482; Wed, 29 May 2024
 06:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <CADnq5_OzPT1MVnsqXs2vjr1L2_6jeM6x7jgs4ZtYpNzdDHM6uA@mail.gmail.com>
 <87r0dkiv4o.fsf@intel.com>
In-Reply-To: <87r0dkiv4o.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 May 2024 09:55:01 -0400
Message-ID: <CADnq5_NiJ9a7uYPGj9iuePTRBFKGhhFA6G982bxO2kHe-_5ASA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>, 
 hughsient@gmail.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 29, 2024 at 9:51=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 29 May 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Tue, May 28, 2024 at 5:03=E2=80=AFPM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> If the lid on a laptop is closed when eDP connectors are populated
> >> then it remains enabled when the initial framebuffer configuration
> >> is built.
> >>
> >> When creating the initial framebuffer configuration detect the ACPI
> >> lid status and if it's closed disable any eDP connectors.
> >>
> >> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> >> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Do you have drm-misc access or do you need someone to apply this for yo=
u?
>
> I've bounced this to intel-gfx and intel-xe lists to get CI testing. I'd
> appreciate holding off on merging until we have results.

Sure.

Alex

>
> Thanks,
> Jani.
>
> >
> > Alex
> >
> >> ---
> >> Cc: hughsient@gmail.com
> >> v1->v2:
> >>  * Match LVDS as well
> >> ---
> >>  drivers/gpu/drm/drm_client_modeset.c | 30 +++++++++++++++++++++++++++=
+
> >>  1 file changed, 30 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/dr=
m_client_modeset.c
> >> index 31af5cf37a09..0b0411086e76 100644
> >> --- a/drivers/gpu/drm/drm_client_modeset.c
> >> +++ b/drivers/gpu/drm/drm_client_modeset.c
> >> @@ -8,6 +8,7 @@
> >>   */
> >>
> >>  #include "drm/drm_modeset_lock.h"
> >> +#include <acpi/button.h>
> >>  #include <linux/module.h>
> >>  #include <linux/mutex.h>
> >>  #include <linux/slab.h>
> >> @@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct =
drm_connector **connectors,
> >>                 enabled[i] =3D drm_connector_enabled(connectors[i], fa=
lse);
> >>  }
> >>
> >> +static void drm_client_match_edp_lid(struct drm_device *dev,
> >> +                                    struct drm_connector **connectors=
,
> >> +                                    unsigned int connector_count,
> >> +                                    bool *enabled)
> >> +{
> >> +       int i;
> >> +
> >> +       for (i =3D 0; i < connector_count; i++) {
> >> +               struct drm_connector *connector =3D connectors[i];
> >> +
> >> +               switch (connector->connector_type) {
> >> +               case DRM_MODE_CONNECTOR_LVDS:
> >> +               case DRM_MODE_CONNECTOR_eDP:
> >> +                       if (!enabled[i])
> >> +                               continue;
> >> +                       break;
> >> +               default:
> >> +                       continue;
> >> +               }
> >> +
> >> +               if (!acpi_lid_open()) {
> >> +                       drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is clo=
sed, disabling\n",
> >> +                                   connector->base.id, connector->nam=
e);
> >> +                       enabled[i] =3D false;
> >> +               }
> >> +       }
> >> +}
> >> +
> >>  static bool drm_client_target_cloned(struct drm_device *dev,
> >>                                      struct drm_connector **connectors=
,
> >>                                      unsigned int connector_count,
> >> @@ -844,6 +873,7 @@ int drm_client_modeset_probe(struct drm_client_dev=
 *client, unsigned int width,
> >>                 memset(crtcs, 0, connector_count * sizeof(*crtcs));
> >>                 memset(offsets, 0, connector_count * sizeof(*offsets))=
;
> >>
> >> +               drm_client_match_edp_lid(dev, connectors, connector_co=
unt, enabled);
> >>                 if (!drm_client_target_cloned(dev, connectors, connect=
or_count, modes,
> >>                                               offsets, enabled, width,=
 height) &&
> >>                     !drm_client_target_preferred(dev, connectors, conn=
ector_count, modes,
> >> --
> >> 2.43.0
> >>
>
> --
> Jani Nikula, Intel
