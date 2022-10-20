Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC499606122
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E4A10EEC6;
	Thu, 20 Oct 2022 13:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C9010EEC6;
 Thu, 20 Oct 2022 13:10:46 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w196so22757511oiw.8;
 Thu, 20 Oct 2022 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cemyxy4dpeRq0uuKNf5JWwjxkCluzhqG4ofmZbWFcZE=;
 b=pIWWgwwDx0olKcKRAZURt9rk1dtYhXUpYLbqxX1PSAukl6Fajs7B35qn889P8hl02V
 U7SmfroLVgIGpKqH4+EXDNZHvW8gKaTlIT5RpMLibSRVeQ/V4Ymbi7kWsLspGlYVezUC
 rpz7NXnMiLECXuUpuAYjb/dKj/ydija5LzzQRW0fXst7pp43qqUW1m+lQY5givglzBzP
 S+/HGdQxOzuhAs8v+l0okIbdmOvWQL7COFjYs//DD5L5CSpDrGEm0nEjL0uyrYLPnJaw
 vWT8eKakqCBLO9UEDQAohlSOohzztQMCdIQF8BQaImnYLM/Y8hboha61zJNwZy7Lmgnl
 2t9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cemyxy4dpeRq0uuKNf5JWwjxkCluzhqG4ofmZbWFcZE=;
 b=Et0mknQU8cywSo1lJAkxF+9Ta4/QIJO2Hot5xnJeO6YCzmoJFvjz7JuJA3kBY46UVU
 +rJZZrdrfJnF11WCKjG19aObV7KdQSvtbLdep+YluU5s9koqfxMSqPD3rEFGjvwax4ha
 xAJs5JUZx3lU9Sug6LKix7bXFDGKrd3EqJNF9GjKS1DTcDfM/2mOqQ+k0+aeI04V3wBm
 JwTLKEjLf0UqnBoxfgNxTQag5pXukuDG7IpRrriwVJGoMUhv/FqxejA/Tf0rYgevXjv6
 57GiUhtwqDBXg/GxdnvaH3rcQjpiNk3pV7dgZCjrz1hsaQLGEEBhPIkUGr4IBKtvETj2
 yXQg==
X-Gm-Message-State: ACrzQf3Bs8U2I0hPgI9rNXXdauDlRy7uPPGMh5/zJWJlEKXRK984PAqO
 5a6I7h6wcWb/GLsczm09RemMd+J/n8rpRbjvLMU=
X-Google-Smtp-Source: AMsMyM4E8YbN2RSOu/jza6/DlhbYG1PvAv4swjyW6nf6REHYcBLavUnlzsdHrN7tRScCH/dzh53QEXmGgLCrdZTe3cs=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr7176564oiw.96.1666271445001; Thu, 20
 Oct 2022 06:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221019074502.4048521-1-ruanjinjie@huawei.com>
In-Reply-To: <20221019074502.4048521-1-ruanjinjie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Oct 2022 09:10:33 -0400
Message-ID: <CADnq5_MTnK22v+NNB0iqY84ZGBP4eBV_w5QMN_2XuCHpSzxPiw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Make some symbols static
To: ruanjinjie <ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, agustin.gutierrez@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Oct 19, 2022 at 3:48 AM ruanjinjie <ruanjinjie@huawei.com> wrote:
>
> These symbols qp_table_422_10bpc_min, qp_table_444_8bpc_max,
> qp_table_420_12bpc_max, qp_table_444_10bpc_min, qp_table_420_8bpc_max,
> qp_table_444_8bpc_min, qp_table_444_12bpc_min, qp_table_420_12bpc_min,
> qp_table_422_12bpc_min, qp_table_422_12bpc_max, qp_table_444_12bpc_max,
> qp_table_420_8bpc_min, qp_table_422_8bpc_min, qp_table_422_10bpc_max,
> qp_table_420_10bpc_max, qp_table_420_10bpc_min, qp_table_444_10bpc_max,
> qp_table_422_8bpc_max are not used outside of the file,
> so mark them static.
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:28:18: warning:
> symbol 'qp_table_422_10bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:61:18: warning:
> symbol 'qp_table_444_8bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:102:18: warning:
> symbol 'qp_table_420_12bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:135:18: warning:
> symbol 'qp_table_444_10bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:188:18: warning:
> symbol 'qp_table_420_8bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:209:18: warning:
> symbol 'qp_table_444_8bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:250:18: warning:
> symbol 'qp_table_444_12bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:315:18: warning:
> symbol 'qp_table_420_12bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:348:18: warning:
> symbol 'qp_table_422_12bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:389:18: warning:
> symbol 'qp_table_422_12bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:430:18: warning:
> symbol 'qp_table_444_12bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:495:18: warning:
> symbol 'qp_table_420_8bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:516:18: warning:
> symbol 'qp_table_422_8bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:541:18: warning:
> symbol 'qp_table_422_10bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:574:16: warning:
> symbol 'qp_table_420_10bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:601:18: warning:
> symbol 'qp_table_420_10bpc_min' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:628:18: warning:
> symbol 'qp_table_444_10bpc_max' was not declared. Should it be static?
>
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/qp_tables.h:681:18: warning:
> symbol 'qp_table_422_8bpc_max' was not declared. Should it be static?
>
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>  .../drm/amd/display/dc/dml/dsc/qp_tables.h    | 36 +++++++++----------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h b/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
> index e5fac9f4181d..dcff0dd2b6a1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
> @@ -25,7 +25,7 @@
>   */
>
>
> -const qp_table   qp_table_422_10bpc_min = {
> +static const qp_table   qp_table_422_10bpc_min = {
>         {   6, { 0, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9, 9, 9, 12, 16} },
>         { 6.5, { 0, 4, 5, 6, 6, 6, 6, 7, 7, 8, 9, 9, 9, 12, 16} },
>         {   7, { 0, 4, 5, 6, 6, 6, 6, 7, 7, 7, 9, 9, 9, 11, 15} },
> @@ -58,7 +58,7 @@ const qp_table   qp_table_422_10bpc_min = {
>  };
>
>
> -const qp_table   qp_table_444_8bpc_max = {
> +static const qp_table   qp_table_444_8bpc_max = {
>         {   6, { 4, 6, 8, 8, 9, 9, 9, 10, 11, 12, 12, 12, 12, 13, 15} },
>         { 6.5, { 4, 6, 7, 8, 8, 8, 9, 10, 11, 11, 12, 12, 12, 13, 15} },
>         {   7, { 4, 5, 7, 7, 8, 8, 8, 9, 10, 11, 11, 12, 12, 13, 14} },
> @@ -99,7 +99,7 @@ const qp_table   qp_table_444_8bpc_max = {
>  };
>
>
> -const qp_table   qp_table_420_12bpc_max = {
> +static const qp_table   qp_table_420_12bpc_max = {
>         {   4, {11, 12, 13, 14, 15, 15, 15, 16, 17, 18, 18, 19, 19, 21, 22} },
>         { 4.5, {10, 11, 12, 13, 14, 15, 15, 16, 17, 18, 18, 19, 19, 20, 21} },
>         {   5, { 9, 11, 12, 13, 14, 15, 15, 16, 17, 17, 18, 18, 19, 20, 21} },
> @@ -132,7 +132,7 @@ const qp_table   qp_table_420_12bpc_max = {
>  };
>
>
> -const qp_table   qp_table_444_10bpc_min = {
> +static const qp_table   qp_table_444_10bpc_min = {
>         {   6, { 0, 4, 7, 7, 9, 9, 9, 9, 9, 10, 10, 10, 10, 12, 18} },
>         { 6.5, { 0, 4, 6, 7, 8, 8, 9, 9, 9, 9, 10, 10, 10, 12, 18} },
>         {   7, { 0, 4, 6, 6, 8, 8, 8, 8, 8, 9, 9, 10, 10, 12, 17} },
> @@ -185,7 +185,7 @@ const qp_table   qp_table_444_10bpc_min = {
>  };
>
>
> -const qp_table   qp_table_420_8bpc_max = {
> +static const qp_table   qp_table_420_8bpc_max = {
>         {   4, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 13, 14} },
>         { 4.5, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13} },
>         {   5, { 3, 4, 5, 6, 7, 7, 7, 8, 9, 9, 10, 10, 11, 12, 13} },
> @@ -206,7 +206,7 @@ const qp_table   qp_table_420_8bpc_max = {
>  };
>
>
> -const qp_table   qp_table_444_8bpc_min = {
> +static const qp_table   qp_table_444_8bpc_min = {
>         {   6, { 0, 1, 3, 3, 5, 5, 5, 5, 5, 6, 6, 6, 6, 9, 14} },
>         { 6.5, { 0, 1, 2, 3, 4, 4, 5, 5, 5, 5, 6, 6, 6, 9, 14} },
>         {   7, { 0, 0, 2, 2, 4, 4, 4, 4, 4, 5, 5, 6, 6, 9, 13} },
> @@ -247,7 +247,7 @@ const qp_table   qp_table_444_8bpc_min = {
>  };
>
>
> -const qp_table   qp_table_444_12bpc_min = {
> +static const qp_table   qp_table_444_12bpc_min = {
>         {   6, { 0, 5, 11, 11, 13, 13, 13, 13, 13, 14, 14, 14, 14, 17, 22} },
>         { 6.5, { 0, 5, 10, 11, 12, 12, 13, 13, 13, 13, 14, 14, 14, 17, 22} },
>         {   7, { 0, 5, 10, 10, 12, 12, 12, 12, 12, 13, 13, 14, 14, 17, 21} },
> @@ -312,7 +312,7 @@ const qp_table   qp_table_444_12bpc_min = {
>  };
>
>
> -const qp_table   qp_table_420_12bpc_min = {
> +static const qp_table   qp_table_420_12bpc_min = {
>         {   4, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 15, 21} },
>         { 4.5, { 0, 4, 8, 9, 10, 11, 11, 11, 11, 11, 13, 13, 13, 15, 20} },
>         {   5, { 0, 4, 8, 9, 10, 11, 11, 11, 11, 11, 13, 13, 13, 15, 20} },
> @@ -345,7 +345,7 @@ const qp_table   qp_table_420_12bpc_min = {
>  };
>
>
> -const qp_table   qp_table_422_12bpc_min = {
> +static const qp_table   qp_table_422_12bpc_min = {
>         {   6, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 16, 20} },
>         { 6.5, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 16, 20} },
>         {   7, { 0, 4, 9, 10, 11, 11, 11, 11, 11, 11, 13, 13, 13, 15, 19} },
> @@ -386,7 +386,7 @@ const qp_table   qp_table_422_12bpc_min = {
>  };
>
>
> -const qp_table   qp_table_422_12bpc_max = {
> +static const qp_table   qp_table_422_12bpc_max = {
>         {   6, {12, 12, 13, 14, 15, 15, 15, 16, 17, 18, 18, 19, 19, 20, 21} },
>         { 6.5, {12, 12, 13, 14, 15, 15, 15, 16, 17, 18, 18, 19, 19, 20, 21} },
>         {   7, {11, 12, 13, 14, 15, 15, 15, 16, 17, 17, 18, 18, 19, 19, 20} },
> @@ -427,7 +427,7 @@ const qp_table   qp_table_422_12bpc_max = {
>  };
>
>
> -const qp_table   qp_table_444_12bpc_max = {
> +static const qp_table   qp_table_444_12bpc_max = {
>         {   6, {12, 14, 16, 16, 17, 17, 17, 18, 19, 20, 20, 20, 20, 21, 23} },
>         { 6.5, {12, 14, 15, 16, 16, 16, 17, 18, 19, 19, 20, 20, 20, 21, 23} },
>         {   7, {12, 13, 15, 15, 16, 16, 16, 17, 18, 19, 19, 20, 20, 21, 22} },
> @@ -492,7 +492,7 @@ const qp_table   qp_table_444_12bpc_max = {
>  };
>
>
> -const qp_table   qp_table_420_8bpc_min = {
> +static const qp_table   qp_table_420_8bpc_min = {
>         {   4, { 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 13} },
>         { 4.5, { 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
>         {   5, { 0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
> @@ -513,7 +513,7 @@ const qp_table   qp_table_420_8bpc_min = {
>  };
>
>
> -const qp_table   qp_table_422_8bpc_min = {
> +static const qp_table   qp_table_422_8bpc_min = {
>         {   6, { 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
>         { 6.5, { 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 8, 12} },
>         {   7, { 0, 0, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 11} },
> @@ -538,7 +538,7 @@ const qp_table   qp_table_422_8bpc_min = {
>  };
>
>
> -const qp_table   qp_table_422_10bpc_max = {
> +static const qp_table   qp_table_422_10bpc_max = {
>         {   6, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17} },
>         { 6.5, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17} },
>         {   7, { 7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 15, 16} },
> @@ -571,7 +571,7 @@ const qp_table   qp_table_422_10bpc_max = {
>  };
>
>
> -const qp_table qp_table_420_10bpc_max = {
> +static const qp_table qp_table_420_10bpc_max = {
>         {   4, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 17, 18} },
>         { 4.5, { 8, 8, 9, 10, 11, 11, 11, 12, 13, 14, 14, 15, 15, 16, 17} },
>         {   5, { 7, 8, 9, 10, 11, 11, 11, 12, 13, 13, 14, 14, 15, 16, 17} },
> @@ -598,7 +598,7 @@ const qp_table qp_table_420_10bpc_max = {
>  };
>
>
> -const qp_table   qp_table_420_10bpc_min = {
> +static const qp_table   qp_table_420_10bpc_min = {
>         {   4, { 0, 4, 4, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 17} },
>         { 4.5, { 0, 4, 4, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 12, 16} },
>         {   5, { 0, 4, 4, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 12, 16} },
> @@ -625,7 +625,7 @@ const qp_table   qp_table_420_10bpc_min = {
>  };
>
>
> -const qp_table   qp_table_444_10bpc_max = {
> +static const qp_table   qp_table_444_10bpc_max = {
>         {   6, { 8, 10, 12, 12, 13, 13, 13, 14, 15, 16, 16, 16, 16, 17, 19} },
>         { 6.5, { 8, 10, 11, 12, 12, 12, 13, 14, 15, 15, 16, 16, 16, 17, 19} },
>         {   7, { 8, 9, 11, 11, 12, 12, 12, 13, 14, 15, 15, 16, 16, 17, 18} },
> @@ -678,7 +678,7 @@ const qp_table   qp_table_444_10bpc_max = {
>  };
>
>
> -const qp_table   qp_table_422_8bpc_max = {
> +static const qp_table   qp_table_422_8bpc_max = {
>         {   6, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13} },
>         { 6.5, { 4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 10, 11, 11, 12, 13} },
>         {   7, { 3, 4, 5, 6, 7, 7, 7, 8, 9, 9, 10, 10, 11, 11, 12} },
> --
> 2.25.1
>
