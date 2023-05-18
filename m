Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C970809C
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 14:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754B310E513;
	Thu, 18 May 2023 12:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCB410E513
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 12:02:02 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-ba827c74187so2675597276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684411321; x=1687003321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PvwHGI4vhsZwVAeRbD6Otm9nDrfWfKKFU1vesqzDCe8=;
 b=l3jykI8hIElPtKw7tk+/jISM833pBfdiJgdvWdMi6BcpEB7YmJAvUpaoSIu06aJK/H
 x1eH3hOwGrdDD4cQpkKxLTQdnW8zCvCqIeWnxWStndGnTvIpaSP5U3mYemI4e5+60SGn
 BJTBu/rhJNgpZmYfPlvBj7dwvraL/WwCUmc50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684411321; x=1687003321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PvwHGI4vhsZwVAeRbD6Otm9nDrfWfKKFU1vesqzDCe8=;
 b=ZxkENUNImYOavhkNnHgMBacBLdYvu5CVnkGJ7xthCF6etQLGQUcX8NxDDxss2y1Yp7
 XYKVmGEAd8frUPgKFdQqtGBdH8ks7D10KjqHQ+CYZmLg6iYCTVv0NODZCGT1O1XKsv3R
 2KdH7JQFKLZPolPc2vvsCXWzu7sK/68pQzAatGf2+sh9kLkHCGOn5FhmXZVcTaw8POfS
 6nFtIw3i+8MXpDU4iK1kqNZEW96ggQ71cUhE/MQl8XUFFYHhgexCUPSjrI2qPMkE2wBw
 wRx2OCST35nFmCY/eNOiJz0krB0nJdA0qs/8ed0b8kPDBnSjzejESwiWQRYixNMj8uoh
 +0Rw==
X-Gm-Message-State: AC+VfDyIuDpv4fCJRH4j/JqZ6GoTQEfR72ws6wZ1m+PQKB3J/Tx+AXPO
 7Synxp7m1WJwqUZJBZXGS2nawhV6k5HZIIi9/ydfsQ==
X-Google-Smtp-Source: ACHHUZ7ndfxs4tXBRUlAk90tteKfdFHLiIuvOYQViHFQsuEDwiTZBHFIk3mdtYRJjGVluIGyAL23S0LSEy2xlp2DAJw=
X-Received: by 2002:a81:a116:0:b0:556:ceb2:c462 with SMTP id
 y22-20020a81a116000000b00556ceb2c462mr911480ywg.2.1684411321524; Thu, 18 May
 2023 05:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-4-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-4-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 18 May 2023 17:31:50 +0530
Message-ID: <CAMty3ZBYEi9EUzM3RBk6Uj1wz5sACG41MPYjrMb1QrR3UPrc5g@mail.gmail.com>
Subject: Re: [PATCH V6 3/6] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> Make the pll-clock-frequency optional.  If it's present, use it
> to maintain backwards compatibility with existing hardware.  If it
> is absent, read clock rate of "sclk_mipi" to determine the rate.
> Since it can be optional, change the message from an error to
> dev_info.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
