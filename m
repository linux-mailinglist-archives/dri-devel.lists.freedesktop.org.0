Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F8555521
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 21:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395AA10EAC4;
	Wed, 22 Jun 2022 19:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FF910E9F7;
 Wed, 22 Jun 2022 19:57:10 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id lw20so14177898ejb.4;
 Wed, 22 Jun 2022 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=slE6QwbnINJ0ZcWZz3laYskRpRPR2ipykOosFL0pR0o=;
 b=YYf+IUOxoYVxwl0izENWWJhLNhN2sNvcPvcJ2zhqQvXVvwRGnnhh/774Ks2hghWwIy
 1bPq5iVDUNy4oBUztVM+U3f18WumXwhNk7yY6AeEym1+1OBPyHZDzJ9PgsRvAGcrXBBr
 4lTQW9JAGl9oYmdzYsZjOvhHvkkuT6UhI5uHAzj8SD10Oj+WNTM9iIAfbEMSPOik7Z1E
 RSPlJ54rXrTtnIR9yp1JBgzIGk8zcUWGVJmDgENJyKVKKGCIr89j7RbhjgkCZnwWqE+a
 rLpkk5+WgB8KD4qVxFr6i9nYO+eiGFKALkYrA7RH9UpScqWt5844lOnnt0AisTUIC231
 OaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=slE6QwbnINJ0ZcWZz3laYskRpRPR2ipykOosFL0pR0o=;
 b=d06VGnvQtSRv5ZocJctcwIhInLvJN/pbP5iqCPDkzxmDmoSnrGOCcpOaq7lqYwU9yh
 KUzfCCnPrB+9pf/FT1qxcWsQUuU/ff6EtoGtPYZ43w68N9TZQaTjEnMhFprsx5vuuD1m
 K42XAhjWguU7NLLxi00mB3XbFSqGNSjfClcelDFl4wKKUBPg1lllL2sudH+hfBMwJz5K
 yAMHgZStC0LAFlDjQ/gGXFFnbp9v5MIzCOPaeMJS615FqO+/VerJ2DDl7mCiLgI3ssjL
 TYwH7ykP14j1nqHCag5SEevelh3DaDAlX3Q6M2u3cOR41OLHPkKA7SmKmmFNJ7ecVWxY
 krbQ==
X-Gm-Message-State: AJIora/A09OFDal2VEjHiI9OppQ0YUMqbheRI1WKh5bnY1sl89hLsT/e
 8yL9kZqTsF9tqFIgI3SFHzpa+mbIMs3JWypR5k1e1KGA
X-Google-Smtp-Source: AGRyM1uwy+Mr50fckBcaC+6aVeyKtD50+E4NJqMCV5tteiPnaVdqyRlMu6L+dpz/X3JAT8hbg6IFCeyq4zGg8mAjGJ8=
X-Received: by 2002:a17:906:5253:b0:711:ee52:764e with SMTP id
 y19-20020a170906525300b00711ee52764emr4658042ejm.171.1655927829176; Wed, 22
 Jun 2022 12:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_O-TFZrkpVLExDGwXKWV5wfXnhhxvJ+761cLCizk2Qq4A@mail.gmail.com>
 <0e29cf45-d713-60d0-8184-e74c3ca0f091@suse.de>
In-Reply-To: <0e29cf45-d713-60d0-8184-e74c3ca0f091@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Jun 2022 15:56:57 -0400
Message-ID: <CADnq5_PNY8go_ZsL9-StH_deZfF8kat2F-NDDY_cS8kQe7CcrQ@mail.gmail.com>
Subject: Re: Using generic fbdev helpers breaks hibernation
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Thomas.  I think this got me on the right track.

Alex

On Tue, Jun 21, 2022 at 6:25 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 21.06.22 um 00:02 schrieb Alex Deucher:
> > Maybe someone more familiar with the generic drm fbdev helpers can
> > help me understand why they don't work with hibernation, at least with
> > AMD GPUs.  We converted amdgpu to use the generic helpers instead of
> > rolling our own in this patch[1], but it seems to have broken
> > hibernation[2].  amdgpu has always set mode_config.prefer_shadow =3D 1,
> > but that seems to be the cause of the hibernation breakage with the
> > generic helpers.  I've been staring at the code for a while now but I
> > can't see why this fails.  Any pointers?
>
> I don't the actual reason, but when I tried to convert radeon to generic
> fbdev emulation, I had to modify the fbdev code a bit. I don't see how
> this would apply to amdgpu, but you can find the patchset attached. See
> patches 1 and 2.
>
> Best regards
> Thomas
>
> >
> > Thanks,
> >
> > Alex
> >
> > [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D087451f372bf76d971184caa258807b7c35aac8f
> > [2] - https://bugzilla.kernel.org/show_bug.cgi?id=3D216119
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
