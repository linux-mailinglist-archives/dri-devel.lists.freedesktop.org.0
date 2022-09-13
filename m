Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629DD5B7A61
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 21:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4297B10E19D;
	Tue, 13 Sep 2022 19:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6278F10E19D;
 Tue, 13 Sep 2022 19:00:20 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so24968572fac.13; 
 Tue, 13 Sep 2022 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=7vLGPoZcwxwyAMQ2FOW2Q+MT6R6bBUQMkdryQVleexY=;
 b=IAfel4ArdHR6a+qEBk+j0xzunOgqu810cS/s5f1alwl18EG6KcWFqnS96d5Xr4NQtO
 vZUlVXXvmPQSeeYVwtyRTt90akxfTFtcQp0+jvrUNNKltvhbrWH+bHIAptrDsBKl0xUc
 ZgT6k07c+nU/ORBOqryAlfmX6c4L2mov7avXWYEbvEvV7UcB7qJyVymBD+o4oQ4m3mXS
 eHBuObmyXUcoMMWM9lfCxuFz1t1hIS0RscfaLQEjbhn8ocNnz77OkRLv1phHiDKBE7Ab
 aUkfAMdYJjlm6xj3AkIyJ01qajj9fpBacV1aVNOMQWjDqQ2nrSn0E99fNnpFt53QAQBu
 O1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7vLGPoZcwxwyAMQ2FOW2Q+MT6R6bBUQMkdryQVleexY=;
 b=CUN3Ap6iZPcb8GtNN3Pi6xMgH6PyxH0BlQB1lmFQfxJvtDp0S76MXU4dY4sgKh12i/
 cL6iV0bIbbPw5z2ml/n2SwBfh+el6owUFiUTDqJMbedJYNS0JgrvPnGE1P5OZHjj/XLF
 xfxUUXNt0DHr/m7UwGwJlLEoy4j8/cPB0qvTetN3e83+72sXGB0w8R4q/JaS2Aepy4ca
 QDJxdjY8fbohjKVmFKtXUb6rnOvbtKLHhC2xCL+CAI6erKvpI7Yi6MW/h8NTrY0bQA7l
 QmBSM3sSpWaBSsPT+i0HUbLsc6Nz9a8F4pK9EL+gUbSo2gVIKp5KrBaYhuUR9lBPaIK5
 m1ow==
X-Gm-Message-State: ACgBeo1OAzoOIqR5nuEwf8uv2V6QbPEoyv5fo/Hcf56CRDpIR8lwNHmQ
 DIrUpaGwX1kb7+6+tqq9eseUGaSpc4bF6jr1tg0=
X-Google-Smtp-Source: AA6agR5T1LNTrQ0eYDkV2suw2Dy4czl+0Og58CBZ0JdqFa6Gsc+2p4xcS0tc9hqnEYhwhkkt3mn0Sy4mS5gbIdQUgRo=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr453599oae.46.1663095619642; Tue, 13 Sep
 2022 12:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220913024847.552254-1-cuigaosheng1@huawei.com>
 <22ba001b-82d9-e7fd-3ced-978e3608bd7d@amd.com>
In-Reply-To: <22ba001b-82d9-e7fd-3ced-978e3608bd7d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Sep 2022 15:00:08 -0400
Message-ID: <CADnq5_PrPJUdgYZ+uaVt1fcjocK0-MeJ3jTtpGEefJQz3kcf_g@mail.gmail.com>
Subject: Re: [PATCH 0/6] Remove unused declarations for gpu/drm
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@linux.intel.com,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Xinhui.Pan@amd.com, John.C.Harrison@intel.com,
 lijo.lazar@amd.com, daniele.ceraolospurio@intel.com,
 linux-graphics-maintainer@vmware.com, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, evan.quan@amd.com, amd-gfx@lists.freedesktop.org,
 Gaosheng Cui <cuigaosheng1@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed patches 1-5 to drm-misc-next.

Alex

On Tue, Sep 13, 2022 at 2:14 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Nice cleanup. Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> f=
or
> the whole series.
>
> Thanks,
> Christian.
>
> Am 13.09.22 um 04:48 schrieb Gaosheng Cui:
> > This series contains a few cleanup patches, to remove unused
> > declarations which have been removed. Thanks!
> >
> > Gaosheng Cui (6):
> >    drm/vmwgfx: remove unused vmw_bo_is_vmw_bo() declaration
> >    drm/radeon/r600_cs: remove r600_cs_legacy_get_tiling_conf()
> >      declaration
> >    drm/radeon: remove unused declarations for radeon
> >    drm/gma500: remove unused declarations in psb_intel_drv.h
> >    drm/amd/pm: remove unused declarations in hardwaremanager.h
> >    drm/i915: remove unused i915_gem_lmem_obj_ops declaration
> >
> >   drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h | 2 --
> >   drivers/gpu/drm/gma500/psb_intel_drv.h                 | 5 -----
> >   drivers/gpu/drm/i915/gem/i915_gem_lmem.h               | 2 --
> >   drivers/gpu/drm/radeon/r600_cs.c                       | 2 --
> >   drivers/gpu/drm/radeon/radeon.h                        | 3 ---
> >   drivers/gpu/drm/radeon/radeon_mode.h                   | 1 -
> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                    | 1 -
> >   7 files changed, 16 deletions(-)
> >
>
