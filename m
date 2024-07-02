Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ADB923C5F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 13:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E074110E5B2;
	Tue,  2 Jul 2024 11:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ed3Ssusn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7DA10E5B1;
 Tue,  2 Jul 2024 11:28:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 005D261B4B;
 Tue,  2 Jul 2024 11:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA159C116B1;
 Tue,  2 Jul 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719919715;
 bh=R8+rZJ4UpBPZnN3SumMPWq4w3upOof4xgExoUpvjPIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ed3SsusnbPQFrOkXNsNT53jAZHRwWGEkjbXL8uLNX4imPdtdA0A7rAZOs/bXabqPr
 /2aJ1SEJ0RWsG8GuAX2EYKimbbgrPo9k/KtK+YGqs4IIGvGFscQ7VH5H/KJRQg6j69
 8XUBQe+ebABqr5ZTUAwWHYu44DV130KYFurTdcq48yYMFMWwsNXZbsMD2Jxw6G8hxV
 Ck45x85p8c4QlgXTQ9GYhdXvizNI9lRrveBiyLsQCr5pc0LoXbHOl8C3gPkDSaG6sX
 67/HQIH8ndX+UoDiWPpxO+aHH3fc7Ku/rsEx9wT15qCU9qDPcQE36Q97/Im+0xgvd9
 7kzuiKwSaRlqw==
Date: Tue, 2 Jul 2024 16:58:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: phy: add qcom,hdmi-phy-8998
Message-ID: <ZoPkX0lE82Lkab6R@matsya>
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-1-355d5c1fbc3c@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-hdmi-tx-v5-1-355d5c1fbc3c@freebox.fr>
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

On 27-06-24, 17:53, Marc Gonzalez wrote:
> HDMI PHY block embedded in the APQ8098.
> 

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
