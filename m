Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43D67B6E2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 17:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72B610E012;
	Wed, 25 Jan 2023 16:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4E910E090;
 Wed, 25 Jan 2023 16:24:34 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o20so29824570lfk.5;
 Wed, 25 Jan 2023 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qppBy+JaBy9Y4vz77C0qYK1g4SYew5OD3+Bb7TRzwA8=;
 b=LQh+zv1ERGJtZoWDAo8bLGxoTZfrcAUnpL80SDVAlMSeaZ/Mn/FFoK3SR7Lq3+/GuV
 Mx5hFvpm+FdmCSj+YlV/+wxw4rBHk7VdMbd8gNOFymPivIuxdowVuTV0UN8kndRsyLAm
 wWnomzULeJHxYnnBrJ6jqB2+XhO8kvsTIJc2PvW6Kj7uNedXx+CCnknqZgnoivr93+ko
 b1EaTJw0BS3+zhc0VJoRKu46ql1rwrY7do3gY4TInQy/NgJmPLdq27XNFNMh0GHn36SO
 kEve5quRujnVofcOiPkfIpaY83JNAbQjjV4rssF4UnG1oTV7ZLL+0oOrEfYpJzjBwwf3
 Mo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qppBy+JaBy9Y4vz77C0qYK1g4SYew5OD3+Bb7TRzwA8=;
 b=6oKsVnH9LjAsejLBpSLwC0fK+ynr2+AgyHA9vhbuQeOfNrNncSmPCeYqsgL7r/A4ie
 uQVDGVqD76NUT2+nuxlFGNuesXAbkhSk3l+oAOLMCHG0qdpxW38XpvQfCu2GOjcKP0Zy
 m8aTkkjYk9jIYUGD8l8kzC1G/QDPsGQ22VqICjVxajnta3SQM0EKlWXQbcINmUwmA0l0
 aA6AhgDPx0ofngUhzwU4GOdwJdvIqslRRxLlaPFrSLpj6j4Bohc6Ew0LLau2/Lr3DOst
 A7KUcoEgtKPQiEaz1shWKs686dUaO7WoihCpN5TTPOJEycRLks7ANWK0DiUrLB/QqKrB
 Tt8A==
X-Gm-Message-State: AFqh2kqTx4XCRiNVBvQ2gFZelrIp4hQ26HoK8BeVDimiBKY0BWZOHX69
 gUJbOuV/glblt9ZtQ4YtIYqORtBXDgRFAtvvvhw=
X-Google-Smtp-Source: AMrXdXunYgpdLkiA6n3U4RfTEBcU2pQ5Dw4kBS7BXrdLD75aLPaxzHFHx+MwnC3PWsgJZQEUmcxTOW6Ll9Lv7WPzv7A=
X-Received: by 2002:a05:6512:1303:b0:4d2:8b26:e27 with SMTP id
 x3-20020a056512130300b004d28b260e27mr1611397lfu.185.1674663872573; Wed, 25
 Jan 2023 08:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20230125155023.105584-1-christian.koenig@amd.com>
 <20230125155023.105584-2-christian.koenig@amd.com>
 <CAM0jSHPoXqLVCkC77JDURw-zSY6=ryDwA43xH9Y+D7uMiZOJVg@mail.gmail.com>
 <8e247c51-7ff0-fb2b-e62c-bc7071248fa9@amd.com>
In-Reply-To: <8e247c51-7ff0-fb2b-e62c-bc7071248fa9@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 25 Jan 2023 16:24:05 +0000
Message-ID: <CAM0jSHP8KULMcfjuTGNS5qxtiAyeNTFjP6eVBUU+F9aaS2s0xQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: revert "stop allocating dummy resources
 during BO creation"
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Jan 2023 at 16:15, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 25.01.23 um 17:13 schrieb Matthew Auld:
> > On Wed, 25 Jan 2023 at 15:50, Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> This reverts commit 00984ad39599bb2a1e6ec5d4e9c75a749f7f45c9.
> >>
> >> It seems to still breka i915.
> > We also need to revert the third patch:
> >
> > b49323aa35d5 drm/ttm: prevent moving of pinned BOs
> >
> > It introduces the side effect of no longer calling tt_create(true) in
> > ttm_bo_validate(), and I'm 99% sure that will break object clearing.
> > We rely on having a ttm_tt for the initial dummy placement, with
> > FLAG_ZERO_ALLOC set if clear is needed. Also I'm not sure who even
> > creates the ttm_tt now, if ttm_bo_validate() doesn't, and we don't
> > have the dummy move, like with this patch.
>
> Oh, yes of course. Can I add your Acked-by to reverting all three?

Yeah, feel free to add. I can then resend your series with the extra
stuff we need for i915.

>
> Thanks,
> Christian.
>
> >
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/ttm/ttm_bo.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo=
.c
> >> index 33471e363ff4..9baccb2f6e99 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >> @@ -957,6 +957,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, =
struct ttm_buffer_object *bo,
> >>                           struct sg_table *sg, struct dma_resv *resv,
> >>                           void (*destroy) (struct ttm_buffer_object *)=
)
> >>   {
> >> +       static const struct ttm_place sys_mem =3D { .mem_type =3D TTM_=
PL_SYSTEM };
> >>          int ret;
> >>
> >>          kref_init(&bo->kref);
> >> @@ -973,6 +974,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,=
 struct ttm_buffer_object *bo,
> >>                  bo->base.resv =3D &bo->base._resv;
> >>          atomic_inc(&ttm_glob.bo_count);
> >>
> >> +       ret =3D ttm_resource_alloc(bo, &sys_mem, &bo->resource);
> >> +       if (unlikely(ret)) {
> >> +               ttm_bo_put(bo);
> >> +               return ret;
> >> +       }
> >> +
> >>          /*
> >>           * For ttm_bo_type_device buffers, allocate
> >>           * address space from the device.
> >> --
> >> 2.34.1
> >>
>
