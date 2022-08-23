Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB659E7CA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 18:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EF8112CEF;
	Tue, 23 Aug 2022 16:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E289610E9DE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 16:47:20 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w197so16706409oie.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 09:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=F8aKSZv1NL2MA13LWlrkZ0pyLx1poLLo5+Y2auoHrrU=;
 b=P8Rb6AIUe0BqjayXQEF1C99U0H8YdtTbPpCkW0bERtLUXN9fooVIer4M3R47yIez/U
 5go1SSUpqQGPaOv6AsSeoRoo8SSXNjtCuLMuvgFbBFBYml0t9Zq+e/kHUBIQ0wfa8LYs
 0fCx1wsNmzKkwaquNleJdBdp/70ylcTVBYNrU8zsojU/8KiNhBozHLIiD/2vU3pbT1wu
 StvBfAQHmAvHRbTuuK1wfmyQdce5xlUhPz7Wu2Sg+hL+upMM0Ba5GeaTuFECDP5vlgsZ
 YyBmWB3oQyTquXWCh6CmFcUYquSC+NBylzyFgiUJ+4/FyXltqM8D6PhNC6TwsFN+ykfp
 1FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=F8aKSZv1NL2MA13LWlrkZ0pyLx1poLLo5+Y2auoHrrU=;
 b=3qvbt3JJNcT4c1CBddWsoswIoxcevPxvzuGYJEknCIfL715OuQeNVFg5q8Lpo6N3D5
 GUvldL4JggjBKIiIMCfVSFrml781kHHDdn2PwuWcu1zRdgiauujXieibTahJSpDo3w2/
 KztkeMPkymAtqjcKi8elJr7FYPrtrG8mlrF6KeIGMEShd5rz8A3knjmjR0arAr8jq4PU
 a97GFEcMw3scFwVvH7hGdJFDoKUAChE8353CTR4Soeana4Dhul9mSV1Mt5i69iapiL7g
 V0yR0tMkc7vr0tdXi+1pp+5SHMjKb7JUQf87Z2tdhBQ53QigSOqDnq0gm1oyPQm+Q/xa
 eLfw==
X-Gm-Message-State: ACgBeo1RJFtGeD3y6rhCyHzDvIuEFEkmPddAXAKPGpf8S0TDIIpbvjMI
 pS8oEIHdvr//O8+ys3K9laj9DRZsRSwwWzIj8K8=
X-Google-Smtp-Source: AA6agR7cQ1HWOR/GP2rtEG15PGZ/r+13Je3nF5uNZRRMMJwUkE+V9G7UTyql1pmHzDQiRGHyVzqd9qmK0bsICHBqrYU=
X-Received: by 2002:a05:6808:238d:b0:344:e5f9:db34 with SMTP id
 bp13-20020a056808238d00b00344e5f9db34mr1650387oib.183.1661273240141; Tue, 23
 Aug 2022 09:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
 <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
 <CAF6AEGv1cVC9ZNMwpwFOki5CrwD3kSAHM9EUFZGWY-y5zcQsCg@mail.gmail.com>
 <fc019528-7ec7-9e5b-1b6d-c44da14346cf@collabora.com>
 <CAF6AEGv8zSd0fEYB9hd2QOyTt53gFSQoL8JdZtCvtCdYfMfB2Q@mail.gmail.com>
 <73b51dde-689f-64ce-a1c8-0d7c84a2ed66@collabora.com>
 <CAF6AEGuR1cRQYaQBYGnMBzy=XJUcN2o2gzabZaGO2Dj62Uq1DA@mail.gmail.com>
 <CAF6AEGvvR1NUd_GKP=Bxp3VTDMBYT+OwTkkgOWxgYFijZaVVEQ@mail.gmail.com>
 <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
 <2ce5ff0a-9ab2-d146-04db-487a64714fce@gmail.com>
 <cf8cd8da-08d2-5e70-a239-2a67da37c9ea@collabora.com>
 <e9bde303-6474-aa0b-7880-cf7d8b163983@collabora.com>
 <5988bf07-dd2e-a7ad-1ed9-831a402c3c5d@gmail.com>
In-Reply-To: <5988bf07-dd2e-a7ad-1ed9-831a402c3c5d@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 23 Aug 2022 09:47:53 -0700
Message-ID: <CAF6AEGvnqV4ySs6rNWu0pkeSNJMhgN1rvind8dC-nV1Sv3kk8g@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 3:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 22.08.22 um 19:26 schrieb Dmitry Osipenko:
> > On 8/16/22 22:55, Dmitry Osipenko wrote:
> >> On 8/16/22 15:03, Christian K=C3=B6nig wrote:
> >>> Am 16.08.22 um 13:44 schrieb Dmitry Osipenko:
> >>>> [SNIP]
> >>>>> The other complication I noticed is that we don't seem to keep arou=
nd
> >>>>> the fd after importing to a GEM handle.  And I could imagine that
> >>>>> doing so could cause issues with too many fd's.  So I guess the bes=
t
> >>>>> thing is to keep the status quo and let drivers that cannot mmap
> >>>>> imported buffers just fail mmap?
> >>>> That actually should be all the drivers excluding those that use
> >>>> DRM-SHMEM because only DRM-SHMEM uses dma_buf_mmap(), that's why it
> >>>> works for Panfrost. I'm pretty sure mmaping of imported GEMs doesn't
> >>>> work for the MSM driver, isn't it?
> >>>>
> >>>> Intel and AMD drivers don't allow to map the imported dma-bufs. Both
> >>>> refuse to do the mapping.
> >>>>
> >>>> Although, AMDGPU "succeeds" to do the mapping using
> >>>> AMDGPU_GEM_DOMAIN_GTT, but then touching the mapping causes bus faul=
t,
> >>>> hence mapping actually fails. I think it might be the AMDGPU
> >>>> driver/libdrm bug, haven't checked yet.
> >>> That's then certainly broken somehow. Amdgpu should nerve ever have
> >>> allowed to mmap() imported DMA-bufs and the last time I check it didn=
't.
> >> I'll take a closer look. So far I can only tell that it's a kernel
> >> driver issue because once I re-applied this "Don't map imported GEMs"
> >> patch, AMDGPU began to refuse mapping AMDGPU_GEM_DOMAIN_GTT.
> >>
> >>>> So we're back to the point that neither of DRM drivers need to map
> >>>> imported dma-bufs and this was never tested. In this case this patch=
 is
> >>>> valid, IMO.
> >> Actually, I'm now looking at Etnaviv and Nouveau and seems they should
> >> map imported dma-buf properly. I know that people ran Android on
> >> Etnaviv. So maybe devices with a separated GPU/display need to map
> >> imported display BO for Android support. Wish somebody who ran Android
> >> on one of these devices using upstream drivers could give a definitive
> >> answer. I may try to test Nouveau later on.
> >>
> > Nouveau+Intel combo doesn't work because of [1] that says:
> >
> > "Refuse to fault imported pages. This should be handled (if at all) by
> > redirecting mmap to the exporter."
> >
> > [1]
> > https://elixir.bootlin.com/linux/v5.19/source/drivers/gpu/drm/ttm/ttm_b=
o_vm.c#L154
> >
> > Interestingly, I noticed that there are IGT tests which check prime
> > mmaping of Nouveau+Intel [2] (added 9 years ago), but they fail as well=
,
> > as expected. The fact that IGT has such tests is interesting because it
> > suggests that the mapping worked in the past. It's also surprising that
> > nobody cared to fix the failing tests. For the reference, I checked
> > v5.18 and today's linux-next.
> >
> > [2]
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/pr=
ime_nv_test.c#L132
> >
> > Starting subtest: nv_write_i915_cpu_mmap_read
> > Received signal SIGBUS.
> > Stack trace:
> >   #0 [fatal_sig_handler+0x163]
> >   #1 [__sigaction+0x50]
> >   #2 [__igt_unique____real_main354+0x406]
> >   #3 [main+0x23]
> >   #4 [__libc_start_call_main+0x80]
> >   #5 [__libc_start_main+0x89]
> >   #6 [_start+0x25]
> > Subtest nv_write_i915_cpu_mmap_read: CRASH (0,005s)
> >
> > Starting subtest: nv_write_i915_gtt_mmap_read
> > Received signal SIGBUS.
> > Stack trace:
> >   #0 [fatal_sig_handler+0x163]
> >   #1 [__sigaction+0x50]
> >   #2 [__igt_unique____real_main354+0x33d]
> >   #3 [main+0x23]
> >   #4 [__libc_start_call_main+0x80]
> >   #5 [__libc_start_main+0x89]
> >   #6 [_start+0x25]
> > Subtest nv_write_i915_gtt_mmap_read: CRASH (0,004s)
> >
> > I'm curious about the Etnaviv driver because it uses own shmem
> > implementation and maybe it has a working mmaping of imported GEMs sinc=
e
> > it imports the dma-buf pages into Entaviv BO. Although, it should be
> > risking to map pages using a different caching attributes (WC) from the
> > exporter, which is prohibited on ARM ad then one may try to map importe=
d
> > udmabuf.
> >
> > Apparently, the Intel DG TTM driver should be able to map imported
> > dma-buf because it sets TTM_TT_FLAG_EXTERNAL_MAPPABLE.
>
> Even with that flag set it is illegal to map the pages directly by an
> importer.
>
> If that ever worked then the only real solution is to redirect mmap()
> calls on importer BOs to dma_buf_mmap().

Yeah, I think this is the best option.  Forcing userspace to hang on
to the fd just in case someone calls readpix would be pretty harsh.

BR,
-R

> Regards,
> Christian.
>
> >
> > Overall, it still questionable to me whether it's worthwhile to allow
> > the mmaping of imported GEMs since only Panfrost/Lima can do it out of
> > all drivers and h/w that I tested. Feels like drivers that can do the
> > mapping have it just because they can and not because they need.
> >
>
