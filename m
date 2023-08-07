Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234C772C4E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F01F10E332;
	Mon,  7 Aug 2023 17:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF8010E32D;
 Mon,  7 Aug 2023 17:12:04 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-56d455462c2so2249478eaf.2; 
 Mon, 07 Aug 2023 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428324; x=1692033124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1fFiDl47tj0kGpFVmy5pI63q4LR33axRCdbXWh8XXc=;
 b=Dxv/yJ1pcK4dyFHi2blaRWsooeHDuJVqxDYsmx3LVyICVQ7gUd+DO1ddjkZHSLAk7f
 EcxaoiFdT0G5F01Nqg1UQLjI17n0RqJ1PrreI5L5bucMQSsGhxHM/HMhGi9abKNaK3oi
 f2luBXDYx9BylQ9olG46Veb8eHXZk0R/H/+sTGBCop3G113iOGbO3Kjax+nWjniQ20DW
 Hr7l0lV1iBzGVMs4o+lz0bQeCGPz/ajvCu2D8xpgYomMEy43wFFoIud812IjIKYwNTGe
 eQfU3W1uOdvk59laOm5gtyrOaMigl4L9H72rvRJkEl6Mj5fDCa0sCF5kpteaTHbu6ucT
 f4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428324; x=1692033124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1fFiDl47tj0kGpFVmy5pI63q4LR33axRCdbXWh8XXc=;
 b=h7qGWJXnJ5zGXObWyfYs7xg6DVZPK21/3dPYpp4cd269Wk+iCk5k/9ZwvUb6UA7t/X
 Lf2VzaIaXVCJkfDvj8oX41X6yk0KjqODIOnzFfAvRurTnq8F3plMII1sVmmu4OrKiFqm
 s1I5YbLJQr9R6VWDd7xB7c5yO33xuA/iSsStYVXoSm0eDigQten/lIKoXrFpXVZmxCep
 HUu9JGtWxTWohUMPbEOrcJ2yFcEynDILlD3u0TPBUvluZlAdbrFEA6/GLbeRO7gdYPzZ
 uHiv0FX6Nv08q/nr4zUxTvTP5CFOjsq+WA33Msufmz2T5U0WwVqod1OuJbJcLIvb1mo3
 3Tsg==
X-Gm-Message-State: AOJu0YzMQTIZB1i4o/OEuHc9dukLDuCbmIdmHIq4Frt4m7qS44awHwA2
 Mtn2ZLIZFNnsveF/O9BXrJQwUUoLSIxHrMpB6y4=
X-Google-Smtp-Source: AGHT+IHzkSIlb9qWb8fkuZr8pkIIw3XgHtPA3sONL8H7DYzco0Urpf/mPFc/8HIKfCJlsmFJ0Z5tso9FusLyZUVB+WI=
X-Received: by 2002:a4a:d2dc:0:b0:56c:43cd:7267 with SMTP id
 j28-20020a4ad2dc000000b0056c43cd7267mr8345158oos.8.1691428324097; Mon, 07 Aug
 2023 10:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230802030311.10746-1-sunran001@208suo.com>
In-Reply-To: <20230802030311.10746-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:11:53 -0400
Message-ID: <CADnq5_PfyEZEWw1T-9RBvVtNrkHS=UB36nF8-M9TyEOFaCX3Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in dcn316_smu.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 11:03=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: code indent should use tabs where possible
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../amd/display/dc/clk_mgr/dcn316/dcn316_smu.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c b=
/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
> index 457a9254ae1c..3ed19197a755 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
> @@ -34,23 +34,21 @@
>  #define MAX_INSTANCE                                        7
>  #define MAX_SEGMENT                                         6
>
> -struct IP_BASE_INSTANCE
> -{
> +struct IP_BASE_INSTANCE {
>      unsigned int segment[MAX_SEGMENT];
>  };
>
> -struct IP_BASE
> -{
> +struct IP_BASE {
>      struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
>  };
>
>  static const struct IP_BASE MP0_BASE =3D { { { { 0x00016000, 0x00DC0000,=
 0x00E00000, 0x00E40000, 0x0243FC00, 0 } },
> -                                        { { 0, 0, 0, 0, 0, 0 } },
> -                                        { { 0, 0, 0, 0, 0, 0 } },
> -                                        { { 0, 0, 0, 0, 0, 0 } },
> -                                        { { 0, 0, 0, 0, 0, 0 } },
> -                                        { { 0, 0, 0, 0, 0, 0 } },
> -                                        { { 0, 0, 0, 0, 0, 0 } } } };
> +                                       { { 0, 0, 0, 0, 0, 0 } },
> +                                       { { 0, 0, 0, 0, 0, 0 } },
> +                                       { { 0, 0, 0, 0, 0, 0 } },
> +                                       { { 0, 0, 0, 0, 0, 0 } },
> +                                       { { 0, 0, 0, 0, 0, 0 } },
> +                                       { { 0, 0, 0, 0, 0, 0 } } } };
>
>  #define REG(reg_name) \
>         (MP0_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg=
 ## reg_name)
> --
> 2.17.1
>
