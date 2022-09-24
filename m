Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B788F5E88BB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 08:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7700710E1D1;
	Sat, 24 Sep 2022 06:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474E610E1D1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 06:28:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2A9FB80064;
 Sat, 24 Sep 2022 06:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E408BC433C1;
 Sat, 24 Sep 2022 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664000901;
 bh=13hcAswE3/w5gxNu2/Ksn2qrnXkSsfzErgmHm7xxrQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGdBa86rzljLx7cjzepoilpeBg3XmKvRNAw28AALpCf6Qk/7FWeV3Nw9qlOBqHThk
 2Uii+Yu7WhDAoDKeVxYIObjTalaTstgk1Xdv26p8Y7NlSqimtN8paEyOuSbpDNGgpT
 veWfBuPHzR0m7KhFhjO8dTxVvyPdIRQ+cTFUQ6jQ/NEEV+8x1x83H7HFqst+Fi505/
 eaE0h824Xm2UaGMHjOXMvdaRTlafhEyvT6qotgokzmvekti0s0EsNUEG1xGbpMSrwJ
 zloX68w2JN2yOSm5+WQ597Ei+2SrgavhVTxQKmEYKINYo4QxLy0usY145FGO/rYMQn
 O/q7FzEa+tv6Q==
Date: Sat, 24 Sep 2022 11:58:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 00/18] unify register access and macros
Message-ID: <Yy6jgYXSawkaAMxv@matsya>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20-09-22, 17:00, Chunfeng Yun wrote:
> No need to define new macros to generate bits, mask and bitfield, use
> common ones instead, e.g. BIT, GENMASK and FIELD_PREP etc.
> Due to common register access helpers are defined for MediaTek's phy
> drivers, the similar helpers defined by ufs, hdmi and mipi phy drivers
> can be removed.

Applied, thanks

-- 
~Vinod
