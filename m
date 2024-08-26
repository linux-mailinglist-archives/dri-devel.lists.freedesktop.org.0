Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFEA95E6B3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E3610E039;
	Mon, 26 Aug 2024 02:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lPm52qz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFB010E039
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:31:31 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7a1d5f6c56fso253825985a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 19:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724639490; x=1725244290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XScue1slDHBjUXVjmPax26pz/WL1rKHeatxMpCgrfI=;
 b=lPm52qz73T8PDCJHDX1sjTXTjThYyAGpVCWaPStnltBBF7wTxT1JpYC+chDHZrpSM+
 Okipk5CLEqCGX78o/TEu54iKV/mypLeRpN9nmVwXT+g6O08W51GXicolt7ryNUOYyx5a
 3bREZcFOSoKy6BQy8dCTlONq7zrG93dgqPZ5jopWqbGKXo59Zx3LwDoD2KTBWBBq4DlT
 MlWiaPAUyX4Nb5qrZNjPfvI75ThpyovKyiOrRxRLoJ/GrfPXYPwgRBpn2JY8T+lrhiVN
 S/g9KNoCHDJST61AVmF03TrNHjKLn4vnWY9OjreeuQQ4Lm/PfqCPjdi2scchg9G+W2VH
 q0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724639490; x=1725244290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XScue1slDHBjUXVjmPax26pz/WL1rKHeatxMpCgrfI=;
 b=Gyp8wbr7UjKHwcikDbLQV/AxpaMLuJDWKQkLfac26TV6TVto0D1yQ1oAz1yzX3ZeaP
 sFkL1XIF3ny0GdpGQKsOeQA4CPxB4lx3dHhGAhrxDpcDp/jKLfH1YVdAXylE+dEB31cP
 C+DpCYsSo6sbFsLz7nElvk03tIdxAVqOckruMZMB+nqy5d46J2N6DQTvUlbcO5rnQ0AL
 SHqp3vi6bTPftFdJq7sZhTL6/uvzQG09x5+GAqORsLl897Qhh3uY/NM9pYDCjlD3fGwa
 uRASYc1TwKepIHj8ZuDiKPkPi81acCQgbG/iJFa6MOuloug9Q088nCOnqoTcOGwnG+bZ
 9a6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtjltQZtv8WB6i4eDk9s7CgV6omk5t4AEsIhtnv8MiJGqhFKpkwTRuRnaDF1oS1QLobv+0jz5VBVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWEvxy9ZenC6Ck8SDGiT/R84SuAttqGefG9DQMFZ9u6cxTRya1
 pWt+Ijrk5LQuM+2/5D6QSbF+JOZPNF4s2diQkJUe4p2HAqpT1y/F2f8KZIcLp2ogYMrZrz9unYR
 URnGBCkkdhTXGaJdPmVi7WlwD4O0=
X-Google-Smtp-Source: AGHT+IGarR35eqB+ZCiektfid3NknQ5udphouR14HCsBw/jqFbYUFfZCBajx/1hzRrP8EuX3DNE+IOmZVcAYGIL4Z2k=
X-Received: by 2002:a05:6214:318d:b0:6bb:84d9:8f91 with SMTP id
 6a1803df08f44-6c16dc2615cmr95291406d6.6.1724639490512; Sun, 25 Aug 2024
 19:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240817025624.13157-1-laoar.shao@gmail.com>
In-Reply-To: <20240817025624.13157-1-laoar.shao@gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 26 Aug 2024 10:30:54 +0800
Message-ID: <CALOAHbA7VW3_gYzqzb+Pp2T3BqWb5x2sWPmUj2N+SzbYchEBBA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Improve the copy of task comm
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Sat, Aug 17, 2024 at 10:56=E2=80=AFAM Yafang Shao <laoar.shao@gmail.com>=
 wrote:
>
> Using {memcpy,strncpy,strcpy,kstrdup} to copy the task comm relies on the
> length of task comm. Changes in the task comm could result in a destinati=
on
> string that is overflow. Therefore, we should explicitly ensure the
> destination string is always NUL-terminated, regardless of the task comm.
> This approach will facilitate future extensions to the task comm.
>
> As suggested by Linus [0], we can identify all relevant code with the
> following git grep command:
>
>   git grep 'memcpy.*->comm\>'
>   git grep 'kstrdup.*->comm\>'
>   git grep 'strncpy.*->comm\>'
>   git grep 'strcpy.*->comm\>'
>
> PATCH #2~#4:   memcpy
> PATCH #5~#6:   kstrdup
> PATCH #7~#8:   strcpy
>
> Please note that strncpy() is not included in this series as it is being
> tracked by another effort. [1]
>
> In this series, we have removed __get_task_comm() because the task_lock()
> and BUILD_BUG_ON() within it are unnecessary.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/all/CAHk-=3DwjAmmHUg6vho1KjzQi2=3DpsR30+Cog=
Fd4aXrThr2gsiS4g@mail.gmail.com/ [0]
>
> Changes:
> v6->v7:
> - Improve the comment (Alejandro)
> - Drop strncpy as it is being tracked by another effort (Justin)
>   https://github.com/KSPP/linux/issues/90 [1]
>
> v5->v6: https://lore.kernel.org/linux-mm/20240812022933.69850-1-laoar.sha=
o@gmail.com/
> - Get rid of __get_task_comm() (Linus)
> - Use ARRAY_SIZE() in get_task_comm() (Alejandro)
>
> v4->v5: https://lore.kernel.org/all/20240804075619.20804-1-laoar.shao@gma=
il.com/
> - Drop changes in the mm/kmemleak.c as it was fixed by
>   commit 0b84780134fb ("mm/kmemleak: replace strncpy() with strscpy()")
> - Drop changes in kernel/tsacct.c as it was fixed by
>   commmit 0fe2356434e ("tsacct: replace strncpy() with strscpy()")
>
> v3->v4: https://lore.kernel.org/linux-mm/20240729023719.1933-1-laoar.shao=
@gmail.com/
> - Rename __kstrndup() to __kmemdup_nul() and define it inside mm/util.c
>   (Matthew)
> - Remove unused local varaible (Simon)
>
> v2->v3: https://lore.kernel.org/all/20240621022959.9124-1-laoar.shao@gmai=
l.com/
> - Deduplicate code around kstrdup (Andrew)
> - Add commit log for dropping task_lock (Catalin)
>
> v1->v2: https://lore.kernel.org/bpf/20240613023044.45873-1-laoar.shao@gma=
il.com/
> - Add comment for dropping task_lock() in __get_task_comm() (Alexei)
> - Drop changes in trace event (Steven)
> - Fix comment on task comm (Matus)
>
> v1: https://lore.kernel.org/all/20240602023754.25443-1-laoar.shao@gmail.c=
om/
>
> Yafang Shao (8):
>   Get rid of __get_task_comm()
>   auditsc: Replace memcpy() with strscpy()
>   security: Replace memcpy() with get_task_comm()
>   bpftool: Ensure task comm is always NUL-terminated
>   mm/util: Fix possible race condition in kstrdup()
>   mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
>   net: Replace strcpy() with strscpy()
>   drm: Replace strcpy() with strscpy()
>
>  drivers/gpu/drm/drm_framebuffer.c     |  2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
>  fs/exec.c                             | 10 -----
>  fs/proc/array.c                       |  2 +-
>  include/linux/sched.h                 | 32 +++++++++++---
>  kernel/auditsc.c                      |  6 +--
>  kernel/kthread.c                      |  2 +-
>  mm/util.c                             | 61 ++++++++++++---------------
>  net/ipv6/ndisc.c                      |  2 +-
>  security/lsm_audit.c                  |  4 +-
>  security/selinux/selinuxfs.c          |  2 +-
>  tools/bpf/bpftool/pids.c              |  2 +
>  12 files changed, 65 insertions(+), 62 deletions(-)
>
> --
> 2.43.5
>

Hello Andrew,

Could you please apply this series to the mm tree ?

--=20
Regards
Yafang
