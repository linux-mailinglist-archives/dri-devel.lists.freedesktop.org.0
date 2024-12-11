Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511779ED07F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 16:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E8810E3ED;
	Wed, 11 Dec 2024 15:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZPMGVq0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC6F10E3ED
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:55:07 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-71e1728c307so603366a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 07:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733932506; x=1734537306;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cM4xWNbBQiQSKcdY0A3fSeeNjHX/5IOfsxpBhHQV0Y0=;
 b=ZPMGVq0whrZI6OzD+8HOzeNXdgkp2Y5GRcq8YH45VgWz0qvqip1GfZ6dZjZlNu14Mn
 Z5DBKt2GXYOZGGcZSuN6tDSReMfEZ9d8e7UMIMq30wvnq2MCh/9nd3vjjros/cpxzZdZ
 1zZ/saGN7+X6Ii11aCtdtQ+tSbzvWlP3mtngE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932506; x=1734537306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cM4xWNbBQiQSKcdY0A3fSeeNjHX/5IOfsxpBhHQV0Y0=;
 b=jG6S9u+oKpJg8HuVNUYEK2Zd4hA1XrPRHteYTuY83DtNxkPjL0NGc9Hed+TK0K+FFd
 NEBNf8E7mLQ8aoxlGyr3WsM4LP4nLLemegPrZkdPu7gTsZXNYnEapwPwML9kKW2bWtY/
 sZ4S7QZdiVFIRlaKh/8Kx2oQWPWsS/9mSB/dx+75MNn5oWxwYdnAtXEe96U9OhbZvO3c
 cHaNGiRuDFBWyMyfKixkEjuzQeiyjmxxa/pmbVnX8lSNgIKHix+QnYqQV9yypvQwymg8
 MSY+PpTnEA5ZhYVBTTZNE1OTOSFVqf3np/yYMffait4+t/Sb416uK81Ilo3NbcFE0o21
 YcCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxVU2loHJQ+ps9dX2wsgsCYZ9aysOpd6NYlSbeS8P9yC0ASpfbHOk5HMi6tPOr2Dz6lgB5EuZxWR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXxjQSf9+2ltq0waKej/YbhHLL3HrNMA33IevFY+WNUl6tXmxd
 /RnIdVekslG/D+KnU5dUvJBGgA5GDZLDccyEDQr+29PLfTbdkYq0GmwBvULG1Fi7xR9SQSp9OUZ
 YvPNmR86EkLPbqj3vewoHV6t3yhbgkVu1g14V
X-Gm-Gg: ASbGncszWrqWE7RRBJPbZ4aBIcSD83Q4bvpMSGAwKiEizexDIq8qnxG4qIwZ4AMBjuV
 MFfTHBbJ2TtzPjIP4+5VSVGZz1p5Vsb5qVT/VWwtdnjNa8heTpBvKNFuJD215WBXOdg==
X-Google-Smtp-Source: AGHT+IEx/8qyRNCpAGNyBiIPDTaO6ywfXdqcQHAcz/L6po3vkqyog9ldUzPG1MyazfliKkJNK0LiFAhyClCexcxNoJQ=
X-Received: by 2002:a05:6830:6f0b:b0:71d:641b:8295 with SMTP id
 46e09a7af769-71e19b469b3mr2387272a34.28.1733932506288; Wed, 11 Dec 2024
 07:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20241209064632.1705578-1-xji@analogixsemi.com>
 <fy6zvkdidz2srerfq5bshgcshps2wfa4syxwndwesgxcej66ws@nf5svlpkeodh>
In-Reply-To: <fy6zvkdidz2srerfq5bshgcshps2wfa4syxwndwesgxcej66ws@nf5svlpkeodh>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 11 Dec 2024 23:54:54 +0800
Message-ID: <CAEXTbpeC9DpLxHm2fw7hWKGfpxhUy5ZgHXtGJ0=WSxRrVa845w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge:anx7625: Update HDCP status at
 atomic_disable()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@google.com, 
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

Hi Dimitry,

Thanks for the review.

On Wed, Dec 11, 2024 at 5:44=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Dec 09, 2024 at 02:46:32PM +0800, Xin Ji wrote:
> > When user enabled HDCP feature, upper layer will set HDCP content
> > to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> > HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> > support HDCP feature.
> >
> > However once HDCP content turn to  DRM_MODE_CONTENT_PROTECTION_ENABLED
> > upper layer will not update the HDCP content to
> > DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.
>
> What is "upper layer"? Is it a kernel or a userspace?

I think Xin meant userspace, but sounds like there are some
misunderstanding around the HDCP status.
>
> >From drm_hdcp_update_content_protection() documentation:
>
> No uevent for DESIRED->UNDESIRED or ENABLED->UNDESIRED,
> as userspace is triggering such state change and kernel performs it witho=
ut
> fail.This function update the new state of the property into the connecto=
r's
> state and generate an uevent to notify the userspace.
>
>
> >
> > So when user dynamic change the display resolution, anx7625 driver must
> > call drm_hdcp_update_content_protection() to update HDCP content to
> > DRM_MODE_CONTENT_PROTECTION_UNDESIRED in bridge interface
> > .atomic_disable().
>
> Why?
>
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 25 ++++++++++++++++++-----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/dr=
m/bridge/analogix/anx7625.c
> > index a2675b121fe4..a75f519ddcb8 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_dat=
a *ctx)
> >                                TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
> >  }
> >
> > +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ct=
x)
> > +{
> > +     struct device *dev =3D ctx->dev;
> > +
> > +     if (!ctx->connector)
> > +             return;
> > +
> > +     anx7625_hdcp_disable(ctx);
> > +
> > +     ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > +     drm_hdcp_update_content_protection(ctx->connector,
> > +                                        ctx->hdcp_cp);
> > +
> > +     dev_dbg(dev, "update CP to UNDESIRE\n");
> > +}
> > +
> >  static int anx7625_hdcp_enable(struct anx7625_data *ctx)
> >  {
> >       u8 bcap;
> > @@ -2165,11 +2181,8 @@ static int anx7625_connector_atomic_check(struct=
 anx7625_data *ctx,
> >                       dev_err(dev, "current CP is not ENABLED\n");
> >                       return -EINVAL;
> >               }
> > -             anx7625_hdcp_disable(ctx);
> > -             ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > -             drm_hdcp_update_content_protection(ctx->connector,
> > -                                                ctx->hdcp_cp);
> > -             dev_dbg(dev, "update CP to UNDESIRE\n");
> > +
> > +             anx7625_hdcp_disable_and_update_cp(ctx);
>
> No. atomic_check() MAY NOT perform any changes to the hardware. It might
> be just a probe from userspace to check if the mode or a particular
> option can be set in a particular way. There is no guarantee that
> userspace will even try to commit it.

So, we should move the hdcp status update from .atomic_check() to
.atomic_enable() and .atomic_disable(), right? That is, enable HDCP
for the chip at .atomic_enable() if it is DESIRED and disable it at
.atomic_disable() if we enabled it previously.

Maybe we can keep some of the checks in .atomic_check(), but I doubt
if those logics actually make sense.
>
> >       }
> >
> >       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > @@ -2449,6 +2462,8 @@ static void anx7625_bridge_atomic_disable(struct =
drm_bridge *bridge,
> >
> >       dev_dbg(dev, "drm atomic disable\n");
> >
> > +     anx7625_hdcp_disable_and_update_cp(ctx);
> > +
> >       ctx->connector =3D NULL;
> >       anx7625_dp_stop(ctx);
> >
> > --
> > 2.25.1
> >
>
> --
> With best wishes
> Dmitry

Regards,
Pin-yen
