Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C037AD20F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5AA10E212;
	Mon, 25 Sep 2023 07:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15FA10E204
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:43:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2E93EB80C63;
 Mon, 25 Sep 2023 07:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B70DC433C7;
 Mon, 25 Sep 2023 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695627829;
 bh=myK966qEnI1fuOXxADF5RQjS2NfbvQRXNNgyejzLHj4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=UiCDSEHjLXz/jLtBbfWl5B4S4Ym9uBq6RwMJ2p0h2hAqwrzdaoRMdzJVQFpLaCY80
 /GVuxtcqij0XH/qOz/JOQysqGiraJ7Iun7zmySqKQQO6gta7tnHaWYvtJqchzYCm5+
 35e3OF1s2aAadcVaMtGl1/8S/1weII6ctTObE2d8J/glGGmqR0bFo4JoGkJk2iWFXv
 wInst2oS4ylO5cRscPZCJOFj8BTtLV+/ORMNPRdScKBJqx1kVG+KVFXhS8aYDPKhE3
 nLAPggpGza2ITIDwdAMZ3YdlwlWgj3DCOFS+d1Zfw9LNePzjnsEQEPv/YC5hUU+Kt/
 KL3lZRS39smWQ==
Message-ID: <42011ce6616bfb7bda5337a94c19b287.mripard@kernel.org>
Date: Mon, 25 Sep 2023 07:43:46 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/7] drm/sun4i: dw-hdmi: Deinit PHY in fail path
In-Reply-To: <20230924192604.3262187-2-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-2-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, Maxime
 Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Sep 2023 21:25:58 +0200, Jernej Skrabec wrote:
> Commit 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform
> device") removed code for PHY deinitialization in fail path.
> 
> Add it back.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
