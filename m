Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3F5BBFA64
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 00:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE8910E12C;
	Mon,  6 Oct 2025 22:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WKe8Exax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726E810E12C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 22:14:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8E8B60365;
 Mon,  6 Oct 2025 22:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4023EC4CEF5;
 Mon,  6 Oct 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759788852;
 bh=vc2zfBv+sZdgN7qYmn/qbFJ6bMd1d403JGcK7Fnxl4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKe8ExaxQO/iF5ThVSK09XPAoamAEtxbRuGxEaDcefSXWxUnlCmvKAgT/hGN4V3Ew
 aPzQeVKh/8UTdz7yXyKYiT9B5RgnP5OuiiPphxw9HIU9hJ8fuhToEAyFGV+aMmYchf
 KiWmPiqFohLNsxDeFtMxBqsdXHkDBAIv8MGSyzGXWqgDcFWCyrtkILq7x+RibMbeM9
 JHnYp00tTyd8IJmvb/7LrBnkZX4/InerAmZAHoIZqZ+eQWWGnbC0O5pwwxw9KYDmWF
 2VEKCfzxvTFJttsNarmtP+LbQKOka5JhB/CdZ7Qq3Br7M651zXlbEltLr5yfraWUcT
 TprCPGuiheidA==
Date: Mon, 6 Oct 2025 17:14:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 4/8] dt-bindings: display: panel: document Samsung
 LTL106AL01 simple panel
Message-ID: <175978885082.673862.6679789461297588474.robh@kernel.org>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-5-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929142455.24883-5-clamor95@gmail.com>
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


On Mon, 29 Sep 2025 17:24:50 +0300, Svyatoslav Ryhel wrote:
> Document Samsung LTL106AL01 simple LVDS panel.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

