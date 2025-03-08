Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8CA578A7
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 06:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF6F10E2D2;
	Sat,  8 Mar 2025 05:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dnk74kIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC26210E20B;
 Sat,  8 Mar 2025 05:43:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 778F95C4862;
 Sat,  8 Mar 2025 05:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5542DC4CEE4;
 Sat,  8 Mar 2025 05:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741412612;
 bh=79ix3lRVUR26d4f4Usz1pnoJzcSREjOoUHNJ+xQ10ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dnk74kIvv6YoTf6PJNA9cz+71d5+a3X7GksQkIYCJ4zPuQSasxX34a3O9nRRh3YI7
 5N89BHJO15b4Wm62SYoFhfH6AwNfF153IwAAdTQiBFsR23C0je9UaIFNSHSlsxzQaV
 93J28GUJmCmNRUJSjXLetP841tHxrj60URRhmoPqVE6HnHKYFhJoCuoEI0N9dintvb
 sTFw0yYKupY2rAJiUonUjqoVrILaCdklatvQW6+zHpaB9NLk+TDzttqvz+zC5z9t5+
 8IKmdW8nqDYcnJDLoVNt8ouvu6CxmtEFbTGJlYjOyX1Eq1b4x6zhQrjv+Vm7c0wF77
 r3OYJODHFiKkA==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/dpu: two fixes for kerneldocs
Date: Sat,  8 Mar 2025 07:43:14 +0200
Message-Id: <174141256286.1924437.10541694717666004820.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Thu, 06 Mar 2025 10:22:28 +0200, Dmitry Baryshkov wrote:
> 


Applied, thanks!

[1/2] drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/096775c3dcf3
[2/2] drm/msm/dpu: correct struct dpu_encoder_virt docs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2ee664833000

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
