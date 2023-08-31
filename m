Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B578F4A0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 23:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0889B10E6F8;
	Thu, 31 Aug 2023 21:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A746A10E1BA;
 Thu, 31 Aug 2023 21:32:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11725B823E7;
 Thu, 31 Aug 2023 21:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7809CC433C8;
 Thu, 31 Aug 2023 21:32:22 +0000 (UTC)
Message-ID: <f24abf55-7261-f0b5-b95f-bf94ab80ea30@xs4all.nl>
Date: Thu, 31 Aug 2023 23:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/6] drm, cec and edid updates
Content-Language: en-US, nl
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <cover.1692884619.git.jani.nikula@intel.com>
 <8734zzjb9v.fsf@intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8734zzjb9v.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2023 20:51, Jani Nikula wrote:
> On Thu, 24 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> Avoid accessing the raw edid directly. Pre-parse the source physical
>> address during normal EDID parsing and use that for CEC.
>>
>> Jani Nikula (6):
>>   drm/edid: add drm_edid_is_digital()
>>   drm/i915/display: use drm_edid_is_digital()
>>   drm/edid: parse source physical address
>>   drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
>>   drm/i915/cec: switch to setting physical address directly
> 
> Maarten, Maxime, Thomas, ack for merging patches 1, 3 and 4 via via
> drm-intel?
> 
>>   media: cec: core: add note about *_from_edid() function usage in drm
> 
> Hans, while there's no build dependency here, I think it would make
> sense to merge this together with patches 3 and 4. Ack for merging via
> drm-intel?

That's fine, it makes sense to do that.

If you need it, for this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Thanks,
> Jani.
> 
> 
>>
>>  drivers/gpu/drm/display/drm_dp_cec.c      | 22 +++++++++++++++++++---
>>  drivers/gpu/drm/drm_edid.c                | 22 ++++++++++++++++++++--
>>  drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
>>  drivers/gpu/drm/i915/display/intel_dp.c   |  7 ++-----
>>  drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +++-----
>>  drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
>>  drivers/media/cec/core/cec-adap.c         |  4 ++++
>>  drivers/media/cec/core/cec-notifier.c     |  4 ++++
>>  include/drm/display/drm_dp_helper.h       |  6 ++++++
>>  include/drm/drm_connector.h               |  8 ++++++++
>>  include/drm/drm_edid.h                    |  1 +
>>  11 files changed, 73 insertions(+), 27 deletions(-)
> 

