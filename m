Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2CF5B0041
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 11:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F59410E480;
	Wed,  7 Sep 2022 09:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABF810E46D;
 Wed,  7 Sep 2022 09:21:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id w8so21408238lft.12;
 Wed, 07 Sep 2022 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=pDcZWID3GhvjZ+jMAttHRuH0K5va/5lCQNl15XcLPY8=;
 b=M51T91O2t/Y7lK6tzNS8cLMrh2Kyptf8NM7ForcsoMbytm7WU6q4Cq9v8J5SRlUgHv
 swAEb7WW+WZSI23bktX0PywDwSjF+SNyzSIKdtLcU9tmx0YNWtNqLtlstoRU93fZfNRH
 YBZhbpvP/4O951WySfdq58C4wdZk14IoTDPqmLQATetmW+ulEXClPK/Wo41QTFDNHXBl
 S2pv8XZ7NuTKmgKkQurVHfY0IgRRX02czE9YEu6pB54hZyA/m13PLFEKroN+RF00/zi3
 4/wJc8SR8c5zxvNdi2wl92JnZFF+P7nwNhe/oVEd7hD1gQ4I3cj27lczkZg4Qo4iIJ1g
 dg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pDcZWID3GhvjZ+jMAttHRuH0K5va/5lCQNl15XcLPY8=;
 b=3oe1vyWHk4htLT4n4Qr8y9r0k7KxminVOu1Nr5JwaEAH5Jo/lHBJsU94r/RMcVjuIH
 07qC28yWkNkPFozNVOu0OCLFUhw+DZN/25ikn3px21y3hO5hSAn5HdyS3GtqTRNy1G/y
 Dv2aRrJs006D+xQIfewIbntm9KnDymOMZ21wGYUH8XAAAcMGwSK+O8nnRhAP8coul1fo
 2w857++3MIl6NdD9w9xJKFATeyA9fzdcX0MkuQaLbjpfNEBNmLXgg76BjgBuJweuOkkD
 JYh8m4pKC0JlWMLDMxIxrFav9IOXlbqgWNHuAu69p6RO3CvFPTwb15b9vWBo7Tl681eY
 ohnA==
X-Gm-Message-State: ACgBeo2Li50wgT88w2jf/On7i0ryiYtS9z/nb+/64J6wi4diesGhGGMV
 RjzhJjq/X8ZJoMLxC6wteyAi2iW0YPdIvAMkzcU=
X-Google-Smtp-Source: AA6agR4b60aa4ybWkdKE+DNdSpJK+GwW/oY01TsoODeaXpdUJvQxI7gBXLzDwHa7+B8yt7pV+7jm8sBqOAGsqCwlgzk=
X-Received: by 2002:ac2:5dc4:0:b0:497:a786:eb91 with SMTP id
 x4-20020ac25dc4000000b00497a786eb91mr691585lfq.166.1662542495523; Wed, 07 Sep
 2022 02:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220906084619.2545456-1-zhenguo.yin@amd.com>
 <47d80b9c-8ef2-80da-2df8-4c7083907f66@amd.com>
In-Reply-To: <47d80b9c-8ef2-80da-2df8-4c7083907f66@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 7 Sep 2022 10:21:08 +0100
Message-ID: <CAM0jSHP1nEN_+iEMDm5gx0xNikDkPX5x0csCFdyPSws2CQ=95A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ttm: update bulk move object of ghost BO
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: ZhenGuo Yin <zhenguo.yin@amd.com>, jingwen.chen2@amd.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Sept 2022 at 09:54, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 06.09.22 um 10:46 schrieb ZhenGuo Yin:
> > [Why]
> > Ghost BO is released with non-empty bulk move object. There is a
> > warning trace:
> > WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2=
f0 [amdttm]
> > Call Trace:
> >    amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
> >    amdttm_bo_put+0x28/0x30 [amdttm]
> >    amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
> >    amdgpu_bo_move+0x1a8/0x770 [amdgpu]
> >    ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
> >    amdttm_bo_validate+0xbf/0x100 [amdttm]
> >
> > [How]
> > The resource of ghost BO should be moved to LRU directly, instead of
> > using bulk move. The bulk move object of ghost BO should set to NULL
> > before function ttm_bo_move_to_lru_tail_unlocked.
> >
> > v2: set bulk move to NULL manually if no resource associated with ghost=
 BO
> >
> > Fixed: 5b951e487fd6bf5f ("drm/ttm: fix bulk move handling v2")
> > Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Going to push that to drm-misc-fixes in a minute.
>
> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo_util.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/tt=
m_bo_util.c
> > index 1cbfb00c1d65..57a27847206f 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -239,6 +239,9 @@ static int ttm_buffer_object_transfer(struct ttm_bu=
ffer_object *bo,
> >       if (fbo->base.resource) {
> >               ttm_resource_set_bo(fbo->base.resource, &fbo->base);
> >               bo->resource =3D NULL;
> > +             ttm_bo_set_bulk_move(&fbo->base, NULL);

This appears to blow up quite badly in i915. See here for an example trace:
https://gitlab.freedesktop.org/drm/intel/-/issues/6744

Do you know if amdgpu is also hitting this, or is this somehow i915 specifi=
c?

> > +     } else {
> > +             fbo->base.bulk_move =3D NULL;
> >       }
> >
> >       dma_resv_init(&fbo->base.base._resv);
>
