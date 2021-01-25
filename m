Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD043026AC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 16:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B7189AAD;
	Mon, 25 Jan 2021 15:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D5F89AAD;
 Mon, 25 Jan 2021 15:07:11 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id h14so12998034otr.4;
 Mon, 25 Jan 2021 07:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+tF4kaBNHVUeLz+neiR9EKFSH0RfBoOkuSe1R44I6w=;
 b=Hwq67MQmYVPMYCZWKjORrY407ayyGMAmuweF5bGKJREWfqd/R8Ho/W3mHhkxOLOlGX
 1O5S4cg5i+y1RKR41/AMivqX7Z3HDLSHKPOOyjXA25qfSm/GSGnJbe4YAyrky3nLLOrC
 eNd1d1HRJBKjJqbAXfaYM/8knALrtXO6suGrMIxnJ0XORv6p41Dksgh4wOQ1pFXC3gyR
 4TPE9WNGXbowkiHp05fB9CNkTuEiXcnoLwLaQkNFcA5hNSbndfXnmiCMpy9AE5nk1TOI
 23FkgL6bSWXk5vvS+HbTxZzShPWFwMwt8cFrZeL20/fiaBcB9Fkj+3qG0+KAH+TS1jSU
 5JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+tF4kaBNHVUeLz+neiR9EKFSH0RfBoOkuSe1R44I6w=;
 b=kZwVO9BeW/RM1iAD/AzrfDqIkIOZASzJzIcpP9DxeE0mFmawhkGPEigkXLkZMEGzuL
 kPL8evB8HvaeGinChoT+jN3BUnFtOkVhHbkXyiq7fEiEfYbGZa7WLRtDf8mQvPEXx5uR
 Iyq+eNYHt6XohvDIwvigS45wJy0K0QAzA3Z8k1h2+OLdhH83+RU1HfDkXumVGjG/CbtE
 Ivr75KS3fGv5tPnLsHNQ4yNvEeZO1/YG6RA+Jbk/tL27fM9rNhE0jeME5h0GHQryEr9c
 0HTY7ytYooqAD0W4PRwOJgwCVt2B4R7jXsDm+XTIgSWS376BgHm2CVdxjKMEa6qV7Stz
 4waQ==
X-Gm-Message-State: AOAM533x4IJQdlr7joPSlnWj/cSqt+03ssVT4g0HHob651g/PKkL3SWb
 ccSlgfC+ToQIOOG7i6GmJ7iK0xluT6S3pSibnUg=
X-Google-Smtp-Source: ABdhPJzLpiv5vCtKZgABLpe2a/nPpQqwY8M2+LbN3ZUR6u0pvsBbsKxXgCt2lRyPmJ3UDvMbTjbKzB9PzckuZRUW6tQ=
X-Received: by 2002:a9d:784a:: with SMTP id c10mr796878otm.132.1611587230413; 
 Mon, 25 Jan 2021 07:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20210122150022.209454-1-colin.king@canonical.com>
 <20210125043623.GD610615@hr-amd>
In-Reply-To: <20210125043623.GD610615@hr-amd>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 10:06:58 -0500
Message-ID: <CADnq5_PgXRv5LKO=yhx6NnYE4Et_PHa45JArAjorJ6W-GiDG2A@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: Fix masking binary not operator on two
 mask operations
To: Huang Rui <ray.huang@amd.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Liu,
 Aaron" <Aaron.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Jan 24, 2021 at 11:36 PM Huang Rui <ray.huang@amd.com> wrote:
>
> On Fri, Jan 22, 2021 at 11:00:22PM +0800, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the ! operator is incorrectly being used to flip bits on
> > mask values. Fix this by using the bit-wise ~ operator instead.
> >
> > Addresses-Coverity: ("Logical vs. bitwise operator")
> > Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Thanks.
>
> Reviewed-by: Huang Rui <ray.huang@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> > index 1961745e89c7..ab9be5ad5a5f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> > @@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
> >
> >       if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
> >               data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
> > -             data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> > +             data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> >                       DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
> > -             data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> > +             data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> >                       DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
> >                       DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
> >                       DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> > --
> > 2.29.2
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
