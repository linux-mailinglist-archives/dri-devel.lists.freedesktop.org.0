Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652B7A6DFE6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A982A10E498;
	Mon, 24 Mar 2025 16:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IDaIOSAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A647E10E498
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:37:37 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54ac9b3ddf6so4645170e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742834252; x=1743439052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRKqfgDsRXrCJD50JjVrfzsEqczQFA94Egvgh0Ek2Oo=;
 b=IDaIOSAhqXXifyFioSDTdSdwl26nFaIN2PPni7rmuNvGhBjMz+d6a4YpQUqn3UbT6t
 LBJDw/tXO/cGvsMDRL1LdrtFagYJ0fS36PfUlU1bWg9y13qUwh4K1MXqzEL2WS6aHxsc
 DaMfQFdGIm82dTdeK0pT91si0xFIvABr8x83I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742834252; x=1743439052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRKqfgDsRXrCJD50JjVrfzsEqczQFA94Egvgh0Ek2Oo=;
 b=GLWqXdB/leOu79pxfyyGpAnFoiI453GVLsWSxlFkqQ5JBpMeE/ngdHS0BZ3CNF0mVn
 pF43XCuH43QDEL5bLajMhv6Q72f/VuMSeCKevwlriIwGoggjUwra6YiWNc4gqyT7g6Qj
 5xizatOww2G4pNyAFsnltAILsLEoVRxM1IyWosdjW5H4XYNtoIr+2eWvQqKL+oa3bqk2
 Xr1bjYQ2AyStng1/T/KRSTkPZIQO+1kwtGH1ze3C9b8vkQ0kr6pG9mOnGj1qefupebBD
 RIes1X2IlD+850kdUfsMdPywDKTBJDDvtp7v7rcFyviwNDheEx7fh2CqhRJ+PfdlQWg8
 JqHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW59TZlDzu8qgWgXcDP3KWUzGEFEEcRAWWDQUPZRVMNlbZL9T9oFJzEVxZ0XW0OYeU6OdmzBR+Lk4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx577Uct+U9gBHn4uWHcoY7KBtK6cIA97hJx0tAHB5trolceQu+
 WY7MptZRg6gv6ajCDB4ofcIp+dyq+IZEgaLqd2rFzVKe4kT310iWUIY8DMr9oQ1f4XTNFxkNVhQ
 19Q==
X-Gm-Gg: ASbGnctM/a24DsT5g23MXnoPWaf4GmLJJRkxSPW4Xmp5q6/jU43XGiqQVivYMM2YCl7
 ClCnCJ6aVpaSRB+ImZRx7mV/OpowGnVNnEHp4OMs3ld48cm3kI2RcaMxnoSSzy10y+ooWeAQ5Bj
 vUQ6y6Lqww6XE4JoCT2L9nf5Cw9mng6yGBAhjiqn19wRVNceO4MlnUxGkZ/eFfefKq6IfLjP7q8
 TNOYnSoXV5u2up/2RESkztq3puszogUa2/415YNflvGFheA9L+R0mzuc0CBHzwN7daQsNu/djHI
 DrWLZFORW1P+hLkkjouJaLxfhPIo+R9KaBLI/ECKRGSqHddTt+BGyiFYf8aJcMo4+nd1Ylt8qmk
 F63JTw6vf
X-Google-Smtp-Source: AGHT+IF28ndI/AnJLpRvAsZjHlLznoxjeyH9cj8s5ULVCwat1wF9yeNlBwurMzgGO9Kd5wwb/3BqAQ==
X-Received: by 2002:ac2:4e07:0:b0:548:e44d:f3ee with SMTP id
 2adb3069b0e04-54ad646cdf7mr4793818e87.10.1742834252100; 
 Mon, 24 Mar 2025 09:37:32 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad650374dsm1186717e87.161.2025.03.24.09.37.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 09:37:26 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5497e7bf2e0so5389043e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:37:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0wDDK4SxrYRcDNr28akdf6srNxC0nlFsj4YAtRBikt9yoY4Lp5QJ6w6VsnkYeAd7t5WPQe8Df0/I=@lists.freedesktop.org
X-Received: by 2002:ac2:4e0a:0:b0:549:8d60:ca76 with SMTP id
 2adb3069b0e04-54ad64f08f2mr4073123e87.38.1742834245765; Mon, 24 Mar 2025
 09:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
In-Reply-To: <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 09:37:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQDVbaa5rJUHCBmh0p3R++h8e4V_QYwroTQ88FeCW+OQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoJDHVF_bUBKmfdPGcifzpI7iveAYPcSyjRJ3YSy2-xkWhgB0J_M-mQ6vw
Message-ID: <CAD=FV=UQDVbaa5rJUHCBmh0p3R++h8e4V_QYwroTQ88FeCW+OQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

Hi,

On Tue, Mar 18, 2025 at 10:56=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Tue, Mar 18, 2025 at 8:56=E2=80=AFAM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Read out and check the ID registers, so we can bail out if I2C
> > communication does not work or if the device is unknown. Tested on a
> > Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> > not enabling RuntimePM for the device.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v2:
> > * switched to a new approach suggested by Doug (Thanks!). We add a
> >   dedicated read instead of using the first read. This prevents creatin=
g
> >   the aux devices. As a side-gain, we check now if the chip at the addr=
ess
> >   is really the one we want to support.
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
>
> Looks good to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: Check bridge connection failure
      commit: d69362f55fba92eb4cac10fe8da618de52b49bfc
