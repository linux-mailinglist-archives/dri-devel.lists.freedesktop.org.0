Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4546C2E10D0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 01:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D8B6E85A;
	Wed, 23 Dec 2020 00:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2156E249
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 00:37:45 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id i18so13659263ioa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 16:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lJYVQ7PnCCXi4g9tZbq1aPKbq5Rtjx1EMaT882nls4w=;
 b=MgpenJknft7iQnN1qHONOwIUAVFGZbTfUlyKCtiqfcsBcLnq3NrDaUQR1yQeCjanPh
 rfQYLYes4Y6YYvSKUXtPmGmy2G+2QggkvkrlLkj5rcLxEhorpwhN/DUhsYzhUJM79ZUc
 xLFqtzOAKMUzX9zZzwvpUJggF8JwfDcvfNSgrnFBwLP8Dvycf280O5pesqghtwB5ZjgY
 9z/QiU4vqim8LbGZduL049k6xY+xQl49PaTiZMntmryCcHddlZj1LDxiTdR3ZZeYeGNN
 yk7sUP6+St5Qehrj65UFIUskGYdgdUm+2AIz6OV1EgKGVrTIaBAv20q7iqw7OzA/EwwS
 Kjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJYVQ7PnCCXi4g9tZbq1aPKbq5Rtjx1EMaT882nls4w=;
 b=dlxMK/BuzTreG9AWz0Z+v+zpUIFXVLTGMyS0aYrgtdZf2e9DPq+RBrio+2Yk8BHI6z
 pW1bqrAQSMKMWtxkunxRCYAahckyWIJhnboxxXMC3wQxPRklsaiXsK1yGAyOa8eHeuft
 IXgv6cL0HTjxK4dyRRRwdTGdWDBZ5PCeJbCVk19ExqWuO8QuatYAngHEHsZSay3NyKhy
 Oz5FCtDW13PYUZ4G8uQj0k59mWLNwcpWeqmGW0mFr1l6bmqs5s8vbtMzrwUs6lO9q73C
 pEVVrFruJQC2f9DL6BEPtuLTGjmuDYFL4cFWpOZsmXtVq4WerPRQxyuJYXMj8pR3kJEE
 RxSw==
X-Gm-Message-State: AOAM531U0e8M12tyoNo8UUGr91z5yn6D2O8pzWuMTsx1Z80Y9ZPevUTE
 ZdfFRXTD6w85491GkokFffOa0CpkWp71XxSz1gEYfQ==
X-Google-Smtp-Source: ABdhPJwgP/F4pOSTeZwylZfevHgKpGaLQTIMTYwhuVVUvutNwxduuYj+sWcFRA7FaPjBrcI006gae4LV8jkA1D5swm0=
X-Received: by 2002:a02:cd84:: with SMTP id l4mr21269052jap.141.1608683864709; 
 Tue, 22 Dec 2020 16:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20201222031812.67228-1-zhan.liu@amd.com>
 <1c3f0095-b76f-5107-7b71-c284b79d8a09@amd.com>
In-Reply-To: <1c3f0095-b76f-5107-7b71-c284b79d8a09@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 23 Dec 2020 01:37:36 +0100
Message-ID: <CAP+8YyGUHN4J=p-gz8pGMKkjEONwpjXwe9FMYkeK50F7-Ls8=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Do not change amdgpu framebuffer format
 during page flip
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
Cc: Stylon.Wang@amd.com, Zhan Liu <zhan.liu@amd.com>, Chao-kai.Wang@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nikola.Cornij@amd.com, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 22, 2020 at 9:55 PM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2020-12-21 10:18 p.m., Zhan Liu wrote:
> > [Why]
> > Driver cannot change amdgpu framebuffer (afb) format while doing
> > page flip. Force system doing so will cause ioctl error, and result in
> > breaking several functionalities including FreeSync.
> >
> > If afb format is forced to change during page flip, following message
> > will appear in dmesg.log:
> >
> > "[drm:drm_mode_page_flip_ioctl [drm]]
> > Page flip is not allowed to change frame buffer format."
> >
> > [How]
> > Do not change afb format while doing page flip. It is okay to check
> > whether afb format is valid here, however, forcing afb format change
> > shouldn't happen here.
> >
> > Signed-off-by: Zhan Liu <zhan.liu@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > index a638709e9c92..0efebd592b65 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -831,8 +831,6 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
> >                                                               modifier);
> >                       if (!format_info)
> >                               return -EINVAL;
> > -
> > -                     afb->base.format = format_info;
>
> Adding Bas for comment since he added the modifiers conversion, but I'll
> leave my own thoughts below.
>
> This patch is a NAK from me - the framebuffer is still expected to be in
> a specific format/tiling configuration and ignoring the incoming format
> doesn't resolve the problem.
>
> The problem is that the legacy page IOCTL has this check in the first
> place expecting that no driver is capable of performing this action.
>
> This is not the case for amdgpu (be it DC enabled or not), so I think
> it's best to have a driver cap here or some new driver hook to validate
> that the flip is valid.
>
> This is legacy code, and in the shared path, so I don't know how others
> in the list feel about modifying this but I think we do expect that
> legacy userspace can do this from the X side of things.

I think the "new" thing is that we can have different format_info
structs for the same drm fourcc (as we need a different number of
planes depending on modifier). It would probably make sense to relax
this check to check the actual drm fourcc (i.e. fb->format->format)
instead of the format_info pointer. This case would likely only be hit
in the AMDGPU driver anyway (with intel being the other possibility).


>
> I recall seeing this happen going from DCC disabled to non DCC enabled
> buffers and some of this functionality being behind a version check in
> xf86-video-amdgpu.
>
> Regards,
> Nicholas Kazlauskas
>
> >               }
> >       }
> >
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
