Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1EAF0658
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 00:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DDB10E2EE;
	Tue,  1 Jul 2025 22:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dtiokMTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BB510E2EE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751407885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2n1GCzFsQdFgvd4JqLPeVxo7Fy9M1vZuKb3K8BjYfY=;
 b=dtiokMTPeoBIGlMl9GW43O9k40WO3RyoNekbJWCOy1FGgFIGYud+tXGopI2OaL9bIb8Rik
 A9W9MVfuD21MsmgXvEmCdElcQK55DqocHuISPzvQbhQo0K65/rB6Cpaqb3aE8sf5lx/WBu
 mmNn0xLVOQxqCdDXkrdAWGZk2J0cUCc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-Qo2pqZbxNYGir1gdE7ZgqQ-1; Tue, 01 Jul 2025 18:11:24 -0400
X-MC-Unique: Qo2pqZbxNYGir1gdE7ZgqQ-1
X-Mimecast-MFC-AGG-ID: Qo2pqZbxNYGir1gdE7ZgqQ_1751407883
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311e98ee3fcso6480323a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 15:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751407883; x=1752012683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2n1GCzFsQdFgvd4JqLPeVxo7Fy9M1vZuKb3K8BjYfY=;
 b=T8xm8D03YdV5LnsHvl83W+wtrl5f+TnSEbICyBertuBP0m4guXv3zD678VYEbtFe+r
 JX5ArwvCbF7PBvTooL6d+J1cZYGr3ZFkkDoCuvehSml1h+gz2A/+no8O8HzYg8P9DFIF
 sr8kJmoEoFlIKrHy9QzLVLlm4wE+b5hxUy2dq2qqOG1w4iP4H6KZw0Z2Vmj/EmRVBZyb
 eTkgY09HyiztZTbO/TY5INTKo0EYhY6UOs9VKQxOSBJ6pN9QPVc8OoiPGX5tHUbjxCwl
 XqHyKNdo4v6i7UERxuI1SH4E90cplHtQxgXKTTHl4afUH9TXSCPeEOCpQU2xiWHxD6BG
 T5xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEVo33MbrMv53q9ym9D6q6bzzbBTPTMvcmgL2gyi4JrON5NFWWmFNIeKpu+jgeNRnsHmJUk5DzOo0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJmZTjD1IUIhNSNUqxbp0Oy3/iKpr+3R8QIXnvs2Pp58GA+yiy
 F6AQakiopwnM5f9b5cfwNCQHshZRaBEDIfAb4kmD6/HXc6nSv4DXHNroEYWiSwDVI7rcJAykLu3
 rxA+zuKfODBuSIE74cbsM6DNlgqLrfCyrw6R51yXwhZcYtZA5YCFewo1J3W96ZKpY30FU63d7Jc
 /DO53Zpe3olXV80WBmzAc61fd4lIh39l0a/s9GsLpZCA9ALcW20GSH
X-Gm-Gg: ASbGncvyj3Voxg2A8GTvgAEn6aYCs4vbt3v6aMtZ1OoSdSRW2tMrEqHwKXGh3QPdf72
 RyuDuGaZQWCnSQLdeHD5dNpjdBySAytJ3j+BWZyMo2DNRN22T8gc97hzik+fWasw0uvePGS7al9
 si6g==
X-Received: by 2002:a17:90b:380b:b0:31a:8dc4:b5bf with SMTP id
 98e67ed59e1d1-31a9185e610mr282529a91.17.1751407882553; 
 Tue, 01 Jul 2025 15:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsoZMc8z6Gxz67gOWHuiiCXh4z4S9T8Dqh9lIBNI2CgMpFVtMdamz+f579Lo0x4zxMsbD8TT40c9cyGMWRYYc=
X-Received: by 2002:a17:90b:380b:b0:31a:8dc4:b5bf with SMTP id
 98e67ed59e1d1-31a9185e610mr282493a91.17.1751407881888; Tue, 01 Jul 2025
 15:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
 <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
 <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
 <26c79b1e-0f7f-4efa-9040-92df8c5bdf1f@amd.com>
In-Reply-To: <26c79b1e-0f7f-4efa-9040-92df8c5bdf1f@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 2 Jul 2025 08:11:10 +1000
X-Gm-Features: Ac12FXyDpCsACysmA0irocFjIYFGOKWaqYPH9NtEP0X5j4msTJM4YJ3PX16_fGs
Message-ID: <CAMwc25oMQ_=Hagb9N6SN3pFFPwZ8+8ZBOGvziCPhUypMpPeKUQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1zBf1_JCCUxMIxOl48EI9dpSCB5U4bnc0jIw7cIzqO4_1751407883
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 1, 2025 at 6:16=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 01.07.25 10:06, David Airlie wrote:
> > On Tue, Jul 1, 2025 at 5:22=E2=80=AFPM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> >>>>> index 15d4019685f6..c13fea4c2915 100644
> >>>>> --- a/include/drm/ttm/ttm_tt.h
> >>>>> +++ b/include/drm/ttm/ttm_tt.h
> >>>>> @@ -126,6 +126,8 @@ struct ttm_tt {
> >>>>>       enum ttm_caching caching;
> >>>>>       /** @restore: Partial restoration from backup state. TTM priv=
ate */
> >>>>>       struct ttm_pool_tt_restore *restore;
> >>>>> +     /** @objcg: Object cgroup for this TT allocation */
> >>>>> +     struct obj_cgroup *objcg;
> >>>>>  };
> >>>>
> >>>> We should probably keep that out of the pool and account the memory =
to the BO instead.
> >>>>
> >>>
> >>> I tried that like 2-3 patch posting iterations ago, you suggested it
> >>> then, it didn't work. It has to be done at the pool level, I think it
> >>> was due to swap handling.
> >>
> >> When you do it at the pool level the swap/shrink handling is broken as=
 well, just not for amdgpu.
> >>
> >> See xe_bo_shrink() and drivers/gpu/drm/xe/xe_shrinker.c on how XE does=
 it.
> >
> > I've read all of that, but I don't think it needs changing yet, though
> > I do think I probably need to do a bit more work on the ttm
> > backup/restore paths to account things, but again we suffer from the
> > what happens if your cgroup runs out of space on a restore path,
> > similiar to eviction.
>
> My thinking was rather that because of this we do it at the resource leve=
l and keep memory accounted to whoever allocated it even if it's backed up =
or swapped out.
>
> > Blocking the problems we can solve now on the problems we've no idea
> > how to solve means nobody gets experience with solving anything.
>
> Well that's exactly the reason why I'm suggesting this. Ignoring swapping=
/backup for now seems to make things much easier.

It makes it easier now, but when we have to solve swapping, step one
will be moving all this code around to what I have now, and starting
from there.

This just raises the bar to solving the next problem.

We need to find incremental approaches to getting all the pieces of
the puzzle solved, or else we will still be here in 10 years.

The steps I've formulated (none of them are perfect, but they all seem
better than status quo)

1. add global counters for pages - now we can at least see things in
vmstat and per-node
2. add numa to the pool lru - we can remove our own numa code and
align with core kernel - probably doesn't help anything
3. add memcg awareness to the pool and pool shrinker.
    if you are on a APU with no swap configured - you have a lot better tim=
e.
    if you are on a dGPU or APU with swap - you have a moderately
better time, but I can't see you having a worse time.
4. look into tt level swapping and seeing how to integrate that lru
with numa/memcg awareness
    in theory we can do better than allocated_pages tracking, (I'd
like to burn that down, since it seems at odds with memcg)
5. look into xe swapping and see if we can integrate that numa/memcg better=
.

So the question I really want answered when I'm submitting patches
isn't, what does this not fix or not make better, but what does this
actively make worse than the status quo and is it heading in a
consistent direction to solve the problem.

Accounting at the resource level makes stuff better, but I don't
believe after implementing it that it is consistent with solving the
overall problem.

Dave.

