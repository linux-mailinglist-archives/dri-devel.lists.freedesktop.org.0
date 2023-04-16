Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16CB6E3614
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 10:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC47210E043;
	Sun, 16 Apr 2023 08:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34F510E043
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 08:36:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94A3A6164E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 08:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BDEC433EF
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681634171;
 bh=6P/SFh54TSeDeV9HcBVW8qufcWuXnCsWRpIr/HB1O+Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k/6rxOgyxoPktbggmoBuXjalEfgvIY1gKCwI7QONAIrZjIhBQvxiGtDT4iCLvBX+9
 x7KiuBvBQuWhfpheHLCtsgnFk61YToCss6+ymy2+WhTu2q1aj+Y84jmcuNog44OWS3
 bYoIL9DglqhCVALxS9MOpGWR31hm82u0TfJIwglZ01LuC5PzVwV6DVM17Pjq14M755
 f8WgBnd1gR13bH7HL0DqbffccRsoneiEv0nqgQXfDqJZH2P8UO6sQZEbghWXYJFfF9
 xew4UtCADIKbtCddmhnlZjVimRRzz+RIgOFqI4Rk61erRGZ3Deee0j2HrK89zrcdSs
 YIgCjvKudajYQ==
Received: by mail-yb1-f178.google.com with SMTP id by8so6690238ybb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 01:36:10 -0700 (PDT)
X-Gm-Message-State: AAQBX9dLkVYvMryTsH+XHUXcW2Dc4rXxo3dPRF0B3VFaddemZ7CRxqrk
 oy/ZVjKZhpPrvnAH/i3OrApTzI6yKrHd6/po9Nc=
X-Google-Smtp-Source: AKy350b1gliAyW9R5Sw+cmthq1OYFRk9fZ7DNVu2cuc1HpHk1Ua5R/5kXBGv6+nsEyhLQWsyy8c1S9oiWOn/LBhe5C8=
X-Received: by 2002:a25:d816:0:b0:b8d:a959:305c with SMTP id
 p22-20020a25d816000000b00b8da959305cmr7215791ybg.7.1681634170003; Sun, 16 Apr
 2023 01:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230411140850.3129374-1-trix@redhat.com>
In-Reply-To: <20230411140850.3129374-1-trix@redhat.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 16 Apr 2023 11:35:43 +0300
X-Gmail-Original-Message-ID: <CAFCwf12tq7-r7Ej2mwWruQHOvk2d1Z2S_BEVoKF45HsJjfZBDw@mail.gmail.com>
Message-ID: <CAFCwf12tq7-r7Ej2mwWruQHOvk2d1Z2S_BEVoKF45HsJjfZBDw@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: remove variable gaudi_irq_name
To: Tom Rix <trix@redhat.com>
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
Cc: osharabi@habana.ai, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dhirschfeld@habana.ai, talcohen@habana.ai, obitton@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 5:09=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> drivers/accel/habanalabs/gaudi/gaudi.c:117:19: error:
>   =E2=80=98gaudi_irq_name=E2=80=99 defined but not used [-Werror=3Dunused=
-const-variable=3D]
>   117 | static const char gaudi_irq_name[GAUDI_MSI_ENTRIES][GAUDI_MAX_STR=
ING_LEN] =3D {
>       |                   ^~~~~~~~~~~~~~
>
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/accel/habanalabs/gaudi/gaudi.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/haban=
alabs/gaudi/gaudi.c
> index a29aa8f7b6f3..a1697581c218 100644
> --- a/drivers/accel/habanalabs/gaudi/gaudi.c
> +++ b/drivers/accel/habanalabs/gaudi/gaudi.c
> @@ -114,13 +114,6 @@ static u32 gaudi_stream_master[GAUDI_STREAM_MASTER_A=
RR_SIZE] =3D {
>         GAUDI_QUEUE_ID_DMA_1_3
>  };
>
> -static const char gaudi_irq_name[GAUDI_MSI_ENTRIES][GAUDI_MAX_STRING_LEN=
] =3D {
> -               "gaudi cq 0_0", "gaudi cq 0_1", "gaudi cq 0_2", "gaudi cq=
 0_3",
> -               "gaudi cq 1_0", "gaudi cq 1_1", "gaudi cq 1_2", "gaudi cq=
 1_3",
> -               "gaudi cq 5_0", "gaudi cq 5_1", "gaudi cq 5_2", "gaudi cq=
 5_3",
> -               "gaudi cpu eq"
> -};
> -
>  static const u8 gaudi_dma_assignment[GAUDI_DMA_MAX] =3D {
>         [GAUDI_PCI_DMA_1] =3D GAUDI_ENGINE_ID_DMA_0,
>         [GAUDI_PCI_DMA_2] =3D GAUDI_ENGINE_ID_DMA_1,
> --
> 2.27.0
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next
Thanks,
Oded
