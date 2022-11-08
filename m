Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447EA620C6C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BEE10E3BC;
	Tue,  8 Nov 2022 09:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602C810E0E8;
 Tue,  8 Nov 2022 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gn2jtnurXeLoR+JBbYdWEKBeFwgIy7nQqvoCoWdGcMU=; b=Jm48u4quUIM9AnE2eAVOPXlszN
 dHIUCxlanP3myizyV6x9HL+VzqOJBcIng+jIcCrV+ZPLX2GL3s239g7CE2I26KDmGGx0zkpumAvjA
 EALkEKyh8Ho0vrR7//I1jF65jvIy8wwm/jayyESeeHlMso6Zu6yM2QoKn9j4hydIZxrtVraX1dJju
 ItknqiWPduNMuNnrVezLIeZgNrbbgi5Djw/QrHpTXb6ozVvWRQxu6EbXp+RHmjSdNmEqARyimQjcf
 DksOaOcw0fZ51OKSvj6zbrlcXCFUinsfBUGO2lO/rodVYogF86aGh3Q5y9/zFg8ENVbG/phX+5Kod
 UAKOOx1A==;
Received: from [2a01:799:95a:cb00:cca0:57ac:c55d:a485] (port=57639)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1osL3l-0008OX-8y; Tue, 08 Nov 2022 10:38:21 +0100
Message-ID: <ba532387-6329-c57a-1fa2-627b2cf40281@tronnes.org>
Date: Tue, 8 Nov 2022 10:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 15/23] drm/modes: Introduce more named modes
To: Maxime Ripard <maxime@cerno.tech>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-15-7072a478c6b3@cerno.tech>
 <262f0953-1e05-e68e-3e96-2ac2132a1e57@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <262f0953-1e05-e68e-3e96-2ac2132a1e57@tronnes.org>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 07.11.2022 19.03, skrev Noralf Trønnes:
> 
> 
> Den 07.11.2022 15.16, skrev Maxime Ripard:
>> Now that we can easily extend the named modes list, let's add a few more
>> analog TV modes that were used in the wild, and some unit tests to make
>> sure it works as intended.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> ---
>> Changes in v6:
>> - Renamed the tests to follow DRM test naming convention
>>
>> Changes in v5:
>> - Switched to KUNIT_ASSERT_NOT_NULL
>> ---
>>  drivers/gpu/drm/drm_modes.c                     |  2 +
>>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 54 +++++++++++++++++++++++++
>>  2 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index 49441cabdd9d..17c5b6108103 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -2272,7 +2272,9 @@ struct drm_named_mode {
>>  
>>  static const struct drm_named_mode drm_named_modes[] = {
>>  	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC),
>> +	NAMED_MODE("NTSC-J", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_NTSC_J),
>>  	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL),
>> +	NAMED_MODE("PAL-M", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE, DRM_MODE_TV_MODE_PAL_M),
>>  };
> 
> I'm now having second thoughts about the tv_mode commandline option. Can
> we just add all the variants to this table and drop the tv_mode option?
> IMO this will be more user friendly and less confusing.
> 

One downside of this is that it's not possible to force connector status
when using named modes, but I think it would be better to have a force
option than a tv_mode option. A lot of userspace treats unknown status
as disconnected.

Anyone know if it's possible to set the connector status sysfs file
using a udev rule?

Noralf.
