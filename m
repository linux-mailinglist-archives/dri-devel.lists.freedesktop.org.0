Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8022A82C485
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 18:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7254710EB76;
	Fri, 12 Jan 2024 17:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A8810EB76;
 Fri, 12 Jan 2024 17:14:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-557bfc7f7b4so9527656a12.0; 
 Fri, 12 Jan 2024 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705079676; x=1705684476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkRip5P/CSH4Zjga6g7Ad+NhClHoMzovsmKSyhbUtXI=;
 b=JRbPKLTXnz4913GsWQdd+a410co7bTly8SLJANrSe87ubnaXV9hm1BPSStraU23yZe
 +/2LtJ7cUFrWUEWjtlt43CfwJtC0/hkmuQ0HVeTHXl3OQhzpM61p4UaC4hQxY55uerG9
 rSCpvyyJTRjLPGrNcueymU8/ysoM6qDG3o9CaNeuXbb2mhjsZMC64ZQTsAySTF80kzLc
 uk+A/OgB2ksZsMnR3j5RqJm8o2/PJeAB6IFhieK2bmO/BzdFEGQdZZuwVVnVD38EJZvu
 vZ1toosZso431if9HCSS1RQByBW43DChkbbKrlyJrUogtrVl1NFfxi52aWHpmSEcH02F
 x+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705079676; x=1705684476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkRip5P/CSH4Zjga6g7Ad+NhClHoMzovsmKSyhbUtXI=;
 b=w/Ivd5kYRNN0jvXjjLAwx3qqGXv0G6E6b9VXCbixbTHtf3BYY4V2Ryhxwvd2FNEetW
 XRQctGXfcukjnwsX3MC5XYIkPj0nctXXJGDBf4KK9slul536r4fr9S7LT19fTb3YxotO
 3RtV1kWxjlRrlnpm3DA3w35cA+X7tRVgS7KPMolJnxNjPvffRaL7DZ1sctG8IV4a0kAz
 mse0WB/rjmQ5bDKEI+C0+1O88iFVhHlgKRiPxrGriVZ7sxe4deZIAVUnnhzWcEN0AJgl
 OMJCrq8sPkOC7/2noWR6P/L1Xd7KwWCJHkKTpSKcfzc1FW+7lHIjkMAkZ8B0o2qsPUNq
 xSdw==
X-Gm-Message-State: AOJu0YyPNkzFKBTSaPmuPRak0p95O0VUlInPACPqanUwfqcaRea+yRca
 ZWwqisuu0+GOjdT79Ls/SR8v6XjKL4G67rPJEHM=
X-Google-Smtp-Source: AGHT+IF9IMPBk8V3jyU215rKqdmijeXsvs7Ngpeca5FQb7pvIGZgTeR2+krrbELKgsorLRv1yVbITGICkSbSxw/uz2Q=
X-Received: by 2002:a50:9fab:0:b0:558:b5d0:e77a with SMTP id
 c40-20020a509fab000000b00558b5d0e77amr1925498edf.36.1705079676202; Fri, 12
 Jan 2024 09:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20240108195016.156583-1-robdclark@gmail.com>
 <27e64458-7cb1-99a4-f67e-60d911f28f44@collabora.com>
 <CAF6AEGvBFdXe9rHjbwWv9eLUMv2YEP7cfMoXcWgZ30Wn4LzOjw@mail.gmail.com>
In-Reply-To: <CAF6AEGvBFdXe9rHjbwWv9eLUMv2YEP7cfMoXcWgZ30Wn4LzOjw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 12 Jan 2024 09:14:24 -0800
Message-ID: <CAF6AEGuXi1wTbE0j6FmSnqw_EVUYSdnk5WeFL6abD=zeNutPpg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Add msm tests
To: Vignesh Raman <vignesh.raman@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 7:57=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Fri, Jan 12, 2024 at 3:42=E2=80=AFAM Vignesh Raman
> <vignesh.raman@collabora.com> wrote:
> >
> > Hi Rob,
> >
> >
> > On 09/01/24 01:20, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The msm tests should skip on non-msm hw, so I think it should be safe=
 to
> > > enable everywhere.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/gpu/drm/ci/testlist.txt | 49 ++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 49 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/tes=
tlist.txt
> > > index f82cd90372f4..eaeb751bb0ad 100644
> > > --- a/drivers/gpu/drm/ci/testlist.txt
> > > +++ b/drivers/gpu/drm/ci/testlist.txt
> > > @@ -2910,3 +2910,52 @@ kms_writeback@writeback-invalid-parameters
> > >   kms_writeback@writeback-fb-id
> > >   kms_writeback@writeback-check-output
> > >   prime_mmap_kms@buffer-sharing
> > > +msm_shrink@copy-gpu-sanitycheck-8
> > > +msm_shrink@copy-gpu-sanitycheck-32
> > > +msm_shrink@copy-gpu-8
> > > +msm_shrink@copy-gpu-32
> > > +msm_shrink@copy-gpu-madvise-8
> > > +msm_shrink@copy-gpu-madvise-32
> > > +msm_shrink@copy-gpu-oom-8
> > > +msm_shrink@copy-gpu-oom-32
> > > +msm_shrink@copy-mmap-sanitycheck-8
> > > +msm_shrink@copy-mmap-sanitycheck-32
> > > +msm_shrink@copy-mmap-8
> > > +msm_shrink@copy-mmap-32
> > > +msm_shrink@copy-mmap-madvise-8
> > > +msm_shrink@copy-mmap-madvise-32
> > > +msm_shrink@copy-mmap-oom-8
> > > +msm_shrink@copy-mmap-oom-32
> > > +msm_shrink@copy-mmap-dmabuf-sanitycheck-8
> > > +msm_shrink@copy-mmap-dmabuf-sanitycheck-32
> > > +msm_shrink@copy-mmap-dmabuf-8
> > > +msm_shrink@copy-mmap-dmabuf-32
> > > +msm_shrink@copy-mmap-dmabuf-madvise-8
> > > +msm_shrink@copy-mmap-dmabuf-madvise-32
> > > +msm_shrink@copy-mmap-dmabuf-oom-8
> > > +msm_shrink@copy-mmap-dmabuf-oom-32
> > > +msm_mapping@ring
> > > +msm_mapping@sqefw
> > > +msm_mapping@shadow
> > > +msm_submitoverhead@submitbench-10-bos
> > > +msm_submitoverhead@submitbench-10-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-100-bos
> > > +msm_submitoverhead@submitbench-100-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-250-bos
> > > +msm_submitoverhead@submitbench-250-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-500-bos
> > > +msm_submitoverhead@submitbench-500-bos-no-implicit-sync
> > > +msm_submitoverhead@submitbench-1000-bos
> > > +msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
> > > +msm_recovery@hangcheck
> > > +msm_recovery@gpu-fault
> > > +msm_recovery@gpu-fault-parallel
> > > +msm_recovery@iova-fault
> > > +msm_submit@empty-submit
> > > +msm_submit@invalid-queue-submit
> > > +msm_submit@invalid-flags-submit
> > > +msm_submit@invalid-in-fence-submit
> > > +msm_submit@invalid-duplicate-bo-submit
> > > +msm_submit@invalid-cmd-idx-submit
> > > +msm_submit@invalid-cmd-type-submit
> > > +msm_submit@valid-submit
> >
> > I tested this patch with latest drm-misc/drm-misc-next and there was
> > some failures seen for the newly added msm tests. I have updated the
> > xfails with below commit,
> >
> > https://gitlab.freedesktop.org/vigneshraman/linux/-/commit/d012893597a6=
61d6ebbb755bf2607dfb055524a1
> >
> > I will notify the maintainers about the flaky tests, update the url in
> > the flakes.txt, and submit a separate patch for this change.

Oh, you should probably move msm_mapping@* to skips on sdm845.  I had
a closer look at those, and they are failing due to a bootloader/fw
issue.  We work around this in mesa CI with these two patches:

https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf=
489870573f4b43371e
https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0=
fecef8469f65147bc1

But given that sdm845 is similar to sc7180 as far as kernel gpu
driver, it is probably just better to skip these on sdm845 (with a
comment referring to the hack patches we use in mesa CI)

BR,
-R

>
> Thanks, it looks like you also have a relatively recent igt (there
> were some msm_submit fails until I fixed the test)..
>
> BR,
> -R
>
> > Regards,
> > Vignesh
