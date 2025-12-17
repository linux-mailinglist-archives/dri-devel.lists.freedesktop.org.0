Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E2CC831E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01FC10ECF7;
	Wed, 17 Dec 2025 14:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xrG4jKk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9149E10ECF7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:31:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1797C4E41C61;
 Wed, 17 Dec 2025 14:31:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D3C3E6072F;
 Wed, 17 Dec 2025 14:31:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08228102F0ADF; Wed, 17 Dec 2025 15:31:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yAjEzU0lnm6w9HbHvxnWCw8lQ0bKDnGFd7xXe5yjJo0=;
 b=xrG4jKk1868Dv7dPhgpQxbWfGUHPcegpZHAbpsi68LNt1qCvLavT7qg6pk0LyAOpy6g8vf
 uCI/c6WhBKRbvJfH/9PevUAINIRZeoOldyX4fOqO+SKCVogGMwcD+YyeCa1fh6K0TiTtqw
 i7q5sRSu4GJyjVf7mR9Y3/Qri1jAxFNDNws2wV4hE/ssLWNgu61nMSLCC09UXg1/i5guEu
 143vac/E0zy0QYBvBIJMD6V50VaSq7IRSfaV3EGMI8yx/9ZEj9u8cmOSJceVeRYhrjLvTr
 yt97q0vB58aPCsDXYu3m2nq3B4klQ0rtZb1eI7qcWYQlJfN12/1sBA27uTxx/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:31:01 +0100
Message-Id: <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jonathan Corbet" <corbet@lwn.net>, "Kevin Hilman" <khilman@baylibre.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Phong LE" <ple@baylibre.com>, "Robert Foss"
 <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
 <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
In-Reply-To: <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
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

Hi Maxime,

On Wed Dec 17, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() does not increment the refcount for the returned
>> bridge, but that is required now. However converting it and all its user=
s
>> is not realistically doable at once given the large amount of (direct an=
d
>> indirect) callers and the complexity of some.
>>
>>
>> [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thank you for the prompt review!

All patches are reviewed now except patch 18 which has no reply. I'm just
pointing out in case it's something you missed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
