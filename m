Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE40407EAB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 18:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977FF6E02F;
	Sun, 12 Sep 2021 16:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17EC6E02F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 16:37:49 +0000 (UTC)
Date: Sun, 12 Sep 2021 16:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631464666;
 bh=iWrsRXODT54fDjqbomuMW+tTamZc86GMmNWS6hNNFB8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=O/hynjvK8++aD+Cgq1/CvOwTKI0hr91VGbBx3avDCjd84t91P9UnNaqQIPOoAEICM
 xFi7eNm13Vh6aCSM2JrhLTZ50PjBjI96AFC8BAf4CvxvPKNaUdYg7PTrM/JC7+iZ3D
 DqRzpSD1x31vPa0Y9o8DUlm6OzfLc+pVTwE4R4KpS0uEWzhN4oyLeeEJps5qqgru2v
 6PsH9HVq9BhVzkVoPKjBsTG9Nt5tkDApBLnSYFQk2cwVdwtFOFNQ8Tkfq3GQUkcECl
 flMewAJ1ylCoutOibTmhIqjHaLo7ZN8CsMfQDxf8gMONlkdDs6XgSAvtMOOzaT89f9
 PKLsK17qLfbGg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Oded Gabbay <ogabbay@kernel.org>,
 mzuckerman@habana.ai, dsinger@habana.ai,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Subject: Re: Accelerator drivers going forward (was Re: Habanalabs Open-Source
 TPC LLVM compiler and SynapseAI Core library)
Message-ID: <acTm3IX-o1RL5nSrZMIEFg_B0T1ENN1Q7iAom58GH0pfJpVTNbghLwqKrLPDzyCjFKVsLmqmDy1PXrytJrXROTKs_ssjbf17oByM0UKVzIE=@emersion.fr>
In-Reply-To: <YT4GxO7ab+s0nbze@kroah.com>
References: <CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com>
 <YTsQJ753sm701R/n@kroah.com>
 <CAKMK7uFLBmdHphtnEa1nyAGUHdcP1KgmaK+vtV_GOU6wZZAOxg@mail.gmail.com>
 <CAKMK7uFj-m4y+N-q8uoNasJuksgDj-oRK3K=SjoyKMQL=QCENw@mail.gmail.com>
 <YT4GxO7ab+s0nbze@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > - move drivers/misc/habanalabs under drivers/gpu/habanalabs and
> > > review/discussions on dri-devel
>
> Wait, why move into gpu?  Are we going to do that for all hardware
> accelerators that we currently have in the kernel tree?
>
> These things are not GPUs in the sense of them being "do some work and
> write out to a screen", which is what I would associate with a GPU (G
> does stand for "Graphical", right?)
>
> Yes, GPUs can do things that some accelerators can do, but they can do
> things that accelerators can not do, and the other way around as well.
> I doubt you want all of the existing gpu drivers to be only treated as
> an "accelerator driver" now, as where would the logic that has to happen
> to get the bits out to a screen live?

This seems like a description of the "display" part of the drivers, driven
by KMS. There are many chips which can't do the "display" part, only the
"render" part. Their drivers are living in drivers/gpu/ as well.
