Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBA782AAB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6624310E25A;
	Mon, 21 Aug 2023 13:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FE110E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 13:37:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6D976373B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 13:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1698AC433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692625077;
 bh=e0qCqVH45WOWXlbX5YfeDUA7pYf3ESOYKLnXCxNgJ/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KFsouREKeHbrohy/XneOtR4B4DTl5ScI5KD8XfwxnQk9S3oyFvLYCzkDDWo9O61fB
 claBjsBvosJrhWpfq7V8GrkdDWaIC3rV774uSO2S6PvRh5bXgkI6xoLXTAm7DEV+y6
 JKl7n4ZeHIVQ4mKtEcish9Vw7/rJRwh8pbrmTa/Ico2zoAEoows0hStRZW1o26Xis9
 Kp6cVA+8cJ1cM9VLr8THbW0V42eM3VAQOs9CMplcQFgZZgUAtYP6aN7PsLMX/uXiFU
 I+LpauWsQIerOR5f4bf0gGC92SXQ7dLW3C4WVPBeCJkP3idjTPXm6Q4oH8I6wbVOXO
 7LYhjbExH9uag==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2bba74ddf1bso50444551fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 06:37:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YxHfXyIxVCcFYZlRv2nlUgEU+ZWWpv0684lvbNDSI/K1bgU5Ln3
 4tZgHovtyecQG5GXXlIBW1Uh2UYfgBup3ORG3A==
X-Google-Smtp-Source: AGHT+IGWLly4v4Xj/FaBEYhu4mNSezrvpVv6/3dVIZzCJehf94hIeISJtPmaki8S1WgCVD9Uj+g4mib8rWYcKUfLXTA=
X-Received: by 2002:a2e:904d:0:b0:2b6:e2c2:d234 with SMTP id
 n13-20020a2e904d000000b002b6e2c2d234mr4970140ljg.33.1692625075072; Mon, 21
 Aug 2023 06:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230717081544.1068254-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230717081544.1068254-1-dmitry.osipenko@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 21 Aug 2023 08:37:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLiCPmu_NN_yuDRjVm52jRU08fpyV1MjJrY8+2OZauNUA@mail.gmail.com>
Message-ID: <CAL_JsqLiCPmu_NN_yuDRjVm52jRU08fpyV1MjJrY8+2OZauNUA@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add Boris Brezillon as Panfrost driver
 maintainer
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 3:17=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Add Boris Brezillon as Panfrost driver maintainer. Boris is a new lead
> developer of the Panfrost Mesa driver and main developer behind the
> upcoming Panthor kernel driver that will serve next-gen Mali GPUs.
>
> Remove Tomeu and Alyssa, who left Collabora and stepped down from working
> on Panfrost.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d6536fef2fc..08dc75916148 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1615,9 +1615,8 @@ F:        drivers/gpu/drm/arm/display/komeda/
>
>  ARM MALI PANFROST DRM DRIVER
>  M:     Rob Herring <robh@kernel.org>
> -M:     Tomeu Vizoso <tomeu.vizoso@collabora.com>
> +M:     Boris Brezillon <boris.brezillon@collabora.com>

If not applied already, put Boris first. I'm not really too active on panfr=
ost.

Rob
