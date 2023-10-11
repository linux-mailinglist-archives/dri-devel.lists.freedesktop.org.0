Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75B7C54C3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 15:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F5E10E7EB;
	Wed, 11 Oct 2023 13:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8306C10E802;
 Wed, 11 Oct 2023 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697029510; x=1728565510;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bsszA6xE3LIClaTQcB826KjOONiJLIxrIgfytHrRW84=;
 b=Bax8NJTvPhtWuZZtD8N/7m20KkEAnccWt+iaVeI+JBv87casUqxaavnx
 iQ9q/S9wuYlNABOfocsZYxgkP8KbO8SVeTXtVwf9g+uuf1CKfTeiSZbvU
 IRPEHFVQbApfv9LYmmyEIs1MkzoRM1a53IuRhlerzLZfiC0VuZuaEJcQM
 zIkki1T8kXzjF+Bg7ZNg/+t/KRR8hcwMACFWB2M4N5idTD7mUHeq+si11
 bOB6mcwPC6ZKpUD5mcz3l6RWntIbg5e57kSqEUwGkrmArmU/IendsoAqz
 j+HmW3PeTV2/dgv92Sre64DHDtEIQ/QFYHiWq3jkBQuNwdpbcfpbtEfVt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="470918522"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="470918522"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927562644"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="927562644"
Received: from bjvanakk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.111])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:05:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ville =?utf-8?B?U3lyasOk?=
 =?utf-8?B?bMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 0/4] drm/i915/vlv_dsi: Add quirks for x86 android
 tablets (v3)
In-Reply-To: <b308ab49-ceec-e1eb-cbf4-b272cea91e2e@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230920195613.304091-1-hdegoede@redhat.com>
 <b308ab49-ceec-e1eb-cbf4-b272cea91e2e@redhat.com>
Date: Wed, 11 Oct 2023 16:05:02 +0300
Message-ID: <875y3d48e9.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 08 Oct 2023, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi All,
>
> Ping what is the status of this now? This v3 addresses all review
> remarks from previous versions (specifically the request to file
> + link gitlab issues).
>
> So AFAICT this is ready for merging ?
>
> But I'm waiting for an ack for this before pushing it
> do drm-intel-next myself ...

There are maybe one or two things I could nitpick about, such as casting
away the const in there, but then I just don't have the time to look
into this much deeper, it's all fairly isolated, and, let's be honest,
you of all people probably have the best idea how well the vlv dsi code
works out in the real world.

Thanks for fixing all this stuff, and please just merge.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Regards,
>
> Hans
>
>
>
>
> On 9/20/23 21:56, Hans de Goede wrote:
>> Hi All,
>> 
>> Some vlv/chv tablets ship with Android as factory OS. The factory OS
>> BSP style kernel on these tablets does not use the normal x86 hw
>> autodetection instead it hardcodes a whole bunch of things including
>> using panel drivers instead of relying on VBT MIPI sequences to
>> turn the panel/backlight on/off.
>> 
>> The normal i915 driver (which does not use panel drivers) mostly works
>> since the VBT still needs to contain valid info for the GOP, but because
>> of the Android kernel relying on panel drivers with various things
>> hardcoded some DMI quirks are necessary to fix some issues on these
>> devices.
>> 
>> Some of these issues also are related to which I2C bus to use for
>> MIPI sequence elements which do I2C transfers. This series also
>> includes a patch adding some extra debugging to mipi_exec_i2c() to
>> help with debugging similar issues in the future.
>> 
>> These patches have been posted before but back then I did not get around
>> to follow up on the series:
>> https://lore.kernel.org/intel-gfx/20220225214934.383168-1-hdegoede@redhat.com/
>> 
>> v2:
>> - Drop the changes how the I2C bus number is found, instead just have
>>   the quirks set the right number directly where necessary. This should
>>   avoid any chances of causing regressions on devices where the quirks
>>   do not apply.
>> - New quirk for backlight control issues on Lenovo Yoga Tab 3
>> - Address Jani Nikula's remark about __func__ being redundant when using
>>   drm_dbg_kms()
>> 
>> v3:
>> - File 3 gitlab issues with drm.debug=0xe dmesg output, VBT dump for all
>>   3 affected models. Add Closes: tags with links to gitlab issues
>> 
>> Regards,
>> 
>> Hans
>> 
>> 
>> Hans de Goede (4):
>>   drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in BIOS on
>>     Asus TF103C (v3)
>>   drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and panel size on
>>     Lenovo Yoga Tablet 2 series (v3)
>>   drm/i915/vlv_dsi: Add DMI quirk for backlight control issues on Lenovo
>>     Yoga Tab 3 (v2)
>>   drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2)
>> 
>>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c |   3 +
>>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 124 +++++++++++++++++++
>>  2 files changed, 127 insertions(+)
>> 
>

-- 
Jani Nikula, Intel
