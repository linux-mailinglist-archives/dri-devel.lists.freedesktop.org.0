Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB2487680B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 17:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CE3113907;
	Fri,  8 Mar 2024 16:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LVF0VGlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10DA113908;
 Fri,  8 Mar 2024 16:06:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 141F160A29;
 Fri,  8 Mar 2024 16:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392E8C433F1;
 Fri,  8 Mar 2024 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709914014;
 bh=+kT+LKzEIymv4y/wM+gEVzBr/mCfK8gGTjkP7tWhr9c=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=LVF0VGlG1061t1NHUMFhUvn1aqkY3oX3lu5ssXZlw9gBJRCYP65opx6CXz9ePNrWQ
 ezLqUKcO/fy6qJulTZzLIg+B8LHgwCcihiGnLV4YFA1DZMDYYZGfDQIB8HGil+vElA
 scsFxwem4DTjCIqhAHWtatL8cYWuLhp7acU5IrBrTkLOFXO7hictjvlfwQr7tYtC/n
 Wi15kyKopbjlr17urUwfpXr8QvirN7/YwnLSb9zPdCpN3ZZ8wv9LImIKr5ErE3gaLw
 sD6d/o1Z37DCMqG0Phf4Q1FJ14jjX50dXnW1h+wBvKdT4/lSo89SZrPiXc3KN2UBLJ
 G8RopOccX1zuA==
Message-ID: <86f312eade9ce0b6a07840b509ed1399@kernel.org>
Date: Fri, 08 Mar 2024 16:06:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 6/8] drm/vc4: hdmi: do not return negative values from
 .get_modes()
In-Reply-To: <dcda6d4003e2c6192987916b35c7304732800e08.1709913674.git.jani.nikula@intel.com>
References: <dcda6d4003e2c6192987916b35c7304732800e08.1709913674.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@intel.com, stable@vger.kernel.org, "Maxime
 Ripard" <mripard@kernel.org>
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

On Fri, 8 Mar 2024 18:03:44 +0200, Jani Nikula wrote:
> The .get_modes() hooks aren't supposed to return negative error
> codes. Return 0 for no modes, whatever the reason.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: stable@vger.kernel.org
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
