Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23677381EAC
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 14:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C515B89199;
	Sun, 16 May 2021 12:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052B289ECD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 12:18:42 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id h7so1199173qvs.12
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1mGXyme0tS5V31oK5nRfRtDEHh64dhToBqvFaoH8HI=;
 b=bCB9ldPhw5dRnQiT21Ov+ncDDR1ggHpXO5zFG2rqwWN8fs2hNqcfazX2XON54mjxaj
 o2zFrPqCqD+Zb4u8ZUhB4DLqLdb85GA1s0ZzHVe11jmOHtWeul2hcrE/D0GyBbVKxzhC
 qokRjsVy5Ep1ngkVkqkHaETlt35jDQqkPlQ0JY2rsrFOKOqNvUFojoYcswuse1v2+J5+
 wnjbSOkiCyCj8XEM1rsaSXMYyn4TpRO8HS9QHdOAjUP8zgQjnyN2JwYS/X+iOJSotebE
 wAqwPovrujWP3q9j+Gw4CWVpYT/PGLkdoXVrsje2JXdW4P3URgRWpy0Sxzcu8UGleg0D
 wUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1mGXyme0tS5V31oK5nRfRtDEHh64dhToBqvFaoH8HI=;
 b=Qq4oqGQP7UXX8b7PmTsikkkFAbuDsIMDXiYpXrBFN4HCkTnqKJWn7MTwd6N23GhnUZ
 a3eo70TBnoviTtdh5qija01PNjei78bh77sUsFqU+23gH0tY6E0oEADnZm/kbbs8jF9F
 C/nY6aIM8PdvQ+WBHG80/u1N862Uk5oHNCk3IFxayGWrb7ns1+62spxrNVJ6BvKQegOs
 /Su3qBJx+Oa9YG2SClFvSHAQJX4GWWGJ2Ojqsuw8GkM6b4AiMrdtjF80YeOj6j5j9Py1
 F/8+FNALUwEatOkfF+AxvBCXJ+fVa99lywyxGibjMO8jRK26uM8JQYd8BhOF0VvTWd0+
 j6cA==
X-Gm-Message-State: AOAM533RujBYv/lrznIGr0hjX2S8eqvWk7Nv7hX+ieBrxfLHtreg4jbF
 rL9NM6qnBuDHw3D4njxZMxM332XdMpgfh6ldfCPL6A==
X-Google-Smtp-Source: ABdhPJxpbwGFs0dCzeVTVlYolK+rSHjDPFYgDXjIG8TMySQLA9zXCvDteMJNlxBZmmHntuS1acUZtYkggrNLg18Ro6A=
X-Received: by 2002:a0c:ca0c:: with SMTP id c12mr21679965qvk.47.1621167521075; 
 Sun, 16 May 2021 05:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210515195612.1901147-1-dmitry.baryshkov@linaro.org>
 <20210516054136.GR2484@yoga>
In-Reply-To: <20210516054136.GR2484@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 16 May 2021 15:18:31 +0300
Message-ID: <CAA8EJpq4tUQRuzXjW58mbzi9KhZHnxzhrTdLGBh3Zw4qmCcmCA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: remove most of usbpd-related remains
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 16 May 2021 at 08:41, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 15 May 14:56 CDT 2021, Dmitry Baryshkov wrote:
>
> > Remove most of remains of downstream usbpd code. Mainline kernel uses
> > different approach for managing Type-C / USB-PD, so this remains unused.
> > Do not touch usbpd callbacks for now, since they look usefull enough as
> > an example of how to handle connect/disconnect (to be rewritten into .
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Makefile        |  1 -
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
> >  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
> >  drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +--
> >  drivers/gpu/drm/msm/dp/dp_debug.h   |  4 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c | 36 ++-------------
> >  drivers/gpu/drm/msm/dp/dp_hpd.c     | 69 -----------------------------
> >  drivers/gpu/drm/msm/dp/dp_hpd.h     | 51 ---------------------
> >  drivers/gpu/drm/msm/dp/dp_power.c   |  2 +-
> >  drivers/gpu/drm/msm/dp/dp_power.h   |  3 +-
> >  10 files changed, 11 insertions(+), 168 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
> >
> [..]
> > diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
>
> It seems to me that this would be a reasonable place to plug in the
> typec_mux stuff. And as we're starting that exercise we should perhaps
> hold off on applying until we've figured out how that would look?

I'm fine with holding this for a while. Note, that actual code
handling the connection/disconnection is left in place. I've just
dropped unused data structures and related code.
In fact this started as I started looking for the place to put
typec-mux code and whether fields from dp_usbpd struct are used or not
(they are not).



-- 
With best wishes
Dmitry
