Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD29D5F6E40
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB3210E4F2;
	Thu,  6 Oct 2022 19:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F106610E4F2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 19:30:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bj12so6713511ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k2PLX7t8akejXX2rlvi6ieaQqVuMDuBcH+372rToY1E=;
 b=D5rsC75yDUF9kWV3SquzIST3kPDsCVq58ukVLeJ5qmZglaoUSOcG3mq/Kw1MhbQXt1
 YdLMe6XV4Yxmbg7yhHXcsAyt2922i6I8tCuoQNIeZoiAhUbwmggWK27n8m9FAWx4XKeY
 0Ktpzjw4yvUWDXdDOWH9yFBMxQQrXCU2eGQma5j5beosI5UCpcvI6yq34F6Xkzj+51pt
 6Jw2DeI6Rc03l7WXtCMp40MPb3VI54QHBKSYpTzaK7ESaxjkiNYLB6cO6EzjyZPpG+Mc
 mwOuf7y/fp5iJ/wLRZesKkdGJR3KMB4+Bvmw2+PBUFPBG6tHFu+WiSTB9v3lBuvojg0/
 C7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k2PLX7t8akejXX2rlvi6ieaQqVuMDuBcH+372rToY1E=;
 b=1pGCPm3iIrbeI9chEDtxyj8QpkuPCcZC2E1ja7+IQXECbRujeOdXFI5MxwVf77pKZQ
 63OPgttHu92NqcB4FiSPhXxRcW6MPLKG57DP6urgmXy6STgzlY4E48ZDSFipZM1S6QvQ
 zg2X3UOgiD6ZZ9tbeql8q0pHkIpAGmxTjW3hMdOKHetrQLuAufa+ukqcFIYU+aVv2zXa
 +ojOMfBGvBVMrCwQxlGAjjph638hNnseW3yeBN7bYwX4ibDp7IeQBtBUqnSDQRqeaKzd
 f64QPxiZWBGabGmfaw3WwbkSS0PeV6MH+Hd3EHncqFzhTFSVpEKNUw6VvdL3ex6fYEgD
 u89w==
X-Gm-Message-State: ACrzQf3w1WiclUq2MJGIOT5XYV4sSpDOTx+uoYbXFvuaOKBS6lwGohL7
 Zg2oeE/3ke4EeS5B6c+NeO27C+LygZcpbBGHbH4=
X-Google-Smtp-Source: AMsMyM5B4b9kXUU1nZSUXa3bnfD4TPjf2+WmtG8vzAMZ3L/4bjMQge3FqWc3rAzZz/eazJuyQiuRj/DzwNNGDxg2MgM=
X-Received: by 2002:a17:906:5a44:b0:78d:4c17:9856 with SMTP id
 my4-20020a1709065a4400b0078d4c179856mr1177122ejc.477.1665084609198; Thu, 06
 Oct 2022 12:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
In-Reply-To: <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Oct 2022 05:29:57 +1000
Message-ID: <CAPM=9tzr1EAA=OaFmrPFT3UqQO+dixdZTPzs=tqdmgP+F_ojEA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Oct 2022 at 04:48, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Oct 4, 2022 at 8:42 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Lots of stuff all over, some new AMD IP support and gang
> > submit support [..]
>
> Hmm.
>
> I have now had my main desktop lock up twice after pulling this.
> Nothing in the dmesg after a reboot, and nothing in particular that
> seems to trigger it, so I have a hard time even guessing what's up,
> but the drm changes are the primary suspect.
>
> I will try to see if I can get any information out of the machine, but
> with the symptom being just a dead machine ...
>
> This is the same (old) Radeon device:
>
>    49:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> [AMD/ATI] Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev e7)
>
> with dual 4k monitors, running on my good old Threadripper setup.
>
> Again, there's no explicit reason to blame the drm pull, except that
> it started after that merge (that machine ran the kernel with the
> networking pull for a day with no problems, and while there were other
> pull requests in between them, they seem to be fairly unrelated to the
> hardware I have).
>
> But the lockup is so sporadic (twice in the last day) that I really
> can't bisect it, so I'm afraid I have very very little info.
>
> Any suggestions?

netconsole?

I'll plug in my 480 and see if I can make it die.

Dave.
