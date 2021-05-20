Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0262389F1A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764F36EF31;
	Thu, 20 May 2021 07:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1176EF31
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 07:49:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7sYM-1lnTBb1LBS-0053Cr for <dri-devel@lists.freedesktop.org>; Thu, 20 May
 2021 09:49:45 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so4602934wmf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:49:44 -0700 (PDT)
X-Gm-Message-State: AOAM5326Igtw5FrokxUOE8MCaPntP8kB3S98jVXMwmD8z9KRkOaR0s8e
 4DT3w/cdNWBfLkU/icOpJWU4wFcyJiHj2nLxMk4=
X-Google-Smtp-Source: ABdhPJzTnFiyItuVXHf2Goa+uE3iwf9aQon2dCDtZRjZ/2Qcnq1b1x03TFmZZogoXxw8ZVwpVrjaamoTcjQg4uj+qBY=
X-Received: by 2002:a7b:c849:: with SMTP id c9mr2699323wml.84.1621496984686;
 Thu, 20 May 2021 00:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210519120028.7350-1-songqiang@uniontech.com>
 <YKUBtiOTE7zJHAjI@casper.infradead.org>
 <1049640176.41531.1621490295842.JavaMail.xmail@localhost.localdomain>
In-Reply-To: <1049640176.41531.1621490295842.JavaMail.xmail@localhost.localdomain>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 May 2021 09:48:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Pt+e3fbfWxJru7O-Np9u2u-_cVZqd5xBejLSraFYALQ@mail.gmail.com>
Message-ID: <CAK8P3a2Pt+e3fbfWxJru7O-Np9u2u-_cVZqd5xBejLSraFYALQ@mail.gmail.com>
Subject: Re: Re: [PATCH] drivers/video/fbdev/core/fbmem.c: add pointer judgment
To: =?UTF-8?B?5a6L5by6?= <songqiang@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6MHCwM0IqxuE7KVRA2Xba0jmaFdO8DSUjH/+EUwoTc8gdZJk7kV
 mehyYqsR6sQaqUaKUQ+McrL/2KZNg0sX+VGxsEy0H4TZVrV7WjO5o10Rnk5rN/6O7cEO+Tv
 Qf66jReE2i/4qvd7QvuCJP9fIdjC1zz413PHFVMmNRYpNLv9OSSLGHwmfCI1VK2B7Zq5EIV
 LXyfMjZ3BpHoXd/kV2rvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QGa0eehsvTw=:lxH6YEj3LPpTGL3D+Qno4z
 w9KAZd/1uZ0cQGRXZd/zkMiwT6CR0Murb4hewg48GvObZ/rEjoX9S4AgeJZ5DjjWBqgq83D/m
 rgr5tr8tFIoB/BFwc8pVLiET4B2aO2/k2OhmeQp+PgJX/qajlbkd0TSNqpII9JzZ4IBMUEFHB
 MqS6lph1ALPO7ztnesBArbytqX6aeVDOmzHtgMPxoC55YZuEyp9zP21NzKA1FpRcdDxIWE3di
 yzyun4Tkr01zFJRQWHuZ7k8hCT3mQDUsGkG5qWK3QcxAzIXCD0iiHNw9R+66U39eVWjbg7bmL
 XeDiN6/MifAKcBm0etB+xLX0RHTm2lA+xa/p5T+k8m2z7nB3ylmpHH1yzNM/Mwx4eBP8FvKPH
 QYRiR84zG2G1f/lFQioTNqRAPK/rlwClYX1tqSGD/3chtYW+dOgZPfnXTWGxh1TyIvpZ/2zoK
 jROwL6CnmfAqa/6PdvNJXgsYfl4QHbUg9mV1j/uAR+KDpWtbyfMR/QzBLV8BGF0eSgKyNDsE/
 MEgeAs1CAuSJIAUPH3c1oVohFivXwRjgCckHUCHOEHw2p+FJdxglIpxOdjnJ5fUq8em+7zZ4Y
 JFgWPpheTN8DA0VT2DLjIoPTU2z3HJzGwp3iop+clXkbox5XVIUbfH6ppY6cABSPSEJJ119My
 HyYM=
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
Cc: jgg <jgg@ziepe.ca>, linux-fbdev <linux-fbdev@vger.kernel.org>,
 "b.zolnierkie" <b.zolnierkie@samsung.com>,
 penguin-kernel <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "george.kennedy" <george.kennedy@oracle.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, tzimmermann <tzimmermann@suse.de>,
 sam <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>  > On Wed, May 19, 2021 at 08:00:28PM +0800, songqiang wrote:
> > Signed-off-by: songqiang <songqiang@uniontech.com>
> From: "Matthew Wilcox <willy@infradead.org>"
> > You need to explain:
> >
> > - Why you think this patch is needed
> > - Did you observe a problem at runtime?
> > - Is this the output from some checking tool?
> > - Why this is the right way to address the problem
>
On Thu, May 20, 2021 at 7:58 AM =E5=AE=8B=E5=BC=BA <songqiang@uniontech.com=
> wrote:
>
> I find null pointer bug when I debug the kernel of loongson=EF=BC=8CI thi=
nk the function fb_set_suspend()
> add pointer judgment will more friendly.

When replying to emails on the list, please remember

- avoid top-posting, see https://git-send-email.io/top-posting.html
- use plain text email, html replies get dropped by many mailing lists.

The information from your reply should be part of the patch description whe=
n
you send a patch, see
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html


> [  102.011018] Call Trace:
>
> [  102.013443] [<ffffffff81068e10>] fb_set_suspend+0x50/0x80
> [  102.018819] [<ffffffffc0061aa0>] loongson_drm_suspend+0x1a0/0x340 [loo=
ngson]
> [  102.025827] [<ffffffffc0061c58>] loongson_pmops_freeze+0x18/0x40 [loon=
gson]
> [  102.032748] [<ffffffff81008fd4>] pci_pm_freeze+0x94/0x240
> [  102.038114] [<ffffffff815377e0>] dpm_run_callback.isra.5+0x20/0x140
> [  102.044341] [<ffffffff81539608>] __device_suspend+0x2c8/0x740

It looks like the check would actually belong into the loongson_drm driver.
The driver is not upstream yet, but I assume you have the source for it, so
try to fix the bug there and send the patch to the owners of that driver.

       Arnd
