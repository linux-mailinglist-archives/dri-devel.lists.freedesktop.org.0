Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B19A26DA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 17:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B93410E85F;
	Thu, 17 Oct 2024 15:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MNF8iDpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B75010E85F;
 Thu, 17 Oct 2024 15:36:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C454A44137;
 Thu, 17 Oct 2024 15:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A788C4CECD;
 Thu, 17 Oct 2024 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729179362;
 bh=UaHTT/HCPSCBmEoLaaHxWZ8kYjvp79Mh62xxOcsCz3g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MNF8iDpYfzr/MllJDBEf+0OjI4ejKzCH1MnIlFSj3P4DjmRkcLc722QW6DzmCk7tb
 1S7ib2J0Xvb1jpNMs8ytpfN5Qi0/0k0pt4cipphk4NUuSUB4jpl+Y1EAWfHf7rWRSa
 icZ9z1Sos4ktrwFWtVXMOXGqVnRCJT7cozsoxHWVqQjuFcQCqdVA1QI/844GH/yd+V
 8f1YDsifxmjrF6l1etNSasGvuP36bIXEnpVed/mSWTUqgTIctM5YWgegG1aYN1k/zp
 NKKkPLdfEjFrblCxAvJk0uBYR/PTRNXWlWhcg//OcuuGVzTLc7rR+XrqyJIu7cjE7z
 wdHyVJ1tpTIVg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, konradybcio@kernel.org, andersson@kernel.org, 
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
In-Reply-To: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/5] Add support for DisplayPort on SA8775P
 platform
Message-Id: <172917935474.288841.13832533870290794704.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:05:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Fri, 04 Oct 2024 16:00:41 +0530, Soutrik Mukhopadhyay wrote:
> This series adds support for the DisplayPort controller
> and eDP PHY v5 found on the Qualcomm SA8775P platform.
> 

Applied, thanks!

[1/5] dt-bindings: phy: Add eDP PHY compatible for sa8775p
      commit: 7adb3d221a4d6a4f5e0793c3bd35f1168934035c
[2/5] phy: qcom: edp: Introduce aux_cfg array for version specific aux settings
      commit: 913463587d528d766a8e12c7790995e273ec84fb
[3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
      commit: 3f12bf16213c30d8e645027efd94a19c13ee0253

Best regards,
-- 
~Vinod


