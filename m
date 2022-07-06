Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C971568FC3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 18:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC34511BC4A;
	Wed,  6 Jul 2022 16:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E62711BC4A;
 Wed,  6 Jul 2022 16:54:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A63AB81E31;
 Wed,  6 Jul 2022 16:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA11CC3411C;
 Wed,  6 Jul 2022 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657126451;
 bh=9r5Y9Yn5s5SAzlP+sF4PprOxv81oeve51QeGRGMHl3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DP/6QUw9yVcsXxyrI9IVW/i4PPosw0gBm+2nyH29CspyjWHF7iPLLrXINnbLamU2o
 oVyq0Znp9zaWZxjd9bSsNkqFJneCj3BYL02kUWWWkSb4klpnHljPlkC63E07HRhvxW
 72321dZ7DBeTjIFMmZiYg1oQ6g7Gq8tEijYnAUu0cmU/SQvFfRrQjXaz17+OoT4y/y
 mkdN4Az1sZvKkvu8hyEuEFVbkbPA/hQroF1OxuUXILgYam70XyMLQmPLRxz+6qsRQD
 qxp9rnV78YSEoGGZpudfCCuRPvL90larrBIv7ri0hqvuUDuBHsVMskrSi5cdA9NVyr
 5AyFTSk7xEeYg==
Date: Wed, 6 Jul 2022 22:24:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <YsW+LhSuOUFeuFFc@matsya>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05-07-22, 09:29, Kuogee Hsieh wrote:
> 0) rebase on https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tree
> 1) add regulator_set_load() to eDP phy
> 2) add regulator_set_load() to DP phy
> 3) remove vdda related function out of eDP/DP controller

Applied, thanks

-- 
~Vinod
