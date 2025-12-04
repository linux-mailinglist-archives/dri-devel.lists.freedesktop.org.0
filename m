Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFD6CA4F65
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 19:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6E110E9A6;
	Thu,  4 Dec 2025 18:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZWjkMzI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6BE10E9A6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 18:39:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BDD0601ED;
 Thu,  4 Dec 2025 18:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D30C4CEFB;
 Thu,  4 Dec 2025 18:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764873557;
 bh=nT+HTh6DNWj8DJoPrDsJZO/bEIzIqgqUXwO2UF73cEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZWjkMzI1HP598AKSHkkRNU/2C+PGshF6WIq8cffoNuR9IRR5FpNSpKXZ7pVBGXyGb
 XOF/nrnR8R4JWq5SquuJo8jnFGKW48W6AsRuKNk1DMSz6FHpPFYgxF9Xwu7gEV0Bzw
 6heYraNbqXir8S9zZeDtZkUoGciDW+DmR/atOhk5IgEqrsWK6H1xCsmldYHUFNKWWn
 urKFLI/ynYq/LAMVHVQ/FK+lCiPH7szTxm7hM+dCux2v7U47xJyk9+iAx59gSxvhwK
 ZT5PGCa9eoD171C04JbbCL76ZkS1SFJ+dy0ycL0tWk7Lgjfy6w7/W6wuIKGjYAReDg
 NziTlg7i3ftmg==
Date: Thu, 4 Dec 2025 12:39:14 -0600
From: Rob Herring <robh@kernel.org>
To: Renjun Wang <renjunw0@foxmail.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add HannStar HSD156JUW2
Message-ID: <20251204183914.GA1955620-robh@kernel.org>
References: <tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_FD75580BB3BF35F44985E237E7DE56BE2407@qq.com>
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

On Sun, Nov 30, 2025 at 10:35:27PM +0800, Renjun Wang wrote:
> Add the HannStar HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel to
> the panel-simple compatible list.

Where's patch 2? Your email threading is broken.

> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

You can ignore the bot report, linux-next broke it over the holidays.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
