Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C101A193091
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 19:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A726E1A7;
	Wed, 25 Mar 2020 18:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFCF6E1A7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 18:43:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 65so4589826wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7O9ynMa/XszSiQjU9DnfA69BL3KK4uFcPsr5Zfru8hM=;
 b=netoBFLdadXAoh2L96ovXCkEk9G7QhSid9/SVDV3erhTy8xriUACPmZRHgkMG0RerT
 yvbw5JE2FdbT84nNaEJ4UUbVyG6oUJCNswSMmPCPULNvUEdTCBzgjSSjE0ZgoXVYirEz
 QKZ9EGgzvtMlwNvW7i2i9UfbsJnNiZFehh0dSVh6v+FPP1vATUI0TLMyRLgdPndYccR/
 c9TdR1IRgjrObZmVXmRehXBU901ho2hT+LPwzuNvk1MKogbTpulFyl2eGa3Y6PSBxpx+
 OtL2Hn/Js5qUH09Z/cA0fylwu7cUvnNnB29QjMh6qmRG2AXHlwTJT1ynVzmn99lh9qn+
 RPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7O9ynMa/XszSiQjU9DnfA69BL3KK4uFcPsr5Zfru8hM=;
 b=VekEmNonki0zCbEiggnZQQln0tM9aTEplLlPOHbbjWc49k+gQRouKWgf4gZe/gK62C
 jn6ch4j3UeoQl/wsQ5N4MgzF4wQHI2uLtw5awHEqRu8bxvU1xdlRanltmWd7Jndgg6U0
 Dn2Mk9kgcR+JYsxkg7Tjyi+VlPNVaGiebJGjKg74zXooDglMcDU88W72naCp0lDZOeEX
 LX4XCk4LBoCEuKvSaKMwSbETmDzdTpparguJZ5dWAgT/ZxeyISUSYaqpAwTDdytH3V0D
 6e1zmTQCtpN8cPPowpqLslFqi18Kn0jsrNiNqJapW8Ar+flbjZm3jAuhvJHKDbVnEh4K
 jOMw==
X-Gm-Message-State: ANhLgQ00gv36WG1z4kD4j195VnWmylLJ5Yt8TUkjMQxT40D7tvf1Qdge
 AVAYef6zt3DBj4Uf8aEh/BiGljxloAC6VjXVGmE=
X-Google-Smtp-Source: ADFU+vtotW0hSWfsINdHPqKmskY8pGIuk5Gng3pWSqBKe0+phrdgl8o1zuoQd71BKYd/PsX6PY7UPK+NTvuaTbvqFCE=
X-Received: by 2002:a5d:6187:: with SMTP id j7mr5053880wru.419.1585161798469; 
 Wed, 25 Mar 2020 11:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200324125442.21983-1-geert+renesas@glider.be>
In-Reply-To: <20200324125442.21983-1-geert+renesas@glider.be>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Mar 2020 14:43:07 -0400
Message-ID: <CADnq5_M+2afonwdY2-8kdzx-_aidWPZ4OxwxRY31odPOJ8togg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Improve CONFIG_DMABUF_MOVE_NOTIFY help text
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 8:54 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Improve the help text for the CONFIG_DMABUF_MOVE_NOTIFY symbol by:
>   1. Removing duplicated single quotes,
>   2. Adding a missing subject,
>   3. Fixing a misspelling of "yet",
>   4. Wrapping long lines.
>
> Fixes: bb42df4662a44765 ("dma-buf: add dynamic DMA-buf handling v15")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.  Thanks!

Alex

> ---
>  drivers/dma-buf/Kconfig | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index ef73b678419c6d86..9626673f1d83ae64 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -43,11 +43,12 @@ config DMABUF_MOVE_NOTIFY
>         bool "Move notify between drivers (EXPERIMENTAL)"
>         default n
>         help
> -         Don''t pin buffers if the dynamic DMA-buf interface is available on both the
> -         exporter as well as the importer. This fixes a security problem where
> -         userspace is able to pin unrestricted amounts of memory through DMA-buf.
> -         But marked experimental because we don''t jet have a consistent execution
> -         context and memory management between drivers.
> +         Don't pin buffers if the dynamic DMA-buf interface is available on
> +         both the exporter as well as the importer. This fixes a security
> +         problem where userspace is able to pin unrestricted amounts of memory
> +         through DMA-buf.
> +         This is marked experimental because we don't yet have a consistent
> +         execution context and memory management between drivers.
>
>  config DMABUF_SELFTESTS
>         tristate "Selftests for the dma-buf interfaces"
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
