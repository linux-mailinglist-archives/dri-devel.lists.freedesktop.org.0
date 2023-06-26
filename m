Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1104873E345
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A1E10E229;
	Mon, 26 Jun 2023 15:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14EE10E229
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687793258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhVNEcGfHP6r7iYI6uK5UQkeoNFVEouUiPU/UXitWVk=;
 b=MtYWnUz8fOw1BGK1nd3z+AGl+rmYyS2QyG9C/1a70xs3myRZ/ncHC39CqOcrFNJ6FOEHhQ
 dTxhVP/yNeXMeIC/N8DJ1rl2URFB3M51WpV7S3V0joEHQcl8SSnvwYdBNeLnyztpU+ZeGD
 AVj9+zgiPJYrxyvpSf4CSPVSPlAi6Gc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-UYedLYrrMrK-5mIXEUTgig-1; Mon, 26 Jun 2023 11:27:36 -0400
X-MC-Unique: UYedLYrrMrK-5mIXEUTgig-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-401e07ebf2dso5104961cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 08:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687793256; x=1690385256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhVNEcGfHP6r7iYI6uK5UQkeoNFVEouUiPU/UXitWVk=;
 b=VUyza6AUYGa4TlqHjValY1UWAyEqDixwS1wtePA96yR9QD2tVTxdKQ7f4RfN21EFOT
 1EKLaDVA3opK/DWPwGC3EsAlRSRyEsx0bp1PKdD5WJTR7/THAxmKfy4kjRJjk7bUUzTD
 G40kVtxQHvu9FPI6fQzRs0GK6L22W1WM654m66PQD8jzXoCt61eQ4r7pi+PyOHaXwydE
 2RTyJoSZzeEVbo1+PPH5i4dRnuEMnDfqMkVsYE/NaD3JvZAUofh5IrRTuQHP6ilIdhDp
 BdJcCFQ1jH0cNQ9DqGsnom8b5qdc6SchULt9f/lGoEgRzOCRQwhzktwM8c5Tna/YPX3+
 JCaQ==
X-Gm-Message-State: AC+VfDxtQ6DRkD9WcTOTJRfZeYvDlnV+Gzi9kTf84kTUYPfXGr3i7HFM
 SMVxhUymq3rpWGYJG7r2mZMByXJokz6BOwceKeePhv5HTeSq4X1+yUplx9qtPsIE+HgaNDTIPi3
 JRu2PSR13dqssjLGegEeqYQ82ghlj30W9pmby9Fv1+5zU
X-Received: by 2002:a05:622a:50f:b0:400:8fb3:8647 with SMTP id
 l15-20020a05622a050f00b004008fb38647mr8721386qtx.6.1687793255826; 
 Mon, 26 Jun 2023 08:27:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4TwvuXDKy9e+gI/3I+HhSR4c5+nrW+tY8HR6PT1g2FTGTp5mDJpijnD1fEtWSWZiFto+eJ4Zptasa++w84gzk=
X-Received: by 2002:a05:622a:50f:b0:400:8fb3:8647 with SMTP id
 l15-20020a05622a050f00b004008fb38647mr8721377qtx.6.1687793255624; Mon, 26 Jun
 2023 08:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230418171524.274386-1-npache@redhat.com>
 <881c1f7e-6740-478d-2512-11a5a99563ec@amd.com>
In-Reply-To: <881c1f7e-6740-478d-2512-11a5a99563ec@amd.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 26 Jun 2023 11:27:09 -0400
Message-ID: <CAA1CXcDMghE4xv7+QS8hVpC5gm34d=GUfDNhKL7iDx_ZPA4LKQ@mail.gmail.com>
Subject: Re: [PATCH] kunit: drm: make DRM buddy test compatible with other
 pages sizes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 davidgow@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: ddutile@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Thanks for the information! I am not very familiar with the inner
workings of DRM, so I'm not really in a position to make any large or
systematic changes to the test regarding the points you made. I am
mainly trying to allow the tests to be run on more diverse hardware.
From the looks of it this test has been adapted from an older test, so
perhaps this rule was set in place in the past.

Either way, I dont think my changes are going to break anything, so
for the time being I think this small change is the best approach.
Please let me know if you think otherwise.

David, do you still have this on your radar? We've been carrying this
as a RHEL-only since I originally posted it and have not noticed any
issues due to it.

Cheers,
-- Nico

On Wed, Apr 19, 2023 at 4:30=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.04.23 um 19:15 schrieb Nico Pache:
> > The DRM buddy test uses a fixed 12 bit shift to covert from pages to
> > bytes. This number is then used to confirm that (chunk_size < PAGE_SIZE=
)
> > which can lead to a failing drm_buddy_init on systems with PAGE_SIZE > =
4k.
>
> Since the buddy allocator is used for resources which are independent of
> the CPU PAGE size the later check is actually the broken one.
>
> E.g. neither in the buddy allocator nor in it's test cases we should
> have any of PAGE_SHIFT or PAGE_SIZE.
>
> Otherwise the allocator wouldn't work correctly on systems with a
> PAGE_SIZE different than 4k.
>
> Regards,
> Christian.
>
> >
> > Fixes: 92937f170d3f ("drm/selftests: add drm buddy alloc range testcase=
")
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   drivers/gpu/drm/tests/drm_buddy_test.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/t=
ests/drm_buddy_test.c
> > index 09ee6f6af896..a62b2690d3c2 100644
> > --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> > +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> > @@ -318,8 +318,8 @@ static void mm_config(u64 *size, u64 *chunk_size)
> >       s &=3D -ms;
> >
> >       /* Convert from pages to bytes */
> > -     *chunk_size =3D (u64)ms << 12;
> > -     *size =3D (u64)s << 12;
> > +     *chunk_size =3D (u64)ms << PAGE_SHIFT;
> > +     *size =3D (u64)s << PAGE_SHIFT;
> >   }
> >
> >   static void drm_test_buddy_alloc_pathological(struct kunit *test)
>

