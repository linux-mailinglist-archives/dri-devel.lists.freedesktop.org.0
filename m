Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B83BDECF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 23:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E414C6E5AB;
	Tue,  6 Jul 2021 21:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19AA6E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 21:15:12 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 n99-20020a9d206c0000b029045d4f996e62so178933ota.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xIjT/sBHJXjEFjRplpqxe3dXJOAOtIbCbm1/QruaXLI=;
 b=RAkqqjXwrM6iUcf4C2PO/bAO5ZwBDkES0GDc6hW7OW32sQPEYuHYBoBduI250xRAG5
 9pkyB5uuCqtDg/p4iXcxbH9Z1QRxnzpRZSe+j2vxeiSmZaE3gP18mJd/xcKjAvHV8bOy
 btYXsqbfPmrGqfQbmgtQMWJ+Z5w8k1cPFnN3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xIjT/sBHJXjEFjRplpqxe3dXJOAOtIbCbm1/QruaXLI=;
 b=Vjt6fWSWA+zBqloXQxZo+kO6/7I1VzOVKOqm4orcNxSQjE9mG7eM/uoBly/9oyS31K
 NmzRe6drk4PQnU6Apf+0W69H64ybPWQxKNW1YNWuoKqagSDsVjyNSAA9xk4rQDJmP6xw
 aNwVHLOiqHxr4ms/TuECg5Sn041uC+qDU4LfD2F0nGVkTun7oP9zdBDy40LxcWMfhawI
 e1JWG7THoZfA4zvHsDtYh7+aRCCn5z+ogS+hpDe49wAbDf4kEt9xjPTPjtwUWYt6WNv2
 PyG2jrSZ6YuIpZ0PG6AGnneihiaW9ZhCEIlpaKYHndBEbm9637vPiQNhgmZl4aupRitk
 xaVQ==
X-Gm-Message-State: AOAM532aNc5mhzgF5UnSQIYm1M49aPWv3qQAnqaGPlJL2cNnWxxj9+ot
 KCEg6uIi1pH1vUE/OemeR52znKza4+C/hW7WoS2WuQ==
X-Google-Smtp-Source: ABdhPJzQRomLtHp/v5BB4qJrTZ0fnAfav/eGEc9VqP9SfaPAf/7GIQUh7zTDva0IVwhe7V7p5AhdlU5if5vICDmb99g=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr16838523otb.281.1625606112115; 
 Tue, 06 Jul 2021 14:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <ab35ed32-ead4-3dc4-550d-55f288810220@amd.com>
 <CALAqxLXWDKp3BZJdO3nVd9vSVV6B+bWnTy+oP6bzBB6H3Yf4eA@mail.gmail.com>
 <6a472a24-a40f-1160-70dd-5cb9e9ae85f1@amd.com>
 <CALAqxLXrCto31uie37Y4HjaD=2XyqkeR=HH5A6Z+drQtyYBKFg@mail.gmail.com>
In-Reply-To: <CALAqxLXrCto31uie37Y4HjaD=2XyqkeR=HH5A6Z+drQtyYBKFg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 6 Jul 2021 23:15:00 +0200
Message-ID: <CAKMK7uH+X8dvrD1=rpmozGvC5R88BOFL--_m9ezbgQjaSjGQ_w@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
To: John Stultz <john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 11:04 PM John Stultz <john.stultz@linaro.org> wrote:
> On Wed, Jun 30, 2021 at 11:52 PM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 01.07.21 um 00:24 schrieb John Stultz:
> > > On Wed, Jun 30, 2021 at 2:10 AM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 30.06.21 um 03:34 schrieb John Stultz:
> > >>> +static unsigned long page_pool_size; /* max size of the pool */
> > >>> +
> > >>> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm page =
pool");
> > >>> +module_param(page_pool_size, ulong, 0644);
> > >>> +
> > >>> +static atomic_long_t nr_managed_pages;
> > >>> +
> > >>> +static struct mutex shrinker_lock;
> > >>> +static struct list_head shrinker_list;
> > >>> +static struct shrinker mm_shrinker;
> > >>> +
> > >>> +/**
> > >>> + * drm_page_pool_set_max - Sets maximum size of all pools
> > >>> + *
> > >>> + * Sets the maximum number of pages allows in all pools.
> > >>> + * This can only be set once, and the first caller wins.
> > >>> + */
> > >>> +void drm_page_pool_set_max(unsigned long max)
> > >>> +{
> > >>> +     if (!page_pool_size)
> > >>> +             page_pool_size =3D max;
> > >>> +}
> > >>> +
> > >>> +/**
> > >>> + * drm_page_pool_get_max - Maximum size of all pools
> > >>> + *
> > >>> + * Return the maximum number of pages allows in all pools
> > >>> + */
> > >>> +unsigned long drm_page_pool_get_max(void)
> > >>> +{
> > >>> +     return page_pool_size;
> > >>> +}
> > >> Well in general I don't think it is a good idea to have getters/sett=
ers
> > >> for one line functionality, similar applies to locking/unlocking the
> > >> mutex below.
> > >>
> > >> Then in this specific case what those functions do is to aid
> > >> initializing the general pool manager and that in turn should absolu=
tely
> > >> not be exposed.
> > >>
> > >> The TTM pool manager exposes this as function because initializing t=
he
> > >> pool manager is done in one part of the module and calculating the
> > >> default value for the pages in another one. But that is not somethin=
g I
> > >> would like to see here.
> > > So, I guess I'm not quite clear on what you'd like to see...
> > >
> > > Part of what I'm balancing here is the TTM subsystem normally sets a
> > > global max size, whereas the old ION pool didn't have caps (instead
> > > just relying on the shrinker when needed).
> > > So I'm trying to come up with a solution that can serve both uses. So
> > > I've got this drm_page_pool_set_max() function to optionally set the
> > > maximum value, which is called in the TTM initialization path or set
> > > the boot argument. But for systems that use the dmabuf system heap,
> > > but don't use TTM, no global limit is enforced.
> >
> > Yeah, exactly that's what I'm trying to prevent.
> >
> > See if we have the same functionality used by different use cases we
> > should not have different behavior depending on what drivers are loaded=
.
> >
> > Is it a problem if we restrict the ION pool to 50% of system memory as
> > well? If yes than I would rather drop the limit from TTM and only rely
> > on the shrinker there as well.
>
> Would having the default value as a config option (still overridable
> via boot argument) be an acceptable solution?

We're also trying to get ttm over to the shrinker model, and a first
cut of that even landed, but didn't really work out yet. So maybe just
aiming for the shrinker? I do agree this should be consistent across
the board, otherwise we're just sharing code but not actually sharing
functionality, which is a recipe for disaster because one side will
end up breaking the other side's use-case.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
