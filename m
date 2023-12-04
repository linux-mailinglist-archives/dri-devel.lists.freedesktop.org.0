Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBE80368F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8A210E263;
	Mon,  4 Dec 2023 14:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEBD10E263;
 Mon,  4 Dec 2023 14:27:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA55C6116C;
 Mon,  4 Dec 2023 14:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D024C433C8;
 Mon,  4 Dec 2023 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701700048;
 bh=iTFfJWlVyVd40bRiM1AFzumUzQtTXVFumdktfECzhMY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=qeXekkRv92r8qCLjoELFNMe1SrBuRQi7VtQm4F/WELvSzqVt6BPW1WU8fTcxaMcpE
 flrCCtiPLkBKHnTRYMZUyEnJh6Ir/rZ65NJ86l9tk9hO7qibzsAnBB1DRD4S4lQgbH
 cEeQ27eNhvt8eVQeeSy2QAj90Fb3VEIrhybbUCA/Q0tvoK5HalvDSBtWt4PNOHudCN
 OpBaYZN8bPyueVeyI0Z4En/7+BFib/WfZgSM4E5kCOGraxZcpriMFV5FZYQ3PFAL7R
 BaXfIo4B2OPuO7eEnbdfoMQS6t0U1puiOMefjUg0JLKF0TTM58Y0Q2bpr6ghAfTaXS
 PIdFGsoK0Qrag==
Message-ID: <59d4f1e74b4546b9f9eea0fed62a5546@kernel.org>
Date: Mon, 04 Dec 2023 14:27:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/7] drm: revert solid fill support
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Sam
 Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Maxime
 Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 15:13:47 +0200, Dmitry Baryshkov wrote:
> Altough the Solid Fill planes patchset got all reviews and
> acknowledgements, it doesn't fulfill requirements for the new uABI.
> Merging it was a fault of mine.
> 
> It has neither corresponding open-source userspace implementation nor
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
