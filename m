Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2C82912E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 01:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B4310E528;
	Wed, 10 Jan 2024 00:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDA010E528
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 00:19:37 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5fa4b03f3f5so56487b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 16:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704845977; x=1705450777;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMlCuNyf+qjkfT4WZEPou/e0mpHeaA0nsYn/EYlNGhg=;
 b=b67BfDMQOyYFcfssdYHyYu9hvcGMN98zOhzH0yAscuv6E+iH0bTRfYs7PEowpGMyBF
 kR1z4MyEZzFCa/wk9qgcYIs3yhbHSLq09R416LRt8zrX8+nvUk/ORD5PGjLibvTQ1YPR
 O+6HT3P1P9hwy3trHYAOCLzjMWE7tCIMqp6gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704845977; x=1705450777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMlCuNyf+qjkfT4WZEPou/e0mpHeaA0nsYn/EYlNGhg=;
 b=Z1YKHPlT2KTQLNUrxH0znSYr9gkYayySzUz7uPj09c2PCn2rP3i5qrxM/QFLQlntpy
 PhI/fu18R/FmMtG0FCWvhy9Cykzc2M1w+TfoPtSoZUGfEznW+t23AN0dek2zrFCaAnTq
 4oxt89z7yJdeMtAVGtxwGxAjSOO04bGcLAvHgBhlFR6IjmkCvORGi2gVkuCrXAsYPx3J
 zcJHOxmz8cCuHlhMddbwkKNDrDnPFdVFW67aomGznf7+cFk4tHSs85vGrq8cNI5eBG8T
 k4J08O4kmVcMNggzkD64OZSICXo/KlcovUsi+JF2/MxUaXj555kMBHWZCXHxlKg652Vv
 dzmw==
X-Gm-Message-State: AOJu0YwDTl1fCSc06XSYeuUQWfbmG/lFj2SlOY5pXCTRb4hvzI40JGTK
 2uVVKe50SmJDhVjVs/g54PhfrXQfSwTg4j673WTFah5tIzU7v/sC4ZlkwCQElw==
X-Google-Smtp-Source: AGHT+IFU7PImuB1VsJuBTpg6q8REnpcGzqH7s2k0EZpss3fUAFHSdaZnqH6xxxn8keM7FooYpwPi+SC+7D+4YU6Z2OY=
X-Received: by 2002:a25:4fc4:0:b0:db7:dacf:2f21 with SMTP id
 d187-20020a254fc4000000b00db7dacf2f21mr126410ybb.104.1704845976931; Tue, 09
 Jan 2024 16:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20240108211655.13187-1-ian.forbes@broadcom.com>
In-Reply-To: <20240108211655.13187-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 9 Jan 2024 19:19:26 -0500
Message-ID: <CABQX2QPtzt9mkrwcdJTZWBNUe192wuEp9ec+uNhVLjhxLxizkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 to
 command array.
To: Ian Forbes <ian.forbes@broadcom.com>
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
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 8, 2024 at 4:57=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
 wrote:
>
> Without this definition device errors will display the command name
> as (null) when debug logging is enabled.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index 36987ef3fc30..472c4821528f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3603,6 +3603,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[S=
VGA_3D_CMD_MAX] =3D {
>                     &vmw_cmd_dx_bind_streamoutput, true, false, true),
>         VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2,
>                     &vmw_cmd_dx_so_define, true, false, true),
> +       VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V4,
> +                   &vmw_cmd_invalid, false, false, true),
>  };
>
>  bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd)
> --
> 2.34.1
>

Looks good, but in the future you want to both find the change that
initially added SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 and do "dim fixes" to
get the proper "Fixes:..." line to add to the commit description and
either use ./scripts/get_maintainer.pl or at least make sure the
maintainers are included in the patch by hand.

z
