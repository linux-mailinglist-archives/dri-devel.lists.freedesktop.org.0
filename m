Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F5717845
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCF310E48A;
	Wed, 31 May 2023 07:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1091F10E48A;
 Wed, 31 May 2023 07:31:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 157B563769;
 Wed, 31 May 2023 07:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B29C4339B;
 Wed, 31 May 2023 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685518265;
 bh=fJz7lxGK5Ska27iQ8eKIC8CyRP69QFpkWxtkM6c5CWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h+W4Fajj33S1kLocdt2Sc31gFSgcB4Didwm9lJPXtCbRXwbAhcFDl9Itrrbgpgd9a
 yr0p2oT449/TKQbxTqHa4ouq8ida+TsZUaKTxxaV/YdCr78/R1jiLJ/bZ00kd5RV6x
 hiEBZd+QN0YQPOtgAQKSbMSh9U9uCTucWcWyIb7XUG3vfykGC/MwdxVPG4gRJc1njQ
 gNTU1jJdLWIIza0JP0KSa6EKADZhHEM4gV8/VNEAJIDT0w+EtQz/KMyJTOQNOolgfn
 1omC6F2PKcxzmo7mahsOsc/Ad2CkLVvE5Vfz6HZs69UfQo+eOmL5i/NsgPbucyzCde
 FX+JQF3kw0N7Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q4GIW-0006lM-Qd; Wed, 31 May 2023 09:31:08 +0200
Date: Wed, 31 May 2023 09:31:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v3 0/3] drm/msm/adreno: GPU support on SC8280XP
Message-ID: <ZHb3vKjWcgWhvCoi@hovoldconsulting.com>
References: <20230531030945.4109453-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531030945.4109453-1-quic_bjorande@quicinc.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 08:09:42PM -0700, Bjorn Andersson wrote:
> This series introduces support for A690 in the DRM/MSM driver and
> enables it for the two SC8280XP laptops.
> 
> Bjorn Andersson (3):
>   drm/msm/adreno: Add Adreno A690 support
>   arm64: dts: qcom: sc8280xp: Add GPU related nodes
>   arm64: dts: qcom: sc8280xp: Enable GPU related nodes

Seems to work well (after applying the dependency mentioned in the dtsi
patch):

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
