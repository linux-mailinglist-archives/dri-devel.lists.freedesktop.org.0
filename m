Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E934DD30
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281A6E5BF;
	Tue, 30 Mar 2021 00:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E282E6E5BE;
 Tue, 30 Mar 2021 00:46:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F61F61987;
 Tue, 30 Mar 2021 00:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617065193;
 bh=FlzjDQTzeSqpQF17Su/mWXUHWaR1+TgEbGUw4A4RPSk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JRHOg3HgOGka3vR0C5Wr4RK5C7P5uCGuwi283HZ/0/L4haG52BBO1lbU7dOR33HoW
 F54XmKPR8cM0RESdr+UXLLkmKT4xaRlxN9+KAwDaFPLDf0IlTw8nXhmS+doqPHZJLJ
 ZtYbgYsu/faE8KA7e8zQNAmwCKyIl32QE8+xFlp2sUm59MxGDhrAfzo9Nl91FjMxnR
 v7ZC+VDBU85cT7J5cXsyM087YFvXgrjCOMNZb39wS/n0xe4RACGj0i7VnrSKwQComy
 tlk4+a7V+fBREpeUCdjXV6ub/OI25mWwD86bM4zZdZZXjnTk4rLxA2ENlqLH0paWRR
 wP+3u+tfwsW0w==
MIME-Version: 1.0
In-Reply-To: <20210327110305.3289784-4-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 03/25] clk: divider: add devm_clk_hw_register_divider
From: Stephen Boyd <sboyd@kernel.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 17:46:32 -0700
Message-ID: <161706519228.3012082.3104809310968030487@swboyd.mtv.corp.google.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-27 04:02:43)
> Add devm_clk_hw_register_divider() - devres version of
> clk_hw_register_divider().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
