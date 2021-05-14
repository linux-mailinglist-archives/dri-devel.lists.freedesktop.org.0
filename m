Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE009380EF7
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 19:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3E56F3BE;
	Fri, 14 May 2021 17:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77096F3BE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 17:30:05 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id w15so38705533ljo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1gCT3yFXN0nq6W0TvPfJDEC6ju7ngwBrbZ3V/R/ZJt4=;
 b=QrDM1vyn65+P14zzNE8NIxADOjzkXwgZ1OVSKlrR4yWXq5tE46/SGHEAy800t0p0KD
 09lTLzF24eD7OUZIM3qJyL3BYanjfr/ddscyzFIcuOxS77RMISzoNAQdTSU8ej9mIAeW
 QqV6REiHKfhF0o2ztdoumCpotG6fc5BTXat8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1gCT3yFXN0nq6W0TvPfJDEC6ju7ngwBrbZ3V/R/ZJt4=;
 b=GVx5ryIJPlaJ34tVYrtFch/uE2ZZf2WxDrWD/tOp8OO3fAnaJfhnweyCJAc4deP0BI
 WkpSzyxK30Xyzrz0GOmk1OT1dIiSG5T2CurvRgbMxo7ydjvi7Je94wgd6BY1o1Nziyxp
 wbJLjH9o0fL53oEBEz5pLK4Ss0ynw8Rs2FZdlFGtkMZO0lLr9GvBwi30QlPaZjjV8ENV
 sqcaDih0rI+0qXIj2i6gpU0JHGSm4uG+kVJaxMNNUTIhRwVPDv7VK/0wpuxd6l+R612q
 ZbaqdqQo/uMxaMDtjbHUrP5Xl377OJXNRt7xvWoJfUFCYlh97kSPvN8I3KddHfTm0o1u
 LAcw==
X-Gm-Message-State: AOAM530LG2kPyhMrIcTDJqMObi+qCp4xyfAhzZDDLIlZoZSe9ck6gUWW
 IALF29o55Q7lvBK6x3tRgPRZUrRrJiSEtVwD
X-Google-Smtp-Source: ABdhPJxuCw7luyNb0Fgc2dz5BChHBIL3KXP5tY1U3chmj4Q2xm8tQzzXX3l4b4zSWDA62ydIOhyl2Q==
X-Received: by 2002:a2e:b0e5:: with SMTP id h5mr35322831ljl.453.1621013403742; 
 Fri, 14 May 2021 10:30:03 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id m5sm1274329ljc.120.2021.05.14.10.30.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:30:03 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id j10so44079952lfb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:30:02 -0700 (PDT)
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr270413lfp.201.1621013402775; 
 Fri, 14 May 2021 10:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
In-Reply-To: <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 May 2021 10:29:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
Message-ID: <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: vga16fb: fix OOB write in
 vga16fb_imageblit()
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>, Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 9:20 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Currently it is impossible to control upper limit of rows/columns values
> based on amount of memory reserved for the graphical screen, for
> resize_screen() calls vc->vc_sw->con_resize() only if vc->vc_mode is not
> already KD_GRAPHICS

Honestly, the saner approach would seem to be to simply error out if
vc_mode is KD_GRAPHICS.

Doing VT_RESIZE while in KD_GRAPHICS mode seems _very_ questionable,
and is clearly currently very buggy.

So why not just say "that clearly already doesn't work, so make it
explicitly not permitted"?

              Linus
