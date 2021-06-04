Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E639BDCD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 18:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF726F62B;
	Fri,  4 Jun 2021 16:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60076F627;
 Fri,  4 Jun 2021 16:57:28 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t140so5125352oih.0;
 Fri, 04 Jun 2021 09:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IN3SgezFLQfNZ7veTbzUM3bPaQ1v48sm/05DwTa7/PU=;
 b=tBcoFOsv6b8ruMCJzxqbZ7QxP0UdsQMhL22S84VurvWGPoKPkq0mm2qfBbxR5v5iHR
 kUqCVUVnxX0ZXiUFFV5PzTNR/SqTFJkZYe7g7OeCa6ODdLxm7Zxc2e4kLHG36z/A5gcL
 39XoA+F+kyAXsS+gxPws9Hwlswz0/oe0ZJBDWro/VPTilrdWQ2eqr9WT5vcV6UvrVABw
 VbofKoss8GTut/9QzqOLoPlbK7O8MXGQ+r4Vr6xOqedV461uOlR2Kn357m7PE1gURvKJ
 vTagEoDcDW0z03oWaiVo35xr6K20QNYslFjo4fvU42TQRr8/cf1aJyh0GVrFHXPVaUUY
 3FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IN3SgezFLQfNZ7veTbzUM3bPaQ1v48sm/05DwTa7/PU=;
 b=bc/MJyLEGFOapiuRsBvIfH30AdFX8V4wHhtqzEtBRW+tb7wbuj2yI7ym3799ibGtoP
 QWl7KWU8t7idJLSGhBYjNR0H88Q05n1qK0LDER6FbgOrxUsGNXG2UzsaZPXj+a/02tUB
 PJC8IJOGQL8uQLUXRk+VCx+rLKEVzJ4nagYRSsyym2N/jRKXNfo9k7d9AIhqiojCuwEz
 hF2cu3oG0vUAih5W/xlmMef84VK+SjlhdbB/TUnE7aR0MjIMZGVJCAhVi9Vdcl7D2Wgf
 HpXKKMmd1XwHJrIw/E5nrWTZU+YByBK+kYMSD/l/ZdJWf/EBrE0EO8TM0Y83skpXiH2U
 HSww==
X-Gm-Message-State: AOAM532ywBUX7qiLJSWp2As8gCOhuvlSrgUNU2RHY2cminxAOmZ/Cfya
 d/e+GtTtfKUKIzwHu6FXBxNcFlGgZ8DTV4zotb4=
X-Google-Smtp-Source: ABdhPJycUpGDHDmpx2H0gKioVDhBClmCP6ZvzuaN3KQq9J2gvL7XNOsEat8k57/mMr8h9vtahb00hVhbvGi77TBEjXI=
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mr10953538oie.5.1622825848035; 
 Fri, 04 Jun 2021 09:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <1622690940-10972-1-git-send-email-wanjiabing@vivo.com>
 <3d7fcdb9-990b-270b-f87b-d7fe157c6b2f@gmail.com>
In-Reply-To: <3d7fcdb9-990b-270b-f87b-d7fe157c6b2f@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Jun 2021 12:57:17 -0400
Message-ID: <CADnq5_M5p=id9EtvtNGQyM6QC6QJNNWuraMi1LyoUZir6vUeZQ@mail.gmail.com>
Subject: Re: [PATCH] drm: amdgpu: Remove unneeded semicolon in amdgpu_vm.c
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
Cc: Philip Yang <Philip.Yang@amd.com>, Wan Jiabing <wanjiabing@vivo.com>,
 Mihir Bhogilal Patel <Mihir.Patel@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jun 4, 2021 at 3:03 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 03.06.21 um 05:28 schrieb Wan Jiabing:
> > Fix following coccicheck warning:
> > ./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1726:2-3: Unneeded semicolon
> >
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 2460371..231745b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -1723,7 +1723,7 @@ int amdgpu_vm_bo_update_mapping(struct amdgpu_dev=
ice *adev,
> >
> >               amdgpu_res_next(&cursor, num_entries * AMDGPU_GPU_PAGE_SI=
ZE);
> >               start =3D tmp;
> > -     };
> > +     }
> >
> >       r =3D vm->update_funcs->commit(&params, fence);
> >
>
