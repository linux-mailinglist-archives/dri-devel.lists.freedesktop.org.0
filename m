Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250A74F3DC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 17:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4605510E3CF;
	Tue, 11 Jul 2023 15:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1070110E3CE;
 Tue, 11 Jul 2023 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689090030; x=1720626030;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PmRngO6efIpV3m/EbZarmob/ut4D7L4g+ruNcAoAKfc=;
 b=eoyhawbVX8N6WMzdJ37lDLb+OYEudIm0hXT+1sc6kNxA3OSIX0472Zai
 LQN9qM/GYDG9mEjqPSktYQ6Yyjp1Znw18iAgBqrzYCB5FTVS/VOvNGrxn
 zD9j027Eij6n6nuOL0eWsElE5Mn2l+er36AzLSK5du9Gt1pNda+NO0RZW
 nEtsWZea71gsXFUO4V8+n1yAQfEmRtqKWjsEYmvNKWrdQe4qWbX/XEAIz
 2/+28jwtxKzyZCqSXItKYPWobWhg4kXVrwkKMRjfI0gsaglWtYK7uIsHo
 ftVWs4Kf9P3DJKaTA5yQ9YlTbGUIlQgOOAIupJk0FP6D9tohG028JhpFs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349461794"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="349461794"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845314898"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="845314898"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO [10.249.34.84])
 ([10.249.34.84])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:40:29 -0700
Message-ID: <7277d6c3-911a-7a36-6e2a-f89beb5b7bf3@linux.intel.com>
Date: Tue, 11 Jul 2023 17:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [drm-rerere] nightly.conf: drop sound tree from
 drm-tip altogether
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230706092850.3417782-1-jani.nikula@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230706092850.3417782-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Den 2023-07-06 kl. 11:28, skrev Jani Nikula:
> We used to have the sound branches be part of drm-tip to help
> development of DP and HDMI audio. However, we always used to run into
> problems with the sound branches merging Linus' master at non-tagged
> random commits, wreaking havoc especially during the merge windows. We
> only ever want to have tagged stuff merged back from Linus' tree to
> drm-tip.
>
> We introduced a mechanism in dim to hold back branches at certain
> commits, just to hold back sound branches when problems arise. We moved
> it along, but in the end nobody has updated this in literally years, and
> sound branches have been held back at v5.13.
>
> The merge window is currently open, and AFAICT the sound/for-linus
> branch again contains commits from the merge window.
>
> Let's just forget about the sound tree, as nobody has really missed it
> since v5.13, and focus on the drm branches.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   nightly.conf | 7 -------
>   1 file changed, 7 deletions(-)
>
> diff --git a/nightly.conf b/nightly.conf
> index 73aec820e98f..c1e22800e276 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -46,11 +46,6 @@ git://anongit.freedesktop.org/drm/drm
>   https://anongit.freedesktop.org/git/drm/drm
>   https://anongit.freedesktop.org/git/drm/drm.git
>   "
> -drm_tip_repos[sound-upstream]="
> -git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> -https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> -https://kernel.googlesource.com/pub/scm/linux/kernel/git/tiwai/sound.git
> -"
>   drm_tip_repos[linux-upstream]="
>   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> @@ -79,8 +74,6 @@ drm_tip_config=(
>   	"drm-intel		drm-intel-next"
>   	"drm-intel		drm-intel-gt-next"
>   
> -	"sound-upstream		for-linus	v5.13"
> -	"sound-upstream		for-next	v5.13"
>   	"drm-intel		topic/core-for-CI"
>   	"drm-misc		topic/i915-ttm"
>   	"drm		topic/nouveau-misc"
