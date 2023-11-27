Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA17FAD81
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 23:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D44510E1A7;
	Mon, 27 Nov 2023 22:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE8310E1A7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 22:34:16 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5cc55b82ee5so44803297b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 14:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701124455; x=1701729255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vGzcsQmOQggKxvH47Tmuwqz8+t2HhA4WbAiv2DPY8Y=;
 b=FXp6kwqtDELduPTTWP68P3TeE1nC2xuS4AqK6ilUpXXv7wgLdYFxUkdTmrqHPL1Hgk
 q7BzEYLjhY0BKBGNvCLizEC5r5q7bTwPltM8wJwaT5h2iaDTAIjc4IZilBny+yXm4BIe
 m90tW7O4ExywJL92rladB2lL+oA5yPR1TOpBGfXphz5jmqSzMG1vs6oijD6kcOniprwl
 tNnwgcu/r8bVjJa1A2OII8ncoUj8I29t1FOQOG3Xh+pQwX8KY1z2zSdxQv8nMnoaUKat
 ZbaI1/QwpDCtMgT1YCZXlHXPU6gtCEJFGUSu7jPp1Fd8+1H/gKuQEVtZ2Z4V2bHaWeFr
 GFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701124455; x=1701729255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vGzcsQmOQggKxvH47Tmuwqz8+t2HhA4WbAiv2DPY8Y=;
 b=wsA2NYH4PKAxp7jXIJ+RP9WJiWuS+FxKMWFbzyoHVQ3yObnqtlvN5K9nJ1CjXURYi/
 PZlXxbnPMSeOsf5fozGvxWVF4ZTfIngE9BYioorJvGARfvqlF6kCCjrEMb0MX/YP2wM3
 v5+o6B0TP+ExSSD0Eb4P+TJ5dUlIzxksx3APTPb2Aw6/I2lKcHwSR0N/p6A6fT4PiPdh
 kBMygrUvEFC7rUtQ9CJ7BMK+GMyRzNWBTii7Ctu3Y8WrL62ACfXCW13UT2aYIAbnUzhl
 y2rYFpHCQ2U/eZQUscO04ptVAXShryumjmu148OSaneGUMj6E5TurwpaGhffV+VfQgjb
 Sepw==
X-Gm-Message-State: AOJu0Yw5kUJDqw1FccWOsV/pwvQKS/+UAad2p97TI8OoofJo0n9tRnmp
 cGSyxbVwH22orm7+4S6hkw6cXuuJkhzJETUveQvvqw==
X-Google-Smtp-Source: AGHT+IEYWPEuZyZ69QjYMb0/vc3v6nEVmOOn24SzLtwWBbFeT4Ij5VfP4VJMQXY3IVaHPqBsT/A9Cy+DjHMdZR5nfa4=
X-Received: by 2002:a81:ac5b:0:b0:5d0:b0e7:929e with SMTP id
 z27-20020a81ac5b000000b005d0b0e7929emr3605101ywj.42.1701124455238; Mon, 27
 Nov 2023 14:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh>
In-Reply-To: <2023112739-willing-sighing-6bdd@gregkh>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Nov 2023 23:34:00 +0100
Message-ID: <CACRpkdbZvUMy7PzqnPSsM+SmMv5Z0mnVq_GU9_9HbBWXkg21zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
To: Greg KH <gregkh@linuxfoundation.org>, Liu Ying <victor.liu@nxp.com>
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
Cc: sfr@canb.auug.org.au, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, tzimmermann@suse.de, rafael@kernel.org,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, linux-next@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 7:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:

[Maxime]
> > So, a committer just applied this to drm-misc-fixes without your
> > approval.

That was me, mea culpa.
I learned a lesson. Or two.

> Wait, why exactly is this needed?  Nothing outside of the driver core
> should be needing this function, it shouldn't be public at all (I missed
> that before.)
>
> So please, revert it for now, let's figure out why DRM thinks this is
> needed for it's devices, and yet no other bus/subsystem does.

I'm preparing a revert series back to the original patch causing
the issue so we can clear the original bug out of the way, take
a step back and fix this properly.

Yours,
Linus Walleij
