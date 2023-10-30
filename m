Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723A77DB32A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 07:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91B10E20C;
	Mon, 30 Oct 2023 06:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Mon, 30 Oct 2023 06:20:06 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B4510E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 06:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=SOF4+PcgGPb+gmIIwjzNN4MW7Y6OXy/4z0Y3hzoww/k=;
 b=bpRdTC9evxq++pSHCC7JZIzJIFMcbUGe8q4kMVeutURj1tNxbNxu7u2W
 dSqhLhx67Wv8+7n/tfl2cYuvulFUdcaP6UqnoyIHCaLKAoNGI0bIeUiAo
 IfO3fgUk0CG8SmnhN6X4398qwz7sFDMbVKmDtpkkym7cUWysxXNuewjwM E=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,262,1694728800"; d="scan'208";a="133817206"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 07:12:54 +0100
Date: Mon, 30 Oct 2023 07:12:54 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH Resend] Fix line Length
In-Reply-To: <ZT7v39jG4WTxPYjm@debian.me>
Message-ID: <alpine.DEB.2.22.394.2310300712310.3533@hadrien>
References: <20231029144312.5895-1-dorine.a.tipo@gmail.com>
 <alpine.DEB.2.22.394.2310291610030.3136@hadrien> <ZT7v39jG4WTxPYjm@debian.me>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Linux Outreachy <outreachy@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>, Nick Terrell <terrelln@fb.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>, Helen Koike <helen.koike@collabora.com>,
 Dorine Tipo <dorine.a.tipo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Mon, 30 Oct 2023, Bagas Sanjaya wrote:

> On Sun, Oct 29, 2023 at 04:11:01PM +0100, Julia Lawall wrote:
> >
> >
> > On Sun, 29 Oct 2023, Dorine Tipo wrote:
> >
> > > Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> > >
> > > Fix the line lengths of lines 8 and 49
> >
> > The Signed off by line should be here, below the log message.  Please see
> > the patches sent by others.
> >
> > >  export IGT_FORCE_DRIVER=${DRIVER_NAME}
> > >  export PATH=$PATH:/igt/bin/
> > > -export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu/:/igt/lib/x86_64-linux-gnu:/igt/lib:/igt/lib64
> > > +export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu/:/igt/lib/x86_64-linux-gnu
> > > +export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib:/igt/lib64
> >
> > There was a suggestion that it was better to keep this as one line.
> >
>
> Hi Julia,
>
> The submitter touched one of CI scripts for the DRM subsystem. To test
> this patch, there must be a way to run these scripts locally (which
> may requires non-trivial setup).
>
> Cc'ed DRM maintainers.

There is a DRM outreachy project.  I think that motivated this patch.

julia
