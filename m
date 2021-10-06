Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47542418B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2039A6E849;
	Wed,  6 Oct 2021 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C59F6E507;
 Wed,  6 Oct 2021 07:58:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id r18so6370845edv.12;
 Wed, 06 Oct 2021 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XQWQgm5VcZfwx8EzNe7mxtfcL9BKDaqUq1fkeXHfikM=;
 b=go2U0cZ/aA/3NlaoPZZ6FEAxyPlr7Aag5bsPxBltHNCGKtsLteGuw3p0Zm0tpT6nDg
 LVfkjy3shRzmwvTA1cpZYw6dwe2DiZOxoYOjxFL0ahoYDvRMk5bKKx00bQOq/4bk8+5z
 OwVLwtxs/1Cwsb8tqqDuoq4cbU+tHuIDRhNwcXCYIKWvL/NhvK0JKeGIUs3bsFKq+vG3
 DjOXpLRTOMv4lj57RyY/J2DwfZlONcbFfzb9dDYCWXZY1acpXIhuGBd4plNXejMKtpUf
 Zh5hCdzayuLXMmXN5fvMdgRUn+wDH/U/qC0hj85S6xmLCVVnbZljjFGOH68U2iIdcAFS
 jMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XQWQgm5VcZfwx8EzNe7mxtfcL9BKDaqUq1fkeXHfikM=;
 b=GQ/nSLSl7yeacaNQ1gt0gnJ7xeU9JGFwKmERuIGrtXSkx3nDvYCKUHdS5pL3eRIaQP
 N/kzVYTPJwi9+pUL/b1YJUUmzKQ1/WzqvTaQabKGAwDxWXJvi+wr6zeUc2j8ot38lf+j
 q2/Yol+k+AGPIBwCS3s5sGJQK6GuBkEVkwkPPKFjDhXFDt45hJMJ9ccox3ympyoTJvyV
 eTVwIrQNQZxIW++1RZWsHtiB1CDYweVXnRBvjkRIX8Yan3y0j0Yi6Cz8ewNM62WZZOi7
 MBXBjUAy6lnFvnxJuUZVNFLsd80+L+YpoeSBVYx52H6DH53L28Qv37uAuv2ff1kH7RWm
 cyvQ==
X-Gm-Message-State: AOAM531dll/GgiBKSPX2GsTLv/wnefUoWYnJR479H0DbRMFbX7UBoORe
 hL5HmhDsPZc54qMtxd0PVKaGGnfgyBU0njRODOc=
X-Google-Smtp-Source: ABdhPJywczBI9jhEPZFGmv+cCh3Y4y0E1Q5f7f64/ji6b1R1/AHKHuAeI+tOuJbvNj3FJdtxuUAPLUMgj3BjWxJnVlE=
X-Received: by 2002:a50:dacf:: with SMTP id s15mr32715768edj.385.1633507107111; 
 Wed, 06 Oct 2021 00:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-2-tvrtko.ursulin@linux.intel.com>
 <562d45e1-4a27-3252-f615-3ab1ef531f2b@huawei.com>
In-Reply-To: <562d45e1-4a27-3252-f615-3ab1ef531f2b@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 6 Oct 2021 20:58:15 +1300
Message-ID: <CAGsJ_4w5Y4=v93YmTrXJ6hDgjKshxiAZ-ox-Nz_7uRwe4ECtdw@mail.gmail.com>
Subject: Re: [RFC 1/8] sched: Add nice value change notifier
To: "Wanghui (John)" <john.wanghui@huawei.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 06 Oct 2021 15:43:56 +0000
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

On Wed, Oct 6, 2021 at 5:15 PM Wanghui (John) <john.wanghui@huawei.com> wro=
te:
>
> HI Tvrtko
>
> On 2021/10/4 22:36, Tvrtko Ursulin wrote:
> >   void set_user_nice(struct task_struct *p, long nice)
> >   {
> >       bool queued, running;
> > -     int old_prio;
> > +     int old_prio, ret;
> >       struct rq_flags rf;
> >       struct rq *rq;
> >
> > @@ -6915,6 +6947,9 @@ void set_user_nice(struct task_struct *p, long ni=
ce)
> >
> >   out_unlock:
> >       task_rq_unlock(rq, p, &rf);
> > +
> > +     ret =3D atomic_notifier_call_chain(&user_nice_notifier_list, nice=
, p);
> > +     WARN_ON_ONCE(ret !=3D NOTIFY_DONE);
> >   }
> How about adding a new "io_nice" to task_struct=EF=BC=8Cand move the call=
 chain to
> sched_setattr/getattr, there are two benefits:

We already have an ionice for block io scheduler. hardly can this new io_ni=
ce
be generic to all I/O. it seems the patchset is trying to link
process' nice with
GPU's scheduler, to some extent, it makes more senses than having a
common ionice because we have a lot of IO devices in the systems, we don't
know which I/O the ionice of task_struct should be applied to.

Maybe we could have an ionice dedicated for GPU just like ionice for CFQ
of bio/request scheduler.

>
> 1. Decoupled with fair scheduelr. In our use case, high priority tasks of=
ten
>     use rt scheduler.

Is it possible to tell GPU RT as we are telling them CFS nice?

> 2. The range of value don't need to be bound to -20~19 or 0~139
>

could build a mapping between the priorities of process and GPU. It seems
not a big deal.

Thanks
barry
