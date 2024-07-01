Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992E91DE76
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 13:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E5C10E3D4;
	Mon,  1 Jul 2024 11:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KgZCqsL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EF510E3D4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 11:56:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92A2061176;
 Mon,  1 Jul 2024 11:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6602C116B1;
 Mon,  1 Jul 2024 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719834970;
 bh=jk4Ur8kgOgdTRffXLoK4m5pQy6C2aYGYVeyuE0CelgY=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=KgZCqsL1DiMNECEbGq3WeGMHn3qfpmyGshkUUBoWJa0QeJ8prZNmlDFMdUZoud5J4
 eM1HQYPukbWARdI9T4U6Tv/rRbs3iFYkLLbw6h9OolMrR2ugqoDbKIODwjfqAoxSQL
 DRbFTRvptM1fi60QFgZhu5mql/qGlthWKJdX035w/ftlU1/DWGEci1Zpsb8xkwC7M8
 wRL9bTYuBlzvBzNtIvN87dNc8bBvZAyfkumEsUOS1a3qB/8vlWueRpL7Ny75hWgO+T
 +jm3//HiUXG7rzLVHRg0Q7+nOEIfjy/14GcbREXYJOQ4ulmF1WPfg4uQ/6AbCLo2r9
 jxjm5u/ALu61A==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20240620110947.3615207-1-dave.stevenson@raspberrypi.com>
References: <20240620110947.3615207-1-dave.stevenson@raspberrypi.com>
Subject: Re: (subset) [PATCH v3] drm/tests: Add tests for the new
 Monochrome value of tv_mode
Message-Id: <171983496770.3743527.102946784589756787.b4-ty@kernel.org>
Date: Mon, 01 Jul 2024 13:56:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Thu, 20 Jun 2024 12:09:47 +0100, Dave Stevenson wrote:
> Adds test for the cmdline parser, connector property, and
> drm_analog_tv_mode to ensure the behaviour of the new value is
> correct.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

