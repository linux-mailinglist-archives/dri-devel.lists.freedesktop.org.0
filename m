Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A4B45441
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E225410EB68;
	Fri,  5 Sep 2025 10:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="O5F5DqGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A8E10EB68;
 Fri,  5 Sep 2025 10:14:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 84CDF40E016E; 
 Fri,  5 Sep 2025 10:14:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3sLuUFXyEEJq; Fri,  5 Sep 2025 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1757067272; bh=sRVEq78yhQX8mJR2jOK3VXC8p7w5NsQwrzj6XNVd9Kk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5F5DqGCSXLzXfMyz2ZOlaefPXa/T4kku2ojaVLjSJW8qcOoEvt7dhNgHdfH3C8pD
 4tjyzrmGsfGYCcJ57pUVqRGfx02+I/nSMkXrW+GX3KVq42y+Dze5CiXRCkVpDHVjDz
 2N2B9MuufaBqwYDu7eYA2F8nv1EM2R0KRdhDfel1lh4AUi7AAHr0tS7QzmyRLuZWLp
 +dOVJYOmhtComKpbUAORMez25F4TJ0yjHxMSR2X750FXHMr3wyiC9OFbnXWTpKtcJQ
 z1sP/PPzwxSwFRVo9IKMlIeHPnYgToDJAol9AatRKLyM5Bj2YPVla2qqoRkeeK/NGy
 02CrRh/YbHKHO95kVWi7ivyizdtBaLs9azQmkDnmT5vVp7lpsd1bb+ssEISwl1eEwu
 is5o5djyizpelfLeMf4lYjYsWH3wnfsFwzVFDq19XF7f3pOgS6F8Qc0Qy7ySmXhAh2
 1LtXwFP3FOGT5w7yyUi5iYtbUaRzY04uvehZLfhMTGaPolDlTiQFKvF8Asnyyw5mlz
 kt1qCd3ERXNp8B2BYnCheX4E+mo4EU0hYRpG02Z0J48col/cwrXiJo9GiK2BKv5GhX
 VBHK6lNXnrD/SfLneraum6RaQneqiBpODAVRmzUEIVe8trnSWV5Q+3kAikE5LhGIBZ
 7oVl4MCHihvho2vagYkKrh/E=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 C5F4040E00DE; Fri,  5 Sep 2025 10:14:29 +0000 (UTC)
Date: Fri, 5 Sep 2025 12:14:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/radeon: use dev_warn_once() in CS parsers
Message-ID: <20250905101422.GAaLq3_kDePySD36Ma@fat_crate.local>
References: <20250902165332.2388864-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902165332.2388864-1-alexander.deucher@amd.com>
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

On Tue, Sep 02, 2025 at 12:53:32PM -0400, Alex Deucher wrote:
> Older GPUs did not support memory protection, so the kernel
> driver would validate the command submissions (CS) from userspace
> to avoid the GPU accessing any memory it shouldn't.
> 
> Change any error messages in that validatio to dev_warn_once() to
> avoid spamming the kernel log in the event of a bad CS.  If users
> see any of these messages they should report them to the user space
> component, which in most cases is mesa
> (https://gitlab.freedesktop.org/mesa/mesa/-/issues).
> 
> Cc: Borislav Petkov (AMD) <bp@alien8.de>
> Link: https://lore.kernel.org/r/20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/radeon/evergreen_cs.c | 520 +++++++++++++-------------
>  drivers/gpu/drm/radeon/r100.c         | 215 +++++------
>  drivers/gpu/drm/radeon/r200.c         |  34 +-
>  drivers/gpu/drm/radeon/r300.c         |  66 ++--
>  drivers/gpu/drm/radeon/r600_cs.c      | 445 +++++++++++-----------
>  drivers/gpu/drm/radeon/radeon_cs.c    |   2 +-
>  6 files changed, 648 insertions(+), 634 deletions(-)

Btw, now that I had to reboot the workstation, I thought I'll apply yours to
test it. You've missed one spot, see below. :-)

With that additional debug added, I see now:

[   25.877593] radeon 0000:1d:00.0: vbo resource seems too big (524289) for the bo (524288)

which looks like some buffer limits mis-counting. The bo is obviously of 1^19
buffer size while one of those "size" and "offset" things are off by one.

If anyone wants to debug, the program which causes this is conky version:
1.11.6-2 in debian. It starts spewing the warnings when I start it and since
it.

Thx.

---
diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index d49e59626e39..1162cb5d75ed 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -2418,7 +2418,8 @@ static int evergreen_packet3_check(struct radeon_cs_parser *p,
 				size = radeon_get_ib_value(p, idx+1+(i*8)+1);
 				if (p->rdev && (size + offset) > radeon_bo_size(reloc->robj)) {
 					/* force size to size of the buffer */
-					dev_warn_ratelimited(p->dev, "vbo resource seems too big for the bo\n");
+					dev_warn_once(p->dev, "vbo resource seems too big (%d) for the bo (%ld)\n",
+						      size + offset, radeon_bo_size(reloc->robj));
 					ib[idx+1+(i*8)+1] = radeon_bo_size(reloc->robj) - offset;
 				}
 
-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
