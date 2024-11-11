Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDC9C43C2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 18:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FBA10E4E6;
	Mon, 11 Nov 2024 17:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oCviVRaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF710E066
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 17:36:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D5845C5B9B;
 Mon, 11 Nov 2024 17:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7490EC4CED5;
 Mon, 11 Nov 2024 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731346582;
 bh=7ZuQcxLz5pl9W6DLTEKLbTc1I8ZYogcj503IJ/oZocM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oCviVRaHa5G3xR/xTjLHXJWpPSIwj1ZhBWtuXEZ9YVOItkIlWDQPTboVbEm8qznrz
 1Hfa7bNFFyhVLoMCWu1KuW5jnnY8+XrEpO9zht9C3VJpToUxYb0HQDfdRJfpyGNyX5
 KHJviXZ8UdKKyeFM8F7yMC46cEKq0z5UzUAv9kzScWR51pjmFBGTqG8gz4scBkRYY4
 YklTmpg6xjclTGFRg1XbxirIlg34A+3sLsNZTfzDo7bDI4NTJUQWjBefAHvitGInz7
 9xSiMzYkv39Gkkeoy4R+b+6sZ9NnMotCcWO73iTw17/90XIgpNqBdsCrR//OWDs1e0
 fcqI0Eal+fQkw==
From: Robert Foss <rfoss@kernel.org>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 linux@treblig.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241005232017.305217-1-linux@treblig.org>
References: <20241005232017.305217-1-linux@treblig.org>
Subject: Re: [PATCH] drm/bridge: cdns-mhdp8546: Remove unused functions
Message-Id: <173134657901.654843.2640866407787013964.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 18:36:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 06 Oct 2024 00:20:17 +0100, linux@treblig.org wrote:
> cdns_mhdp_hdcp_set_lc() and cdns_mhdp_hdcp_set_public_key_param()
> were added by commit
> 6a3608eae6d3 ("drm: bridge: cdns-mhdp8546: Enable HDCP")
> but never used.
> 
> Remove them.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: cdns-mhdp8546: Remove unused functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d84927a4ad92



Rob


