Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AIBCC8Dk2nF0wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:44:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5FB143152
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F50E10E048;
	Mon, 16 Feb 2026 11:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eRPA2HOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DD510E329
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771242280;
 bh=cu8/rfZAwHGNFPOMT8MxH3IqWdIyzUah7YlWDu37IxE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eRPA2HOQM+6DtScBDl9XtcTG04wHi9jhz3LMG2HRkeZ6xyfa6oQwzk3Sp+5l0XHsP
 PEFPa4FtysBK/1B3+HOrlSyMHj8wnRMmv/KSQUkrNsdwPPorSDqhkBdnBbCroHRnC4
 WCcH+xRao8KFze3dMwjFAW75Thejbiji11VjoZManBBUNV4ZJJyC6R93gFZ92D4mya
 f+abblQopcHSVdgSb4IQzIQoTQiCdo/sepqZ51X7NPpcdcSy5lVA7HrOQxZ4Kf06hm
 MArUOlfzyLod+l8UJ8/QlKGFM6TY/J47ZIkChwAC9S/OAqnxPASYGqvhsoQMwpLy2H
 dfiBFXS/H0RTg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 53BF817E0E67;
 Mon, 16 Feb 2026 12:44:40 +0100 (CET)
Message-ID: <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
Date: Mon, 16 Feb 2026 12:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260215100302.136719-2-work@onurozkan.dev>
 <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
 <20260216104423.6b5bcc96@fedora>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260216104423.6b5bcc96@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:aford173@gmail.com,m:nicolas.frattaroli@collabora.com,m:work@onurozkan.dev,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[onurozkan.dev,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7B5FB143152
X-Rspamd-Action: no action

Il 16/02/26 10:44, Boris Brezillon ha scritto:
> Hello Adam,
> 
> On Sun, 15 Feb 2026 16:21:34 -0600
> Adam Ford <aford173@gmail.com> wrote:
> 
>> On Sun, Feb 15, 2026 at 4:04 AM Onur Özkan <work@onurozkan.dev> wrote:
>>>
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
>>>   drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> index 2249b41ca4af..5f6075f18fe3 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>>>           * But without knowing if it's beneficial or not (in term of power
>>>           * consumption), or how much it slows down the suspend/resume steps,
>>>           * let's just keep regulators enabled for the device lifetime.
>>> +        *
>>> +        * Treat sram-supply as mandatory except for mt8196-mali. It manages
>>> +        * SRAM outside Panthor so this driver must not require direct control
>>> +        * over it.
>>>           */
>>> -       ret = devm_regulator_get_enable_optional(dev, "sram");
>>> -       if (ret && ret != -ENODEV) {
>>> -               if (ret != -EPROBE_DEFER)
>>> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali")) {
>>
>> I wonder if a more generic device tree flag would be better here.
> 
> No, we don't want it as a separate DT flag. This is all stuff we can
> hide behind the compat, and every bit we add to the DT we don't
> strictly need turns out to be a liability in the long run in general.
> 
>> What happens if others do the same as Mediatek or Mediatek decides to
>> do this with more processors and this list grows?
> 
> That's what panthor_soc_data is for: you can attach per-compat
> properties without polluting the DT with more stuff that can be
> directly inferred from the compatible.
> 
>> It seems like a
>> panthor binding might be useful to prevent future bloat.
> 
> It's actually the opposite, the more we add to the DT, the trickier it
> gets to maintain, because we tend to get those things wrong (is the
> SRAM really not needed on mt8196, or is this just a workaround to hide
> the fact the PM is deferred to some FW?).
> 

MT8196 has three supplies: core, stack, sram.

For example, the Google Rauru Chromebooks use those:

        core-supply = <&mt6373_vbuck7>;
        stack-supply = <&mt6316dp_vbuck0>;
        sram-supply = <&mt6316kp_vbuck1>;

As of now (in our midstream trees), these supplies are declared in the gpufreq
node (the performance domain controller), and required to be on whenever GPUEB
interaction is needed, other than whenever the GPU itself is, well, needed to
be powered.

As of the current model, these supplies are getting powered on and off along
with the MFG power domain.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c#n1005

I'm not sure what happens if we also add those to the GPU node... for this, I'm
adding Nicolas to the Ccs, as he is the one who developed support for EB.

Cheers,
Angelo

> Regards,
> 
> Boris


