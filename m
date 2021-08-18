Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CF3F093F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 18:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940A6E862;
	Wed, 18 Aug 2021 16:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9386E862
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 16:35:56 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id be20so4121687oib.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WwHNTiYpAPuDyHat9op/gTI7AuVu7iPE7Gf+qdaqXoc=;
 b=VdGfzZKikHpwyYX4IGhhbXal3J08RrsRiaelmbtSWf0z9p3n5Lg6pOpepoqq35UzuD
 wEJbzPaLWTV2ShJb/T9Rp0tit0VRA+MLLwWntxsLbmHt7lVCXjr0idZhcAIpZQhUJDXW
 nK7lnkMGEhVeQ5VZLAsU+pItwe9eurQTqAWPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WwHNTiYpAPuDyHat9op/gTI7AuVu7iPE7Gf+qdaqXoc=;
 b=UfNlb8cB0/WWTXaHuQrYqsWJ1WcoTMXthqVE0NvnG3qijRldrwOhDQTf8erZPrMTlo
 PqvyV6oE7JEJCdh/7PZ+R9DgSwqXWksI2iPtXXyl/h6b8dWOESsmByNH47sLOce6LMzn
 puixnip9YZBKZZsWbN1v5hkeMDC0Vs/Zl4BiS7jeDwX5jASSUvGwe42qc7VwCoB0ac/l
 DrYPTwf0TNvNdNf3Pt1UVFN4IBrVrlaUZ52LiJKaaTfu7nFoTF01AIrHm3MJVYzlAs4+
 RQi0RTJAMitnSjc0yIC9LdnIpHNk/0q6OC/HzHArbkCfSZCcyCcFjlcQYSmMDMbQqDT3
 v4Bg==
X-Gm-Message-State: AOAM530QEXMP8tzYZ5qiHltPWLNvu4y4MtnNIr3gCT+89jBkgYf+TLp8
 QHj5yWC5ngOwpQkjYbHDo3Lw+vO7mwTBCd6As21YFA==
X-Google-Smtp-Source: ABdhPJz+clf5p17O4xgaDJfb2ZVVvcRjlZZSTceI+0xuARwBgYxqMOrZSubY041qQxT4j2c4a7dYIFFxp69h8eoXOLA=
X-Received: by 2002:a05:6808:2109:: with SMTP id
 r9mr7852373oiw.101.1629304555350; 
 Wed, 18 Aug 2021 09:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
 <20210701155513.2024-3-michal.wajdeczko@intel.com>
 <YR0XFp/Q+f8Todgk@phenom.ffwll.local>
 <7bdb20cf-550f-9c65-5c9b-60cc87de33b2@intel.com>
In-Reply-To: <7bdb20cf-550f-9c65-5c9b-60cc87de33b2@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Aug 2021 18:35:44 +0200
Message-ID: <CAKMK7uG5OMMfNq7K1BPKdtgkiiQUjW9updRZgy5xdeE2vPFSbg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/guc: Print error name on CTB
 (de)registration failure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, Aug 18, 2021 at 5:11 PM Michal Wajdeczko
<michal.wajdeczko@intel.com> wrote:
>
>
>
> On 18.08.2021 16:20, Daniel Vetter wrote:
> > On Thu, Jul 01, 2021 at 05:55:11PM +0200, Michal Wajdeczko wrote:
> >> Instead of plain error value (%d) print more user friendly error
> >> name (%pe).
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >> index a26bb55c0898..18d52c39f0c2 100644
> >> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >> @@ -167,8 +167,8 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
> >>      err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
> >>                                          desc_addr, buff_addr, size);
> >>      if (unlikely(err))
> >> -            CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
> >> -                     guc_ct_buffer_type_to_str(type), err);
> >> +            CT_ERROR(ct, "Failed to register %s buffer (%pe)\n",
> >> +                     guc_ct_buffer_type_to_str(type), ERR_PTR(err));
> >
> > errname() is what you want here, not this convoluted jumping through hoops
> > to fake an error pointer.
>
> nope, I was already trying that shortcut, but errname() is not exported
> so we fail with
>
> ERROR: modpost: "errname" [drivers/gpu/drm/i915/i915.ko] undefined!
>
> so unless we add that export we must follow initial approach [1]

Then we export that function. This is all open source, we can actually
fix things up, there should _never_ be a need to hack around things
like this.

And yes I'm keenly aware that there's a pile of i915-gem code which
outright flaunts this principle, but that doesn't mean we should
continue with that. scripts/get_maintainers.pl can help with finding
all the people you need to cc on that export patch.
-Daniel

>
> -Michal
>
> [1]
> https://cgit.freedesktop.org/drm/drm-tip/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c
>
> >
> > With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>      return err;
> >>  }
> >>
> >> @@ -195,8 +195,8 @@ static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
> >>      int err = guc_action_deregister_ct_buffer(ct_to_guc(ct), type);
> >>
> >>      if (unlikely(err))
> >> -            CT_ERROR(ct, "Failed to deregister %s buffer (err=%d)\n",
> >> -                     guc_ct_buffer_type_to_str(type), err);
> >> +            CT_ERROR(ct, "Failed to deregister %s buffer (%pe)\n",
> >> +                     guc_ct_buffer_type_to_str(type), ERR_PTR(err));
> >>      return err;
> >>  }
> >>
> >> --
> >> 2.25.1
> >>
> >> _______________________________________________
> >> Intel-gfx mailing list
> >> Intel-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
