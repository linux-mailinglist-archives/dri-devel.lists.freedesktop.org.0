Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB297FBF50
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 17:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62ED510E12D;
	Tue, 28 Nov 2023 16:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D86810E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:41:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4FB6ECE1A81;
 Tue, 28 Nov 2023 16:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7944C433C7;
 Tue, 28 Nov 2023 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701189666;
 bh=yu+6XTz4QxpoSP6NjN9BwOG/iZ4IqK6Zn2csX9sKZDw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=frCVKSbLokR0E/yWEjHthOQ5UlvHZYQShO71hpojY5zY019SQpSXQlD1Lknc/m/S+
 dP1EBRA5gM1uYfWBnJgX7A1pNAR0E3TIZqVZWO/DNehoniEtE8lP3wnA5FTCWXtUgk
 fVdFFk+KCGOlJ4biDWc5DKGifK/UV/SMuOF5ioarN0gML+EWOQLIVDfkIvVvYGONzc
 GSvno96lFxxAe4+CfWtf6/rfmlmDI6jbGWHz7FcIP8nQvH8vkO2u7WF9PBcZkQd223
 dqgODnyUF21b+yAdZkuqVxqGYxDgj5mjJKZBYeGvBecqq9Mx/seT4hpsTnWySQFmV3
 Hsk8PSZ1h61JQ==
From: Robert Foss <rfoss@kernel.org>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231123051807.3818342-1-victor.liu@nxp.com>
References: <20231123051807.3818342-1-victor.liu@nxp.com>
Subject: Re: [PATCH v2] drm/bridge: imx93-mipi-dsi: Fix a couple of building
 warnings
Message-Id: <170118966251.1111655.18429253979554815398.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 17:41:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 tzimmermann@suse.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 jernej.skrabec@gmail.com, kernel test robot <lkp@intel.com>, linux-imx@nxp.com,
 shawnguo@kernel.org, kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Nov 2023 13:18:07 +0800, Liu Ying wrote:
> Fix a couple of building warnings on used uninitialized 'best_m' and
> 'best_n' local variables by initializing 'best_m' to zero and 'best_n'
> to UINT_MAX.  This makes compiler happy only.  No functional change.
> 
> 

Applied, thanks!

[1/1] drm/bridge: imx93-mipi-dsi: Fix a couple of building warnings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9f83f37ca76d



Rob

