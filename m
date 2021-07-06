Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCDF3BDEDA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 23:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E1A6E5B0;
	Tue,  6 Jul 2021 21:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3896E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 21:19:39 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id p21so183511lfj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AEc+HkBX5y/VLGNpWlw7flwG5MZ8KnQgN0iK4yphSPk=;
 b=YkEMQFzCa+UfeZVPkWbnkus+8zV97RkUZbzlImE1zbCLCGCm/gK7Xyyw5bV54Jv9hY
 q1a56NXmM47fFTBGmT+PgF/npmXE0C+saZicZDUDurcBOfdGCc2YQLe2ie6nDd4JwbWX
 42G4cWzfaY9QfnK7EFpNeEX+UUPBD/YJr9q48FV5Wps7heZ+mW7l5ZxY6AP2E3er96jp
 hl578MWSebN59w2fPueB2OaR1iPTpwMqG3QZtr9KVMEYwx610N0vyXrLtCT65bCna8lS
 G9o0j3IcutbW3LtGa5IPLjh9zgoTZiSRpNpS9RV/dwCRMPOVWAO8/bCcmErbdAwGn9k7
 6AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AEc+HkBX5y/VLGNpWlw7flwG5MZ8KnQgN0iK4yphSPk=;
 b=AX4Ol95Yz1yzN4O/95SVfnx/UMeSJQN6aiqnwU9qlCi5rU1xrSYDmmYimHEf+xYQkq
 QpTBxhzSYh80OH1yLNtPKf+nD/90QAzm4vPgyDOsUAonqfPtADjB6CynVxO1Xi4LVJMw
 L1Fu5i8E+/wZ62Hr3xVrkBgKp0JbRlgAMW6/9Rkspy+4MGH4KAzp7bV0q054LwbwNZ2X
 8aBLqnndTrPDXCYgjEvORN3PM3RKSPj8icQzAYP+76wDUC2czmKAnTBmhnvNNlbDuggp
 0i+kvY2ZuD4Qlef7CG+YhhidFxSRviyWbyhiI7AziFssbe/6jB+6hhvKmUOXAINyPkK6
 JRig==
X-Gm-Message-State: AOAM532PzUx2DV9isdb5zHuUocp7864/1zrF6LP8j5f6PoSku64tnSjK
 yDQKQ8CZ7urEKa9yM1ZpU/zopNL6xOQNOx0djaoSCg==
X-Google-Smtp-Source: ABdhPJzqKI0VbEXj+RPkaAPLp1iC1JjVqz3JmsedJBG5ANhc8bMitAim43so/ALoVtvEZJwJ8lOaqbY7Ew92vIL44Ds=
X-Received: by 2002:a05:6512:2246:: with SMTP id
 i6mr7842791lfu.7.1625606377532; 
 Tue, 06 Jul 2021 14:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <ab35ed32-ead4-3dc4-550d-55f288810220@amd.com>
 <CALAqxLXWDKp3BZJdO3nVd9vSVV6B+bWnTy+oP6bzBB6H3Yf4eA@mail.gmail.com>
 <6a472a24-a40f-1160-70dd-5cb9e9ae85f1@amd.com>
 <CALAqxLXrCto31uie37Y4HjaD=2XyqkeR=HH5A6Z+drQtyYBKFg@mail.gmail.com>
 <CAKMK7uH+X8dvrD1=rpmozGvC5R88BOFL--_m9ezbgQjaSjGQ_w@mail.gmail.com>
In-Reply-To: <CAKMK7uH+X8dvrD1=rpmozGvC5R88BOFL--_m9ezbgQjaSjGQ_w@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 6 Jul 2021 14:19:27 -0700
Message-ID: <CALAqxLVJw=0sEWxdsZ7j2QvHFDUtym3HSpkgqGdQJVayssMNeA@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
To: Daniel Vetter <daniel@ffwll.ch>
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

On Tue, Jul 6, 2021 at 2:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jul 6, 2021 at 11:04 PM John Stultz <john.stultz@linaro.org> wrot=
e:
> > On Wed, Jun 30, 2021 at 11:52 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > >
> > > Am 01.07.21 um 00:24 schrieb John Stultz:
> > > > On Wed, Jun 30, 2021 at 2:10 AM Christian K=C3=B6nig
> > > > <christian.koenig@amd.com> wrote:
> > > >> Am 30.06.21 um 03:34 schrieb John Stultz:
> > > >>> +static unsigned long page_pool_size; /* max size of the pool */
> > > >>> +
> > > >>> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm pag=
e pool");
> > > >>> +module_param(page_pool_size, ulong, 0644);
> > > >>> +
> > > >>> +static atomic_long_t nr_managed_pages;
> > > >>> +
> > > >>> +static struct mutex shrinker_lock;
> > > >>> +static struct list_head shrinker_list;
> > > >>> +static struct shrinker mm_shrinker;
> > > >>> +
> > > >>> +/**
> > > >>> + * drm_page_pool_set_max - Sets maximum size of all pools
> > > >>> + *
> > > >>> + * Sets the maximum number of pages allows in all pools.
> > > >>> + * This can only be set once, and the first caller wins.
> > > >>> + */
> > > >>> +void drm_page_pool_set_max(unsigned long max)
> > > >>> +{
> > > >>> +     if (!page_pool_size)
> > > >>> +             page_pool_size =3D max;
> > > >>> +}
> > > >>> +
> > > >>> +/**
> > > >>> + * drm_page_pool_get_max - Maximum size of all pools
> > > >>> + *
> > > >>> + * Return the maximum number of pages allows in all pools
> > > >>> + */
> > > >>> +unsigned long drm_page_pool_get_max(void)
> > > >>> +{
> > > >>> +     return page_pool_size;
> > > >>> +}
> > > >> Well in general I don't think it is a good idea to have getters/se=
tters
> > > >> for one line functionality, similar applies to locking/unlocking t=
he
> > > >> mutex below.
> > > >>
> > > >> Then in this specific case what those functions do is to aid
> > > >> initializing the general pool manager and that in turn should abso=
lutely
> > > >> not be exposed.
> > > >>
> > > >> The TTM pool manager exposes this as function because initializing=
 the
> > > >> pool manager is done in one part of the module and calculating the
> > > >> default value for the pages in another one. But that is not someth=
ing I
> > > >> would like to see here.
> > > > So, I guess I'm not quite clear on what you'd like to see...
> > > >
> > > > Part of what I'm balancing here is the TTM subsystem normally sets =
a
> > > > global max size, whereas the old ION pool didn't have caps (instead
> > > > just relying on the shrinker when needed).
> > > > So I'm trying to come up with a solution that can serve both uses. =
So
> > > > I've got this drm_page_pool_set_max() function to optionally set th=
e
> > > > maximum value, which is called in the TTM initialization path or se=
t
> > > > the boot argument. But for systems that use the dmabuf system heap,
> > > > but don't use TTM, no global limit is enforced.
> > >
> > > Yeah, exactly that's what I'm trying to prevent.
> > >
> > > See if we have the same functionality used by different use cases we
> > > should not have different behavior depending on what drivers are load=
ed.
> > >
> > > Is it a problem if we restrict the ION pool to 50% of system memory a=
s
> > > well? If yes than I would rather drop the limit from TTM and only rel=
y
> > > on the shrinker there as well.
> >
> > Would having the default value as a config option (still overridable
> > via boot argument) be an acceptable solution?
>
> We're also trying to get ttm over to the shrinker model, and a first
> cut of that even landed, but didn't really work out yet. So maybe just
> aiming for the shrinker? I do agree this should be consistent across
> the board, otherwise we're just sharing code but not actually sharing
> functionality, which is a recipe for disaster because one side will
> end up breaking the other side's use-case.

Fair enough, maybe it would be best to remove the default limit, but
leave the logic so it can still be set via the boot argument?

thanks
-john
