Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDEC87CB86
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 11:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EADA112119;
	Fri, 15 Mar 2024 10:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UQ1yycHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04281112119
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 10:34:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C5E1BCE1FAD;
 Fri, 15 Mar 2024 10:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78CBC433F1;
 Fri, 15 Mar 2024 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710498858;
 bh=NgD8dSi/kS7Xzn/mfLufM8kl5WjiX8N/t3v+LS8/r4w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UQ1yycHJLB8m//Nnzf4SUhZUh4qVh6Dl4jdLQoRGKt8dtYO9C1e57v+8S9cD51sxq
 0Qvx+3DfwyDd+P9EKnMfaC1j12ZX6SO1PxdJpy9kRrwb8A6rJN0d+ICVW2S0gHZyIP
 x6O2IJ5El/bOh7MRyLImmMW9nlu7beD1lndCadvgIN8z9A06AlqmB2wn7/2BxN+mcD
 ho1sY3gHozfKbh0JOUJ7b1PyaNuKuMkThjXtyJyUAmiShOC1PFSjqHwOsdxXHQUins
 9V2kd1/UOUWL/k3GMOZTmPEtMSgCFGdPQEH+v5lBLPZnDkcgK1930ne/rAdAQsdJAr
 UukscXd/+9fxA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Karolina Stolarek <karolina.stolarek@intel.com>
Cc: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20240313142142.1318718-1-karolina.stolarek@intel.com>
References: <20240313142142.1318718-1-karolina.stolarek@intel.com>
Subject: Re: [PATCH] drm/tests: Build KMS helpers when
 DRM_KUNIT_TEST_HELPERS is enabled
Message-Id: <171049885515.181410.5079132344673065578.b4-ty@kernel.org>
Date: Fri, 15 Mar 2024 11:34:15 +0100
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Mar 2024 15:21:42 +0100, Karolina Stolarek wrote:
> Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
> introduced a dependency on CRTC helpers in KUnit test helpers.
> Select the former when building KUnit test helpers to avoid
> linker errors.
> 
> 

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime

