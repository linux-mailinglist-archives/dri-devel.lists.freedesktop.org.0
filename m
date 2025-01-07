Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14037A04849
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CB910E75F;
	Tue,  7 Jan 2025 17:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WmXgPk0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453B910E75F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:29:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3003943288bso179793971fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736270929; x=1736875729;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5e6oybH8waw0F1euskY/nJ2JCR+I1f/uoiRiLQitoeM=;
 b=WmXgPk0rJi2rsEXf9xxCnZy0+6nwctjwO7CFo8aawtO5NFdw2x/Aj3/aKH6oCxTQ4w
 KYLswwO/QDDG3i/zTKZeBfGPE8eANhPWpu/6GBz5Z8ccmQC9smOCdBTNOY8trQYk2pGP
 ZJ8Zk4ggNyKWNGpKkL6z3q/dxGjacBT4xPcrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736270929; x=1736875729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5e6oybH8waw0F1euskY/nJ2JCR+I1f/uoiRiLQitoeM=;
 b=i6zTUgCLi+AiIHyS16BkEeAxdRlD0P36j57TbKzngj9ya/cpJLuYPF3fEkltxXFH/u
 Rxni5RvxOEfpu9yex/zg5GjaJBhNRHYe67N3TYJ8a/Zrxtow953emRso/XDp5qUGMDTK
 vXZZp4W0/x4+6DjanmvbXo3oBVOl7YKPgWl6QeLekZpxl9et6CuBcXz5UoDDbJflKJuc
 dXrn9cSzPsAQFeT5msRvjID/DXksHaEM/Ah9nMuK+RmvDGEvlvZG0ejFKc6XwKRDoHaS
 336JnmkK1G6ntl00f0EIRb24Q6lZrEB4hyhLw8L4Bje5zZGba7PeUYKMbgjSmqpA+eGS
 Y5dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULPe23GknUWfQUt1aSjy2FKz7YHbQjF2XDvM1AaIURs3GGVcZx2GPmPW9rbL3UMAo8R7UhAsh3JUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7dWozxYf3UOg/IXDpMJBcQNuTrZ5BQvc0wCuwd79Lhx9IXr3i
 JCHJSEdlrw49gksJ89LB1O8lWUHTLVJ6vng+NzicjYzWIykvXk9F3/xGBFVPT0uzoFD0XYA0ubC
 78bn2
X-Gm-Gg: ASbGncvRC3v9WCuvtapY22fwo6XMXH+f9gp4NiBsWWUQRTXWooQNvNaspVU7MoHsumj
 6QN0MRNj7ZWOV1leJyICjXy5M8EgbWxkBXGIKU1mmnr3mkTi0tG28x4vm4jidWTsQyX2NoafwH5
 v7y6MN8XPDw48RAfoigcVeexnAAtbHeAsDCPBDkHSvG9fl0Mq6uqBVppuyjwDFBeZIf6IxCwwLJ
 6eMiCZJsOOySMdkKKGyZkoH3bqr4/UivYVQlqe8i0PtYX3JpVloXS8GCWES0hvJdVFndWmjQedL
 5c60l2U+pOirI565doSm
X-Google-Smtp-Source: AGHT+IGmiZpbJ+VO5H7wMHT5uHfD8TMWmtNsy+X50ZhpOI2B8yuPP63MgWYBZ6wB8lIBc7F3ZfTHKQ==
X-Received: by 2002:a05:651c:1501:b0:302:1861:6df4 with SMTP id
 38308e7fff4ca-30468620922mr198950231fa.35.1736270510208; 
 Tue, 07 Jan 2025 09:21:50 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b06a1easm60576221fa.73.2025.01.07.09.21.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:21:49 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so16715268e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:21:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU+TkLL5NzBfsPWJcdc6zrM9hFv8nAFiINDcuwfz9EYTqiczjj0AT4I3ex5qlm1hzYUl7jqBP5RrsY=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2308:b0:540:357a:4aa3 with SMTP id
 2adb3069b0e04-542295404demr19430722e87.28.1736270507695; Tue, 07 Jan 2025
 09:21:47 -0800 (PST)
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
 <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
 <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
In-Reply-To: <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jan 2025 09:21:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
X-Gm-Features: AbW1kvazHgvULSfHqt_0VX8ft9CTn7RJ3u6wjnfVyyyuGT7WJIlXCd5AaiKW4R8
Message-ID: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi

On Wed, Dec 11, 2024 at 12:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Doug,
>
> On Tue, Dec 10, 2024 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> > On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Each bridge instance creates up to four auxiliary devices with differ=
ent
> > > names.  However, their IDs are always zero, causing duplicate filenam=
e
> > > errors when a system has multiple bridges:
> > >
> > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/t=
i_sn65dsi86.gpio.0'
> > >
> > > Fix this by using a unique instance ID per bridge instance.  The
> > > instance ID is derived from the I2C adapter number and the bridge's I=
2C
> > > address, to support multiple instances on the same bus.
> > >
> > > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MI=
PI-to-eDP bridge into sub-drivers")

When I applied the patch, the DRM tools ran checkpatch in strict mode
which pointed out that you have too many digits in your "Fixes" hash.
I've adjusted them to make checkpatch happy.


> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > On the White Hawk development board:
> > >
> > >     /sys/bus/auxiliary/devices/
> > >     |-- ti_sn65dsi86.aux.1068
> > >     |-- ti_sn65dsi86.aux.4140
> > >     |-- ti_sn65dsi86.bridge.1068
> > >     |-- ti_sn65dsi86.bridge.4140
> > >     |-- ti_sn65dsi86.gpio.1068
> > >     |-- ti_sn65dsi86.gpio.4140
> > >     |-- ti_sn65dsi86.pwm.1068
> > >     `-- ti_sn65dsi86.pwm.4140
> > >
> > > Discussion after v1:
> > >   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.=
1729180470.git.geert+renesas@glider.be
> > >
> > > Notes:
> > >   - While the bridge supports only two possible I2C addresses, I2C
> > >     translators may be present, increasing the address space.  Hence =
the
> > >     instance ID calculation assumes 10-bit addressing.  Perhaps it ma=
kes
> > >     sense to introduce a global I2C helper function for this?
> > >
> > >   - I think this is the simplest solution.  If/when the auxiliary bus
> > >     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
> > >     updated.
> > >
> > > v2:
> > >   - Use I2C adapter/address instead of ida_alloc().
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > While I agree with Laurent that having a more automatic solution would
> > be nice, this is small and fixes a real problem. I'd be of the opinion
> > that we should land it.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks!
>
> > If I personally end up being the person to land it, I'll likely wait
> > until January since I'll be on vacation soon for the holidays and I
> > don't want to check something that's slightly controversial in and
> > then disappear. If someone else feels it's ready to land before then I
> > have no objections.
>
> There is no need to hurry. The only board I have that needs this has
> another issue in its second display pipeline, which will require a
> new driver no one is working on yet.

As promised, I've landed this. In this case I've landed in
drm-misc-next. Even though it's a fix since it didn't sound urgent
enough to land in drm-misc-fixes. Since it changes sysfs paths
slightly, it feels like it would be good to give it extra bake time
and not rush it as a fix.

[1/1] drm/bridge: ti-sn65dsi86: Fix multiple instances
      commit: 574f5ee2c85a00a579549d50e9fc9c6c072ee4c4

-Doug
