Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF483025F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6239A10E356;
	Wed, 17 Jan 2024 09:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C911110E356
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:33:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04589CE17C1;
 Wed, 17 Jan 2024 09:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4BDC433F1;
 Wed, 17 Jan 2024 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705484001;
 bh=Hu9dm8ZObL7wR5kdtp/P19OQIMCvQ8txBzsqQBsIopY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gg+H5DNSzdAZQKBcTCUIA6P/2wipiMN9afanINGAniHkDeMudoVJDKdRPhttBhHP9
 yqTsk1kWipb6ywNKGuAOwZSPK+BJ8Nsmam7MqtcvwPTWZSBGU7bVEAo4Qx6mqtAp7t
 Aa803a5hv0T9vOPgqriH8RImVxBT7BARI7z0IAQxAj3kgzunQ9GW0CNpe/QaaciN3y
 JZ69mds+WtaM2TuOpGEW6+0kfyaxpaeIaf5MgywxZTP3/KWiUDRKkb2d9i8yDGFTue
 mEnWjYOcR+amjJenMfnZJ2L8Jfn54F6C7g44x/GB7zyQ6XXJiS4x37MzPS4MR7OCUt
 qIfzq3dICOVmw==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
In-Reply-To: <20240116174602.1019512-1-michal.winiarski@intel.com>
References: <20240116174602.1019512-1-michal.winiarski@intel.com>
Subject: Re: (subset) [PATCH] drm/tests: mm: Call drm_mm_print in
 drm_test_mm_debug
Message-Id: <170548399858.73195.15806480553530773396.b4-ty@kernel.org>
Date: Wed, 17 Jan 2024 10:33:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Jan 2024 18:46:02 +0100, Michał Winiarski wrote:
> The original intent behind the test was to sanity check whether calling
> the debug iterator (drm_mm_print) doesn't cause any problems.
> Unfortunately - this call got accidentally removed during KUnit
> transition. Restore it.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

