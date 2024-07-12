Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A462E92FE70
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 18:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203A110EC0C;
	Fri, 12 Jul 2024 16:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qheNKlkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF8E10EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 16:25:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 62340CE1916;
 Fri, 12 Jul 2024 16:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B37C32782;
 Fri, 12 Jul 2024 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720801539;
 bh=vKbYjpqSW68vls9/ccAwcEsiYRHH2lrWUF7KjbHlMEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qheNKlkm2Idxpgf4Uo5eN5a4AFkxhoiFJax9yW+nJDJI4QA+uUuiZ6whRtpx5QTOr
 hPg0XMVsG356juBaiHXaqUcpNuMFASVb9uzikwS9WXk2QDcrQAwg7/4n6hbdvrdX7C
 gB9ABOl3gGZkvSlpdR9jLtjCfY6NQ0aaVuWbWy8z7kn4RNhHr1LrTq/AS3n9i3iZTf
 xfGG3nyMeV5suicqZDD2Yot8XN6/j4sNIPyfHH0Lmr/MrkhFFNM/aTq3GEY2PVPpoW
 CYDU9aG/Dsatw0zowI43N9ZpYA1dhJQ6x3HF1Ay2yxeVGnmU6L8lhoTTz21HWRn7YZ
 TzNO8xSerdKvQ==
Date: Fri, 12 Jul 2024 18:25:34 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, jikos@kernel.org, linus.walleij@linaro.org,
 dianders@google.com, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Message-ID: <c4d37nhn5mjzftvde4hk377vyz3dqp4d75hctobaeclzk2orxa@pxweixkkn3zl>
References: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Jul 04 2024, Zhaoxiong Lv wrote:
> The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index dc4ac41f2441..0bbf9dd7636e 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - elan,ekth6915
> +      - elan,ekth6a12nay
>        - ilitek,ili2901

This is not in v6.10-rcX, ilitek got removed and the compatible node got
updated.

I could amend the patch for this but I'd rather have you to do it as I
can not test the change myself.

So please respin the series on top of v6.10 at least, keep the various
acks/rev-by and and make sure you test.

Cheers,
Benjamin

>  
>    reg:
> -- 
> 2.17.1
> 
