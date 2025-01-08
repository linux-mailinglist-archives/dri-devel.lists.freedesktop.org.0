Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C870A04E8B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 02:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF6510E422;
	Wed,  8 Jan 2025 01:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mOIabX0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C5F10E41E;
 Wed,  8 Jan 2025 01:05:34 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so2663736766b.2; 
 Tue, 07 Jan 2025 17:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736298273; x=1736903073; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BFRpOVVEyZDwWW7S29zceUmPpuxv5eNMBA/Dkqrr8jg=;
 b=mOIabX0Mx4ABXMjtOQWd0g2JrvYoUMznPfMvMy/cTm3gQWWTzJe7g3e9aZ4BAynavz
 qZ2uzGHLnXqILToO1rT3Wg648+eDkclO1BLfyUMVVB6T6S8cuZiEfb0TMQ+cPj7UbW0D
 +bSo8y8tYtYNdMufJ9Bc8uT7neKebsgiV3XwQ5enDiLcICY+yHRw5qNpjW1zix2T4uAg
 CXY0we8v1N6s9p9tlz8MlTWzmdLpTAJm8YPtfJ7QGHwYs6ZPMdml9qclaZklyQOPeCdE
 cdq3kKBlT2cnFf12rRG8JPbvzfVMqo9z4xGi+BgxkRjB/C3cd+Hw9mxCQ9WplQPiEZz2
 jaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736298273; x=1736903073;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BFRpOVVEyZDwWW7S29zceUmPpuxv5eNMBA/Dkqrr8jg=;
 b=T1S6GQrpLMXsww5tIxJKKg8PYdfzNR1tK1s4D5xGjjDnruCt381OxvOTfHUxLvPY3m
 O9ma/tf/P8hQVwFxop2c4G7iPBBiZj19Ot1NmZ/2UMl/Wj6eSbDF3ydt6eXW/GqjN4bO
 9pDTms+NE1JGNRx4aFj6C729tctNRMrliCAIbAY0Opq55sYd7lSvFtu0qS0ujo+5SVPo
 13Y/fYOgL4TgRNmavwAMskKsIUsAVvAW/m8ClGXxK7KFzQ1OuTLmgbwwr3UY3BCccRIg
 z5Wu2pAqjxuHE1xZsy3NHoOObCnAvLWf1PKlK464pn1twv0LdKOFUkmFWnUYI2Ub1a+k
 An3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxkLNhbfTP5nKf0/t9B+lh9rR2UzAD5nrfiVmxLvopjZ3TqmdKeenIpD/7OL84jMvLVf4glcB1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmxmLTHgj7JdKhmP60k0Y3VaIhZDZpGH0GlRA896R3EIYx4zqN
 esuPyUDVTJkODKa/dvZhFH0ZFg2h0+JUpv84RoxZB/li7fwMdx9pTTUzud3joDsbojvgDfVKEpO
 EhhYPKf0uAy1G5vLqMWnuhGe6rFYqq4+X
X-Gm-Gg: ASbGncvkG6+LREP8SFYMBijn6dEADWXKOpJGM9PFYuopnu1bmDqq/B8B9d0/l94UuG6
 lzx0va8FylD+Na7qqdb71Xlj4cSQHU3Zqrbm/
X-Google-Smtp-Source: AGHT+IHvL6KJToeOzgdZ2o6X3wMIb7VkR5mA+dkxqC57iUb7vLJOL787QzBEMqu6FP7Hd8VhJH5p7cig4IHvpvodATo=
X-Received: by 2002:a17:906:ef0b:b0:aa6:88ae:22a with SMTP id
 a640c23a62f3a-ab2abc6f22dmr56579866b.37.1736298272636; Tue, 07 Jan 2025
 17:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20250107055846.536589-1-airlied@gmail.com>
 <Z31P_Wp4qMzIlv88@pollux>
In-Reply-To: <Z31P_Wp4qMzIlv88@pollux>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 8 Jan 2025 11:04:21 +1000
X-Gm-Features: AbW1kvbEo7x_Sn0vEF1FHhBgeHVyVjN5RqP7SRpTkKkSuFPMMEFvtdPF8JQHRsY
Message-ID: <CAPM=9twK4UUnrOc1rB7bZLgWG534HH14vsdyCgUcKX1YLrnNDg@mail.gmail.com>
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly.
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
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

On Wed, 8 Jan 2025 at 02:02, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Tue, Jan 07, 2025 at 03:58:46PM +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > If we have two nouveau controlled devices and one passes a dma-fence
> > to the other, when we hit the sync path it can cause the second device
> > to try and put a sync wait in it's pushbuf for the seqno of the context
> > on the first device.
> >
> > Since fence contexts are vmm bound, check the if vmm's match between
> > both users, this should ensure that fence seqnos don't get used wrongly
> > on incorrect channels.
>
> The fence sequence number is global, i.e. per device, hence checking the vmm
> context seems too restrictive.
>
> Wouldn't it be better to ensure that `prev->cli->drm == chan->cli->drm`?

Can you prove that? I thought the same and I've gone around a few
times yesterday/today and convinced myself what I wrote is right.

dma_fence_init gets passed the seqno which comes from fctx->sequence,
which is nouveau_fence_chan, which gets allocated for each channel.

So we should hit this path if we have 2 userspace submits, one with
say graphics, the one with copy engine contexts, otherwise we should
wait on the CPU.

> >  drivers/gpu/drm/nouveau/nouveau_fence.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index ee5e9d40c166f..5743c82f4094b 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -370,7 +370,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
> >
> >                               rcu_read_lock();
> >                               prev = rcu_dereference(f->channel);
> > -                             if (prev && (prev == chan ||
> > +                             if (prev && (prev->vmm == chan->vmm) &&
> > +                                 (prev == chan ||
>
> Maybe better break it down a bit, e.g.
>
> bool local = prev && (prev->... == chan->...);
>
> if (local && ...) {
> ...
> }

I'll update that once we resolve the above.

Dave.
