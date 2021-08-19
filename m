Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262903F1544
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 10:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD956E82E;
	Thu, 19 Aug 2021 08:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A8D6E82E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:35:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q6so7787883wrv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nsGYIu6a9hlHgy+TS4zRJBDledy8JI1S0nS8foDrmXs=;
 b=c35EfHkcRBPVmMMDv44vl+CAOz3W6DKILDtj8/OriULg9C7eC4IykvzHZY4z8A83gU
 uWSGi3tJdpt8ZiIbKFU/BfQKMgQfnLntw1hY3vfemWx3PP8R8pFqVCBRHmJydFNcNyFT
 klgKyxs9TaXKJbyKVczqnB1UIG7EeK1R9xJsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nsGYIu6a9hlHgy+TS4zRJBDledy8JI1S0nS8foDrmXs=;
 b=CUynHYnoCkxwBT+fCMBr4OCbvkhvbxDXvcp4mAjBklP7ThzX8Im6b2VlBmVgi1om4g
 MgTCNSG81R+s4sqaVpl3ihq/jY0q8UUkO8k7zKi9czWCSpoF0t+vZhU382uzxopYCGrv
 LJpNYKj/eo8mjlnZrPsOg65A0db0KtPi6zDZ9GGyoTKEvhed35rDFiVcKxTdcRBtUMwO
 xHkLNmrTo7Zh5G15xMkqsJWT6i6w3pz8j02KQklU52G7YDVo/q+UY427q5rDm+Ds8JsT
 AGXUI+/Twr0bGCYRyUY/yJ1eusKZSbZOohPj49ky4vx4PopaSZZ4yUNTs7NCNlEWHFul
 k5Gw==
X-Gm-Message-State: AOAM533n4py9V/xFn7N2up5brn1eIBfr2sJNJD8O6qLdOR5OIVTROLRI
 u8VX12EeE0dfahRuPtIilvAXag==
X-Google-Smtp-Source: ABdhPJzhwDFrs63Ht29evTRIBlptjwVOeWaRI1N9fyltpsfI7IObEkJVwZYBAqTTJuW6K41sxXvwHg==
X-Received: by 2002:adf:f552:: with SMTP id j18mr2238625wrp.273.1629362133656; 
 Thu, 19 Aug 2021 01:35:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g6sm2106320wmq.14.2021.08.19.01.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:35:32 -0700 (PDT)
Date: Thu, 19 Aug 2021 10:35:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/guc: Print error name on CTB
 (de)registration failure
Message-ID: <YR4X0hYUb6a0uVIG@phenom.ffwll.local>
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
 <20210701155513.2024-3-michal.wajdeczko@intel.com>
 <YR0XFp/Q+f8Todgk@phenom.ffwll.local>
 <7bdb20cf-550f-9c65-5c9b-60cc87de33b2@intel.com>
 <CAKMK7uG5OMMfNq7K1BPKdtgkiiQUjW9updRZgy5xdeE2vPFSbg@mail.gmail.com>
 <c9a65e57-2d98-833c-e89a-b394ffecbeac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9a65e57-2d98-833c-e89a-b394ffecbeac@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Wed, Aug 18, 2021 at 09:12:32PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 18.08.2021 18:35, Daniel Vetter wrote:
> > On Wed, Aug 18, 2021 at 5:11 PM Michal Wajdeczko
> > <michal.wajdeczko@intel.com> wrote:
> >>
> >>
> >>
> >> On 18.08.2021 16:20, Daniel Vetter wrote:
> >>> On Thu, Jul 01, 2021 at 05:55:11PM +0200, Michal Wajdeczko wrote:
> >>>> Instead of plain error value (%d) print more user friendly error
> >>>> name (%pe).
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++----
> >>>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>>> index a26bb55c0898..18d52c39f0c2 100644
> >>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>>> @@ -167,8 +167,8 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
> >>>>      err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
> >>>>                                          desc_addr, buff_addr, size);
> >>>>      if (unlikely(err))
> >>>> -            CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
> >>>> -                     guc_ct_buffer_type_to_str(type), err);
> >>>> +            CT_ERROR(ct, "Failed to register %s buffer (%pe)\n",
> >>>> +                     guc_ct_buffer_type_to_str(type), ERR_PTR(err));
> >>>
> >>> errname() is what you want here, not this convoluted jumping through hoops
> >>> to fake an error pointer.
> >>
> >> nope, I was already trying that shortcut, but errname() is not exported
> >> so we fail with
> >>
> >> ERROR: modpost: "errname" [drivers/gpu/drm/i915/i915.ko] undefined!
> >>
> >> so unless we add that export we must follow initial approach [1]
> > 
> > Then we export that function. This is all open source, we can actually
> > fix things up, there should _never_ be a need to hack around things
> > like this.
> 
> simple export might be not sufficient, as this function returns NULL for
> unrecognized error codes, and it might be hard to print that code in
> plain format, as it %pe does it for us for free.

"(%s:%i)", errname(ret), ret

Would work, but maybe not so pretty. Otoh %pe for unrecognized integers is
also not very pretty.

> is that big problem to use ERR_PTR? I'm not the only/first one
> 
> see
> drivers/net/can/usb/etas_es58x/es58x_core.c
> drivers/net/ethernet/freescale/enetc/enetc_pf.c
> drivers/net/phy/phylink.c
> ...

Ah yeah, looking through grep more than half the users do this pattern.
Which still feels extremely silly, because it's not a pointer we're
printing, and when it's not an errno we should probably print it as an
integer or something. But also meh. On both patches, as-is:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> > And yes I'm keenly aware that there's a pile of i915-gem code which
> > outright flaunts this principle, but that doesn't mean we should
> > continue with that. scripts/get_maintainers.pl can help with finding
> > all the people you need to cc on that export patch.
> 
> I'm perfectly fine with updating/fixing shared code (did that before,
> have few more ideas on my todo-list) but in this case I'm not so sure

I think an %ie extension or something like that for printk would make some
sense. There's absolute enormous amounts of this kind of casting going on,
and it just doesn't make sense to me.

It would be pretty easy way to get like 100 patches into the kernel to
clean it all up :-)
-Daniel

> 
> -Michal
> 
> > -Daniel
> > 
> >>
> >> -Michal
> >>
> >> [1]
> >> https://cgit.freedesktop.org/drm/drm-tip/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c
> >>
> >>>
> >>> With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>      return err;
> >>>>  }
> >>>>
> >>>> @@ -195,8 +195,8 @@ static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
> >>>>      int err = guc_action_deregister_ct_buffer(ct_to_guc(ct), type);
> >>>>
> >>>>      if (unlikely(err))
> >>>> -            CT_ERROR(ct, "Failed to deregister %s buffer (err=%d)\n",
> >>>> -                     guc_ct_buffer_type_to_str(type), err);
> >>>> +            CT_ERROR(ct, "Failed to deregister %s buffer (%pe)\n",
> >>>> +                     guc_ct_buffer_type_to_str(type), ERR_PTR(err));
> >>>>      return err;
> >>>>  }
> >>>>
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>> _______________________________________________
> >>>> Intel-gfx mailing list
> >>>> Intel-gfx@lists.freedesktop.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >>>
> > 
> > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
