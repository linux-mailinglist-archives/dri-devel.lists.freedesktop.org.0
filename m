Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC64FF0C9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041D410E103;
	Wed, 13 Apr 2022 07:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC9810E103
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:49:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6882B8214B;
 Wed, 13 Apr 2022 07:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45B7C385A3;
 Wed, 13 Apr 2022 07:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649836164;
 bh=P3PLLYEnQouhxbXJippcLF+VwcPI1Q2ZMS5OvlaMfyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSteYYZB6AVx6v/PHai0BVgRNkBYhVWJfvdWe1bnv0yrQYkYwgbU07JDTO80e2tyr
 ukdSwYpauO7qtS6AuSZ6eUCUXAXXuypOL5tAV8P7CSuws0dIrAC05YkyiQMtLwMfF3
 Z3DaTjVivkAYgPvCB7RUQ8Vv0KiJew0yDUCVz/ZHIuE/UPi5Fe7qEDmIuD9fxCn1Bx
 nHYsh6i/SxngdHcaEUcTdKkor3uK+CRi5ZSUUii6Fi1yWzP6dbjMjNLzso/nmPh3Dg
 hLrf+P5KU43ovVLVoSf/ZP8Fm2thEpIeCpJyLCNNKNO0G1thbQfdSFHnCibZMScTYo
 HgCAP5grseUgQ==
Date: Wed, 13 Apr 2022 13:19:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] phy: mediatek: phy-mtk-hdmi: Simplify with dev_err_probe()
Message-ID: <YlaAgMk9bIGiMMV7@matsya>
References: <20220328111046.210736-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328111046.210736-1-angelogioacchino.delregno@collabora.com>
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

On 28-03-22, 13:10, AngeloGioacchino Del Regno wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.

Applied, thanks

-- 
~Vinod
