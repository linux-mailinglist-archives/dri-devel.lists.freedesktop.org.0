Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3F67AF8A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6274610E778;
	Wed, 25 Jan 2023 10:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7D510E371;
 Wed, 25 Jan 2023 10:22:20 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h17so1136355ljq.4;
 Wed, 25 Jan 2023 02:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Quk0baERnW1z1T9/MrVTs5oKP9HCv5XTC0taNPw0ew=;
 b=Cd6KvbrWjXbHjo2ulAX0yHjihbqmcZxj5cDIrlrHYBVRFTSgxnT8Xd+SlWViY1NH/U
 iPiFAInebwm9785OUBBlVp3ldzu4DiN+kf1OOGYtX5+VXeg7q0ddHaoUdlU1d9PAg6Zd
 Sd5RFEFJWkkdZKTEitbreYtWW/F2BGWNTchAgkxpqCLsHKIA7msuhTVHfa35jcXtKqZZ
 yjuxjDaFYwwAvbNk0uyxnl31zxksm12736EhB5rcUQr+1QDwxFZl91/howijxu65jDTI
 4wXSBVq9G2r7El58A3AzETfvc9lY32r41OEmUjfrCpCW3hVjU1GA2x+YelJw6gRpfDAl
 9moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Quk0baERnW1z1T9/MrVTs5oKP9HCv5XTC0taNPw0ew=;
 b=CXkgAzI7ma482HqqZ5XigvQASNei+dojESoIXUhQxrFAveWINWVRdM3VmvUBPG9S2o
 m6TfK/HPivmJmZs1L6fGhcHq638Ct0UIHw0H6XOkSP17P+CVs1EohW7SRCp2JPOKvAlw
 5DLklydVmC/aA+F7Y0tpbNxWbKyWVOnce6bBfRG9eYdPjjb6AFCk+jJgcvpmUiqboL1I
 oW8z9IJrpj7+4VfF9R2c9sSTaVwoT8LXPdcf5PtUUZ4fbq08V4m9xyIR27oEYFeQ4AMY
 K0V/wdFn9L4xDquSzBginknerzZECe72EaZZA7TUWzUsmgORh9mik55WQ97Cn6mypP9a
 q2PQ==
X-Gm-Message-State: AFqh2kolLCDWaQZ8lcvBnWAoggO9QG0h/gZ1bQG3nz2lK2KMX+lv4r2J
 MfAlG8QPx02xCiErnhooEQhqccJAk6PGsVP+V+uSjIetmN91aA==
X-Google-Smtp-Source: AMrXdXte+ogv3BWeMiY7cESZX2GCRgSeVOJxKVPPzC7C7F0VVycaWG7ymuE+eoXAAEvn7O+ne1XItDQhzh8XPikbrpw=
X-Received: by 2002:a2e:82cf:0:b0:28b:bde3:7871 with SMTP id
 n15-20020a2e82cf000000b0028bbde37871mr1030127ljh.269.1674642139038; Wed, 25
 Jan 2023 02:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <CAM0jSHNmv-naGqB=R8DZc-3QhTPzzo4pUU2-NxhtiEhXMcAN5A@mail.gmail.com>
 <CAM0jSHMgep0q9=C=fHw+Y8SqpNeN3Gz47u_UvwgJuGG3_0qgBQ@mail.gmail.com>
 <CAM0jSHNKkAS1+dYJdHk23+Uyoz02G1VPFLpKLxX2HqRe7L2HCA@mail.gmail.com>
 <418a6bca-7a61-86d8-7f6a-229d1e12c0fd@gmail.com>
In-Reply-To: <418a6bca-7a61-86d8-7f6a-229d1e12c0fd@gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 25 Jan 2023 10:21:51 +0000
Message-ID: <CAM0jSHMrtTWPpExT-M3=qGKyFPSjN=WbsDnLZTaADneyXxOjZQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: audit bo->resource usage v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Jan 2023 at 10:07, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
>
>
> Am 25.01.23 um 10:56 schrieb Matthew Auld:
> > On Tue, 24 Jan 2023 at 17:15, Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> >> On Tue, 24 Jan 2023 at 13:48, Matthew Auld
> >> <matthew.william.auld@gmail.com> wrote:
> >>> On Tue, 24 Jan 2023 at 12:57, Christian K=C3=B6nig
> >>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>> From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >>>>
> >>>> Make sure we can at least move and alloc TT objects without backing =
store.
> >>>>
> >>>> v2: clear the tt object even when no resource is allocated.
> >>>> v3: add Matthews changes for i915 as well.
> >>>>
> >>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >> Ofc that assumes intel-gfx CI is now happy with the series.
> > There are still some nasty failures it seems (in the extended test
> > list). But it looks like the series is already merged. Can we quickly
> > revert and try again?
>
> Ah, crap. I thought everything would be fine after the CI gave it's go.
>
> Which patch is causing the fallout?

I'm not sure. I think all of the patches kind of interact with each
other, but for sure there is an issue with the first patch. There is
one splat like:

<1>[  109.735148] BUG: kernel NULL pointer dereference, address:
0000000000000010
<1>[  109.735151] #PF: supervisor read access in kernel mode
<1>[  109.735152] #PF: error_code(0x0000) - not-present page
<6>[  109.735153] PGD 0 P4D 0
<4>[  109.735155] Oops: 0000 [#1] PREEMPT SMP NOPTI
<4>[  109.735157] CPU: 1 PID: 92 Comm: kworker/u12:6 Not tainted
6.2.0-rc5-Patchwork_113269v1-gc4d436608c4e+ #1
<4>[  109.735159] Hardware name: Gigabyte Technology Co., Ltd. GB-Z390
Garuda/GB-Z390 Garuda-CF, BIOS IG1c 11/19/2019
<4>[  109.735160] Workqueue: events_unbound async_run_entry_fn
<4>[  109.735163] RIP: 0010:i915_ttm_resource_mappable+0x4/0x30 [i915]
<4>[  109.735286] Code: b8 f9 ff ff ff eb c2 e8 aa 5e 52 e1 e9 4f 0f
18 00 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
66 0f 1f 00 <8b> 57 10 b8 01 00 00 00 85 d2 74 15 48 8b 47 08 48 05 ff
0f 00 00
<4>[  109.735288] RSP: 0018:ffffc90000f339a8 EFLAGS: 00010246
<4>[  109.735289] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
ffff88810cea3a00
<4>[  109.735290] RDX: 0000000000000000 RSI: ffffc90000f33af0 RDI:
0000000000000000
<4>[  109.735292] RBP: ffff88811645d7c0 R08: 0000000000000000 R09:
ffff888123afa940
<4>[  109.735292] R10: 0000000000000001 R11: ffff888104b70040 R12:
0000000000000000
<4>[  109.735293] R13: 0000000000000000 R14: ffffc90000f33b08 R15:
ffffc90000f33af0
<4>[  109.735294] FS:  0000000000000000(0000)
GS:ffff8884ad680000(0000) knlGS:0000000000000000
<4>[  109.735295] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  109.735296] CR2: 0000000000000010 CR3: 000000011f9c6003 CR4:
00000000003706e0
<4>[  109.735297] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
<4>[  109.735298] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
<4>[  109.735299] Call Trace:
<4>[  109.735300]  <TASK>
<4>[  109.735301]  __i915_ttm_move+0x128/0x940 [i915]
<4>[  109.735408]  ? dma_resv_iter_next+0x91/0xb0
<4>[  109.735412]  ? dma_resv_iter_first+0x42/0xb0
<4>[  109.735414]  ? i915_deps_add_resv+0x4c/0xc0 [i915]
<4>[  109.735520]  i915_gem_obj_copy_ttm+0x12f/0x250 [i915]
<4>[  109.735625]  i915_ttm_restore+0x167/0x250 [i915]
<4>[  109.735759]  i915_gem_process_region+0x27a/0x3b0 [i915]
<4>[  109.735881]  i915_ttm_restore_region+0x4b/0x70 [i915]
<4>[  109.735999]  lmem_restore+0x3a/0x60 [i915]
<4>[  109.736101]  i915_gem_resume+0x4c/0x100 [i915]
<4>[  109.736202]  i915_drm_resume+0xc2/0x170 [i915]

Plus some other less obvious issue(s) with some tests failing.

>
> Christian.
