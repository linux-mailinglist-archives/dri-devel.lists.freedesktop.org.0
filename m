Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4CD3C605D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 18:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D1889D5B;
	Mon, 12 Jul 2021 16:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5D789D53;
 Mon, 12 Jul 2021 16:22:53 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id 18so1429926qka.0;
 Mon, 12 Jul 2021 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=91K9fVSqD7weIFhTBGPdZoWmFd1uNebYt0kdpf0Fcos=;
 b=mAtOy7kE1GoHX/dACCRPGowBhQ2PDL92s+EWROICJxR3udof3FZESHfyA3/PE2G4n/
 XSVfAVk1ljdFgMDpOs6ma4ZCqxaxBWSV1NlIFMx/zUCnY+Ql3nH2TUEenHIiY/2wa7CP
 tNtWvyjHfuvbfA3TldA2uhTQA7GtjPhPCNNI2VCwfQoy/HrfZ0eIGBNmekc/A5/8eBsB
 Ot3gIT8MBh1IQP2eEnPBtIvmZy0Mk1I5aSAqt+/R/EA1DNRzg9vwcqwwDmv7v/UbHLGm
 Cxeow6v1yOzZQ93AjWLI0iT2YL6Dt4u5eTKMiI25QVLCqxhfz1hJhX9/cOug5S/f2CZL
 7Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=91K9fVSqD7weIFhTBGPdZoWmFd1uNebYt0kdpf0Fcos=;
 b=pO2Wonwvb5feRYOpPo9xDV0Ym8ehanCuVrt9V6n3HLZo5xSgFzO3Lvpb3DQF/Ub75l
 obKP95XnNTVfhGobva3abIGPqlW53trLYqJwe1D02lPD7WW2T66NxbW3ZTNonJkL3VCQ
 1a2/Kgbv7mhJroUA9mQzvW/CSuIcXNpTQJsmZAAzBXyW7t5QCXJpyyH+7DuHPDJEiaon
 ID8jDwqOeu6Mhl1oC5c4Ir8zFCoKKTj7L0qo2AHJ7Iqigknjdr2cKsXbAUYkx0oPImVC
 5wR3RsQ/ookwXfVsNfeiqzNhFnSia22x/iWj7uxkWcKnhhkhBAD/l6v/CqlPos4vK0tH
 i5oQ==
X-Gm-Message-State: AOAM533yLYXeRoIpLADSXh+4l4GeKjceU4rV+PIu4f03wK5VEv1VgBF4
 rN9CeDvIHgycdYQfUKGPx2v0DjuKjo0FbtAk2Uk=
X-Google-Smtp-Source: ABdhPJxEJ9vdrHgKV2C5yvulxCqCUUQ8ONuFDpIzr6wLyzuk6Zq5sB/ptc+kXP8Vdfcg2aDm9ppAMVXR4J18HIWNqE0=
X-Received: by 2002:a37:9e07:: with SMTP id h7mr28939942qke.481.1626106972262; 
 Mon, 12 Jul 2021 09:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <161dac7a-5aad-150e-7c14-7bb195ecf30f@canonical.com>
In-Reply-To: <161dac7a-5aad-150e-7c14-7bb195ecf30f@canonical.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 12 Jul 2021 17:22:23 +0100
Message-ID: <CAM0jSHMO052Tcr_EMKDioOedHuX-foxz7_ejRVSLZuK8j+j9tA@mail.gmail.com>
Subject: Re: drm/i915/ttm Initialize the ttm device and memory managers
To: Colin Ian King <colin.king@canonical.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Jul 2021 at 16:17, Colin Ian King <colin.king@canonical.com> wro=
te:
>
> Hi,
>
> Static analysis with Coverity on linux-next has found a potential issue
> in drivers/gpu/drm/i915/selftests/intel_memory_region.c in function
> igt_mock_fill - the problematic commit is as follows:
>
> commit d148738923fdb5077089e48ec15555e6008100d0
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Date:   Wed Jun 2 10:38:08 2021 +0200
>
>     drm/i915/ttm Initialize the ttm device and memory managers
>
> The analysis is as follows:
>
>
>  49 static int igt_mock_fill(void *arg)
>  50 {
>  51        struct intel_memory_region *mem =3D arg;
>  52        resource_size_t total =3D resource_size(&mem->region);
>  53        resource_size_t page_size;
>  54        resource_size_t rem;
>  55        unsigned long max_pages;
>  56        unsigned long page_num;
>  57        LIST_HEAD(objects);
>  58        int err =3D 0;
>  59
>  60        page_size =3D mem->chunk_size;
>  61        rem =3D total;
>  62 retry:
>
> value_overwrite: Overwriting previous write to max_pages with value from
> div64_u64(rem, page_size).
>
>  63        max_pages =3D div64_u64(rem, page_size);
>  64
>  65        for_each_prime_number_from(page_num, 1, max_pages) {
>  66                resource_size_t size =3D page_num * page_size;
>  67                struct drm_i915_gem_object *obj;
>  68
>  69                obj =3D i915_gem_object_create_region(mem, size, 0);
>  70                if (IS_ERR(obj)) {
>  71                        err =3D PTR_ERR(obj);
>  72                        break;
>  73                }
>  74
>  75                err =3D i915_gem_object_pin_pages_unlocked(obj);
>  76                if (err) {
>  77                        i915_gem_object_put(obj);
>  78                        break;
>  79                }
>  80
>  81                list_add(&obj->st_link, &objects);
>  82                rem -=3D size;
>  83        }
>  84
>  85        if (err =3D=3D -ENOMEM)
>  86                err =3D 0;
>  87        if (err =3D=3D -ENXIO) {
>  88                if (page_num * page_size <=3D rem) {
>  89                        if (mem->is_range_manager && max_pages > 1) {
>
> Unused value (UNUSED_VALUE)
> assigned_value: Assigning value from max_pages >> 1 to max_pages here,
> but that stored value is overwritten before it can be used.

Yeah, that doesn't look good.

AFAIK this should be fixed with d53ec322dc7d ("drm/i915/ttm: switch
over to ttm_buddy_man"), which is in drm-tip, but I guess has not made
its way over to linux-next yet.

Thanks for the report.

>
>  90                                max_pages >>=3D 1;
>  91                                goto retry;
>  92                        }
>  93
>
> The right shift to max_pages on line 90 is being overwritten on line 64
> on the retry.
>
> Colin
