Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA79CA4CAB
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 18:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E139310E9A2;
	Thu,  4 Dec 2025 17:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cvWa7ep5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE61D10E99E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 17:42:49 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-6433f99eb15so1079173d50.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764870168; x=1765474968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaLDI00jP2Le4t+44M8Jp/cxXShGK+mapB77b3iB02k=;
 b=cvWa7ep5RJ3z0Dl9KvcTv/7YzMGNRRNyWwOt5VOb+paRavoaNHAFkQGXjmnV3YeUjX
 6NpPija/hLLS75JQV1VEnvF58447sCL6qXFt+hQpaeW1DrzIslSldBefvh1OBrjx478B
 7IaY5q+iPnZZef6VSMWdWEThbz/Pio2qxShwV9PBN1nWMA33ze2VN0I5XWfoLrXT6Drn
 QETB69ysNGE2D8iR2uIVMYQsjOdpfbAVnI35RS76M5Up3Tsig7/Q9geppj+JF4TDNZ1V
 wmTfjRxoT2nj9r4k0nbdIXeHIcZzCLnocSNrA3XG2/2jvA34A5b4yI1SNZsC777Oe54F
 23YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764870168; x=1765474968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IaLDI00jP2Le4t+44M8Jp/cxXShGK+mapB77b3iB02k=;
 b=jJIw3eGnEglu1HhUwaeU3B4ppyFGbxz+jgiUQgkJChawQpCVI9QAXsRR/xJG6V6Fga
 zn/dO8oaA69qZb6GjA/MfzmsSpY849Dtdk+p0zwwcy6mmVdVet0q9vYJLJUBqYXh603r
 Xp5HQlNJWjXFCXNSi3x464nfjK19jZCXmfBVrV3HwW5679f8B86UpjF12cAiYG5tqAoI
 bVaOW3dcH6OK8EFJpX/NDhrsXNFd6WQMMT42Ol8cwoONkjrPCtc9LPnhIP6q1F42d8do
 bMdLfyd8jYHhktQgjO/KM4e83PyBYXIh6lNlZG2HSa6VE4SrUwk7DP2UNtMcGLUeWrtr
 cpSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiV7MQOe0/5QUxbJDqIJTpgrrkEtJjLzHpNHA/Bmh8Z8KKWQ2lg9hahtX6NWaOeMwW09PCuVfFuSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHRRWIS5/UF16f0RaNg6mL4eELundScwHOCfZMxwD04A1iVL9e
 q77GCXS2DEq+LGEUdAe+LSc4b7LWZs2nEyWwTOxC74xJAVOGTq2SeUCHVXCm6Ud6e3g/Ag+5fQD
 8OpJe1sGfA1Gi+o6suCndg/sb61u26vA=
X-Gm-Gg: ASbGncviPaR6PkD1zyv6CiLXeCm1bDifT9w7ckBgV9ke4eItRfJaczDY1hDrmQfLb+g
 wy5SReYVobeDBGfKMhYCeH7WX0rRlNRk/Pt8sjjcF1ECFLVhHNZ9jKvLpskNKQWZ0sUwqMbHL4G
 ahMKXT5/2O1Y4N5YHgRCZGdPbGqUJkBJC7/FQFqX+qkJPw3XUwJgWbh0VjKZDrtNnbudrhelu6j
 509K/GlH5+4cSQ+7PZ0Q2LX98JYp9K+9/dbBjHuxFfwarusDYlPAjAZH4rHAo6CbrkW9AUAFIBA
 LY3CScQgXV5nv1nkmgeeMiTduQlLLw==
X-Google-Smtp-Source: AGHT+IE1VcF6hQ2p7X96lVzz+skbB6pNNtTqQ6Gp0j8BqX7UDkVxeDg0tvPBVaSgeyQ/M7mXJUsatVTa2fKMmTCOhBQ=
X-Received: by 2002:a53:b117:0:b0:641:f5bc:694b with SMTP id
 956f58d0204a3-64437073b98mr3829507d50.79.1764870168410; Thu, 04 Dec 2025
 09:42:48 -0800 (PST)
MIME-Version: 1.0
References: <20251204015034.841235-1-olvaffe@gmail.com>
 <4e59c6f8-bc9b-4fd5-9b0f-511cce760ac2@igalia.com>
In-Reply-To: <4e59c6f8-bc9b-4fd5-9b0f-511cce760ac2@igalia.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Dec 2025 09:42:37 -0800
X-Gm-Features: AQt7F2puNmX2KyX6TyXnxR1MKfrGAStg8Zwz92BEudu1cuai_EbvkJEu8BIq24o
Message-ID: <CAPaKu7QuUS_Nkh9cya4Nf9_=gTEMSZR-iUrFXMYyV3C=2jFjhg@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: fix for dma-fence safe access rules
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Dec 4, 2025 at 1:27=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@igali=
a.com> wrote:
>
>
> On 04/12/2025 01:50, Chia-I Wu wrote:
> > Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
> > the rules") details the dma-fence safe access rules. The most common
> > culprit is that drm_sched_fence_get_timeline_name may race with
> > group_free_queue.
> >
> > Fixes: d2624d90a0b77 ("drm/panthor: assign unique names to queues")
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >   drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index 33b9ef537e359..a8b1347e4da71 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -23,6 +23,7 @@
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_runtime.h>
> > +#include <linux/rcupdate.h>
> >
> >   #include "panthor_devfreq.h"
> >   #include "panthor_device.h"
> > @@ -923,6 +924,9 @@ static void group_release_work(struct work_struct *=
work)
> >                                                  release_work);
> >       u32 i;
> >
> > +     /* dma-fences may still be accessing group->queues under rcu lock=
. */
> > +     synchronize_rcu();
> > +
> >       for (i =3D 0; i < group->queue_count; i++)
> >               group_free_queue(group, group->queues[i]);
> >
>
> This handles the shared queue->fence_ctx.lock as well (which is also
> unsafe until Christian lands the inline lock, etc patch series) so it
> looks good to me as well.
Yeah, I will send v2 to drop the misleading "Fixes:" tag.

FWIW, the UAF I saw was from accessing the string returned by

static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
{
        struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
        return (const char *)fence->sched->name;
}

I thought it was "name" and added the "Fixes:" tag. But actually
"sched" was also freed by group_release_work.

>
> Just to mention an alternative could be to simply switch release_work to
> INIT_RCU_WORK/queue_rcu_work, but I am not sure if that has an advantage.
>
> Regards,
>
> Tvrtko
>
