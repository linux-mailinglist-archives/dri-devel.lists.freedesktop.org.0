Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3BB57648
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE1310E3EB;
	Mon, 15 Sep 2025 10:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jgSUZmYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7B110E3EB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:30:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3C77BC6B3AF;
 Mon, 15 Sep 2025 10:30:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B1066063F;
 Mon, 15 Sep 2025 10:30:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D8E5102F2AA2; 
 Mon, 15 Sep 2025 12:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757932219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iPMXjGf/3WKBSmAeqhAwH5Gjgp7eQens8v19HHHicY8=;
 b=jgSUZmYAIUpvTa2nKGPW196s058zYfff0lioEFxiPPV+gvCqfvpkvYAKyvt5eCbnHiw7Cj
 J6X5ykpmMRgCeFyER+ZVbRZoyqvjtXJE61BfvjyZqZLYiGFmRMuxIO2It1VTWQK+vSdB5U
 iJsGWAQp5bg8zn15s23efloWV2Wzbx5cKOkAUjWDa+ZoZ81ADLUYHOpMreiDqlAmNRGYhU
 JjgMSdCLzXX0+MqiDnjeKmCijEIs+cyqRhwVyNGXZI6h5+aUctzOOrgSljyH/KvzEQbMOV
 UEm+9qNBprKmOvFFqyXPA9yVikddsA2lRAodwGD15OKqjq4W2oaWsqUm/vstVw==
Date: Mon, 15 Sep 2025 12:30:10 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v8 0/3] drm/bridge: debugfs: show refcount and list
 removed bridges
Message-ID: <20250915123010.18fd21f9@booty>
In-Reply-To: <20250915-celadon-dalmatian-of-defense-ca56fb@penduick>
References: <20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com>
 <20250915-celadon-dalmatian-of-defense-ca56fb@penduick>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 15 Sep 2025 10:13:16 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Once the minor issue I've reported is fixed,
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Ok, thanks!

v9 sent.

Note that this series depends on [0] which is waiting for discussion to
continue, so any feedback on drm_for_each_bridge_in_chain_scoped()
would be very welcome to unlock both this and other series from being
applied/sent.

[0]
https://lore.kernel.org/all/20250808-drm-bridge-alloc-getput-for_each_bridge-v2-3-edb6ee81edf1@bootlin.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
