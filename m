Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54407B1686F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C5610E6E9;
	Wed, 30 Jul 2025 21:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kowalczyk-ws.20230601.gappssmtp.com header.i=@kowalczyk-ws.20230601.gappssmtp.com header.b="0D76YuCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D1B10E36F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 16:11:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so2799424a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kowalczyk-ws.20230601.gappssmtp.com; s=20230601; t=1753891897; x=1754496697;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2b79vf5ak+e/xCZeuA0BNxm0tT114JbbliY/uAS1iI=;
 b=0D76YuCQH38DNbGFIOq0bKpdnlXybOveACeg8M5ER+iaZNIsdnBoI9UzISaC35eZ1G
 ucmc2TkaVw9C6+nFCCvut74mAYw2EYWBpwJBGoPg7C7qu1Mn87ai4hbSUy9SdQ7IJ/a2
 6zDPDi0h2NVr2kXhsaSe56xQ4qZFS14mtqKIZ/I0vaUptz9njh9np3P1a3R3ytfc+AWr
 g/yLnUEtQQu5XX0daDdLYGsw9siX6Y6VP0Kzn81+v6ZtrdPGYQJSA5zaPpeASbfPu2wJ
 Zz4UDZ8o6rhM7UL0auv9rNvHpmWb4eD6IsDPIddnHROvMZ9B+rHRAMlYoVptQXzxiYWg
 DUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753891897; x=1754496697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2b79vf5ak+e/xCZeuA0BNxm0tT114JbbliY/uAS1iI=;
 b=af0exIsiUw9Sft3JByg/ryKl+Cq5WAkZYZTLOgrKH888AB45W/WOl1s/mj+ml0JK54
 VzJYzgpGM7N4Fda/ieVHlW/udWujU5Wy8TRVsQ7Ey7kSm++0m79um/+n3oskeROfVwMr
 /Hy2LQP/SgtObsYDgnZCKVik7eJ4xMB7g4kzTzRuUR66eOI0UbZaNGaPuwbIWg4+PuGD
 EzTWSTfyrE3++tOUL2XpCp75PiGzBrDew9+BVgetGg9gt/2u79xzv08N0ZMap5ahJxan
 yDmaIUapioYX1MdI/a3CpHWE08R6q+CAuS2eBRX1U9NEzRWv1eExapoGXVnViMK+QHct
 dHtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSksAxEMZ0dAGBUZQ6LcYBTUErx7FOpJ/A+ytul3yTeFc8snw46NHgWA2MH2bG2f999P7eqUbj5ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcE8v/9ig23JoO2JDuJttoqF088ZIkZ42B55Yp6M/5DubmxUBr
 kTeC0wUnrewpTqvOaY4RuqPeKHTtO/HmUUdOjMoJRDZCQaA7X/YRVVJLXa1W3l/cG+N0aN3CRbv
 JBNURg/hGkGmo2lwe8O2sV6Qxqd12j3cD5W8TgrJE
X-Gm-Gg: ASbGnct5XalgSHYF2PaEWdpaO3BYtBSsoZg0/G5frZDn0+hLapw0gJaiFItj/Z6PC2+
 ON7XyDfXUMtDf+uvdmww4aNi4QKRU1XSmi8RUy9BzL0adq4/Iiox8xHQg+oTr47OOB08ramgR62
 TV7jLO5YPKCWJaqh0PIZAtPEpBZPpDjCCIb97WRHHgpoCfKABShIaPBbbwHcCoT2+OUUBbqx1t8
 rXV
X-Google-Smtp-Source: AGHT+IF0RbHZTmyeGEceTHCSVk3sXAK7Fvg37ayxPFDsP6BZA0CVmeBroxYKzVp8m2JfRHhouMt2MBxOgQuv6Q7rqjU=
X-Received: by 2002:a05:6402:2553:b0:615:8f13:6324 with SMTP id
 4fb4d7f45d1cf-6158f1367d8mr2751996a12.1.1753891896854; Wed, 30 Jul 2025
 09:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
 <ff93c415-7ce8-a331-9568-7543c6a37992@google.com>
 <817c59dd-ad54-47f1-ac16-9cb9583308d1@linux.alibaba.com>
In-Reply-To: <817c59dd-ad54-47f1-ac16-9cb9583308d1@linux.alibaba.com>
From: Patryk Kowalczyk <patryk@kowalczyk.ws>
Date: Wed, 30 Jul 2025 18:11:25 +0200
X-Gm-Features: Ac12FXy5SspHtr8bWKbmfyjbAMrdH8laeeJCxAogBGa40D3TbRxRNcwy2_YhjZ8
Message-ID: <CAJCW39LLyJjOyMNreiVd+SjS3dKSXwvT6kVz-sf8y9YpsU1dTg@mail.gmail.com>
Subject: Re: [PATCH] mm: shmem: fix the shmem large folio allocation for the
 i915 driver
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Hugh Dickins <hughd@google.com>, akpm@linux-foundation.org, 
 ville.syrjala@linux.intel.com, david@redhat.com, willy@infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, 
 christian.koenig@amd.com, ray.huang@amd.com, matthew.auld@intel.com, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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

Hi,
This patch solves the performance issue very well.
best regards,
Patryk

=C5=9Br., 30 lip 2025 o 09:46 Baolin Wang <baolin.wang@linux.alibaba.com> n=
apisa=C5=82(a):
>
>
>
> On 2025/7/30 14:54, Hugh Dickins wrote:
> > On Mon, 28 Jul 2025, Baolin Wang wrote:
> >
> >> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmp=
fs"),
> >> we extend the 'huge=3D' option to allow any sized large folios for tmp=
fs,
> >> which means tmpfs will allow getting a highest order hint based on the=
 size
> >> of write() and fallocate() paths, and then will try each allowable lar=
ge order.
> >>
> >> However, when the i915 driver allocates shmem memory, it doesn't provi=
de hint
> >> information about the size of the large folio to be allocated, resulti=
ng in
> >> the inability to allocate PMD-sized shmem, which in turn affects GPU p=
erformance.
> >>
> >> To fix this issue, add the 'end' information for shmem_read_folio_gfp(=
)  to help
> >> allocate PMD-sized large folios. Additionally, use the maximum allocat=
ion chunk
> >> (via mapping_max_folio_size()) to determine the size of the large foli=
os to
> >> allocate in the i915 driver.
> >>
> >> Fixes: acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs")
> >> Reported-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
> >> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >> Tested-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
> >> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >> ---
> >>   drivers/gpu/drm/drm_gem.c                 | 2 +-
> >>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 7 ++++++-
> >>   drivers/gpu/drm/ttm/ttm_backup.c          | 2 +-
> >>   include/linux/shmem_fs.h                  | 4 ++--
> >>   mm/shmem.c                                | 7 ++++---
> >>   5 files changed, 14 insertions(+), 8 deletions(-)
> >
> > I know I said "I shall not object to a temporary workaround to suit the
> > i915 driver", but really, I have to question this patch.  Why should an=
y
> > change be required at the drivers/gpu/drm end?
> >
> > And in drivers/gpu/drm/{i915,v3d} I find they are using huge=3Dwithin_s=
ize:
> > I had been complaining about the userspace regression in huge=3Dalways,
> > and thought it had been changed to behave like huge=3Dwithin_size,
> > but apparently huge=3Dwithin_size has itself regressed too.
>
> I'm preparing a RFC patch to discuss this.
>
> > Please explain why the below is not a better patch for i915 and v3d
> > (but still a temporary workaround, because the root of the within_size
> > regression must lie deeper, in the handling of write_end versus i_size)=
.
>
> OK. This looks good to me. Patryk, could you try Hugh's simple patch?
> Thanks.
>
> > ---
> >   mm/shmem.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 3a5a65b1f41a..c67dfc17a819 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -5928,8 +5928,8 @@ struct folio *shmem_read_folio_gfp(struct address=
_space *mapping,
> >       struct folio *folio;
> >       int error;
> >
> > -     error =3D shmem_get_folio_gfp(inode, index, 0, &folio, SGP_CACHE,
> > -                                 gfp, NULL, NULL);
> > +     error =3D shmem_get_folio_gfp(inode, index, i_size_read(inode),
> > +                                 &folio, SGP_CACHE, gfp, NULL, NULL);
> >       if (error)
> >               return ERR_PTR(error);
> >
>
