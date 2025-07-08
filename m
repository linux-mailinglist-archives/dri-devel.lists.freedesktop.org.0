Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB100AFD8B9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 22:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5A110E6DE;
	Tue,  8 Jul 2025 20:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Gqnkh++N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C829210E6E1;
 Tue,  8 Jul 2025 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=DZoekFWDQRKYS8E//rmMDVjwcHRmk9UG+oNvcbgcvko=; b=Gqnkh++NdrrEy6eq
 Z4VZVz+V47pRptvyZxxV/ID/De2WXDpJSTPe46C9TkSgO1qzr6ncjKK1sgriRC0fLFPMmT383TU9b
 6BAme5M/yoN/Cb70eXFllJIKFdhPIWxNu1e6M33BN3E5mqMe0vPSUwG1IN1S55VzNsViOoAUOGGMG
 +h3PAZDWJNu3+ik/pLlvR3NVFYUjqAHCXBQ2oIz5bgLw/mOOE0b24PEE5tNCqyOS2MOHBV+Wp1VYH
 BmTXI9XS8sQnzPjl2H/VFLgYoDUgFNzWyGxuS4SL8XZ+L6j6QjDMVKlXsd+2nbSx1PpUjWd/bg3sP
 Wj163Y2bE8KsUNAYuw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1uZFEu-00Erpy-0A;
 Tue, 08 Jul 2025 20:48:32 +0000
Date: Tue, 8 Jul 2025 20:48:31 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: kraxel@redhat.com, airlied@redhat.com, mripard@kernel.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm: qxl: Deadcoding
Message-ID: <aG2EH86lesn7VZNZ@gallifrey>
References: <20250413171058.271234-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250413171058.271234-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 20:46:26 up 72 days, 5:00, 1 user, load average: 0.00, 0.00, 0.00
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

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   A couple of small deadcodings for qxl.  The first
> just cleans up a couple of trivial unusued wrappers.
> The second cleans out some debugfs code that's been unused
> for a few years.
> 
> Dave
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Hi All,
  A gentle ping on this clean up set from April.

Thanks in advance,

Dave

> 
> Dr. David Alan Gilbert (2):
>   drm: qxl: Remove dead qxl_io_flush_* functions
>   drm: qxl: Remove unused debugfs code
> 
>  drivers/gpu/drm/qxl/qxl_cmd.c     | 10 ----------
>  drivers/gpu/drm/qxl/qxl_debugfs.c | 29 -----------------------------
>  drivers/gpu/drm/qxl/qxl_drv.h     | 12 ------------
>  3 files changed, 51 deletions(-)
> 
> -- 
> 2.49.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
