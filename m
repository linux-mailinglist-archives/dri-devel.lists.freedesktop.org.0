Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BCB1BEDE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 04:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319B210E2D0;
	Wed,  6 Aug 2025 02:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QzwzZzDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9286410E2D0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 02:44:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-af939afe5efso632184566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 19:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754448248; x=1755053048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yl+QGO/FoekIvls1YM3Wb/aWR3GhVD7gGl3r1b1iECk=;
 b=QzwzZzDAKqQ9Y0kCBcwTXZuBvF72AhByDroztgQGnsrkHPngzm19F/BydWHdVrgbr6
 +D5fy/5vFZ+uzsxqidm9zcwzt4qCzm3Y7UojGNz2OobiKYcrpn0NsixxRPlFcH17Xdxt
 VR3SDI8ipC96drpx13gOn+MJvNMITMM8SCEBORE9LVb4nQG4upEJszzzDHnzNyb1srcY
 9b7C6mKdI5nh0/17O0ukr80xvcqFAAxuhyTXHodZB5CacyXdGrQq4uuJx5m3SIvo3rz5
 CIJTGUJXtbIe4n7GJmTrXZyqWDPjMnIDgpo1hQXUZuF1Rcy7T3/azO7fXsJ7Yn6IMuok
 fK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754448248; x=1755053048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yl+QGO/FoekIvls1YM3Wb/aWR3GhVD7gGl3r1b1iECk=;
 b=PmXKDLq8/oBgbkvN8OBnYc319ShSG+/3Tz1vpc6B0oSNaTdhrvifu1z2nEcVk0Ug5k
 BigKg6kPFMwA/Zfxf6Xx1ylNMK3sevrHS09YMgDCrLn4L8yZGClH8qVuyfwkivFDJDTt
 lXtYXbysyo8uFjlHHjDvHcbVHZ2qIhl90pFOVCaEKmT3GBVPBnMk4RwbsPhkjptUCHb7
 /LoarPBqAqseWSo0d2CiPIX5ni2AQdvE0iAGnADsKjoEwqSv4VzOKkAEOTS5CA2PAqQR
 CN24zauhqrGWg+NmXDwz8C13gZ1p6+7VXBWTMZe2o/aiWnElEabUh+GmjKFSusl2USNN
 8R1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUoZBc0PBgceKdNGUe+hW/Yzv+Lw+wjbqhdJbfST9jCxwGPC5mUa9vBf5KmJy8S/sWX9BpE+1zUb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhh1/WMvNEZbobt5sy0uP/QsN2h6hq4dUIh5e+vQxhRICewKiI
 L+sFq8XQ5WyXoG80Md1h7gXF7KjMvXT4g8ayfMXOo3WJyFSlQgOboeoByosKaHYSOWArWVGV34+
 EsJ2WQTMtVrUDHhhWgwG/sPaUT06k1x8hCA==
X-Gm-Gg: ASbGncs2X965kUfHJxwHFSAv4uSPC1zqjf+nlztKWh4scfDAnFp89BZsuxhfnLhtUTC
 X5ea8qz7EYVlLRqD7L6bQHdl+3rrpZOo4LkEpPDjUsC63kFzrDowOedrA4FXEP5MhppzNc2zckH
 4FHt4bdSCwcRzi0ps+0IYw0MiZXuniHdQ8aVKJY1pfaatFGX7HjdgZIEE5A7xkiaTcO3UIr+mEI
 pJdxQ==
X-Google-Smtp-Source: AGHT+IF6gdunMuxxeD8XNnNrX3S700rIKtscM3tEiLfMAUDVgc9a/tKH7mRQBLP0x++zaPZbw+qA2m9BHuLZYyUg2SQ=
X-Received: by 2002:a17:907:972a:b0:ae6:d94f:4326 with SMTP id
 a640c23a62f3a-af992c8337amr68053666b.57.1754448246990; Tue, 05 Aug 2025
 19:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250714052243.1149732-1-airlied@gmail.com>
 <20250714052243.1149732-14-airlied@gmail.com>
 <77949b3a-201d-4e7d-a51f-e77274e4a4be@amd.com>
 <CAMwc25qP-42wMX4UYhZWiYfvf_1dBVNL9TU9i_Wq7uZPqjQL5Q@mail.gmail.com>
 <CAMwc25pyqhcq-8ubGZT5UX5AYroewBYP6oFN-JmjzEkHgFLTrg@mail.gmail.com>
 <903cbf42-2fde-4e38-89e4-2d7287b845bf@amd.com>
In-Reply-To: <903cbf42-2fde-4e38-89e4-2d7287b845bf@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 Aug 2025 12:43:55 +1000
X-Gm-Features: Ac12FXyxt1T3fE4KRr9aHM4t1lx2fuu-xcZzTkB4ybZNfSc56ewnbwyqjXQ1XGo
Message-ID: <CAPM=9twR1S+O9G6gQMJkssTh22KRQ-rb4WsJPnXiXz+y_9oi6w@mail.gmail.com>
Subject: Re: [PATCH 13/18] ttm/pool: enable memcg tracking and shrinker. (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
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

On Mon, 4 Aug 2025 at 19:22, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Sorry for the delayed response, just back from vacation.
>
> On 22.07.25 01:16, David Airlie wrote:
> >>>> @@ -162,7 +164,10 @@ static struct page *ttm_pool_alloc_page(struct =
ttm_pool *pool, gfp_t gfp_flags,
> >>>>               p =3D alloc_pages_node(pool->nid, gfp_flags, order);
> >>>>               if (p) {
> >>>>                       p->private =3D order;
> >>>> -                     mod_node_page_state(NODE_DATA(page_to_nid(p)),=
 NR_GPU_ACTIVE, (1 << order));
> >>>> +                     if (!mem_cgroup_charge_gpu_page(objcg, p, orde=
r, gfp_flags, false)) {
> >>>
> >>> Thinking more about it that is way to late. At this point we can't fa=
il the allocation any more.
> >>>
> >>
> >> I've tested it at least works, but there is a bit of a problem with
> >> it, because if we fail a 10 order allocation, it tries to fallback
> >> down the order hierarchy, when there is no point since it can't
> >> account the maximum size.
> >>
> >>> Otherwise we either completely break suspend or don't account system =
allocations to the correctly any more after resume.
> >>
> >> When you say suspend here, do you mean for VRAM allocations, normal
> >> system RAM allocations which are accounted here shouldn't have any
> >> effect on suspend/resume since they stay where they are. Currently it
> >> also doesn't try account for evictions at all.
>
> Good point, I was not considering moves during suspend as evictions. But =
from the code flow that should indeed work for now.
>
> What I meant is that after resume BOs are usually not moved back into VRA=
M immediately. Filling VRAM is rate limited to allow quick response of desk=
top applications after resume.
>
> So at least temporary we hopelessly overcommit system memory after resume=
. But that problem potentially goes into the same bucked as general evictio=
n.
>
> > I've just traced the global swapin/out paths as well and those seem
> > fine for memcg at this point, since they are called only after
> > populate/unpopulate. Now I haven't addressed the new xe swap paths,
> > because I don't have a test path, since amdgpu doesn't support those,
> > I was thinking I'd leave it on the list for when amdgpu goes to that
> > path, or I can spend some time on xe.
>
> I would really prefer that before we commit this that we have patches for=
 both amdgpu and XE which at least demonstrate the functionality.
>
> We are essentially defining uAPI here and when that goes wrong we can't c=
hange it any more as soon as people start depending on it.

 Maarten has supplied xe enablement patches, I'll go spend some time
looking into this on there as well.

>
> >
> > Dave.
> >
> >>>
> >>> What we need is to reserve the memory on BO allocation and commit it =
when the TT backend is populated.
> >>
> >> I'm not sure what reserve vs commit is here, mem cgroup is really just
> >> reserve until you can reserve no more, it's just a single
> >> charge/uncharge stage. If we try and charge and we are over the limit,
> >> bad things will happen, either fail allocation or reclaim for the
> >> cgroup.
>
> Yeah, exactly that is what I think is highly problematic.
>
> When the allocation of a buffer for an application fails in the display s=
erver you basically open up the possibility for a deny of service.
>
> E.g. imaging that an application allocates a 4GiB BO while it's cgroup sa=
ys it can only allocate 2GiB, that will work because the backing store is o=
nly allocated delayed. Now send that BO to the display server and the comma=
nd submission in the display server will fail with an -ENOMEM because we ex=
ceed the cgroup of the application.
>
> As far as I can see we also need to limit how much an application can ove=
rcommit by creating BOs without backing store.
>
> Alternatively disallow creating BOs without backing store, but that is an=
 uAPI change and will break at least some use cases.

This is interesting, because I think the same DOS could exist now if
the system is low on memory, I could allocate a giant unbacked BO and
pass it to the display server now, and when it goes to fill in the
pages it could fail to allocate pages and get ENOMEM?

Should we be considering buffer sharing should cause population?

Dave.
