Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC530AD0D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 17:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40206E843;
	Mon,  1 Feb 2021 16:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3816E843;
 Mon,  1 Feb 2021 16:51:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f1so23724114lfu.3;
 Mon, 01 Feb 2021 08:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wF7mWC2M9iBBc+ACGYALfCAPMzd/Re2kA54W5usB+9c=;
 b=cOQzkJjTPteBDAyEwI88kZ6IB+wiDX+1y1GIGJanexyB8HynFGGumgPPIB53qiYArs
 +e7ZbAKr52jZx90yInF//sIz6yDHJwouIdUUpr7f+3RpMaze56OrOgLqkai2EYjbnhH4
 +TjotrLukfQlGShqfr5pes94GebIp75G5LolNlKBcwL38rvVt6GF8CQLI1q9GB1HPcmR
 z6CAHvTshHpQ4KeHiHwtBkg9OEvkkecyzIew0dLXYR5N/LDEFQ7bsggyocEzRyVr7DKk
 qvBdOSvfJVBUqSYoCtiKeZRvkxoEahCvcvZBJrQYAMMjBUSPic/kfUiYpdD6bVKsvhMk
 3tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wF7mWC2M9iBBc+ACGYALfCAPMzd/Re2kA54W5usB+9c=;
 b=PsVU2xr/M8Jc6XO8IjPWFH15w3Lc1pdNliYMwB5+CLbzTQVQd/k36lxw0csUYVNNuc
 cWuIUjYr7kD9QV86q2kFGp09knYrUIiso4e1v9GgpIccBW/bZQI5sSJiCKTP3eRA2+0f
 qSstZciQc8vcjd0rBf1tNd0HFKkA7UHt4ufBLVEM7fThAt5HaHJjo4DZocEoX9xFLZ6w
 iYCanFdk0GFwt3FuLU1JMjwjxCiLmmiHsj/uzugQENcntGuXd7vI4AYoggLig+NDxeK8
 Uic22p9jyAR6uv3cShZTz/7UAbxNGMAY1ZioGI8miEIeaRQVh+F6ZE6KxA6lRzqQQn37
 DWkw==
X-Gm-Message-State: AOAM532He+ENE2NfkiZWYWNLvNtc4+kPlUA7XkZm3oAjFSKjrCqeeKch
 G87xIvzlvAGUiocWx13YZ1ZYNN/giR3q5TLjfk4=
X-Google-Smtp-Source: ABdhPJwU19Ykz6zVy5HPScLPfN7sZ41eNDew+I/XiJKnUJb0R2TV/4YtlOqZLFcdbXx3hMrOMozaP/L2VFq0o4gRw5Y=
X-Received: by 2002:a19:ec03:: with SMTP id b3mr9452260lfa.608.1612198278259; 
 Mon, 01 Feb 2021 08:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20201007152355.2446741-1-Kenny.Ho@amd.com>
 <CAOWid-d=a1Q3R92s7GrzxWhXx7_dc8NQvQg7i7RYTVv3+jHxkQ@mail.gmail.com>
 <20201103053244.khibmr66p7lhv7ge@ast-mbp.dhcp.thefacebook.com>
 <CAOWid-eQSPru0nm8+Xo3r6C0pJGq+5r8mzM8BL2dgNn2c9mt2Q@mail.gmail.com>
 <CAADnVQKuoZDB-Xga5STHdGSxvSP=B6jQ40kLdpL1u+J98bv65A@mail.gmail.com>
 <CAOWid-czZphRz6Y-H3OcObKCH=bLLC3=bOZaSB-6YBE56+Qzrg@mail.gmail.com>
 <20201103210418.q7hddyl7rvdplike@ast-mbp.dhcp.thefacebook.com>
 <CAOWid-djQ_NRfCbOTnZQ-A8Pr7jMP7KuZEJDSsvzWkdw7qc=yA@mail.gmail.com>
 <20201103232805.6uq4zg3gdvw2iiki@ast-mbp.dhcp.thefacebook.com>
 <YBgU9Vu0BGV8kCxD@phenom.ffwll.local>
In-Reply-To: <YBgU9Vu0BGV8kCxD@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Mon, 1 Feb 2021 11:51:07 -0500
Message-ID: <CAOWid-eXMqcNpjFxbcuUDU7Y-CCYJRNT_9mzqFYm1jeCPdADGQ@mail.gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kenny Ho <Kenny.Ho@amd.com>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Brian Welty <brian.welty@intel.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Martin KaFai Lau <kafai@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Network Development <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Resent in plain text.]

On Mon, Feb 1, 2021 at 9:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> - there's been a pile of cgroups proposal to manage gpus at the drm
>   subsystem level, some by Kenny, and frankly this at least looks a bit
>   like a quick hack to sidestep the consensus process for that.
No Daniel, this is quick *draft* to get a conversation going.  Bpf was
actually a path suggested by Tejun back in 2018 so I think you are
mischaracterizing this quite a bit.

"2018-11-20 Kenny Ho:
To put the questions in more concrete terms, let say a user wants to
 expose certain part of a gpu to a particular cgroup similar to the
 way selective cpu cores are exposed to a cgroup via cpuset, how
 should we go about enabling such functionality?

2018-11-20 Tejun Heo:
Do what the intel driver or bpf is doing?  It's not difficult to hook
into cgroup for identification purposes."

Kenny
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
