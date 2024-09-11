Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59399751D2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 14:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027A310E9E1;
	Wed, 11 Sep 2024 12:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W5je9elE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6E10E9BC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 12:19:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B70ED5C03EF;
 Wed, 11 Sep 2024 12:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0316C4CEC5;
 Wed, 11 Sep 2024 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726057158;
 bh=5PsmU56NuOPr4PjDarmvJ2zilM7G3LlNuVQh/ZeBfK0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=W5je9elEocNKVAtL2QAmLpgf/gs9kCzpYDYgydSh6CnxiOlUhboQ3K6MIP2pnI37X
 8+ujhbz3REVYdANAZ2TxJDu9w9O5/bIpNECeAoX1yaHPwJD1X2hJvnC8rhjtSEaSNv
 vQukWB9/gMLJzT2ntWokDpncbaOam0LYVkeQA6+oF6VQiUns6INU3/1Y0Tms/eSouW
 CFs61z/70mqYSKubuz1A8UF+d0BfylUmto+++sJjg2mbsMAo3/hYnY2ZjqTb87S1E5
 jifI4seOKV9PiFHTGH0GvRhayH6OSbvuYrUZDZAQG0G9rjbzaNL0xOL/hgi4w5Oz9G
 cfb5HWxZMuWzg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
In-Reply-To: <20240911001559.28284-1-gcarlos@disroot.org>
References: <20240911001559.28284-1-gcarlos@disroot.org>
Subject: Re: [PATCH v4 RESEND 0/9] Increase coverage on drm_framebuffer.c
Message-Id: <172605715531.956551.13163712003461695066.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 14:19:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Tue, 10 Sep 2024 21:15:25 -0300, Carlos Eduardo Gallo Filho wrote:
> This patchset includes new KUnit tests for 5 untested functions from
> drm_framebuffer.c and improvements to the existent one.
> 
> The first patch replace the use of dev_private member from drm_device
> mock on the existent test by embedding it into an outer struct containing
> a generic pointer.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

