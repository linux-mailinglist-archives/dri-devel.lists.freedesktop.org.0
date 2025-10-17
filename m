Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5956BEA97A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB1C10EC91;
	Fri, 17 Oct 2025 16:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IwxTMPHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1198410EC8E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:17:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CD801C041F9;
 Fri, 17 Oct 2025 16:17:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2646B606DB;
 Fri, 17 Oct 2025 16:17:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC7E4102F235B; 
 Fri, 17 Oct 2025 18:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760717872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1P1bwBTWzLOJltHycHFOccxdgbEub2QWko/CziZANik=;
 b=IwxTMPHPI3n3K92jlFcSRgmV1VK3liXEyKuYGmdF0ACyvkl7bxD1ytXgfgRfPDxTRm4mml
 Pwk7ZNXgWtBe190lFcEmo74e1VwNhD1SGFM8GVpZOuQhcmomxhNsSbJwi+HlsCkWqrnD6Y
 TXsoo5R1DXCmw3PRMuOON0AQ7G0iUzYcG5nL0pkmNZVjJTCPN0a5OaYU8nIuN+a8EO4Wo1
 N+0g7Ldh6iwZFjheo/xftDr4cRsB61nvbO8/4mF08pO3098Y1nJsEuanYU6M661SV/dmpt
 uwt8Tk7npYIV9KVv0gj19Q9L3kdaolfM5YEhMSA9g+ym28E/aLpHIK5JIiyvaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 18:17:45 +0200
Message-Id: <DDKQE4TIEXYJ.12G2WBT0R8UE4@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "drm/display: bridge_connector: get/put the
 stored bridges"
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1
References: <20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com>
In-Reply-To: <20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

On Thu Oct 16, 2025 at 4:53 PM CEST, Luca Ceresoli wrote:
> This reverts commit 2be300f9a0b6f6b0ae2a90be97e558ec0535be54.
>
> The commit being reverted moved all the bridge_connector->bridge_*
> assignments to just before the final successful return in order to handle
> the bridge refcounting in a clean way.
>
> This introduced a bug, because a bit before the successful return
> drmm_connector_hdmi_cec_register() is called, which calls funcs->init()
> which is drm_bridge_connector_hdmi_cec_init() which needs
> bridge_connector->bridge_hdmi_cec to be set.
>
> The reported bug may be fixed in a relatively simple way, but other simil=
ar
> patterns are potentially present, so just revert the offending commit. A
> different approach will be implemented.
>
> Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored b=
ridges")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/336fbfdd-c424-490e-b5d1-8ee84043dc80@=
samsung.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/r/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=3DAe5pCW=
+eU41Bu=3DD7th2g@mail.gmail.com
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Please ignore this series. I have sent v2 with this exact same patch, plus
two patches re-adding the reverted feature without the same bug:

https://lore.kernel.org/lkml/20251017-drm-bridge-alloc-getput-bridge-connec=
tor-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
