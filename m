Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F15539F1F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD0011345E;
	Wed,  1 Jun 2022 08:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF2911345E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:16:35 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id g4so1543178ybf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NrP/pzA5WOVP0Wg0VcGyRa1uc8hY9vBliJwWxUn/ZdI=;
 b=H8kPVUsh+T/eQPEaJvpxZ1XQzh1BTeOT/LmCLT5UWCTxlpSV52TDdbUT1jIXpI97l+
 s5YP54D8V+XsHB8j1T2Z7rjumkaOrZSnEZn0RsnFUQvcSOTN715FM8RZW4sQpvDczhfI
 vWqqZWghpw7rMg7I7PQglTpFWteNDiQ2drHScR7egX9w57UUTxiikqD69K1IYfkYNSL/
 aP21ZA3Mgn7wzMwH78p5A/JSMXcKlqsO7lH9fxqxwo4L0oiwSMJatHVj8iNGmZYVm6yk
 H+/rWwaQljit4+E08Vj1s88ZVP4hRjF2lK9j8pp3zGZyEb1eHrjQujfZQhyqdRHBbYLp
 D2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NrP/pzA5WOVP0Wg0VcGyRa1uc8hY9vBliJwWxUn/ZdI=;
 b=L67vS/lh8mLYTCyRud19uNFd/9fFX5ANRVQBw/Ed9pmpLoLjaQYTrTqLzTjxNaxYxS
 2KQsdMCp9YnnaNsBToVjc2oekY43LtZEJMQdNp89CaUOZzLd0/1CwCXXw0iPD0HKj9Pf
 w2ogiSc4acqyLNu+6W43xoxrKMY5tDm7ik/ACafcwjyBcbDiVZQHbyQul7HYjUzgz0AR
 TVKE5L0Ef3N/FtV2yCfglGRuQe/KbN/vdYWfrHvwrF+ownc/7UkxWm6Td21rC6ErJl99
 ep+9u92Re/DJFnZVoSS4oMjSGUiqRjqTREncSejoU7msCbCFg5aLbhr/pzZU/InFPY92
 kzsQ==
X-Gm-Message-State: AOAM531AeclmlYwv+nNpJYqPg2gY28rOfMCSI88r+zum+1x3K95kBmm0
 kYrM7hf6maw2ByRmqiPWQpnnjV2RVHOvTGsZ4HF+gw==
X-Google-Smtp-Source: ABdhPJxYC/MKF3wPmyfMcnEhXb5Xio21NEFIsx6BTwACTXo0vYaW9KVN9lh4kDiMKKO9AE0mt0OelB9nSvGiEje18Kk=
X-Received: by 2002:a25:cb8a:0:b0:65c:a718:475c with SMTP id
 b132-20020a25cb8a000000b0065ca718475cmr20084600ybg.352.1654071394260; Wed, 01
 Jun 2022 01:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
In-Reply-To: <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 1 Jun 2022 10:16:47 +0200
Message-ID: <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 10:03 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> > This should be okay because moves themselves use KERNEL usage and
> > hence still sync with BOOKKEEP usage. Then any later submits still
> > wait on any pending VM operations.
> >
> > (i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
> >   way around)
>
> Well NAK again. This allows access to freed up memory and is a complete
> no-go.

How does this allow access to freed memory? Worst I can see is that
the unmap happens earlier if the app/drivers gets the waits wrong,
which wouldn't give access after the underlying BO is freed?

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vm_cpu.c
> > index f10332e1c6c0..31bc73fd1fae 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> > @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_upd=
ate_params *p,
> >       if (!resv)
> >               return 0;
> >
> > -     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mo=
de, p->vm, true);
> > +     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, AMDGPU_=
SYNC_EXPLICIT, p->vm, true);
> >   }
> >
> >   /**
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_vm_sdma.c
> > index 63b484dc76c5..c8d5898bea11 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> > @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_up=
date_params *p,
> >       if (!resv)
> >               return 0;
> >
> > -     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, =
sync_mode, p->vm);
> > +     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, =
AMDGPU_SYNC_EXPLICIT, p->vm);
> >   }
> >
> >   /**
>
