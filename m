Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E8F37C773
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 18:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755856E372;
	Wed, 12 May 2021 16:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0FA6EB8E;
 Wed, 12 May 2021 12:21:14 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id j10so33380763lfb.12;
 Wed, 12 May 2021 05:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F9MtIG+vQzUFqPNBIIS1xh4HkQAMYOe9LgSrlh3uhXY=;
 b=WEFE914hJLyDJZKFq2RQ2klmzFO5eunw4Esxy/DJAW3Jajo3tAVXfqlTLEdku3t/2Y
 RNfyzhdv+qT9DkD0yN37uA+cxM5or0OppicUHye+7Y4soA+TgKRGN7tbygALRJ5HW3XL
 PH+mxQ1G2MT6tVwCpYZxVKQk81gOe496dZyhzXS15+mvFFqyN95+4yMSvRIgreOjQVWZ
 GuoAUh5+dDsRtFF/59IYUtT7S0yLSdWA6h7xPMJfZ00Udwcey1lulHPIemmFU08ZaDLv
 N8y7F8HOJPi14n78hxMham1KBkpjhJtrDT5bqcTJMVIJDnjRBSjcwAJKdQ20hd4dhabI
 Us+w==
X-Gm-Message-State: AOAM533uiTXkBpsE3ZOb4D/bo5B0W3C3Ucf3EQsTkeGMRXYwyJWlYVxX
 wdd42CPWgay1DzaJsQD72WdiZbp2aq9b0aBn
X-Google-Smtp-Source: ABdhPJzPpZN6lu61sQAu9SXeWLt/l9pgTk5Si3FkHA0T1s+QdQ+3NBNt8AdPujeMw0JSD5CrGMoYFg==
X-Received: by 2002:a05:6512:1188:: with SMTP id
 g8mr24885080lfr.410.1620822072474; 
 Wed, 12 May 2021 05:21:12 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id i5sm4203278ljb.129.2021.05.12.05.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 05:21:12 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id v6so29304743ljj.5;
 Wed, 12 May 2021 05:21:11 -0700 (PDT)
X-Received: by 2002:a2e:751d:: with SMTP id q29mr11543921ljc.118.1620822071149; 
 Wed, 12 May 2021 05:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <s5ho8dmh98p.wl-tiwai@suse.de>
 <aa54b1d7-1d3c-4c77-37db-d6c93b8c794c@gmail.com>
 <72fd6a34-89d6-f46c-36ba-5b006dd47019@amd.com>
In-Reply-To: <72fd6a34-89d6-f46c-36ba-5b006dd47019@amd.com>
From: Dennis Foster <mail@dennisfoster.us>
Date: Wed, 12 May 2021 08:21:00 -0400
X-Gmail-Original-Message-ID: <CAOt9N1Ev2UTOBydgEB35BAm5Pad-uy78E1xAyS6qWDPYLThcLQ@mail.gmail.com>
Message-ID: <CAOt9N1Ev2UTOBydgEB35BAm5Pad-uy78E1xAyS6qWDPYLThcLQ@mail.gmail.com>
Subject: Re: [5.12 regression] ttm->pages NULL dereference with radeon driver
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 12 May 2021 16:24:42 +0000
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
Cc: Dennis Foster <mail@dennisfoster.us>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 arvin.kebob@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I can confirm that the patch provided fixes the issue in kernel version 5.1=
2.2
Thank you.


On Wed, May 12, 2021 at 6:21 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi guys,
>
> adding a few people who ran into the problem as well and opened a kernel
> bug.
>
> Am 07.05.21 um 17:11 schrieb Christian K=C3=B6nig:
> > Hi Takashi,
> >
> > Am 07.05.21 um 17:08 schrieb Takashi Iwai:
> >> Hi,
> >>
> >> we've received a regression report showing NULL dereference Oops with
> >> radeon driver on 5.12 kernel:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbu=
gzilla.opensuse.org%2Fshow_bug.cgi%3Fid%3D1185516&amp;data=3D04%7C01%7Cchri=
stian.koenig%40amd.com%7C64447e9e97604aaf117008d9116a742a%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637559971181187178%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D1LJMLxuuMjkfgnIt%2B5Z5n19ri%2BMTLMQvEEB%2F%2Fd6SVkg%3D&amp;reserved=
=3D0
> >>
> >> It turned out that the recent TTM cleanup / refactoring via commit
> >> 0575ff3d33cd ("drm/radeon: stop using pages with
> >> drm_prime_sg_to_page_addr_arrays v2") is the culprit.  On 5.12 kernel,
> >> ttm->pages is no longer allocated / set up, while the radeon driver
> >> still has a few places assuming the valid ttm->pages, and for the
> >> reporter (running the modesettig driver), radeon_gart_bind() hits the
> >> problem.
> >>
> >> A hackish patch below was confirmed to work, at least, but obviously
> >> we need a proper fix.
> >>
> >> Could you take a look at it?
> >
> > If that's all then that looks trivial to me.
> >
> > Going to provide a patch on Monday.
>
> Sorry, was a busy start into the week. I've just send a patch which
> should address the issue to you and the mailing list.
>
> Please test since I can't reproduce the problem locally.
>
> Thanks,
> Christian.
>
> >
> > Thanks for the notice,
> > Christian.
> >
> >>
> >>
> >> thanks,
> >>
> >> Takashi
> >>
> >> --- a/drivers/gpu/drm/radeon/radeon_gart.c
> >> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> >> @@ -253,7 +253,7 @@ void radeon_gart_unbind(struct radeon_de
> >>       t =3D offset / RADEON_GPU_PAGE_SIZE;
> >>       p =3D t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
> >>       for (i =3D 0; i < pages; i++, p++) {
> >> -        if (rdev->gart.pages[p]) {
> >> +        if (1 /*rdev->gart.pages[p]*/) {
> >>               rdev->gart.pages[p] =3D NULL;
> >>               for (j =3D 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
> >> j++, t++) {
> >>                   rdev->gart.pages_entry[t] =3D rdev->dummy_page.entry=
;
> >> @@ -301,7 +301,7 @@ int radeon_gart_bind(struct radeon_devic
> >>       p =3D t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
> >>         for (i =3D 0; i < pages; i++, p++) {
> >> -        rdev->gart.pages[p] =3D pagelist[i];
> >> +        /* rdev->gart.pages[p] =3D pagelist[i]; */
> >>           page_base =3D dma_addr[i];
> >>           for (j =3D 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE); j++,
> >> t++) {
> >>               page_entry =3D radeon_gart_get_page_entry(page_base, fla=
gs);
> >> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> >> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> >> @@ -360,6 +360,8 @@ static int radeon_ttm_tt_pin_userptr(str
> >>         if (current->mm !=3D gtt->usermm)
> >>           return -EPERM;
> >> +    if (!ttm->pages)
> >> +        return -EPERM;
> >>         if (gtt->userflags & RADEON_GEM_USERPTR_ANONONLY) {
> >>           /* check that we only pin down anonymous memory
> >> _______________________________________________
> >> amd-gfx mailing list
> >> amd-gfx@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cchr=
istian.koenig%40amd.com%7C64447e9e97604aaf117008d9116a742a%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637559971181187178%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DRdzGp1FLxBKE%2ByPclrUBfQomRU0pQT%2F78Ewcj%2FBZ73g%3D&amp;reserved=
=3D0
> >>
> >
