Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E272A2062
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5306EB36;
	Sun,  1 Nov 2020 17:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909CC6E0E8;
 Sat, 31 Oct 2020 12:01:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,437,1596492000"; d="scan'208";a="475164141"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 13:01:08 +0100
Date: Sat, 31 Oct 2020 13:01:08 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
Subject: Re: [Outreachy kernel] [PATCH] drm/amdgpu: use
 DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
In-Reply-To: <0b818156537f354904938f437cbb9dd02e765653.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2010311300530.2733@hadrien>
References: <20201030032245.GA274478@my--box>
 <20201030071120.GA1493629@kroah.com> <20201030075716.GA6976@my--box>
 <20201030080316.GA1612206@kroah.com>
 <0b818156537f354904938f437cbb9dd02e765653.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Sat, 31 Oct 2020, Joe Perches wrote:

> On Fri, 2020-10-30 at 09:03 +0100, Greg KH wrote:
> > On Fri, Oct 30, 2020 at 01:27:16PM +0530, Deepak R Varma wrote:
> > > On Fri, Oct 30, 2020 at 08:11:20AM +0100, Greg KH wrote:
> > > > On Fri, Oct 30, 2020 at 08:52:45AM +0530, Deepak R Varma wrote:
> > > > > Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
> > > > > function in place of the debugfs_create_file() function will make the
> > > > > file operation struct "reset" aware of the file's lifetime. Additional
> > > > > details here: https://lists.archive.carbon60.com/linux/kernel/2369498
> > > > >
> > > > > Issue reported by Coccinelle script:
> > > > > scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> []
> > There is a reason we didn't just do a global search/replace for this in
> > the kernel when the new functions were added, so I don't know why
> > checkpatch is now saying it must be done.
>
> I think it's not a checkpatch warning here.

That is correct, it's a coccinelle script.

julia

>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/0b818156537f354904938f437cbb9dd02e765653.camel%40perches.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
