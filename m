Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A679EA63C2B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 03:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6C10E077;
	Mon, 17 Mar 2025 02:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u2vUp7FR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1010E075;
 Mon, 17 Mar 2025 02:56:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C9715C4CC6;
 Mon, 17 Mar 2025 02:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC82C4CEEE;
 Mon, 17 Mar 2025 02:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742180166;
 bh=yFaYSWToPIOrq3oUyCJ+rb7qmaxSDreLelw+cCjbNrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u2vUp7FR8iNUvbFNnB+D5qW3wx64gbqbldcd7XvXeQu9rKyUpoy+ga8voex6sGSm/
 oP9gioQHHdJE32BiMGw8USnQTogWDMGg4yUoWwWP+B6mtPx9EeYdQtza9yXbAx+1Eh
 C12tiM31dh9n3t/St+7BcLsU4/pGnufthbrrBu1CT4lVI7Ptd+oVAh//jA97OMDgyZ
 Sjp73NBn7bttiSvwGZ7gOqYy6Wis72KhXQ+lhxAF593DMq7emDHsE9wJD6H3mFq+4t
 y+KGj5vZ+kc+c7BcbcxKqIwxWgk1tMLOyLZRqEHw83THmtLg33Qoi8aqHAe7VElFD/
 PvFRlg2TV/NKg==
From: Bjorn Andersson <andersson@kernel.org>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, konradybcio@kernel.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v2 0/4] Add and enable the panel
Date: Sun, 16 Mar 2025 21:55:46 -0500
Message-ID: <174218015895.1913428.7302445471992593262.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
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


On Tue, 18 Feb 2025 01:24:27 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Visionox RM692E5 panel, which is
> used on the Nothing Phone (1) and then adds it to the DTS.
> 
> Before integrating the panel into the DTS, we update the DSI code to
> allow bits-per-component (bpc) values of 10 and 12, since the Visionox
> RM692E5 panel operates at 10 bpc.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel and GPU
      commit: 27b85be287f96180de2499b981eec83850df0da9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
