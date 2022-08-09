Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FF58D8E2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 14:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EE7D4481;
	Tue,  9 Aug 2022 12:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F34FD4444
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 12:46:55 +0000 (UTC)
Received: from mail-ed1-f44.google.com ([209.85.208.44]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCbVD-1oCLwU2g6N-009fZL for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug
 2022 14:46:53 +0200
Received: by mail-ed1-f44.google.com with SMTP id t5so14907411edc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 05:46:53 -0700 (PDT)
X-Gm-Message-State: ACgBeo1cLGhxccJMUPdNxFZb79R1Oe5O+2Et3LKgYLNwbcnEf8FuiV1S
 04159fHBWfzFqI2+/5RXeM6abzi1qNQ94uXOSOU=
X-Google-Smtp-Source: AA6agR6Xuo8oq3O93hYf9/RvjWY1aU8DCMG2Z/kMBHq6EOz9ee/eJ7mLajy5lJizAABBbY8Pdw7DvT09sNceWQOXAwQ=
X-Received: by 2002:a05:6402:3693:b0:43d:1a40:21fd with SMTP id
 ej19-20020a056402369300b0043d1a4021fdmr16756256edb.206.1660049213118; Tue, 09
 Aug 2022 05:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
 <YvCozvgodIY19LSr@kroah.com> <YvFOEPdC9r8QBH11@nvidia.com>
 <YvH9X5puer4jpzMX@kroah.com> <YvIU/wMdqFA1fYc6@infradead.org>
 <CAK8P3a3y2=FyzK4S6MRfZdrz=DdLat1ajdT_uPmN533mNYmF9w@mail.gmail.com>
 <YvJQqxWAQbevR9Ok@nvidia.com>
In-Reply-To: <YvJQqxWAQbevR9Ok@nvidia.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 9 Aug 2022 14:46:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2149buJammrS=hqHPjKOYLRjJOxpSuT8-D_avYPZndOA@mail.gmail.com>
Message-ID: <CAK8P3a2149buJammrS=hqHPjKOYLRjJOxpSuT8-D_avYPZndOA@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MBchYn/m5XTwHmOeesI9B8wKuVYLqb6Ktuqz7f9FFIIKQQ3bMcQ
 cdq+szY7jS6C/0ngTlEsdxHl6oqA3P50rsBBBM0kPAYb054VL5zlUo3Z3yMnDWjjYALM9dQ
 WOhyfSXe6FzsNIzT1K0Q0+EC1htcrOy4wQQUxMPHFKtPbYBfd+VfhWlfIDF2mtA/Y28+NVg
 sHvjm8NrJpNmOxM3hKAKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6919dLEKhM8=:EomRy9qE590aflubMMIBVZ
 +CjX38yk1bLV/aw9uvUUPs/JswmecB1R6sFZuRXEOyaUSUaR4dCDFryB8KiREMxfCz/M85lmS
 EdvhR5vxgQpeh5riReAEkoyHpc0utPojRZkdR66gOtB4Aj4emn2BBXqhS5t2F4mW4TICVyFG/
 tOTecthRMzOo0w3vs63lHdbNcjKDYhnH092BtdNn9bEAt6OECHSYJbwtRryMRJgcm3WwEovRX
 Cfy5y6NV/K05bmdQMEijTT20NRmwv6GkUfu/J770qaiw2jyV2O7VBQjeKUX/RNSnbzK8hC2Ow
 0H+LOIP6qSUGZRLjvCyJUiAMe8OgQbAmgQ4wnja3Gs4WCMPIyQP1M1zsDk6s4ULcZwiyINjkj
 V/TYvImGHZHNIzuZgr5QN10WMRyOErejF9q2z/Z4GtcSnfQZL8wK1m1L++DBwj3cpYETaluwE
 FByV84SXKU+4AYJn6aYuyoYngNxEQ1eb1FU9Cxlq3mz/sssrSn0cHu29h4X+3gW5Jp79Sfq0P
 cCmyjGvV8psPFxvrQBNeIwA6Cn9TwjFvZp5854FXB0d0nK8i9vt22PE6soRkW7id0BAECNO+Y
 Wv/+iyg6otbxeS0pD6btc0rLDpRMMMHPCT73MQmY6Fa463+MFOqFAoHbSOeqGMVWmlJV3D6lU
 eX4h7c9k0CzybnFem5pK+N/Cd20BdE4fnr5d38rts9hSG4k/6qUXCeWkKSaSan//l4J+ilj7E
 Gs4jiT79G5OcRT47nxYo23V2iS/C0kXXS3fKt897CjTYz/yZU1IQM40XkM9hqHAAUqQChpyy/
 nMXnVxxuSYZ6WBR7IdYLWh4eClIkIHQ8bQodyt2MRogBVGejJfXTWLvfb67Wtno/47P7j/ZeL
 CGoa7/X7Uxz12XO1PRqg==
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
Cc: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jiho Chu <jiho.chu@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 9, 2022 at 2:18 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Tue, Aug 09, 2022 at 10:32:27AM +0200, Arnd Bergmann wrote:
> > On Tue, Aug 9, 2022 at 10:04 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > I think for devices with hardware MMU contexts you actually want to
> > bind the context to a 'mm_struct', and then ensure that the context
> > is only ever used from a process that shares this mm_struct,
> > regardless of who else has access to the same file or inode.
>
> I can't think of a security justification for this.
>
> If process A stuffs part of its address space into the device and
> passes the FD to process B which can then access that addresss space,
> how is it any different from process A making a tmpfs, mmaping it, and
> passing it to process B which can then access that address space?
>
> IMHO the 'struct file' is the security domain and a process must be
> careful to only allow FDs to be created that meet its security needs.
>
> The kernel should not be involved in security here any further than
> using the standard FD security mechanisms.
>
> Who is to say there isn't a meaningful dual process use case for the
> accelerator? We see dual-process designs regularly in networking
> accelerators.

I think there is a lot of value in keeping things simple here, to
make sure users and developers don't make a mess of it. If the
accelerator has access to the memory of one process but I run
it from another process, I lose the benefits of the shared page
tables, but gain a lot of the complexity that I think the 'single-opener'
logic was trying (without success) to avoid.

E.g. attaching a debugger to single-step through the accelerator code
would then involve at least four address spaces:

 - the addresses of the debugger
 - the addresses local to the accelerator
 - addresses in the shared address space of the process that owns
   the memory
 - addresses in the process that owns the accelerator context

which is at least one more than I'd like to deal with.

This is somewhat different for accelerators that have coherent
access to a process address space and only access explicitly
shared buffers. On these you could more easily allow sharing the
file descriptor between any number of processes.

       Arnd
