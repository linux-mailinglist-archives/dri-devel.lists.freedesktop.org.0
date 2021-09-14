Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157340B856
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59B66E55E;
	Tue, 14 Sep 2021 19:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476D6E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:48:44 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id 6so786358oiy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 12:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F6PsShm2+LtRfF7zvUBuZb6sWSvD0FefZC4vf11za4g=;
 b=ftEVYmXtzBqtgPMuCUQK92nlXhVyaFSoDT+bYIlkiiKIMvqDadH4mSO1dIERn4gEEd
 +mCNnBQyYzd05jfVb6q5g36anr9co8J9dyiiABNwHw03o68G4BNeRVVNhDFroiB76Pgy
 J9A7KrlRcXjhoqiXdv1Kacuqks5rjrufLzjT6YSXt1n6aKj5bd00EqSTswj2YCnmYyu8
 bW7q4vl4/62EpYskk3Y/MHbVEmrMLV0C78/i7u8ArT7KrN2QqJXDvr2CfH53djfockAA
 XLbEolIWFIhVJgWPc7g1czGR/DoQRyuLptt1gjUjQ0oOcr88ArF+pixVCFa3ZXU63rrw
 e3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F6PsShm2+LtRfF7zvUBuZb6sWSvD0FefZC4vf11za4g=;
 b=Z5FTvpeyHEuM3FpfiY3OmK6YMtOYUiljLj5T5fPlgDVecSBPWUOx2MOdXRgvObgi/Q
 UDuT4uvK5LZQRt89iTB/DSKkdI7RithojdOfHHr5cFiiAOXzskQr5oIpTMg/BAI/WCBA
 9cw/CBz7hG8WiZmUeSn7Cn31Hntc/kp85twPedyuliH6GJYg1XH93I4POifAubosON1d
 rSiBzstsHR7Tgkq7qylEFa9QhS3+q+FVoJO2RI/4+9B/zMrznDcaotHSg+VXG2AMVecs
 19IT80YJAAUMrXE1ar/L9QwSd85fuqTu/mbLm8DvT5Jq34qp/a4P+J9fzeUW9mR+K3JC
 lYQA==
X-Gm-Message-State: AOAM53277Vk2VoqGGqJOezvHcX9Rj2JLAEq8NhyFaorP76NsthHqmLgK
 GQLgKK09Tvlooag/iVVCHNDLYic1TdAS//HLLlg=
X-Google-Smtp-Source: ABdhPJzmulVOve408+d4uWpQ3W0uTIjd3laX3vXZVJhsV8TXYBfwuMi48nlWry2DHtJD3C+p6c+qNZFmnxMn9erjRwc=
X-Received: by 2002:aca:ab06:: with SMTP id u6mr2676900oie.120.1631648922227; 
 Tue, 14 Sep 2021 12:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210907100302.3684453-1-ray.huang@amd.com>
 <5e365947-4ae1-47a0-7565-7f0cdde0bd84@amd.com>
In-Reply-To: <5e365947-4ae1-47a0-7565-7f0cdde0bd84@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Sep 2021 15:48:31 -0400
Message-ID: <CADnq5_PXOXiob3k5Z+cZz6K2k5iSCdzwNm0ZxKQOuC+PvdJxxg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix the type mismatch error on sparc64
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 LKML <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 7, 2021 at 6:25 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 07.09.21 um 12:03 schrieb Huang Rui:
> > __fls() on sparc64 return "int", but here it is expected as "unsigned
> > long" (x86). It will cause the build errors because the warning becomes
> > fatal while it is using sparc configuration. As suggested by Linus, it
> > can use min_t instead of min to force the type as "unsigned int".
> >
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Is one of you going to push this to drm-misc?

Alex

>
> > ---
> >   drivers/gpu/drm/ttm/ttm_pool.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index af1b41369626..c961a788b519 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -382,7 +382,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct tt=
m_tt *tt,
> >       else
> >               gfp_flags |=3D GFP_HIGHUSER;
> >
> > -     for (order =3D min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
> > +     for (order =3D min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages=
));
> > +          num_pages;
> >            order =3D min_t(unsigned int, order, __fls(num_pages))) {
> >               bool apply_caching =3D false;
> >               struct ttm_pool_type *pt;
>
