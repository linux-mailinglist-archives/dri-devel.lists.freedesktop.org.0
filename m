Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A64CEDB2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3810E5D1;
	Sun,  6 Mar 2022 20:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6187D10E5D1
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:31:31 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a8so27872294ejc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Mar 2022 12:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4n21OYXdDZM4hk/UjVZvxqo76lcN1HhOZ4vArZv8OU=;
 b=WKfevEQAwsxI+yju5ynzzh6Tx2zdUBz9O/xOYN8MkQkoFhsfBcGRIIqxWqNNhJv9G9
 cGj9+7GBoGSyhhebJh2v7ZgRmX9Y/0YouNMSe9pzeYPYkwmbWR5SN8jg6yed730dyeuL
 E0KZ7sQOluB9Tc2GoJQZZlOfdFNT2RWadGnQZ57/g3VotDS2NUWY5yQH8rdO4C23djHP
 sbqkyIMfGlS6fBhuNFN3q2n/saPK3O0tIhTwBfuihtVasHdNOuhE6LaPL5Daycqfikbs
 k1d0yq2xWK35u/5jDuHjaaLgHMF8F4598TwUs5gRX1P0nYoj2VDtYq90a5lSdV3/LftJ
 T8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4n21OYXdDZM4hk/UjVZvxqo76lcN1HhOZ4vArZv8OU=;
 b=A2zQpdKx23tzDg/groT5SNEa4+vznRWsmZbdOEzGIGiByhQ46SNdcrHmQc8z8U8Z7G
 +b67RJaxd20c5V22+/KgRgR0WUQ74guzBFxN94vKVxwGetZo89syMchTkzZB/nD2EJD4
 piGK74M2Vq3ukCUzIAhzJTdvVbHN0FdhUTbtfg+Vml9rbZ44vkt6IRbl+piUL+3J0h/d
 8y2M/dXbM5VqWzX91p5NzfJ8UsqXgX8mIa28X2r3vu/Laa/xNwqdE9s3ovRwyCXf50Z4
 +Iw9ng9n6iqtUlCtZKtqJiKhDpdFmFEDPG262tyiQiOuWU3U7CvlIRBLInIvJsbvPmHZ
 L76w==
X-Gm-Message-State: AOAM5321j/P3HsU6rxfPV2rtld9L+z6rBKTOqrXUrfB8bCAzDV1qNOtQ
 /jGCQqnY6N76Tn3kr9VP6Vd3DKpW3VtSxry6d0Q=
X-Google-Smtp-Source: ABdhPJwq+ENNOmm023HEMN0NHnRWKo1CSAdsqHqpMxrXDwLXKbqpfQ6vkWwsTliG+xADpIloRlSQ/LKUP/4vyZlwxb8=
X-Received: by 2002:a17:907:d13:b0:6db:de8:615e with SMTP id
 gn19-20020a1709070d1300b006db0de8615emr3928656ejc.649.1646598689737; Sun, 06
 Mar 2022 12:31:29 -0800 (PST)
MIME-Version: 1.0
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
In-Reply-To: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Mar 2022 21:31:18 +0100
Message-ID: <CAFBinCBVB8eK-4k3Kgz5bNr++k=7pjHFg+hsqO8WGTLzUzhePw@mail.gmail.com>
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 3, 2022 at 1:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
agreed, thanks for taking care of this!

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_drv.c | 2 +-
for drivers/gpu/drm/meson/meson_drv.c:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin
