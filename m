Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102501A1C84
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB7B6E978;
	Wed,  8 Apr 2020 07:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B956E978
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 07:22:44 +0000 (UTC)
IronPort-SDR: BttlsUKhLu+mWu26m6eBBo+UKycyAvPzop+27oz0Pav2idECawVEnYMpSxcLFZMoWTrgbQxVH9
 Di3s7jJARYsA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 00:22:43 -0700
IronPort-SDR: tOuocFG0D/Wi2hHfRqzdl1/BIu5OGbDkB/6Qc4hqb2H0Zzk86rOtoEiwfsNVIN57DqkhkNvVEb
 WjPeWJNWfWqA==
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; d="scan'208";a="425043160"
Received: from slinke-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.237])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 00:22:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Deucher\,
 Alexander" <alexander.deucher@amd.com>
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for HP Spectre x360
 Convertible 13t-aw100
In-Reply-To: <1F57CA05-3E23-4CA8-A138-6785906ED465@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200323053528.3147-1-kai.heng.feng@canonical.com>
 <41FD4AD2-81F9-45E8-B5D6-9CC255D0581B@canonical.com>
 <1F57CA05-3E23-4CA8-A138-6785906ED465@canonical.com>
Date: Wed, 08 Apr 2020 10:22:37 +0300
Message-ID: <87mu7migqq.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Apr 2020, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> On Mar 27, 2020, at 19:03, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> 
>> Hi,
>> 
>>> On Mar 23, 2020, at 13:35, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>> 
>>> There's another OLED panel needs to use DPCD aux interface to control
>>> backlight.
>>> 
>>> BugLink: https://bugs.launchpad.net/bugs/1860303
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> 
>> Would it be possible to review this?
>> I'd like to send a similar quirk for a new panel, and I want to avoid causing any merge conflict.
>
> Another gentle ping...

Can't really review, but if you say that's needed...

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
>> 
>> Kai-Heng
>> 
>>> ---
>>> drivers/gpu/drm/drm_dp_helper.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>> 
>>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>>> index 8ba4531e808d..a0d4314663de 100644
>>> --- a/drivers/gpu/drm/drm_dp_helper.c
>>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>>> @@ -1301,6 +1301,8 @@ static const struct edid_quirk edid_quirk_list[] = {
>>> 	 * only supports DPCD backlight controls
>>> 	 */
>>> 	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>>> +	/* HP Spectre x360 Convertible 13t-aw100 */
>>> +	{ MFG(0x4c, 0x83), PROD_ID(0x42, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>>> 	/*
>>> 	 * Some Dell CML 2020 systems have panels support both AUX and PWM
>>> 	 * backlight control, and some only support AUX backlight control. All
>>> -- 
>>> 2.17.1
>>> 
>> 
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
