Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D269327CB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 15:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195A10E706;
	Tue, 16 Jul 2024 13:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DQn2nCh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AB010E706
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 13:49:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7FFE4610AA;
 Tue, 16 Jul 2024 13:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0348CC116B1;
 Tue, 16 Jul 2024 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721137773;
 bh=ZagyeD+CEK9Z3Hve10RQR+fjhAm6R+NptML0r820+WI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DQn2nCh/CorITB3iIkDQDu6EQsG46Ik9SRkS0pO0FNe3PPT65F68SqGZrwVbB16N2
 ROov0kdR2P6oNfhyT7+B7byGa6sRrIQ8MyLcU0a0wDXSseqHCU74QaNTU2fFdgZHA/
 8UfzeyoTKdu7eO6w5p8AnkZ0jaa90L+MxFrcr3hR/JOsyNu2KVL4mwE6Gr1/jKk6zY
 Psgxerp7VWJUjvLclg01z6yVdPi2iBIsezAjHDhBd4T1DkTSaWfzxn3IR+w0WoigYv
 Afzk6K3VTJNkK065+EsjLx8vRE0Z8uYPKcW2oXMgURvDfSP7ypTUu4D2i4o9UKXnB8
 Uv7UlLOeA3eyA==
Date: Tue, 16 Jul 2024 07:49:31 -0600
From: Rob Herring <robh@kernel.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
 linus.walleij@linaro.org, dianders@chromium.org, hsinyi@google.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Message-ID: <20240716134931.GA3574060-robh@kernel.org>
References: <20240716082851.18173-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240716082851.18173-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716082851.18173-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Tue, Jul 16, 2024 at 04:28:50PM +0800, Zhaoxiong Lv wrote:
> The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V3 and V2:
> -  1.  "ekth6915" isn't a fallback, modify it.
> v2: https://lore.kernel.org/all/20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Changes between V2 and V1:
> -  1.  Respin the series on top of v6.10.
> v1: https://lore.kernel.org/all/20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> ---
>  Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index a62916d07a08..f683048fd0c4 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -24,6 +24,7 @@ properties:
>                - elan,ekth5015m
>            - const: elan,ekth6915
>        - const: elan,ekth6915
> +      - const: elan,ekth6a12nay

Combine the 2 const into an enum.

With that,

Acked-by: Rob Herring (Arm) <robh@kernel.org>

>  
>    reg:
>      const: 0x10
> -- 
> 2.17.1
> 
