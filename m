Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD374DC24
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B8A10E2B1;
	Mon, 10 Jul 2023 17:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ADE10E2B1;
 Mon, 10 Jul 2023 17:19:46 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5634db21a78so3373061eaf.0; 
 Mon, 10 Jul 2023 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689009585; x=1691601585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mf12W3QMfs8wvFJMdqGBjbgKzWxSCEjVtEY7fJMchAc=;
 b=chZ3x25f3s+60NDSQ0WbJLU67n5riu5akD7uta1MmfBjYnD3qhkRXaV0MzbYTUHLy6
 nd6s8ypIqSXuEYguSk2epTD+HY2nKcsH7+8Nq6ARy29Ake00XMOMiU8bW9kHSku0ijGh
 gWM+0qwflHgKVV77vvm5DnHzKuRVTLTfhMjVZ8aKiQT50Vx642VdCB28Ur2c5vLwx6bo
 41efc6E5X4IrXzuf36jSg4msj9szH4161XIK/ogVfkjONxSm5zR7Ks0lIapYZJ3SIqHD
 vzmA8RNS1vU0U1nqSiaRG04Gn2Rvc24Q9I1r3R4/JoGa26zj0kMmrrzETon7cZIZioLX
 PD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689009585; x=1691601585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mf12W3QMfs8wvFJMdqGBjbgKzWxSCEjVtEY7fJMchAc=;
 b=io5YFw/oLCAh80ZDL+41SpA8fcRJqrWyg3470XKqY8E7jsrru1p+NZmFsEvxfv8Pod
 qnlp139qYc6StMTcWd7n+WhTWza9PcsTys0qUyUW30rBqCO14Uv/FUWUKzEM3OUD9Acu
 f5qln8oEK6QvkV9WyiXnHDyrkrFPF9D1kNG9GmHZFu0MH9dp/yQKKinHynmz1qWSykan
 plSMYR0aBjsfaoHFPGflCDd2Bm7cD8qVXXrEudHZXcJsJ/L0w+G54981fuH+Lh74WawZ
 DCEr1/YIkXP/Pa1dOAJT1lAaWmaWwmziq3Vhhaw2xzX+0IeoOfh6sKwYw3VJ9fY47hpJ
 cACw==
X-Gm-Message-State: ABy/qLYCRYHn+7Z6ziKIoW1B0QpRvcWg5AowtGVlmKr8eOcnxnuX/bJi
 49pILIuC/TkBFvFB6YZR9Kck3HZgK4UBABKihvE=
X-Google-Smtp-Source: APBJJlFM8ZDKgVy49NDz3B7j5aBzgSQO8+18VJjfx3IzNM4skrvEF5DbrZ/rJnoOmaNfdNeaUCY50FaGuUWZ6sqIjmY=
X-Received: by 2002:a05:6808:2216:b0:3a3:72ef:5959 with SMTP id
 bd22-20020a056808221600b003a372ef5959mr16680965oib.53.1689009585008; Mon, 10
 Jul 2023 10:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230710073659.54188-1-xujianghui@cdjrlc.com>
 <656c6d33a676c141ea35fadb519ccfbc@208suo.com>
In-Reply-To: <656c6d33a676c141ea35fadb519ccfbc@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jul 2023 13:19:33 -0400
Message-ID: <CADnq5_NwriVSHx27GTpHN1gWZ3Y=dd6ObmvSYHaBX=uf_DEo-A@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: ERROR: "foo * bar" should be "foo *bar"
To: sunran001@208suo.com
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 10, 2023 at 3:38=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix nine occurrences of the checkpatch.pl error:
> ERROR: "foo * bar" should be "foo *bar"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/atom.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atom.c
> b/drivers/gpu/drm/radeon/atom.c
> index c1bbfbe28bda..11a1940bb26d 100644
> --- a/drivers/gpu/drm/radeon/atom.c
> +++ b/drivers/gpu/drm/radeon/atom.c
> @@ -1156,7 +1156,7 @@ static struct {
>       atom_op_shr, ATOM_ARG_MC}, {
>   atom_op_debug, 0},};
>
> -static int atom_execute_table_locked(struct atom_context *ctx, int
> index, uint32_t * params)
> +static int atom_execute_table_locked(struct atom_context *ctx, int
> index, uint32_t *params)
>   {
>       int base =3D CU16(ctx->cmd_table + 4 + 2 * index);
>       int len, ws, ps, ptr;
> @@ -1216,7 +1216,7 @@ static int atom_execute_table_locked(struct
> atom_context *ctx, int index, uint32
>       return ret;
>   }
>
> -int atom_execute_table_scratch_unlocked(struct atom_context *ctx, int
> index, uint32_t * params)
> +int atom_execute_table_scratch_unlocked(struct atom_context *ctx, int
> index, uint32_t *params)
>   {
>       int r;
>
> @@ -1237,7 +1237,7 @@ int atom_execute_table_scratch_unlocked(struct
> atom_context *ctx, int index, uin
>       return r;
>   }
>
> -int atom_execute_table(struct atom_context *ctx, int index, uint32_t *
> params)
> +int atom_execute_table(struct atom_context *ctx, int index, uint32_t
> *params)
>   {
>       int r;
>       mutex_lock(&ctx->scratch_mutex);
> @@ -1359,8 +1359,8 @@ void atom_destroy(struct atom_context *ctx)
>   }
>
>   bool atom_parse_data_header(struct atom_context *ctx, int index,
> -                uint16_t * size, uint8_t * frev, uint8_t * crev,
> -                uint16_t * data_start)
> +                uint16_t *size, uint8_t *frev, uint8_t *crev,
> +                uint16_t *data_start)
>   {
>       int offset =3D index * 2 + 4;
>       int idx =3D CU16(ctx->data_table + offset);
> @@ -1379,8 +1379,8 @@ bool atom_parse_data_header(struct atom_context
> *ctx, int index,
>       return true;
>   }
>
> -bool atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t
> * frev,
> -               uint8_t * crev)
> +bool atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t
> *frev,
> +               uint8_t *crev)
>   {
>       int offset =3D index * 2 + 4;
>       int idx =3D CU16(ctx->cmd_table + offset);
