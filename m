Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A631D0B9E
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB016E9DA;
	Wed, 13 May 2020 09:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Tue, 12 May 2020 09:46:20 UTC
Received: from scenergy.dfmk.hu (scenergy.dfmk.hu [193.224.143.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4C86E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:46:20 +0000 (UTC)
Received: by scenergy.dfmk.hu (Postfix, from userid 1000)
 id EB83B80014D; Tue, 12 May 2020 11:40:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by scenergy.dfmk.hu (Postfix) with ESMTP id C35BC800139;
 Tue, 12 May 2020 11:40:51 +0200 (CEST)
Date: Tue, 12 May 2020 11:40:51 +0200 (CEST)
From: "Karoly Balogh (Charlie/SGR)" <charlie@scenergy.dfmk.hu>
To: Rui Salvaterra <rsalvaterra@gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
In-Reply-To: <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: =?ISO-8859-15?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?ISO-8859-15?Q?Michel_D=E4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 12 May 2020, Rui Salvaterra wrote:

> > FWIW, on my last-generation PowerBook with RV350 (IIRC), there was a
> > big performance difference between AGP and PCI GART. The latter was
> > sort of usable for normal desktop operation, but not so much for
> > OpenGL apps (which were usable with AGP).
>
> I never really understood what were the issues with AGP on PowerPC
> (well, Apple, the only ones I've tested) machines. I mean, did OS X also
> disable AGP entirely, or did it have workarounds somewhere else on the
> stack nobody was able to figure out?

I don't know about OS X, but I doubt there is a major/blocker hardware
issue, at least not one which affects every AGP machine.

MorphOS' own Radeon driver uses the AGP facilities to some degree on all
AGP PowerPC Macs supported by that OS, which is from PMac AGP Graphics
(3,1) all the way up to the AGP G5 (7,3), including the various portables
and the Mac mini G4. For example it can utilize it to stream video data
directly from mainboard RAM, so you don't have to copy it with the CPU,
allowing reasonably good 720p h264 video playback on most systems above
the 1Ghz mark with the native MPlayer port. I'm sure the 3D part of the
driver also use it to some degree, given the performance improvement we
experienced when the AGP support was enabled (initially the system was
running without it), but to which extent I can't say.

Charlie
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
