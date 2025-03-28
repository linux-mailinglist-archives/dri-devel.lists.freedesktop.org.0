Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C47CA74C35
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE3910EA2C;
	Fri, 28 Mar 2025 14:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OSPG60e+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCA410EA2C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:15:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4841844975;
 Fri, 28 Mar 2025 14:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD4C4CEE4;
 Fri, 28 Mar 2025 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743171347;
 bh=pXfI8v0neVovdgH7g2pz1hEWDgarsRQ6GMXto38uxUA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=OSPG60e+ka7zEkpeCaQ+X3HP/LmC89ffbxDX4y2TuXz3Gr1FuUa2gNJeXXBGDtD92
 Khb14GsTM5RQrRrcLi8ALgBfUc/CegU3x5ybHMoONCGqHIyWtFFMom0Bb2ApzllXAE
 0RRUfPApQxGc0AnCZ+kUJ/LUuiI+foRYS3YHmCerdtslWgqkMrT/vKY520FK1aNfNs
 LUdysLbOYxihdCnE+ZxBuXeZD3ZxrwwjRic1zXEREw0wIeXqKTdqSerwZXf5LIN5cV
 PwGJUwAIvXEF7jKqL//SCbbGFK4SDT1HKerX38R6yJ0JY/2a+73FZ5AO7c0G8IQV6m
 G+C4cE/ZGMQ5A==
Message-ID: <81402cf28073bd01aebc58a6cad1b656@kernel.org>
Date: Fri, 28 Mar 2025 14:15:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Raphael Gallais-Pou" <rgallaispou@gmail.com>
Subject: Re: [PATCH] drm: of: fix documentation reference
In-Reply-To: <20250328114148.260322-1-rgallaispou@gmail.com>
References: <20250328114148.260322-1-rgallaispou@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Fri, 28 Mar 2025 12:41:48 +0100, Raphael Gallais-Pou wrote:
> Documentation/devicetree/bindings/graph.txt content has move directly to
> the dt-schema repo.
> 
> Point to the YAML of the official repo instead of the old file.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
