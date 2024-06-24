Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F792915103
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9956310E26E;
	Mon, 24 Jun 2024 14:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Opi5ungq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EED910E04E;
 Mon, 24 Jun 2024 14:55:46 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-6c53a315c6eso3049417a12.3; 
 Mon, 24 Jun 2024 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719240946; x=1719845746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHJZJFdKOUU7MLHBSrCKc8/j1E+l52LoDEliQjriARU=;
 b=Opi5ungqYuku5466MNgSe3LlGispsV1Nl60u+DBLXYH1fCSC0GJOp5+FzBk4WFHzX2
 TKb8M5z2ldaDbMk3omK0vK04+BWXm8ey9W/IqwlPEDrv3FExDCMYhG2dWlo/d/6Zf9Zd
 94GbFY0jYenN9i2g1mePQzrdRXvGnHz5hbeAg5oK0zOlADo1VwmhkfOHfpCfjfBLF58D
 fnU2ezZ2b9MEgTTvxs/osIqQ/NBrJaIGupgbwGm6qef2vOPZuAlgv9MMr4D/H6vjw+MN
 MdYZxdwvYmqYeFTibxh0Y92P7OP/TUWm9w+3pmL2lkXHAe0g6hom3WfkVYakwz+M6Sx4
 O6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240946; x=1719845746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHJZJFdKOUU7MLHBSrCKc8/j1E+l52LoDEliQjriARU=;
 b=Ow/VQk8uIY2qK2pwuOmflDfjCT1TxTIXsNbS2F5H1Fj4pQ72hAYbdoCJDNQ3RWzavV
 K4coX11Fs0ToYjwwB1Z7rj2CTFsNxBsIZwsrAzBk10evIKRbVMZkZ5O8x4Rn7rHvFLko
 1+S0gGddcUKgpsVJsV7WkTybgbTfdAuAxI3U5G3QTMq886nOxub2yj3CuMuoWpH6j4uj
 rxlQFNwmoT5Tl+gLakL9HCToO/awAQBpDurc3e5OHUbHpMTytbHUsJbfDP7rqykSEc3u
 F85bGggoW7ZA50SKUazYQ2pKShUHfSFlFNtHi+Tlx48yGAHolS2Cx0bNYNdXboKHvLtO
 KFsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVrUm+K/oZQgpAN14lbbTV28U2CgRQycSAq41UvM8INCEB5OtNSNeAA94B8HUGDsIps1OhZ5JM81pSovVRFQvY6o4x96MQ8Un2qCP8GziHYFVLcF65IsCUo9nMs1yL4d7w2DPpP6QzzjB7bWhz9g==
X-Gm-Message-State: AOJu0YytGfnxfWrZHjzNrsNoCctx/v3ATHEj8jcJWp+aeXjvrD784HpD
 dhOE+j0PzzSnF4MHgHxxDWgIMTzyDJqk1irrgfxDLd8GYxP6J/9w7a74rbUJUO/wogn2fB30DPC
 4eiYAZR2GneuJEklsyz1UR6STb5U=
X-Google-Smtp-Source: AGHT+IHzORMZtyHXyD8+lKuZcICDhCjfwkQcfA37HDbLUn6mRY2KeHPqti3LqEt9YPexg/TUVMutE2FgEIGqW4S5jaE=
X-Received: by 2002:a17:90b:1245:b0:2c3:514:e0 with SMTP id
 98e67ed59e1d1-2c8505740d9mr4088550a91.35.1719240945712; Mon, 24 Jun 2024
 07:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240624015707.121287-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240624015707.121287-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jun 2024 10:55:31 -0400
Message-ID: <CADnq5_OXp3mcy16bwSJYKj+KaFbAqRP6MqNLfre=bum8Jcz7EA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use swap() in is_config_schedulable()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Jun 23, 2024 at 10:22=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Use existing swap() function rather than duplicating its implementation.
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fa=
ms2.c:1171:103-104: WARNING opportunity for swap().
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fa=
ms2.c:1231:99-100: WARNING opportunity for swap().
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9400
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_=
pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/d=
ml2_pmo_dcn4_fams2.c
> index 7272a04b9d1d..926d45496e79 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn=
4_fams2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn=
4_fams2.c
> @@ -1158,7 +1158,6 @@ static bool is_config_schedulable(
>         schedulable =3D true;
>
>         /* sort disallow times from greatest to least */
> -       unsigned int temp;
>         for (i =3D 0; i < s->pmo_dcn4.num_timing_groups; i++) {
>                 bool swapped =3D false;
>
> @@ -1167,9 +1166,8 @@ static bool is_config_schedulable(
>                         double jp1_disallow_us =3D s->pmo_dcn4.group_comm=
on_fams2_meta[s->pmo_dcn4.sorted_group_gtl_disallow_index[j + 1]].disallow_=
time_us;
>                         if (j_disallow_us < jp1_disallow_us) {
>                                 /* swap as A < B */
> -                               temp =3D s->pmo_dcn4.sorted_group_gtl_dis=
allow_index[j];
> -                               s->pmo_dcn4.sorted_group_gtl_disallow_ind=
ex[j] =3D s->pmo_dcn4.sorted_group_gtl_disallow_index[j + 1];
> -                               s->pmo_dcn4.sorted_group_gtl_disallow_ind=
ex[j + 1] =3D temp;
> +                               swap(s->pmo_dcn4.sorted_group_gtl_disallo=
w_index[j],
> +                                    s->pmo_dcn4.sorted_group_gtl_disallo=
w_index[j+1]);
>                                 swapped =3D true;
>                         }
>                 }
> @@ -1227,9 +1225,8 @@ static bool is_config_schedulable(
>                         double jp1_period_us =3D s->pmo_dcn4.group_common=
_fams2_meta[s->pmo_dcn4.sorted_group_gtl_period_index[j + 1]].period_us;
>                         if (j_period_us < jp1_period_us) {
>                                 /* swap as A < B */
> -                               temp =3D s->pmo_dcn4.sorted_group_gtl_per=
iod_index[j];
> -                               s->pmo_dcn4.sorted_group_gtl_period_index=
[j] =3D s->pmo_dcn4.sorted_group_gtl_period_index[j + 1];
> -                               s->pmo_dcn4.sorted_group_gtl_period_index=
[j + 1] =3D temp;
> +                               swap(s->pmo_dcn4.sorted_group_gtl_period_=
index[j],
> +                                    s->pmo_dcn4.sorted_group_gtl_period_=
index[j+1]);
>                                 swapped =3D true;
>                         }
>                 }
> --
> 2.20.1.7.g153144c
>
