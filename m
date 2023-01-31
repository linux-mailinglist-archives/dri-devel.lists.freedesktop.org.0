Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7A6828E6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 10:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62910E319;
	Tue, 31 Jan 2023 09:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE28510E319;
 Tue, 31 Jan 2023 09:33:10 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y19so15328300ljq.7;
 Tue, 31 Jan 2023 01:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9ECooIcFbu5C1mGggvE7E2dQ8t0fyLVsQDAfjE5kEA=;
 b=d2DQM+MT8LFpCtb4n85XbkX9wwpCioorNPtn29H1zyJ1icZU6FwhlKr5uO5R6AKseo
 IFqcMPpHaJz+K8Lvns3ajauxGrPmmIxxzErCcfIO1SDUzwNQk+VYVk6MzbqSoECKyqOf
 TkFA/izx2K25mK2ZF/4+Tr2KNWBQ4yuLzvyx/7F5AuNuOSs1LLnBQZ+Baa5fVGeP2iOt
 9Bv5lSjohhZykNV46anoCDoe+g1NDETB/6ZO5mNxvWtQTEq06aKEag1yHHUJZq4it7MT
 ex62Vvc0MPUNoNtq+zJZSjdT93MgksM29ipSHtNKIBdc4D7oehXKXouSXq4PEGKEpQ26
 1Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9ECooIcFbu5C1mGggvE7E2dQ8t0fyLVsQDAfjE5kEA=;
 b=VQiDjmkmV4Ml6N7v3fWBP/RaQATDL8CD0xtImXI0jg6phTXvNWlKhs678jfTIKLnwb
 Mnt8u41YKMQfuX0g8Mzj3FOlNZt9/xw1j646gZdQQmAtMpa+du/K5r0ALwAHQdnOCjFA
 gdsi6JxvB1gF+O0ZfYxauhV0L3eTVHhWK9FbDjwkNyeJgSRCGsHUfr6Hh8UScYI9zws8
 KXpzoVUfRWn8UXrrxsyusbCHg9ckoCi0ZVeZhS1MMEP9NMq7jKcqCMYq1zN7y9XbCCGt
 NUbZzqq5yKmjxVVKykafcZg2qbtuly0eZ0BKv8Flt3KDEl8P8VbiTcvFBS5u+sQfdWLL
 YWMQ==
X-Gm-Message-State: AO0yUKVqUqCi3zfbu2QMnZ4WIJoJkZSP5OxyceB7wgT0lJRrtnuQLXeb
 iWL8aQtstbVVn9NwMkFDY8BCOdGTswYB1JUguR/bnxRVQ9VRjA==
X-Google-Smtp-Source: AK7set8/COOTQHvjvlm8e2edTncISJaS3cRKlrSC5V6HWCNbzjL3Sx7ChZerq6/3305ODtArb2oCNtY/olpgaLK5EHc=
X-Received: by 2002:a2e:8248:0:b0:28d:756a:5ade with SMTP id
 j8-20020a2e8248000000b0028d756a5ademr2000341ljh.85.1675157589017; Tue, 31 Jan
 2023 01:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20230125155023.105584-1-christian.koenig@amd.com>
 <20230125155023.105584-2-christian.koenig@amd.com>
 <CAM0jSHPoXqLVCkC77JDURw-zSY6=ryDwA43xH9Y+D7uMiZOJVg@mail.gmail.com>
 <8e247c51-7ff0-fb2b-e62c-bc7071248fa9@amd.com>
 <CAM0jSHP8KULMcfjuTGNS5qxtiAyeNTFjP6eVBUU+F9aaS2s0xQ@mail.gmail.com>
In-Reply-To: <CAM0jSHP8KULMcfjuTGNS5qxtiAyeNTFjP6eVBUU+F9aaS2s0xQ@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 31 Jan 2023 09:32:41 +0000
Message-ID: <CAM0jSHMXe75dfD516sUkFK9ncwaxnSKLBo2tjDsoYzSjNkpyrg@mail.gmail.com>
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

On Wed, 25 Jan 2023 at 16:24, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Wed, 25 Jan 2023 at 16:15, Christian K=C3=B6nig <christian.koenig@amd.=
com> wrote:
> >
> > Am 25.01.23 um 17:13 schrieb Matthew Auld:
> > > On Wed, 25 Jan 2023 at 15:50, Christian K=C3=B6nig
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >> This reverts commit 00984ad39599bb2a1e6ec5d4e9c75a749f7f45c9.
> > >>
> > >> It seems to still breka i915.
> > > We also need to revert the third patch:
> > >
> > > b49323aa35d5 drm/ttm: prevent moving of pinned BOs
> > >
> > > It introduces the side effect of no longer calling tt_create(true) in
> > > ttm_bo_validate(), and I'm 99% sure that will break object clearing.
> > > We rely on having a ttm_tt for the initial dummy placement, with
> > > FLAG_ZERO_ALLOC set if clear is needed. Also I'm not sure who even
> > > creates the ttm_tt now, if ttm_bo_validate() doesn't, and we don't
> > > have the dummy move, like with this patch.
> >
> > Oh, yes of course. Can I add your Acked-by to reverting all three?
>
> Yeah, feel free to add. I can then resend your series with the extra
> stuff we need for i915.

https://patchwork.freedesktop.org/series/113484/

CI appears to be happy now. Feel free to merge the series.

>
> >
> > Thanks,
> > Christian.
> >
> > >
> > >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >> ---
> > >>   drivers/gpu/drm/ttm/ttm_bo.c | 7 +++++++
> > >>   1 file changed, 7 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_=
bo.c
> > >> index 33471e363ff4..9baccb2f6e99 100644
> > >> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > >> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > >> @@ -957,6 +957,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev=
, struct ttm_buffer_object *bo,
> > >>                           struct sg_table *sg, struct dma_resv *resv=
,
> > >>                           void (*destroy) (struct ttm_buffer_object =
*))
> > >>   {
> > >> +       static const struct ttm_place sys_mem =3D { .mem_type =3D TT=
M_PL_SYSTEM };
> > >>          int ret;
> > >>
> > >>          kref_init(&bo->kref);
> > >> @@ -973,6 +974,12 @@ int ttm_bo_init_reserved(struct ttm_device *bde=
v, struct ttm_buffer_object *bo,
> > >>                  bo->base.resv =3D &bo->base._resv;
> > >>          atomic_inc(&ttm_glob.bo_count);
> > >>
> > >> +       ret =3D ttm_resource_alloc(bo, &sys_mem, &bo->resource);
> > >> +       if (unlikely(ret)) {
> > >> +               ttm_bo_put(bo);
> > >> +               return ret;
> > >> +       }
> > >> +
> > >>          /*
> > >>           * For ttm_bo_type_device buffers, allocate
> > >>           * address space from the device.
> > >> --
> > >> 2.34.1
> > >>
> >
