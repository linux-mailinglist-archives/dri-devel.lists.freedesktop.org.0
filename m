Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB890C53E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDD610E5C8;
	Tue, 18 Jun 2024 09:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pqUD+Iau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACD710E5C8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:20:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F00D761177;
 Tue, 18 Jun 2024 09:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54202C3277B;
 Tue, 18 Jun 2024 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718702410;
 bh=0zQahFTJIiz3MtV1u/caoNng9lvqdIzFrhtVawQXW2Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pqUD+IauzrV4b1DDwZsKcEDmKqv8sXk4AdTYZfayqW9mRkVBYcYP2KXM7/UQElVar
 I31FBt7VLldf5vPxW7nxSUAqLBBSfihE7fBiNh//Y7fQ8qwLQeQN34IxeutB3e9GL8
 anMdl+CxRL4PiM2ShU24+uP6CxGFEQiYyE9GYz7i0enFcwwU+mIFgyTgUh00pYpdPc
 q2xPw0H0sPgAo5m7rTNaftO7mV4E16HmE9QkgO4IqCdw06TZZ1aGcZnnKhpavelpps
 8uQ7yg3Yn8+3BNdAgxmkH+gq3E/yCidxB9lu8mrYgK/8kUfpOb5iMZaInEvLIsgOyp
 Wma51ZXvuxjtg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
In-Reply-To: <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
Subject: Re: (subset) [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-Id: <171870240808.3014195.5437634452525657588.b4-ty@kernel.org>
Date: Tue, 18 Jun 2024 11:20:08 +0200
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

On Fri, 16 Feb 2024 18:48:55 +0000, Dave Stevenson wrote:
> Add this as a value for enum_drm_connector_tv_mode, represented
> by the string "Mono", to generate video with no colour encoding
> or bursts. Define it to have no pedestal (since only NTSC-M calls
> for a pedestal).
> 
> Change default mode creation to acommodate the new tv_mode value
> which comprises both 525-line and 625-line formats.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

