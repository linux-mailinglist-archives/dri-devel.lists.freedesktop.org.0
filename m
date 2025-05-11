Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC01AB2C17
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 01:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BA010E101;
	Sun, 11 May 2025 23:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d3Me6VQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181F610E0EF;
 Sun, 11 May 2025 23:02:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 99D7AA4C58C;
 Sun, 11 May 2025 23:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C14EC4CEED;
 Sun, 11 May 2025 23:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747004523;
 bh=OtGk7e73fLyR+zN7tyhVrdION3z7l387Vys+tbkhEfk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d3Me6VQiS95dN26SXIjhuEU0Y2sgwXmUpi20r4mZgxb83sztnHlqrrdZ7dnV8Xj8L
 3HZOVhYP8FfEGQHHYcj6Gv+8KZtKJHqzT0PBfDiR6ruJhlQpQRt9ParHXB1j94pXLF
 jhiMgrFldu374UUPi9jBcuxHI2kpbT7CIo8mztozZA3+Nyk/7i53E48CPw4phmao0b
 1tfvL1Ah0QuPuM+ui/nFlo5uHkjXg2p3Qtam9tfSOLxBerf46MXICOjvXTItSWFNxF
 P2ONBRxgszQrpgJKP/vaHWn0XhYLcuLxs4xeVOnxn2a8pI0EyuIStiBpodE01dfRg0
 3HUZ1ajfolyVA==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] Add interconnect nodes and paths for
 MSM8953 SoC
Date: Sun, 11 May 2025 18:01:39 -0500
Message-ID: <174700447987.10930.18174098523323137174.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
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


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: msm8953: Add interconnects
      commit: 6aeda4f2042711f99d63c5b7bf846c2bba711696

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
