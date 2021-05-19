Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50183893F8
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 18:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428996E204;
	Wed, 19 May 2021 16:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1891A6E204;
 Wed, 19 May 2021 16:40:32 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so3143101ool.1; 
 Wed, 19 May 2021 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zNCfFA3iTUAR7nfw2vDgYPSNzR16vnK0bYbOgvyHvMI=;
 b=ElwNI54ICQy3kLGRhcPRnjiEVKd3grPlIaCHCbVvlnT7UyBehL+duguyaJuDEGeNla
 LIdGAtPIvVlErfA8WvAp5FJCC1FFRQt4/WlVJTp+Pcoiqg/57+940JXyVdZuB3a7iq2L
 NYwE0kpUTx16BXX+vhmGwwPtFTiQiM+Pvd23jNVrj7OWYXvkP4vzj3xXV2BWXLBhQEJk
 N94EiZmPdTZNWD9NgsXHy9t0wyAPIjVJfY6UH9Ytw+qWHWgABlkV0tfKGImOI5juAq+K
 1wljiSP3B0bzUNflsGoTfpCOITy/YKmiw5Z4UgEjl2iPk7QSQD9jjDv7zhUQ248Kpizr
 7Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zNCfFA3iTUAR7nfw2vDgYPSNzR16vnK0bYbOgvyHvMI=;
 b=kna1SQJQjqwAsb0dROpt1tjq8ghchPP+M2W8H3P8kSGJD6qMNZQxpmZy5ctqVpDEEA
 UdiTYaSWmbucNI6kkTv7lHBHjTKIS5bNEot2RoEv0k+6mkXDAyZ+Ng4fEcO2/w6hZuD6
 gOSPBFz30ZR452pKvlgL8Mvxny11V6+hcjF9MpFhj50hDmM2I/nLEDqfrLDeIh9OEgI5
 +2vZ2lGimxNlObCGb3Gi8sZnsMy4mlI4xNrQJZ0FE+cZYFWZkQcd+pzVROxYuuAIx3RS
 iz7u6Elq0L4jW62TVZtDHEhtsuOB5LLj+Q7SDTjd2HOBCP/KgStdyQjXQKz7dj7NYOtM
 dhwg==
X-Gm-Message-State: AOAM532o5LB8ok+hDl+O0GjR549OBxbg/SP0jnrQklM4CIo5ad8wACbW
 3DNaovREIwv3csDJ2AQEk6THxgw+vUvsGB9c4mM=
X-Google-Smtp-Source: ABdhPJw+067c2L/99GOWZARWXw0ORPgXXpEmAbt8nOwAFfgxloS+AgmpmBOVRQ9uXbAXbjRbOfYF6KedqOaKfQta3Fk=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr142853oor.61.1621442431315;
 Wed, 19 May 2021 09:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
 <f0589aff-a776-0715-e421-0d9a8cf2cc25@infradead.org>
In-Reply-To: <f0589aff-a776-0715-e421-0d9a8cf2cc25@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 May 2021 12:40:19 -0400
Message-ID: <CADnq5_OjJTfwhbEBMFoM-zux8CPDgQhi_6FHpcFYVXYn+CZR7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: drm: replace occurrences of invalid character
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed out to drm-misc-next.  Also fixed up Michel's name.

Alex

On Wed, May 19, 2021 at 11:56 AM Randy Dunlap <rdunlap@infradead.org> wrote=
:
>
> On 5/19/21 1:15 AM, Mauro Carvalho Chehab wrote:
> > There are some places at drm that ended receiving a
> > REPLACEMENT CHARACTER U+fffd ('=EF=BF=BD'), probably because of
> > some bad charset conversion.
> >
> > Fix them by using what it seems       to be the proper
> > character.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>
> > ---
> >  drivers/gpu/drm/amd/include/atombios.h       | 10 +++++-----
> >  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  2 +-
> >  drivers/gpu/drm/i915/i915_gpu_error.h        |  2 +-
> >  drivers/gpu/drm/r128/r128_drv.h              |  2 +-
> >  4 files changed, 8 insertions(+), 8 deletions(-)
> >
>
> --
> ~Randy
>
