Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C94FF0CB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B994910E3BF;
	Wed, 13 Apr 2022 07:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A634E10E3BF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:49:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A2EA6159E;
 Wed, 13 Apr 2022 07:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAA4C385A6;
 Wed, 13 Apr 2022 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649836177;
 bh=U5PFHPlUvPZnKkFDVh2DWWPvU8ylQUClBVWmpgIeQN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIcN8dEbQPD4AXASMcF4KWt3uc1Wf8dkf0NVKB9SbSj8GBbWjMiXP0nYBKSlWmr1t
 UMIZxQl++1jqmr/cWNew75zE2zGbuxWPjFXsgM/oP86tLlFaDhvM9I/iIToWLqhxc2
 8uM8fFrxHGe/cqM7P/0y41lPctHsEV7pB5PIMjnxHEKTIi3lG9cE1/YWF09HLQwTyx
 /e2b8jQplvbZUHXSNBO1LeXcvu29+mLBR+A22h513FNlCe3/qPxoDekFebfVEZ0DUs
 EnOAF9zEE4xHze8pbAcjj/WCry/rkyGEh9a0z6syhYNvi2IDk1g+jCjkpKoAc4AdpO
 jmuivhSio3W5Q==
Date: Wed, 13 Apr 2022 13:19:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] phy: mediatek: phy-mtk-mipi-dsi: Simplify with
 dev_err_probe()
Message-ID: <YlaAjXmwFB6eRNnd@matsya>
References: <20220328145217.228457-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328145217.228457-1-angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kishon@ti.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-03-22, 16:52, AngeloGioacchino Del Regno wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.

Applied, thanks

-- 
~Vinod
