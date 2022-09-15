Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA71C5B9C22
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F01310EB27;
	Thu, 15 Sep 2022 13:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C7210EB24
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:40:19 +0000 (UTC)
Received: from [89.101.193.72] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oYp6E-0004w0-5I; Thu, 15 Sep 2022 15:40:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Tom Rix <trix@redhat.com>, airlied@linux.ie, hjc@rock-chips.com,
 daniel@ffwll.ch
Subject: Re: [PATCH] drm/rockchip: remove vop_writel
Date: Thu, 15 Sep 2022 15:40:12 +0200
Message-Id: <166324919922.172360.17550156520771628477.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521190716.1936193-1-trix@redhat.com>
References: <20220521190716.1936193-1-trix@redhat.com>
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 May 2022 15:07:16 -0400, Tom Rix wrote:
> cppcheck reports
> [drivers/gpu/drm/rockchip/rockchip_drm_vop.c:186]: (style) The function 'vop_writel' is never used.
> 
> vop_writel is static function that is not used, so remove it.

Applied, thanks!

[1/1] drm/rockchip: remove vop_writel
      commit: 98a65e6d498c46b0beec7a40aac4b3e404642993

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
