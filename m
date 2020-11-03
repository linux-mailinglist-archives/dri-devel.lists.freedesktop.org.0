Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F52A3D0E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 07:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5416E81D;
	Tue,  3 Nov 2020 06:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA626E81D;
 Tue,  3 Nov 2020 06:53:29 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81D5A22277;
 Tue,  3 Nov 2020 06:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604386409;
 bh=TfTsp0RPNPigr6kqn9/KXeoueVtBPJk6nmaLCIv3buU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tJwodHqjl5xkJspnrbJh3L94/b9mRMREC14xTIPNjm+UwCSTT83lYlgdeK1P509Wz
 THEWJ8ZtO4FPRjXo1f2lYpJ345v7R9LJdEY6EawOUMQsPVGXTLm5Yz1sZgIk45xB4h
 FyNDSlk31i83v/Ggk1kCPgQ9R5ZjH+8lc2BpemN0=
Date: Tue, 3 Nov 2020 07:53:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: christian.koenig@amd.com
Subject: Re: [PATCH] drm/amdgpu: do not initialise global variables to 0 or
 NULL
Message-ID: <20201103065324.GD75930@kroah.com>
References: <20201102184147.GA42288@localhost>
 <CADnq5_OnA3T_p4pTEOpoqQ=NZyso2VFoDiOHu=+h7dKOeKHq-A@mail.gmail.com>
 <c916ae88-5933-ab06-ad32-d87f00cac21f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c916ae88-5933-ab06-ad32-d87f00cac21f@gmail.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 09:06:21PM +0100, Christian K=F6nig wrote:
> Am 02.11.20 um 20:43 schrieb Alex Deucher:
> > On Mon, Nov 2, 2020 at 1:42 PM Deepak R Varma <mh12gx2825@gmail.com> wr=
ote:
> > > Initializing global variable to 0 or NULL is not necessary and should
> > > be avoided. Issue reported by checkpatch script as:
> > > ERROR: do not initialise globals to 0 (or NULL).
> > I agree that this is technically correct, but a lot of people don't
> > seem to know that so we get a lot of comments about this code for the
> > variables that are not explicitly set.  Seems less confusing to
> > initialize them even if it not necessary.  I don't have a particularly
> > strong opinion on it however.
> =

> Agree with Alex.
> =

> Especially for the module parameters we should have a explicit init value
> for documentation purposes, even when it is 0.

Why is this one tiny driver somehow special compared to the entire rest
of the kernel?  (hint, it isn't...)

Please follow the normal coding style rules, there's no reason to ignore
them unless you like to constantly reject patches like this that get
sent to you.

thnaks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
