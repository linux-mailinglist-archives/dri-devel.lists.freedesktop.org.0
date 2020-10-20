Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0305293905
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 12:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40086EC3F;
	Tue, 20 Oct 2020 10:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028396E11E;
 Tue, 20 Oct 2020 10:17:48 +0000 (UTC)
IronPort-SDR: Fghh3zMyy+YjHtpoW/XaUh46kQKArsey7ByPJ7U/J5fut0DmFkTkLVcs4KjMirGbUF9O4VAVzd
 jmx84sZpNQNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="166408970"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="166408970"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 03:17:48 -0700
IronPort-SDR: RMHtQ0QnmGsBSxExsZ8yZPfqDI8cZvwZAodaenD07ammnLOvY3Wi/cdkBCMLuTTr0rKNclsyTT
 AHPCU9YPuHxQ==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="533003939"
Received: from bneville-mobl5.ger.corp.intel.com (HELO localhost)
 ([10.252.6.14])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 03:17:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [RFC] drm/hdcp: Max MST content streams
In-Reply-To: <5fb7a376-d520-97e0-54cd-6174019ce1d1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201019071259.24566-1-anshuman.gupta@intel.com>
 <8736299qtu.fsf@intel.com>
 <5fb7a376-d520-97e0-54cd-6174019ce1d1@linux.intel.com>
Date: Tue, 20 Oct 2020 13:17:42 +0300
Message-ID: <87zh4h8am1.fsf@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Oct 2020, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Op 20-10-2020 om 11:42 schreef Jani Nikula:
>> On Mon, 19 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>>> Let's define Maximum MST content streams up to four
>>> generically which can be supported by modern display
>>> controllers.
>>>
>>> Cc: Sean Paul <seanpaul@chromium.org>
>>> Cc: Ramalingam C <ramalingam.c@intel.com>
>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> Hey drm-misc maintainers,
>>
>> I'd like to get an ack to merge this via drm-intel as part of [1].
>>
>> Thanks,
>> Jani.
>>
>>
>>
>> [1] http://lore.kernel.org/r/20201014045252.13608-1-anshuman.gupta@intel.com
>>
>>
>>
>>> ---
>>>  include/drm/drm_hdcp.h | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
>>> index fe58dbb46962..ac22c246542a 100644
>>> --- a/include/drm/drm_hdcp.h
>>> +++ b/include/drm/drm_hdcp.h
>>> @@ -101,11 +101,11 @@
>>>  
>>>  /* Following Macros take a byte at a time for bit(s) masking */
>>>  /*
>>> - * TODO: This has to be changed for DP MST, as multiple stream on
>>> - * same port is possible.
>>> - * For HDCP2.2 on HDMI and DP SST this value is always 1.
>>> + * TODO: HDCP_2_2_MAX_CONTENT_STREAMS_CNT is based upon actual
>>> + * H/W MST streams capacity.
>>> + * This required to be moved out to platform specific header.
>>>   */
>>> -#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	1
>>> +#define HDCP_2_2_MAX_CONTENT_STREAMS_CNT	4
>>>  #define HDCP_2_2_TXCAP_MASK_LEN			2
>>>  #define HDCP_2_2_RXCAPS_LEN			3
>>>  #define HDCP_2_2_RX_REPEATER(x)			((x) & BIT(0))
>
> Well since it's such a small change..
>
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
