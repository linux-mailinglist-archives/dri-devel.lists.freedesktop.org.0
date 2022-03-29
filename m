Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDD4EAC30
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC86B10E87C;
	Tue, 29 Mar 2022 11:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D363310E87C;
 Tue, 29 Mar 2022 11:25:09 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id f3so14061597qvz.10;
 Tue, 29 Mar 2022 04:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BsX4IK1m/eTe/5/97NvZLD6cVDlN6y4v/6MdsVBOl+g=;
 b=KkD2SJHkXgG3CrliSHHZ8sBu9RUUiTccFrTV8VwrxxyrlpF1/HpYg6aUZGXlZfhJrO
 WXsDetp5nAkHz2q4bP//nW7dXZW+6R+3CgAiFgbygrGqUyte4Zpv9mqGcGz1Ah9JGwWn
 rRfDGZp4E+fWgsDx1FlJTQpbZR8Vk3uLBjnv18UDy7ZFzm6oGBfar10FqgTRPeQenLeq
 mMyGzqW2fJLxzKZ9Bk71nUfY+W/fjmXnG3CumpchW6eU8Fm+JmA2ipTV/0N/WM3lc7X0
 HemFwvuWeQJS0ZmqlfviXUbSEK1kPm/Ayf7oNlDgqbbqGm8rEYsmPMKVmk9cm8Hwrdqd
 PtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BsX4IK1m/eTe/5/97NvZLD6cVDlN6y4v/6MdsVBOl+g=;
 b=KZQi42WnbDRB0sRtmfpqGLHwSGkr8uyw1ETH3JTI6CdruBq8i5ADZEUAVHKMCLG2hQ
 qdZhicGMTzSybf53bOT+2cNnv2THicwvDxZGRx2+HqCrH+LKSDddM4y/eEQdl3kCkww6
 Hf4YXNpzGocGzsDRiaUwaI2MfrapYfzuL9/PF/m/2cHHhc27s/wcNdzuuXIA8F2yZSK/
 05veNd1cUoFlN+8+3fr3Z26TiCvDYFNLIXRWknYODAhAVch5QV1HtQp7zy/dUjPjNG/E
 YhCNHUML7hGYRiH2ypEB5tcYp32UpBvq6CJT1X3aYISmNd8gk3taoPI+75j5Crl9EnXn
 59pQ==
X-Gm-Message-State: AOAM531LtQtyRarLzirKAzLgQ/VEd72bNHki1Obu+87047Lij7wcfcGV
 pj0wqh5gakTPwiAIjkWuWStdhTzOQOncBEV+seU=
X-Google-Smtp-Source: ABdhPJwpztAa0BAxYGDaw5M3Fkj69t/LNdJGM1i+4o1dMs06zp5DIKIzjWOL1bv74NUvAWqWoAPyF3eUMNVGxiDjbrg=
X-Received: by 2002:a05:6214:2344:b0:429:4d92:cec2 with SMTP id
 hu4-20020a056214234400b004294d92cec2mr24472095qvb.0.1648553109001; Tue, 29
 Mar 2022 04:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220323073426.228866-1-Arunpravin.PaneerSelvam@amd.com>
 <72e9b499-f31f-41d3-aee2-130f83115fc1@gmail.com>
 <66f75c1b-41e1-5f96-cad7-aeffb95ce712@amd.com>
In-Reply-To: <66f75c1b-41e1-5f96-cad7-aeffb95ce712@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 29 Mar 2022 12:24:44 +0100
Message-ID: <CAM0jSHMZUUj70JCMDogWdzxxk1sJj7MsVprTkN-bnSUeUg1C6Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm: add a check to verify the size alignment
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Mar 2022 at 12:17, Arunpravin Paneer Selvam
<arunpravin.paneerselvam@amd.com> wrote:
>
>
>
> On 23/03/22 1:15 pm, Christian K=C3=B6nig wrote:
> > Am 23.03.22 um 08:34 schrieb Arunpravin Paneer Selvam:
> >> Add a simple check to reject any size not aligned to the
> >> min_page_size.
> >>
> >> handle instances when size is not aligned with the min_page_size.
> >> Unigine Heaven has allocation requests for example required pages
> >> are 257 and alignment request is 256. To allocate the left over 1
> >> page, continues the iteration to find the order value which is 0
> >> and when it compares with min_order =3D 8, triggers the BUG_ON(order
> >> < min_order). To avoid this problem, we added a simple check to
> >> return -EINVAL if size is not aligned to the min_page_size.
> >>
> >> v2: Added more details to the commit description
> >>
> >> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.c=
om>
> >> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> >> ---
> >>   drivers/gpu/drm/drm_buddy.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> >> index 72f52f293249..b503c88786b0 100644
> >> --- a/drivers/gpu/drm/drm_buddy.c
> >> +++ b/drivers/gpu/drm/drm_buddy.c
> >> @@ -661,6 +661,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> >>      if (range_overflows(start, size, mm->size))
> >>              return -EINVAL;
> >>
> >> +    if (WARN_ON(!IS_ALIGNED(size, min_page_size)))
> >> +            return -EINVAL;
> >> +
> >
> > I'm not that happy with the handling here.
> >
> > See a minimum page size larger than the requested size is perfectly
> > valid, it just means that the remaining pages needs to be trimmed.
> >
> > In other words when the request is to allocate 1 page with an alignment
> > of 256 we just need to give the remaining 255 pages back to the allocat=
or.
>
> In one of the previous mail Matthew explained that i915 expects to
> return -EINVAL error code if size is not aligned to min_page_size.

We could also move the WARN_ON() into i915 as a separate patch, and
just change the default buddy behaviour to transparently handle the
rounding + trim, if you prefer. I don't have a strong opinion.

>
> can we just modify in amdgpu code where we round_up the size to the
> min_page_size value and keep this error handling in drm_buddy.c?
> >
> > Regards,
> > Christian.
> >
> >>      /* Actual range allocation */
> >>      if (start + size =3D=3D end)
> >>              return __drm_buddy_alloc_range(mm, start, size, blocks);
> >>
> >> base-commit: 056d47eaf6ea753fa2e21da31f9cbd8b721bbb7b
> >
