Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF69769622
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394910E268;
	Mon, 31 Jul 2023 12:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86ED10E268
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:23:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 482AF61090;
 Mon, 31 Jul 2023 12:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FDCC433C9;
 Mon, 31 Jul 2023 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690806201;
 bh=vtiNe4G7rXfUPIV0oIeYWpUQbdzfz9IJ3ODvzvMPr8Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sQQ9jYFpJBhowuZb2LUzf3LfMCUxkBWcgAj7cltelwHQIGRX8IQzivkClN2i9rm/f
 IJ/QymMoYhRsdUKhv9A++TBcHETgIU8L5l2UyWlwzM1PNXNnMU/YkD1rpWWrqYUHxF
 Zac3L5TfY5xMHVbqUiFzIveukUXt9R09FAycpqSb7zD1THki2HXttkrSk9uln+/7aU
 bvxsuCDUxLCh8VPp6c85xra3A0LyrSEqrq7nxFKm8smzbeK1/Fh56E4e5jaSboZbDR
 ySqAs2osdE/oMIR+Pue7t64cZ1/uyJy+7uyKXMa4qM7V/xvuLHOVamuH0B5XSzYbRr
 WdUzhGiWmts0g==
From: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>, 
 Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
References: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
Subject: Re: [PATCH v2 00/11] drm: kunit: Switch to kunit actions
Message-Id: <169080619883.275106.14754848057224430260.b4-ty@kernel.org>
Date: Mon, 31 Jul 2023 14:23:18 +0200
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

On Thu, 20 Jul 2023 13:15:45 +0200, Maxime Ripard wrote:
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

