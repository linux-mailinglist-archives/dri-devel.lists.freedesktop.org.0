Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D066CCD10ED
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 18:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF1110F04C;
	Fri, 19 Dec 2025 17:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bIVYf5l9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6946610F04C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 17:08:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 30E074E41CB8;
 Fri, 19 Dec 2025 17:08:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 07FE66071D;
 Fri, 19 Dec 2025 17:08:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE20610AA95D9; Fri, 19 Dec 2025 18:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766164116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=K6T7Kx7Dfh74hDrph2a5XEaBWwXjdh5yL90vk7rFvY4=;
 b=bIVYf5l9sWtF4zrexcbDiUXDsI1mxZdM8rM2bVq/7Fsgysa3de87ibY86NZcd3WVbWjEf5
 IPhKwaZsVk/Nf6VbDlO0s6M3VB5UfDPaq32R0YhorWBHYHsgvlT9RnZh7Xn9Zny76BVZqQ
 gT790gSlAYzB94tdvX3f/Jb+osG+FitYKK8cPOD9ZS4A/PQo33HGLK3BnDJ6VeWg7XX21w
 scw+BrxmLi3EoT1Fy/UThLaPZA05iAuHvHVs+dy5H11wmtO9EkI+QxpLcCtr+D6YuNw5hi
 8MHUeyGdhC/FvoSoHs3Lrvd37W+vI1Y+3zmgGqKP1qB2rxJrdocJAHCxXpuz7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:08:33 +0100
Message-Id: <DF2CXCN54ZCQ.2556SL3J03DOO@bootlin.com>
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND v2 20/32] drm/vkms: Introduce configfs for plane
 zpos property
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-20-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-20-a49a2d4cba26@bootlin.com>
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

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> Modern compositor rely on zpos management to offload some processing to
> deticated hardware. In order to test multiple configurations, add zpos
> configuration to configFS.
>
> Introduce multiple attributes to configure zpos:
> - zpos_enabled - Create or not the zpos property. If not created, the zpo=
s
>   is undefined.
> - zpos_mutable - If the zpos property is created, allow or not the
>   userspace to modify it
> - zpos_initial - Initial value for zpos property. Must be between zpos_mi=
n
>   and zpos_max
> - zpos_min - Minimal zpos value for this plane. Must be smaller than or
               Minimum

>   equals to zpos_max
    equal

or, more simply:

  - zpos_min - Minimal zpos value for this plane. Must be <=3D zpos_max

> - zpos_max - Maximal zpos value for this plane. Must be greater than or
               Maximum

>   equals to zpos_min

As above

> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst

> @@ -114,6 +114,13 @@ Planes have 9 configurable attributes:
>    To remove a format, use a minus and its fourcc: -XR24
>    To add all formats use +*
>    To remove all formats, use -*
> +- zpos_enabled: Enable or not the zpos property: 1 enable, 0 disable
> +- zpos_mutable: Create the zpos property as a mutable or imutable proper=
ty: 1 mutable,
> +  0 disable. No effect if zpos_enabled is not set.

s/disable/immutable/

> +- zpos_initial: Set the initial zpos value. Must be between zpos_min and=
 zpos_max. No
> +  effect if zpos_enabled is not set.
> +- zpos_min: Set the minimal zpos value. No effect if zpos_enabled is not=
 set.
                       minimum

> +- zpos_max: Set the maximal zpos value. No effect if zpos_enabled is not=
 set.
                       maximum

With those fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
