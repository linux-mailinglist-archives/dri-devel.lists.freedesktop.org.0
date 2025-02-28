Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB8A49DBB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D6A10ECD8;
	Fri, 28 Feb 2025 15:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="JLtXwvZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FBA10ECD8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=QzjgdiXNQn2lVM94vvC1YOjh1DnAuEwZM6OUPbLdXjw=; b=JLtXwvZY9rod+vN/
 6zix4+Vc9e0yIA9MhNtdoGNIHovyFlBBn8P4lF9sMuFQ9qVwfCWkNPBpfz15TMrGpY6Vo7/Cezb9L
 ox2oOdEjwzmJTvgPqUezZT6aN9i0pYPsJmEEFp4PsBXl+nudrh8B+fvMxDR792jSBLMOdHLiTFF3L
 DihJk7VwIfSzKhdRAWh8/+U4jT2ywSaj1DsNVTUnNAJ8LCPNJpA8KZc5yXU2vdavYnbbyV1d8G+Cy
 PzWqlc7Qn7IrthdfZqlZbNpXS6rc2FdK6Rjsjr+N/jzMAtGZD91OfXNTsRUED08EwU7q90hbm5zT4
 UxVAQ7K8X2/euUVlxA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1to2VD-001g24-2A;
 Fri, 28 Feb 2025 15:42:15 +0000
Date: Fri, 28 Feb 2025 15:42:15 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, p.zabel@pengutronix.de,
 deller@gmx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Message-ID: <Z8HZV3RuIeTtcd3a@gallifrey>
References: <20241226022752.219399-1-linux@treblig.org>
 <gugwtvw6qqknstlscr4hxfrvcgfa4gfwwgxdosr24mf7huk433@oh7axkbesrjs>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <gugwtvw6qqknstlscr4hxfrvcgfa4gfwwgxdosr24mf7huk433@oh7axkbesrjs>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 15:40:47 up 296 days,  2:54,  1 user,  load average: 0.01, 0.02, 0.00
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

Hi All,

* Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> On Thu, Dec 26, 2024 at 02:27:45AM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > Hi,
> >   This set removes a bunch of functions in ipu-v3 that
> > have been unused for a long time (since 2012-2017).
> > 
> >   No changes to functions are made, just full deletions.
> > 
> >   Build tested only.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > 
> 
> 
> For the series:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Could this be picked up for drm please?

Thanks,

Dave

> -- 
> With best wishes
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
