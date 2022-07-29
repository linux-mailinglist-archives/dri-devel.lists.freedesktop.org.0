Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB95856C6
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 00:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022FA10E3E1;
	Fri, 29 Jul 2022 22:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A5A10E3E1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 22:12:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id a89so7352492edf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 15:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5pUodpWMMYknb87Q/iOWoD6ROI6Lgw19uUzBdPJ3Uyg=;
 b=ccG1+zJ7elZwhNagMS5JcpEVguCuMJpnXq4J+9UD0xVVeLupKVDjJ86X+7fzk2RCY8
 qq6oycJ/rCAUrHbBuK/sk5W9RXbIIiFDikRsuh5+GFMFCH9pJQRG+zSbamJUlvEfuP31
 PUPvv8ZNOeLbnW7w0LPgc4o5CWidkTFzV3vzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5pUodpWMMYknb87Q/iOWoD6ROI6Lgw19uUzBdPJ3Uyg=;
 b=1ll2WWNKJVQ/6KcmYqg+K8cVl5yq2XFSOtbkibFTUR+kTP+bXpRDsVdtJKL6fCG5YE
 aue6r64lWuuiWxQMmhfB4kCrH2IT4vvyVzGAzbVr6LM7jfUIzxgVlZEhwJ/8sSSs96RG
 /upj2Qf/c6dGSro/7ar51hIbuWABbtuaM0z90fEvT23LvbkS2YjfdzLx3HwBEGlqNlBC
 LMaebLPxpe7DcWPGciqMDGoZnVpun/wGf7riWbJPUMDrkJq4Vo+naecCUWHGsrXq6ySx
 eNNfddB0JOOS8T7ryCqR6c88dOK7oS2UXMauItkanKG7hxV78+Bhflum7pcrqBsfw+H5
 2CBw==
X-Gm-Message-State: AJIora8m/fUxEiag9BUhd0W3596uzj+pK67FAjMcIadIu+JL6pAMB8Ve
 IUfvV3kU3ob5ls9j8Ekf/xDOPWtU7zuHXo5gNc0=
X-Google-Smtp-Source: AGRyM1t0GKi0ijwoNPavofZ5skqPS0vFO7PE6gCFA8aJItCoJ+HffXeM4Twx3Du8/YyzdEtKfz7HAA==
X-Received: by 2002:a05:6402:4386:b0:43b:e989:25a1 with SMTP id
 o6-20020a056402438600b0043be98925a1mr5499897edc.283.1659132761474; 
 Fri, 29 Jul 2022 15:12:41 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 f16-20020aa7d850000000b0043b986751a7sm2985675eds.41.2022.07.29.15.12.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 15:12:40 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so4742449wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 15:12:40 -0700 (PDT)
X-Received: by 2002:a05:600c:1e0f:b0:3a3:191c:a3c8 with SMTP id
 ay15-20020a05600c1e0f00b003a3191ca3c8mr3873397wmb.151.1659132759907; Fri, 29
 Jul 2022 15:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155445.RFC.1.I2999ac2d08643f0c2f3fe916cca86f8c832c8142@changeid>
 <CAA8EJpombZYHKXKd=rLte0pUaXjep0t7+H-uz_sFTuJwjH3y9A@mail.gmail.com>
In-Reply-To: <CAA8EJpombZYHKXKd=rLte0pUaXjep0t7+H-uz_sFTuJwjH3y9A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Jul 2022 15:12:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUWouY58oX+6iBThz_PiDe1_zrs7Ls4gBKER8bo_Y8QQ@mail.gmail.com>
Message-ID: <CAD=FV=VUWouY58oX+6iBThz_PiDe1_zrs7Ls4gBKER8bo_Y8QQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/panel-edp: Allow overriding the eDP EDID
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 4:36 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 21 Jul 2022 at 01:55, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > I found that writing to `/sys/kernel/debug/dri/*/eDP*/edid_override`
> > wasn't working for me. I could see the new EDID take effect in
> > `/sys/class/drm/card*-eDP*/edid` but userspace wasn't seeing it..
> >
> > The problem was that panel-edp was caching the EDID that it read and
> > using that over and over again.
> >
> > Let's change panel-edp to look at the EDID that's stored in the
> > connector. This is still a cache, which is important since this
> > function is called multiple times and readin the EDID is slow, but
> > this property is automatically updated by drm_get_edid() (which reads
> > the EDID) and also updated when writing the edid_override in debugfs.
> >
> > Fixes: 63358e24ee79 ("drm/panel: panel-simple: Cache the EDID as long as we retain power")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> A different proposal for you to consider:
> Change drm_get_edid/drm_do_get_edid to return int rather than struct
> edid, while caching the EDID in the connector. Or maybe add a new API
> drm_read_edid() and make drm_get_edid() deprecated in favour of it.
> The goal should be to let all drivers use connector-cached EDID rather
> than getting  the EDID, parsing it and kfree()ing it immediately
> afterwards.

I think the majority of drivers don't actually want the cached EDID
behavior so the edp-panel case is actually pretty rare. For everyone
else I think DRM is handling things in a pretty reasonable way.
Looking closely, it looks like there have been a bunch of patches
landed in this area recently and so I assume people are happy enough
with the current design for the majority of cases.

I guess your point though, is that the way I'm using the API right now
in ${SUBJECT} patch is a bit gross and maybe the DRM core needs a
helper of some sort for this case? Essentially what we're saying is
that we have inside knowledge this is a built-in panel and thus the
EDID will never change and it's a waste of time to read it again and
again. We could somehow tell the DRM core that.

I guess I could add a function like drm_edid_read_if_needed(). That
would essentially use the existing blob if it was there and read it
otherwise. Does that work? Basically:

def drm_edid_read_if_needed(...):
  if (connector->edid_blob_ptr)
    return dupe_edid(connector->edid_blob_ptr);
  return drm_edid_read(...);

I guess maybe we'd want a _ddc variant too.

Adding Jani since the recent patches I see touching this were his and
there are even comments there about what to do about drivers that want
to cache the EDID.


> Most probably we should be able to move
> drm_connector_update_edid_property() into drm_do_get_edid() and drop
> it from the rest of the code. This might require additional thought
> about locking, to ensure that nobody pulls the cached edid out from
> under our feet.

This all looks like it's moving now, actually. Looking around at
recent changes, I see that now the property gets updated in a
different call.

Old (deprecated)
1. drm_get_edid() <-- Updates the EDID property
2. drm_add_edid_modes()

New:
1. drm_edid_read()
2. drm_edid_connector_update() <-- Updates the EDID property


 > Extra "bonus" points to consider:
> - Maybe it's time to add get_edid() to the drm_panel interface, teach
> panel_bridge about it and let drm_bridge_connector handle all the
> details?
>
> So, while this looks like a longer path, I think it's worth checking
> that we can refactor this piece of code.

It's certainly interesting to consider. At the moment, though, it
doesn't look super easy to do. Points to note:

1. We don't necessarily want to cache the EDID for all display types.
For builtin panels it makes sense to do so, but it's less obvious for
external displays. _In theory_ we could try to cache the EDID for
external devices if we're really certain that we'll notice when
they're unplugged / re-plugged again but I'm not convinced that all
drivers always handle this. In any case, I tend to assume that when
we're dealing with external displays we're a little less interested in
trying to optimize all of the milliseconds away. If nothing else there
are hundreds of milliseconds of hotplug detect debounce happening for
external displays. Yes, we could have a rule about only caching the
EDID only for eDP displays but then the motivation of moving it out of
edp-panel and to drm_bridge_connector is a lot less.

2. At the moment, drm_bridge_connector only calls get_modes() if it
doesn't have get_edid() implemented. At the moment the panel-edp code
actually _combines_ the EDID and any hardcoded modes that were
specified. I think we'd have to resolve this difference if we do what
you suggest. The panel-edp behavior comes from before the split out of
panel-simple and dates from 2013 when panel-simple was first added.
Certainly we could arbitrarily change one behavior or the other but I
don't know what the fallout would be.

3. We still don't have universal conversion to panel_bridge and
drm_bridge_connector. Some drivers are still calling the panel
functions directly. Until everything is converted it will be extra
cruft / scaffolding to make this change without breaking those calling
the panel directly. I don't think there's enough of a hurry to do this
that it's worth the extra cruft. There just aren't that many built-in
panels that read an EDID that aren't handled by the generic panel-edp.


-Doug
