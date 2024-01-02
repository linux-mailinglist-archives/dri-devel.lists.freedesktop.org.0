Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D43821B5F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 13:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666EC10E013;
	Tue,  2 Jan 2024 12:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDBB10E013
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 12:06:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A68261024;
 Tue,  2 Jan 2024 12:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30A4C433C7;
 Tue,  2 Jan 2024 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704197169;
 bh=RjGBcjf2WnDO8gTecGZDGCscwBlhEoV+pOm7c9RsNWE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=b3ogwWrgBGbpgYhdl2IL3yCqQe1RqKvAebabuzb697FBvFUGUiDGSRl9XlBBdklao
 tmZXJJUYdIYYEtf4TTwFxUjRiQB53NxOSEDx0aGwWpZ78CC4c2IP7a+OFVMsgb0Af5
 gL9eq5QQGtBq2GVxC4QiQ2XPygz7W7VXKbBahbVqt1VIxRHw9iAxKqfJLQB4scMSQx
 qQwyjU36KWKhYoCt8Ab63d2C/O5u4j72A5aSP2PZKu18gp/8GRMMM2WVBrAGsy0OXl
 WOINOJqRgvTlOLdF7mZ7sG8GAf2xX8u7wmoZBF4YeWcMGNcYzZO9woptS14skgtj/D
 sDGRx7axDEVbQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
In-Reply-To: <20231216141518.242811-1-contact@emersion.fr>
References: <20231216141518.242811-1-contact@emersion.fr>
Subject: Re: (subset) [PATCH] drm/vc4: plane: check
 drm_gem_plane_helper_prepare_fb() return value
Message-Id: <170419716683.43378.18407371192904693817.b4-ty@kernel.org>
Date: Tue, 02 Jan 2024 13:06:06 +0100
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
Cc: Kees Cook <keescook@chromium.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Dec 2023 14:15:27 +0000, Simon Ser wrote:
> Bubble up any error to the caller.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

