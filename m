Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910E58149AE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAF910EA21;
	Fri, 15 Dec 2023 13:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BCD10EA21
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:52:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59EC862622
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD01C43391
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702648366;
 bh=vjdJBXgB3CgJKNKKwjPm/ClnF8CuaIjDBKGu0wPgRvo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XJcb33hs5ztMEIHuoLHP4OdPBbLPjN5z4AdkI7AK9bQj9VyMYVzBDBbV6p3/nm0a4
 zBo5X2yLTWGYKpz+2ZgzKbNnVcbZZ0S71myEbr9PACXK0EzqdlDSR/X1dI/OSCPO/K
 oVnyYflJptXoVaAxLph6RIMen8CUDue5hyoUyXttuTdWXXWKH7qHcId7suXamBgN1a
 HMsu7mpOcYHPQr0IAWaVEA1JYoixuuCNAcWAEIoImRMS2Rr3wPXyzM9gsz1CW3BR+d
 OJG9QQqvWLNjaliuyaE+tSB9Q7aWuiC+WjtzRYlZ34xMA/qYhlc9cffPGW1s8yMGn+
 Sw92/bGmFBRlQ==
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-59148c1ad35so482284eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:52:46 -0800 (PST)
X-Gm-Message-State: AOJu0YzfHwFP0f+a6w+9KZbl0TjzzSk0g4wk11fYW0gkD8OaRmWYHgsX
 MkoN9Ffu9Mr4b2tAnG75pdf+RjKvEn1IZTGE5dbKWg==
X-Google-Smtp-Source: AGHT+IHZXfzFzL78YhBMewk/FnF0iIbD+5qrVyN96HVWfDXwSowKu4zcwV5A8GymmhtHJQsYk8J/4JXfBTR7J0IEoeg=
X-Received: by 2002:a05:6358:915:b0:170:6ed7:3915 with SMTP id
 r21-20020a056358091500b001706ed73915mr15571082rwi.57.1702648365512; Fri, 15
 Dec 2023 05:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
 <20231212075257.75084-8-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231212075257.75084-8-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 15 Dec 2023 14:52:32 +0100
X-Gmail-Original-Message-ID: <CAN6tsi6gRJ-WfPXWoP=DjxuWNuEpnFJjAPRKiwRGsjYmvc8yaA@mail.gmail.com>
Message-ID: <CAN6tsi6gRJ-WfPXWoP=DjxuWNuEpnFJjAPRKiwRGsjYmvc8yaA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] drm/bridge: tc358767: Add descriptions to register
 definitions
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 8:53=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Use the register names from the datasheet. No functional change intended.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 93fa057eca8dc..43e860796e683 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -145,10 +145,10 @@
>  #define VFUEN                          BIT(0)   /* Video Frame Timing Up=
load */
>
>  /* System */
> -#define TC_IDREG               0x0500
> -#define SYSSTAT                        0x0508
> -#define SYSRSTENB              0x050c
> +#define TC_IDREG               0x0500  /* Chip ID and Revision ID */
>  #define SYSBOOT                        0x0504  /* System BootStrap Statu=
s Register */
> +#define SYSSTAT                        0x0508  /* System Status Register=
 */
> +#define SYSRSTENB              0x050c /* System Reset/Enable Register */
>  #define ENBI2C                         (1 << 0)
>  #define ENBLCD0                                (1 << 2)
>  #define ENBBM                          (1 << 3)
> @@ -162,12 +162,12 @@
>  #define DP0_VIDSRC_DSI_RX              (1 << 0)
>  #define DP0_VIDSRC_DPI_RX              (2 << 0)
>  #define DP0_VIDSRC_COLOR_BAR           (3 << 0)
> -#define GPIOM                  0x0540
> -#define GPIOC                  0x0544
> -#define GPIOO                  0x0548
> -#define GPIOI                  0x054c
> -#define INTCTL_G               0x0560
> -#define INTSTS_G               0x0564
> +#define GPIOM                  0x0540  /* GPIO Mode Control Register */
> +#define GPIOC                  0x0544  /* GPIO Direction Control Registe=
r */
> +#define GPIOO                  0x0548  /* GPIO Output Register */
> +#define GPIOI                  0x054c  /* GPIO Input Register */
> +#define INTCTL_G               0x0560  /* General Interrupts Control Reg=
ister */
> +#define INTSTS_G               0x0564  /* General Interrupts Status Regi=
ster */
>
>  #define INT_SYSERR             BIT(16)
>  #define INT_GPIO_H(x)          (1 << (x =3D=3D 0 ? 2 : 10))
> @@ -176,8 +176,8 @@
>  #define TEST_INT_C             0x0570  /* Test Interrupts Control Regist=
er */
>  #define TEST_INT_S             0x0574  /* Test Interrupts Status Registe=
r */
>
> -#define INT_GP0_LCNT           0x0584
> -#define INT_GP1_LCNT           0x0588
> +#define INT_GP0_LCNT           0x0584  /* Interrupt GPIO0 Low Count Valu=
e Register */
> +#define INT_GP1_LCNT           0x0588  /* Interrupt GPIO1 Low Count Valu=
e Register */
>
>  /* Control */
>  #define DP0CTL                 0x0600
> @@ -187,9 +187,9 @@
>  #define DP_EN                          BIT(0)   /* Enable DPTX function =
*/
>
>  /* Clocks */
> -#define DP0_VIDMNGEN0          0x0610
> -#define DP0_VIDMNGEN1          0x0614
> -#define DP0_VMNGENSTATUS       0x0618
> +#define DP0_VIDMNGEN0          0x0610  /* DP0 Video Force M Value Regist=
er */
> +#define DP0_VIDMNGEN1          0x0614  /* DP0 Video Force N Value Regist=
er */
> +#define DP0_VMNGENSTATUS       0x0618  /* DP0 Video Current M Value Regi=
ster */
>  #define DP0_AUDMNGEN0          0x0628  /* DP0 Audio Force M Value Regist=
er */
>  #define DP0_AUDMNGEN1          0x062c  /* DP0 Audio Force N Value Regist=
er */
>  #define DP0_AMNGENSTATUS       0x0630  /* DP0 Audio Current M Value Regi=
ster */
> @@ -277,7 +277,7 @@
>  #define AUDIFDATA5             0x071c  /* DP0 Audio Info Frame Bytes 23 =
to 20 */
>  #define AUDIFDATA6             0x0720  /* DP0 Audio Info Frame Bytes 27 =
to 24 */
>
> -#define DP1_SRCCTRL            0x07a0
> +#define DP1_SRCCTRL            0x07a0  /* DP1 Control Register */
>
>  /* PHY */
>  #define DP_PHY_CTRL            0x0800
> --
> 2.34.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
