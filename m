Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC595AB70B4
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD289AC3;
	Wed, 14 May 2025 16:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="exI/7OTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DD989AC3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:05:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3647D435B7;
 Wed, 14 May 2025 16:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8E2C4CEE3;
 Wed, 14 May 2025 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747238701;
 bh=RkTxB0ZxzYAlqUbtPbrV4H9RQUd/PeOBalusgwRU4PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=exI/7OTyHwVQ4yU9GlyrC6Q1hbJTnYs6PYs3JiP+nrVv1++gwisHzaVv0wWvYlHWQ
 1HN34m8JJorMxTUMDHJN9j3KMw6rKNq2IUv3TSc82Kvx2VpHNERr3y+P5rxWH1v3Wu
 3LZwkymkIUmoX1rcU5n8bAibpdVfhHSlYj9XKrLA18WSvRa0aMamciKHhp5gqeSfTO
 /mllHgmeoJhCnFsAw0mnZpupjOIbCBIyNmIKqZMJoawYIVF4s5RP7SUB5Q7PsxSiXU
 ARKSz7ODHRbZm4TtlpowsV9qUh114yyxhQmXew1KdVJnzKyjl01+hg/g+nAaKcSflF
 zd+68Zpr2a/Zg==
Date: Wed, 14 May 2025 11:04:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: Document Renesas
 R61307 based DSI panel
Message-ID: <174723869857.2423571.2570619557941621488.robh@kernel.org>
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506092718.106088-2-clamor95@gmail.com>
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


On Tue, 06 May 2025 12:27:15 +0300, Svyatoslav Ryhel wrote:
> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/renesas,r61307.yaml         | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

