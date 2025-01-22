Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196B1A18D41
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 09:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35D892A1;
	Wed, 22 Jan 2025 08:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oThRLHS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7B5892A1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 08:03:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29DA95C5CC9;
 Wed, 22 Jan 2025 08:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0B8C4CED6;
 Wed, 22 Jan 2025 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737532984;
 bh=qlsDdKWp9jAbvCWbUO/DPo1L2HYoPRwKgJ/Bbi2jIR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oThRLHS4vLztbbjbOriHl28d4JcYTO8ZGi7nmsXpqSUtuzv0xbC1aFXSpXMWzJPg/
 XkRAfiVRL883V5BtB6IGuWrd4hTjSCDSVuMWXJHt+2Ax10hZe8qMTrwjl7M5nXOHCO
 vAP23gmZystHtP+gamPud13XJmH+fdEHgRhOtg8UytMVVWAlrqXFqEZYSZPwZhGUV2
 4vcxpgrPDeEd9Lw0zXyX+Bwxhri01QUux8oZYufw+htLqkfmcr1se5BsZJSrVJOTP0
 aIWOl1bWwTIMtztBYnK5qSTSaLFQe9MJU5on92EcXPYmjI1YxrnTsyIFxYW6L9n4Cv
 14hPBK9gsBRAw==
Date: Wed, 22 Jan 2025 09:03:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v12 11/13] dt-bindings: display: vop2: Add missing
 rockchip,grf propertie for rk3566/8
Message-ID: <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103446.2528212-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121103446.2528212-1-andyshrk@163.com>
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

On Tue, Jan 21, 2025 at 06:34:44PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Propertie "rockchip,grf" is required for rk3566/8.

Fix typos.

Why? What we see from the diff...

Best regards,
Krzysztof

