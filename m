Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6397E39F
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 23:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942B110E350;
	Sun, 22 Sep 2024 21:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lZtHQMIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AA510E350
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 21:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67BDEA41177;
 Sun, 22 Sep 2024 21:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B43C4CEC4;
 Sun, 22 Sep 2024 21:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727039150;
 bh=aBAPLqLjEzVqTPoaZP+3I2Os2qBCGy/KC+3yMQvfbp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lZtHQMIo+VxF9Va1Wqn8JBC2KEOy4MaCv1BosGHT6kk58QqdWb0f3DH/G5VBcfk16
 D9ExWXyhTFIjm/QBfWAICa2rUd56NuQBLkubUAOUOJ/5oBEVnzzIcDzu6dvXnDVMGp
 YtltRShzJEWMjI6uezinpPHDnoZ+oHyoOrQ/eJfWwI+xqMFpIDg279Klst5TQWgDke
 7Yc4arcYpsJw1QkY8tOsg+M42JeX43f+U4pHg8Une+qZumCFmvvXD+oVgc/Ou2VTke
 a1a5QyAlR03EIrDdJUeTe2R9LAesjiNksJvEiqTpjbdz/c02LJpffyltjNw/4ey8YH
 XeAVHh+5tl1gA==
Date: Sun, 22 Sep 2024 23:05:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, minhuadotchen@gmail.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 14/15] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <vv3fxx4gqcd3oju2v75dinwdajmfkre4c6wvcm2cpit2wgcsqa@7ykznmou5t4t>
References: <20240920081626.6433-1-andyshrk@163.com>
 <20240920082306.6982-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920082306.6982-1-andyshrk@163.com>
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

On Fri, Sep 20, 2024 at 04:23:02PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

