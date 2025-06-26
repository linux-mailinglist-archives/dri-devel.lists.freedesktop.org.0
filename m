Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8579AEA1F4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 17:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B4710E8D2;
	Thu, 26 Jun 2025 15:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QuM7Gnie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1233910E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 15:08:24 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-32b31afa781so8638701fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750950502; x=1751555302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFuEEDOzNJYie2aS6VWkJQnYh/biJhh/VjmDxkcdYnA=;
 b=QuM7GniebVMosZQqNnV9gorCZcER9gjqT32TBn8p+HzuMKgJu963FOKYqZMXgc4E7s
 QkHiC1+XDM1fDedrFs6z+DFa48V00OGiAjDHiNe1yjoS2epoWdYV+y59oOD0CBho0TK+
 QePDFJ9UTnGAlOJnTqR1z/b8McUH5DFSl+GrG2FoI8f7yyJ/1Oc7Pr/aVVjebxv/UguX
 cQFiLqUhkh25Sq2fWlw8HKA5ILGUNhm20uiwuR/B3VIzNawHkLSNc803IF6j1wgVrnfH
 rhXqPKsyTdSP7DZUpmWTeyVaqkLDM7EfOId/hWTjcENRT0H0oxU9GC/KaE6FaU5SYkq0
 Gjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750950502; x=1751555302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFuEEDOzNJYie2aS6VWkJQnYh/biJhh/VjmDxkcdYnA=;
 b=ksPT9lDwsxMIo3EjDdQkvg4i4Kt0Y7DoFiMzU7g30VxJZmtImrz+6Cuxwc4gIzeUaP
 L3KKs9Fw/PpeI3f8pd231V/eGRFbwAcyIK1c2xAJeoATULiBq3xmGOBUGthqfZajnlfm
 jrXZPxTH8ZQp0Wo3dCB11BHAI5GmOue7Q2nQ9ZI1qFhSjxrBfMDz6iM79N1mn9CEXSFz
 6mf8pVpY0Wc/eDVtPSVUbrDIgFhLgw9N8wlHw56qlQ2XnWYhtUvfH/MOsGkJnygViK1e
 mbJmUWczMKkBL7g46u7EsZ8n1uo7OMLr3wbkPwOvvvwVnJmINdFqkQ+OPgF1MDiWu/ky
 mRlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3tCQr7xKWaLxs9XJJrrywaNfqbX6ZnimEf/wQjezPUDx8xJmuB5ghmJc9DJtClkTHVFoY69XhQOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw47C/r3vOBatb4kSI6MRZzZRxrvd+fwzMSXTqeWg4lRADlyD6l
 rItoLIip+0+HxGwaD9uboiMLxabzqXtgozCl9FoCqWh+9aDkSmJtqaxBI3W8xCuWz8A11OQm/EE
 R20u6pP/YQxKVEN5ABLN4tW7RfbeZHYI=
X-Gm-Gg: ASbGnctB92HCMAqjIEMEwCyP9YwJyWxSfIeeNGDqnQ+2+hS/89OQ9HN++b+wJT5i/k2
 TTX9PTC3rOogTp2+Qe4rEVv6Dx/kpVoSnPDmBANYDBb43Lbc+BqLmMdoP736G6WhBd8pheA6hwp
 odO/0f2cm/Fx/0Ndk96CQ0n5ATrnbTait93TGGbJfem0MHhKPyqQB5vGelDIy6VEWAiYBd+oU+g
 nYXZQ==
X-Google-Smtp-Source: AGHT+IGrpoccZpE7gCl7xfdKVG914W+wx7VH7Dsg1ZCo+rhw6h3VHHsoRSKoF6qysZJ9WGyQege+2T82Jbrty12yIA0=
X-Received: by 2002:a2e:a011:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-32cc65b7b0cmr18432591fa.35.1750950500472; Thu, 26 Jun 2025
 08:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250626142243.19071-1-pranav.tyagi03@gmail.com>
 <2025062607-hardener-splotchy-1e70@gregkh>
In-Reply-To: <2025062607-hardener-splotchy-1e70@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 20:38:09 +0530
X-Gm-Features: Ac12FXz90vVDsL3CpnJRMV-o2H8K_6Vief1VnLAmxr4fTIuJkeSDNsKRMhYHXKg
Message-ID: <CAH4c4jJqX6C4+xvHKqC2fmN7HRhKPgD2XcjnwO2MR0xtMyEhRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, hamohammed.sa@gmail.com, 
 daniel@ffwll.ch, airlied@linux.ie, mcanal@igalia.com, arthurgrillo@riseup.net, 
 mairacanal@riseup.net, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org, 
 sashal@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 26, 2025 at 8:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jun 26, 2025 at 07:52:43PM +0530, Pranav Tyagi wrote:
> > From: Ma=C3=ADra Canal <mcanal@igalia.com>
> >
> > [ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]
> >
> > Currently, it is possible for the composer to be set as enabled and the=
n
> > as disabled without a proper call for the vkms_vblank_simulate(). This
> > is problematic, because the driver would skip one CRC output, causing C=
RC
> > tests to fail. Therefore, we need to make sure that, for each time the
> > composer is set as enabled, a composer job is added to the queue.
> >
> > In order to provide this guarantee, add a mutex that will lock before
> > the composer is set as enabled and will unlock only after the composer
> > job is added to the queue. This way, we can have a guarantee that the
> > driver won't skip a CRC entry.
> >
> > This race-condition is affecting the IGT test "writeback-check-output",
> > making the test fail and also, leaking writeback framebuffers, as the
> > writeback job is queued, but it is not signaled. This patch avoids both
> > problems.
> >
> > [v2]:
> >     * Create a new mutex and keep the spinlock across the atomic commit=
 in
> >       order to avoid interrupts that could result in deadlocks.
> >
> > [ Backport to 5.15: context cleanly applied with no semantic changes.
> > Build-tested. ]
>
> Did you forget about 6.1.y?
>
> confused,
>
> greg k-h

Apologies for the oversight.

Regards
Pranav Tyagi
