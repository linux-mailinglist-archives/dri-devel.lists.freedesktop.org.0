Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A84868AA7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D52410E89D;
	Tue, 27 Feb 2024 08:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOmjszGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB0C10E899
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709021807; x=1740557807;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WYjV/Wnl6Iy/uJeAgOLvLGjdGBhZ41uQ6wG1iWH9Zwc=;
 b=XOmjszGnK7SJ2Omu+IiQlAfkR03G35HAcqxtiZQNs1VM3yuRtaHDoMLN
 jdF99INBXB6+k9X9vHWcSu7EBo3jyvlRg7cbH2fgjkOJHH066Yre+50kn
 XNF33SCMjUvwvdi5AqZguP7SqcwgMHIhzalkGU3cyuxbxmFo42Dsi+LwM
 90iw0ZoV59y/+h160xC/o+QWEpegaUDHed5ibEOplJQtzrmTmnm3uSG/0
 NpMEMNE1YThwKk8xS+/5K0c+UkZTGX1I46rcIHDn/Na0h+IzeVt0Qd8BA
 0V+oXpyS8je/3Mp3fzP8BiTyRO+tUahgOcUatRSiS0Shv6waBfIISfvwK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3210925"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3210925"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 00:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11732239"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.47.32])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 00:16:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [rerere PATCH] nightly.conf: Switch drm.git to gitlab
In-Reply-To: <20240226151631.130754-1-mripard@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240226151631.130754-1-mripard@kernel.org>
Date: Tue, 27 Feb 2024 10:16:40 +0200
Message-ID: <87jzmql3tj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 26 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Start the big migration with drm.git.
>
> Existing remotes need to be adjusted with
>
> git remote set-url drm ssh://git@gitlab.freedesktop.org:drm/kernel.git

It should be either

git@gitlab.freedesktop.org:drm/kernel.git

or

ssh://git@gitlab.freedesktop.org/drm/kernel.git

(Note the : vs / in there.)


BR,
Jani.


>
> or
>
> git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  nightly.conf | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/nightly.conf b/nightly.conf
> index c189f2ccad17..68ac687a5c7f 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -45,10 +45,8 @@ https://anongit.freedesktop.org/git/drm/drm-misc
>  https://anongit.freedesktop.org/git/drm/drm-misc.git
>  "
>  drm_tip_repos[drm]="
> -ssh://git.freedesktop.org/git/drm/drm
> -git://anongit.freedesktop.org/drm/drm
> -https://anongit.freedesktop.org/git/drm/drm
> -https://anongit.freedesktop.org/git/drm/drm.git
> +https://gitlab.freedesktop.org/drm/kernel.git
> +ssh://git@gitlab.freedesktop.org:drm/kernel.git
>  "
>  drm_tip_repos[linux-upstream]="
>  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

-- 
Jani Nikula, Intel
