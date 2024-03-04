Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED78710F2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 00:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967C810FAA3;
	Mon,  4 Mar 2024 23:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ok8CNjU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631D11126DB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 23:10:22 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-608959cfcbfso1147407b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 15:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709593821; x=1710198621; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MDgkNYWU4DWfsyWb+GlMK9bHYQCTEtx1BFNrE0oEImA=;
 b=Ok8CNjU/5lE1fCwcWf1UT+YHTqyPuj13aXUcUr1i4GnH2OTYXS30d4Rm346snGwqQ9
 rHiItCkEfaLq+M5G7Imo8o8Ov3jbORjLeNcKYCdhW6Rybtr+I9bydPWkFsm33CsxLGqr
 bJRRHE/QhwtOkfPPef0Q6KZIc8PFYypFvNafSyvC0IwxgdiBDF6MO98e1TbSW5H+aO0D
 JUcWLJexpkNmSFSyrJnHQ1N0kpGMRWkMK1b6EJuUy4lMxSWm5qjq2UihoPWG8j1UGKpJ
 Iu8DZGyWKNfqPTB1tHCozNvhmqbpXCDTA4PhpmheBmwWVE+iYzEZsHkWQ1JsgGUX8MhE
 U2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709593821; x=1710198621;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MDgkNYWU4DWfsyWb+GlMK9bHYQCTEtx1BFNrE0oEImA=;
 b=n3c2StPVdsGgTPZPOIvZTitholuC7Xi4JfKeFYil6VoriJDJGGegWIyo8XYqTlXgrN
 PgoYOjoZrNEGTvGWdI3/DcfTjY8dyL6Rs6km8VuAJ9jVqu+zpr7OkukbYe74h5n//rH4
 /scuONFdbjaNUxRU/hML4XKdgkFP7aRmVGdqg459CRc5Rn/8wLROqukFt2Rs5Lqz7syx
 1uqonbVTs+KOUS7CltSvp5vt1e/7PaRRtNclFQcCky4WTwaPP1P4PVT+REseszEIxUp3
 XhTXWyvLWMAida8K2zmgU0e5xCNER5rgLVzWHpLPs832yO92l1VsAbHsoSBA9l3Riedj
 TM/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5I+R0o9WKM+TiAXEmTDWo8h86xIzSHnmWkA7Dvzr88dipqNU5ke6KbVmGjhHV420zjBBkInHjRpZtc5r3xO1W5xYZHQdZdCL5OLlU1SB4
X-Gm-Message-State: AOJu0Ywo6Bw45o77HR8fETbWN1c4k4a/S0stwRdyC4jOgaNaDiNQ5Qev
 FkZOIs0QV7rqOp4egDwQom+UElOhYvHk0bg4+5+dKUeFFCFhrb9OVzS+rxptFnkOuuCm0bF4uix
 kEKldAdqs1W77yAYflxNcYEx0XpC2sAmASWCkeQ==
X-Google-Smtp-Source: AGHT+IGcubG2zCEwx0B1zfivsMQ7pWwmtzPaSlsXlK64sn8zBfoYfIkPKcZ6Ss3lt89bmQoRkMPn5GhXL+a/uIuio84=
X-Received: by 2002:a05:6902:544:b0:dcc:9e88:b15 with SMTP id
 z4-20020a056902054400b00dcc9e880b15mr8059955ybs.41.1709593820947; Mon, 04 Mar
 2024 15:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20240304195214.14563-1-hsinyi@chromium.org>
 <20240304195214.14563-3-hsinyi@chromium.org>
 <87a5nd4tsg.fsf@intel.com>
In-Reply-To: <87a5nd4tsg.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Mar 2024 01:10:08 +0200
Message-ID: <CAA8EJprt=B94En8SuuEDcBGVAaZ842_=eMSeCwk_e1Sif3J6oQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, 4 Mar 2024 at 22:38, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Mon, 04 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > Add a function to check if the EDID base block contains a given string.
> >
> > One of the use cases is fetching panel from a list of panel names, since
> > some panel vendors put the monitor name after EDID_DETAIL_MONITOR_STRING
> > instead of EDID_DETAIL_MONITOR_NAME.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v2->v3: move string matching to drm_edid
> > ---
> >  drivers/gpu/drm/drm_edid.c | 49 ++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     |  1 +
> >  2 files changed, 50 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 13454bc64ca2..fcdc2bd143dd 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -2789,6 +2789,55 @@ u32 drm_edid_get_panel_id(struct edid_base_block *base_block)
> >  }
> >  EXPORT_SYMBOL(drm_edid_get_panel_id);
> >
> > +/**
> > + * drm_edid_has_monitor_string - Check if a EDID base block has certain string.
> > + * @base_block: EDID base block to check.
> > + * @str: pointer to a character array to hold the string to be checked.
> > + *
> > + * Check if the detailed timings section of a EDID base block has the given
> > + * string.
> > + *
> > + * Return: True if the EDID base block contains the string, false otherwise.
> > + */
> > +bool drm_edid_has_monitor_string(struct edid_base_block *base_block, const char *str)
> > +{
> > +     unsigned int i, j, k, buflen = strlen(str);
> > +
> > +     for (i = 0; i < EDID_DETAILED_TIMINGS; i++) {
> > +             struct detailed_timing *timing = &base_block->edid.detailed_timings[i];
> > +             unsigned int size = ARRAY_SIZE(timing->data.other_data.data.str.str);
> > +
> > +             if (buflen > size || timing->pixel_clock != 0 ||
> > +                 timing->data.other_data.pad1 != 0 ||
> > +                 (timing->data.other_data.type != EDID_DETAIL_MONITOR_NAME &&
> > +                  timing->data.other_data.type != EDID_DETAIL_MONITOR_STRING))
> > +                     continue;
> > +
> > +             for (j = 0; j < buflen; j++) {
> > +                     char c = timing->data.other_data.data.str.str[j];
> > +
> > +                     if (c != str[j] ||  c == '\n')
> > +                             break;
> > +             }
> > +
> > +             if (j == buflen) {
> > +                     /* Allow trailing white spaces. */
> > +                     for (k = j; k < size; k++) {
> > +                             char c = timing->data.other_data.data.str.str[k];
> > +
> > +                             if (c == '\n')
> > +                                     return true;
> > +                             else if (c != ' ')
> > +                                     break;
> > +                     }
> > +                     if (k == size)
> > +                             return true;
> > +             }
> > +     }
> > +
> > +     return false;
> > +}
> > +
>
> So we've put a lot of effort into converting from struct edid to struct
> drm_edid, passing that around in drm_edid.c, with the allocation size it
> provides, and generally cleaning stuff up.
>
> I'm not at all happy to see *another* struct added just for the base
> block, and detailed timing iteration as well as monitor name parsing
> duplicated.
>
> With struct drm_edid you can actually return an EDID that only has the
> base block and size 128, even if the EDID indicates more
> extensions. Because the whole thing is *designed* to handle that
> gracefully. The allocated size matters, not what the blob originating
> outside of the kernel tells you.
>
> What I'm thinking is:
>
> - Add some struct drm_edid_ident or similar. Add all the information
>   that's needed to identify a panel there. I guess initially that's
>   panel_id and name.
>
>     struct drm_edid_ident {
>         u32 panel_id;
>         const char *name;
>     };
>
> - Add function:
>
>     bool drm_edid_match(const struct drm_edid *drm_edid, const struct drm_edid_ident *ident);
>
>   Check if stuff in ident matches drm_edid. You can use and extend the
>   existing drm_edid based iteration etc. in
>   drm_edid.c. Straightforward. The fields in ident can trivially be
>   extended later, and the stuff can be useful for other drivers and
>   quirks etc.

That sounds perfect!

>
> - Restructure struct edp_panel_entry to contain struct
>   drm_edid_ident. Change the iteration of edp_panels array to use
>   drm_edid_match() on the array elements and the edid.
>
> - Add a function to read the EDID base block *but* make it return const
>   struct drm_edid *. Add warnings in the comments that it's only for
>   panel and for transition until it switches to reading full EDIDs.
>
>     const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
>
>   This is the *only* hackish part of the whole thing, and it's nicely
>   isolated. For the most part you can use drm_edid_get_panel_id() code
>   for this, just return the blob wrapped in a struct drm_edid envelope.
>
> - Remove function:
>
>     u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>
> - Refactor edid_quirk_list to use the same id struct and match function
>   and mechanism within drm_edid.c (can be follow-up too).

I wonder if we can take one step further and merge edp_panels to
edid_quirk_list (as one of the follow-ups). Maybe just some bits of
it.


> - Once you change the panel code to read the whole EDID using
>   drm_edid_read family of functions in the future, you don't have to
>   change *anything* about the iteration or matching or anything, because
>   it's already passing struct drm_edid around.
>
>
> I hope this covers everything.
>
> BR,
> Jani.
>
>
> >  /**
> >   * drm_edid_get_base_block - Get a panel's EDID base block
> >   * @adapter: I2C adapter to use for DDC
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 2455d6ab2221..248ddb0a6b5d 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -416,6 +416,7 @@ struct edid *drm_get_edid(struct drm_connector *connector,
> >                         struct i2c_adapter *adapter);
> >  struct edid_base_block *drm_edid_get_base_block(struct i2c_adapter *adapter);
> >  u32 drm_edid_get_panel_id(struct edid_base_block *base_block);
> > +bool drm_edid_has_monitor_string(struct edid_base_block *base_block, const char *str);
> >  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
> >                                    struct i2c_adapter *adapter);
> >  struct edid *drm_edid_duplicate(const struct edid *edid);
>
> --
> Jani Nikula, Intel



-- 
With best wishes
Dmitry
