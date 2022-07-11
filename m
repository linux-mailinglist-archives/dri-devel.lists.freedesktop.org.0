Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A030D570AB5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 21:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0477790BED;
	Mon, 11 Jul 2022 19:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707A290BEC;
 Mon, 11 Jul 2022 19:26:59 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id fd6so7487325edb.5;
 Mon, 11 Jul 2022 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ta1QR4ob9+a8CQRUXOLxYQstmWxPgCQXNvonR9n7DMg=;
 b=bTN0FCQ8BcVloYruBfn74w+Oe4LBd6Wg+mnDACH0sFprVeIfxIg40eN90sYxoUKAWJ
 fDnJfU4pwkGjQkEb/NczwSU4QRk0EPjm7Tt/1lsmWRFKXmJO2h7dn2jxz75wFGHzp9MA
 4b5Qxo2c11xGgdeXB/d+/fjsjUfeTrFm7oJaKoNGamcNLWDowdvJE4LslpBJxPhDMCHY
 HFKEsghueHYCAjzzaj4N6P+bDK1mE0X3ZyUemaW54TBZn6S2B15ePRefCYcz4KfhtF6G
 eXrWmo9t4oOkMFH45FXUsNns9zFKMhS8onkbbxLFTmwZbobDk6ow4kzBhCbDumTai6b2
 jRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ta1QR4ob9+a8CQRUXOLxYQstmWxPgCQXNvonR9n7DMg=;
 b=WynCwjy4RWvV4vv953931szXsjLi7g/IAll+WOvT7v2/tvjDqiodYBveRFBWSnJ5aQ
 YKyDhH7uSTa04rFX3ohhBCfFEn5yEeLNhyM2rRZDmB0k0ZW8kyRZ3EgsTFUWUQcLmkP3
 mx+MMbTGKBtsoK5wKbFa1P8xVZeaO5cbb4iIbyuRdXfef1/0K/fdA2bu+cVxlXcccEQL
 keNJ9CcaKX37A3GoDiSbXl1HROw4VPdBq8I0EQtDjGDgaUnxaRdPF24+/JDjmnrZX9wN
 MsaEbI+CDPP1PAjGUDmApRsyUy/l20FRQJXiq9vYUGf9Tq4RsB0gNsS/rgGE59NUCj8P
 I/yQ==
X-Gm-Message-State: AJIora/1aZKHIFQDOPSb7lr3fnZNM+rmaLqsXI4K9NZlhx5zjS6mED9L
 c8AtZhV58/fXY2wq/avm+YunAp0IJtN88Y9eG54=
X-Google-Smtp-Source: AGRyM1veV0KKI1a1FCpRTSvVyanIEMcTDQMyQU8ME1TsXd+AgB7n0ELLQ1HlmSoi6duJCJfVVRNOhoxKErLs0Km6CuQ=
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id
 ef3-20020a05640228c300b0043a6d781b64mr26340254edb.93.1657567618050; Mon, 11
 Jul 2022 12:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220711191953.145518-1-andrealmeid@igalia.com>
 <20220711191953.145518-2-andrealmeid@igalia.com>
In-Reply-To: <20220711191953.145518-2-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jul 2022 15:26:46 -0400
Message-ID: <CADnq5_Nviz6D4NX3-gj1_=0M-+-0Bi=_Lqczqsm-tjvKQp4Vsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/pm: Add GFXOFF registers for vangogh
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 kernel-dev@igalia.com, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 3:20 PM Andr=C3=A9 Almeida <andrealmeid@igalia.com>=
 wrote:
>
> Add register values to access GFXOFF data for vangogh GPU.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  .../pm/swsmu/inc/pmfw_if/smu11_driver_if_vangogh.h   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_van=
gogh.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_vangogh.h
> index 8361ebd8d876..9c7b0004d842 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_vangogh.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_vangogh.h
> @@ -279,4 +279,16 @@ typedef enum {
>  #define TILE_ISPPRE_MASK    ((1<<6) | (1<<7))
>  #define TILE_ISPPOST_MASK   ((1<<8) | (1<<9))
>
> +// Registers related to GFXOFF
> +// addressBlock: smuio_smuio_SmuSmuioDec
> +// base address: 0x5a000
> +#define mmSMUIO_GFX_MISC_CNTL                  0x00c5
> +#define mmSMUIO_GFX_MISC_CNTL_BASE_IDX         0
> +
> +//SMUIO_GFX_MISC_CNTL
> +#define SMUIO_GFX_MISC_CNTL__SMU_GFX_cold_vs_gfxoff__SHIFT     0x0
> +#define SMUIO_GFX_MISC_CNTL__PWR_GFXOFF_STATUS__SHIFT          0x1
> +#define SMUIO_GFX_MISC_CNTL__SMU_GFX_cold_vs_gfxoff_MASK       0x0000000=
1L
> +#define SMUIO_GFX_MISC_CNTL__PWR_GFXOFF_STATUS_MASK            0x0000000=
6L

These are registers rather than firmware interfaces so they don't
really belong in this header.  I'd suggest just putting these directly
in vangogh_ppt.c.  You can also squash this in with patch2 while you
are at it if you want.

Alex


> +
>  #endif
> --
> 2.37.0
>
