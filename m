Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D100181499B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEBF10EA17;
	Fri, 15 Dec 2023 13:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9D10EA17
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:49:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 87DE9CE2F31
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF7DC433CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702648189;
 bh=bRMu56oXKzjZhuBwc7qRcspLL62d7kRDQ2eUirITWxA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hUJUtevZ+yUWhx581l1IApZN4TjBMYfb+uHvXJoOwN0UPLBkIcNsBVPtgMpgMgxXc
 jNlazSs58hQZt6oc+zjVcRRWmqQxVhMObsDI8McxTeb8z2M11nn3uyeMumxOrSuN7q
 xghGQnkIYhdfAZtXDCHwpky9sIN3tnb0OIgR7qiMjfx2RA1YvlwWDA3pMrL7IuzgZr
 OQ8Abklio53ACMBmakLTaCQbRHFR7P8nmNpXvo0wn112HPxu2aNfgnxWJGb7dXuCfO
 rb1SaBnQeAT8fbMi+rhB/lJTR+b6tVYmwBylHwxVXSOZgYOmGjtrZY0l4klQbvcWO3
 TGf09BapnwDag==
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-28aea039fb4so1381320a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:49:49 -0800 (PST)
X-Gm-Message-State: AOJu0YxkJuhOSoOEMxB0niOoO5eS9zOaSmMkxfy6a6ixTnpDYxHucAkQ
 nUrtony+IIw6So1VNLk4JvXdKieje5qkjdYwZlXdmg==
X-Google-Smtp-Source: AGHT+IEqFWTmiT6R8vC3XB++GzuOGa4bxvnrYEr1nsB0FgkYoLT4cHlpGqU3d1rWeAUnZVhZdH9MxYpTY+lJ47QJZKA=
X-Received: by 2002:a17:90b:23c1:b0:28b:bdd:a95b with SMTP id
 md1-20020a17090b23c100b0028b0bdda95bmr3146495pjb.3.1702648189229; Fri, 15 Dec
 2023 05:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
 <20231212075257.75084-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231212075257.75084-3-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 15 Dec 2023 14:49:36 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4aVzmRLB5UM3BaqZy+GcYoZmYE0jOtbHvC_CEsDzdr8g@mail.gmail.com>
Message-ID: <CAN6tsi4aVzmRLB5UM3BaqZy+GcYoZmYE0jOtbHvC_CEsDzdr8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/bridge: tc358767: Fix order of register defines
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
> 0x0510 is bigger than 0x50c, order them accordingly.
> No functional change intended.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 258eacb4125a4..ab0710a35d3d1 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -116,13 +116,6 @@
>  /* System */
>  #define TC_IDREG               0x0500
>  #define SYSSTAT                        0x0508
> -#define SYSCTRL                        0x0510
> -#define DP0_AUDSRC_NO_INPUT            (0 << 3)
> -#define DP0_AUDSRC_I2S_RX              (1 << 3)
> -#define DP0_VIDSRC_NO_INPUT            (0 << 0)
> -#define DP0_VIDSRC_DSI_RX              (1 << 0)
> -#define DP0_VIDSRC_DPI_RX              (2 << 0)
> -#define DP0_VIDSRC_COLOR_BAR           (3 << 0)
>  #define SYSRSTENB              0x050c
>  #define ENBI2C                         (1 << 0)
>  #define ENBLCD0                                (1 << 2)
> @@ -130,6 +123,13 @@
>  #define ENBDSIRX                       (1 << 4)
>  #define ENBREG                         (1 << 5)
>  #define ENBHDCP                                (1 << 8)
> +#define SYSCTRL                        0x0510  /* System Control Registe=
r */
> +#define DP0_AUDSRC_NO_INPUT            (0 << 3)
> +#define DP0_AUDSRC_I2S_RX              (1 << 3)
> +#define DP0_VIDSRC_NO_INPUT            (0 << 0)
> +#define DP0_VIDSRC_DSI_RX              (1 << 0)
> +#define DP0_VIDSRC_DPI_RX              (2 << 0)
> +#define DP0_VIDSRC_COLOR_BAR           (3 << 0)
>  #define GPIOM                  0x0540
>  #define GPIOC                  0x0544
>  #define GPIOO                  0x0548
> --
> 2.34.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
