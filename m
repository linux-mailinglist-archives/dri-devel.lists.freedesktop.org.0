Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489FC352158
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 23:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6916ECAA;
	Thu,  1 Apr 2021 21:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF686ECAA;
 Thu,  1 Apr 2021 21:11:55 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id i81so3116148oif.6;
 Thu, 01 Apr 2021 14:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M3O3ezYK4tjrRScd1RwWw7v+Stoxl6m+PGnpI8CPjlE=;
 b=DofhZBNC+BMajMH6Ihx31LeKFM6jRi6/ZtImsQ18V1w4naw4NzgjchsOgXd+iXKMPP
 /xqGIbyuTAvepsfMXVubdEw9/p1OJOpfG+LbXwzbZs83Ocf2J6TOsBlvWEDgp15aKkN9
 ngoxoETJBUekW/VQp3Mf5i9RHwZWb0zlIbgeYIjXfybm8Ol2a9zEJo8MEaXrCLEbi5XM
 nGFB4YHqv/190W4JWrcovVhG64otW8yaWxx6IN/tzmOyJogNVwa6COUkujm3vofv0FUK
 16z/pJEM3Whl/sgk85e1F4eTSjEhzLQEX4QLxn1JTPg2GqosG9DbOxPtz+/fR6kpstyS
 rMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M3O3ezYK4tjrRScd1RwWw7v+Stoxl6m+PGnpI8CPjlE=;
 b=NkGFWO3/z4qNiM7XugoynVCdy6sRetoW4jSoojZXiEWAWTOfbMoC29ZYe9JZtGZFAv
 /Bk5JfyF4a4ijGHKtHMNdDJRHVeM6uPo1Sua02pX6DSgvLZTkYrYhwhscGSYNBVpvkdE
 zl0PRByMUtICYeY5sUvUV1+83ClU9K4d4zmSZExs8jVSvI1rnKFX6XZkqswDJaZ4jEkQ
 QLZoOiMsObCAl7QryfqlCbTyVTTGeFQXPKilvCCbwrpDdfmxvu9THVN/WZCE/53ubfwe
 SFim8otvkgqEqo8zIP4mEG3/T3+ajhXgP+OoJpQ8JmhtrhbWCx6bxhrsJosooAg11pZ/
 tlcQ==
X-Gm-Message-State: AOAM531zP7N2ewbxCRcVgLwxNvvS4uQv0k/4j9iv9cebur9B8h4UMzzz
 yKVdPsJ6miBp68QWdmYT5hmLIFfsDMq8+89dcivyjkihoT4=
X-Google-Smtp-Source: ABdhPJxehEErIgFKLEhysJ3MRBbpDbe4PiVid4S27ndYhqpWgh7rnSg+6pua5YkQyIVVJ70BZun3GE+BkeGJgKYJi4Q=
X-Received: by 2002:aca:4748:: with SMTP id u69mr7133639oia.5.1617311514752;
 Thu, 01 Apr 2021 14:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210331131205.60710-1-bernard@vivo.com>
In-Reply-To: <20210331131205.60710-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Apr 2021 17:11:43 -0400
Message-ID: <CADnq5_NkSUcYYZQnobUDZS8+-a2D32-DwO3JqRDkSh37OCPsXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: cleanup coding style a bit
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, Arnd Bergmann <arnd@arndb.de>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Mar 31, 2021 at 9:36 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Fix patch check warning:
> WARNING: suspect code indent for conditional statements (8, 17)
> +       if (obj && obj->use < 0) {
> +                DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);
>
> WARNING: braces {} are not necessary for single statement blocks
> +       if (obj && obj->use < 0) {
> +                DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);
> +       }
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 1fb2a91ad30a..43d17b72c265 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -449,11 +449,10 @@ static ssize_t amdgpu_ras_sysfs_read(struct device *dev,
>
>  static inline void put_obj(struct ras_manager *obj)
>  {
> -       if (obj && --obj->use == 0)
> +       if (obj && (--obj->use == 0))
>                 list_del(&obj->node);
> -       if (obj && obj->use < 0) {
> -                DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);
> -       }
> +       if (obj && (obj->use < 0))
> +               DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);
>  }
>
>  /* make one obj and return it. */
> --
> 2.31.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
