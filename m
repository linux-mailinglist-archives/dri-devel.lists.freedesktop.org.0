Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD15A1BE181
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8C6EEB9;
	Wed, 29 Apr 2020 14:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5316EEB7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:47:06 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id b18so2677174ilf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4nb5OSoAN8ie6yt2r0ePywGsKLoArLLEE62l01Mqvg=;
 b=Fp0DHCe6K5WKfN59LJatWyE7iNJhL8Nx+3lOkEc3rg72r8WLyTIaTgBh6uyPXpHyva
 jbgQH1gNcIMsu2iECDOSUSi7YZ16Xt0luJFhizcDIOZXRGvnodWlEakexHwJ2GNcPYge
 Aw8WKZcT51v+cbsBd+EFR3Ud3lI+nmpqEBHz9Lo5d5q2gv/X1dTq3hfnjSwi+PN/rAn1
 F1L47U7kS6EgYMalfC/Vhf9mOfn3NZ6oTVWZhR34PwFO0Oa07fPJiT/+wMQ8+jzOacZb
 yjU2qSEzcD7GjbbLjCALno6PYsG7/whvfT9myfP7Z6AIRrLD9fc0Nn7ZAfciwFZT0m5a
 GKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4nb5OSoAN8ie6yt2r0ePywGsKLoArLLEE62l01Mqvg=;
 b=lsOQta/jFPn8GzUYYBwy60C+C72f4ql/g8eOdmvib6xVdmgIcM45S7AQB68Acq4xQ7
 aAsJsbxMy6AqH+eMEnH/9ju6kEkykhZNIMBWsTmV4YE+ZltIYgMeE0RsGV/OGlXjlT9R
 vhgKN+4Jg/pb9EoErOcUINm3E1lYSz8knw0DHmoErywY2hqgfRJQU5+qWO831O0evgXG
 B5LtRn3CgYbfbGZwLxOo3DD08coCA/NtYtw5KxwSEw74WKLOuVk8qyPVavQjCGBWHaKj
 Sch73sGLT9736jd6OM4QVcl9mS3XSa9XwGjClwv2sFFpHY1ufm5jC5B11SN1oyvPNJ28
 LcSg==
X-Gm-Message-State: AGi0Pua+DIFTUd0Myzm0mMDpLgJJIhGQrhwKOPQC8z/m8cAdTUubMMbl
 a6lY2JNCsrKtkyvGWw3476htIh141zrngWz9dbzyoA==
X-Google-Smtp-Source: APiQypKYEBd5xzce8ioXbigLXIc5OyrjH0o4CugkDdZgYPSoQvTZW4JNssPdhH+Vqymnb/mGabCKnNQ87CLstZr3qf4=
X-Received: by 2002:a92:3603:: with SMTP id d3mr32296601ila.264.1588171625584; 
 Wed, 29 Apr 2020 07:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200414184835.2878-1-sean@poorly.run>
 <20200414190258.38873-1-sean@poorly.run>
 <20200429135037.GF22816@intel.com>
 <CAMavQKKOKfcJSN1GjKctQp4qw6LyP6WNE9Q3Y4LedkjzcvPXxA@mail.gmail.com>
 <20200429142221.GG22816@intel.com>
In-Reply-To: <20200429142221.GG22816@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 29 Apr 2020 10:46:29 -0400
Message-ID: <CAMavQKJJ5h+v0_RQVh6Yanjsz=ZbDyo=5AFVgfrkJcTVjynz9A@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Fix HDCP failures when SRM fw is missing
To: Ramalingam C <ramalingam.c@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, stable <stable@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 10:22 AM Ramalingam C <ramalingam.c@intel.com> wrote:
>
> On 2020-04-29 at 09:58:16 -0400, Sean Paul wrote:
> > On Wed, Apr 29, 2020 at 9:50 AM Ramalingam C <ramalingam.c@intel.com> wrote:
> > >
> > > On 2020-04-14 at 15:02:55 -0400, Sean Paul wrote:
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > The SRM cleanup in 79643fddd6eb2 ("drm/hdcp: optimizing the srm
> > > > handling") inadvertently altered the behavior of HDCP auth when
> > > > the SRM firmware is missing. Before that patch, missing SRM was
> > > > interpreted as the device having no revoked keys. With that patch,
> > > > if the SRM fw file is missing we reject _all_ keys.
> > > >
> > > > This patch fixes that regression by returning success if the file
> > > > cannot be found. It also checks the return value from request_srm such
> > > > that we won't end up trying to parse the ksv list if there is an error
> > > > fetching it.
> > > >
> > > > Fixes: 79643fddd6eb ("drm/hdcp: optimizing the srm handling")
> > > > Cc: stable@vger.kernel.org
> > > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > Changes in v2:
> > > > -Noticed a couple other things to clean up
> > > > ---
> > > >
> > > > Sorry for the quick rev, noticed a couple other loose ends that should
> > > > be cleaned up.
> > > >
> > > >  drivers/gpu/drm/drm_hdcp.c | 8 +++++++-
> > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> > > > index 7f386adcf872..910108ccaae1 100644
> > > > --- a/drivers/gpu/drm/drm_hdcp.c
> > > > +++ b/drivers/gpu/drm/drm_hdcp.c
> > > > @@ -241,8 +241,12 @@ static int drm_hdcp_request_srm(struct drm_device *drm_dev,
> > > >
> > > >       ret = request_firmware_direct(&fw, (const char *)fw_name,
> > > >                                     drm_dev->dev);
> > > > -     if (ret < 0)
> > > > +     if (ret < 0) {
> > > > +             *revoked_ksv_cnt = 0;
> > > > +             *revoked_ksv_list = NULL;
> > > These two variables are already initialized by the caller.
> >
> > Right now it is, but that's not guaranteed. In the ret == 0 case, it's
> > pretty common for a caller to assume the called function has
> > validated/assigned all the function output.
> Ok.
> >
> > > > +             ret = 0;
> > > Missing of this should have been caught by CI. May be CI system always
> > > having the SRM file from previous execution. Never been removed. IGT
> > > need a fix to clean the prior SRM files before execution.
> > >
> > > CI fix shouldn't block this fix.
> > > >               goto exit;
> > > > +     }
> > > >
> > > >       if (fw->size && fw->data)
> > > >               ret = drm_hdcp_srm_update(fw->data, fw->size, revoked_ksv_list,
> > > > @@ -287,6 +291,8 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
> > > >
> > > >       ret = drm_hdcp_request_srm(drm_dev, &revoked_ksv_list,
> > > >                                  &revoked_ksv_cnt);
> > > > +     if (ret)
> > > > +             return ret;
> > > This error code also shouldn't effect the caller(i915)
> >
> > Why not? I'd assume an invalid SRM revocation list should probably be
> > treated as failure?
> IMHO invalid SRM revocation need not be treated as HDCP authentication
> failure.
>
> First of all SRM need not supplied by all players. and incase, supplied
> SRM is not as per the spec, then we dont have any list of revoked ID.
> with this I dont think we need to fail the HDCP authentication. Until we
> have valid list of revoked IDs from SRM, and the receiver ID is matching
> to one of the revoked IDs, I wouldn't want to fail the HDCP
> authentication.
>

Ok, thanks for the explanation. This all seems reasonable to me.

Looks like this can be applied as-is, right? I'll review the patch you
posted so we can ignore the -ve return values.

Thanks for the review!

Sean

> -Ram
> >
> >
> > > hence pushed a
> > > change https://patchwork.freedesktop.org/series/76730/
> > >
> > > With these addresed.
> > >
> > > LGTM.
> > >
> > > Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> > > >
> > > >       /* revoked_ksv_cnt will be zero when above function failed */
> > > >       for (i = 0; i < revoked_ksv_cnt; i++)
> > > > --
> > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
