Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6A7B9D5B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0899610E404;
	Thu,  5 Oct 2023 13:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8899810E409
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:35:28 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d89ba259964so1086697276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1696512927; x=1697117727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBt77iv+i6yUV6sl6438k+nP1DNpZDLg/0Q4EcZ/2kY=;
 b=ZnFHiiG3gGxqiKaiG/O+IZ52BgJCnE9LZqVFRWaqJNKcHmc8q55lmvPgd3LCwOGPA4
 RmDdX3wBFcWu2PCQPUEx4+dn1V+hOH+AR9EHoIOjJiR7bNRr1zOiw6QWziAauOJZl+Wu
 0tIWJgRAQXD1ADh3Jdim8wCkmeWBXosSDcrEHi9EFls1ltvH96G/ttJzdmGghMA3fBvP
 ti0I+un88iIivT7ZRePWDSezWgUzYHTm685WlPz5C3NELpycZgx2VwooMV2P9hfjYmhT
 LGbpftX7lewGbBth6FVr5UJQAhHtXOD7VBxztOOZoKdO6rWZZuNnt0pKfrQvw5j10NCe
 sLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696512927; x=1697117727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBt77iv+i6yUV6sl6438k+nP1DNpZDLg/0Q4EcZ/2kY=;
 b=fQLNkNH7I+94jqJn7vV+VkCikOfb+pitXGQz5Pt4biZEU1Y/6X/vo7KbywKWJHhkUm
 t7sdJulYzn/7xW8v5Kct/v53MX0mwpkuxQk4A3iynWZGdb1Np7AZi/r/E4flPJhyI2M+
 ho4yjSzcIOmNIRglcvn2lihfW54EYc89oaZcCDjvX9F76aVVe7+FLC6hlt0ceCimLQEx
 NagtJlrPxvTdVqjBltI+z4bdKY6Dx1nhX2BXlYTkz0vrZqFmfTPpvJAs4grS5aTqBKWk
 f0n720WYTeaiwW5RnvGVhNWNcX3toLWJIdqNS0fzahl+Yq+Yjf+DmOauDWCNR3i4PFF5
 QQFg==
X-Gm-Message-State: AOJu0YxOFRCgwLewNaI5XEqH00KQiJLYbKebIAVdwrdII1+r6rXowOXy
 Puj3T4hlWRbbTA5wCzlyCDs7WJnCy8k/2moSGOB2Gg==
X-Google-Smtp-Source: AGHT+IEilDB2SWaF2YfLIJ5wnpnhZFHNJl9unsnwBv7BHZq2V2+NiDoG7LsGUJMOOgZULV9uQUbjcpAGKVo6jsKQVDU=
X-Received: by 2002:a25:3210:0:b0:d93:97e8:97ac with SMTP id
 y16-20020a253210000000b00d9397e897acmr264008yby.38.1696512927631; Thu, 05 Oct
 2023 06:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230921131201.157767-1-lma@semihalf.com>
 <20230922063410.23626-1-lma@semihalf.com>
 <CADmiTCTHn+XaNqkAZjLmaYUy+6bsb5chue97g3n0bKP7Lcf9_w@mail.gmail.com>
In-Reply-To: <CADmiTCTHn+XaNqkAZjLmaYUy+6bsb5chue97g3n0bKP7Lcf9_w@mail.gmail.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Thu, 5 Oct 2023 15:35:16 +0200
Message-ID: <CAFJ_xboEqNFyG6+F0EkXq32X0Y8pPEWYFw9+7JJye42SrrOkWw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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
Cc: stable@vger.kernel.org, upstream@semihalf.com, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

wt., 26 wrz 2023 o 16:01 Rados=C5=82aw Biernacki <rad@chromium.org> napisa=
=C5=82(a):
>
> On Fri, Sep 22, 2023 at 8:34=E2=80=AFAM Lukasz Majczak <lma@semihalf.com>=
 wrote:
> >
> > As drm_dp_get_mst_branch_device_by_guid() is called from
> > drm_dp_get_mst_branch_device_by_guid(), mstb parameter has to be checke=
d,
> > otherwise NULL dereference may occur in the call to
> > the memcpy() and cause following:
> >
> > [12579.365869] BUG: kernel NULL pointer dereference, address: 000000000=
0000049
> > [12579.365878] #PF: supervisor read access in kernel mode
> > [12579.365880] #PF: error_code(0x0000) - not-present page
> > [12579.365882] PGD 0 P4D 0
> > [12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > ...
> > [12579.365895] Workqueue: events_long drm_dp_mst_up_req_work
> > [12579.365899] RIP: 0010:memcmp+0xb/0x29
> > [12579.365921] Call Trace:
> > [12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64
> > [12579.365930] drm_dp_mst_up_req_work+0x137/0x416
> > [12579.365933] process_one_work+0x1d0/0x419
> > [12579.365935] worker_thread+0x11a/0x289
> > [12579.365938] kthread+0x13e/0x14f
> > [12579.365941] ? process_one_work+0x419/0x419
> > [12579.365943] ? kthread_blkcg+0x31/0x31
> > [12579.365946] ret_from_fork+0x1f/0x30
> >
> > As get_mst_branch_device_by_guid_helper() is recursive, moving conditio=
n
> > to the first line allow to remove a similar one for step over of NULL e=
lements
> > inside a loop.
> >
> > Fixes: 5e93b8208d3c ("drm/dp/mst: move GUID storage from mgr, port to o=
nly mst branch")
> > Cc: <stable@vger.kernel.org> # 4.14+
> > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > ---
> >
> > v2->v3:
> > * Fixed patch description.
> >
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gp=
u/drm/display/drm_dp_mst_topology.c
> > index ed96cfcfa304..8c929ef72c72 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -2574,14 +2574,14 @@ static struct drm_dp_mst_branch *get_mst_branch=
_device_by_guid_helper(
> >         struct drm_dp_mst_branch *found_mstb;
> >         struct drm_dp_mst_port *port;
> >
> > +       if (!mstb)
> > +               return NULL;
> > +
> >         if (memcmp(mstb->guid, guid, 16) =3D=3D 0)
> >                 return mstb;
> >
> >
> >         list_for_each_entry(port, &mstb->ports, next) {
> > -               if (!port->mstb)
> > -                       continue;
> > -
> >                 found_mstb =3D get_mst_branch_device_by_guid_helper(por=
t->mstb, guid);
> >
> >                 if (found_mstb)
> > --
> > 2.42.0.515.g380fc7ccd1-goog
> >
>
> Reviewed-by: Radoslaw Biernacki <rad@chromium.org>

Hi,

Is there anything more I should do with this patch?

Thanks,
Lukasz
