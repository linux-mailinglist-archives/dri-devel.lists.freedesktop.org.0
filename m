Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A616365BE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 17:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4607A10E5B1;
	Wed, 23 Nov 2022 16:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4513610E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:26:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id f18so43982532ejz.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSFkGmkHtN5zUb4Rh39ItxsnC86fxEiwEDLm+HfMs+4=;
 b=Y9+THhAiKWeo98tXRZJu3rPI+T0Kf7GUIeyPARZ58pz6uIsByHvJKY/hNVp5sDeyT7
 9vmoYWoEu8KGjp5BMNYIVRYtXkqnJ+kKUILy8mE1J2G868YCKGd7JpZxc3Fgz54IJFP0
 6EYp/1ISQnkH0jPWhAfvWwmllXr8f9q8htlq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSFkGmkHtN5zUb4Rh39ItxsnC86fxEiwEDLm+HfMs+4=;
 b=zSN7+gd04OGqCXtH+sjxYcMwljd7zpN96Rnhsb5J2uh4ncKHC05C6TdCdAUbz73MRi
 TQbkcsgtoRhtn9Ol4OfxIkYQmAWpoHailfrW+uTz8UvV/XfpJpUYCw8MT2Q+XXnxQ03i
 QdRhjjJV72SGYN7zZN154I45s0EsKz3fqL31BMDCfL79lzJvFwb+nwNxdtR2T9vcveIl
 cqAqUtPI1bwc+kEORACt99nY/ddobbG4hrGmi1qEZri2Eu7GFJsm+/22XiliXt0UP149
 ZXz6d9paWvew7KZi5wZFUtPGrE5U7Nk7MybvZeznq2r8GNBGgHk25b7cQ0z3nK6LDBa/
 pz4A==
X-Gm-Message-State: ANoB5pl7UWhYW8dve4aqV+tLOLzxNimyyWZt4dLYkKD+OJyhh5EWWhju
 cDxqsjSC1h/ceYkj09o5845pME0OUKq4QRgGH7LPVQ==
X-Google-Smtp-Source: AA0mqf4FHPXm74gmQx2rWxAVc922S4ilitDkfXmopa8332zbH90tj/nFwgQWX/aHnAezKjBRLZczseCQuoyDTawrC3g=
X-Received: by 2002:a17:906:d7b8:b0:79f:9ff6:6576 with SMTP id
 pk24-20020a170906d7b800b0079f9ff66576mr23410180ejb.414.1669220794677; Wed, 23
 Nov 2022 08:26:34 -0800 (PST)
MIME-Version: 1.0
References: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca> <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca> <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca>
 <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
 <Y343ijGoqyf73d+I@ziepe.ca> <dcb88724-c68e-6f2a-03d5-0641d2e68ec6@amd.com>
In-Reply-To: <dcb88724-c68e-6f2a-03d5-0641d2e68ec6@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Nov 2022 17:26:23 +0100
Message-ID: <CAKMK7uEqgRHECdjhxoSuvsP9bWpjP=y4QUxjXCtZtMYoRgAoRg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022 at 16:15, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 23.11.22 um 16:08 schrieb Jason Gunthorpe:
> > On Wed, Nov 23, 2022 at 03:34:54PM +0100, Daniel Vetter wrote:
> >>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> >>> index 1376a47fedeedb..4161241fc3228c 100644
> >>> --- a/virt/kvm/kvm_main.c
> >>> +++ b/virt/kvm/kvm_main.c
> >>> @@ -2598,6 +2598,19 @@ static int hva_to_pfn_remapped(struct vm_area_=
struct *vma,
> >>>                          return r;
> >>>          }
> >>>
> >>> +       /*
> >>> +        * Special PTEs are never convertible into a struct page, eve=
n if the
> >>> +        * driver that owns them might have put a PFN with a struct p=
age into
> >>> +        * the PFNMAP. If the arch doesn't support special then we ca=
nnot
> >>> +        * safely process these pages.
> >>> +        */
> >>> +#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
> >>> +       if (pte_special(*ptep))
> >>> +               return -EINVAL;
> >> On second thought this wont work, because it completely defeats the
> >> point of why this code here exists. remap_pfn_range() (which is what
> >> the various dma_mmap functions and the ioremap functions are built on
> >> top of too) sets VM_PFNMAP too, so this check would even catch the
> >> static mappings.
> > The problem with the way this code is designed is how it allows
> > returning the pfn without taking any reference based on things like
> > !pfn_valid or page_reserved. This allows it to then conditionally put
> > back the reference based on the same reasoning. It is impossible to
> > thread pte special into that since it is a PTE flag, not a property of
> > the PFN.
> >
> > I don't entirely understand why it needs the page reference at all,
>
> That's exactly what I've pointed out in the previous discussion about
> that code as well.
>
> As far as I can see it this is just another case where people assumed
> that grabbing a page reference somehow magically prevents the pte from
> changing.
>
> I have not the slightest idea how people got this impression, but I have
> heard it so many time from so many different sources that there must be
> some common cause to this. Is the maybe some book or tutorial how to
> sophisticate break the kernel or something like this?

It's what get_user_pages does, so it does "work". Except this path
here is the fallback for when get_user_pages does not work (because of
the pte_special/VM_SPECIAL case). So essentially it's just a rather
broken get_user_pages that handrolls a bunch of things with
bugs&races.

I have no idea why people don't realize they're just reinventing gup
without using gup, but that's essentially what's going on.

> Anyway as far as I can see only correct approach would be to use an MMU
> notifier or more high level hmm_range_fault()+seq number.

Yeah, plus if you go through ptes you really have to obey all the
flags or things will break. Especially the RO pte flag.
-Daniel

>
> Regards,
> Christian.
>
> > even if it is available - so I can't guess why it is OK to ignore the
> > page reference in other cases, or why it is OK to be racy..
> >
> > Eg hmm_range_fault() does not obtain page references and implements a
> > very similar algorithm to kvm.
> >
> >> Plus these static mappings aren't all that static either, e.g. pci
> >> access also can revoke bar mappings nowadays.
> > And there are already mmu notifiers to handle that, AFAIK.
> >
> > Jason
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
