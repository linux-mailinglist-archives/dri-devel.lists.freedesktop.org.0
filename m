Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA5BF305D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A682610E4C8;
	Mon, 20 Oct 2025 18:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inqXn8jJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594610E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 18:51:38 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-4444887d8d1so1094448b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760986297; x=1761591097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vsthhME6C5E/KVlrt09XAdKh88uNeVFJkSudT+yDN8=;
 b=inqXn8jJoUnHyl5TICHSNbnmbOtmozUTUBoMVoUsim0dfr7wtPd0B46oJjE1Tjx/kW
 9HerE7OAx1M8ZjKmQag5YU+TAG3Po3BJnmQQ2OqSmwbYLIsDq6xr3dFALLFQm0T27RQc
 4Gb/hZMw8GRgckLI2apDvWMwC5vsre6KCFeDR0rjzcS8WStpfRp4EzU6VZ9LiVir5+Jj
 bDSzSzKjAzuqGpLV/DX3ndCCZrv7cpyhFrOTxZTDVPwWUUhlMcbjLiEoFD/NO/Tk4r/v
 jXTFMVB+9/XF0qS1ymUXUCcJPxRIEvOYM7377AgBajgxXAXjw3zVkgoNC9AJQTybLVST
 WQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760986297; x=1761591097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+vsthhME6C5E/KVlrt09XAdKh88uNeVFJkSudT+yDN8=;
 b=YfA+VEHLZ4Qa0+r7MXUys5szTl6KgSzsuyqrbGtnP6WA7oYVG0JM44ZEfMZwG5ruqD
 ZS9O7+osFOo/zqXQdY+/1FzbaXONuNc/62/7dnpqBQuYUn8e2rDFH3i7U/Mv+TD0YsVq
 ySdhUIwY4lCirdvR7S/DtwJLqlhy+pttbgb6RWKygH7dcWJNDWjujkqgBRvQaf/VODlL
 OUDL9qGSILnSUUWSoCyDlxclzY8xWUG78VN9A6mg4P2YEfcHNttBJ0IJoDoNzjMHqQPU
 LlG4PPIwFWmQ/ghzYZcOtH8kWvuAbAZy/cz08puKTesWwBxUATxCTjSFzeOJcWIYMoPN
 Lakw==
X-Gm-Message-State: AOJu0YxCoIdUSiCdD+ECbAzKmAOQTMoyanLsN+0w9DXPbpuJUZmZu0Yc
 1GwF5ScxuqNtHozSDXKAtel4UR7gAW8++YpDG1+M7S72tjEDdE0uJZePoJD16V/x4RlrORNGx+y
 5eCEtUqNHtmtK4b1DNJ8E1rHZ7/9eKA8=
X-Gm-Gg: ASbGnctdiSKKH0lwZuMrgYJjffMHjMEiW6hHEO97mz430YwHqePa6O6B5PYCbLzdVJ1
 7sm9bk8C4CoX4/toR6ksCNCG32MrujTln6LD7GdwKLzGus0nxyFrE06W+/YCJp8xoAG7Yy2uRyG
 jNuLMjM29QjeZAViHmEtnhjLiikzoMYv9nYYIpp6aRd0Kbj2nqGewDERp89PxmUQn2AiVlSrNSX
 a3tffcvih4prmpG8YCz4P+CkSz6S2MjCnKfvdaFzqPsCwCNYWoXcq2j1mPKIEO+OlrJcQ==
X-Google-Smtp-Source: AGHT+IH4hrQ0pCg0q1eiVkWENe8fkrrS1susN02fuh7MCHo4dpm9btSTzesYb7Fp6Q8tcKYk1G0dg24eRhv74g8VglA=
X-Received: by 2002:a05:6808:1a0d:b0:441:8f74:fae with SMTP id
 5614622812f47-443a31b76b8mr6533038b6e.59.1760986297109; Mon, 20 Oct 2025
 11:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkpkRXO35=pmEZLJ4efTzaUytu6GURwogPdv3hroOYmHWg4JQ@mail.gmail.com>
 <CADnq5_MO7=jx4qbzsHW8=M4jyYgmLxc+QT78qbv00POuBbtxuw@mail.gmail.com>
In-Reply-To: <CADnq5_MO7=jx4qbzsHW8=M4jyYgmLxc+QT78qbv00POuBbtxuw@mail.gmail.com>
From: John Smith <itistotalbotnet@gmail.com>
Date: Mon, 20 Oct 2025 20:51:26 +0200
X-Gm-Features: AS18NWB17bQ_bDtcsWuGOmUjHHKnggVNN0a-NUht4F0EXMlh2bXL3jYWn5x65eg
Message-ID: <CAGkpkRUPsiaDPBqaOVWmvn_iZRVk9vzMMamy-r9M43h0cBNb7w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value
 on Fiji
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org
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

> It would be good to switch both of these for consistency with the
> other chips, but the rationale for this is not quite correct.
> PCIeBootLinkLevel is supposed to represent the level the link was
> trained at when the system booted.

I see, didn't know about that.

> If this does make a difference for you,
> then you may have a platform which does not support dynamic gen
> switching in which case, you'd be stuck at the boot level.

No clue, this is the only Fiji card that I have and the only card that
exhibits this behaviour,
my Polaris card and a Nvidia card that I have spare do the switching
just fine...

> Please send this patch along with the patch for iceland and I'll apply th=
em.

Will do.

On Mon, Oct 20, 2025 at 8:00=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Mon, Oct 20, 2025 at 10:21=E2=80=AFAM John Smith <itistotalbotnet@gmai=
l.com> wrote:
> >
> > Fiji seems to have difficulty with switching PCIe generations
> > including on my Instinct MI8, where it is basically stuck at Gen 1
> > unless manually switched by using a different PowerPlay profile.
> > (using the pp_dpm_pcie sysfs does not work)
> >
> > 18edef19ea44 introduced support for Fiji's SMU, which included setting
> > the PCIeBootLinkLevel value to zero which is equal to PCI Express Gen
> > 1.
> >
> > By copying what Tonga and other generations of AMD GPUs do, which is
> > to use the maximum value from the speed table, fixes the issue.
> >
> > (p.s. I believe Topaz's SMU also has the same issue, I can send in an
> > additional patch if needed)
>
> It would be good to switch both of these for consistency with the
> other chips, but the rationale for this is not quite correct.
> PCIeBootLinkLevel is supposed to represent the level the link was
> trained at when the system booted.  We should read the current level
> from PCI config space, however, it was changed to
> pcie_speed_table.count because after a driver unload and reload, the
> PCIe level will end up at gen 1 because the firmware will put it there
> when the driver was previously loaded.  I don't think the boot link
> level affects PCIe at runtime.  IIRC, the PCIe gen levels are
> determined based on PCIe caps and whether the platform supports
> dynamic PCIe gen switching.  If this does make a difference for you,
> then you may have a platform which does not support dynamic gen
> switching in which case, you'd be stuck at the boot level.  Please
> send this patch along with the patch for iceland and I'll apply them.
>
> Thanks!
>
> Alex
>
> >
> > Fixes: 18edef19ea44 ("drm/amd/powerplay: implement fw image related
> > smu interface for Fiji.")
> > Signed-off-by: John Smith <itistotalbotnet@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> > b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> > index d2dbd90bb427..0a876c840c79 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> > @@ -2024,7 +2024,7 @@ static int fiji_init_smc_table(struct pp_hwmgr *h=
wmgr)
> >   table->VoltageResponseTime =3D 0;
> >   table->PhaseResponseTime =3D 0;
> >   table->MemoryThermThrottleEnable =3D 1;
> > - table->PCIeBootLinkLevel =3D 0;      /* 0:Gen1 1:Gen2 2:Gen3*/
> > + table->PCIeBootLinkLevel =3D (uint8_t) (data->dpm_table.pcie_speed_ta=
ble.count);
> >   table->PCIeGenInterval =3D 1;
> >   table->VRConfig =3D 0;
