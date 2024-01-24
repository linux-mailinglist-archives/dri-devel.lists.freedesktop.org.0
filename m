Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E473483B0F3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 19:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0821610E558;
	Wed, 24 Jan 2024 18:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FF810EDF6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 15:32:23 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3627e9f1b40so15795325ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 07:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706110283; x=1706715083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpDYrGFUEKKunXNg/UYXj4fE8ADfmJRlUhj5IzkEgCY=;
 b=kJZLLxwiby/aXohsQdErEy52TPUsggXZ2ZJjx/zskwHCa4PxxYlQDMuP1WEPeaDz8v
 hFVkPSeWQvZzCYPdXuQ1rZBk8qQAdvngN7UgrXpxX1/mgqwAyxYBg3MkDAwSIkXiK+FW
 59arR3It+hl2hxFgnS1bssNfafnmG2s2cXP3b4vvbbdtw2AX9pe4WaqLKHS4FUZ63STb
 6QpDDpX+jZKhodrIzIcHCb1C2RFnqaBJrLM39d2Yt7uDIQM6yp3nVkgFA+6kkle2fl3R
 L0XsKo3X1B3YWMhK0Jwt903y/rwCXtL8WPTgJCCQUaZeoJexl1o5nFQxgMB2GKuiSCUB
 1Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706110283; x=1706715083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GpDYrGFUEKKunXNg/UYXj4fE8ADfmJRlUhj5IzkEgCY=;
 b=d99GbFwjX8JEMplnCesYL0q4tqbZPy+fZ9fIIa2axoHJlZ9JuwRYuujO+e2a/YKxef
 +wS1nSli1MUWdf5Cq8J7rdFC+YPE+6INAs35a4dZLjWN0aG/X9hvtW307RyEsKwQDujG
 NCsT56m/3jpFCDlLf0QmMfx5g2wxyqTKi2f+y8MnvDcTULXEeseWNtFu/a4BoOhau2DB
 eyuhcMrBnwoqeMw2WEhJ5aCdVg3DyylMvt3fOO7pcBK78L/NndlJca4tdUAc70JxZCJg
 ihrb3z0A+U9P0NKl5e5chPGxDBxN8VQOUDoC3jyoFpG8V/EHSjAMU9Cs/jBK1JJeMS9o
 oWlg==
X-Gm-Message-State: AOJu0YyU8+jQQnI9jo4vOTy6Ar+aaZ6hg3Ej/TNZMP0pzXp9ym2n9psE
 8Y+uXZJ025HTzBViLBmw52G13nw0kC4g2I/pUOJ4XWojyBqPYSSdewvnIS+i1GNbnBhAdw7vI9X
 07Xgc7okCCg/BsPZI1P0VxdHwm2U=
X-Google-Smtp-Source: AGHT+IFmbG26lQ7rCOD6Ezf4LEillA3aq/WsGuNbM4NSyvksQSzDbi+OEeFCinMox0HyF9tz6wiv6wOw2C1N29vgjBc=
X-Received: by 2002:a92:c268:0:b0:35f:eb24:bb54 with SMTP id
 h8-20020a92c268000000b0035feb24bb54mr2260604ild.99.1706110282995; Wed, 24 Jan
 2024 07:31:22 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
In-Reply-To: <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz>
From: Donald Carr <sirspudd@gmail.com>
Date: Wed, 24 Jan 2024 07:31:10 -0800
Message-ID: <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Jan 2024 18:20:36 +0000
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Dave Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 7:06=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
> When testing the rc1 on my openSUSE Tumbleweed desktop, I've started
> experiencing "frozen desktop" (KDE/Wayland) issues. The symptoms are that
> everything freezes including mouse cursor. After a while it either resolv=
es,
> or e.g. firefox crashes (if it was actively used when it froze) or it's
> frozen for too long and I reboot with alt-sysrq-b. When it's frozen I can
> still ssh to the machine, and there's nothing happening in dmesg.
> The machine is based on Amd Ryzen 7 2700 and Radeon RX7600.
>
> I've bisected the merge commits so far and now will try to dig into this
> one. I've noticed there was also a drm fixes PR later in the merge window=
 but
> since it was also merged into rc1 and thus didn't prevent the issue for m=
e,
> I guess it's not relevant here?
>
> Because the reproduction wasn't very deterministic I considered a commit =
bad
> even if it didn't lead to completely frozen desktop and a forced reboot.
> Even the multi-second hangs that resolved were a regression compared to 6=
.7
> anyway.
>
> If there are known issues and perhaps candidate fixes already, please do =
tell.

I am experiencing the exact same symptoms; sddm (on weston) starts
perfectly, launching a KDE wayland session freezes at various points
(leading to plenty of premature celebration), but normally on the
handoff from sddm to kde (replete with terminal cursor on screen)

Working perfectly as of the end of 6.7 final release, broken as of 6.8 rc1.
Sometimes sddm can be successfully restarted via ssh, other times
restarting sddm is slow and fails to complete.

Yours sincerely,
Donald
