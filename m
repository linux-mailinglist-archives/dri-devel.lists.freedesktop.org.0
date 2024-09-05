Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E596D0A3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C6710E723;
	Thu,  5 Sep 2024 07:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r7ym7Rk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB10210E723
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:43:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ADE0CA442EA;
 Thu,  5 Sep 2024 07:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3C6C4CEC4;
 Thu,  5 Sep 2024 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725522197;
 bh=PSHmRPlymVF9FxRmxgdRJuK/SoQQG9TI2SQoKNIXvwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r7ym7Rk+bXNpktwyy/ALKE7ScDQQQ+xkhHyI4NWozjA6T7G6BFgPiwAf8c7AzLVIN
 3NA6occQzRIZppA6CeWFkGpED5o9qsZfye7y1NupyAPATAON5CqmY7h6JwpuDwsGNu
 6mFPhGXZEmn9xnMRuAf+5Z73TouGRYGHKK1kOsHhOhBqMPD5/buQKCEbKl9tkVK7R9
 2ICnThAtrOCLMKL2I3sFldJdtX97y5Qc6399SJdy2YTvJzh1kAK1yRWq4Jp03q7Vq9
 cXApDME+GZLEMIgYyyMfzAQCrWPOMNxfVAJHwZAzmAnxzS2NXe4STFKPh/ijNLiGwZ
 aIu55wYl0o7zw==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: display: panel: Rename
 WL-355608-A8 panel to rg35xx-*-panel
Date: Thu,  5 Sep 2024 09:43:10 +0200
Message-ID: <172552218878.2901646.285441761169432091.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904012456.35429-2-ryan@testtoast.com>
References: <20240904012456.35429-1-ryan@testtoast.com>
 <20240904012456.35429-2-ryan@testtoast.com>
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

On Wed, 04 Sep 2024 13:23:21 +1200, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
> OEM used in a number of handheld gaming devices made by Anbernic.
> Previously committed using the OEM serial without a vendor prefix,
> however following subsequent discussion the preference is to use the
> integrating device vendor and name where the OEM is unknown.
> 
> There are 4 RG35XX series devices from Anbernic based on an Allwinner
> H700 SoC using this panel, with the -Plus variant introduced first.
> Therefore the -Plus is used as the fallback for the subsequent -H,
> -2024, and -SP devices.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
