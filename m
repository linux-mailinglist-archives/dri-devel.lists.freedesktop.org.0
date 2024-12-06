Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA919E7697
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4AB10E3E6;
	Fri,  6 Dec 2024 17:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fireburn-co-uk.20230601.gappssmtp.com header.i=@fireburn-co-uk.20230601.gappssmtp.com header.b="UF5HnJNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC14910E3E6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:01:48 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-215909152c5so26688245ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 09:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20230601.gappssmtp.com; s=20230601; t=1733504508; x=1734109308;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KCI0rYESTBYF6Ks81/a2J7+SWGrpJOHj6UlHhFF0qXc=;
 b=UF5HnJNXLo38fjPN4HvIX48xiZFY6XG/qJ4tJXHPJ6Ew2t/S5qk9WvHI7U/K679Za8
 6aCUGzhdgAVpG3wmUexbbUHe0wEPgXmxVAkTnfoGFJ98ach0DO1t5/79RVWuG0MOdKSM
 JMg0wD8zt+NFQI0ouEc9qT0V0nhjHR5/d96k/Xd9Gs4eGSPMH8xbs1TMFCZqyH5Xc08Z
 f6SPWHSIy9eL6CecWu6y1m+XJi+1psG+UGrNOfaZt7Cbcix/rsboYmrCKdMRz10hU/8P
 YpyejqwnqGbwlyNn9CbADSoqi7/RPxszTYfGSDRe+U7r1hQBZARJADrrD8TpZ8/Laya/
 FH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733504508; x=1734109308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KCI0rYESTBYF6Ks81/a2J7+SWGrpJOHj6UlHhFF0qXc=;
 b=ecV170p1+WvPOrSGRZO+zGgyNIJGhFzXFCWIfMgI737Yb96Xo5OJMto+TNU6Hj+PTg
 fmsZsUg4IFJdiJ/qppjvYqLrgPJ0/8wGGQTh/d23rmsdasQ3RLC2iXy4ngjy7cLWYn4K
 K2GJjcVrsLbFeU3GjyIC8JRUiA/1GBDMQl6MAQMUHsKEiQzo7KA61CoBThcWdB1rp296
 2L3qDhS0R/0/Xvq+dynZMeemWt/LLW9EdmzYuGEeHp2FhHT8Pz+NRgA+4Kg37siD+kUE
 SwgtYVi9TvnArBFDwA6wIhHCh+f2ivjikT2SiA7fCcgLQx56Rb0Sf1MUemB/0QJaMJYw
 /Plg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC7hDfQRx7dmkfuFRlT1ZkKP1qtsVOq9aIERLK+2SAy2W492URBd6El3K9ZM8IFFbc/iZ72VmRP6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVLGWQxonwuKIECxzLgC2IOrDTsqvB/8MKvoGcbOZWqfoB5yCn
 g2OKLwD3AdVjS+Mq6LrbQTUZOT2VrjDEqhnlU5mHUcSP752oPCAeBivGfTWu24hywxD7w4ks/aY
 Q+Nqq8w2ph/mmBq9NtAnBAKHdWR9pFXj2qEYMmvOmc1LVx2eaCBQP
X-Gm-Gg: ASbGncuRWydEpJSA2lDCWql5CHtR0c5DLHp1wdfprYu6zPc15u0FMghAndj97vMkFJ4
 Md+wy0WEidvhfmsGJ3EGNVd3GjzZ/R+E+
X-Google-Smtp-Source: AGHT+IHY3L5ZVct2Cz0/okqpIfkYej3RLjV+DmbFHzZS9hu6ZY/lLyj//eDxIAHb3dwPPT1MH+wa+0FGlnYQCC92QPg=
X-Received: by 2002:a17:902:cf43:b0:215:9642:4d7a with SMTP id
 d9443c01a7336-216139403f7mr62396075ad.0.1733504508435; Fri, 06 Dec 2024
 09:01:48 -0800 (PST)
MIME-Version: 1.0
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <f094ae61-04a9-8bd9-7b43-72ccdca22d5a@quicinc.com>
 <CAHbf0-HBYFTHqdC1w8Nhw1oVErXeMdtcdHZbebwmt8x20VwkHA@mail.gmail.com>
In-Reply-To: <CAHbf0-HBYFTHqdC1w8Nhw1oVErXeMdtcdHZbebwmt8x20VwkHA@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 6 Dec 2024 17:01:37 +0000
Message-ID: <CAHbf0-H3jk17+aKTYUMTHMFT=KGAVh_xWMfe+VYrqXS-0jdQ5w@mail.gmail.com>
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

On Fri, 6 Dec 2024 at 16:41, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> On Fri, 6 Dec 2024 at 16:26, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> >
> > On 12/5/2024 8:44 AM, Mike Lothian wrote:
> > > Hi
> > >
> > > I needed to add the following to get things compiling for me
> > >
> > >
> > > diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
> > > b/drivers/accel/amdxdna/amdxdna_mailbox.c
> > > index fe684f463b945..79b9801935e71 100644
> > > --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> > > +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> > > @@ -6,6 +6,7 @@
> > > #include <drm/drm_device.h>
> > > #include <drm/drm_managed.h>
> > > #include <linux/bitfield.h>
> > > +#include <linux/interrupt.h>
> > > #include <linux/iopoll.h>
> >
> > Looking at the code, this is valid.  However, I'm not sure why this is
> > broken for you and not others.  Do you have any ideas?  How are you
> > building this?  Is the tree and/or defconfig unique in some way?
> >
> > > #define CREATE_TRACE_POINTS
> > >
> > >
> > > I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
> > > from npu.sbin.1.5.2.380 to npu.sbin
> > >
> > > Cheers
> > >
> > > Mike
> > >
> >
>
> I'm building with clang 19.1.5, this is on linus's tree 6.13-rc1
>
> I've applied AMD-XDNA-driver and AMD-NPU-driver-improvements series
>
> These are the errors I see without the above patch:
>
> drivers/accel/amdxdna/amdxdna_mailbox.c:342:8: error: unknown type
> name 'irqreturn_t'
>   342 | static irqreturn_t mailbox_irq_handler(int irq, void *p)
>       |        ^
> drivers/accel/amdxdna/amdxdna_mailbox.c:352:9: error: use of
> undeclared identifier 'IRQ_HANDLED'
>   352 |         return IRQ_HANDLED;
>       |                ^
> drivers/accel/amdxdna/amdxdna_mailbox.c:380:4: error: call to
> undeclared function 'disable_irq'; ISO C99 and later do not support
> implicit function declarations [-Wimplicit-function-declaration]
>   380 |                         disable_irq(mb_chann->msix_irq);
>       |                         ^
> drivers/accel/amdxdna/amdxdna_mailbox.c:497:8: error: call to
> undeclared function 'request_irq'; ISO C99 and later do not support
> implicit function declarations [-Wimplicit-function-declaration]
>   497 |         ret = request_irq(mb_irq, mailbox_irq_handler, 0,
> MAILBOX_NAME, mb_chann);
>       |               ^
> drivers/accel/amdxdna/amdxdna_mailbox.c:521:2: error: call to
> undeclared function 'free_irq'; ISO C99 and later do not support
> implicit function declarations [-Wimplicit-function-declaration]
>   521 |         free_irq(mb_chann->msix_irq, mb_chann);
>       |         ^
> drivers/accel/amdxdna/amdxdna_mailbox.c:538:2: error: call to
> undeclared function 'disable_irq'; ISO C99 and later do not support
> implicit function declarations [-Wimplicit-function-declaration]
>   538 |         disable_irq(mb_chann->msix_irq);
>       |         ^
> 6 errors generated.
>
> With the patch applied I then got firmware issues so I had to rename
> the newly upstreamed firmware, I'm not sure of the code needs to load
> the versioned file or if the file needs renamed in linux-firmware
>
> I'm attaching my .config
>
> Cheers
>
> Mike

The attachment bounced so heres a link to the .config on github
https://github.com/FireBurn/KernelStuff/blob/quark/dot_config_tip
