Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CB9D27D56
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 19:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9B610E24B;
	Thu, 15 Jan 2026 18:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GiXGOy6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EF510E24B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:55:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E9A843E5D;
 Thu, 15 Jan 2026 18:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418C6C116D0;
 Thu, 15 Jan 2026 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768503347;
 bh=aOSRDFakGh+5h+6qiUYQmK78wJEtBDPIU2CeS3D2/Hw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GiXGOy6gJPPQnsMPZ/eN1qB+60jvhhAqMO1MJwulQ3DQBHzw2ohwTnahpaU+EWDKA
 agSfrzZ8pMUOV7GV8RhyJKFeJW6xK15bHvRxhgvo5y9tNSSvGCgQsK6qi5pjeGKBu6
 3V2Cv52gYQECGMj+J/5jm0V1otwjUXzqmR8bSZdFdv516fx6uladLQ4YcPPhZMBahj
 39Y4DodP3tSpbDVflF6/TlPAprOU4X78s+6gEo8tfIc1XZtflLi0eVNp5sW47IEgk3
 pIz0ai+FnZpmx+BdP/UY3sIENZrm+yJG6isnz6I5F+XEbDb5FwUIZcTNSFil2LaGPW
 fhEVX9xI4rXfA==
Date: Thu, 15 Jan 2026 12:55:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, simona@ffwll.ch, airlied@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, tzimmermann@suse.de,
 jagan@edgeble.ai, linux-rockchip@lists.infradead.org,
 dmitry.torokhov@gmail.com, conor+dt@kernel.org, heiko@sntech.de,
 jesszhan0024@gmail.com, mripard@kernel.org,
 neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, aweinzerl13@yahoo.com,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH 5/6] dt-bindings: input: touchscreen: goodix: Add "panel"
 property
Message-ID: <176850334606.1005378.10711190670525490537.robh@kernel.org>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
 <20260113195721.151205-6-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113195721.151205-6-macroalpha82@gmail.com>
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


On Tue, 13 Jan 2026 13:57:20 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add a "panel" property to define a relationship between a touchscreen
> and an associated panel when more than one of each exist in a device.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

