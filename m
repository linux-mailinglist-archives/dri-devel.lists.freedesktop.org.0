Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7DB73B91A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 15:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9AF10E084;
	Fri, 23 Jun 2023 13:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAC610E084
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:49:53 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1a9ae7cc01dso422602fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687528191; x=1690120191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBTSrgYD+Mvz9rzF7bKxVqLCl14ec9WVX8SEIKC5SEE=;
 b=qrvRWAaVZ4qA512ZAm0/532VicBhZfxBiHW8V/l/ZK/PiZowbL5znbishEe28pWNHP
 LjeL5DPM1Rt10E9CeieL5BLqXxNuX8imA1DJZCREvGkx9x3A3CebmdMy+cy+cnAJBECY
 PlQZSQtwsV8mYv4hViQtEdz7KgQmuC2ffoL4R2s9xu4mEPcQrbMAr6VgY4SmIXWQJT/v
 khmcVX2R16fA09eL/4xhtJ06GDVU6XsraIKRIUu0NLOxRPMruD8/0zpLc/8e41yrRLAk
 GC6ScaduaSVYnazIRckRYj2WSUyxT6qWdTK1HE3SFEL41Lako4N6zxtXgL6qnnC7ai4y
 c+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528191; x=1690120191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EBTSrgYD+Mvz9rzF7bKxVqLCl14ec9WVX8SEIKC5SEE=;
 b=KWriSWPac0hS7OQs+vOYMAyiZAF/L9UNbka7vQAV0sjRvJGcD5VmvvREquGYbtPPc4
 HtVuznLAGGDKgO4B5tKoe35oeQhKnRd9XmnRNgMEMrNQ6smLU53GjS34l9KDsrCL4LMI
 V1rQpWFIaGSI8lbFQaDLlb1Db/F7d3lu84P09uaaB0WgMoP1a14xxJQXGyEFxuSo+Qrq
 yBQRpbqIKUf8ZrF/XEee7WI6+xmn45nQ0RSjG5BULO6MRN7eUDJPVyBxzGkTpSgDZTpq
 5alNXa0TaZ/cfArS1dYer32BHNcZV8+PE4Q+GFodh6Ko4GhjfCixvsUa1WnrK33i56A0
 B+Xg==
X-Gm-Message-State: AC+VfDxqMQj2NknEqzgHvCRjDAQFmfY3e0ir+sKpEZA+QVsLts7TQfuZ
 /Kc04BIpR5sXlF7hvMl9Z09saCEcHfAQIvNt6NA=
X-Google-Smtp-Source: ACHHUZ7EIOu8HeiN7LWAiGImtXsDb/Sdjifvr9+8C4kYJHm1k1zL4WOvuXdKBi6+dVAujZwS0tjIGoPWogRMhJYYLOs=
X-Received: by 2002:a05:6870:a486:b0:1ad:2b76:c3 with SMTP id
 j6-20020a056870a48600b001ad2b7600c3mr4841349oal.39.1687528191402; Fri, 23 Jun
 2023 06:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230623070935.65102-1-christian.koenig@amd.com>
In-Reply-To: <20230623070935.65102-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jun 2023 09:49:39 -0400
Message-ID: <CADnq5_Ms7EU_febAwtfDPsE93vULkOhWJSSW98dH_zYYx+S6pA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix warning that we shouldn't mix && and ||
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Yunxiang.Li@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 3:09=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Trivial warning fix.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 4481913607e5 ("drm/ttm: fix bulk_move corruption when adding a ent=
ry")

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index e51dbc7a2d53..46ff9c75bb12 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -114,7 +114,7 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk=
_move *bulk,
>         struct ttm_lru_bulk_move_pos *pos =3D ttm_lru_bulk_move_pos(bulk,=
 res);
>
>         if (unlikely(WARN_ON(!pos->first || !pos->last) ||
> -                    pos->first =3D=3D res && pos->last =3D=3D res)) {
> +                    (pos->first =3D=3D res && pos->last =3D=3D res))) {
>                 pos->first =3D NULL;
>                 pos->last =3D NULL;
>         } else if (pos->first =3D=3D res) {
> --
> 2.34.1
>
