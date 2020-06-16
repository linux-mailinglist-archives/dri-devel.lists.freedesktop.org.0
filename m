Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDF1FAE94
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 12:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D746E817;
	Tue, 16 Jun 2020 10:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D149A6E817
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 10:51:24 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 81F591C0BD2; Tue, 16 Jun 2020 12:51:21 +0200 (CEST)
Date: Tue, 16 Jun 2020 12:51:13 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
Message-ID: <20200616105112.GC1718@bug>
References: <20200519163234.226513-1-sashal@kernel.org>
 <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55c57049-1869-7421-aa0f-3ce0b6a133cf@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 sthemmin@microsoft.com, tvrtko.ursulin@intel.com, gregkh@linuxfoundation.org,
 haiyangz@microsoft.com, spronovo@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, wei.liu@kernel.org,
 linux-fbdev@vger.kernel.org, iourit@microsoft.com, alexander.deucher@amd.com,
 kys@microsoft.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

> > The driver creates the /dev/dxg device, which can be opened by user mode
> > application and handles their ioctls. The IOCTL interface to the driver
> > is defined in dxgkmthk.h (Dxgkrnl Graphics Port Driver ioctl
> > definitions). The interface matches the D3DKMT interface on Windows.
> > Ioctls are implemented in ioctl.c.
> 
> Echoing what others said, you're not making a DRM driver. The driver should live outside 
> of the DRM code.
> 

Actually, this sounds to me like "this should not be merged into linux kernel". I mean,
we already have DRM API on Linux. We don't want another one, do we?

And at the very least... this misses API docs for /dev/dxg. Code can't really 
be reviewed without that.

Best regards,
										Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
