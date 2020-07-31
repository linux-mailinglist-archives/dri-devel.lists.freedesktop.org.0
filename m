Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E0233EC6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 07:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980F6E9CA;
	Fri, 31 Jul 2020 05:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677396E9CA
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 05:51:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m20so12086199eds.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 22:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bFZGMaQueiguDGF/ZWxZSzfJrZysU8qJdsUQ7aJVczQ=;
 b=Y1rj47xhgBVHodqq7ouSyQbv4C9/SSHOz84zjtJAByni/5thM2PewecDxE0mvcfvdW
 cs/Ml30VfXb6wyRuK4ZpfQyfhJxZINeaVEQTjWJ3wLFK8d1dKpfCHOvS9SxV+TaJ0zyX
 sLGfA+9lFqJo5jM/Xy/FRUV1pNocobgzS4EHPIPa32koLCbBBc7LaUU/PScTC/aQBrs7
 fWcjvvoBGKVWzbfp3xxVuyXqPZjA5fpKIaIgKoKFdnh/sLfgSwUxRGZ9WQs2QPBgR0yu
 YVfyo4582GXuQ8eqjfxVnj+jyjtskzwrzdhwUyCcZ36URvyC75mRBjNfdf3Z3PWuBkHG
 Vpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bFZGMaQueiguDGF/ZWxZSzfJrZysU8qJdsUQ7aJVczQ=;
 b=l0qwOhQOOJyBRoKv8MdZyy1D3ku1YvXPFu2e00P97U/jUZJqCN5JhmzU4RxyyX+OCK
 lcC0Om/hQFXEIm8FGjjVDEgk+mfNOd/F48Lm5hqPA8XfJF3hWNFlnR+ttz15Ks8IX9y2
 JM/AFc2rO5zNC8j/59mvIlE1AiJ/9ILJzNPYkNPI3I7fHpMVT8LnvrpHIKJpY8RGY39d
 mNcJGWdgJRj5ajmwA0j2eUz6ZJQnLytWnXrI8TVmcdJl3ajCERxa0aqMcHOPchhrelZp
 VhdpmWbKeD0uAJv8n/LKBtTDKAWWu0HpgNEMuuYGFTGiubSS+04pcyMf8LcqlfPffy3R
 /b/g==
X-Gm-Message-State: AOAM533Omh3mewW2AVG4sl1NkhxoDsH47vzx9D0tPbq+7nBKSQh30hN1
 qXTu9ZAOWHAPskerk05z2XlbP96EtWStoFKVhx0=
X-Google-Smtp-Source: ABdhPJymAFRpgyhvmItcle0VrzZzJkUFr4YUo19gTj6QK91VjVwUl6xCP5Vv/L2adQpnIyDE0GgylwWqQGA5lDY4uvw=
X-Received: by 2002:a05:6402:3ca:: with SMTP id
 t10mr2267867edw.298.1596174683011; 
 Thu, 30 Jul 2020 22:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-4-airlied@gmail.com>
 <20200731054431.GA1544844@ravnborg.org>
In-Reply-To: <20200731054431.GA1544844@ravnborg.org>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Jul 2020 15:51:11 +1000
Message-ID: <CAPM=9txyaTd5H3bKvO1Uiz2WaoGWyxYQD0dGnV5HQukkZm8WBQ@mail.gmail.com>
Subject: Re: [PATCH 03/49] drm/ttm: split the mm manager init code
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Roland Scheidegger <sroland@vmware.com>,
 "Koenig, Christian" <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jul 2020 at 15:44, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dave.
>
> On Fri, Jul 31, 2020 at 02:04:34PM +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This will allow the driver to control the ordering here better.
> >
> > Eventually the old path will be removed.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
> >  include/drm/ttm/ttm_bo_api.h    |  4 ++++
> >  include/drm/ttm/ttm_bo_driver.h |  6 ++++++
> >  3 files changed, 30 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 041a0e73cd1b..a658fd584c6d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -1503,35 +1503,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
> >  }
> >  EXPORT_SYMBOL(ttm_bo_evict_mm);
> >
> > -int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> > -                     unsigned long p_size)
> > +void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
> > +                      struct ttm_mem_type_manager *man,
> > +                      unsigned long p_size)
> >  {
>
> General comment for all the ttm/* changes.
> It would be very nice with some nice explanations for the exported
> functions, preferably in kernel-doc style.
> In case someone that are more or less clueless (like me) would like
> to understand how a function is to be used or maybe reviewing some
> random code.

Good point, I just need to make sure I don't add anything for
something I remove later, but I should definitely add some for the new
interfaces.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
