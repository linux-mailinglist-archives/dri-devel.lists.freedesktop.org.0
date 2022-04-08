Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDCC4F8BE2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 03:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2A110E0EA;
	Fri,  8 Apr 2022 01:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7493210E13A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 01:58:21 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso8254737pjh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QDV7vyVJua5x627okL/E8Nxi+qH90boTSsIqmiOxLwI=;
 b=bLbexJ08nK+TWPoYlGxZS1ziMwfEiNM87Hlc5Aqszi3h8/f4qux0ng/XTX6ol5mTaA
 H39eWUpuBI9MAYKqMhrxBkAJXd52jvhwp24o4jqVANR7oNkQyNLbPtpOD6TtXAPtRsot
 tIH7+M+u8k5IeGu584A4sF9KCmBn1U3AgmNw0A2vw4VlZ88ynwh2bf0eafSvudh3JkIS
 wDu5j/BMfPTn8yrUGJkMLGFOl5PkBfsD/iH+TJo0R+MOzqC24PSr+HmDAwfKYIly7Lpj
 3OQSIPP6arO/QbH6GuLkzGcBkdH5LD2+lWvUxI/SAW0qm0T/fcc5hgoCMF5pzDBHwGPx
 OBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDV7vyVJua5x627okL/E8Nxi+qH90boTSsIqmiOxLwI=;
 b=NBt3lrqbamc34je341OBiHH5IOClSFDqQqLbinxuFevxCHXIiH54Qiy2OLr4g49s4/
 lN027IlHD0lx1iPseSmQHc6DNzNfOQBZnXqFzJ+5a0SeemabxBjQFFbUYAmmODibWbLw
 McYtGD4ESGfq0lDBxuyOk7v7C8Fb6bPZcuYS2wIcIrYiVMKYswBTJc8fkC4nb45rM4O2
 9OOeCcXniQD5Zk348gMXWGEob9fTbBLPZxUQzep0T6mhpS/NXdwWr8y4wAjY1/SL79dE
 ou2ILA5uGSAyS5693XJ/5pU9nSD46zWYI0Lir3SgSe4a2ofI/vNUdCfP/ldCCfcZcR86
 6qbA==
X-Gm-Message-State: AOAM532zvZCeuQwjPYWyZPB7/0JFyUTDw57C8gCxImcSXBq4gKm2E4fi
 YWl6eQ88UEi8FJ8CGueGDyF8NkoI/y3zBoF73A==
X-Google-Smtp-Source: ABdhPJx0eXbtrpr/r855v08vuUbK+sfYFO73JqWyYf8oavJH3sMjVil0MSKbotkscRuus74X4yjHtAw2IjvhwhIT/L4=
X-Received: by 2002:a17:90a:5407:b0:1bf:43ce:f11b with SMTP id
 z7-20020a17090a540700b001bf43cef11bmr19285418pjh.31.1649383101050; Thu, 07
 Apr 2022 18:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220404084723.79089-1-zheyuma97@gmail.com>
 <20220404084723.79089-2-zheyuma97@gmail.com>
 <eb2edc5a-afad-f0c9-012f-9b9f226d2e5a@gmx.de>
In-Reply-To: <eb2edc5a-afad-f0c9-012f-9b9f226d2e5a@gmx.de>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Fri, 8 Apr 2022 09:58:10 +0800
Message-ID: <CAMhUBjmm6ADp2Fr89CCQNX5FnhmBBrwFE0EQ3sq7CLER0J3ZEg@mail.gmail.com>
Subject: Re: [PATCH 1/7] video: fbdev: i740fb: Error out if 'pixclock' equals
 zero
To: Helge Deller <deller@gmx.de>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 3:50 AM Helge Deller <deller@gmx.de> wrote:
>
> On 4/4/22 10:47, Zheyu Ma wrote:
> > The userspace program could pass any values to the driver through
> > ioctl() interface. If the driver doesn't check the value of 'pixclock',
> > it may cause divide error.
> >
> > Fix this by checking whether 'pixclock' is zero in the function
> > i740fb_check_var().
> >
> > The following log reveals it:
> >
> > divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> > RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:444 [inline]
> > RIP: 0010:i740fb_set_par+0x272f/0x3bb0 drivers/video/fbdev/i740fb.c:739
> > Call Trace:
> >     fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1036
> >     do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1112
> >     fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1191
> >     vfs_ioctl fs/ioctl.c:51 [inline]
> >     __do_sys_ioctl fs/ioctl.c:874 [inline]
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
>
> Hello Zheyu,
>
> I've applied the patches #2-#7 of this series, but left
> out this specific patch (for now).
> As discussed on the mailing list we can try to come up with a
> better fix (to round up the pixclock when it's invalid).
> If not, I will apply this one later.

I'm also looking forward to a more appropriate patch for this driver!

Thanks,
Zheyu Ma
