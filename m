Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBF80BE17
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 00:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEE810E044;
	Sun, 10 Dec 2023 23:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2EF10E038;
 Sun, 10 Dec 2023 23:21:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5993160EF4;
 Sun, 10 Dec 2023 23:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A15C433C7;
 Sun, 10 Dec 2023 23:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702250478;
 bh=0SwR15QKyjc4lI66xJvZglqK8JbLrcKKmOUbpXT8Ayo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ttK2msjgOje+AoxFh73cyyDL/lrykNpcUpeXiFWJMvx8Za1tDvJSg0vKx1kD9WGGK
 qn2jNIJQp7eGXUIwuGOh6fYFCD+EiXj+IxSGKvwoEifkwhmQfIYNivBNpgMWRjsh/O
 HLJIROmPDGIllA1ZB4PZSD9CK13aNuisPFY5UoVS/f+Dtldj68giHvOtyNdyw8nJSE
 7AAlxr0i//sdJmy3d0jsZpxocv1/tFwTrmQFXXKBHwJG++5di3+m4xbacyqEGE3voM
 Pw+AZL33Vho3chOCavh7kG98m81p/99b0KmkgNYsrgZFpvHHiOifIXrJf+DYf4yF7j
 tkcLb2KHoBRtQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Luca Weiss <luca@z3ntu.xyz>
Subject: Re: (subset) [PATCH 0/3] Add GPU support for MSM8226 (Adreno A305B)
Date: Sun, 10 Dec 2023 15:25:39 -0800
Message-ID: <170225073880.1947106.13814955780498135531.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
References: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 30 Nov 2023 21:35:17 +0100, Luca Weiss wrote:
> Add the necessary bits to bring up the GPU on msm8226.
> 
> Tested on apq8026-lg-lenok.
> 
> 

Applied, thanks!

[3/3] ARM: dts: qcom: msm8226: Add GPU
      commit: fc209f869310776c437daba478246df64d82c38b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
