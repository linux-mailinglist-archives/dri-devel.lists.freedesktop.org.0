Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D886C92A0FD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5910E167;
	Mon,  8 Jul 2024 11:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jv95xxmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF8510E0D1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD2E160B4E;
 Mon,  8 Jul 2024 11:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F614C4AF0A;
 Mon,  8 Jul 2024 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720437934;
 bh=kbWDaYd2Zj4SkeFCRSR0D9RE/sS3hANVK7AD7KFDJ4c=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Jv95xxmvAoj6cwROxMD+MKT73VL25rdtBXQmyNjzdYnAv9WoQfL1OarrGvU/Q2Rzp
 j6cS0J56m0TqKkvFEpdUr9ZnTeELe8QnpiiTynppXYzEGMsZokG0u6mLNljKoD4Qm8
 4AnDrXS/rcFedO5q7dddhg3BzHixW0x6gHWTfFSTfc3ECWDEf+8YNa5qKjU3Giu0Qc
 T7mDoxV37j0QkzMiorg0heCyCGzf3uVh0K0qhSGeJ0pbhPr8Zyz/SXEIZoqydtBdK4
 v+4psL3G6a4McwUxouyci40TCxjQj8zhR2iYXbjV/OkiDyWvTP2sFsAE41aXkiBHcH
 otXWFLCpqGWFg==
Message-ID: <78159b4b3aae872b7de40d6dd1d5adf3@kernel.org>
Date: Mon, 08 Jul 2024 11:25:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v3 2/9] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
In-Reply-To: <20240703172228.11166-3-gcarlos@disroot.org>
References: <20240703172228.11166-3-gcarlos@disroot.org>
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?b?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, "Arthur
 Grillo" <arthurgrillo@riseup.net>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, "Tales
 Lelo da Aparecida" <tales.aparecida@gmail.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 3 Jul 2024 14:22:21 -0300, Carlos Eduardo Gallo Filho wrote:
> Extend the existing test case to cover:
> 1. Invalid flag atribute in the struct drm_mode_fb_cmd2.
> 2. Pixel format which requires non-linear modifier with
> DRM_FORMAT_MOD_LINEAR set.
> 3. Buffer offset for inexistent plane
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
