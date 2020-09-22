Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9284B274923
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 21:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627D56E8D9;
	Tue, 22 Sep 2020 19:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FAC6E8DF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:29:49 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9E5723787;
 Tue, 22 Sep 2020 19:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600802988;
 bh=zGDpR400lF8sS+w2f5hNi8KhZtffSJpAzGWhfrD8OzU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=bS+Rzkl43sz53wzidHx/oul/Rhydw005z61pTAmsKzJZLANOqk+N929owXUth8KWt
 sFVFLqKdtb7vAC6D9IEizNy54CsCkl9gHvg3Er3icxdOCwjOGkMcuPbk2ncdYgdtgV
 txPA8ow67vjJcEKEXqyhK1RWO2ouOpc6/nieqPzk=
MIME-Version: 1.0
In-Reply-To: <20200901040759.29992-2-hoegeun.kwon@samsung.com>
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
 <CGME20200901040851epcas1p28f443c0e819bea756ebf9296491b32da@epcas1p2.samsung.com>
 <20200901040759.29992-2-hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2 1/4] clk: bcm: rpi: Add register to control pixel bvb
 clk
From: Stephen Boyd <sboyd@kernel.org>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, dave.stevenson@raspberrypi.com,
 eric@anholt.net, maxime@cerno.tech, nsaenzjulienne@suse.de,
 stefan.wahren@i2se.com
Date: Tue, 22 Sep 2020 12:29:47 -0700
Message-ID: <160080298755.310579.12537322885845907147@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 hoegeun.kwon@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hoegeun Kwon (2020-08-31 21:07:56)
> To use QHD or higher, we need to modify the pixel_bvb_clk value. So
> add register to control this clock.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---

Applied to clk-next
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
