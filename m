Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 507E774E828
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7510B10E326;
	Tue, 11 Jul 2023 07:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DCE10E326
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:36:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA32E61354;
 Tue, 11 Jul 2023 07:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D294CC433C7;
 Tue, 11 Jul 2023 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689061017;
 bh=sp9FUz7vFWMOXim7BOi9FhfXePdR8iwcHRlNLjmbrE0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o+KWj9bXmQa6HfWyip5V0qnUuXxShVLYk5hJdPLFMtnIUrLDrJNGA3OoPRiDgXTo3
 8FLQU5yRGDau/XKm0ZH75oQzVIYnmb3fo19Gl5s3xGoxgEXTHVDYPrzPLuUSt/q+9Q
 e/iSLt9vgfmnvBblKjaVQWM3iSHxXvTYglKEHMwglEsiW0ZdNudN+fAts5ARukzu2E
 RYWhdZxjxt5mGhE00CK34425ADah9caNJ1RVpLS3DC08xZz9lARxQ629iUtCs7LuE5
 2mjaY0lCjRz2MqsjDCdwolr2zwa/evxOVdRKjdU1X/cC/LKG/NN4Q7yVsTPtc27QHI
 SjiMhH5BwXtFQ==
From: Vinod Koul <vkoul@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Message-Id: <168906101241.188690.9773925204562641483.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 13:06:52 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-phy@lists.infradead.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 11 Jul 2023 09:13:25 +0300, Dan Carpenter wrote:
> Negative -EINVAL was intended instead of positive EINVAL.
> 
> 

Applied, thanks!

[1/1] phy: phy-mtk-dp: Fix an error code in probe()
      commit: 03966c3950d36d6b671158be3794eb7211434faa

Best regards,
-- 
~Vinod


