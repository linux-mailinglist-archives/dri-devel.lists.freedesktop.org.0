Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F28975CCF3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881E510E6B6;
	Fri, 21 Jul 2023 16:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107BB10E6B6;
 Fri, 21 Jul 2023 16:01:10 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a44cccbd96so1417723b6e.3; 
 Fri, 21 Jul 2023 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689955270; x=1690560070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RNvscis9SxDbDG2bKAhXYHTWtZu9xJHfBIYgi94BUkY=;
 b=Qe58kZwzM0tdBHRv/Q+o1BuBSOCQmUYof9HbU82NwxLSJUNTNaPLb3Pr9eyRwjk5rG
 Bx+quhJYh/cWBfz05NDS2HdnV9enfadUFBkMUiHcrBhjN+ANcKfbvkA5+Dl8r1e4kqoH
 sjoo0FYcdwPaOwZqB7bzrgoipbh1XDE6CC9xjv4SqEVY1w7X8SD/zpFAoZDllpgDlgxK
 Jq8vhBBaOL52X1DCt8kReFkH5js5+TIB5FPvCNsM8NKP6VbIqRAEIOU09+vbt0CjP0eS
 BQrEtl87EOYvV+atvnHSPlOrB37Reo9+DtrGOuZVM4UWEVdzsoljt85wMZeCsOk00HvT
 ELRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689955270; x=1690560070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNvscis9SxDbDG2bKAhXYHTWtZu9xJHfBIYgi94BUkY=;
 b=jEWv9IjxpTOvQJHLE8eqyp6z3EjjW4bm45Ik70mPvpEajM++UMZYXavnwJvTWjrcHM
 4l2Xe74zl50J6u+d9BsZIUU69lhvUyx+hverJ770Hmzg+a6S/6d1GqA2KWwGCcqD/iN4
 zfNwkPCtxJMtL2MzLDvpscypmD+eyd1qSmq1iuJ8rC0nkyH3QYQx5i86FxSaCDVZ/u3N
 yQkVHmR1xeV7ho9YxkPkgj7SdPMDJOuCSv+Rqhi0Wo60/MJlnVBRyYDNn4p9ylbebnL1
 ocNw5hvM8dftLTaWYoFUsqayKxXb30O1xWRLJEzN8ZZjVo91tLB4THPo/mJCYx+EF7Hg
 kahQ==
X-Gm-Message-State: ABy/qLacSKZDVZHIjUfmW0z3mGtc7wL7n2osYRryG13DjC5lcd/6Tm8X
 hYod64Dll1mX9J2M8uaFIbu/7OeZCu4psEgu7rA=
X-Google-Smtp-Source: APBJJlFvkxjf9Ff4oYeV36vdgli7Jy1S21W/GOQptFqDSnAm/PA8vMgnjsi2kgq4p/okkQExoJcA2jBHFsPeiyyZGCw=
X-Received: by 2002:a05:6808:f8e:b0:3a4:4912:9638 with SMTP id
 o14-20020a0568080f8e00b003a449129638mr2865554oiw.49.1689955269984; Fri, 21
 Jul 2023 09:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230721060919.5133-1-xujianghui@cdjrlc.com>
 <696ea9a46762e16d993f8fc4bf26fb7f@208suo.com>
In-Reply-To: <696ea9a46762e16d993f8fc4bf26fb7f@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jul 2023 12:00:58 -0400
Message-ID: <CADnq5_M7SzAFpte34t3yYu+7X7KNxmGRx9Vm9nsLtcoFfhKKFQ@mail.gmail.com>
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

On Fri, Jul 21, 2023 at 2:10=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix nine occurrences of the checkpatch.pl error:
> ERROR: "foo * bar" should be "foo *bar"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/atom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atom.c
> b/drivers/gpu/drm/radeon/atom.c
> index 11a1940bb26d..93acb0e42bd6 100644
> --- a/drivers/gpu/drm/radeon/atom.c
> +++ b/drivers/gpu/drm/radeon/atom.c
> @@ -68,8 +68,8 @@ typedef struct {
>   } atom_exec_context;
>
>   int atom_debug =3D 0;
> -static int atom_execute_table_locked(struct atom_context *ctx, int
> index, uint32_t * params);
> -int atom_execute_table(struct atom_context *ctx, int index, uint32_t *
> params);
> +static int atom_execute_table_locked(struct atom_context *ctx, int
> index, uint32_t *params);
> +int atom_execute_table(struct atom_context *ctx, int index, uint32_t
> *params);
>
>   static uint32_t atom_arg_mask[8] =3D {
>         0xFFFFFFFF, 0x0000FFFF, 0x00FFFF00, 0xFFFF0000,
