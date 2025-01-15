Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC03A11D51
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418010E595;
	Wed, 15 Jan 2025 09:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ngHQV0YY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A6F10E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:20:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF7515C5B70;
 Wed, 15 Jan 2025 09:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB92C4CEDF;
 Wed, 15 Jan 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736932816;
 bh=9IC2ITDoqFLeYAWBTaUiKf9L85RT7I7RXmH1ALPuiPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ngHQV0YYiGUmLQ3GMW/bSgVJyL+0cGa7o5MuWDvPhJiGMa4Vg2QFd79kgYmtc43t1
 hMeetbu9mkfqT5QC+WL2HsNekIxQzDQyO8jHjIDEpZLHEBPZ5zY/7moJyRvk69exlH
 jv/UvIrXWeAthY1R0Kj7okaRdvmUwUaaMU0ckPHv0AVkfG6V0AyGurzTQsLxXuhXul
 ZORvArkMH3ikTu1L32gXYQUhIZnP1O9UhGaf/NfLYsxeG0TZRgcisnb/aVfkLjDFsR
 sIT2t9vusb3ZgMU0oLr1KqEt3A3wjjTmWViaFM6ALK57Mh52bJhrzDJKzyPfT2lOEG
 8xnozbUtmFmjg==
Date: Wed, 15 Jan 2025 10:20:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v4 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
Message-ID: <adzdihtqgtyhgr7cdisiekzqqt65uicwmgspyat4vw3kpytqya@3bvq5bnsso3g>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-1-e9b5260a39f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114-adpdrm-v4-1-e9b5260a39f1@gmail.com>
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

On Tue, Jan 14, 2025 at 10:38:52PM +0100, Sasha Finkelstein wrote:
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../display/apple,h7-display-pipe-mipi.yaml        | 83 ++++++++++++++++++++
>  .../bindings/display/apple,h7-display-pipe.yaml    | 88 ++++++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 58 ++++++++++++++
>  3 files changed, 229 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

