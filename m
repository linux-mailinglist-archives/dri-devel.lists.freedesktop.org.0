Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB57D5BC7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B4710E4A7;
	Tue, 24 Oct 2023 19:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B558E10E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:48:33 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qvNO9-0007MI-0s; Tue, 24 Oct 2023 21:48:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Andy Yan <andyshrk@163.com>,
 jonas@kwiboo.se, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/4] Add more format for vop2 driver
Date: Tue, 24 Oct 2023 21:48:25 +0200
Message-Id: <169817682321.1800793.10899847189695496583.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018094122.2475668-1-andyshrk@163.com>
References: <20231018094122.2475668-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: s.hauer@pengutronix.de, sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023 17:41:22 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> This is a preparation for the upcoming support for rk3588 vop.
> 
> Patch 1 make the bpp calculation covery more format
> Patch 2 remove formats that are unsupported by cluster windows
> Patch 3 add more formats
> Patch 4 is a format table rename
> 
> [...]

Applied, thanks!

[1/4] drm/rockchip: fix vop format bpp calculation
      commit: 45ad07c7053df0b67e13d8deb574920d11651fb2
[2/4] drm/rockchip: remove the unsupported format of vop2 cluster window
      commit: 01d5a75370a60c3a8d691347ae6ebb2a9f8dc44a
[3/4] drm/rockchip: Add more format supported by vop2
      commit: bfd8a5c228fa3bb97884f77529c09e8745da08b9
[4/4] drm/rockchip: rename windows format for vop2
      commit: 215737e37d07ade8952048339e37aec6c6f82223

I've adapted the patch subjects slightly to match the current
  drm/rockchip: vop: ...
  drm/rockchip: vop2: ...
formats.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
