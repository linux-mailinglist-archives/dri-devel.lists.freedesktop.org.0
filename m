Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA09F164A57
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D68890E8;
	Wed, 19 Feb 2020 16:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F1088AD9;
 Wed, 19 Feb 2020 16:29:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so1268203wrt.6;
 Wed, 19 Feb 2020 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ge/4+ByC0/Mud4KiwRUU53N7gO/qK6WBDI8vObP1gB8=;
 b=nDEVLs/IIZtpORix+sjwoMjmtO3ZAlRhhQOEfU0Q3KD5K86wBr1q0mJXuabDlIvOQn
 bWxkMy74M7+LpTozg1bTdVroNdJeMZB86wLHLvmgqG6hPqBEbJLuSIxO98UyMi2CO2Cg
 F/qVeSmjj3CsDqfixTLub97ue2qI8iicYlfld0biO2Ij6QI08x5vVOTJ2cc6XWa9oaIt
 KWkrOo9yjogrswdLtiCsg4MTzFw6YueFqqNbfHkDY73ocDk8GXU2a2GGvtFWVfqqp1NX
 WZOgptcWjxiTjC17ZwO0BXYsXIiY9nsntQ3a1wjPCFgL1BLE9yWYBAi5JGRkGUCdWl/j
 qdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ge/4+ByC0/Mud4KiwRUU53N7gO/qK6WBDI8vObP1gB8=;
 b=FghdL++QU0G/dY+5yx8Z9a9TWy4EBcwQfd1mjm1sYdUcvyTwVClvyepy97BT2wMUdD
 gqN6UTkaQgEfRanhDfFHUFshicAqTH7sypTISJVm45oS9zAferRfeNqRb8Xh3cjt9u64
 DU4mZweJPYFoA2HT1PSoq78XQ3SMHgGp2LjJiO7YbEpCxis5QxAIxk/2acp4cWKJ424i
 5fmAe8x5dXxAql9U7ev7wukwJN57lBJKQUwIdchgns6dy3Vgq9ig49+WstcGsSB29An2
 W0ypTBEQNsvzYl7XElE82MzpOyq2WCP+bB8ZxIjoDqWHXP9zkAcGDOrYWOhltV23mSyL
 xqXw==
X-Gm-Message-State: APjAAAV4duUCJjxgcRT0IzH+0GtvnRSIidDHfMU6vZn/Jw2CpxW9rg0P
 oVhwklLtrlzT86+eugzETsNPz0zmg/ZUbyhPceg=
X-Google-Smtp-Source: APXvYqyP+L9+XOLBDf5SEUNbZhoITOmxettkhcIIuxzCeHf43MW2BeliuAzIc4CO4JF7Ah7P3g9oJtkoiotJv45DS9Y=
X-Received: by 2002:adf:cd03:: with SMTP id w3mr37455254wrm.191.1582129741265; 
 Wed, 19 Feb 2020 08:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
 <20200214155650.21203-10-Kenny.Ho@amd.com>
 <CAOFGe96N5gG+08rQCRC+diHKDAfxPFYEnVxDS8_udvjcBYgsPg@mail.gmail.com>
 <CAOWid-f62Uv=GZXX2V2BsQGM5A1JJG_qmyrOwd=KwZBx_sr-bg@mail.gmail.com>
 <20200214183401.GY2363188@phenom.ffwll.local>
 <CAOWid-caJHeXUnQv3MOi=9U+vdBLfewN+CrA-7jRrz0VXqatbQ@mail.gmail.com>
 <20200214191754.GA218629@mtj.thefacebook.com>
 <20200219161850.GB13406@cmpxchg.org>
In-Reply-To: <20200219161850.GB13406@cmpxchg.org>
From: Kenny Ho <y2kenny@gmail.com>
Date: Wed, 19 Feb 2020 11:28:48 -0500
Message-ID: <CAOWid-e=7V4TUqK_h5Gs9dUXqH-Vgr-Go8c1dCkMux98Vdd1sQ@mail.gmail.com>
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

On Wed, Feb 19, 2020 at 11:18 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> Yes, I'd go with absolute units when it comes to memory, because it's
> not a renewable resource like CPU and IO, and so we do have cliff
> behavior around the edge where you transition from ok to not-enough.
>
> memory.low is a bit in flux right now, so if anything is unclear
> around its semantics, please feel free to reach out.

I am not familiar with the discussion, would you point me to a
relevant thread please?  In addition, is there some kind of order of
preference for implementing low vs high vs max?

Regards,
Kenny
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
