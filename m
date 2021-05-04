Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B846372FD0
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 20:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7556C6E2BC;
	Tue,  4 May 2021 18:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED11689956
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 18:30:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AA9EAF79;
 Tue,  4 May 2021 18:30:12 +0000 (UTC)
Date: Tue, 4 May 2021 20:30:09 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: ERROR: modpost: "drm_display_mode_to_videomode"
 [drivers/gpu/drm/bridge/lontium-lt8912b.ko] undefined!
Message-ID: <20210504183009.GV6564@kitsune.suse.cz>
References: <e4r4g4R-yjH.A.CJE.0pVkgB@appolonius>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4r4g4R-yjH.A.CJE.0pVkgB@appolonius>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Approved-At: Tue, 04 May 2021 18:34:13 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I get errors about missing symbol in the lontium-lt8912b module.

Is the problem self-evident or do you need the config as well?

I don't need the driver for anything, it was just auto-enabled because
it's new and the change has not been reviewed.

Thanks

Michal
> 
> Last output:
>   WRAP    arch/powerpc/boot/zImage.maple
>   WRAP    arch/powerpc/boot/zImage.pseries
> make[2]: *** Deleting file 'modules-only.symvers'
>   MODPOST modules-only.symvers
> ERROR: modpost: "drm_display_mode_to_videomode" [drivers/gpu/drm/bridge/lontium-lt8912b.ko] undefined!
> make[2]: *** [../scripts/Makefile.modpost:150: modules-only.symvers] Error 1
> make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-vanilla-5.12.0.13670.g5e321ded302d/linux-5.12-13670-g5e321ded302d/Makefile:1770: modules] Error 2
> make: *** [../Makefile:215: __sub-make] Error 2
> error: Bad exit status from /var/tmp/rpm-tmp.q1oSIp (%build)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
