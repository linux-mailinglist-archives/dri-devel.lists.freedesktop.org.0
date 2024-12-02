Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98C9E01E3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3546510E23E;
	Mon,  2 Dec 2024 12:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GNycZkH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146C810E23E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 12:17:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7FB355C6494;
 Mon,  2 Dec 2024 12:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90539C4CED1;
 Mon,  2 Dec 2024 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733141862;
 bh=N5BShtDaTXiGIyNsApUTEXZ0WOnJAwkV46IOmrzODBQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GNycZkH1NmKWUx1abHZk5OUYfLA5IutziKuCfc+0jHjziFi9cyda5qdJ0FFrxmDBD
 VNnG907BwCWL+rToL+6k+XB31f/pDowaTjbZPV6ckKN1eFEwkBQheo71U5UvDdafuf
 Z2fvKy420M2wCbjhQajDtZKdMBoTORjlfQEW4jiAKVn2RugiZ26vhjhLLYO9MsvscD
 d+mIj6XV7ms4EyxHfnneJhmacq3LIH5KG2KlJOe0SdDYG3u6M11Vi7NvQC2lRcIRJl
 VGK85vScCZRevTRBSULp88gkqNbUksA+x193CpugiN5XSzQf4xHOEW6nqz1j7ApNCL
 EiV0Sk+cjaDwQ==
Message-ID: <2f7eec0d4a9b99243e500d03f12cd869@kernel.org>
Date: Mon, 02 Dec 2024 12:17:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Stefan Wahren" <wahrenst@gmx.net>
Subject: Re: [PATCH] drm/vc4: plane: Remove WARN on state being set in
 plane_reset
In-Reply-To: <20241202120343.33726-1-wahrenst@gmx.net>
References: <20241202120343.33726-1-wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Mon, 2 Dec 2024 13:03:43 +0100, Stefan Wahren wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> It is permitted on situations such as system resume for plane->state
> to be non-NULL, and that should be handled by freeing it. Do so.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
