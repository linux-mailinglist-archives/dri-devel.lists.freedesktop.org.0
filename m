Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658FD6DF258
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 12:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538CD10E76E;
	Wed, 12 Apr 2023 10:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7810E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:57:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f04275b2bdso55045e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681297019; x=1683889019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2nt7ejQK3jr9r1+vnQD1e3FmdrT042GNN9tIEQMZ1E=;
 b=t7IOWsunQ1sr66lSoyGmmloi1T7w/NIIGJTgTYknCs01CRxFh0HkL+XaWQZeJTATMh
 r6QHRJc3LNXb8iHN0R505gFWgcLgHKVpuJhHIpIF2SsQ3b9Jmoxr/agsV8XqsLsIDZFX
 Z+qpDunVqPcRk9zrzNmHnwNHHc4P2VKyUcseK+zcEp8O3lL9H/0XmOMvsSznsUqbmX5J
 PsrZ9Nk7fMzmQrgKayfGs0Fh21dySgLR0Vc/qGE5rmjQTtJWCjXLnGieu8CdAO1PrPgl
 zyVhFPsa2WNucdD87EcMD/7aI+bqug13OCFd+dkQmTPqH7/BKllfO0Fd9yt1rJabNLA7
 sz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681297019; x=1683889019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2nt7ejQK3jr9r1+vnQD1e3FmdrT042GNN9tIEQMZ1E=;
 b=j2rNzsXlcUrwMvaw68RyJr8pH24Se+i/S2Vh0OKoOsDlyY3HLFusr3SD4J39QqlsYR
 zyZl1OPdoDq7T7CuIfkGV2XZmvryeviI22wAjZY3n6ojDvOf26+wlzyyBbfsa3IIgyUG
 o/k1vVFe3Kqe3aVeaS2CWOt+30B1/++NofsN5xaDtLHWUD2xCnMwId1J2oLfVHzETtCo
 1btGl54lmENudHjIsk2BxNXsY5Ejlgf280WBs/shCb64GsJFP/Mdtd7pbborkmqpsh4D
 Uot57m4aT166I9r1G/FKDwmWUmbJcxCdg/NZUdV+yoB9TBL4bqCDD+xduC2MVyPJuvZZ
 GqMw==
X-Gm-Message-State: AAQBX9f2r3wCJ+J2+IA56GrB3XBwzD6ny0eBwacivjuv2Qeg7kBCKQ8j
 JYgqvV7g2G7FtrjkiW2H4zKxbM9mvmngyljVYEWSzQ==
X-Google-Smtp-Source: AKy350ZR5xCsHi5eVXAzVMAg74DbXOVxZwSG6Tj6+e2urajU4bQH/MinMa3dSR5ARaqb2khKmss74CtU7opeYyoeB+U=
X-Received: by 2002:a05:600c:5405:b0:3df:f3cb:e8ce with SMTP id
 he5-20020a05600c540500b003dff3cbe8cemr393512wmb.7.1681297018926; Wed, 12 Apr
 2023 03:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <CANp29Y4V7LsaJk0h3GyWV-chE8YkwM2qX33_hy9ZF5si8ZLdDg@mail.gmail.com>
 <000000000000e9e5a905f9214d8c@google.com>
In-Reply-To: <000000000000e9e5a905f9214d8c@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 12 Apr 2023 12:56:47 +0200
Message-ID: <CANp29Y4UGZpm6JadD0+5kWFZn1DuL54VWN4QT+2CnaryeqWBXg@mail.gmail.com>
Subject: Re: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp
To: syzbot <syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's close the bug on syzbot so that the bot can report similar bugs
in the future:

#syz fix: drm/atomic-helper: Don't set deadline for modesets

On Wed, Apr 12, 2023 at 12:45=E2=80=AFPM syzbot
<syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger a=
ny issue:
>
> Reported-and-tested-by: syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail=
.com
>
> Tested on:
>
> commit:         7d8214bb Add linux-next specific files for 20230412
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1387763dc8000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D923e20c1867d7=
c1c
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D75cc0f9f7e6324d=
d2501
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binuti=
ls for Debian) 2.35.2
>
> Note: no patches were applied.
> Note: testing is done by a robot and is best-effort only.
