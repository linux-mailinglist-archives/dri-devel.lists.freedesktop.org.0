Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D60760188
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D8510E379;
	Mon, 24 Jul 2023 21:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C82310E378;
 Mon, 24 Jul 2023 21:49:48 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6bb231f1817so1148971a34.3; 
 Mon, 24 Jul 2023 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235387; x=1690840187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JxNZk8MsPm0PckOwS8aqqo0tEETYMartUX8cUScZv8=;
 b=sNy0k9jVu5XXThEW87lo7iGgQec96HT5eqtk7ZO4iOPcVT/rw22tK5w2E6TVRPIRq4
 0ozNHkWU/koSWcd6ZBb9QdtYXHX6UsYdumyrQEJ7+5z3+J+vrlgHQWwyF1IDE+9ks9F5
 5n6H2SkNJyCk+UCDlRAmo/hrUsIgT4mqxlPxJqWEYVUYecDNAdFFenUfrCVqTyIoYxeS
 /DucwDuBJTsiUNeTLhTlyMxCrfkTi5BAIxC8Qsds8+gyYR6H0onJECKKDcDWfNGIcOGI
 k8outEnb27us/xzGcHi3iHf+/NwZn/XU4QMlWbfP7Pa/g5upGjqGacpTI2lGTZ1iQD+R
 V9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235387; x=1690840187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JxNZk8MsPm0PckOwS8aqqo0tEETYMartUX8cUScZv8=;
 b=U75n+EumwKXL9Xn42Sd7G9vfznLkHT1rdMaErkBN1Bg15oBdos07xdX9Y9OHcbO5XB
 ddzVINVBdKalxxy5qdBM/zv07tQDbGVsvMgMIrk2KsbsC/gjTAy6SOx+gWltxsUFtISo
 IHjcOuSi98TtgaiLzdFpXdlUDMlvTZRgFnh4ukGcbOI3EG7aQjilMaeRm7KW5Megktxx
 RhJgQ7ZAIojxptz7X2qjmd3ZvttwyX1W1xR8bnFpDhjUnnOg6qUKiLTAMMzkxrb9Kz9J
 6dY8K/iRO3hBYkmQ75u9dJZ1BZ81VJHVEEbCrUvTiQZDQbWH0x71/OG5yCdQJL3FEPgs
 roaw==
X-Gm-Message-State: ABy/qLY8BEKOlzVAQgpJuFtexCB6OXK6klPkLsv5WYDcHoDJisdO1QMM
 rcz1Lq/VShQvFPL0RjZe7huCGycOpe4CDlIZ/NU=
X-Google-Smtp-Source: APBJJlHgGu7y5V/waK8csJmAHmWEnUcjX+s8f1sx/0/l7z27nPCykhtSD7Eaus/nRGhYly6k7G2UxNqGngB7lLrOWlo=
X-Received: by 2002:a05:6830:1d4a:b0:6b9:b8fe:bf73 with SMTP id
 p10-20020a0568301d4a00b006b9b8febf73mr6263188oth.7.1690235387724; Mon, 24 Jul
 2023 14:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230724074800.9099-1-xujianghui@cdjrlc.com>
 <d6c3b91864b9f3f90d8a2d3cd952bada@208suo.com>
In-Reply-To: <d6c3b91864b9f3f90d8a2d3cd952bada@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:49:36 -0400
Message-ID: <CADnq5_PgmnmoNRoePzH1_DShKv8qJt8KVcZGGEqO+wu10VdYnA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in arcturus_ppt.c
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 24, 2023 at 3:49=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: "foo* bar" should be "foo *bar"
> ERROR: spaces required around that '=3D' (ctx:VxW)
> ERROR: space prohibited before that close parenthesis ')'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> index 3ecb900e6ecd..b26e9ac1ac30 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -691,7 +691,7 @@ int smu_cmn_feature_set_enabled(struct smu_context
> *smu,
>
>   #undef __SMU_DUMMY_MAP
>   #define __SMU_DUMMY_MAP(fea)  #fea
> -static const char* __smu_feature_names[] =3D {
> +static const char *__smu_feature_names[] =3D {
>         SMU_FEATURE_MASKS
>   };
>
> @@ -927,7 +927,7 @@ int smu_cmn_get_metrics_table(struct smu_context
> *smu,
>                               void *metrics_table,
>                               bool bypass_cache)
>   {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         uint32_t table_size =3D
>                 smu_table->tables[SMU_TABLE_SMU_METRICS].size;
>         int ret =3D 0;
> @@ -969,7 +969,7 @@ void smu_cmn_init_soft_gpu_metrics(void *table,
> uint8_t frev, uint8_t crev)
>         struct metrics_table_header *header =3D (struct metrics_table_hea=
der
> *)table;
>         uint16_t structure_size;
>
> -#define METRICS_VERSION(a, b)  ((a << 16) | b )
> +#define METRICS_VERSION(a, b)  ((a << 16) | b)
>
>         switch (METRICS_VERSION(frev, crev)) {
>         case METRICS_VERSION(1, 0):
