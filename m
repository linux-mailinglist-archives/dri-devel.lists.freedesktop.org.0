Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E375F3D1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 12:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F6610E2CC;
	Mon, 24 Jul 2023 10:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726E510E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 10:50:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6FE36106F;
 Mon, 24 Jul 2023 10:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4A7C433C8;
 Mon, 24 Jul 2023 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690195854;
 bh=Btwc0NpzjaS8ztCfC9e8CxhdBoIw+kynEpO2Ak41BCY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qFNiYOSgbkNcdn316zBbT5+WGlnuYaY4yMEXiMQPeAQLBMrAc12Ks67bXSC2EJe4+
 PWDpRd+9m8tAi9EsPQHBhdSW71WoUGoHOV2x7RunRc1R1TpiPo1w3y1iPVsO8IN2wu
 Mn4pRF/ZDG5d9GO7fulGAWGJLaERMUyiFRFNh+psbi8Eh8Of/fhrD41jpTqkaUoDRM
 TVOmckxJDCYGLJj9CJgxGSPKlHGQDg327qj7iPJ+VemjAdDdp0OHJkq1LaUclm+N6O
 1npiO/FW636OQ6EWIn0CxwtJbYB+EGGE30spBGt5ipC8BVDCldV5L0/mFpfuz6YqF3
 cVDLrwUPAqD7w==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <ddf86b59-696a-45f0-96dd-b87aa7b9ab2e@moroto.mountain>
References: <ddf86b59-696a-45f0-96dd-b87aa7b9ab2e@moroto.mountain>
Subject: Re: (subset) [PATCH] drm/managed: Clean up GFP_ flag usage in
 drmm_kmalloc()
Message-Id: <169019585162.2211238.1816188334769406260.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 12:50:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jul 2023 17:57:49 +0300, Dan Carpenter wrote:
> This code is not using the correct gfp flags which were passed in.
> However, this does not affect runtime because kstrdup_const() is a
> no-op in this context.  (It just returns the "kmalloc" string literal
> without doing an allocation.)
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

