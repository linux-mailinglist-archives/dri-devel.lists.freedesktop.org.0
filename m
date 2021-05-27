Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F370393866
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 23:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1916E115;
	Thu, 27 May 2021 21:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F4C89DA5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 21:48:18 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id j184so2229054qkd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 14:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1zVv1GjmK07EWaIPDoxGxKRBfboRr4vWM9HdAWgd8h8=;
 b=gFbhrH/lrOqgsguvnI/seGtIdQLXd0j1mB0K0q/fZNVu9/dKg42cRWlvGWBMdLcmsm
 GR0LhjRyfauN/Us2dCVxfMDz0prbbMtTpZJJjo+6Ee/old3HeprB1ckBgqS2/neIatq6
 DXeRV+iVk5XYHVkdu0Vcf+TzEWtQYMSmh4Myk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1zVv1GjmK07EWaIPDoxGxKRBfboRr4vWM9HdAWgd8h8=;
 b=fVRrimAWoVWyoNRjm6fPOwHAXgO3SQApsYvwz8yiZT0YU+/CwPR32dK9IekWMdluOM
 nSZY4pDb6D5n0wDmegiGm9gYyO96iXZZCZCVFULtfrBSJOJOr2YwUZXM4I+vnwkeuEVg
 MGN6AW3Dvgctoc+RrjBEwp/uEy6KKijTmFrtzapk/OqPr9Uk6NxsQs0aV1gMaIV1HY9j
 Y2CnGdOvWlL30Fsa3krE/WT/xH8E/PpX6yT4GrhOFQsgn9WLxhQ5kfBoh/psihuHS4Ff
 cE65oCIR0vDx35LxK1IKHdgjBPmzadsSCBs1Ac2w1oGfyyVRGuZQYBCNRFswmmqFRigU
 3+sw==
X-Gm-Message-State: AOAM531WWPGKlH5iVtIrwRTe+J3xVuLJ1sGLydBKFS279N/PGiymDnn3
 r66bS7WtAqaVpSUs6siMODGnJ5klR2TLnA==
X-Google-Smtp-Source: ABdhPJyz2izMW+HA96E/7jV1CPgrqovSVdhAybEzSHCT9QwBHE/VGwxl7nUtoBd4g7K7onpUhLJ31A==
X-Received: by 2002:a37:9c17:: with SMTP id f23mr656624qke.125.1622152097521; 
 Thu, 27 May 2021 14:48:17 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id k75sm2260391qke.103.2021.05.27.14.48.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 14:48:17 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id z38so2746825ybh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 14:48:17 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr7998436ybk.405.1622151679762; 
 Thu, 27 May 2021 14:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
 <CAD=FV=WzQ0Oc=e3kmNeBZUA+P1soKhBk8zt7bG1gqJ-Do-Tq_w@mail.gmail.com>
 <42db3a26684a5329287d57e1e78d0475@codeaurora.org>
In-Reply-To: <42db3a26684a5329287d57e1e78d0475@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 May 2021 14:41:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UuWuKibpT15McweuZ24qxsSAsSvJ3Q2MbZqgw5oggBVQ@mail.gmail.com>
Message-ID: <CAD=FV=UuWuKibpT15McweuZ24qxsSAsSvJ3Q2MbZqgw5oggBVQ@mail.gmail.com>
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 mkrishn@codeaurora.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 27, 2021 at 5:21 AM <rajeevny@codeaurora.org> wrote:
>
> >> @@ -171,6 +172,19 @@ struct panel_desc {
> >>
> >>         /** @connector_type: LVDS, eDP, DSI, DPI, etc. */
> >>         int connector_type;
> >> +
> >> +       /**
> >> +        * @uses_dpcd_backlight: Panel supports eDP dpcd backlight
> >> control.
> >> +        *
> >> +        * Set true, if the panel supports backlight control over eDP
> >> AUX channel
> >> +        * using DPCD registers as per VESA's standard.
> >> +        */
> >> +       bool uses_dpcd_backlight;
> >> +};
> >> +
> >> +struct edp_backlight {
> >> +       struct backlight_device *dev;
> >
> > Can you pick a name other than "dev". In my mind "dev" means you've
> > got a "struct device" or a "struct device *".
>
> In the backlight.h "bd" is used for "struct backlight_device". I can use
> "bd"?

That would be OK w/ me since it's not "dev". In theory you could also
call it "base" like panel-simple does with the base class drm_panel,
but I'll leave that up to you. It's mostly that in my brain "dev" is
reserved for "struct device" but otherwise I'm pretty flexible.


> >> +       struct drm_edp_backlight_info info;
> >>  };
> >>
> >>  struct panel_simple {
> >> @@ -194,6 +208,8 @@ struct panel_simple {
> >>
> >>         struct edid *edid;
> >>
> >> +       struct edp_backlight *edp_bl;
> >> +
> >
> > I don't think you need to add this pointer. See below for details, but
> > basically the backlight device should be in base.backlight. Any code
> > that needs the containing structure can use the standard
> > "container_of" syntax.
> >
>
> The documentation of the "struct drm_panel -> backlight" mentions
> "backlight is set by drm_panel_of_backlight() and drivers shall not
> assign it."
> That's why I was not sure if I should touch that part. Because of this,
> I added
> backlight enable/disable calls inside panel_simple_disable/enable().

Fair enough. In my opinion (subject to being overridden by the adults
in the room), if you move your backlight code into drm_panel.c and
call it drm_panel_dp_aux_backlight() then it's fair game to use. This
basically means that it's no longer a "driver" assigning it since it's
being done in drm_panel.c. ;-) Obviously you'd want to update the
comment, too...


> >> +               err = drm_panel_of_backlight(&panel->base);
> >> +               if (err)
> >> +                       goto disable_pm_runtime;
> >> +       }
> >
> > See above where I'm suggesting some different logic. Specifically:
> > always try the drm_panel_of_backlight() call and then fallback to the
> > AUX backlight if "panel->base.backlight" is NULL and "panel->aux" is
> > not NULL.
>
> What I understood:
> 1. Create a new API drm_panel_dp_aux_backlight() in drm_panel.c
> 1.1. Register DP AUX backlight if "struct drm_dp_aux" is given and
>      drm_edp_backlight_supported()
> 2. Create a call back function for backlight ".update_status()" inside
> drm_panel.c ?
>    This function should also handle the backlight enable/disable
> operations.
> 3. Use the suggested rules to call drm_panel_dp_aux_backlight() as a
> fallback, if
>     no backlight is specified in the DT.
> 4. Remove the @uses_dpcd_backlight flag from panel_desc as this should
> be auto-detected.

This sounds about right to me.

As per all of my reviews in the DRM subsystem, this is all just my
opinion and if someone more senior in DRM contradicts me then, of
course, you might have to change directions. Hopefully that doesn't
happen but it's always good to give warning...

-Doug
