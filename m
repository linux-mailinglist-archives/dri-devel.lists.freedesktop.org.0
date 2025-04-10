Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25666A840DC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 12:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECE610E90B;
	Thu, 10 Apr 2025 10:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MKEZfzAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2572210E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744281457;
 bh=R1nSPk4dQu6wdw6C+cd5gl0zpsdwaxNvu3JXlvComO8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MKEZfzAUijavMN6vD0hrsD+NwZ/WcVKA7NTe/hMMV/bBi7DdUbBAMcJFDY3LUb3TA
 gCHIoLA2XaxyUGNyQokDktMzuNNWRXIxUd8nEwP7zlVgHtjtg+OlNiCrOZv5vp4AlD
 w9Q8X4fEqsJwBwpCNQygCXCIYB/s8Sb0qbqKZNIT5DBnBZSGkZ+0i6X8RkyCsPTs5c
 T8tzuqBWkR4x5m41+/WTCx/5OicAT8jrN2cvLZnbbAlCJ9gkFNpupa+F2SIW95vV3F
 GCznVQq6AjBNIoSCZL1Gsa+kJwqqj8IoFWC3FxbV13QyuTP6iniD4Wd7hnM4odYpRC
 Kdwycbel+U13A==
Received: from [192.168.1.90] (unknown [82.79.138.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ACF9817E1034;
 Thu, 10 Apr 2025 12:37:36 +0200 (CEST)
Message-ID: <d11e241f-cb68-4343-87c7-794a97136487@collabora.com>
Date: Thu, 10 Apr 2025 13:37:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-11-294d3ebbb4b2@collabora.com>
 <20250409-refreshing-overjoyed-frigatebird-d3ee47@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250409-refreshing-overjoyed-frigatebird-d3ee47@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/9/25 6:24 PM, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:20:00PM +0200, Cristian Ciocaltea wrote:
>> After updating the code to make use of the new EDID setup helpers,
>> drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
>> it.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index 7b2aaee5009ce58e6edf2649e2182c43ba834523..1e32694041277a541f0f8941d9c35e8ca9264599 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -207,9 +207,6 @@ connector_hdmi_init_with_edid_funcs(struct kunit *test,
>>  	return priv;
>>  }
>>  
>> -#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bpc, funcs)		\
>> -	connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, NULL, 0)
>> -
> 
> Oh, so there's still one we don't need.
> 
> I really don't like that back and forth. I think we can avoid it by doing something like:
> 
> - Create a common __connector_hdmi_init function out of drm_kunit_helper_connector_hdmi_init.
> 
> - Add an EDID parameter to that common function. The API of drm_kunit_helper_connector_hdmi_init and
>   drm_kunit_helper_connector_hdmi_init_funcs doesn't need to change at that point.
> 
> - Create a _with_edid_funcs macro. Note that only that one needs to be a macro.
> 
> - Convert the users to _with_edid_funcs, and drop drm_kunit_helper_connector_hdmi_init_funcs.

Ack, one question though:

The common function and the macro should be part of the same patch, or
you'd like to have it split?
