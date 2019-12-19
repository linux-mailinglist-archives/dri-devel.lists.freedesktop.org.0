Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA3125A57
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 05:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF606E093;
	Thu, 19 Dec 2019 04:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537266E072;
 Thu, 19 Dec 2019 04:45:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so4546632wre.10;
 Wed, 18 Dec 2019 20:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FNls+2gWnzt5x5cRt1q7SlFZtyrShM7rccXddy75tHs=;
 b=Z7tu6adL+OHHvvoEJ70DGp6aX5wZ+bmaYlMHtHQdKjBvIq770+yH+caJ/6phi3D53n
 cJ9Rug29o6SZ09Pwx2+t92ww06UWT+liKCSW4godxQROPV2CxI+aed887lICeVaTYaLo
 rpMccY3nez9l3MtjEitZyNohNotOJ4ArFoD1AQ61RLPB8GDMyZUajwh1MXceBVGpB0b7
 i+cAqgmnN7zzwUqcAFUw8KzJeFarPa0KLife2U5gUj6C3Nz54irDh1ZyeADuM268ji7G
 6lp4uMPGFGDTMcOVweZqeVPplN46cdi40PF7PDnq4dX//ZK0jSOtogFDWOSkj/0v8QqU
 chvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FNls+2gWnzt5x5cRt1q7SlFZtyrShM7rccXddy75tHs=;
 b=o7TqhJjKaYOvqajbJHZDmF0cGuF8ZFs4Bb0v4QEjjGeWVH6qI2n8FFuftHilcbeWG3
 rJU0VpKiXbT+Uhc33uZVGAKeuyCQYgi4tJQWacK1NmQSTzZGJ+yBYtsGg8+mWI5xamo+
 6yIpYjIkbZY2l4vzDF+AtVR+qz63Gp1RppQXhQQOJJvmdAcylA8kJkO7xHMJULmHkwca
 5ccT2EWsEXaC82NaZDkAnOPvAsHUFQLLZqt94yBbb4+kueR9afL1yDU1MCdApGlLtnOI
 NMQORqAE77SOD7zwqRG5z+7N1ZEy07fl4bw0ZGC8PUOTI8S+TYWogyIFs7bDpoYmxndf
 bGgg==
X-Gm-Message-State: APjAAAXWtj7ZmCk2z4GahuE0LcE28HC0y9gg9jOG0WLfneskE3KUp7ug
 4gS/JfgD58VhQ6wNnqxxds8PKRIOybk7H9Cnhcw=
X-Google-Smtp-Source: APXvYqynM3EFmEGEdye3EpDXwkf14ujvABA9/5A6zRi0Dmf5BllpxF9Ycf8S9khSbeP2DNNUYsmogxgbB1jn3X9VtCM=
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr6856954wrs.11.1576730726918;
 Wed, 18 Dec 2019 20:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20191217204707.2258744-1-alexander.deucher@amd.com>
 <20191217204707.2258744-2-alexander.deucher@amd.com>
 <CAPM=9twOo9TRcBkT+iR7LUJh4zkQirHB2J0A5vL7Ei0LYkQ-2Q@mail.gmail.com>
In-Reply-To: <CAPM=9twOo9TRcBkT+iR7LUJh4zkQirHB2J0A5vL7Ei0LYkQ-2Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Dec 2019 23:45:14 -0500
Message-ID: <CADnq5_Ntpao=3p-Xo5owY9s31+HhURipyyf4y+C2zRhtCVkc_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu/display: use msleep rather than udelay for
 HDCP
To: Dave Airlie <airlied@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 6:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Hey,
>
> I've pulled in these two patches to drm-next directly because my arm
> test build was broken.

Sounds good.

Alex

>
> Dave.
>
> On Wed, 18 Dec 2019 at 06:47, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > ARM has a 2000us limit for udelay.  Switch to msleep.  This code
> > executes in a worker thread so shouldn't be an atomic context.
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
> > index bcbc0b8a9aa0..f730b94ac3c0 100644
> > --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
> > +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
> > @@ -153,7 +153,7 @@ static enum mod_hdcp_status poll_l_prime_available(struct mod_hdcp *hdcp)
> >  {
> >         enum mod_hdcp_status status;
> >         uint8_t size;
> > -       uint16_t max_wait = 20000; // units of us
> > +       uint16_t max_wait = 20; // units of ms
> >         uint16_t num_polls = 5;
> >         uint16_t wait_time = max_wait / num_polls;
> >
> > @@ -161,7 +161,7 @@ static enum mod_hdcp_status poll_l_prime_available(struct mod_hdcp *hdcp)
> >                 status = MOD_HDCP_STATUS_INVALID_OPERATION;
> >         else
> >                 for (; num_polls; num_polls--) {
> > -                       udelay(wait_time);
> > +                       msleep(wait_time);
> >
> >                         status = mod_hdcp_read_rxstatus(hdcp);
> >                         if (status != MOD_HDCP_STATUS_SUCCESS)
> > @@ -474,7 +474,7 @@ static enum mod_hdcp_status locality_check(struct mod_hdcp *hdcp,
> >                          hdcp, "lc_init_write"))
> >                 goto out;
> >         if (is_dp_hdcp(hdcp))
> > -               udelay(16000);
> > +               msleep(16);
> >         else
> >                 if (!mod_hdcp_execute_and_set(poll_l_prime_available,
> >                                 &input->l_prime_available_poll, &status,
> > --
> > 2.23.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
