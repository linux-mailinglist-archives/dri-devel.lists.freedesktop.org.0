Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D949D0308
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 11:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F0410E2EB;
	Sun, 17 Nov 2024 10:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="jOi3bQco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Sun, 17 Nov 2024 10:51:39 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AB010E2EB
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 10:51:39 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 34682200B5
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 10:46:23 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com
 [217.182.119.157])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 5447D200C0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 10:46:20 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id CE1D53E8D2;
 Sun, 17 Nov 2024 11:46:17 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf1.mymailcheap.com (Postfix) with ESMTPSA id C666A40085;
 Sun, 17 Nov 2024 10:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1731840376; bh=zkVKK31V3XTcG/ZCZgUnMlJH8UoGyg+LKu7dmVTrdaY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jOi3bQcoMLMnsJOdvOOyGBxYSaa4sGGNRr7FpwJVmsYzjdBwR3uhdGBTsxtrrvQUR
 nVqNYBzLKdcvvWcQ2wYLWjCoOh9cq4sAFcYzgnLBYj64Abl38lxuRzBBA/fIK0FFGM
 +4vQmewgdEy3IsnlwYf2U7GkysIEZi+KSfCx8kUc=
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id B9BB34293A;
 Sun, 17 Nov 2024 10:46:15 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 17 Nov 2024 18:46:15 +0800
From: Mingcong Bai <jeffbai@aosc.io>
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter
 <sima@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Kexy
 Biscuit <kexybiscuit@aosc.io>
Subject: Re: [git pull] drm amdgpu regression fix for 6.12-rc8
In-Reply-To: <CAPM=9twfZ5B1NqByVsvHO38MGQ+ZfTEz6xmtZXQarHvKgg3gLA@mail.gmail.com>
References: <CAPM=9twfZ5B1NqByVsvHO38MGQ+ZfTEz6xmtZXQarHvKgg3gLA@mail.gmail.com>
Message-ID: <c6d0e119afaf76abad93dd846fd6ad27@aosc.io>
X-Sender: jeffbai@aosc.io
Organization: Anthon Open Source Community
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.98 / 10.00]; BAYES_HAM(-0.88)[85.80%];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_COUNT_ONE(0.00)[1];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_TO(0.00)[gmail.com];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MISSING_XM_UA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,ffwll.ch,gmail.com,lists.freedesktop.org,vger.kernel.org,aosc.io];
 TO_DN_ALL(0.00)[]; HAS_ORG_HEADER(0.00)[]
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C666A40085
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

Hi Dave and Alex,

在 2024-11-17 06:17，Dave Airlie 写道：
> Hi Linus,
> 
> Alex sent on a last minute revert for a regression found with swsmu
> patch for final,

I saw this patch earlier from the stable list and was a little confused 
as to what the regression was (what exact hardware 
configurations/workloads one may observe this issue in?):

https://lore.kernel.org/stable/CADnq5_MPEwVGmnMBz_xzO4ZCBM0kgqP=rzwK+L5VPjwpnRj9+A@mail.gmail.com/

Since Alex commented that "End users care" about this regression on the 
stable list, I would really love to know what kind of regression we are 
looking at (and as distro maintainers, what we should be looking out 
for).

Alex, would you care to elaborate?

Best Regards,
Mingcong Bai

> 
> Regards,
> Dave.
> 
> drm-fixes-2024-11-17:
> drm/amdgpu regression fix for 6.12-rc8
> 
> amdgpu:
> - revert patch to fix swsmu regression
> The following changes since commit 
> 21c1c6c7d732c2f6f4c5ffc77e103aa3ae8bff1d:
> 
>   Merge tag 'drm-xe-fixes-2024-11-14' of
> https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
> (2024-11-16 04:31:54 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/kernel.git 
> tags/drm-fixes-2024-11-17
> 
> for you to fetch changes up to 
> f48ab0a39f12fd83fae13bf81152531565cd5e75:
> 
>   Merge tag 'amd-drm-fixes-6.12-2024-11-16' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-11-17
> 08:12:48 +1000)
> 
> ----------------------------------------------------------------
> drm/amdgpu regression fix for 6.12-rc8
> 
> amdgpu:
> - revert patch to fix swsmu regression
> 
> ----------------------------------------------------------------
> Alex Deucher (1):
>       Revert "drm/amd/pm: correct the workload setting"
> 
> Dave Airlie (1):
>       Merge tag 'amd-drm-fixes-6.12-2024-11-16' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
> 
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 49 
> +++++++---------------
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  4 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  5 ++-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  5 +--
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  5 +--
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  4 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  4 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 20 +++------
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  5 +--
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  9 ++--
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  8 ----
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  2 -
>  12 files changed, 36 insertions(+), 84 deletions(-)
