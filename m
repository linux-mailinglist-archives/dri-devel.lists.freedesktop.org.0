Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D6A305B6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D4110E43B;
	Tue, 11 Feb 2025 08:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MIfleBG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DC310E43B;
 Tue, 11 Feb 2025 08:26:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D7D0A400BD;
 Tue, 11 Feb 2025 08:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3D2C4CEDD;
 Tue, 11 Feb 2025 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739262394;
 bh=3Abs1QmsO/pd0iCM9Cd2JgNgDe+KNzwww7ynjWtN2FI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MIfleBG9+zbpLnbO7j8YAljK+CkOnafi4bReT5RgR77zca/p7O5oYGi8lwf0V9yxt
 O5rWuThJXYre1urEt18oc0rNjpqHxfetLmR28rnRK0sop0nOSNnd0HqUZc6yB89DxJ
 dSkihUW7Bl1knd9Dc/QyAKWAdLPbY406mI4L9DI9HCsc1Q4WYXbhC2m+YuwUfhRIZR
 majuGD4WEJfVSRlUh9UFLS3lBCC9yO3tbOQUVh0ZoZNHExn3MoNYuTfJZ9jXfKg2xt
 a1+Tu8T1vNcn8MBVqNemXP8ldIBgRFwdvwrwUyFOXeMVyz1Q+HeDOHOzsX9FECksTq
 mUv4xC29OiFOQ==
Date: Tue, 11 Feb 2025 09:26:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/16] dt-bindings: display/msm: hdmi: drop hpd-gpios
Message-ID: <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
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

On Sun, Feb 09, 2025 at 07:04:46AM +0200, Dmitry Baryshkov wrote:
> Supporting simultaneous check of native HPD and the external GPIO proved
> to be less stable than just native HPD. Drop the hpd-gpios from the
> bindings. This is not a breaking change, since the HDMI block has been
> using both GPIO _and_ internal HPD anyway. In case the native HPD
> doesn't work users are urged to switch to specifying the hpd-gpios
> property to the hdmi-connector device.

In that case users would need to update their DTS/DTB, so that's an ABI
break.

Please deprecate the property here (deprecated: true) and keep support
in the driver.

Best regards,
Krzysztof

