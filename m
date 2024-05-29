Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307338D4010
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 23:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFC210E046;
	Wed, 29 May 2024 21:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lw4QZ1B4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E2110E046;
 Wed, 29 May 2024 21:10:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2bd816ecaf5so127409a91.2; 
 Wed, 29 May 2024 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717017000; x=1717621800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqepwojQITdRaaNvzhd1MyPqkWDLdApUnBwQiHn7u18=;
 b=lw4QZ1B4cM1nk2ljbFuwu8x16+ggYStg3PoJ6n2TOUMLZlEzmhXA37JQIpxOgaEl9r
 Vm4T4fACxxg2vti0om+IskSUzQshhj/xe8YJb83MZOYkETD666V3vHdX+6E2IXa6qzMA
 2Aj3Og7IUMdr+dLhygPNamxPENILIPCxHliU6dshnTS/QvGvx7gLo8caIcnnx5VtifcK
 7JuUEe3JNj1odu6cA3W4/FxVPaJTyV3KMR/7uZveea1oy7dXcI4yFcD7fMTCzGcNC+09
 Se66whRaWmxILrlIPGYMjda5ayES/zFiAe2biBX6KFI9ssd8MT7GcphbeHqRJiHmDGTe
 1R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717017000; x=1717621800;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqepwojQITdRaaNvzhd1MyPqkWDLdApUnBwQiHn7u18=;
 b=rK+uA7tqnEmcswxZynGQ/HYecsilRKSLyimRGdd1Ya8iVskBGCJrks/Afqh5BnvK0G
 mL9G6kQBYIUif89v6qkugvVTtRiIc2f+SwAg7zbjZuox0aWS3lEA8aaG0QUXy9UqER8j
 Y2S03zOorjGH29t+ycrTr03tVlc//OX67N+YKVIDuHwc8IL6CeYsUTbAvwWicTCf6mdV
 XCcQT0kRlH1CPA6PbuZggcu/0m8IxyNemMjzksNznL87H2FBCXvmlUuRcHyO46aXO+YU
 wL7tO7kXHd+hR2HmojpHc7XkfwtZkbKkhKgyn20kckjIfgXRUclKb6VjiWpMBC4wEnf9
 HmVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk0lR0ZeMyYBsjYmrUR7lLNPbEmbce4Y8iCsc93k+wCg5g/dJQ9R4kG6ScKdVh1o7lXa8lw2tjvK42JaR9BC+EJHB8CqoLfGCMuzF0HP4b8LHPkbUXAZ4wWJoL8u4EE5sp0oxz8UiCYPcc6cV+Gw==
X-Gm-Message-State: AOJu0Yw38XCfEDig5rTeqwOWzUNaZWFBtICC6Gc/fwcaKVJMCIWXpx3q
 g8aYk2Lv6xQQYIoI+f7Q1oI0xRpQyzw9lP9q77y3VXTz/1uEpYiC1c3/lcpOViIPp+vP+43ILrV
 X0VOB3nXcc7sCq6w7bjTFUFLMmMM=
X-Google-Smtp-Source: AGHT+IHOKFjkG00OuD8+7WwytX76EoipH/o0vveYhjZ0hzvFBZD/IQvMKnTYW8sPKhx15D5KLNkijnY2miBwU2Jo+24=
X-Received: by 2002:a17:90a:dd41:b0:2be:d143:8d60 with SMTP id
 98e67ed59e1d1-2c1ab9fab4cmr291810a91.16.1717016999723; Wed, 29 May 2024
 14:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
 <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>
 <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
In-Reply-To: <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 May 2024 17:09:47 -0400
Message-ID: <CADnq5_M=sd_spEFnboWECMU2t4--y0XF-CcMAL8e_49Zt4dTig@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alex Deucher <alexdeucher@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Evan Quan <evan.quan@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
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

On Wed, May 29, 2024 at 2:47=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Alex,
>
> On Thu, May 09, 2024 at 01:15:32PM -0400, Alex Deucher wrote:
> > On Thu, May 9, 2024 at 8:02=E2=80=AFAM Heiner Kallweit <hkallweit1@gmai=
l.com> wrote:
> > >
> > > Support for I2C_CLASS_SPD  is currently being removed from the kernel=
.
> > > Only remaining step is to remove the definition of I2C_CLASS_SPD.
> > > Setting I2C_CLASS_SPD  in a driver is a no-op meanwhile, so remove it
> > > here.
> > >
> > > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > and applied.
>
> TLDR: can you ack this so I can apply it for -rc2?
>
> Reason: I2C_CLASS_SPD was scheduled to be removed for 5.10. For some
> reason, the newly introduced usage of I2C_CLASS_SPD in this driver went
> unnoticed in -next. I would really like to remove I2C_CLASS_SPD now
> before other users appear in the next cycle. In my experience, it is
> possible to send Linus such patches for early rcX. Like it fixes a "bug"
> when trying to handle a moving target.
>
> So, would that be possible that I push this upstream so I can ultimately
> remove I2C_CLASS_SPD without further dependencies? If you prefer to push
> it through your tree, can you send it to Linus soon?

Yes, I'll include the patch in my PR for this week.

Thanks,

Alex
