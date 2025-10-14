Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DAABD8132
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F06D10E575;
	Tue, 14 Oct 2025 08:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G1DCyej+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8C310E574;
 Tue, 14 Oct 2025 08:04:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CDCC44E41084;
 Tue, 14 Oct 2025 08:04:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9C0F6606EC;
 Tue, 14 Oct 2025 08:04:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C10B102F2259; 
 Tue, 14 Oct 2025 10:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760429086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GIIeOiA+EHLhetZL9C/NMdu7ddLETfZ/iyx450VmB+o=;
 b=G1DCyej+ZJvGk7EonfwQ/mncRsM+vJF2B0qZhJE7q9oiqodxvAjw7euPlQHu/geuj3TsCg
 AMJgs8a2n9HowcnEwcMtgYb802u5QwzJVq9bEOHWtc8ymnzQD46qUUeMyfqfpjNDcfzhJr
 N+p57CfH2WVTJIRvEHXgdfLN4PYQP4CXAJwTHifUQ+xdoqAvR9tY287YqZScg26NO6Jli0
 Hb+JtXsaSSY0fytpzjUy6eu5IoIJWJi5XmlOo8lVXzhey9GKUZL4fUvFqt8wWeBsLcmjRX
 KhxJLN1c4A5GHupxl8RsEatQfzPgL5pSOiPhM0AVuXLpVw53tINDJLfI20vwnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 10:04:23 +0200
Message-Id: <DDHW0RB42KJW.3T5APFG3ORAOO@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li"
 <sunpeng.li@amd.com>, "Rodrigo Siqueira" <siqueira@igalia.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Liviu Dudau" <liviu.dudau@arm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Mikko Perttunen" <mperttunen@nvidia.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/atomic: pass drm_device pointer to
 drm_atomic_private_obj_fini()
X-Mailer: aerc 0.20.1
References: <20251013-drm-bridge-atomic-vs-remove-private_obj-v1-0-1fc2e58102e0@bootlin.com>
 <20251013-drm-bridge-atomic-vs-remove-private_obj-v1-1-1fc2e58102e0@bootlin.com>
 <lunecs4wjujws7rczn4lmrjhbqfljbwzwrrw4yst5v2xgh3dip@hwz5kt5fzkw5>
In-Reply-To: <lunecs4wjujws7rczn4lmrjhbqfljbwzwrrw4yst5v2xgh3dip@hwz5kt5fzkw5>
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

On Tue Oct 14, 2025 at 9:44 AM CEST, Maxime Ripard wrote:
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -672,7 +672,8 @@ void drm_atomic_private_obj_init(struct drm_device *=
dev,
>>  				 struct drm_private_obj *obj,
>>  				 struct drm_private_state *state,
>>  				 const struct drm_private_state_funcs *funcs);
>> -void drm_atomic_private_obj_fini(struct drm_private_obj *obj);
>> +void drm_atomic_private_obj_fini(struct drm_device *dev,
>> +				 struct drm_private_obj *obj);
>
> It's redundant with
>
> https://lore.kernel.org/dri-devel/20251008-drm-private-obj-reset-v1-1-805=
ab43ae65a@kernel.org/

What a timing! Thanks for the pointer, I hadn't noticed that series. It
looks useful for my work, I'm definitely reviewing and testing it very
soon.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
