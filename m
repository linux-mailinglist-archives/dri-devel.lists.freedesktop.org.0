Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114922F93C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 21:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F2489F55;
	Mon, 27 Jul 2020 19:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487EF89C46;
 Mon, 27 Jul 2020 19:41:12 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B6F820738;
 Mon, 27 Jul 2020 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595878872;
 bh=jwfzkZZ+dhikkWPWuAYwAqFnAlBr9xI48VwoAn7cPEM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eprAtkhsaOlApI71WO6zxt/MtUyHelnF4QlJOxuaux9F3ZxTvsZnN8L0+IpYc6Kun
 mFAinl3/TybLSALrsssS1o4OUVd1N/zMmlc3lpc+qSUE8sMLFezxKOT/u4lt6+hr5X
 8Bj2Tu0XOrQclUmq5CQspf4lIYCVtywrkLBcEg2E=
MIME-Version: 1.0
In-Reply-To: <20200726111215.22361-9-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-9-konradybcio@gmail.com>
Subject: Re: [PATCH 8/9] clk: qcom: gcc-sdm660: Fix up
 gcc_mss_mnoc_bimc_axi_clk
From: Stephen Boyd <sboyd@kernel.org>
To: konradybcio@gmail.com
Date: Mon, 27 Jul 2020 12:41:11 -0700
Message-ID: <159587887102.1360974.16083886481437183810@swboyd.mtv.corp.google.com>
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Konrad Dybcio (2020-07-26 04:12:05)
> Add missing halt_check, hwcg_reg and hwcg_bit properties.
> These were likely omitted when porting the driver upstream.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---

Fixes tag?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
