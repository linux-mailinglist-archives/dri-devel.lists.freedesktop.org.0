Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F02C499C9B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A843710E1C6;
	Mon, 24 Jan 2022 22:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744C510E1E7;
 Mon, 24 Jan 2022 22:10:07 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so8486028otr.11; 
 Mon, 24 Jan 2022 14:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfQ1Cr8MOGNWzImPgM3FPvJ3DRDIShXaWCzTw2fuiGo=;
 b=Z+F0etylmIPRLfXkQxHrbCduqN93SYw7wl/ke/YpNeM4rPaukRCnKxTe71ymWVnYxP
 7Vp4nnlA+M4Rm1eAhkuZw7yqe9BkTYhucCx+9Fsb6LaMeeQg6V2LonO6YxMnEKLTLNWf
 ThtFvcc/fRFn4UZPlVRhL+vS5U3wQmnxEtFLUPWE3obBRz8H/TwYkyRptXqFHff3vgKB
 jcy7q9coHrKyr3wha1pNcOuLmgUKjtbpCVRunpmpzDKtiFy4PTDQ6ZyeH6WC1swXj9wH
 1gUQHxkh7d72RWBkcPCYm2r14IlbhITnuWDjv0rAlIdb7LUIu60GlZpkmIhgWB5EqtZk
 o1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfQ1Cr8MOGNWzImPgM3FPvJ3DRDIShXaWCzTw2fuiGo=;
 b=BvOkELI/kCteyfck7GqPEx4DlDiIf0XIvso4lsilvmrgUpVZBuVGeBm5o+EkLvML87
 g0ase4dQrfN2tp90pPEGmJV8wQq1bMpQxZcVXgnn29huaG8sXv4z9NUMo9cNVniGcvMQ
 zoeACXMy2jJV9DEBJedB2ToIM5xsbcEE0uVh3WS1tQiDsFYG2GotwS6QoPUrZpE+/E6B
 Ix2+m9KavbFu9ckIitxqTqfunInZh5QsYnAMfjWWPvidMbBOE6xpEo4vm8q0TT11cccm
 nYEpB4E7GdybAH3bmthtb0hE9lPgwfaC64t3me3RF+xxVugiMii6QJV7nbMDVhf++Q4q
 pEWg==
X-Gm-Message-State: AOAM532yAvmUGhgqeMubcalMeTG48bsVLNczyP2WjPRoE+ASOf/LlzV8
 hCyEER3Y8BIPuLMiKM/OO6OYFIORgwVrQVTbqgI=
X-Google-Smtp-Source: ABdhPJwvLyrL8/z3f3oeYcfh5RaeZB2rvDsalLA+HVQ+FDuwfMu1r9GNC9grwWebJSLxVHBZqstuKTAHNHQYm1JYjGE=
X-Received: by 2002:a05:6830:1d90:: with SMTP id
 y16mr13147279oti.200.1643062206810; 
 Mon, 24 Jan 2022 14:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20220119224628.123084-1-colin.i.king@gmail.com>
 <CAKwvOdnMibw77AvvWw7seB2PPamS_OLMUarSjdsa4w4OP1isKg@mail.gmail.com>
In-Reply-To: <CAKwvOdnMibw77AvvWw7seB2PPamS_OLMUarSjdsa4w4OP1isKg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 17:09:55 -0500
Message-ID: <CADnq5_P4F9MqfP2BHSzj7rgXBDxRPtiphh5sqF0+dW7NSTLFVA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove redundant assignment to reg
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: llvm@lists.linux.dev, David Airlie <airlied@linux.ie>,
 xinhui pan <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 24, 2022 at 3:21 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jan 19, 2022 at 2:46 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> >
> > The pointer reg is being assigned a value that is not read, the
> > exit path via label 'out' never accesses it. The assignment is
> > redundant and can be removed.
> >
> > Cleans up clang scan build warning:
> > drivers/gpu/drm/radeon/radeon_object.c:570:3: warning: Value
> > stored to 'reg' is never read [deadcode.DeadStores]
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> > ---
> >  drivers/gpu/drm/radeon/radeon_object.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> > index 56ede9d63b12..87536d205593 100644
> > --- a/drivers/gpu/drm/radeon/radeon_object.c
> > +++ b/drivers/gpu/drm/radeon/radeon_object.c
> > @@ -567,7 +567,6 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
> >                 return 0;
> >
> >         if (bo->surface_reg >= 0) {
> > -               reg = &rdev->surface_regs[bo->surface_reg];
> >                 i = bo->surface_reg;
> >                 goto out;
> >         }
> > --
> > 2.33.1
> >
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
