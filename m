Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9422F947
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 21:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB180893A7;
	Mon, 27 Jul 2020 19:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F348932B;
 Mon, 27 Jul 2020 19:43:17 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F32E920738;
 Mon, 27 Jul 2020 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595878997;
 bh=/To1bGg//yXUv80zECnKNVHystAZpMAISTzkS6dglsc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=I9dg0M8aTJjKRMjV5TTNi2hH9vKBQw6u83K9gtXJYOSWWh/9i/sGak9fE0BXyU8QM
 3X90QJB7405C3qIiTs4PiBilneNCOCOh8YtOCYKR7ee2Vr7T9ZgYqrp7Y83LwRM+nf
 TZmHjGuxug1RcT+vvL9PScmlk9AC+EyvwMnv2eAQ=
MIME-Version: 1.0
In-Reply-To: <20200726111215.22361-2-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-2-konradybcio@gmail.com>
Subject: Re: [PATCH 1/9] clk: qcom: gcc-sdm660: Add missing modem reset
From: Stephen Boyd <sboyd@kernel.org>
To: konradybcio@gmail.com
Date: Mon, 27 Jul 2020 12:43:15 -0700
Message-ID: <159587899589.1360974.4403082749390843157@swboyd.mtv.corp.google.com>
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

Quoting Konrad Dybcio (2020-07-26 04:11:58)
> This will be required in order to support the
> modem upstream.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---

Should have a fixes tag too.

>  drivers/clk/qcom/gcc-sdm660.c               | 1 +
>  include/dt-bindings/clock/qcom,gcc-sdm660.h | 1 +
>  2 files changed, 2 insertions(+)
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
