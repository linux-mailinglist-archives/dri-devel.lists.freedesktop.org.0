Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752626C2C2D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 09:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0010E09D;
	Tue, 21 Mar 2023 08:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4105410E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 08:20:54 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id y19so8083595pgk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679386854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jr1BhuALy9XAego6b5UVtN71EPRczW+dr6tvJtB9h1Y=;
 b=oCzcn+cIlhpZEcIK/AOA0pR/20Gpgd0Tm3VulJkMjV3ceJd3kfxnXDTdsNyRP7gNh2
 cdDBUlOXB1PgGQitsqwzcxc6w3jBm3jbfeY4IZ3Ws/TKTIKaEIB+5Pbnz6SHGE2O2XUp
 2lvDW5kL6ZCgUOa4qgT9d1Rh5WeKTAQqvQniqfBHCSkTlF/RJIppvgDa70px5hYD4fen
 kTIsIQiLQRaRlHxmtg1trk791g2T0SnnTDB7b1TI1ayLXs5U3WjEUdVqF9wuljHpXT/7
 euE+sYGvW8YfjffTIhHBBLQJjrQKLWzFkOuqqkWdPl83yUuDQgNRTA+9/2QwiayA+Iua
 XE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679386854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jr1BhuALy9XAego6b5UVtN71EPRczW+dr6tvJtB9h1Y=;
 b=J/VjslLSzCXkvmSu6vB8X8xodPxaUI3+81tYs6T76d2gzldXox9aJ1uLnRgjj1E/Ry
 l3eTJx1WUQiKGFoEhwBz4O8aZl6aWPPxFhBGdi56MOHdIEGbagwiuIMoqns9XWPU1qGA
 JuAurXsMT80w1CPLkaRFUaJkk+T0rTqVGhIRSdmeHbTFQBD1AYlnXvrg4Z882usI5qkO
 bsvCz8OzsUiBZFMpUs1641pqMhR7LZ83slc+QuMOHSBENMTUy5peIAo7EUJbBRo2yYd3
 E1sPHJtH4NW8OPjXpBI5G6Kt+1p0b0G04bXLYE+2VknjfltuEX1VK8eb4Ii8/I6jIwfW
 U+Bw==
X-Gm-Message-State: AO0yUKVfT5zn4gzPmF1OaRa5tMXBeCBMmmIx7mwIq52YKYl2O7KZztQ4
 XQEPPDhWlt24arvSfkEELdgWUjp1yDT0xCDokh0=
X-Google-Smtp-Source: AK7set9OHjXGmmq5OcDZabAExRFA2HJQohhoRRbZLZ2vOzaQtU0kJl1n7DBXcS2HNaFfJUQotoJd/CBHL5nDV00YGjU=
X-Received: by 2002:a05:6a00:2d9d:b0:627:fb45:9279 with SMTP id
 fb29-20020a056a002d9d00b00627fb459279mr1258618pfb.0.1679386853807; Tue, 21
 Mar 2023 01:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230319142320.1704336-1-trix@redhat.com>
In-Reply-To: <20230319142320.1704336-1-trix@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 21 Mar 2023 09:20:36 +0100
Message-ID: <CAMeQTsZmJP-RCXfMcLntLx-M=-O=D=hAvu5kNVJWwUzG3Emm=g@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: remove unused gma_pipe_event function
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
Cc: llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 19, 2023 at 3:23=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/gma500/psb_irq.c:35:19: error: unused function
>   'gma_pipe_event' [-Werror,-Wunused-function]
> static inline u32 gma_pipe_event(int pipe)
>                   ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/psb_irq.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/ps=
b_irq.c
> index d421031462df..343c51250207 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -32,17 +32,6 @@ static inline u32 gma_pipestat(int pipe)
>         BUG();
>  }
>
> -static inline u32 gma_pipe_event(int pipe)
> -{
> -       if (pipe =3D=3D 0)
> -               return _PSB_PIPEA_EVENT_FLAG;
> -       if (pipe =3D=3D 1)
> -               return _MDFLD_PIPEB_EVENT_FLAG;
> -       if (pipe =3D=3D 2)
> -               return _MDFLD_PIPEC_EVENT_FLAG;
> -       BUG();
> -}
> -
>  static inline u32 gma_pipeconf(int pipe)
>  {
>         if (pipe =3D=3D 0)
> --
> 2.27.0
>
