Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC719320E5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 09:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F0010E367;
	Tue, 16 Jul 2024 07:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="A2vCWne3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ADE10E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 15:15:17 +0000 (UTC)
Message-ID: <a2dd894e-7311-40e6-b3fb-050073109fc8@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1721056516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWR3vzWpOfUMxQ0FtEPsE7YlYq0MdBZJ3U0xlrOYZ5E=;
 b=A2vCWne3Tray7xOi/gOJBlEMnVyzk0f0mub7o7SgoqbKDwPP8QzD7mHcQwMDgQ6mteXzSW
 MbPH/wC6LiPbCwPjSGDGPL5QA1J+e0FUn9tyG+rqX9aUC4Y4d49OfJIHX8HqjtWgb37f0I
 YgDE8INT7AHtc+5Kn8lXYICwH10UjRBtFcjBmjwh4JIGtEg0nv8SZ0jU2MTuB2vVEkcQ8n
 9OloaXj6lj1n+gVv5jUoYVAAEap2ntY3Kd59r7UICAaNgXnrj/8Q+fLRozkXMsBYB7OZu2
 FDpz3UgUGMMq7UkUD3gmFvoRIin5kgWNN8vnOkKE8I/FfvHmNFzm8MuUC7j12g==
Date: Mon, 15 Jul 2024 22:15:07 +0700
MIME-Version: 1.0
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for OrangePi Neo
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240715045818.1019979-1-philm@manjaro.org>
 <afc7f155-9442-4603-b276-78f3df1f2b8f@redhat.com>
Content-Language: en-US
Cc: 'Roman Gilg' <romangg@manjaro.org>, Furkan Kardame <f.kardame@manjaro.org>
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <afc7f155-9442-4603-b276-78f3df1f2b8f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=philm@manjaro.org smtp.mailfrom=philm@manjaro.org
X-Mailman-Approved-At: Tue, 16 Jul 2024 07:06:01 +0000
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

Hi Hans,

thx for the fast pick-up of my patch. With the first sent of my patch 
the comment landed in the subject. Seems git needed an extra empty line 
to send out the patch properly.

On 15/7/24 20:46, Hans de Goede wrote:
> Hi,
> 
> On 7/15/24 6:57 AM, Philip Mueller wrote:
>> This adds a DMI orientation quirk for the OrangePi Neo Linux Gaming Handheld.
>>
>> Signed-off-by: Philip Mueller <philm@manjaro.org>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> I have pushed this to drm-misc-fixes now.
> 
> Regards,
> 
> Hans
> 
> 
> 
>> ---
>>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> index 3860a8ce1e2d..903f4bfea7e8 100644
>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> @@ -414,6 +414,12 @@ static const struct dmi_system_id orientation_data[] = {
>>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
>>   		},
>>   		.driver_data = (void *)&lcd1600x2560_leftside_up,
>> +	}, {	/* OrangePi Neo */
>> +		.matches = {
>> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
>> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NEO-01"),
>> +		},
>> +		.driver_data = (void *)&lcd1200x1920_rightside_up,
>>   	}, {	/* Samsung GalaxyBook 10.6 */
>>   		.matches = {
>>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> 

-- 
Best, Philip

