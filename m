Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1595D26728
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB61610E207;
	Thu, 15 Jan 2026 17:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="agGaemDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C7410E207
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:32:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9882F601B4;
 Thu, 15 Jan 2026 17:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F19C16AAE;
 Thu, 15 Jan 2026 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768498322;
 bh=UJ62QhE0z1mWbLKaTG/N9Ah90St5W9bIvVAyP2MRfsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=agGaemDg2z5bX0VDV9+mHJ0JkmSVZm+6FPqby1ViSSmJbXMqaoObr8GfFye6k41y0
 LJOuD6brvRsF0ZxKL31JQQ8XNAnGLePm87kIPjWn6M7n/DIdRIdAz+RWdSaCAyd8D6
 K0U0NBvt0ot4PZ8kE6EZOxC+WgesXdSav4iCvD9HzzmTPdWVlZoOXeM00B6rCkL8AL
 Eqz6L0hFhHhwLmBF9/EOguy8I+I5eu7v4WGGGMdX1K9Cu9N6/pYhuX93+D8aficW2r
 aOSXPPpSD4Tlz5rlnvBWSFyw5rUaO32/JC2pv+8P3+djc6O4BfQc5BHD3WVxdwHj2a
 zeuogLuE9JQFw==
Date: Thu, 15 Jan 2026 11:32:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nauman Sabir <officialnaumansabir@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: mediatek: Fix typo
 'hardwares' to 'hardware'
Message-ID: <176849832082.924193.1440994026964193868.robh@kernel.org>
References: <20260112160759.19027-1-officialnaumansabir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112160759.19027-1-officialnaumansabir@gmail.com>
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


On Mon, 12 Jan 2026 17:07:59 +0100, Nauman Sabir wrote:
> Fix incorrect plural form of the uncountable noun 'hardware' in the
> MediaTek DP binding description.
> 
> Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

