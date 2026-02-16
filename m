Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOPpF801k2mV2gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 16:20:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B51456C7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 16:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1B710E057;
	Mon, 16 Feb 2026 15:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 783E010E057
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:20:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E5F1570;
 Mon, 16 Feb 2026 07:20:35 -0800 (PST)
Received: from [10.57.56.155] (unknown [10.57.56.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EDB93F632;
 Mon, 16 Feb 2026 07:20:39 -0800 (PST)
Message-ID: <acacf0a5-faff-4036-ac7d-011581668fa8@arm.com>
Date: Mon, 16 Feb 2026 15:20:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260215100302.136719-2-work@onurozkan.dev> <20260216103743.626c71e3@fedora>
 <20260216174107.1b9c03a4@nimda>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260216174107.1b9c03a4@nimda>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: C73B51456C7
X-Rspamd-Action: no action

On 16/02/2026 14:41, Onur Özkan wrote:
> On Mon, 16 Feb 2026 10:37:43 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Sun, 15 Feb 2026 13:02:51 +0300
>> Onur Özkan <work@onurozkan.dev> wrote:
>>
>>> If sram-supply is missing, Panthor falls back to a
>>> dummy regulator with a warning. This implicit behavior
>>> hides missing DT wiring behind regulator core fallback.
>>>
>>> Make SRAM handling explicit: require sram-supply for all
>>> Panthor compatibles except mt8196-mali where GPU supplies
>>> are intentionally managed outside Panthor and DT does not
>>> model sram-supply for that compatible.
>>>
>>> This keeps DT power modeling explicit and avoids relying on
>>> dummy-regulator fallback.
>>>
>>> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
>>> Signed-off-by: Onur Özkan <work@onurozkan.dev>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> b/drivers/gpu/drm/panthor/panthor_devfreq.c index
>>> 2249b41ca4af..5f6075f18fe3 100644 ---
>>> a/drivers/gpu/drm/panthor/panthor_devfreq.c +++
>>> b/drivers/gpu/drm/panthor/panthor_devfreq.c @@ -206,12 +206,17 @@
>>> int panthor_devfreq_init(struct panthor_device *ptdev)
>>>  	 * But without knowing if it's beneficial or not (in term
>>> of power
>>>  	 * consumption), or how much it slows down the
>>> suspend/resume steps,
>>>  	 * let's just keep regulators enabled for the device
>>> lifetime.
>>> +	 *
>>> +	 * Treat sram-supply as mandatory except for mt8196-mali.
>>> It manages
>>> +	 * SRAM outside Panthor so this driver must not require
>>> direct control
>>> +	 * over it.
>>>  	 */
>>> -	ret = devm_regulator_get_enable_optional(dev, "sram");
>>> -	if (ret && ret != -ENODEV) {
>>> -		if (ret != -EPROBE_DEFER)
>>> +	if (!of_device_is_compatible(dev->of_node,
>>> "mediatek,mt8196-mali")) {
>>
>> Rather than checking for specific compats here, let's go for
>> a dont_need_sram_supply bool in panthor_soc_data.
>>
> 
> Makes sense.
> 
>>> +		ret = devm_regulator_get_enable_optional(dev,
>>> "sram");
>>
>> If we assume SRAM supply is mandatory, should this be
>> devm_regulator_get_enable() instead?
>>
> 
> That was the first thing I did but when I tested it, it didn't work as
> expected because devm_regulator_get_enable() fell back to the dummy
> regulator without returning an error.

My understanding was that devm_regulator_get_enable() would output a
warning in that case.

I'm not sure it really makes sense to deliberately fail the probe just
because the regulator isn't there: we know in practice it often works
and it can be useful for bring-up purposes. The issue was that we don't
want DTs submitted without the "sram" regulator and the dt-check hasn't
been sufficient in the past to catch such errors.

So a dmesg warning seems (to me) like the right sort of balance -
there's obviously something to fix, but it doesn't block bring-up
(unless of course the hardware actually requires it of course).

I also note that you've lost the -EPROBE_DEFER check, meaning that the
log message you've added will spam the logs if a defer happens.

My reading for these threads is that we need:

 * A new field in panthor_soc_data for the mt8196 case.

 * To check for new field, and if it's not set then use
devm_regulator_get_enable() so that it generates a warning message if
the regulator isn't present. Otherwise we skip the call.

So no need for panthor itself to log any messages, and we just return
any errors from devm_regulator_get_enable(). A missing regulator will
generate a warning but no error.

What am I missing?

Thanks,
Steve

> Regards,
> Onur
>  
>>> +		if (ret) {
>>>  			DRM_DEV_ERROR(dev, "Couldn't
>>> retrieve/enable sram supply\n");
>>> -		return ret;
>>> +			return ret;
>>> +		}
>>>  	}
>>>  
>>>  	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
>>
> 

