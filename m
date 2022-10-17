Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68140600C36
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 12:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1CC10ED20;
	Mon, 17 Oct 2022 10:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF3110E6DC;
 Mon, 17 Oct 2022 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y4j7gBOaq+2LeHWeErehnoB7+9tH84EPBKVdDAWDliE=; b=AoVlrX2Ik0FBhZTaqHAgAgXDq3
 sKgykY/zMoWZvYv/wwlTjx33qQU6S8eKEpaorbc+ZIhkKjRpUwTgiBYGb6GkwlSu4Wf+spNboAz/N
 1Q9Dn9Hw7vEb7gaGtICHUG1djD+wwVRu5sx2XYOn1bKxdAxEnkXah3X9mi1EmN69vpTES5V5h/np9
 deEPLmHaxO1ek7B34SPfN4PmegGOTgOOPdlNFiiADkTT593XYyHN1rj/FmfJbUK8F0ZanLdzV6zOe
 s46j/eFnXBiSwk6jlRYsduk/ylik9IZzGhZFnxWyZzcYnLDDP9Vk2J6ri4eobHTZgRvvlWgLKtxwV
 7DsvpzmQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59672
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okNFL-0001vj-HG; Mon, 17 Oct 2022 12:21:23 +0200
Message-ID: <769d2f6e-7fe6-30da-06d8-3c2e9fb9df34@tronnes.org>
Date: Mon, 17 Oct 2022 12:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 13/22] drm/modes: Introduce the tv_mode property as a
 command-line option
To: kfyatek+publicgit@gmail.com, Maxime Ripard <maxime@cerno.tech>,
 Karol Herbst <kherbst@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-13-d841cc64fe4b@cerno.tech>
 <fdeadf0d-8f38-8edf-ae92-e2d9c5aa90b4@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <fdeadf0d-8f38-8edf-ae92-e2d9c5aa90b4@gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 16.10.2022 19.51, skrev Mateusz Kwiatkowski:
> Hi Maxime, Noralf & everyone,
> 
> I'd like to address Noralf here in particular, and refer to these discussions
> from the past:
> 
> - https://lore.kernel.org/linux-arm-kernel/2f607c7d-6da1-c8df-1c02-8dd344a92343@gmail.com/
> - https://lore.kernel.org/linux-arm-kernel/9e76a508-f469-a54d-ecd7-b5868ca99af4@tronnes.org/
> 
>> @@ -2230,20 +2256,22 @@ struct drm_named_mode {
>>  	unsigned int xres;
>>  	unsigned int yres;
>>  	unsigned int flags;
>> +	unsigned int tv_mode;
>>  };
> 
> I saw that you (Noralf) opposed my suggestion about the DRM_MODE_TV_MODE_NONE
> enum value in enum drm drm_connector_tv_mode. I get your argumentation, and I'm
> not gonna argue, but I still don't like the fact that struct drm_named_mode now
> includes a field that is only relevant for analog TV modes, has no "none" value,
> and yet the type is supposed to be generic enough to be usable for other types
> of outputs as well.
> 
> It's true that it can just be ignored (as Maxime mentioned in his response to
> my e-mail linked above), and now the value of 0 corresponds to
> DRM_MODE_TV_MODE_NTSC, which is a rather sane default, but it still feels messy
> to me.
> 
> I'm not gonna force my opinion here, but I wanted to bring your attention to
> this issue, maybe you have some other solution in mind for this problem. Or if
> you don't see that as a problem at all, that's fine, too.
> 

I hadn't looked at this patch in detail before, but you're right this,
together with drm_atomic_helper_connector_tv_reset(), will overwrite
tv.mode unconditionally regardless of tv_mode being present in video= or
not. We need a tv_mode_specified flag like we have for bpp and refresh.

Noralf.
