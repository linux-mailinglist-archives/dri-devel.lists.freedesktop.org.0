Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38E92A148
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AF110E177;
	Mon,  8 Jul 2024 11:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zeh9b8w5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2D410E177
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:36:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DA838CE09AF;
 Mon,  8 Jul 2024 11:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA04CC116B1;
 Mon,  8 Jul 2024 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720438571;
 bh=djEATdvrLfFOHBRLttvugLW10qLdbS/+c1WzbURO1LU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Zeh9b8w5/6EWxfakf/fEPI38CHG2pRBs9mkjN/QK88/nDmDusJVViXXQeiI7SBivV
 t6stlhlECzLxbBzBB4nVTGhAWtjgiqCbi30Z1EIFnlh3CQBt89qCkalkBZV5ADdi44
 l4l9xIrQQbaQ8XaSP8Sf7k/GwInjOXkzGJ485sqNIp7Yu+/ggV9p1NmWYB7z4yiWQu
 OudYPeklDpbdWAVy3vMuRSTjOK6OVMjDYCtui0dVu5RzRSp/Nd9rFWfCGMK+AcG9Uz
 PWo1Z4gVUZLqd9wFG9wTEZquVaCOMV6A1W98rFFv8PhSj60u2ucmIeVkxfwUNXC4mx
 ftGK9qKIiWyOA==
Message-ID: <98849e7f439a542f6c42e0dfa01a7a6f@kernel.org>
Date: Mon, 08 Jul 2024 11:36:08 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Carlos Eduardo Gallo Filho" <gcarlos@disroot.org>
Subject: Re: [PATCH v3 9/9] drm/tests: Add test for drm_framebuffer_free()
In-Reply-To: <20240703172228.11166-10-gcarlos@disroot.org>
References: <20240703172228.11166-10-gcarlos@disroot.org>
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

On Wed, 3 Jul 2024 14:22:28 -0300, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_framebuffer_free function.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
