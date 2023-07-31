Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02888769623
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5082010E278;
	Mon, 31 Jul 2023 12:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB4310E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:23:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FAE5610A6;
 Mon, 31 Jul 2023 12:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339B2C433C8;
 Mon, 31 Jul 2023 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690806204;
 bh=vuba+Vhq5g0pWYAbMHyb5jikpXT3P+OQTVInnYC3tOE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HqBvYQ+OKR/L2+HFOL2swHCVgFG1Xnt7sXVcqOte2mX2t/Gdz7UOwAz447oeObMck
 ssiba4/SfCWGGGuT3i8K9Hd6GE0p4dEMsN9uUVxvfXltThta9wQO6RA21QV/nmQZZp
 e7KDcXzyEz+cp2Q2PMXff370JifZjg5xjsQwXA56GG2gXxmBQjivE4/5lwTXU1eHMc
 /RL/Vld1QklUuizUlHzjcNkUD54+WXyxhbeeLE2tmOOiIQ41iOhNcVLLsZL5ARCUi1
 jEgKxl5Nc9EoQPd/zo4jWS6vA69oC7E20GMaQ40+WD2nLYYS/PWMRckul49yIthvSl
 KktQmZMXOoV7Q==
From: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20230728-kms-kunit-actions-rework-v3-0-952565ccccfe@kernel.org>
References: <20230728-kms-kunit-actions-rework-v3-0-952565ccccfe@kernel.org>
Subject: Re: [PATCH v3 00/11] drm: kunit: Switch to kunit actions
Message-Id: <169080620207.275106.8542250343147721181.b4-ty@kernel.org>
Date: Mon, 31 Jul 2023 14:23:22 +0200
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
Cc: linux-kselftest@vger.kernel.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 11:06:13 +0200, Maxime Ripard wrote:
> Since v6.5-rc1, kunit gained a devm/drmm-like mechanism that makes tests
> resources much easier to cleanup.
> 
> This series converts the existing tests to use those new actions where
> relevant.
> 
> Let me know what you think,
> Maxime
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

