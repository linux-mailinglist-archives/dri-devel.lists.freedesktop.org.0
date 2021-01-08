Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEC72EF340
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 14:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56DC6E825;
	Fri,  8 Jan 2021 13:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E96F6E820;
 Fri,  8 Jan 2021 13:41:40 +0000 (UTC)
IronPort-SDR: ZNInJzC1AFMbcKBUDTKXXSDcEQt+9weKC4CSsUDv3Qv2oliWngrJdPnPgFMUUTH4rdscd4LnBE
 4LoCou12XUjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="196163220"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; d="scan'208";a="196163220"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 05:41:39 -0800
IronPort-SDR: icF0xmkIXtnESUyKM583hvOEzxqYZc6cyUDvwz/msO7nHTWApbsDM3I+kmoefqyow8dZ0aju4s
 xdnxth7REx0g==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; d="scan'208";a="566470819"
Received: from rgwhiteh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.205.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 05:41:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PULL] topic/dp-hdmi-2.1-pcon for drm-misc-next
In-Reply-To: <X/bcrK5P7Igijwn+@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87lfdpndkt.fsf@intel.com> <X/bcrK5P7Igijwn+@phenom.ffwll.local>
Date: Fri, 08 Jan 2021 15:41:32 +0200
Message-ID: <87turry29f.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Jan 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Dec 23, 2020 at 10:14:58AM +0200, Jani Nikula wrote:
>> 
>> Hi Maarten, Maxime, and Thomas -
>> 
>> Here's the DP-HDMI2.1 PCON support topic pull consisting of the series
>> [1]. The series is split roughly 50-50 between drm helpers and i915, so
>> a topic branch seemed to be the right way to go.
>> 
>> I'll also pull this to drm-intel-next once you've merged to
>> drm-misc-next.
>
> I didn't see this merged into drm-misc-next, so pulled into drm-next. I'm
> processing an entire batch of pulls, I'll ping you on irc when it's all
> ready for backmerging.

Thanks, Rodrigo covered the backmerge.

BR,
Jani.

>
> Cheers, Daniel
>
>> 
>> BR,
>> Jani.
>> 
>> 
>> [1] https://patchwork.freedesktop.org/series/82098/
>> 
>> 
>> topic/dp-hdmi-2.1-pcon-2020-12-23:
>> Add support for DP-HDMI2.1 PCON
>> 
>> From the series cover letter:
>> 
>> This patch series attempts to add support for a DP-HDMI2.1 Protocol
>> Convertor. The VESA spec for the HDMI2.1 PCON are proposed in Errata
>> E5 to DisplayPort_v2.0:
>> https://vesa.org/join-vesamemberships/member-downloads/?action=stamp&fileid=42299
>> The details are mentioned in:
>> VESA DP-to-HDMI PCON Specification Standalone Document
>> https://groups.vesa.org/wg/DP/document/15651
>> 
>> This series starts with adding support for FRL (Fixed Rate Link)
>> Training between the PCON and HDMI2.1 sink.
>> As per HDMI2.1 specification, a new data-channel or lane is added in
>> FRL mode, by repurposing the TMDS clock Channel. Through FRL, higher
>> bit-rate can be supported, ie. up to 12 Gbps/lane (48 Gbps over 4
>> lanes).
>> 
>> With these patches, the HDMI2.1 PCON can be configured to achieve FRL
>> training based on the maximum FRL rate supported by the panel, source
>> and the PCON.
>> The approach is to add the support for FRL training between PCON and
>> HDMI2.1 sink and gradually add other blocks for supporting higher
>> resolutions and other HDMI2.1 features, that can be supported by pcon
>> for the sources that do not natively support HDMI2.1.
>> 
>> This is done before the DP Link training between the source and PCON
>> is started. In case of FRL training is not achieved, the PCON will
>> work in the regular TMDS mode, without HDMI2.1 feature support.
>> Any interruption in FRL training between the PCON and HDMI2.1 sink is
>> notified through IRQ_HPD. On receiving the IRQ_HPD the concerned DPCD
>> registers are read and FRL training is re-attempted.
>> 
>> Currently, we have tested the FRL training and are able to enable 4K
>> display with TGL Platform + Realtek PCON RTD2173 with HDMI2.1 supporting
>> panel.
>> 
>> The following changes since commit b3bf99daaee96a141536ce5c60a0d6dba6ec1d23:
>> 
>>   drm/i915/display: Defer initial modeset until after GGTT is initialised (2020-11-26 11:01:52 +0000)
>> 
>> are available in the Git repository at:
>> 
>>   git://anongit.freedesktop.org/drm/drm-intel tags/topic/dp-hdmi-2.1-pcon-2020-12-23
>> 
>> for you to fetch changes up to 522508b665df3bbfdf40381d4e61777844b1703f:
>> 
>>   drm/i915/display: Let PCON convert from RGB to YCbCr if it can (2020-12-22 17:59:07 +0200)
>> 
>> ----------------------------------------------------------------
>> Add support for DP-HDMI2.1 PCON
>> 
>> From the series cover letter:
>> 
>> This patch series attempts to add support for a DP-HDMI2.1 Protocol
>> Convertor. The VESA spec for the HDMI2.1 PCON are proposed in Errata
>> E5 to DisplayPort_v2.0:
>> https://vesa.org/join-vesamemberships/member-downloads/?action=stamp&fileid=42299
>> The details are mentioned in:
>> VESA DP-to-HDMI PCON Specification Standalone Document
>> https://groups.vesa.org/wg/DP/document/15651
>> 
>> This series starts with adding support for FRL (Fixed Rate Link)
>> Training between the PCON and HDMI2.1 sink.
>> As per HDMI2.1 specification, a new data-channel or lane is added in
>> FRL mode, by repurposing the TMDS clock Channel. Through FRL, higher
>> bit-rate can be supported, ie. up to 12 Gbps/lane (48 Gbps over 4
>> lanes).
>> 
>> With these patches, the HDMI2.1 PCON can be configured to achieve FRL
>> training based on the maximum FRL rate supported by the panel, source
>> and the PCON.
>> The approach is to add the support for FRL training between PCON and
>> HDMI2.1 sink and gradually add other blocks for supporting higher
>> resolutions and other HDMI2.1 features, that can be supported by pcon
>> for the sources that do not natively support HDMI2.1.
>> 
>> This is done before the DP Link training between the source and PCON
>> is started. In case of FRL training is not achieved, the PCON will
>> work in the regular TMDS mode, without HDMI2.1 feature support.
>> Any interruption in FRL training between the PCON and HDMI2.1 sink is
>> notified through IRQ_HPD. On receiving the IRQ_HPD the concerned DPCD
>> registers are read and FRL training is re-attempted.
>> 
>> Currently, we have tested the FRL training and are able to enable 4K
>> display with TGL Platform + Realtek PCON RTD2173 with HDMI2.1 supporting
>> panel.
>> 
>> ----------------------------------------------------------------
>> Ankit Nautiyal (11):
>>       drm/edid: Parse DSC1.2 cap fields from HFVSDB block
>>       drm/dp_helper: Add Helpers for FRL Link Training support for DP-HDMI2.1 PCON
>>       drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon
>>       drm/dp_helper: Add helpers to configure PCONs RGB-YCbCr Conversion
>>       drm/i915: Capture max frl rate for PCON in dfp cap structure
>>       drm/i915: Add support for starting FRL training for HDMI2.1 via PCON
>>       drm/i915: Check for FRL training before DP Link training
>>       drm/i915: Read DSC capabilities of the HDMI2.1 PCON encoder
>>       drm/i915: Add helper functions for calculating DSC parameters for HDMI2.1
>>       drm/i915/display: Configure PCON for DSC1.1 to DSC1.2 encoding
>>       drm/i915/display: Let PCON convert from RGB to YCbCr if it can
>> 
>> Swati Sharma (4):
>>       drm/edid: Add additional HFVSDB fields for HDMI2.1
>>       drm/edid: Parse MAX_FRL field from HFVSDB block
>>       drm/dp_helper: Add support for link failure detection
>>       drm/i915: Add support for enabling link status and recovery
>> 
>>  drivers/gpu/drm/drm_dp_helper.c                    | 566 +++++++++++++++++++++
>>  drivers/gpu/drm/drm_edid.c                         | 103 ++++
>>  drivers/gpu/drm/i915/display/intel_ddi.c           |   6 +-
>>  drivers/gpu/drm/i915/display/intel_display_types.h |  10 +
>>  drivers/gpu/drm/i915/display/intel_dp.c            | 440 +++++++++++++++-
>>  drivers/gpu/drm/i915/display/intel_dp.h            |   7 +-
>>  drivers/gpu/drm/i915/display/intel_hdmi.c          | 233 +++++++++
>>  drivers/gpu/drm/i915/display/intel_hdmi.h          |   7 +
>>  include/drm/drm_connector.h                        |  49 ++
>>  include/drm/drm_dp_helper.h                        | 218 ++++++++
>>  include/drm/drm_edid.h                             |  30 ++
>>  11 files changed, 1650 insertions(+), 19 deletions(-)
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
