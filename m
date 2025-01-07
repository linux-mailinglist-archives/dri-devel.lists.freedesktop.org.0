Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95981A04891
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD7010E76D;
	Tue,  7 Jan 2025 17:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F124410E76D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:45:32 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2166f1e589cso15125415ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736271932; x=1736876732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaPQPHSvWyyLv8xX7fZJc9IEXHLgtsQ9XIp8Xqiuv3Y=;
 b=DScKgFn4sH1ShdkJzF4cXtpLWUiw4sV8Cj88ECkFF6uZ6PCvmx5wfEgxi/UatKKeUw
 aRy2HTqc2ZZIaKqpdHOMwFeoEXa5r+N5hjeji08/bsivvP8eHToE/hDqTHGZIgW9R+au
 pinAeAxdqUQvWNu+zwnBYimTtQPXEBznn1uWBDa0X8YGxzc+NCP+cmCnTax2J/tADAed
 Qk5BXLQL1/7+su3U9EuwUHQHuQaRTZDyn5rHQ54lPmyc624OHfXnHRK39sAKu9Rq2Dkr
 NPqNI6IxRCiN+4Xqwr1Szc5JhlpdMr2qXrQk6vyn3+37b5bI6weqlwK9R0FQwn+vaRPu
 tMFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNtokBgaY3IdBHuxkaAkPpa3jt/pdg3wmCXioPZ+jL5hq3pCYZbFMtxK9hvaHLiMrYxwXmEVrb0vY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvH15UgL9pXheYC1iZGIDCRtOOjP3U4tOVaUizZvauZCaxOmHS
 QyNcmjNjYFkFf73rmk3hIClWd2kt9nPVbC0VU5LvtC4F9qi3LrupFRA/9u10
X-Gm-Gg: ASbGncu8tHFaR+kIe/uFzANG4ZNk16fn41+n6iuWnM9tM4IRkZtghI60O+Em4b+nz4C
 aXqiXJbYTajB5UjGRCPIwRKj3m6h5DMk0bYYw+jUSb8ZpBleKt+4IE1Sb5OiclPzdUIO2WVb4E5
 tW+ZDKJi1jxRoVRlM9Zl6xtwixVVwY0Aj1Qkp3TOk0TOkkIHQUUidh3woXLbBO86XA2ca7TBOyp
 ZdIXAaAsL5GwGqpbRA63spdqkZWCD12PGmZtQofTzLjKcpg6xxc8T8D2OnDcJSkPUJEORPq9BvO
 wPeegueUD6PVFGQq6K8K7KI=
X-Google-Smtp-Source: AGHT+IHNywO5+2bPJLd/3jVimHEJ3ZwNCS3iiOLu0EZ/kiIr4RqENJi4Lia9c3dRIObHm5AWG8nTYQ==
X-Received: by 2002:a05:6300:6681:b0:1e0:d867:c875 with SMTP id
 adf61e73a8af0-1e88d2eadedmr34831637.36.1736271932013; 
 Tue, 07 Jan 2025 09:45:32 -0800 (PST)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad837395sm35014629b3a.69.2025.01.07.09.45.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:45:31 -0800 (PST)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-216281bc30fso14568665ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUduP0nzodal/57ty3zyQ2sVaCIT5dwP1XWvkobI+DhbTZuJF0D+yHQ+GTUpvh+EGsP6BnhiVh6h5c=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6d0:b0:4af:f630:7216 with SMTP id
 ada2fe7eead31-4b3d0f2999amr37101137.16.1736271565946; Tue, 07 Jan 2025
 09:39:25 -0800 (PST)
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
 <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
 <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
 <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
In-Reply-To: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jan 2025 18:39:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4w=zpLY0g6hdUN9-NTmmcpaqH5XxCCNSeu6oQsre8fw@mail.gmail.com>
X-Gm-Features: AbW1kvYJhzaw4K-QQnqpEvWHnGuJCeeRQqkPsoHSm_R-F6Oc8WJMTLEzNVdJ0LY
Message-ID: <CAMuHMdW4w=zpLY0g6hdUN9-NTmmcpaqH5XxCCNSeu6oQsre8fw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Doug Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi Doug,

On Tue, Jan 7, 2025 at 6:27=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
> On Wed, Dec 11, 2024 at 12:27=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Dec 10, 2024 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > > On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Each bridge instance creates up to four auxiliary devices with diff=
erent
> > > > names.  However, their IDs are always zero, causing duplicate filen=
ame
> > > > errors when a system has multiple bridges:
> > > >
> > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices=
/ti_sn65dsi86.gpio.0'
> > > >
> > > > Fix this by using a unique instance ID per bridge instance.  The
> > > > instance ID is derived from the I2C adapter number and the bridge's=
 I2C
> > > > address, to support multiple instances on the same bus.
> > > >
> > > > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and =
MIPI-to-eDP bridge into sub-drivers")
>
> When I applied the patch, the DRM tools ran checkpatch in strict mode
> which pointed out that you have too many digits in your "Fixes" hash.
> I've adjusted them to make checkpatch happy.

So the DRM tools don't use the latest version from linux-next yet...
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
scripts/checkpatch.pl?id=3D6356f18f09dc0781650c4f128ea48745fa48c415

> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > On the White Hawk development board:
> > > >
> > > >     /sys/bus/auxiliary/devices/
> > > >     |-- ti_sn65dsi86.aux.1068
> > > >     |-- ti_sn65dsi86.aux.4140
> > > >     |-- ti_sn65dsi86.bridge.1068
> > > >     |-- ti_sn65dsi86.bridge.4140
> > > >     |-- ti_sn65dsi86.gpio.1068
> > > >     |-- ti_sn65dsi86.gpio.4140
> > > >     |-- ti_sn65dsi86.pwm.1068
> > > >     `-- ti_sn65dsi86.pwm.4140
> > > >
> > > > Discussion after v1:
> > > >   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d=
1.1729180470.git.geert+renesas@glider.be
> > > >
> > > > Notes:
> > > >   - While the bridge supports only two possible I2C addresses, I2C
> > > >     translators may be present, increasing the address space.  Henc=
e the
> > > >     instance ID calculation assumes 10-bit addressing.  Perhaps it =
makes
> > > >     sense to introduce a global I2C helper function for this?
> > > >
> > > >   - I think this is the simplest solution.  If/when the auxiliary b=
us
> > > >     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can =
be
> > > >     updated.
> > > >
> > > > v2:
> > > >   - Use I2C adapter/address instead of ida_alloc().
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > While I agree with Laurent that having a more automatic solution woul=
d
> > > be nice, this is small and fixes a real problem. I'd be of the opinio=
n
> > > that we should land it.
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > Thanks!
> >
> > > If I personally end up being the person to land it, I'll likely wait
> > > until January since I'll be on vacation soon for the holidays and I
> > > don't want to check something that's slightly controversial in and
> > > then disappear. If someone else feels it's ready to land before then =
I
> > > have no objections.
> >
> > There is no need to hurry. The only board I have that needs this has
> > another issue in its second display pipeline, which will require a
> > new driver no one is working on yet.
>
> As promised, I've landed this. In this case I've landed in
> drm-misc-next. Even though it's a fix since it didn't sound urgent
> enough to land in drm-misc-fixes. Since it changes sysfs paths
> slightly, it feels like it would be good to give it extra bake time
> and not rush it as a fix.
>
> [1/1] drm/bridge: ti-sn65dsi86: Fix multiple instances
>       commit: 574f5ee2c85a00a579549d50e9fc9c6c072ee4c4

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
