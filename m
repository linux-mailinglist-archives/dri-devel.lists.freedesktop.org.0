Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED941A5D07F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 21:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5889110E686;
	Tue, 11 Mar 2025 20:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t9yJ5ktZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBB810E680
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 20:12:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 385E95C5429;
 Tue, 11 Mar 2025 20:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734B1C4CEEF;
 Tue, 11 Mar 2025 20:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741723941;
 bh=hwyJyim9PZ18lgcGQ/3SEBR/IWw6q8eLGltjBZQCTF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t9yJ5ktZ4eiLTqgwThzF4fTLnpb7IQWPT2bREztyjKs5HOPfGH1r1HTlEcKliZgkZ
 kejUXX1wTmT9snigPtspL1oGSXoLltbRKBGZy2cOic1WTrT1VXj6DCzCxv8qj7/FfF
 8ha/W9oFyzRgWQ6HoQAqS5VOqtlAuECoLDVxEfoNdnKQH+hBqXksl85PGX5DUr9Rgv
 c3tapUX4cm5coH8FJ0MENqB1htMZFz9IJapMWLtpGjOH2AHXevGow3MXl8+GOFUOrz
 wDqkbaJ7rqXzCdCVGWygR9k/m0SlHcJuPbMBXne1mSfhrOKlf0QqPgjRUihxl6ggdm
 ddvYCKEnd24zg==
Date: Tue, 11 Mar 2025 15:12:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add POWERTIP
 PH128800T004-ZZA01 panel
Message-ID: <174172393994.51336.15963394687109008686.robh@kernel.org>
References: <20250311-add-powertip-ph128800t004-v1-0-7f95e6984cea@bootlin.com>
 <20250311-add-powertip-ph128800t004-v1-1-7f95e6984cea@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-add-powertip-ph128800t004-v1-1-7f95e6984cea@bootlin.com>
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


On Tue, 11 Mar 2025 17:40:05 +0100, Antonin Godard wrote:
> Add POWERTIP PH128800T004-ZZA01 10.1" LCD-TFT LVDS panel compatible
> string.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

