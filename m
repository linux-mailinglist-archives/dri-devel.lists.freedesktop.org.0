Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC6717832
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AEC10E48C;
	Wed, 31 May 2023 07:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC0010E48C;
 Wed, 31 May 2023 07:28:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9682863772;
 Wed, 31 May 2023 07:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05087C433A0;
 Wed, 31 May 2023 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685518113;
 bh=UE35bN0SYktAgtulGtfRw0ZGksuMveOylG6L1tzctnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGEvusDHV50xFpcIlZ1fNz5joNg7Q2NhNz97qTLqpKYfqfj3PcrVzptKrQlT5mzUy
 hxhCZUr8tkDTTox8iy4inhitrzU1oQ4JxFYmNlE40tcdNa8vYIxeKAubbBc4CZHAj+
 cNcmoljlW3a7V7NvHkWdh+xMcjkG/mUXhKckg/z8KjNyEkH4o2p7HvNNGiIO4RB1j1
 Yoki+MSxlYabo0hDhzuE0Zgj/qvqcAUwFYEemMOd63otKh4AcYsQcFhqTM2xAr0BYu
 D8mcbQErrxFK0EcNby/YjZvor33EHAiBFB+Fp48pygeQyRMbkmbCLQY6WrmnVNbbSc
 j/yIUKtBDaGtg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q4GG3-0006k2-F1; Wed, 31 May 2023 09:28:36 +0200
Date: Wed, 31 May 2023 09:28:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sc8280xp: Add GPU related nodes
Message-ID: <ZHb3I6NUcjHZ64wD@hovoldconsulting.com>
References: <20230531030945.4109453-1-quic_bjorande@quicinc.com>
 <20230531030945.4109453-3-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531030945.4109453-3-quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 08:09:44PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add Adreno SMMU, GPU clock controller, GMU and GPU nodes for the
> SC8280XP.
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v2:
> - Added missing opp level (both gpu and gmu)
> - Corrected opp-level for highest gpu opp
> - Added dma-coherent to gpu smmu
> 
> Note that in order for the GPU driver to probe, the last change
> requires:
> https://lore.kernel.org/linux-arm-msm/20230410185226.3240336-1-dmitry.baryshkov@linaro.org/

That's a pretty well-hidden notice about a critical dependency. I just
spent the morning debugging why this series broke the probe of the GPU
and only saw this when I was going to report my findings.

Please consider putting information like this in the cover letter in the
future.

> Changes since v1:
> - Dropped gmu_pdc_seq region from &gmu, as it shouldn't have been used.
> - Added missing compatible to &adreno_smmu.
> - Dropped aoss_qmp clock in &gmu and &adreno_smmu.

Changelogs are also preferably placed in the cover letter so that you
don't have to read through N patches to determine what changed from one
revision of a series to the next.

Johan
