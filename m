Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4822A3242C2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 18:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4376EB13;
	Wed, 24 Feb 2021 17:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C30D6EB13;
 Wed, 24 Feb 2021 17:03:04 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8GAQ-1lsXVY3lU8-014BDu; Wed, 24 Feb 2021 18:02:48 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id CE6931E01E7;
 Wed, 24 Feb 2021 17:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crA7MmH7Nrc8; Wed, 24 Feb 2021 18:02:47 +0100 (CET)
Received: from pflmari.corp.cetitec.com (8-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.8])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 74E1D1E01E6;
 Wed, 24 Feb 2021 18:02:47 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Wed, 24 Feb 2021 18:02:47 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
Message-ID: <YDaGtzRDUIbErYDY@pflmari>
References: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
X-Provags-ID: V03:K1:m8aAXarQw29INPcCiAgbdhio0t8/aa3bejDz7AmScCE56SBxTUs
 0338x89JWxzK3AOgJIuYG+DmB1N6gNyJNZhAnq8IjIxWFD29ZlGRl+wOfqLL9a3jCwNUhnx
 e1Z6CYtadKxdNNb+tlpzGCwe09alB8qpDd06PaIglKILtvyMlkZGO0c1ObUjdolt9+TpVz1
 Ea8odAiBUQE116rfcwkQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vCIRcVpt2tU=:QCbb9kIRJmzls8mByGpaEr
 8bRYTGuEXAFzcE9XnrgVrGmVq95BCAc6TIOOAqu14xQJg21QsK0F1UDz0bQ/C1WdxHjUPLUg3
 GcO0O26g4BOZWW7k24k0dt8I6mySHXg2z48a32D0kLcUO0Vr7jb/Pq6l60+XHCbh0wyNZbgd9
 ZRhjqeGdI8N1Yjxt7hCVjW3AEiWdvUtDNVG9h7xGfLlUUkFYej5l0RyFJ3/UzdQP7hxQcRlyS
 lNsKNPGnRGACXcUSbE5cdNfmCczAwjPVhEV1v7sVmF8SjufpafYliJ64BcXrmWKEb0Ggd7qdr
 w2V/hGkY11wkiQUiYaCKmqrnQPq/ICq4RknnF/RN5Dfxrxdm8FtfQmiWwLwulEx500NEXya7q
 lEBXyRU/lzVdyWRdbM5DcSRaUaX0j4ttxz4/YhzV4H0SO0oYtZucn+6zG9U3ckJL/8c+ZM4TG
 C0f8PCBx4g==
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ilia Mirkin, Wed, Feb 24, 2021 17:57:41 +0100:
> On Wed, Feb 24, 2021 at 11:53 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Ilia Mirkin, Wed, Feb 24, 2021 17:48:39 +0100:
> > > Just to be crystal clear -- are you saying that 128x128 works or does
> > > not work? (You said "yes", which would imply it works OK, but then you
> > > said both cases, which would imply doesn't work since 256x256 doesn't
> > > work?)
> >
> > Modetest with 128x128 cursor works. Without damage to the cursor: modetest
> > shows normal cursor in vanilla v5.11. Modetest also shows normal cursor in
> > vanilla v5.11 with the commit reverted.
> 
> But modetest with 256x256 doesn't work (correctly) right? Or did I
> misunderstand?

Right. That's why I was asking if I did everything right: it was just corrupted
in both kernels.

> All the patch does is allow those large cursors to be used, which gets
> reported via drm APIs and modesetting picks the largest cursor
> available. (And actually I think it's even not required to use the
> large cursors, it just controls what's reported in the defaults to
> userspace.)

Maybe something in X code is not prepared to handle the kernel reporting
large cursor support? Even though 128x128 is pretty large, and I don't think
I even use that large cursors in X configuration. How can I check?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
