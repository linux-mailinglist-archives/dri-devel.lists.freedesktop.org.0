Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F88AF5FAC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 19:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228D910E065;
	Wed,  2 Jul 2025 17:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MZ9RcvdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3430C10E065
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 17:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F1EB7A4C759;
 Wed,  2 Jul 2025 17:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130EFC4CEE7;
 Wed,  2 Jul 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751476551;
 bh=MvrKqU9KXRVMqW4wYVRfFpUOXGEDg+T9aX7yo71XcrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZ9RcvdQOreMvSgDQRdVOEc/3VFScLsnmhwqM/sa66bIpvbg3w1OV8quHFH0LNOoB
 8FB/kdxkY6aDGF+O/uTnDyUWZVrlDyfq/qNztceUP0tY6uIYbOwi0fSIuszRSCrdzG
 QDzzB0LlXvYk1jazJvoITjrYUJfKwNCJSk97GM3O2TstHMJZio4EWnJO849WI7F9RO
 ULDfzU7qYCzxNDwwsd/zKqS0TNDWvyGZ+hemOL7S+sw2LuEnJRW00f4KV/rwvU9sJd
 aw51UzEocEFbb8N3yvhs28mzsG+HFmuKRJwCtE+QjYr62LYG138yA36eL+aA/KYhZW
 Z5PLvkvXx/Yag==
Date: Wed, 2 Jul 2025 19:15:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
Message-ID: <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Clement,

On Mon, Jun 30, 2025 at 02:55:15PM +0200, Clément Le Goffic wrote:
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.

same here, I don't understand anything... you could have written
"do some coding" and it would have been the same :-)

Thanks,
Andi
