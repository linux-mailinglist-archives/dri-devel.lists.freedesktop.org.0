Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2632660616
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E463C10E8AB;
	Fri,  6 Jan 2023 17:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5B310E8AE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:57:57 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id 203so2633314yby.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Vm9njLv8zSsK/sovVu1laEs0HZNte5oiMpQpKlG/5s=;
 b=iblujaKvE23FC0d+06OXSlVZYClMsGamZ6ZXj7SRyl76Cd9aSRaM//jp+6HUfiAM22
 AGIHlex0uoqVRoi+puZP+udjS1nipXOpM6KjXMOobPSxcE8NH+oX6X7WuDRktInmnAcV
 lnJpU+nya5Uvq0WaQo0OQjZoaxyXMIFKuGhk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Vm9njLv8zSsK/sovVu1laEs0HZNte5oiMpQpKlG/5s=;
 b=J12MflMUMicmC0z8V9AvogVhwEKEs4cj3rEvqMalm3RE2ojFDdARsyRKX07IC27Vaz
 To7CwtJ9hRHf6p2c94M64TlI+OGTASqWYnAboOR/14dmf97302hhmh1uQSwWqBtCKtgx
 ouaaHPVDnfxxw7JA9K+7aAeVd2W8RfEZw+slYd9xvHki1noGbcxB+O8OwmlEODyGdnut
 he0Bpt0rhaVTpfmonKMQcgAcmCK3x9JBesyKwFEVP67+dlPoo1YBA8zuKe7dqPAN3VMr
 jZqymDX9f8TNoTbW1oVE0KAIOn6PtwpsgsOtNmMvSU5Tizo6kysKVLAu+1hnHWrXdgQh
 aUUQ==
X-Gm-Message-State: AFqh2kpIJfglkdD3lb8w/ygwaBGHIppxEkZPM0h9ma6Lh8ZU2tTiNUNZ
 e1byEeV0Q5ldWbG+HLuEZKdQdUGOotrOHV3xglIwUQ==
X-Google-Smtp-Source: AMrXdXu0obOSob9FWM4o+nQkLY3Z9FDbaDA1nbeYcRSxOcmxYJSLrSyQFqUOtSF2fLLy8N92OKoGhxU6gQg6V5DJ6T8=
X-Received: by 2002:a25:cc82:0:b0:6f9:bd14:f0b4 with SMTP id
 l124-20020a25cc82000000b006f9bd14f0b4mr7181577ybf.408.1673027876839; Fri, 06
 Jan 2023 09:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20221212145745.15387-1-jagan@amarulasolutions.com>
In-Reply-To: <20221212145745.15387-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 6 Jan 2023 23:27:45 +0530
Message-ID: <CAMty3ZAvJb-TT5M2PPwDZ29=rmELF=5DWyMAMFLSzKXFcMHmgg@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, Nicolas Boichat <drinkcat@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 8:28 PM Jagan Teki <jagan@amarulasolutions.com> wro=
te:
>
> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> 0 =3D Enable and 1 =3D Disable.
>
> The logic for checking these mode flags was correct before
> the MIPI_DSI*_NO_* mode flag conversion.
>
> This patch is trying to fix this MIPI_DSI*_NO_* mode flags handling
> Exynos DSI host and update the mode_flags in relevant panel drivers.
>
> Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> features")
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Reported-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

Any update on this?
