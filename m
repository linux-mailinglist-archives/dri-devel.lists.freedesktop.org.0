Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557E784120
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BB310E34A;
	Tue, 22 Aug 2023 12:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4963F10E349
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692708388; x=1724244388;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iYM8ImHDIbaXDBhYH+HxZixyznRzcm/s35rZeKO5aAQ=;
 b=Kse3wKzpNccRnKHP9aFkdtMBas2+DP2+6hDlGB1YPECjqJReMSAI0/Af
 n7aDVU0t+73awx11HpDSnkdBpm/LoyN/DKfo5TTFoPpvfMlr94ShTs4y/
 2LZwdc8nNiS0+/Ato/KS8XKHnexh9cfRYg4ciTI3hqGsM341uUC+ROS0/
 2iSK03PMaGDkg2iJjbgxg06rAlz+7wFq/1dwlo3CSp8nCo6XHgN7RLUkK
 e7BWm2lIxtF7FuPmZ93mk/FVT/MIVLpIKF5Wn6ZlYKiKPvSSOgbJTL9gw
 mEVhmUgH3mTZSZGHFELQ9lxYc2nDxCX4LgfOVkJms17vWuMrhnJbdTzaQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404869699"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="404869699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="879942752"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:46:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sharq Mohammad <sharq0406@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: TODO list task: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <CANgPUHw7yHBXumXYMAG0Z4Xn6Pb1BNvU7saw=_gQ6m7Xdc-Pbg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CANgPUHw7yHBXumXYMAG0Z4Xn6Pb1BNvU7saw=_gQ6m7Xdc-Pbg@mail.gmail.com>
Date: Tue, 22 Aug 2023 15:46:23 +0300
Message-ID: <874jkr6y8w.fsf@intel.com>
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
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Aug 2023, Sharq Mohammad <sharq0406@gmail.com> wrote:
> Hello All,
>
> I am a usual kernel developer, and wanted to contribute to the open source.
> I saw a small TODO list in the DRM graphics subsystem, with some tasks.
> So, just wanted to ask, is anyone working on the task:
> *Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi*
>
> Its on the TODO list.

Yeah, I've got branch

https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-is-hdmi-has-audio

BR,
Jani.


>
> Thanks and regards,
> Sharique

-- 
Jani Nikula, Intel Open Source Graphics Center
