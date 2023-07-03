Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C81745C45
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 14:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2728E10E0ED;
	Mon,  3 Jul 2023 12:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF7310E0ED
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:32:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F62760F14
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975E4C433C7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688387545;
 bh=CowpH8DPo8yW1jG5FQZ0ybumysPwE/V0Eb9qKNvOgnA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SmoQF4FeVG7f4l/HzxQ22Au2vPJuqvRn6sM0q88aRatY1sn31i/hzIjpakbzKbGpZ
 XotpV2+SzHhLJYbfuvRmE8pUzBK9kn/UhIkifj20d92AhHttMyadG9k2G3qIp3tlMg
 CM4A7erip8L30MCrRQgWPvY9DAuih/ZMaen7j8OCBN/vy5SIBQvudLPlgew1bNv9L+
 66qZ7hSGRTxSEGIW7Ba9ykW+xOALWwILxoCmHHiH7O2pMDn3eLvLNFtC/WikJmSzuY
 7dsUD6RLmL4Xc8hlqO5wPKeK2Upb8LJmJmoIBIVS30Q/XHaHc/Xrivsm7d3oZ8DBSs
 9dpcy1+R1R4Zg==
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-c50c797c31bso1581489276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 05:32:25 -0700 (PDT)
X-Gm-Message-State: ABy/qLYHBaHf6PdQWkpm2ypk+TdrlQFNteKuZjo1EqAVQgoh9Bla6Owb
 zU4qAJbIPXJ2H05ACKSLefFIEIQfK2IijVOqjuQ=
X-Google-Smtp-Source: APBJJlEm34QjMiB5XFo7Nn9AAHYzR1pMpFMjO5LeTXpO/Lztydt1Pf0C2v1KinGg8d4ias0oKmZ8R9sSg+JUiozA2uo=
X-Received: by 2002:a25:9e87:0:b0:bcc:571d:a300 with SMTP id
 p7-20020a259e87000000b00bcc571da300mr8636480ybq.20.1688387544656; Mon, 03 Jul
 2023 05:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230616121637.1033074-1-juerg.haefliger@canonical.com>
In-Reply-To: <20230616121637.1033074-1-juerg.haefliger@canonical.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 3 Jul 2023 15:31:58 +0300
X-Gmail-Original-Message-ID: <CAFCwf11dE5cnkJJH0TumpBEHohCy8FL6fQz9dfODn=c_WOsscg@mail.gmail.com>
Message-ID: <CAFCwf11dE5cnkJJH0TumpBEHohCy8FL6fQz9dfODn=c_WOsscg@mail.gmail.com>
Subject: Re: [PATCH] habanalabs/gaudi: Add MODULE_FIRMWARE macros
To: Juerg Haefliger <juerg.haefliger@canonical.com>
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
Cc: osharabi@habana.ai, dliberman@habana.ai, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dhirschfeld@habana.ai, talcohen@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 3:16=E2=80=AFPM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> The module loads firmware so add MODULE_FIRMWARE macros to provide that
> information via modinfo.
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  drivers/accel/habanalabs/gaudi/gaudi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/haban=
alabs/gaudi/gaudi.c
> index a29aa8f7b6f3..cd034e98128a 100644
> --- a/drivers/accel/habanalabs/gaudi/gaudi.c
> +++ b/drivers/accel/habanalabs/gaudi/gaudi.c
> @@ -63,6 +63,10 @@
>  #define GAUDI_LINUX_FW_FILE    "habanalabs/gaudi/gaudi-fit.itb"
>  #define GAUDI_TPC_FW_FILE      "habanalabs/gaudi/gaudi_tpc.bin"
>
> +MODULE_FIRMWARE(GAUDI_BOOT_FIT_FILE);
> +MODULE_FIRMWARE(GAUDI_LINUX_FW_FILE);
> +MODULE_FIRMWARE(GAUDI_TPC_FW_FILE);
> +
>  #define GAUDI_DMA_POOL_BLK_SIZE                0x100 /* 256 bytes */
>
>  #define GAUDI_RESET_TIMEOUT_MSEC       2000            /* 2000ms */
> --
> 2.37.2
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.
Thanks,
Oded
