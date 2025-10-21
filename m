Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B95BF8E33
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509BE10E110;
	Tue, 21 Oct 2025 21:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Vh1guTcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3895710E110
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:05:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0C2F04E4124D;
 Tue, 21 Oct 2025 21:05:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7AEE60680;
 Tue, 21 Oct 2025 21:05:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63CB1102F2416; 
 Tue, 21 Oct 2025 23:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761080750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lmgxMPK/b3rGKECnlJXXfebD4fVGZtbiAlKPc84ROo8=;
 b=Vh1guTcPS4hWMVnatliJa78v3xzxuw/wSvsuAO6vEwhYUsiF7o/Lmlk5NmxThHpnXbwAEc
 84LuPDG/YkHVEkiwTIfj17DST9tZ9grQzC846/36Hf8bWyNNPDlpLiAKHVGW+TiNgDW/qw
 UmXvgjKeoO0Th4LJKK+/6E14GbC70QLvyOuzmdFIgrxjKdR8DNqXlzeTRdmhsI9mNmjHeA
 IV41rZYCqYHSNz4JoDkXMFkWpK/qkSgULk0gRaiVoa+7rNJU/Ze75/cSUvhkuzcTBAh0rX
 ih1sAanMWRWiQDxBoWH3iTo1RAzDDHaL7sD4KTlTJ/E+W6VtXbkbReKCfKMzDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 23:05:45 +0200
Message-Id: <DDOB0TVD1B9Z.23U6EH06F38NV@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] drm/bridge: enforce drm_bridge_add() before
 drm_bridge_attach()
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>
X-Mailer: aerc 0.20.1
References: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
 <f3904ae1-bf1b-455f-b5ba-5d625b76222f@gmail.com>
In-Reply-To: <f3904ae1-bf1b-455f-b5ba-5d625b76222f@gmail.com>
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

Hello Rapha=C3=ABl,

On Sat Oct 18, 2025 at 2:49 PM CEST, Rapha=C3=ABl Gallais-Pou wrote:
>
>
> Le 03/10/2025 =C3=A0 10:59, Luca Ceresoli a =C3=A9crit=C2=A0:
>> This small series enforces that DRM bridges must be added before they ar=
e
>> attached as discussed in [1].

Thanks for reviewing this series!

I just sent v2 which only adds a new patch with an additional check, which
I realized being useful after receiving a regression report.

All the details at
https://lore.kernel.org/r/20251021-b4-drm-bridge-alloc-add-before-attach-v2=
-0-c17cc1bbff72@bootlin.com

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
