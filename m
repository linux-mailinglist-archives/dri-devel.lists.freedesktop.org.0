Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A774A34DD2E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE68D6E5B9;
	Tue, 30 Mar 2021 00:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9866E5B9;
 Tue, 30 Mar 2021 00:46:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D488961987;
 Tue, 30 Mar 2021 00:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617065185;
 bh=51KJqQT9waX5629FhQj8t3xATmC1WcOmQRRe6U6ghU8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MseyEBQpjeqZpED+CwD57ZN5jYm6+0SrEGGhHvW3fUP2SOOqDR/eh5uGZVVYpIyFq
 w+p6bLb4nb8Gy12Mh3w0n8W+mOkBSf0RHwvXlYTklGPK39tB/koAUD42qDXHB4bfHj
 wh3wraSeKTefFHqlZ9P8GLtompSgVwdp/OVlQ2MZIknOH5vitkj9tgBoFsLiVh2PKL
 RCWY/JOMTVjA2RrbMoqzUl7w2Py97EsZz5ODOliEI4DZJDMKxe+9OYn4xaQtzutx+b
 ttON/oL0fABLdBYHAO8an1kPWcL/UIdVCbtyWrYoiZCFnQ7AdYBzx0iE7PY38kB0lV
 ZigPfrPULC5bA==
MIME-Version: 1.0
In-Reply-To: <20210327110305.3289784-3-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 02/25] clk: mux: provide devm_clk_hw_register_mux()
From: Stephen Boyd <sboyd@kernel.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 17:46:23 -0700
Message-ID: <161706518350.3012082.6757627448543126043@swboyd.mtv.corp.google.com>
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

Quoting Dmitry Baryshkov (2021-03-27 04:02:42)
> Add devm_clk_hw_register_mux() - devres-managed version of
> clk_hw_register_mux().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
