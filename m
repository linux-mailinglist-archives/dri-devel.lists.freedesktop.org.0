Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B9323372
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 22:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2046E865;
	Tue, 23 Feb 2021 21:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E6C6E865
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 21:49:42 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lEfYl-0004jo-Qk; Tue, 23 Feb 2021 22:49:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, daniels@collabora.com, hjc@rock-chips.com,
 daniel@ffwll.ch, linux-rockchip@lists.infradead.org, airlied@linux.ie,
 andrzej.p@collabora.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
Date: Tue, 23 Feb 2021 22:49:31 +0100
Message-Id: <161411675671.3338515.9688232276427844069.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Aug 2020 16:26:31 -0400, Alyssa Rosenzweig wrote:
> The AFBC decoder used in the Rockchip VOP assumes the use of the
> YUV-like colourspace transform (YTR). YTR is lossless for RGB(A)
> buffers, which covers the RGBA8 and RGB565 formats supported in
> vop_convert_afbc_format. Use of YTR is signaled with the
> AFBC_FORMAT_MOD_YTR modifier, which prior to this commit was missing. As
> such, a producer would have to generate buffers that do not use YTR,
> which the VOP would erroneously decode as YTR, leading to severe visual
> corruption.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Require the YTR modifier for AFBC
      commit: 0de764474e6e0a74bd75715fed227d82dcda054c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
