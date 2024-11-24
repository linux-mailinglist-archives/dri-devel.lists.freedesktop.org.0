Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F269A9D78F6
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 23:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEE610E36B;
	Sun, 24 Nov 2024 22:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gt3ucLtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E693D10E36B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 22:58:38 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aa51d32fa69so328599266b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 14:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732489117; x=1733093917; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pJZn4r1Q1mVyx8xe9OjWZIQdyqdlmM4KAqXOvCd7B8A=;
 b=Gt3ucLtOgscSCknPkp03HDogcyVPMG6YQxl3YU4oEcKytJ1o/Xsrpo+ijKvG8ncmqO
 bp/t/lMQ1qY5Xo04dU3/ivhsTxiAKVjHzXNaVcIf49E5ulIp3BHS/qOHpfU84spMBqeT
 iOjiZzxthqOQbjTlTteuczT+hYStzSykqRCWeJ9KR3ORqWBob++eju/GNc1CmfOO3/GC
 6m6PZLzuRRYa+sOkmHy9D8kKjY7xakAaGYnhOJgfDZ/K8fqS1PCDg1b7Fh4mcbGM/BDv
 ieNrA96FKuY5L/QmLJ+nYbVot/0K3tioh6Q5St/6NZhHog5ic7G8IpWoYSgXVRjGQTqh
 tEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732489117; x=1733093917;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJZn4r1Q1mVyx8xe9OjWZIQdyqdlmM4KAqXOvCd7B8A=;
 b=UwiO41lLS+k1wa/g7F/0YMt3v8g7fL9j1afZQVjfnUHb41qurSLCxMZcUbWGrT6MIy
 gZN4X6An84MlL+w9+ttZT4n3goGvn6R46GjfAPP47A8+qTwXSsAnro/LvLBBbxXfwDDM
 zkfe5jMX4HGfQ4E6aTOOQlXRe6F3XKY8mJrYMm2vm5u7Wt/khPzTm8HGFDw7VqE+Cuhk
 CjlnwqbUtbZCojzg9FNa51qG3yHsfW7DyuBBHdanUh9ZRH9neT36nwSAopuXwdiNPj5w
 EytDKkTOs3v9Jd7rhYjwpK3N2aZqhkn1RweBpx0OlmOT0/62+B843esErN9x/uIPM1EZ
 zDXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7krRa0SylIPJJC7f3+3dQKM1ZT4C709awL75FvuzsgfFcmxC1WplDAnBMTMBzQ+N1MzzxChSSRPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuJNm8v0hiaT+eo2TSAKjp7DiIq6PrBbkAKsg+B0fNHJdXLBpF
 JWpbMk5bXjDRW5WMeWjDHukDY5YQIsi1yzirCaheaddMetFAfoG/PZlL3bK8PB8/EJqGRsufPWo
 noZxRAGxNJ8wYXi/y7DFZOb97ukw=
X-Gm-Gg: ASbGncuN5R0sHaUVv+w9JET7b3PDxpInBC+PQimvya/4pHs3CKMCNZP1+bLcTTd8zg6
 Lcd6YzNuO1WXge21kOG9XwE3C/pPJ/g==
X-Google-Smtp-Source: AGHT+IEaat5Lo3zoMYsazU224LzNHL+gn1VeSlwrawrhbYhupgnxEoxvfhiEmoJgbcjr0GtT2Xt1R2cw4sPlnm4+GLM=
X-Received: by 2002:a17:906:2189:b0:aa5:2f8a:b958 with SMTP id
 a640c23a62f3a-aa52f8aca44mr565291566b.52.1732489116886; Sun, 24 Nov 2024
 14:58:36 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
 <Z0NXQ6iRK43x6WbG@sashalap>
In-Reply-To: <Z0NXQ6iRK43x6WbG@sashalap>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 25 Nov 2024 08:58:25 +1000
Message-ID: <CAPM=9tw5eTBCDn93GyrMjF3r_kDbr2-v1GgKdZECFNupqakDFw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.13-rc1
To: Sasha Levin <sashal@kernel.org>, javier.carrasco.cruz@gmail.com, 
 CK Hu <ck.hu@mediatek.com>, wenst@chromium.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 25 Nov 2024 at 02:41, Sasha Levin <sashal@kernel.org> wrote:
>
> On Thu, Nov 21, 2024 at 10:25:45AM +1000, Dave Airlie wrote:
> >Hi Linus,
> >
> >This is the main drm pull request for 6.13.
> >
> >I've done a test merge into your tree, there were two conflicts both
> >of which seem easy enough to resolve for you.
> >
> >There's a lot of rework, the panic helper support is being added to
> >more drivers, v3d gets support for HW superpages, scheduler
> >documentation, drm client and video aperture reworks, some new
> >MAINTAINERS added, amdgpu has the usual lots of IP refactors, Intel
> >has some Pantherlake enablement and xe is getting some SRIOV bits, but
> >just lots of stuff everywhere.
> >
> >Let me know if there are any issues,
>
> Hey Dave,
>
> After the PR was merged, I've started seeing boot failures reported by
> KernelCI:

I'll add the mediatek names I see who touched anything in the area recently.

Dave.
>
> [    4.395400] mediatek-drm mediatek-drm.5.auto: bound 1c014000.merge (ops 0xffffd35fd12975f8)
> [    4.396155] mediatek-drm mediatek-drm.5.auto: bound 1c000000.ovl (ops 0xffffd35fd12977b8)
> [    4.411951] mediatek-drm mediatek-drm.5.auto: bound 1c002000.rdma (ops 0xffffd35fd12989c0)
> [    4.536837] mediatek-drm mediatek-drm.5.auto: bound 1c004000.ccorr (ops 0xffffd35fd1296cf0)
> [    4.545181] mediatek-drm mediatek-drm.5.auto: bound 1c005000.aal (ops 0xffffd35fd1296a80)
> [    4.553344] mediatek-drm mediatek-drm.5.auto: bound 1c006000.gamma (ops 0xffffd35fd12972b0)
> [    4.561680] mediatek-drm mediatek-drm.5.auto: bound 1c014000.merge (ops 0xffffd35fd12975f8)
> [    4.570025] ------------[ cut here ]------------
> [    4.574630] refcount_t: underflow; use-after-free.
> [    4.579416] WARNING: CPU: 6 PID: 81 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
> [    4.587670] Modules linked in:
> [    4.590714] CPU: 6 UID: 0 PID: 81 Comm: kworker/u32:3 Tainted: G        W          6.12.0 #1 cab58e2e59020ebd4be8ada89a65f465a316c742
> [    4.602695] Tainted: [W]=WARN
> [    4.605649] Hardware name: Acer Tomato (rev2) board (DT)
> [    4.610947] Workqueue: events_unbound deferred_probe_work_func
> [    4.616768] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.623715] pc : refcount_warn_saturate+0xf4/0x148
> [    4.628493] lr : refcount_warn_saturate+0xf4/0x148
> [    4.633270] sp : ffff8000807639c0
> [    4.636571] x29: ffff8000807639c0 x28: ffff34ff4116c640 x27: ffff34ff4368e080
> [    4.643693] x26: ffffd35fd1299ac8 x25: ffff34ff46c8c410 x24: 0000000000000000
> [    4.650814] x23: ffff34ff4368e080 x22: 00000000fffffdfb x21: 0000000000000002
> [    4.657934] x20: ffff34ff470c6000 x19: ffff34ff410c7c10 x18: 0000000000000006
> [    4.665055] x17: 666678302073706f x16: 2820656772656d2e x15: ffff800080763440
> [    4.672176] x14: 0000000000000000 x13: 2e656572662d7265 x12: ffffd35fd2ed14f0
> [    4.679297] x11: 0000000000000001 x10: 0000000000000001 x9 : ffffd35fd0342150
> [    4.686418] x8 : c0000000ffffdfff x7 : ffffd35fd2e21450 x6 : 00000000000affa8
> [    4.693539] x5 : ffffd35fd2ed1498 x4 : 0000000000000000 x3 : 0000000000000000
> [    4.700660] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff34ff40932580
> [    4.707781] Call trace:
> [    4.710216]  refcount_warn_saturate+0xf4/0x148 (P)
> [    4.714993]  refcount_warn_saturate+0xf4/0x148 (L)
> [    4.719772]  kobject_put+0x110/0x118
> [    4.723335]  put_device+0x1c/0x38
> [    4.726638]  mtk_drm_bind+0x294/0x5c0
> [    4.730289]  try_to_bring_up_aggregate_device+0x16c/0x1e0
> [    4.735673]  __component_add+0xbc/0x1c0
> [    4.739495]  component_add+0x1c/0x30
> [    4.743058]  mtk_disp_rdma_probe+0x140/0x210
> [    4.747314]  platform_probe+0x70/0xd0
> [    4.750964]  really_probe+0xc4/0x2a8
> [    4.754527]  __driver_probe_device+0x80/0x140
> [    4.758870]  driver_probe_device+0x44/0x120
> [    4.763040]  __device_attach_driver+0xc0/0x108
> [    4.767470]  bus_for_each_drv+0x8c/0xf0
> [    4.771294]  __device_attach+0xa4/0x198
> [    4.775117]  device_initial_probe+0x1c/0x30
> [    4.779286]  bus_probe_device+0xb4/0xc0
> [    4.783109]  deferred_probe_work_func+0xb0/0x100
> [    4.787714]  process_one_work+0x18c/0x420
> [    4.791712]  worker_thread+0x30c/0x418
> [    4.795449]  kthread+0x128/0x138
> [    4.798665]  ret_from_fork+0x10/0x20
> [    4.802229] ---[ end trace 0000000000000000 ]---
>
> I don't think that I'll be able to bisect further as I don't have the
> relevant hardware available.
>
> --
> Thanks,
> Sasha
