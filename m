Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E1A464ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 16:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4806E10E93B;
	Wed, 26 Feb 2025 15:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IMgKXgzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0531110E93B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 15:34:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B6FF5C5AFB;
 Wed, 26 Feb 2025 15:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF56C4CED6;
 Wed, 26 Feb 2025 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740584063;
 bh=yAMuj0AjE26TplTLNvFHZidviz83LSOE/I8qw2dPkHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IMgKXgzuOWXJtizU3IvLQHM2TbgNmVjRGr+HiG91ivc94zAoyPQNn1gUs0CvOIx3Q
 R14wAtdCLIzKeC/OIFqtS1cX2lN1jK7PK7LRdvPZ1rR1FFVtU5dWsZRu/NXp7YlMTg
 pV6hs2Fw75TIuyA/eBayQv+uPyxiQQ1OqJp1uxGQ7w2YmFMcuCw7Gg/tsMjotxkra5
 Ab3IrQCH47gWJa1YCGvFZ+nNjX95BZbSOonh6gDYlOkp5Ka0Ra41FR2SukWwiTgvqo
 50bw85KURIfDVav3FlWyhIqDlmDMghn6QAh/5rZlJTbVaOFbdK9pStuZoo+U3ftQMm
 UJ8H0uBt8WLeQ==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/doc: Document KUnit expectations
Date: Wed, 26 Feb 2025 16:34:18 +0100
Message-ID: <174058405678.2761941.17802055074696697829.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250113101100.1373856-1-mripard@kernel.org>
References: <20250113101100.1373856-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 13 Jan 2025 11:11:00 +0100, Maxime Ripard wrote:
> The DRM and KMS frameworks and helpers gain more and more kunit
> coverage, so let's document what our expectations are.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
