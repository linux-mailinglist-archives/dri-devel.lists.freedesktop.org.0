Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BDC772FF4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 21:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9084610E151;
	Mon,  7 Aug 2023 19:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4666110E151
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 19:55:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 777C0621C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 19:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AB2C43395
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691438114;
 bh=I7YekNGJ+q77+BCcHkYasGTompOMy1uYPX3HwJjAgxs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ccR8/zzJEiIQEg1wdkmJigITfBlfj+ryyuCmb6X2Hk6nuDF2xPb1/1b21h2Rh5BRg
 8zylV1ylRpA9oBlundvuk+jslPrip8a0E75eYNBv+jlPjm5UwaGGWyQWov9dCgoxpa
 i+fwq8Q8Jhr9D45kayhvJjFNMk+x3Hr19VnVY5jOkp21rcX9Tk21C7fvQijEH7IohQ
 TKiBxglhBXywVX7ZDDKtbUA3glXvnsZt0jaXD61VB20oRtYUqCCgpuPZWVutUNJ1Sd
 KscZ6ZQCq5JAoQxcU5x6wQ3vTemWmAbNxhms9zrataX4x3hp7khNlV1HwkYFwIeY1H
 QNVzzilp1v00g==
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-26824c32cfbso3220363a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 12:55:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YwEYkjQmgkc3IWXCBBlHmZxLt2IgpsG/Woe6v0kpx2tEIuzlCsl
 t0ep/rvIdKOh8m2GFtKYlK14AzKOMYF3Z/66Al7xoQ==
X-Google-Smtp-Source: AGHT+IFjzk2KfzcRhjSxPtvwMq4e2tlrWhN5WnNUHI5MSPdHZu92vftmpqlZaDWH8qW186T/PB8hhO33+aFTk7CHL5o=
X-Received: by 2002:a17:90a:889:b0:268:2af6:e48c with SMTP id
 v9-20020a17090a088900b002682af6e48cmr9504287pjc.4.1691438113884; Mon, 07 Aug
 2023 12:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230807004256.25609-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230807004256.25609-1-yang.lee@linux.alibaba.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 7 Aug 2023 21:55:03 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7rpi6kePZQc7i_nS-84rz7cixWW6znBm_NqocnhKMAaQ@mail.gmail.com>
Message-ID: <CAN6tsi7rpi6kePZQc7i_nS-84rz7cixWW6znBm_NqocnhKMAaQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: dw_hdmi: clean up some inconsistent
 indentings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 7, 2023 at 2:43=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com>=
 wrote:
>
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c:332 dw_hdmi_cec_suspend() w=
arn: inconsistent indenting
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6101
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/=
drm/bridge/synopsys/dw-hdmi-cec.c
> index be21c11de1f2..14640b219dfa 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -329,9 +329,9 @@ static int __maybe_unused dw_hdmi_cec_suspend(struct =
device *dev)
>         struct dw_hdmi_cec *cec =3D dev_get_drvdata(dev);
>
>         /* store interrupt status/mask registers */
> -        cec->regs_polarity =3D dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> -        cec->regs_mask =3D dw_hdmi_read(cec, HDMI_CEC_MASK);
> -        cec->regs_mute_stat0 =3D dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT=
0);
> +       cec->regs_polarity =3D dw_hdmi_read(cec, HDMI_CEC_POLARITY);
> +       cec->regs_mask =3D dw_hdmi_read(cec, HDMI_CEC_MASK);
> +       cec->regs_mute_stat0 =3D dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0=
);
>
>         return 0;
>  }

NAK

The value of maintaining the git blame history is higher than
following the correct whitespace
