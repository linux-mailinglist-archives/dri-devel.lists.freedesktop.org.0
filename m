Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2974158D56C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 10:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8F8D8D1;
	Tue,  9 Aug 2022 08:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD49CBA48
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 08:32:46 +0000 (UTC)
Received: from mail-ej1-f54.google.com ([209.85.218.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mk0a0-1nfhJM2JpI-00kKn8 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug
 2022 10:32:44 +0200
Received: by mail-ej1-f54.google.com with SMTP id i14so20954110ejg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 01:32:44 -0700 (PDT)
X-Gm-Message-State: ACgBeo2q4Ci40jBD8YCHX8jtYguRB6gWljwAmdgtU2IzgHGZDVSQRX/+
 vBwODwcsjAjeoEbFktNadIxZvXZNZUYFViE73iI=
X-Google-Smtp-Source: AA6agR4TKFxtd5LiYcX73HbGF2u7VeVKCRTYtwOOZ8D2bVS25LcWy9weFOVCptPzjGX0tAq94ORtgLDqHbENdmCFPc8=
X-Received: by 2002:a17:907:7395:b0:730:b636:2c89 with SMTP id
 er21-20020a170907739500b00730b6362c89mr16431662ejc.547.1660033964094; Tue, 09
 Aug 2022 01:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
 <YvCozvgodIY19LSr@kroah.com> <YvFOEPdC9r8QBH11@nvidia.com>
 <YvH9X5puer4jpzMX@kroah.com> <YvIU/wMdqFA1fYc6@infradead.org>
In-Reply-To: <YvIU/wMdqFA1fYc6@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 9 Aug 2022 10:32:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3y2=FyzK4S6MRfZdrz=DdLat1ajdT_uPmN533mNYmF9w@mail.gmail.com>
Message-ID: <CAK8P3a3y2=FyzK4S6MRfZdrz=DdLat1ajdT_uPmN533mNYmF9w@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Kj5fqitFiE9quHilzFlZ+KJKYqgJZ4R/dtJIyB3VNUDXNubSlC+
 qIt/SBBYlDhqI/qZwkSJ6ymaXak7Jg5xA4sUTjwpWeU+BzaJeWGCAOUcFvLaNsUFTwka1vY
 6XarjgMzXFAMK5fTEk3Le7G98OP+rYT+3Cg8i6djbLVxQni6td8GzKs7SkupBopY8rcj88X
 5S86ww25pFiBS9goc+4AQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fndTK9Kt1KM=:QyCcySefMFtspw7qOEgvLT
 QnCNRiYVe9m03v5LbkoPpjsOEERnik3kmCV7mJmp/Vc13/h03lfoyqMyLFD07Pk2bnfh2Rzab
 fqCkeUiHTkypW4zboNBjuGNSJBe+USqzEuWRlMcJZqIukkdFf37kuk20qS4jN9DZX6Aatty+3
 pHILpR2Q+rp++fzW3AyIjWX+1utQraCqJQQdHgCphASI1jaGD+Z+fGF47ptZPrfiwQ/LZ5L20
 nTUiBKQSi0/B90AJLJK/7s8IjcS3FMytwtR6MZxMhKX9W0bQLZ+ophVsxSJuJk1drGKal7fDp
 ds8NRXeOGywu7yhixCcJY6kqzQQup9ip8i8JjQnZmOJkGJ5AxUUnIXJeH7fIxSthMLryYp5oY
 inIV9TTe2VpG94NNPTucKsZvhlQwGjMiM6pzLVM7EhZi3/z/sc6NRT1VAqHsnVxA5k0dfVEAx
 v6j09t8j9IJGXiGWPG6EciuBBgbuIwoS6PX/i2g3QWMciDzNrkOU4G87c1L3kWsLhrNQENjOl
 XJrUAHvP1jf5gYWtJQVfJEYfzTIudZtlIXQkK1Axv6V6pMe3+l+34SvR+WSnGfG2fKbwniGX1
 Mo53MlgMiizR8OHP8Kkq/J7Ud5zZ2fnXo9B1COAMh997ip0xCUad/DRaR1ktLNiaEFAZgJTNH
 pa11oVDOPAYP7ZUC/9yyxQ1hWdmEoIl7e8KKyDSkG1pWWCtFTMZUWtgx22necqCztqiJv39HT
 Rsv6QmFUt+owz/ogJARtkedFMAsb4g1hBWAg+w==
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 9, 2022 at 10:04 AM Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Aug 09, 2022 at 08:23:27AM +0200, Greg Kroah-Hartman wrote:
> > > This is different from the number of FDs pointing at the struct file.
> > > Userpsace can open a HW state and point a lot of FDs at it, that is
> > > userspace's problem. From a kernel view they all share one struct file
> > > and thus one HW state.
> >
> > Yes, that's fine, if that is what is happening here, I have no
> > objection.
>
> It would be great if we could actually life that into a common
> layer (chardev or vfs) given just how common this, and drivers tend
> to get it wrong, do it suboptimal so often.

Totally agreed.

I think for devices with hardware MMU contexts you actually want to
bind the context to a 'mm_struct', and then ensure that the context
is only ever used from a process that shares this mm_struct,
regardless of who else has access to the same file or inode.

We did this in a somewhat hacky way in spufs a long time ago, and
I would expect this to be solved more cleanly in drivers/gpu/drm, but
I don't know where to look for that code.

        Arnd
