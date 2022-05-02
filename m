Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764F517A6D
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 01:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B191D10EE0F;
	Mon,  2 May 2022 23:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4686910EE22
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 23:07:29 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nleSg-0005bu-0w; Tue, 03 May 2022 00:24:10 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: vop: fix possible null-ptr-deref in
 vop_bind()
Date: Tue,  3 May 2022 00:24:06 +0200
Message-Id: <165153020898.255051.10275204034959482615.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422032854.2995175-1-yangyingliang@huawei.com>
References: <20220422032854.2995175-1-yangyingliang@huawei.com>
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
Cc: hjc@rock-chips.com, markyao0591@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 11:28:54 +0800, Yang Yingliang wrote:
> It will cause null-ptr-deref in resource_size(), if platform_get_resource()
> returns NULL, move calling resource_size() after devm_ioremap_resource() that
> will check 'res' to avoid null-ptr-deref.

Applied, thanks!

[1/1] drm/rockchip: vop: fix possible null-ptr-deref in vop_bind()
      commit: f8c242908ad15bbd604d3bcb54961b7d454c43f8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
