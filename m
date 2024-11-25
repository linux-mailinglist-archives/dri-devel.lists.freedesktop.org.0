Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0319D9345
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CAA10E7E3;
	Tue, 26 Nov 2024 08:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="AeukbDqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0631A10E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:48:38 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6eeee645605so22397447b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 03:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1732535318; x=1733140118;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=476juWLLXH68WdEd6CCvoohOL74hVP8YdxJenm7T9uk=;
 b=AeukbDqzbBlWXMowElCAl/NEhPdCsOmzZbvo8XF3NEnOn5blm+IPPzu8K3oKIc9VJW
 75VvNr1cag5ni+ndmg8ADa/keAV1GE4zs34XPI3td0pnrGzqcJu7ZriB9EAhzA3E94hY
 YlwuRppNo16WiqGBRHzkT4l5WjsYZFAZ3lv2g1IuUj2mcaDkJpFCTRK60VwXMCkymBwo
 NJtBUBTE++8RIJvDEuFOKBvRyFM5VwcRLLtJAMwCD0nNajLMU5jw2YfKQAj3QQj+YNoR
 PAxzU/qHwA5cOxWIxJNwBcEsvskzDkC8pPQ2DExoxegzvE6AbaRIiz0hZ5Y+1MLtwhub
 HeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732535318; x=1733140118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=476juWLLXH68WdEd6CCvoohOL74hVP8YdxJenm7T9uk=;
 b=wtBvVsivHOTOqr7JZ5ezHRz8nHcq+N2wllc1A46XP+YTzGUigCAqTrMyq4Rx0j/Nvj
 JQgbt0gb8dQyvJlAHdRzTJ4gvIOz/wP2S6CotKjdLfQgSwA3HtlPlyAQWR5xTmsBZbSm
 iP9X+c29y3f2OcT6cJji1KubPg1G4LKI8aP3ENX7vRDLzDID/FONd1doYfw/9xOfD9lS
 oiR86BWZEhc0jRt2PUnFeLjGi299zUzWHL4dSLoIJgNfcBDog7j5nnUKOR4QTnw/y0LO
 OZcg00+C6ZLy1FJleESlW0mII6g7OXeoqznw+RE6TvHJ9Ppm5RkySHXWhBIuzDb2BuXl
 3VdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuVx8Nd0Mv7XQTFkSxNX4a5wPl34oL5G+YreMzcd0YxuSazHm5pl94C3TwxSw82vhszCN62wD4tLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJQyXTMfe9KCL0swK/PtnRmqL7262gU+81BUY/V7WuVX+ATOTY
 opOFsh8rHmKKHxlAHkQrttMh1rtXtwAKa4ftZicQLhSJ++wMPWiGCkZlq4izgL7YA/6swEW/rZw
 yXPxMLL1YfQclVKpLHCv2weOnlXo=
X-Gm-Gg: ASbGncsJUi6lqC/ChLrSXUXn+YMXBwe+wbhryqaqoENMf6Z0VjlVCpKH459IjTjZVot
 nHG6hr0aIPmDuidEvWf8q/nJVZG94ydg6
X-Google-Smtp-Source: AGHT+IGYP2SKdODKsnDK/PfBnKLbQWqO3MML2UPkyylWYXOgHgp7Wt8KYifNK0fRtunrvJy8VyVVbVwzaUlM3QnofG0=
X-Received: by 2002:a05:6902:2084:b0:e38:ea81:d01e with SMTP id
 3f1490d57ef6-e38f8aca119mr9503432276.8.1732535317875; Mon, 25 Nov 2024
 03:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20241125104011.36552-1-cgoettsche@seltendoof.de>
 <20241125104011.36552-5-cgoettsche@seltendoof.de>
 <1045101183.70157813.1732534258584.JavaMail.zimbra@nod.at>
In-Reply-To: <1045101183.70157813.1732534258584.JavaMail.zimbra@nod.at>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Mon, 25 Nov 2024 12:48:27 +0100
Message-ID: <CAJ2a_Dd_sz2LYEEJJhiJE=JP81V4AvET=jgSyRe73eF-YjeXhg@mail.gmail.com>
Subject: Re: [PATCH 06/11] ubifs: reorder capability check last
To: Richard Weinberger <richard@nod.at>
Cc: LSM <linux-security-module@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 chengzhihao1 <chengzhihao1@huawei.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, cocci <cocci@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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

On Mon, 25 Nov 2024 at 12:31, Richard Weinberger <richard@nod.at> wrote:
>
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Christian G=C3=B6ttsche" <cgoettsche@seltendoof.de>
> > capable() calls refer to enabled LSMs whether to permit or deny the
> > request.  This is relevant in connection with SELinux, where a
> > capability check results in a policy decision and by default a denial
> > message on insufficient permission is issued.
> > It can lead to three undesired cases:
> >  1. A denial message is generated, even in case the operation was an
> >     unprivileged one and thus the syscall succeeded, creating noise.
> >  2. To avoid the noise from 1. the policy writer adds a rule to ignore
> >     those denial messages, hiding future syscalls, where the task
> >     performs an actual privileged operation, leading to hidden limited
> >     functionality of that task.
> >  3. To avoid the noise from 1. the policy writer adds a rule to permit
> >     the task the requested capability, while it does not need it,
> >     violating the principle of least privilege.
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > ---
> > drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
>
> This change is unrelated, please remove it.

Sorry, somehow these two changes got erroneously combined in a single patch=
.
I'll send a v2 with them split into separate ones.

>
> > fs/ubifs/budget.c                     | 5 +++--
> > 2 files changed, 4 insertions(+), 3 deletions(-)
>
> [...]
>
> > diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
> > index d76eb7b39f56..6137aeadec3f 100644
> > --- a/fs/ubifs/budget.c
> > +++ b/fs/ubifs/budget.c
> > @@ -256,8 +256,9 @@ long long ubifs_calc_available(const struct ubifs_i=
nfo *c,
> > int min_idx_lebs)
> >  */
> > static int can_use_rp(struct ubifs_info *c)
> > {
> > -     if (uid_eq(current_fsuid(), c->rp_uid) || capable(CAP_SYS_RESOURC=
E) ||
> > -         (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)=
))
> > +     if (uid_eq(current_fsuid(), c->rp_uid) ||
> > +         (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)=
) ||
> > +         capable(CAP_SYS_RESOURCE))
> >               return 1;
> >       return 0;
> > }
>
> The UBIFS part looks ok:
>
> Acked-by: Richard Weinberger <richard@nod.at>
>
> Since I was not CC'ed to the whole series, I miss a lot of context.

The series consists of similar patches to other subsystems and a
coccinelle script addition.
See https://lore.kernel.org/linux-security-module/20241125104011.36552-11-c=
goettsche@seltendoof.de/#t

> Will this series merged as a whole? By whom?
>
> Thanks,
> //richard
