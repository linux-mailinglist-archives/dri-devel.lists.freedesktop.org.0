Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958BA19BCAA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A988E6E9DD;
	Thu,  2 Apr 2020 07:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8C46E9E9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 07:28:03 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id f52so2409597otf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nh2/p6fUAxKaJ1Ltz77AWYdswpCaQyvdRwG+WzsEHX8=;
 b=VxAsiOebDofd9Ku6rj8mMZ0wbl3D0ASz3L8t8rWn99BW8teZFf/rRpW+GZ7irNtPte
 CfPw0dc/C6neGVg7g891xjz8G8+a5hkhAzCdjMSO6CqoyvDFzy+LftpZq75ol76K5iQ5
 iRojZC3Ya/oDHOm17QHlUD2s5G5fJwGIF3XdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nh2/p6fUAxKaJ1Ltz77AWYdswpCaQyvdRwG+WzsEHX8=;
 b=o+u7Kz7bWYt4iF3lZ3mBCqG/FVnZVoftU+gpSCng1U2EFouAayI5hlKz7MzWIrKiji
 oRqXk5Zrbk+qbw7tXT1iNYsM3uIgAs1SHv8mumj74palq6uk56R2JfRVmkWI8GJD5yIK
 Q/PSAjh8nefNzE2D2ayikQdmjzo+CGnOn3NVyG3mh5P17AA8yBnHOjw4dGz2EDa4L+Or
 2wuKEQC9ne0K8lYGWlca4ViqjhLMDbxHLMz5lXAy5jm+p8Xk44l2cfxwymdx2v1SaP4V
 Aby/ZETWzseRizv5hlGSPLWFx3px9E752O424BuiBLhqd5pBhv1Rb2ERHFPtCkYNVLaj
 VU4A==
X-Gm-Message-State: AGi0PubDx4NaRwneoFYNxwBpvu1cYLztPhNMhn1ki3REkRMQLaQvS48m
 FTIFm2t40nJX85G6iyT3z5p+8cf87ZIzI7J/alVwAg==
X-Google-Smtp-Source: APiQypJ4WDw3WPB5OXC2icH1n0CzFVxePNP/x0BANzWu+exI2az4Vb9xmxxoV6BKSWLfZhfW36rFjhVr0sg0loX3ucw=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr1420396otr.188.1585812482518; 
 Thu, 02 Apr 2020 00:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055241.24789-1-pankaj.laxminarayan.bharadiya@intel.com>
 <87lfnemmo8.fsf@intel.com>
In-Reply-To: <87lfnemmo8.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 2 Apr 2020 09:27:51 +0200
Message-ID: <CAKMK7uHNEXffFOdoD5W=KVCCP-1Gi-epp77FoPswPWUvPSNDXA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove WARN_ON and WARN_ON_ONCE overrides.
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 8:23 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 02 Apr 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> > Now we have new struct drm_device based drm_WARN* macros. These are
> > preferred over the regular WARN* macros.
> >
> > Remove WARN_ON and WARN_ON_ONCE overriedes to avoid any temptations to
> > use them in the future.
>
> Well, since they are overrides of macros in bug.h, the users are still
> there. There are still 100+ users in i915. You just don't get as much
> information with them after this patch.
>
> I'm not opposed to this patch, but at the same time I'd like to see more
> converted to the drm_WARN* alternatives.

Yeah our overrides are super useful, I think better to try to move
them to the core version. So many times when I didn't know which
warning was hit in a bug report (warnings in drm core already have
this problem), and the additional output here would have helped. I'd
at least keep this for now.
-Daniel

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>
> BR,
> Jani.
>
> >
> > Suggested-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_utils.h | 15 ---------------
> >  1 file changed, 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> > index 03a73d2bd50d..c666a64375d9 100644
> > --- a/drivers/gpu/drm/i915/i915_utils.h
> > +++ b/drivers/gpu/drm/i915/i915_utils.h
> > @@ -36,21 +36,6 @@ struct timer_list;
> >
> >  #define FDO_BUG_URL "https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs"
> >
> > -#undef WARN_ON
> > -/* Many gcc seem to no see through this and fall over :( */
> > -#if 0
> > -#define WARN_ON(x) ({ \
> > -     bool __i915_warn_cond = (x); \
> > -     if (__builtin_constant_p(__i915_warn_cond)) \
> > -             BUILD_BUG_ON(__i915_warn_cond); \
> > -     WARN(__i915_warn_cond, "WARN_ON(" #x ")"); })
> > -#else
> > -#define WARN_ON(x) WARN((x), "%s", "WARN_ON(" __stringify(x) ")")
> > -#endif
> > -
> > -#undef WARN_ON_ONCE
> > -#define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify(x) ")")
> > -
> >  #define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> >                            __stringify(x), (long)(x))
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
