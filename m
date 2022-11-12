Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E08626A94
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 17:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F8810E198;
	Sat, 12 Nov 2022 16:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6010E198;
 Sat, 12 Nov 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wIT72RKQRo9T1EZzWzDg8w//z6Ef/o85SJsudPE3Bw=; b=SWQJFhTzXSZGQky2ctHg2HStR5
 +IFSW2Q8WSaCTkp3S8Mf0wyOGM5N8pnZ17AA0fQG6QMFx3jc+6xOT7X8b3roJrNI8jqqT8aNyh3oX
 h0gOCFVD9QfcH38fJxttUMJKuaGpzTots2I8ChaVkbPDf0sy5tvEYVU8cRQ0c3xjrmDCMP+aVStzP
 91b2wkT/lHZQ4E/0k20VkHi/ZvFmt1PUCkJJ/ByEjwznHS3Wz+QGhymNvdJPwAPPbPd63SiduHQky
 JCYnZG6uwJUNkM9YK0c9YlS+BY2SVw0zrSsJRLy8yW+k0TPTSitB/0s/KIAjtSY53IV0EIVFeV1UI
 KZYF5/dA==;
Received: from [2a01:799:95a:cb00:9d29:d4c4:45a0:777e] (port=49715)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ottOV-00077k-DC; Sat, 12 Nov 2022 17:30:11 +0100
Message-ID: <81ba376a-c177-d7c7-58a5-968d89760ad2@tronnes.org>
Date: Sat, 12 Nov 2022 17:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 15/24] drm/client: Remove match on mode name
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Karol Herbst
 <kherbst@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
 <20220728-rpi-analog-tv-properties-v8-15-09ce1466967c@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-15-09ce1466967c@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 10.11.2022 12.07, skrev Maxime Ripard:
> Commit 3aeeb13d8996 ("drm/modes: Support modes names on the command
> line") initially introduced the named modes support by essentially
> matching the name passed on the command-line to the mode names defined
> by the drivers.
> 
> This proved to be difficult to work with, since all drivers had to
> provide properly named modes. This was also needed because we weren't
> passing a full blown-mode to the drivers, but were only filling its
> name.
> 
> Thanks to the previous patches, we now generate a proper mode, and we
> thus can use the usual matching algo on timings, and can simply drop the
> name match.
> 
> Suggested-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
