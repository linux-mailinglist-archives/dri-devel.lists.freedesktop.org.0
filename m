Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2B3A1EB4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFE76E3AC;
	Wed,  9 Jun 2021 21:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8DD6E23B;
 Wed,  9 Jun 2021 21:14:22 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 v27-20020a056830091bb02903cd67d40070so22301305ott.1; 
 Wed, 09 Jun 2021 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ufi2FMAuPcpe+FPh/mofpHrmjo2M1TXQM9bY6dxEWt0=;
 b=kxU84jqqRnfGbMPVambFLhN+Wu6tjIjs7VxY9gOo+ZYD77GblJypR21ipnLcWaV5jn
 hQisiL8uu5yGlo6wlvOy0q1ygVEshCpUx710mZsulABXsidQzxP4W2h5yvvxulZKPoAW
 8XXW9j2z3wt3A0S2Z5AB+Gn6tHC9Q/e9qsp7y/zfYwj69dZx/wf2ZsDwpVFUd1uc5kkQ
 qJW8d1fJjr46gDAYAqIjeNK+Y5aXYpthffUJ3Vjoe5wf8jQJXlkElJh8Wlfol6bh4TmZ
 NMwyx+HP/UH+Kc1JETq/f09an6gA9USNzujPs5vQFi9XLQSjbwTeJ0vxQRvRVb4UFmeh
 kgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ufi2FMAuPcpe+FPh/mofpHrmjo2M1TXQM9bY6dxEWt0=;
 b=jBVj5MBGd+cukzjSikkZ39L4knaKOHAV/s4y/d99NhTmdGx5MemSFGCPuibjV4BEUv
 r/kQ4+5G+dOK5gK6jXQcd7K+ol/03J7B7YYPV8IBbp9y+G1LGoC4TxmDz8E3qgteq7x5
 klfwHEX30EJUk3SjT2+832iWDxRfIy9gdYqE1aNSSUDpRYkBc9qTD4At5BBPoMwHyMjm
 y7q1z7QskPNL1tBublKVOj9iMM1FXyrzJpqrt0QnhhZipdzmrjJYDgd9AdsuanOPU2rv
 fxdNdVrOBlVfmD56KZW7UScjy+3x6S3C7cW1KWKlVw87HdxhkqY+CZWRaa4NCF8bP9dE
 B64Q==
X-Gm-Message-State: AOAM530PH4uiVdNaHBx4WR9EUqb9SXlAsHpLtd8f0lpT7vPp42/AT+WT
 se+g8l0RTpeYqRF92zS+2wGv+jFj/Iu6pbcuPTOzd2KO
X-Google-Smtp-Source: ABdhPJyJHvOi2PyHn0NN80TysiKqaKIq2lyM4e6v/SOEeznvp5dZTp1sgTC5Lb96c1uf5k4v9trihlsAS9LMSW5+lds=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1155557otl.311.1623273261909; 
 Wed, 09 Jun 2021 14:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210608030126.23206-1-wanjiabing@vivo.com>
 <20210609184326.wuyxpphkx3cor2je@outlook.office365.com>
In-Reply-To: <20210609184326.wuyxpphkx3cor2je@outlook.office365.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Jun 2021 17:14:10 -0400
Message-ID: <CADnq5_Mri2JVWNKgKrk+M7n7+WctiE_e4UWOjkgDZLtpC+1LuQ@mail.gmail.com>
Subject: Re: [PATCH] drm: display: Remove duplicate include in dce110
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
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
Cc: Ashley Thomas <Ashley.Thomas2@amd.com>, Jake Wang <haonan.wang2@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jun Lei <jun.lei@amd.com>, Lee Jones <lee.jones@linaro.org>,
 Wan Jiabing <wanjiabing@vivo.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Yao Wang1 <Yao.Wang1@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, Chris Park <Chris.Park@amd.com>,
 Hugo Hu <hugo.hu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jun 9, 2021 at 2:43 PM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> On 06/08, Wan Jiabing wrote:
> > Fix the following checkincludes.pl warning:
> > ./drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> > 35      #include "dce110_hw_sequencer.h"
> >     69  #include "dce110_hw_sequencer.h"
> >
> >
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> > index a08cd52f6ba8..e20d4def3eb9 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> > @@ -66,7 +66,6 @@
> >
> >  #include "atomfirmware.h"
> >
> > -#include "dce110_hw_sequencer.h"
> >  #include "dcn10/dcn10_hw_sequencer.h"
> >
> >  #define GAMMA_HW_POINTS_NUM 256
> > --
> > 2.20.1
> >
>
> lgtm,
>
> Thanks
>
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
