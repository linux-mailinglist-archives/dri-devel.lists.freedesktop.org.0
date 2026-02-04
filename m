Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDEDA+Csg2lvsgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 21:32:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63AEC7B1
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 21:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9335A10E376;
	Wed,  4 Feb 2026 20:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cs3rpa8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A519D10E376
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 20:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770237145;
 bh=a5HSgzMe6JzpxSmMVQbxrnjFpksd7486GnNw1YVR+nc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cs3rpa8Fe3jTdxyppmsK8KRRNbyqKWp39e7A/bIbO5JqbczcCVOE67fj8m7N/Muud
 3nH7ZY734SEWfGASW7iONGl1Bx/QN12mv2OOxhybhJ5GIINJL81uQwmaf678/YsHLn
 1Qooo+akVTa1j5ujmGUdNs27RrNZHUbR0Uo6IwcK1Fq2ZKWs5iCGYbTUoOLeKFa4AR
 R0n2pLbJS3KCcuvZEuscTuR2UXOlAH9DAbgNPz1f16tAe8E/YFYfn9fziP8Ub7OhWN
 FYXiuE6HedPjNyTwyJXelCkZ2VpsFg5zlGG2vLRDJYcu6kzi8cxfTvHKit1cZ9okUp
 1kFu9OA8PMARw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4863917E12C6;
 Wed,  4 Feb 2026 21:32:24 +0100 (CET)
Message-ID: <97a4fd2d-62e2-41ad-8ee9-d2551c3ab312@collabora.com>
Date: Wed, 4 Feb 2026 22:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm: Add CRTC background color property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
 <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:jani.nikula@linux.intel.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:matthew.d.roper@intel.com,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,intel.com,cknow-tech.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 5E63AEC7B1
X-Rspamd-Action: no action

On 1/29/26 11:37 AM, Andy Shevchenko wrote:
> On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware programmed to show non-black
>> colors for pixels that are either not covered by any plane or are
>> exposed through transparent regions of higher planes.  This feature can
>> help reduce memory bandwidth usage, e.g. in compositors managing a UI
>> with a solid background color while using smaller planes to render the
>> remaining content.
>>
>> To support this capability, introduce the BACKGROUND_COLOR standard DRM
>> mode property, which can be attached to a CRTC through the
>> drm_crtc_attach_background_color_property() helper function.
>>
>> Additionally, define a 64-bit ARGB format value to be built with the
>> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
>> color components can be extracted with desired precision using the
>> corresponding DRM_ARGB64_GET*() macros.
> 
> ...
> 
>> +/*
>> + * Put 16-bit ARGB values into a standard 64-bit representation that can be
>> + * used for ioctl parameters, inter-driver communication, etc.
>> + *
>> + * If the component values being provided contain less than 16 bits of
>> + * precision, use a conversion ratio to get a better color approximation.
>> + * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
>> + * the input and output precision, respectively.
> 
> Not sure if you should explicitly mention that "bpc must not be 0"
> (it can be derived from the "division by 0" in the given formula,
> but still...).

Comment section updated in v7 [1], though I somehow missed to mention it in the
changelog. :-(

> 
>> + */
>> +#define __DRM_ARGB64_PREP(c, shift)					\
>> +	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
>> +
>> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\
> 
> Not sure if this is an accepted style in DRM, by I find it difficult
> to follow. I would expect the "({" be on a separate line.

I initially got confused by the plethora of different styles, e.g. in
"include/linux/math.h" we can find:

  #define rounddown(x, y) (				\
  [...]

  #define DIV_ROUND_CLOSEST_ULL(x, divisor)(		\
  [...]

  #define mult_frac(x, n, d)	\
  ({				\
  [...]

  #define abs_diff(a, b) ({			\
  [...]

I agree your option is the most readable one, hence I used it consistently in
v7.

Thanks,
Cristian

[1] https://lore.kernel.org/all/20260204-rk3588-bgcolor-v7-0-78d1d01c5ca1@collabora.com/

