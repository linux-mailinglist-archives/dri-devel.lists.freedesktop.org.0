Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A44BA586
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3610810E5A6;
	Thu, 17 Feb 2022 16:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2B410E418;
 Thu, 17 Feb 2022 16:16:26 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 13so90628oiz.12;
 Thu, 17 Feb 2022 08:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytu0Gx4Ee/+5dkAxsCITxVC/7yyCoOiEqzDXQO8bwEE=;
 b=hW00c6ROWmn+snifswDQ5zvWgLKzzxTtorrsLYKzTPfbkWCSd8nyY5XFmOjZtuo6aT
 Kb0uJN4PiZPTx5bTQss59vSLEEKuDJNp0vp0AntkMIY+3uwLlIUrtLWF08DmkLa+pL0D
 PYt+YrKPtMIBECkSHxbiHGZCLRem4t6yfvaZlP30y8DUrl2+a4DZPydmZaG156nI43gq
 HHHmphpOUhIW41BwTVq6fSGOy9RX3CCGX2cGAhzE6dNSOFxz4RiDWTAyZ0a9ADCQCgjP
 FsIjuJjChETAP8qXmGZGN4GbfLSwe6lsutCPAs7zv3Qig/epukDh/XeewpqjoaUIxsSo
 OmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytu0Gx4Ee/+5dkAxsCITxVC/7yyCoOiEqzDXQO8bwEE=;
 b=0etCkx5ALuOwWd4s09BUb8YDkKbIR1u+QZNjn4JNbqAFGXZbUFwiruEsMT7Nw7fPev
 K40o4Fi7k8/dNCsYO2G5ZlBWvQ9apCAT3vCRV2PYTSSfDkue9bowzBZhV4EwWOGu8Ork
 8Xqus9eFQdTN4nTpdT5suhPd9HCwkbcCsC/0dEYKsevgVmdH464Mzt1Hbmuy5vsnt+F8
 oCBndfKu1oiJzoYiolk/M6OkcpFXrBU98jn2f/JQxQOj8xx8kmzlKytKjkFd991fNZIE
 VmnGH7vWhPZ6X4T01AcoqtOLQTqesQxmq2RCSRcVjf1NQFuzGFx6TYyKkew5hxRvIUTW
 MgLg==
X-Gm-Message-State: AOAM531DUnkTDvNSmspTy4lY7JtfryNmkJ9xi6ymnTO8GIADN5VZFAN/
 ox6j120OBt5pFIJ8P2mEebigYZQtNTdhIzCU3Dc=
X-Google-Smtp-Source: ABdhPJx8wTyezWB9AK6JyxubX/zJkOWu5At1AfwaOAntEheYpYTl183pwdekUGsijpPNoomOiHIueXChIM2l1XK/Q7s=
X-Received: by 2002:aca:ab4c:0:b0:2d4:7c7d:606e with SMTP id
 u73-20020acaab4c000000b002d47c7d606emr1147310oie.132.1645114585339; Thu, 17
 Feb 2022 08:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com>
 <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
In-Reply-To: <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 11:16:14 -0500
Message-ID: <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: "Joshi, Mukul" <mukul.joshi@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 llvm@lists.linux.dev, Dave Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "Chai, Thomas" <YiPeng.Chai@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Feb 17, 2022 at 10:57 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Thanks for catching this.
>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>
> Regards,
> Luben
>
> On 2022-02-17 10:38, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> >
> > Clang build fails with
> > amdgpu_ras.c:2416:7: error: variable 'ras_obj' is used uninitialized
> >   whenever 'if' condition is true
> >   if (adev->in_suspend || amdgpu_in_reset(adev)) {
> >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > amdgpu_ras.c:2453:6: note: uninitialized use occurs here
> >  if (ras_obj->ras_cb)
> >      ^~~~~~~
> >
> > There is a logic error in the error handler's labels.
> > ex/ The sysfs: is the last goto label in the normal code but
> > is the middle of error handler.  Rework the error handler.
> >
> > cleanup: is the first error, so it's handler should be last.
> >
> > interrupt: is the second error, it's handler is next.  interrupt:
> > handles the failure of amdgpu_ras_interrupt_add_hander() by
> > calling amdgpu_ras_interrupt_remove_handler().  This is wrong,
> > remove() assumes the interrupt has been setup, not torn down by
> > add().  Change the goto label to cleanup.
> >
> > sysfs is the last error, it's handler should be first.  sysfs:
> > handles the failure of amdgpu_ras_sysfs_create() by calling
> > amdgpu_ras_sysfs_remove().  But when the create() fails there
> > is nothing added so there is nothing to remove.  This error
> > handler is not needed. Remove the error handler and change
> > goto label to interrupt.
> >
> > Fixes: b293e891b057 ("drm/amdgpu: add helper function to do common ras_late_init/fini (v3)")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > index b5cd21cb6e58..c5c8a666110f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > @@ -2432,12 +2432,12 @@ int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
> >       if (ras_obj->ras_cb) {
> >               r = amdgpu_ras_interrupt_add_handler(adev, ras_block);
> >               if (r)
> > -                     goto interrupt;
> > +                     goto cleanup;
> >       }
> >
> >       r = amdgpu_ras_sysfs_create(adev, ras_block);
> >       if (r)
> > -             goto sysfs;
> > +             goto interrupt;
> >
> >       /* Those are the cached values at init.
> >        */
> > @@ -2447,12 +2447,11 @@ int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
> >       }
> >
> >       return 0;
> > -cleanup:
> > -     amdgpu_ras_sysfs_remove(adev, ras_block);
> > -sysfs:
> > +
> > +interrupt:
> >       if (ras_obj->ras_cb)
> >               amdgpu_ras_interrupt_remove_handler(adev, ras_block);
> > -interrupt:
> > +cleanup:
> >       amdgpu_ras_feature_enable(adev, ras_block, 0);
> >       return r;
> >  }
>
