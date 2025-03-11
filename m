Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F1A5CF7F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA1410E613;
	Tue, 11 Mar 2025 19:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QkoRgJeJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3397110E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:34:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C76755C6879;
 Tue, 11 Mar 2025 19:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B17C4CEEC;
 Tue, 11 Mar 2025 19:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741721666;
 bh=7SzSmNQI5Lq15IlMk57NIhjyJKbjRjI8NcTmba3AXVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QkoRgJeJFXxlTW+99XRp2q4NDI9BDBJPGkBfz6igAVwDGxzS/HyKTtrx39Ai71c4d
 isNzsFY1aKZj9sa2BSv+dc9ljLPkz5XZKo+K6dg04Unvtu3/T9VlCSydoN937mvUpu
 HO9QDuG2WziULaShHg590LN/H36/OktS//Kf7ZA+xbStMjW13Zqao+z716+X9NcMIg
 auXhiZVXPDDQvrRf4Bf5PnL+q2BFornqaZ6gw6u9JhhePTzGBE7HaDtv/JjlXvD97k
 GjoWMP1PvTx0KM4aez0R6/7jjRJFtHwa3RYfrTgVwQ0AEtC84UYdf5TSTs7FYQ7K8N
 D+mkFg7Qx8YAw==
Date: Tue, 11 Mar 2025 21:34:20 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add POWERTIP PH128800T004-ZZA01
 panel entry
Message-ID: <l5xqtntobwrqm6itp2bxnfr735fbzye7vvai6fl2wdmk6jzjbs@dk2kmfhzg5to>
References: <20250311-add-powertip-ph128800t004-v1-0-7f95e6984cea@bootlin.com>
 <20250311-add-powertip-ph128800t004-v1-2-7f95e6984cea@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-add-powertip-ph128800t004-v1-2-7f95e6984cea@bootlin.com>
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

On Tue, Mar 11, 2025 at 05:40:06PM +0100, Antonin Godard wrote:
> Add support for the POWERTIP PH128800T004-ZZA01 10.1" (1280x800)
> LCD-TFT panel. Its panel description is very much like the POWERTIP
> PH128800T006-ZHC01 configured below this one, only its timings are
> different.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry
