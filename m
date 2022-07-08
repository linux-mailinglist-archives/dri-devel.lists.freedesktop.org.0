Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7056B229
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 07:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461F810E286;
	Fri,  8 Jul 2022 05:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCDB10E286
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 05:14:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B90BF623AE;
 Fri,  8 Jul 2022 05:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3644C341CA;
 Fri,  8 Jul 2022 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657257260;
 bh=W7KkzfO+bktfe4mQFitUfFgnlWNpKQuE4WA0mV6VAQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z19CH3RM1F1xFmBu7O7sWi9TJBOqstLuD68mnp1xnabbPH/lFtAsrH0qBsPxOAUKE
 8K6sQfB+wCNtBZwmEDZUdvaGKP2oCL7YcTnZBZU99q3uhkuSB15NEbNqmP8eE9Qwks
 JlrXKTvKFofUrcO5rbwJiwlrK6trMHecKq8piJzFa+qn18XqiwV8N0DXSGyKeYsrJH
 HtJ+tzeCs/+EjO2kGhJEoSF4iFTmzWQ73hdN7Q9jJEmAWSvT7eo6mdbJsh+v1FVlsG
 0JSBxjcZGMcjykvRykBDGpyA7FCIGNiwahA0EYOq6fGAmwbIpiVrqYiqiCXj94S9OU
 mz0C4zu4PLA7Q==
Date: Fri, 8 Jul 2022 10:44:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] phy: phy-mtk-dp: change mtk_dp_phy_driver to static
Message-ID: <Yse9KMuN96CRrpj6@matsya>
References: <20220707135309.801181-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707135309.801181-1-yangyingliang@huawei.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07-07-22, 21:53, Yang Yingliang wrote:
> mtk_dp_phy_driver is only used in phy-mtk-dp.c now, change it to static.

Applied, thanks

-- 
~Vinod
