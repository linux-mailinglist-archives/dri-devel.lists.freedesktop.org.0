Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED409A6077A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 03:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5174C10E275;
	Fri, 14 Mar 2025 02:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dA3W9pxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48D610E275
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 02:28:14 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-549963b5551so1623251e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741919288; x=1742524088;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VK4KlxY3uUa17qisCA7GoD5gggjvWR4zuA8FgG9CVRU=;
 b=dA3W9pxYbpwbxQiQQdPBhMpF8dBjh+OF1U5cNdEsIpXU0fqnj91kl5XDtE/b1uL/CE
 lXJ8Te6Sjpu4u7ekgTuaC5t8TeoU+rLE42OYaLs4pXnvUhHZCg+fN/dYWhs8gVeAhHHq
 keKVxDwdvjB+k8TkNGUA9pUrKojbfhQBeUoL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741919288; x=1742524088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VK4KlxY3uUa17qisCA7GoD5gggjvWR4zuA8FgG9CVRU=;
 b=tqC+fmEubq4IEdABoelP+JqzVOGsB3yMXPx3vWZxVJfERQaFTDsmnHmYN2XYWrzjB8
 pIqqfcypfM8ybGyg1JzIuNk5doksoMWaIyTF6nFfFNodRcEIOtRN3esrn5bCfK8+uFct
 dphPeZF+Ue+CoC2PVa9yJQt70qnMARQHr60h7QPsxwK6dwFZtXwYMgrFSJth+2UyE1RE
 HeovvUhQToUxb/eajGlX0okYTSriSWVqDxuAIuSo+YTGK3lSm0YSnKegS8kiX2bubpnC
 hkjkPYnwBpDvUXKaF/ja29lLbyzIppFCJl92R2Q/IUS37hS3evUiVUrP1Dmpc1HuPBwa
 K1kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5y0kpTvj98snmeXk49HjGs7QwAPUVaJgIwMqChjlzgW6h9iSVQhfZNnWxgVOwDYj2TlO4nLx1+eo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOBwS7+FlFhBvQFbVkFAL/U1/S+B61tLvpE0PZI+g7DWsyLjyB
 /wTPBfOe5kBg+a63xp28xEOJ9zI6Jy3AvGCH04eBkdJqgAx0OJHPrISYrBxC3KR2vaw/1iS/Wc8
 DnA==
X-Gm-Gg: ASbGnctx5AJixhkIjnDhL0hbJhOiCGFf+qYDj0PoJCjYIckbMcSo4DeJB1ukPKnAmSS
 W461OwOMivKWsRIvl3amOvsfhfs9rFR0BQtScg9UDpR+i4gvxa3xFeaszQKLeLxsXNLWlVkAtsQ
 RhxOF/K1i80/7BmfV86TZnCYwfFVPCY6LBEUGBjbigioL3GM6w7raCY9+Z5SEEp4z92C/AmBWQj
 Io4hEr7VRUjH1qn4IklDgqxn6u/dJ+rYfVz6if3xY8J+tP74Ld0hcv5pnpeLaayFvLhbFtNWqxg
 0vwPr1+6M4Oc02k7TC6VvBdeRw2kkHy/5LbTJg9ILHW+acBVbt+rUtj3177P5kQDjDBMCZDnBiL
 ertKn3tAK8BDyn1VoOwA=
X-Google-Smtp-Source: AGHT+IHY8dNWiW/naUtZvLNh7sKP502TyUTwlmK/u8JSSlVwz/i0qozVIZ96OAekra6E0fzC0gT1ag==
X-Received: by 2002:a05:6512:3a8e:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-549c38f7d9cmr254423e87.27.1741919288384; 
 Thu, 13 Mar 2025 19:28:08 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7bee7fsm381386e87.54.2025.03.13.19.28.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 19:28:07 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5495078cd59so1723436e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:28:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWi+Ic+vIB6MpHNPg1iqZ0Imdeew1/r+vyg2C0jPjafH7hTkUQcKSfUd6q2pUnsBiuOqTijQD8Qbw=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3a8e:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-549c38f7d9cmr254376e87.27.1741919283647; Thu, 13 Mar 2025
 19:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
 <20250310104114.2608063-8-damon.ding@rock-chips.com>
In-Reply-To: <20250310104114.2608063-8-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Mar 2025 19:27:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XigZ7k9ZmyT8wEeJKB79ef4ut7XrKdmXGqLbwdbxwe_w@mail.gmail.com>
X-Gm-Features: AQ5f1JqOO-vARbb-qxWvQyFu_Kv3lXKxcHR_dDdzPTPbj0JZAG253PMvReLZCQo
Message-ID: <CAD=FV=XigZ7k9ZmyT8wEeJKB79ef4ut7XrKdmXGqLbwdbxwe_w@mail.gmail.com>
Subject: Re: [PATCH v8 07/13] drm/bridge: analogix_dp: Add support for
 &drm_dp_aux.wait_hpd_asserted()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
 boris.brezillon@collabora.com, l.stach@pengutronix.de, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
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

Hi,

On Mon, Mar 10, 2025 at 3:42=E2=80=AFAM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> Add analogix_dpaux_wait_hpd_asserted() to help confirm the HPD state
> before doing AUX transfers.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 2b76a9cf3bcb..b7e143b3ff75 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1548,6 +1548,26 @@ static ssize_t analogix_dpaux_transfer(struct drm_=
dp_aux *aux,
>         return ret;
>  }
>
> +static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsi=
gned long wait_us)
> +{
> +       struct analogix_dp_device *dp =3D to_dp(aux);
> +       int val;
> +       int ret;
> +
> +       if (dp->force_hpd)
> +               return 0;

As mentioned previously [1], it's _possible_ that this should have a
delay like we had in sn65dsi86, though maybe that was to deal with
legacy device trees? It's been a while. Oh, I remember. It's because
even if HPD was hooked up to the controller like it's supposed to be
we don't actually implement HPD in the driver for the eDP controller
(long story). ...so we worked around that with a delay.

Right, so your code looks correct. :-)

[1] https://lore.kernel.org/r/CAD=3DFV=3DWoigDDTG6wTK0smsxASVfK5BzzW6KNpKWq=
97v4GAgvmw@mail.gmail.com

Reviewed-by: Douglas Anderson <dianders@chromium.org>
