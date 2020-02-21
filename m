Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B41166F64
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 07:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAF16EE93;
	Fri, 21 Feb 2020 06:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6076EE93;
 Fri, 21 Feb 2020 06:00:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m10so4373321wmc.0;
 Thu, 20 Feb 2020 22:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7aXQTqmLNxvdPr5mBNnJfbo38LB1xJHVHK2rWbKEqw=;
 b=MOqfv/kaObHJEU4A0mnaFSEPVoAQ+XzGpPBw1qUzIDChC2bV5Xis329ghi0OSMUe2T
 YhVicpLrQndbQZs6riGjFqTmtdy+EMbG4jyCnKVus42lLRijK/C+rJhfwsU1A1+dZ2oq
 x9Iy53HEEPilEHf0enrdVhBui0Cuk44XNN8OwtHBWBHJG4b2EaSDPRDTxw6C8lUt5zYA
 mHMjTP2udC0KW3zyt6aJmu5BQahyQw6PpXAAISnMF6MG4/nYxe6+8f552zlV89Bl8i8e
 Rq9Iqy2Y+S2iwCZPuVrxEqWRujTeaoMDyqLddd6W1ztvZrcj+S68m6+yNug0QMoHvJop
 m+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7aXQTqmLNxvdPr5mBNnJfbo38LB1xJHVHK2rWbKEqw=;
 b=M3mZjYFyNDzYCIJBzPFvnfSSdBlXrABVTSn4uX42+70ZOgGv7fp/1uqTQOBPnG3Ewu
 SWpMqDxG58snsEGNr/hlimow8QSRe5Wz5A+MHw4Oes92fIF7Xlfmf3QSHFprJD4Dzcj+
 0GjFTQhX8sVsXcasRTlLqD2zSpQ0+wNOzze8vks3yKD8Uq6mOA2XkcPND1HfXYWJcGun
 9L7m70SxghdDJKbJW6qyBGQC0dJMFv55vgYtDL9LrtRSTOco4qHUi6saJmgKxeJsKcvz
 DswJYdwHRF7QCM4CzwDdTqZ7vVmcoEu0rbfiuEGBbZuVkQSS4mmWuQrSaxJCTHCOBrDc
 kHBQ==
X-Gm-Message-State: APjAAAU1Krm9fpxIKZwInzW96r48iW3wIialF9ZOmnM5B7EVSXNbbuQ0
 LOuetR7RtEYdy7VFREkFvZNoI15T2yLV5vu7XL4=
X-Google-Smtp-Source: APXvYqwUciNnVQPNEXNeyIwx5TVfT9GtH4vdeEDW/3kEC5yZ72E+38Ud0AgtP2twlUA6naX2Ps2iMF7lw5IFwrkqRMQ=
X-Received: by 2002:a1c:9602:: with SMTP id y2mr1420482wmd.23.1582264807381;
 Thu, 20 Feb 2020 22:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
 <20200214191754.GA218629@mtj.thefacebook.com>
 <20200219161850.GB13406@cmpxchg.org>
 <CAOWid-e=7V4TUqK_h5Gs9dUXqH-Vgr-Go8c1dCkMux98Vdd1sQ@mail.gmail.com>
 <20200219183841.GA54486@cmpxchg.org>
In-Reply-To: <20200219183841.GA54486@cmpxchg.org>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 21 Feb 2020 00:59:55 -0500
Message-ID: <CAOWid-dLs079jHAVoDeJ2Ung1Tti0Jszhd-0D2RYPOjuWnTprQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] drm, cgroup: Introduce lgpu as DRM cgroup resource
To: Johannes Weiner <hannes@cmpxchg.org>
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
Cc: juan.zuniga-anaya@amd.com, Kenny Ho <Kenny.Ho@amd.com>, "Kuehling,
 Felix" <felix.kuehling@amd.com>, jsparks@cray.com, nirmoy.das@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 damon.mcdougall@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, I will take a look.

Regards,
Kenny

On Wed, Feb 19, 2020 at 1:38 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Wed, Feb 19, 2020 at 11:28:48AM -0500, Kenny Ho wrote:
> > On Wed, Feb 19, 2020 at 11:18 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > >
> > > Yes, I'd go with absolute units when it comes to memory, because it's
> > > not a renewable resource like CPU and IO, and so we do have cliff
> > > behavior around the edge where you transition from ok to not-enough.
> > >
> > > memory.low is a bit in flux right now, so if anything is unclear
> > > around its semantics, please feel free to reach out.
> >
> > I am not familiar with the discussion, would you point me to a
> > relevant thread please?
>
> Here is a cleanup patch, not yet merged, that documents the exact
> semantics and behavioral considerations:
>
> https://lore.kernel.org/linux-mm/20191213192158.188939-3-hannes@cmpxchg.org/
>
> But the high-level idea is this: you assign each cgroup or cgroup
> subtree a chunk of the resource that it's guaranteed to be able to
> consume. It *can* consume beyond that threshold if available, but that
> overage may get reclaimed again if somebody else needs it instead.
>
> This allows you to do a ballpark distribution of the resource between
> different workloads, while the kernel retains the ability to optimize
> allocation of spare resources - because in practice, workload demand
> varies over time, workloads disappear and new ones start up etc.
>
> > In addition, is there some kind of order of preference for
> > implementing low vs high vs max?
>
> If you implement only one allocation model, the preference would be on
> memory.low. Limits are rigid and per definition waste resources, so in
> practice we're moving away from them.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
