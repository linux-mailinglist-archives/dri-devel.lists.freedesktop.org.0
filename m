Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9EA4A13C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3EB10E04C;
	Fri, 28 Feb 2025 18:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="jeewhwQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B16910E04C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=blulkBB0PcOmhGQ1VzOHFSAX2JRkc55UE2z0mfUu07I=; b=jeewhwQRdJjQWBDd
 y+6E7x9Nt5ALcKaXuaF6yOQTUUYY9uhLPl4ZtA1aNO0aJIH6VolHVJxO8tadyW/RSfD5Aeg/NuEtQ
 Gizd/xeUrNgD++6lqT1oH5pCVZpb2Alj3MWxA0AYN8A+lYM6dwZh6hDdJoyqV3zDaqI/WS+uAHtBb
 qQfRT9ECF1cX+mGSjPuFnqJNhJMM7mZCuE0q/EN39LrX1U+CIeDdkwgy6GM0vJieAFvqYTPvg2ja1
 Fs43xYk3UU3J5NOupUQqHHoULGEY5flgQtWO1B6qBz0Gkd9Xi3HAan/sfJMSIwGc1I9CJ72mmBkIY
 E1P9NwGgqLVg7fLZdw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1to4tF-001iUc-2Z;
 Fri, 28 Feb 2025 18:15:13 +0000
Date: Fri, 28 Feb 2025 18:15:13 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mperttunen@nvidia.com, linux-tegra@vger.kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Message-ID: <Z8H9MaLZf0dnsXSu@gallifrey>
References: <20241215214750.448209-1-linux@treblig.org>
 <vukpbuvuyfljqtexnimsrfozt64pfrjc33a4ojb7lht7fke45a@g4afdjrz6u52>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <vukpbuvuyfljqtexnimsrfozt64pfrjc33a4ojb7lht7fke45a@g4afdjrz6u52>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 18:15:02 up 296 days,  5:29,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Thierry Reding (thierry.reding@gmail.com) wrote:
> On Sun, Dec 15, 2024 at 09:47:50PM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > host1x_debug_dump_syncpts() has been unused since
> > commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
> > fences")
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/gpu/host1x/debug.c | 9 ---------
> >  drivers/gpu/host1x/debug.h | 1 -
> >  2 files changed, 10 deletions(-)
> 
> Applied to drm-misc-next, thanks.

Thanks

> Thierry


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
