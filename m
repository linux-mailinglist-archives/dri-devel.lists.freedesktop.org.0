Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9117B159B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619D810E5E0;
	Thu, 28 Sep 2023 08:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2811F10E5E0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:05:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CB660CE1CAF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE43C433C8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695888303;
 bh=PoJNxjIqib27skFPg1Iq3N3WLP/CrJV5nudnKtbDPII=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VuXe9jKaBVlnTHa/2G75UOXO9ObpSJYL818KAAjc7/ZIr3CqqYrJI6ZTWcRupUPx3
 y+emRukG/NHHEJVGj91EPb2ZNwqGWIDVhpPQDyCJS3HXr0s1Qea/5S/pT9YjG7QTG0
 Ihqjs/uCh+g/8Im1DhUSayquqwk6kTb7+iWZZccdr05Ot7Fd6Wn0qR0qPNEdAaGVLz
 dDTDgWFM9u3Evmwf7BiahzB7rrfBs/s9I3Bk+T+SGCAw2DySqWYmIQd389dgAWe/xR
 XK3b5Fx5UteWvBnHLfwu6VMgnshwLh49gal1Q3iSKgrLhMqDiNsAufq3bEKOnr7+mi
 ULI+4Plms0T2Q==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-59b5484fbe6so157787357b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 01:05:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YySsctBSdemP6tzfokggaCePVzuT8d5+nHVf9tXRSFOlt7qs56p
 TTaj3KP3xrF4GkC2BNZVf+OlmwtKJQmv3Ere7Mg=
X-Google-Smtp-Source: AGHT+IEOxZkSkGDu/ZPVvWuf5ZzJCZK/uM0BbqQ0H6zc9VIOtBbPfG5l/y6R7KoTPnnSzOXsmKKAxUl3SEUq60tf5hc=
X-Received: by 2002:a81:7cc5:0:b0:599:da80:e1e4 with SMTP id
 x188-20020a817cc5000000b00599da80e1e4mr338729ywc.30.1695888302208; Thu, 28
 Sep 2023 01:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230927072157.2544601-1-arnd@kernel.org>
In-Reply-To: <20230927072157.2544601-1-arnd@kernel.org>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 28 Sep 2023 11:04:35 +0300
X-Gmail-Original-Message-ID: <CAFCwf13JrDtgKiqQw46knk_J2zdBNA348doaTBMvmrYYc1OgHQ@mail.gmail.com>
Message-ID: <CAFCwf13JrDtgKiqQw46knk_J2zdBNA348doaTBMvmrYYc1OgHQ@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: add missing debugfs function stubs
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Tomer Tayar <ttayar@habana.ai>, Ofir Bitton <obitton@habana.ai>,
 farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 10:22=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Two function stubs were removed in an earlier commit but are now needed
> again:
>
> drivers/accel/habanalabs/common/device.c: In function 'hl_device_init':
> drivers/accel/habanalabs/common/device.c:2231:14: error: implicit declara=
tion of function 'hl_debugfs_device_init'; did you mean 'drm_debugfs_dev_in=
it'? [-Werror=3Dimplicit-function-declaration]
>  2231 |         rc =3D hl_debugfs_device_init(hdev);
> drivers/accel/habanalabs/common/device.c:2367:9: error: implicit declarat=
ion of function 'hl_debugfs_device_fini'; did you mean 'hl_debugfs_remove_f=
ile'? [-Werror=3Dimplicit-function-declaration]
>  2367 |         hl_debugfs_device_fini(hdev);
>       |         ^~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: 3b9abb4fa642e ("accel/habanalabs: expose debugfs files later")
> Fixes: 09fe78d2e4421 ("accel/habanalabs: register compute device as an ac=
cel device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/accel/habanalabs/common/habanalabs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel=
/habanalabs/common/habanalabs.h
> index 2a3acdbf91714..1655c101c7052 100644
> --- a/drivers/accel/habanalabs/common/habanalabs.h
> +++ b/drivers/accel/habanalabs/common/habanalabs.h
> @@ -4041,6 +4041,15 @@ void hl_debugfs_set_state_dump(struct hl_device *h=
dev, char *data,
>
>  #else
>
> +static inline int hl_debugfs_device_init(struct hl_device *hdev)
> +{
> +       return 0;
> +}
> +
> +static inline void hl_debugfs_device_fini(struct hl_device *hdev)
> +{
> +}
> +
>  static inline void hl_debugfs_add_device(struct hl_device *hdev)
>  {
>  }
> --
> 2.39.2
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next
Thanks,
Oded
