Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207EA32F63
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 20:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FA210E96E;
	Wed, 12 Feb 2025 19:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfGfUvMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775510E96E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739387696; x=1770923696;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rRq6PbosGwCh+S4uQAG0FbAB+DGiceJ9qM8veMJVZGc=;
 b=NfGfUvMBOh5Ioaz09R6oaSgnkp9NylFJiOR8iRvo67RcScHjmTZsZ/yO
 rlK5utSswniZNKsx8vPmgtIHykXr7M1vTSvtINqyqVs518KsbPBVdjo3A
 Ueq0r9TKtFkddchZCFLE7tPCCCq+mHm71fyo/ULJIvF0WhqEYKTAAQy6Q
 LmpQKOM1lZKThbgcTwu0jRdyye8ZIBhUND1YCjSa7c7Re7eDrGMuyLnk7
 xl94EIdOQ1yz3c3lRJW2oNNmyS2u5xsaM4/cAz/uNr1w/DAiXvz/MV0Wo
 MuIQJgk4MK5EYQz5aGNH+4LxuKatr9scS2hgaqUANjRo898yOHj7TvHRO g==;
X-CSE-ConnectionGUID: xAmr+H5cRYiJc+p3bbdiAA==
X-CSE-MsgGUID: 7p8U87oWTdeybtD7v6PYIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="27659206"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="27659206"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:14:55 -0800
X-CSE-ConnectionGUID: 4nC2yIOASvmJ+iivEluKMQ==
X-CSE-MsgGUID: vXJ0XwToTgOXF7p3Isk9Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112903857"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.244.188])
 ([10.245.244.188])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:14:53 -0800
Message-ID: <7b0d8055-a58f-4c4c-adb2-c298b5df4f04@linux.intel.com>
Date: Wed, 12 Feb 2025 20:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
To: Nicolas Baranger <nicolas.baranger@3xo.fr>, dri-devel@lists.freedesktop.org
Cc: Tzimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 Jocelyn Falempe <jfalempe@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <194c4656963debcf074d87e89ab1a829@3xo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hello Nicolas,

Thank you for taking a look at this. It would be nice to have an updated 
driver. The best way to go forward is to chop the enhancements from the 
version that you tested into small patches that can be applied to the 
kernel tree.

This way you get all the benefits from the updated driver, in a way that 
it's suitable to maintain for us.

Kind regards,
Maarten Lankhorst

On 2025-02-12 19:58, Nicolas Baranger wrote:
> Dear maintener
> 
> I did include ast-drm driver version 1.15.1 (in replacement of version 
> 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I issue a new 
> dkms patch
> 
> Last DKMS patch had been sucessfully tested on mainline.
> And last ast.ko version 1.15.1 included in linux tree had also been 
> sucessfully tested
> 
> Online directory is updated with :
> - new DKMS patch
> - new DKMS srouces
> - new DKMS debian package
> - new tarball of mainline included ast_new ported in kernel tree
> - new kernel debian package (mainline with ast_new)
> 
> 
> NB: online directory is here: https://xba.soartist.net/ast- 
> drm_nba_20250211/
> 
> Please let me know what I should do to see this change in linux-next
> 
> Thanks for help
> 
> Kind regards
> Nicolas Baranger
> 
> 
> Le 2025-02-11 19:15, Nicolas Baranger a écrit :
> 
>> Dear maintener
>>
>> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
>> driver on mainline kernel (6.13.0 + 6.13.1).
>>
>> ASPEED video driver is availiable here:
>> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz
>>
>> But it only work for LTS kernel
>> So I modify the DKMS package and I build a new Debian DKMS package 
>> with the adapted  source.
>> My patch can be find here :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch
>> See the README:
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README
>>
>> Using this new 'ast 1.15.1' driver, performance are amazing compared 
>> to the 'ast' driver include in kernel tree, specially when using a 
>> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card 
>> as the main video card and as the main and only video output (the 
>> discrete GPU is used only for offloading 3D or for cuda/opencl)
>>
>> So to make things easier, I include the new 'ast 1.15.1' driver in 
>> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
>> It's working fine as you can see on this video :
>> https://xba.soartist.net/ast-drm_nba_20250211/ 
>> vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm
>>
>> I upload all the work I've done here :
>> https://xba.soartist.net/ast-drm_nba_20250211/
>>
>> See the global README :
>> https://xba.soartist.net/ast-drm_nba_20250211/README
>>
>> and the README in nba-kernel sub-directory :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README
>>
>> I'm not a developer so please let me know if I made the things the 
>> right way and if this new 'ast 1.15.1' driver can be ported to linux- 
>> next or linux-? ?
>> If you need more explanations, do not hesitate to contact me, I would 
>> be happy to help
>>
>> Kind regards
>> Nicolas Baranger

