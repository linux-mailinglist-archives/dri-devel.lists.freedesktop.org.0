Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E005B8CD5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADD010E97B;
	Wed, 14 Sep 2022 16:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out20-50.mail.aliyun.com (out20-50.mail.aliyun.com
 [115.124.20.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B64610E984
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:25:03 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0447823|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.100327-0.0180206-0.881653;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=3; RT=3; SR=0; TI=SMTPD_---.PFaWXAE_1663172699; 
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.PFaWXAE_1663172699) by smtp.aliyun-inc.com;
 Thu, 15 Sep 2022 00:25:00 +0800
Date: Thu, 15 Sep 2022 00:25:07 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
In-Reply-To: <9e801194-ea74-7298-c08c-de5eeb7444e6@suse.de>
References: <20220914225809.763F.409509F4@e16-tech.com>
 <9e801194-ea74-7298-c08c-de5eeb7444e6@suse.de>
Message-Id: <20220915002506.DE56.409509F4@e16-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.75.04 [en]
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


> Hi
> 
> Am 14.09.22 um 16:58 schrieb Wang Yugui:
> > Hi,
> >
> >> (cc: Jocelyn)
> >>
> >> Hi
> >>
> >> Am 14.09.22 um 10:29 schrieb Wang Yugui:
> >>> Hi,
> >>>
> >>>
> >>>> Hi
> >>>>
> >>>> Am 13.09.22 um 17:15 schrieb Wang Yugui:
> >>>> [...]
> >>>>>>>
> >>>>>>> so I tried to revert patch of mgag200 driver in batch of 2 or 3, the I
> >>>>>>> noticed the patch 'Subject: drm/mgag200: Remove special case for G200SE
> >>>>>>> with <2 MiB' and then tried this dirty fix.
> >>>>>>
> >>>>>> Oh, great work! Thank you. From looking at the screenshot that you provided, it seems as if the 24-bit mode setting is broken. I'm not sure why the G200SE workaround applies to a G200ER, but we'll see.
> >>>>>
> >>>>> I tested 'preferred_depth = 32' too. it works on T630 too.
> >>>>>
> >>>>> so both 16 and 32 work, but 24 failed on DELL/T630.
> >>>>
> >>>> I tried on my test machine with a 5.19 kernel and found that 32-bit and 24-bit pixels work, but 16-bit looks incorrect.
> >>>>
> >>>> What are the results if you boot your kernel 5.19.3 with the parameter video=1024x768-24? This should enable 24-bit pixels.
> >>>>
> >>>> How does video=1024x768-16 look with the 5.19 kernel?
> >>>
> >>> test result here
> >>> kernel 5.19.3 & video=1024x768-24
> >>> 	dell/T620/centos-8.5	broken
> >>> 	dell/T630/centos-7.9	broken
> >>
> >> I assume that Centos 7 and 8 have fairly old kernels? So it's been a long-standing bug.
> >
> > We install kernel 5.19.3/5.15.67 into Centos 7 and 8.
> > default it work well.  broken just when 'video=1024x768-24', so it may
> > not a long-standing bug.
> 
> I don't quite understand. Does 'video=1024x768-24' work with 5.15.67?

kernel 5.15.67 with 'video=1024x768-24' is broken on DELL/T630.

kernel 5.15.67 without 'video=1024x768-24' works well on DELL/T630.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2022/09/15

