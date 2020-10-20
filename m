Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0529382E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 11:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356F76E120;
	Tue, 20 Oct 2020 09:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC09B6E120
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 09:37:03 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id j7so1460347oie.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NCBjGbBCYnTALaftnOCAZ4SldHcaDpByaVx/nX8bxVQ=;
 b=ShhgIcaDB0ubJDOxeajl9rGYvQEoUynYDMhlwhIte0rvkLy/UNYeYddnhCMKtw3iZh
 1zNtIw5kXTp2mo5U2T0xNw+czr99lBe4LDfBTfWttPCnmlU+WACEE3Wp6T1E/QqADbPf
 W7mch5YMtl+qq0xQ8PmOlDt8rChyPfhrP6xVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NCBjGbBCYnTALaftnOCAZ4SldHcaDpByaVx/nX8bxVQ=;
 b=S19L07G3XUBj7fphbpl4ZppYExXVjVwvgtsKaRirJYR8lIcHCB7SkSpG5Sx/ylTw6I
 JB6PgQgjjZDxirG9oObeZmQyc8hKFB8x21z5eaPoGdG0SlOHhDntTwzCUWKjG1Co9J3H
 Ih/GGI+sh6VUaoaRT8nEGJ2BKOs0XewCeB0AKq/y93dPXlaJ00c4nNL7QTb2xXAh9YqR
 l9GDP5HBJwlbbuLE4kSz/u0L5g2UtFngrX7Q8IpwqOaz0QMouAGlU8ZphB8hL4OC5O1l
 EXBN2Q7piJAA8Eenxhelrd663UuMzCaZBazV897xrvZhaNXZgGG00x3lV/+8aaIdCyw3
 A9eg==
X-Gm-Message-State: AOAM532fBlNq5NKtDMkVU3N4oPEvr/YmXYx1DJZh+bZjYteAefDATt+k
 Waaq0//CLLrVgc+frmg2eEljDI92tK5DMB2R+SoNkw==
X-Google-Smtp-Source: ABdhPJwZXeDiGVuvAgeEysLUI54e5SJOaIvJN7T2z71F0z8EmYOaZkbS3dMpMrymGISn6hEzV8Yu7ic4ySOUJanzN14=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr1230924oia.14.1603186621954; 
 Tue, 20 Oct 2020 02:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201020083515.941832-1-daniel.vetter@ffwll.ch>
 <5_L8l-WaP_G-dKhj-3faf3hfwf4NKYHFhWtINHAgEOO4MnUXgYyCb5NBZy8UXuaOdfneiMbyOhKO83bgBb2YZw2IwRgg5qy6-lffHJunRuw=@emersion.fr>
In-Reply-To: <5_L8l-WaP_G-dKhj-3faf3hfwf4NKYHFhWtINHAgEOO4MnUXgYyCb5NBZy8UXuaOdfneiMbyOhKO83bgBb2YZw2IwRgg5qy6-lffHJunRuw=@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 20 Oct 2020 11:36:51 +0200
Message-ID: <CAKMK7uE9cZ8dRXokt6-zNMHuGMWVxY3otyrYk_aN+NNNTvPkJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Unset preferred_depth
To: Simon Ser <contact@emersion.fr>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 10:42 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, October 20, 2020 10:35 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> > There's a confusion between the preferred_depth uapi and the generic
> > fbdev helpers. Former wants depth, latter wants bpp, and for XRGB8888
> > they don't match. Which hit me with vkms, which wants that.
> >
> > All other drivers setting this and using the generic fbdev helpers use
> > 16, where both numbers match, for RGB565.
>
> Not quite: grepping reveals a majority of 24 (as shown in drmdb). A few
> drivers set 16 (udl, cirrus), and hisilicon sets 32.

If I haven't screwed up my grepping, those drivers that set 24 don't
use the generic fbdev emulation. Which is the broken combination.

hisilicon setting 32 is just plain wrong, and it's indeed using fbdev
emulation :-/ I also noticed that mga200 can end up setting 32bit.

So I guess I've not been terribly well awake when doing my grepping ...

> > Since fixing this is a bit involved (I think for atomic drivers we
> > should just compute this all internally from the format list of the
> > first primary plane) paper over the issue in vkms by using defaults
> > everywhere. Then userspace will pick XRGB8888, and fbdev helpers will
> > do the same, and we have what we want.
> >
> > Reported-by: Simon Ser contact@emersion.fr
> > Cc: Simon Ser contact@emersion.fr
> > Signed-off-by: Daniel Vetter daniel.vetter@intel.com
> > Cc: Rodrigo Siqueira rodrigosiqueiramelo@gmail.com
> > Cc: Melissa Wen melissa.srw@gmail.com
> > Cc: Haneen Mohammed hamohammed.sa@gmail.com
> > Cc: Daniel Vetter daniel@ffwll.ch
>
> With the commit message clarified:
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
