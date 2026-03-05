Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPSQK7frqWk6IAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:46:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C16218443
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CF910EC7C;
	Thu,  5 Mar 2026 20:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="b/gaIY5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA85B10EC7A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 20:46:43 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fRhR439vnz9tjn;
 Thu,  5 Mar 2026 21:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772743600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4V8xdt2Ms77ULW7U3IfZn5LVqyv124RlRFnZQs9oYw=;
 b=b/gaIY5Jwz9/hqRqUJTb8qsl1ucfYvAo4gnaQp5qVFix2ZdOQQ2rI4ymLpEsZZRXO4sicK
 WDRkBgXIB0y1iggJvLTj6JOTs6f/6TU9o+OvFxBbTVafNqbVe4ClMssGxZV1dain6k9jMN
 9skHsEvsvny64kiIpT+Ycv61D6/9lV2B2I2ar370eWt5Fq83tvuVXZJqN3q+AXkP6ahtP9
 eBkM6G3vbqzFMGTI3czgUl6UAa+MObHskdNOiws7pNK8lJwdgAYJZty4c6r0iK8H7VgjBf
 fVJDg6JyLqDfpdC6zBxuKyVr3/JK1FFi+JkQHICUV9NVe1ESw4JFHGHapvku1A==
Message-ID: <f596792c-fa83-4711-8782-b6e2031da4d5@mailbox.org>
Date: Thu, 5 Mar 2026 21:46:36 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
 <b10bf126-d664-42e4-a333-10657eca6d94@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b10bf126-d664-42e4-a333-10657eca6d94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5dec64b217e6840a12a
X-MBO-RS-META: a4xqjz1o9gn35mckyw4atxf4oepf8tqp
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
X-Rspamd-Queue-Id: 15C16218443
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:geert+renesas@glider.be,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:robh@kernel.org,m:sam@ravnborg.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,linux.intel.com,ravnborg.org,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 2/16/26 5:01 PM, Neil Armstrong wrote:
> On 1/17/26 01:49, Marek Vasut wrote:
>> Add WaveShare 13.3inch 1920x1080 DSI Capacitive Touch Display support.
>>
>> While the panel is described as DPI panel, it is part of a larger unit
>> in non-removable metal casing, so the actual internal configuration is
>> not known. The panel is attached to "waveshare,dsi2dpi" bridge via DT.
>> It is likely that internally, this panel is an LVDS panel, connected to
>> ICN6211 DSI-to-DPI bridge and then another unknown DPI-to-LVDS bridge.
>>
>> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Jessica Zhang <jesszhan0024@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V3: New patch. Note that the compatible string is already part of
>>      Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/ 
>> panel/panel-simple.c
>> index 91ab280869bac..40a73c32b0b17 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 
>> = {
>>       .bus_flags = DRM_BUS_FLAG_DE_HIGH | 
>> DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>>   };
>> +static const struct drm_display_mode waveshare_133inch_mode = {
>> +    .clock = 148500,
>> +    .hdisplay = 1920,
>> +    .hsync_start = 1920 + 88,
>> +    .hsync_end = 1920 + 88 + 44,
>> +    .htotal = 1920 + 88 + 44 + 148,
>> +    .vdisplay = 1080,
>> +    .vsync_start = 1080 + 4,
>> +    .vsync_end = 1080 + 4 + 5,
>> +    .vtotal = 1080 + 4 + 5 + 36,
>> +    .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
>> +};
>> +
>> +static const struct panel_desc waveshare_133inch = {
>> +    .modes = &waveshare_133inch_mode,
>> +    .num_modes = 1,
>> +    .bpc = 8,
>> +    .size = {
>> +        .width = 293,
>> +        .height = 163,
>> +    },
>> +    .bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>> +    .connector_type = DRM_MODE_CONNECTOR_DPI,
>> +    .bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
>> +             DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
>> +};
>> +
>>   static const struct drm_display_mode winstar_wf35ltiacd_mode = {
>>       .clock = 6410,
>>       .hdisplay = 320,
>> @@ -5598,6 +5625,9 @@ static const struct of_device_id 
>> platform_of_match[] = {
>>       }, {
>>           .compatible = "vxt,vl050-8048nt-c01",
>>           .data = &vl050_8048nt_c01,
>> +    }, {
>> +        .compatible = "waveshare,13.3inch-panel",
>> +        .data = &waveshare_133inch,
>>       }, {
>>           .compatible = "winstar,wf35ltiacd",
>>           .data = &winstar_wf35ltiacd,
> 
> LGTM
> 
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Would it be OK to apply this now ? Thank you
