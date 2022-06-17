Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9E54FCB1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 20:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D7510EE98;
	Fri, 17 Jun 2022 18:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A7810EE98
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 18:05:41 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id n10so10176705ejk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DlzhBdhQZGkSqbILc5kEVzWlytICniT9hnMKvWlVqZw=;
 b=ILV3mz7sBacg0aN7ocCkv6eYBMa1pbhWugkAoneGtRKHC5/Sv28MmVE6yTZBeDrSts
 PR3+XJkQqDMdN+EIkPbQ8myNfFBOCPTlfs4xMp4YGgZvkxxsYn1f4TElmRvu91xegeNu
 NvqZ9goh9byggYb3MusWjevLijNjH5VdkK7FUmjPeQzzUGCIToYYXoHiVQUjxiMQwrk8
 y2LE1k6CxPVIKp8qnOumQDOeoXDu/7P6dPjgyYAI2TfpUkJt6Sheays7mfqMANQBFBI9
 THe0c9rWj7vV27yy3mOga5l9q6o5iNak0m751YWVBrmbT8G50fMlTF0xRKPCkuhVnRX0
 NO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DlzhBdhQZGkSqbILc5kEVzWlytICniT9hnMKvWlVqZw=;
 b=V6W/7DzBOZRJZrVDmL3pSCjWK0M+3ovpR3vNGWP1EFatDCGzD/JNzY6ygKh+Am5Yka
 9OJ91lZhTTV7wRWtOhy74nPm4Cba+4VzywaKZ31QubAz7ezEumVGZkXEl0sE3+JxpV6i
 b3IqNK1cBUPIJV0zTfNZGxzarOZ3XHvgBTsTbzIDOsk9gaSw4xKfNBkdr8tGU+81NSRJ
 3kDUDFeNZle8w73Ond+IvIreBrmx84PlOf4ILSUFjFiYZikR/nBi3enR1qZz5fbeyIt+
 gwaVLCQxtqwSmsZM6+N4KSrYlgOiLkZlB/fMYnnPAOjdNpehd6CGV4QzWw3WRGJMSnkH
 59qw==
X-Gm-Message-State: AJIora90sKF7QiP73iRxoMblEVs29Gc19mYSaRYEPUscl6B2hNUtDTe2
 5AZkLrdafoGbk567HX7NnOCpzGjgxyLZg8ZNSaE21A==
X-Google-Smtp-Source: AGRyM1uMVrWnbWWCMTzRjwcW88cM+PF9rzfVvGectq3GOC3WJhDjyr+WhdxrfzqVtXJWcFu2xIGTUMW1CRYABq+7akE=
X-Received: by 2002:a17:907:d25:b0:711:ea61:63aa with SMTP id
 gn37-20020a1709070d2500b00711ea6163aamr10295837ejc.584.1655489139667; Fri, 17
 Jun 2022 11:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220617085702.4298-1-christian.koenig@amd.com>
In-Reply-To: <20220617085702.4298-1-christian.koenig@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 17 Jun 2022 11:05:28 -0700
Message-ID: <CABdmKX2yD_UPUVvZEX3+Bi55eTW2=NDAxWLay1fRjGu4W0W1EA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: deprecate DMABUF_SYSFS_STATS
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Greg Kroah-Hartman <gregkh@google.com>,
 kernel-team@android.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 1:57 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Add a warning that this UAPI wasn't such a good idea and shouldn't be
> used by anybody.
>
> That should give us a better chance to remove it at some point and
> prevents others from running into the same issues.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/Kconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 541efe01abc7..e4dc53a36428 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -75,7 +75,7 @@ menuconfig DMABUF_HEAPS
>           between drivers.
>
>  menuconfig DMABUF_SYSFS_STATS
> -       bool "DMA-BUF sysfs statistics"
> +       bool "DMA-BUF sysfs statistics (DEPRECATED)"
>         depends on DMA_SHARED_BUFFER
>         help
>            Choose this option to enable DMA-BUF sysfs statistics
> @@ -85,6 +85,10 @@ menuconfig DMABUF_SYSFS_STATS
>            statistics for the DMA-BUF with the unique inode number
>            <inode_number>.
>
> +          This option is deprecated and should sooner or later be remove=
d.
> +          Android is the only user of this and it turned out that this r=
esulted
> +          in quite some performance problems.
> +
>  source "drivers/dma-buf/heaps/Kconfig"
>
>  endmenu
> --
> 2.25.1
>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
