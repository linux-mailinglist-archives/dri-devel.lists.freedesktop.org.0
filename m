Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9691077F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3C10EA25;
	Thu, 20 Jun 2024 14:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WKriv/WB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE03510EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:06:29 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6316253dc2aso8945987b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718892388; x=1719497188;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gWXDJls4dpzgpe6CnAsPBc+1S3uAUYBkZfLytSVEVCI=;
 b=WKriv/WB1z+k+sjGLWGaKy4TZvkTDYD8ROXyuBZ8e7cTocfgAGylovRnc7eQ6+sK4w
 fZNCx9SrI9jxCLDWddxeuH3CQStwtj1B8AFLPd1qK0mi9jv+9ZKBAZba8TF0EUXgEyij
 h5TdmXIRmD8nACGVv4FpAa0l2zasnrGu2MH8t7kz2jQqly+Pplj/hyUt2YCVXugej0Mh
 Om/RS+d7RHzCGUfgKrOicq5LQ/gByBX7RqtqDZARl2IE1DERiHf60cX1s0WV02/NVs6L
 jvZ5tj8g7nU9LciuI+D2JQz6xO5EEebdJdXKZXouVoUd0W3bW45S1245exSoc9Ur2Ekv
 EYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718892388; x=1719497188;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gWXDJls4dpzgpe6CnAsPBc+1S3uAUYBkZfLytSVEVCI=;
 b=Yhn8uib0PuI154INLLjEi2AZae3DACoS5xaL/JB54ZiFAETNvArXXpB7o1KB0cSNyw
 iY+cGarPrAUlsMTksW27jntrLhH4tswSZO70NkgZbuJF+VTz0uqcRh2e7jglEu5rDAWt
 5XV51gJtlxPEg0LMWpQq5IGwkDiScpNFoxZXVAjnoZESoQ75CrNUuB0ZujjhxqWW91zj
 zAAnpiwApiGAAoFVvqnX3vJjP8kSfzhgGuAJSgOC59tOIVoBontn7myXnlBuz0+xVe51
 sUajy23iGWNb8seNuU4FBSJk0A8RyMvj8zKz5aeMk+GBUIFJ+7BMHxjAlZy40GLv3iuh
 zyAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4o0Vm6bwaiTTKZgMlqTf6/OeZtMKcBqSA4vFCZ8Z9YzzutTjyq+nOEIIif33fHM6MrKbcRA6+GVQfWgVeWKnCiuaiEhKnin09WG8LGfIY
X-Gm-Message-State: AOJu0YyBlyodakKWA5DWF8be5ui2VVyZK1pEvGeOJz+qfykLiLxC5/M2
 ZAjMX7BhlRH2q4Gar+Dr9L4SlhbqgZLmGyA1xQYc7hjsaxWUbze3Y3QBZC8PM/x4Nw2Ro1u5g+Y
 OFBTfqL31Uhv597T+2qrUNvQfVdX3QWkh4aAxQA==
X-Google-Smtp-Source: AGHT+IFBvU3yuwNy8oVHlmAZ2JRbMDCa1Uq4iGDnhk1tJdNdfnUW85ZpjaqYZ4WzZeerSaVtgvDlrMn9gqlgCM7FxIs=
X-Received: by 2002:a25:aa4d:0:b0:e02:5186:a268 with SMTP id
 3f1490d57ef6-e02be1023e5mr5568899276.6.1718892388225; Thu, 20 Jun 2024
 07:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240620111401.3629380-1-dave.stevenson@raspberrypi.com>
 <20240620-optimistic-kittiwake-of-vitality-f1ae20@houat>
In-Reply-To: <20240620-optimistic-kittiwake-of-vitality-f1ae20@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 Jun 2024 15:06:11 +0100
Message-ID: <CAPY8ntDLqTXvvpLb=6Q5TQD-Dzj1pScg_scUWBpcg3oBMggyxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: drm : vc4: Add Raspberry Pi as
 maintainers
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 20 Jun 2024 at 14:52, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Jun 20, 2024 at 12:14:00PM GMT, Dave Stevenson wrote:
> > Add myself and our kernel maintenance list as maintainers for
> > VC4 alongside Maxime.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d1566c647a50..b6dd628d5bc6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7520,6 +7520,8 @@ F:      include/uapi/drm/v3d_drm.h
> >
> >  DRM DRIVERS FOR VC4
> >  M:   Maxime Ripard <mripard@kernel.org>
> > +M:   Dave Stevenson <dave.stevenson@raspberrypi.com>
> > +M:   Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>
> I don't think we can put a list as maintainer, maintainers (and
> reviewers) should be explicit. We can definitely put the list as Cc with
> L: though :)

It's been accepted for Unicam
https://github.com/torvalds/linux/blob/master/MAINTAINERS#L4178-L4183

bcm-kernel-feedback-list@broadcom.com is listed as reviewer for a fair
number of entries.

I'd prefer it to be more than just a list as it's obviously not an
open list, but I don't really mind.

  Dave
