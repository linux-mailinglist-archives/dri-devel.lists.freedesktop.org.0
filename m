Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D413714104
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 00:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133C710E0DA;
	Sun, 28 May 2023 22:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542D210E0DA
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 22:33:29 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-253310a0df7so574667a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 15:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685313208; x=1687905208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxYoiLc/vExDmL+kL0vg9M26eP/FFN+ipF+7USiz+Qs=;
 b=gMbAwg6l3nnCWubWaLzBclbrKMBRi44kUeMeitvED+x42Gd1QOaUYFK8E5QcFIslAH
 7/f3ng1LLdYB3fIVseXuQkSl4urWwFKiOIhDINrl+8YvwTtreXEJFRrKPplr0sUaMroC
 82pzrPYVxMf1vsd7gwce1CJY9XCf81Tth7Q3IpGnZJMn4Y9Xyrb1QgTOE9lyE7mC4Yxs
 bzAR82UF8jRwYmldHMyKCj+yq7ZrgTPT60v/MAqLLU0P/GPEJR7ksanTbHH08LW/qs33
 kEEAB4FsC5zwYBQfWbLiLdUBEFirw+uauOxY6k+vZgDKxJNBTx8UPWSGl+1C9FI5KTt6
 Zc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685313208; x=1687905208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxYoiLc/vExDmL+kL0vg9M26eP/FFN+ipF+7USiz+Qs=;
 b=Zm8HBe9KhR90HEa/uV1QyhJGinaXMfPCT8iOd/NiG66XOspN4aECbtwIC9miZ1Ycs9
 8vnqIUlE1ONdCu2ABNlaV3nX0NX4RUsOa+MzU0wYh/u29+8KFUN4jZLJYJhuMNV+j1W7
 iX/3jLN7kQDiQ7EN+C10mRjsvUjnq6laRtfeoGiFYkrD6nfp9kfZDvx/WbNYsaPD7D0r
 TJWG+GLJCk5Do86p5wXDdwTXsWDZz8yhLFWN5+gBVZ9+YKPv+PTkRkWebUSJoiWNFMcJ
 UhP3MHfbka06BDUS13aOvctvh9H5Eo+f0XCgtv8dkdiciZnalFzGe7PE4FicdICHFWDR
 UB/A==
X-Gm-Message-State: AC+VfDwgBX2faeznQVrco5eKqI3I7x0ZkCr0WyaMsswcvpgkkobZFpQq
 FzpgpQEIPz3g2jKomznyslqt7+H46H2ruTJTDWg=
X-Google-Smtp-Source: ACHHUZ4Ja+1pV5iNINplvUcfTz1BH1UWGnLaYW6l9L568p9LWziUPWoWl2d5t4viZU5ppC3rjBoBaqwfHYVozXnQ/W8=
X-Received: by 2002:a17:903:32c2:b0:1b0:4680:60 with SMTP id
 i2-20020a17090332c200b001b046800060mr713375plr.1.1685313208104; Sun, 28 May
 2023 15:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230528132727.3933-1-aford173@gmail.com>
In-Reply-To: <20230528132727.3933-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 May 2023 19:33:17 -0300
Message-ID: <CAOMZO5Ct1Ns353rTWF-B=wR6O9h9O9wcR21cTOXaU1b030=QgQ@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: bridge: samsung-dsim: Make some flags
 optional
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 28, 2023 at 10:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> In the event a device is connected to the samsung-dsim
> controller that doesn't support the burst-clock, the
> driver is able to get the requested pixel clock from the
> attached device or bridge.  In these instances, the
> samsung,burst-clock-frequency isn't needed, so remove
> it from the required list.
>
> The pll-clock frequency can be set by the device tree entry
> for samsung,pll-clock-frequency, but in some cases, the
> pll-clock may have the same clock rate as sclk_mipi clock.
> If they are equal, this flag is not needed since the driver
> will use the sclk_mipi rate as a fallback.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> V2:  Split from driver series.  Re-word updates for burst
> and pll-clock frequency.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
