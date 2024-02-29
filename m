Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CE86BD08
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 01:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0BA10E11B;
	Thu, 29 Feb 2024 00:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PnjbKNNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDF810E11B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 00:55:04 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6e49518f375so153904a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709168103; x=1709772903;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQy5G7oDQ9yO1ykBUcJTCy0oyYvjoo8NP1jXy9LgNWA=;
 b=PnjbKNNugxomv+bxOL5fGUq4bAmVmyVoOMutz78vx5ItT9nffKxCGnGB0ReWYVrrn8
 YO80j4zNrrxRwstMclxfiAb/e1CajSzyaABrvdFQmJaW4ALZHqivllVQOtwwa8D+C098
 FNYn3NfcXtmhvN1xWKMq5QgIR4tGgeQHWoNWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709168103; x=1709772903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQy5G7oDQ9yO1ykBUcJTCy0oyYvjoo8NP1jXy9LgNWA=;
 b=pxDnntpB6UsrMDEuJOx1ZsXEjM2wo3pEyteQTvlgkgNb0D3IcQx/c99Qh196Nzza7X
 LI3GjUooXzAgxe3cQV0YwG9qXxwTTkv5G5U5VCTypS7nd9TVB/X4FG7mXSxsGtRu624c
 6FtcdE5AysvWVYlFO9VlRRb6Loh/o3kEOIFLQdLYIOrtkEO1jf0ZPzJtzBIq9YbG1+Iz
 3nE6AYKGNBeCLe7tuJ8BoKMAA/gtgFTY9nfEEp7ziDT0GOF25xiGb/QYIxSRycu67RR9
 UroTcwAvKzPmd5nEjpNHkBYki7KuIaeDsOkPUTmM93s96eDZWv0X7DTNkYmxGnZogGvR
 /BIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4nyXZvPRSF3V81nOJ1eth9t1ag6vMyecP7RBJDUjvZD/HNvbnPPHS0lp/LtGVmCsLuv2YkHxjRZoSIXts3TdvvzW0LMT80v4ckUT2lsvN
X-Gm-Message-State: AOJu0YwOi0TG9khy6O3sFx7njMeIH8PZ8JJxxM2TzOCM6AZVUshiV/rq
 SFZ0eckWUt5WD+7MGlFb5107uKebsBu4xGjjb4JfA6CUCvvrbdRh4gPyfy+3uy3A4RBOEqTq0EY
 UbYb7bfKMeJDKJOAedKyVRHepNsTjaO2/7xLy
X-Google-Smtp-Source: AGHT+IEzdFFPaPuH0qFsjov71+EByP7TBcyvnv3GYpOy0geZfzLmBF5kHnk9MV5f9WyC5cCYEJbpdi9YB+pCb62WEMk=
X-Received: by 2002:a9d:6a85:0:b0:6e4:2498:fa2e with SMTP id
 l5-20020a9d6a85000000b006e42498fa2emr649762otq.37.1709168103696; Wed, 28 Feb
 2024 16:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-2-hsinyi@chromium.org>
 <CAD=FV=XCGCpLmCQhfTXfrOON99KLbR5pR59jaiD_V14szn6qsA@mail.gmail.com>
In-Reply-To: <CAD=FV=XCGCpLmCQhfTXfrOON99KLbR5pR59jaiD_V14szn6qsA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 28 Feb 2024 16:54:37 -0800
Message-ID: <CAJMQK-j5oDS1H=x2=tAcna1XK9JN8SdyHV-rHJvMgJX7S-3MHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm_edid: Support getting EDID through ddc without
 connector
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Feb 28, 2024 at 4:21=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
> >
> > Some panels are interested in the EDID during early probe when connecto=
r
> > is still unknown.
> >
> > Add a function drm_get_edid_no_connector() to get edid without connecto=
r.
> > No functional change for existing usage.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v1->v2:
> > add a function to return the entire edid without updating connector.
> > ---
> >  drivers/gpu/drm/drm_edid.c | 45 ++++++++++++++++++++++++++++----------
> >  include/drm/drm_edid.h     |  1 +
> >  2 files changed, 34 insertions(+), 12 deletions(-)
>
> I'll respond in the discussion in v1 too, but overall I'm not a fan of
> reading the whole EDID twice at bootup. Personally I'd love to see us
> to back to just reading the base block like in v1, but I guess we can
> see what Jani and others say.
>
>
> > @@ -2385,18 +2385,20 @@ static struct edid *_drm_do_get_edid(struct drm=
_connector *connector,
> >         if (status =3D=3D EDID_BLOCK_READ_FAIL)
> >                 goto fail;
> >
> > -       /* FIXME: Clarify what a corrupt EDID actually means. */
> > -       if (status =3D=3D EDID_BLOCK_OK || status =3D=3D EDID_BLOCK_VER=
SION)
> > -               connector->edid_corrupt =3D false;
> > -       else
> > -               connector->edid_corrupt =3D true;
> > +       if (connector) {
> > +               /* FIXME: Clarify what a corrupt EDID actually means. *=
/
> > +               if (status =3D=3D EDID_BLOCK_OK || status =3D=3D EDID_B=
LOCK_VERSION)
> > +                       connector->edid_corrupt =3D false;
> > +               else
> > +                       connector->edid_corrupt =3D true;
> >
> > -       if (!edid_block_status_valid(status, edid_block_tag(edid))) {
> > -               if (status =3D=3D EDID_BLOCK_ZERO)
> > -                       connector->null_edid_counter++;
> > +               if (!edid_block_status_valid(status, edid_block_tag(edi=
d))) {
> > +                       if (status =3D=3D EDID_BLOCK_ZERO)
> > +                               connector->null_edid_counter++;
> >
> > -               connector_bad_edid(connector, edid, 1);
> > -               goto fail;
> > +                       connector_bad_edid(connector, edid, 1);
> > +                       goto fail;
>
> This "goto fail" is now only run "if (connector)" which means that
> you're not properly checking if the EDID is valid when "connector =3D=3D
> NULL", right? That seems like a bug unless I missed something...

We can't check with connector_bad_edid() since there's no connector.
But we still check with edid_block_read() status, similar to what the
original drm_edid_get_panel_id() checks.
