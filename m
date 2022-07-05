Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA85567249
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601F718AE8F;
	Tue,  5 Jul 2022 15:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9807B11BCD4;
 Tue,  5 Jul 2022 15:16:20 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id d2so22259459ejy.1;
 Tue, 05 Jul 2022 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fdWsuH5iWeZPfROujivZGH/Cy5bmhPrXtMLFLUwX49M=;
 b=PxFjmDvc5PYKzenoLJAFdaUHY081Hi2HUvSiiBEZOQ28gnVnyWAnd34JfJWow6qdHR
 pEpuNXXGz8Q7EtExPHAZSMueQV16IbExfYmGJer90err9ileogEQne7e5MVpHHJZAa6R
 E20drhgKycenzCpyfcq/00tSbqqV1Jukhco/lX3x3x7ElS8NmzjeTvxCFBrWISZ4h5Y4
 AmuVHwhImlotcTmOogt7VQITuIjDx9WViEwaCq0VFJz4GBjWLQ9W0sqW7GzC1xyxLX8g
 Ef6pliikCB+8Svqy7+0RwqyFIT6dIBOuRspmrBuj5Bcp/IXqpoRZPu6Kwg05ce9rizPR
 DcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fdWsuH5iWeZPfROujivZGH/Cy5bmhPrXtMLFLUwX49M=;
 b=Sq5Yh4Ai4aTlJQdcXEe0tis3ucTRwV+sXHX+FtLWpueeBV+zpgS10EdHC3bQpccdS7
 g/NG1ZtyoDKe58empaxLn58va/E2K6HaFUltiKzmQPnLpyresEzUwFS2gRujfVMH+JKD
 qV/2p+6arJqVz0R6p5chWyqfdwKNMQ7SoPCnr58nCqAztTJj70vbk26FbVhfsjRsNXVF
 3Lnv24o9S1tczMYKimmX3F39DOF+LbPT5am8a423n6ZsSP56ej4P1HchOmNkA1OTf7GV
 xpFSYWSD6qqwLfiTvUECt7t7NjmwpiNknnXR17bJ4OoZEoF6GDtFsPfwDlQWCdExNxAT
 yTRA==
X-Gm-Message-State: AJIora9fWIGH6LODHVJ0nfhGLpWCFQBkQ/263KLgWskRk9gO0TtBC/e9
 9/VjGmPWRSa4HpsGwfSUCEoEaBjwoq/Q0HhBzhI=
X-Google-Smtp-Source: AGRyM1vFVkwnAPwj8iiYegP0EW/QCymRUera0ZZmUX4II6xXiqox9uPVSU3N5XYK1ay3D+sd3vamxoEckE5PlGwLKxM=
X-Received: by 2002:a17:906:dc93:b0:726:a75b:f60f with SMTP id
 cs19-20020a170906dc9300b00726a75bf60fmr33930346ejc.564.1657034179094; Tue, 05
 Jul 2022 08:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220630185005.908140-1-mairacanal@riseup.net>
In-Reply-To: <20220630185005.908140-1-mairacanal@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Jul 2022 11:16:07 -0400
Message-ID: <CADnq5_OGBxvr_rkRPKq6KggYR45t-DiKxBwJqvyCLNK9=YtV-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove return value of
 Calculate256BBlockSizes
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 30, 2022 at 2:50 PM Ma=C3=ADra Canal <mairacanal@riseup.net> wr=
ote:
>
> The function Calculate256BBlockSizes always returns true, regardless of
> the parameters. As any file checks the return of the function, this
> commit changes the return value to void.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c | 3 +--
>  drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/driv=
ers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> index 2676710a5f2b..ed23c7c79d86 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
> @@ -957,7 +957,7 @@ static void recalculate_params(
>         }
>  }
>
> -bool Calculate256BBlockSizes(
> +void Calculate256BBlockSizes(
>                 enum source_format_class SourcePixelFormat,
>                 enum dm_swizzle_mode SurfaceTiling,
>                 unsigned int BytePerPixelY,
> @@ -995,7 +995,6 @@ bool Calculate256BBlockSizes(
>                 *BlockWidth256BytesY =3D 256 / BytePerPixelY / *BlockHeig=
ht256BytesY;
>                 *BlockWidth256BytesC =3D 256 / BytePerPixelC / *BlockHeig=
ht256BytesC;
>         }
> -       return true;
>  }
>
>  bool CalculateMinAndMaxPrefetchMode(
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/driv=
ers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> index 10ff536ef2a4..25a9a606ab6f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> @@ -169,7 +169,7 @@ bool get_is_phantom_pipe(struct display_mode_lib *mod=
e_lib,
>                 unsigned int pipe_idx);
>  void PixelClockAdjustmentForProgressiveToInterlaceUnit(struct display_mo=
de_lib *mode_lib);
>
> -bool Calculate256BBlockSizes(
> +void Calculate256BBlockSizes(
>                 enum source_format_class SourcePixelFormat,
>                 enum dm_swizzle_mode SurfaceTiling,
>                 unsigned int BytePerPixelY,
> --
> 2.36.1
>
