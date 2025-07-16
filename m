Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BEDB07E58
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 21:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BB710E3BE;
	Wed, 16 Jul 2025 19:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TH9EUw8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE54D10E036;
 Wed, 16 Jul 2025 19:46:41 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-31306794b30so46661a91.2; 
 Wed, 16 Jul 2025 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752695201; x=1753300001; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dERiphi8SN2qWU4cz5FSID1siLlWpDs3Gm8IHGd1cj4=;
 b=TH9EUw8TfKgkxuHr1D5vh4DgYJasKzMedDXDFgDK72BCwdjIGPAFWqVohicbfeWuEC
 IGofyQWRg1JLHFPahxb/8V0ZHvx7ivO3dI54RRjKoHLtTAtv+Ze5HLr3qzSmyywqkqiY
 eo9nKR5lUrje6n4jDAkMNOAjybBluQ5w+/8+8+FqN/2RXnDjxFS8LUOKJJoGMDE1koiJ
 fKNzToKZZRCQHMOLp0swSAPKT/5fiN7/GQ937tYEklNHWuFfzjbkWom69ZjVLWuIEgeJ
 6Q0AozMuW6Di7a8IYSluEa4fqZuFG7e31J3w9WNjT7Qk0goeuib8jjnDn7MtAX0e5a/d
 Agyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752695201; x=1753300001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dERiphi8SN2qWU4cz5FSID1siLlWpDs3Gm8IHGd1cj4=;
 b=qsiioVAhdhJ8jqZ4sPWt6EZhoh9FP7nipB8InsG00tOutYQSrdg0llQn6xD0OLM0pH
 +VL3P24qbjTqoFRkFZc6mhjCmDyzwo6cJHvxNEf+cqQ5cGqiRK7dzXFp7EMzGufkS+5R
 DND4KiI2KEg60iil9B6OLd9bmzHz1KJDxSOdA5AF/O0B5/eqdklU9wWU44qcwBlRUyDB
 6exX6IM9t9dwewgfF74SzgDoRpetSE4BirS1l6RW3dZz0YdJTo3W3um8BFafljYTtf6a
 obitSM4s/wWbmxeE4BgaU6a4DAWyFWDJdGYh6JkqnRIt2P7+PhrjOvCGeSUQzLfKM5Bm
 4i+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCesKxGdDSCw6ZHaOLnH3AGQ3nzkMi+uY7BxNdQ4OitI8XB+WyHYLjeOKsE7uKoVGgKuWf1HX8@lists.freedesktop.org,
 AJvYcCXhWSqY0HNzvtvm23YegPrpYu5PVvx6A9TVyXsqIni9ncNRIZs5kITdQr1dFQhOtuyHnC2QAQr5zxkz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBk5CBLZy5QsVK429fa6Qll8xIgXCamGboI2x2qtfVQtm/WQTW
 woO6aIL93Ewz0R8CnNcfTiKmLja9VykLmeJPs60JvyzMYeIb1cTNHS8yGk1uOZsmKvjg662rQOQ
 lDcweywqSwt84TnYPJZWICYzIbDi+njs=
X-Gm-Gg: ASbGncvjIR+cn1EyDGoNJxAFPVyafBhlgJqTMzhCTHqWcROo+KB7VgWhhI5ifUou+gu
 0hS6bsyoRhk02pMhsC5olqbdigB7BdQiQIY7dCYM5kdHYWs5NkJ1uDJ8fYQiLsht+ZMUmMnV9tt
 aVg8/eGWOple3tVnINA7QTQ+K9ciD2mFEPNkOYdqiirSFnJFI89DKUcAFnHimZdTdOOzEE4G7UM
 /9PLkyk
X-Google-Smtp-Source: AGHT+IG514k5VRiW+obbt6A+oNLgvRU+VAxB/IFQYU8x0hq4HIBflZqiyffcLx81uxBEMk6EHCx34UB1XvYWKTTziSE=
X-Received: by 2002:a17:90b:4f8f:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-31c9e5fd68dmr2197726a91.0.1752695201128; Wed, 16 Jul 2025
 12:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <366557fa7ca8173fd78c58336986ca56953369b9.1752087753.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <366557fa7ca8173fd78c58336986ca56953369b9.1752087753.git.christophe.jaillet@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Jul 2025 15:46:26 -0400
X-Gm-Features: Ac12FXwIJeC3bTU_gBoJ6CtWloLxs-4aqxpxghGcmsfmdyFd7wbRIjGU8uyr99E
Message-ID: <CADnq5_PZ-F=Ut=z05pqTJNs30as2hez-hq2kMariJS3E5N2AXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix missing unlocking in an error path in
 amdgpu_userq_create()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Jul 9, 2025 at 3:28=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If kasprintf() fails, some mutex still need to be released to avoid locki=
ng
> issue, as already done in all other error handling path.
>
> Fixes: c03ea34cbf88 ("drm/amdgpu: add support of debugfs for mqd informat=
ion")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
and pushed out to drm-misc-next.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index 513bbc543f40..bce97318965c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -520,8 +520,10 @@ amdgpu_userq_create(struct drm_file *filp, union drm=
_amdgpu_userq *args)
>         }
>
>         queue_name =3D kasprintf(GFP_KERNEL, "queue-%d", qid);
> -       if (!queue_name)
> -               return -ENOMEM;
> +       if (!queue_name) {
> +               r =3D -ENOMEM;
> +               goto unlock;
> +       }
>
>         /* Queue dentry per client to hold MQD information   */
>         queue->debugfs_queue =3D debugfs_create_dir(queue_name, filp->deb=
ugfs_client);
> --
> 2.50.0
>
