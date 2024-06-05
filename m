Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4008FC6AE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6110E61B;
	Wed,  5 Jun 2024 08:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s2zu/Ail";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B810E61B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:38:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 05D0661714;
 Wed,  5 Jun 2024 08:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62777C3277B;
 Wed,  5 Jun 2024 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717576715;
 bh=uWp6C8dLCKrl/1so+COi1njOJkyzDxFshilr2A+ZCU8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=s2zu/AiluwSVpcwMnEpywgUafSlpJD3qWTjCL6YNTSvVKPzjcSmw1IF45/ocKIbpG
 rOSAoDp2w0tEDDT0LUAbTPBAVF0mgDQCFym9yOZ7Kf/yk3gjTthuYhrl45baBfhkdB
 a3JbTiedxxVNGwfY4U3gNJB53iWyoM23yVgq64WeEwkQRDPHdyjAQ7x50wJvI8DTas
 lXMgkxSwjvQR5in8otEuXIq6e7u51cZ6geLut+fYYUSTNITVnrfkbip6/TECqCogtd
 AI3XIC5SrfeeiG7fV+fm5MswQz2MiEeueL6ablp0m4sOCV8W+o/uDHOKZfC5eRDMdk
 GnZgTEk+N5R9Q==
Message-ID: <311a676635a378fc18334923a393be22@kernel.org>
Date: Wed, 05 Jun 2024 08:38:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/mm: Remove unused drm_mm_replace_node
In-Reply-To: <20240604175438.48125-1-rodrigo.vivi@intel.com>
References: <20240604175438.48125-1-rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, "Maxime Ripard" <mripard@kernel.org>
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

On Tue, 4 Jun 2024 13:54:38 -0400, Rodrigo Vivi wrote:
> Last caller was removed with commit 078a5b498d6a ("drm/tests:
> Remove slow tests").
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
