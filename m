Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C930EE01
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2456ECEC;
	Thu,  4 Feb 2021 08:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FFE6ECEC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 08:08:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E88C64E31;
 Thu,  4 Feb 2021 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612426096;
 bh=DSGc+cN3pkKMpvffVQy2duWfgDyA4dJ72Yyh5aV+ZmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iA3HRQpiZlRZI3UoewYuBcvSKIXBbIkc2GCrtw5KQ6or7oxrpPAuCyX3rrhWCghZx
 7swPR9FPU+zM2FTTnTTqK41pPCLqeMooWDq7C20XVEEzw4wVF2LxIHqwfvAum0Yfll
 Ou+xYWTlNVdF0+c11GIgcvWDknzkEuqYoUsyI9HjYTsTbMiAFQOvyOYVx/dZ0Un2DE
 cEMBYCKLJLDl4+DXb3wfChvi7TW7WWbk3rqs1/0SelDVh4f0J1XxZZh5g47u8Iaop+
 yvj0999T2+Ye5SNa+HZIaz5uENYt//0mL76rn00tLHajTYW4z8sMYzrrJYyT3Zhtzr
 iW5mRrVC3pi/w==
Date: Thu, 4 Feb 2021 13:38:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] phy: mediatek: Add missing MODULE_DEVICE_TABLE()
Message-ID: <20210204080812.GO3079@vkoul-mobl.Dlink>
References: <20210203110631.686003-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203110631.686003-1-enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03-02-21, 12:06, Enric Balletbo i Serra wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> This patch adds the missing MODULE_DEVICE_TABLE definitions on different
> Mediatek phy drivers which generates correct modalias for automatic loading
> when these drivers are compiled as an external module.

Applied, thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
