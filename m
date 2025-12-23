Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62758CD9C07
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 16:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A873A10E057;
	Tue, 23 Dec 2025 15:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M1Vah7pz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1453A10E057
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 15:18:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5FE614E41D68;
 Tue, 23 Dec 2025 15:18:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FB2860716;
 Tue, 23 Dec 2025 15:18:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2597510AB0B77; Tue, 23 Dec 2025 16:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766503083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HKntYVi35pyEVeViH3hVSD2BnvvTIn+UnG48LkKSRYI=;
 b=M1Vah7pzguZcswFNojTFCWl6ZC58I63uRcHqIto0Zw2jYnWzGvVJKfr9r/e3mLp1W0uw/Y
 uTRXH9+nkfPJq2RlJQPN65DPbtl64f9UH4KiTIFiMykNkFij91gfz89Aj+xK/zOGTQqUvB
 jIJ4VSLMuDA5tsDLhxnXpNn1A/Lg5QN1ZdBgVnQsBemW7D3KGkNiOkW0xddrRIneE+mX7a
 QR+04Ygc9q/5TkE8fHFJHYi5XjukyWOfYmq2ruF+IX6dPKpHd79JR/49ZbsQKyGZ4vBzxh
 /wF8gXNq6qfNihm9Otvmrq0ZkcZ4bliDwLrmxPjxyVr6GKyTWeTTUOWdS4fs7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 16:17:58 +0100
Message-Id: <DF5P2UXQ2SEO.28VDBBCPZTTET@bootlin.com>
Subject: Re: [PATCH v3 33/33] drm/vkms: Introduce configfs for dynamic
 connector creation
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
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>
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

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> DRM allows the connector to be created after the device. To allows
> emulating this, add two configfs attributes to connector to allows this.
>
> Using the dynamic attribute you can set if a connector will be dynamic or
> not.
> Using the enabled attribute, you can set at runtime if a dynamic connecto=
r
> is present or not.
>
> Co-developed-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

[...]

> +static ssize_t connector_dynamic_show(struct config_item *item, char *pa=
ge)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
             ^^^^^^^
	     dynamic

With that fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
