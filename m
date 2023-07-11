Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2437274F409
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 17:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B47010E3D1;
	Tue, 11 Jul 2023 15:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D2010E3D1;
 Tue, 11 Jul 2023 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689090507; x=1720626507;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y1NM5mG63RFEF6WWsksZ5ljhShXdMgVlpD0NDO/+JgE=;
 b=MaEjhb8dn3dsB4Qd5xEyWWaBGr+jau2IsjoaaSkJlwoXyl+V9R5VBL3r
 UMKw4PjiccVcFgPQ3PLbIiAsegKWxhD9ekOua2f1RndtOVUFJiiykVtMy
 1A8LzTFwFvUloV24kUmxZQ8UfC7b33l0Jvq0PPZXXDuaIDFyyqvMuv9yA
 T0kibukFdS9C8MSSAzF1YV7DWvLEa0w1o1N/X8HlaQutOAIBtQK1vwjfO
 0m4dh+p/bttrQhFfXSnzAWPoe1zxDKd/RqUzNlJpJ7+G69tiWqotd89YY
 zjqWl25df6t6nfN7REPw3dyQ0klhdzhhSrUJA8ff5KgRT86FOa/7BvT8b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430743232"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="430743232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724487197"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="724487197"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.179])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:48:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [drm-rerere] nightly.conf: drop sound tree from
 drm-tip altogether
In-Reply-To: <7277d6c3-911a-7a36-6e2a-f89beb5b7bf3@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230706092850.3417782-1-jani.nikula@intel.com>
 <7277d6c3-911a-7a36-6e2a-f89beb5b7bf3@linux.intel.com>
Date: Tue, 11 Jul 2023 18:48:21 +0300
Message-ID: <87r0peh2ka.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Jul 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Hey,
>
> Den 2023-07-06 kl. 11:28, skrev Jani Nikula:
>> We used to have the sound branches be part of drm-tip to help
>> development of DP and HDMI audio. However, we always used to run into
>> problems with the sound branches merging Linus' master at non-tagged
>> random commits, wreaking havoc especially during the merge windows. We
>> only ever want to have tagged stuff merged back from Linus' tree to
>> drm-tip.
>>
>> We introduced a mechanism in dim to hold back branches at certain
>> commits, just to hold back sound branches when problems arise. We moved
>> it along, but in the end nobody has updated this in literally years, and
>> sound branches have been held back at v5.13.
>>
>> The merge window is currently open, and AFAICT the sound/for-linus
>> branch again contains commits from the merge window.
>>
>> Let's just forget about the sound tree, as nobody has really missed it
>> since v5.13, and focus on the drm branches.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks for the acks everyone, both here and on IRC, pushed to
drm-rerere.

BR,
Jani.


>> ---
>>   nightly.conf | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/nightly.conf b/nightly.conf
>> index 73aec820e98f..c1e22800e276 100644
>> --- a/nightly.conf
>> +++ b/nightly.conf
>> @@ -46,11 +46,6 @@ git://anongit.freedesktop.org/drm/drm
>>   https://anongit.freedesktop.org/git/drm/drm
>>   https://anongit.freedesktop.org/git/drm/drm.git
>>   "
>> -drm_tip_repos[sound-upstream]="
>> -git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>> -https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>> -https://kernel.googlesource.com/pub/scm/linux/kernel/git/tiwai/sound.git
>> -"
>>   drm_tip_repos[linux-upstream]="
>>   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> @@ -79,8 +74,6 @@ drm_tip_config=(
>>   	"drm-intel		drm-intel-next"
>>   	"drm-intel		drm-intel-gt-next"
>>   
>> -	"sound-upstream		for-linus	v5.13"
>> -	"sound-upstream		for-next	v5.13"
>>   	"drm-intel		topic/core-for-CI"
>>   	"drm-misc		topic/i915-ttm"
>>   	"drm		topic/nouveau-misc"

-- 
Jani Nikula, Intel Open Source Graphics Center
