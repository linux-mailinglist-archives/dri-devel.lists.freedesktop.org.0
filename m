Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113540C81A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 17:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25DA6E95D;
	Wed, 15 Sep 2021 15:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247096E95D;
 Wed, 15 Sep 2021 15:18:22 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id p2so4668998oif.1;
 Wed, 15 Sep 2021 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s47povPHC17mzUM43hPaNuCVlnjcb1YymD4IzB2Fw7Q=;
 b=H5F4SycB3G6lDTgS54F9rM3ChhQpYgNJ6rzJ/MlpVYRsFh4NNy5t+vxycNUk4J0bpq
 uBSSBADO+WczlshwtZ9iWPmfOFEaesG+uiSGFNXgrt7if6pt3y+UW4z0HmSkjepr/+f7
 Kth7/1V45EdcFF3f2QSrCBiiCjKYWskPav4ZPn0L2mmZkrO285uPXregr24jHwNOQuB9
 kSnBN0ykE54FkubHzqkmKCFgqkW7zIDKKyjTmqs07MQ+uLzfKs35ta6efet5njFOOm2Z
 kcpnBzuHIZQSNGenejWwO4/lSwy2G2Bp7z5SWsNUMdsCNGlBb732df9SwZWKKh+VyQ43
 mxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s47povPHC17mzUM43hPaNuCVlnjcb1YymD4IzB2Fw7Q=;
 b=RQbZzbSyotwAGjabJjmEY+t0rFQaEUCl8sNIBBD6e4LKu+8Jhnlz2rKspX8Y0LdoKH
 01HaZ/10ia8zdQ51O2bWdWdjdN5tnLkS3syVG6HUVtXsr8McDisSP/3iZhV/s2pa8Qzl
 idLf3HGSFLgWX0lCM5/UAM5WDzfBSjNL8uh5vbfeJyvh4wr3T32gIA9pH8L0nr8al/Eu
 OKzPw6M30OB1hfh4XE4dyyVjkWaL+TSbXw+YX3XhtsEd4SOJ+KhXL5C0SdUQnzFo6dxx
 9qgSKzzol5FCqzB3LNqucHpxNsR6fOYk4+6gucO2/KotjKbvX58Nx0ed1vU9S9PvufpO
 N6lA==
X-Gm-Message-State: AOAM5303b4Dv/9FQRYEjoIPiS/WZdtt0EgAHjzqlrT7YFGghtbWw04Qa
 40T0R8cXW4sh73i4tVEsM4PnadY/HTkfkUuo44M=
X-Google-Smtp-Source: ABdhPJxN8y+U7oRECmZ+npqb9JFoI4RVReJOjBfUtqj5GftKFCmqUXmsC34nY5tds3nkg43tIAEhcR6O12emBYoBCQs=
X-Received: by 2002:aca:706:: with SMTP id 6mr5449830oih.5.1631719101439; Wed,
 15 Sep 2021 08:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210915113611.13620-1-colin.king@canonical.com>
In-Reply-To: <20210915113611.13620-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Sep 2021 11:18:10 -0400
Message-ID: <CADnq5_NW11tad5-jVEEL4CDUcOm==2zsUMN+v594fKdSg5JErQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: make array encoded_lanes static
To: Colin King <colin.king@canonical.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 15, 2021 at 7:36 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the read-only array encoded_lanes on the stack but instead it
> static. Also makes the object code smaller by 97 bytes:
>
> Before:
>    text    data    bss     dec    hex filename
>   38899    8064      0   46963   b773 ./drivers/gpu/drm/radeon/r600_dpm.o
>
> After:
>    text    data    bss     dec    hex filename
>   38738    8128      0   46866   b712 ./drivers/gpu/drm/radeon/r600_dpm.o
>
> (gcc version 11.2.0)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/r600_dpm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
> index fd4226b99862..9d2bcb9551e6 100644
> --- a/drivers/gpu/drm/radeon/r600_dpm.c
> +++ b/drivers/gpu/drm/radeon/r600_dpm.c
> @@ -1361,7 +1361,9 @@ u16 r600_get_pcie_lane_support(struct radeon_device *rdev,
>
>  u8 r600_encode_pci_lane_width(u32 lanes)
>  {
> -       u8 encoded_lanes[] = { 0, 1, 2, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5, 0, 0, 0, 6 };
> +       static const u8 encoded_lanes[] = {
> +               0, 1, 2, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5, 0, 0, 0, 6
> +       };
>
>         if (lanes > 16)
>                 return 0;
> --
> 2.32.0
>
