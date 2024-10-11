Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5284999B07
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 05:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F53410EA22;
	Fri, 11 Oct 2024 03:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sqgg+DuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762610EA22
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 03:13:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 06C21A44E2F;
 Fri, 11 Oct 2024 03:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38ED8C4CEC3;
 Fri, 11 Oct 2024 03:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728616405;
 bh=Akm9XTGaZ+hdSTC+onu5IFuEnj47oz+SCxXYGHPS0So=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqgg+DuAZaaPkGNhU6RDpjIgecIf/PrP80vCN5IJSZ2Ie7ilTsgDb63kr00lTl/+s
 RFEJxvbqGGaQNrl60wkwcM8z1nj3aSkHLtrwDgXrtk/f9rMbHHpk9ViXz9UsaTe/Io
 Bw6UvSAGR1qNqiENz5P1OezswrUWUkUY0BuXCB/wqZV36K7fV81Ol+G33f6ImXB5e4
 s8IlSudfCxeBda01Zz98CQ+Qkj0fWO0NDo30XaVMwkDfKORgIfmAyBziSJ4Bxz0ODY
 KOcmQwtUqTnnNI0MTtmcwfW/BC+hHLGtmpT7DaIWQtiClMRHpYtZUACTzZ2ka93dMh
 koew/uGKVAg4A==
Date: Thu, 10 Oct 2024 22:13:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: backlight: convert
 zii,rave-sp-backlight.txt to yaml
Message-ID: <172861640278.2238116.3542254173339737101.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-2-0ab730607422@nxp.com>
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


On Thu, 10 Oct 2024 11:42:39 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-backlight.txt to yaml format.
> Additional Changes:
> - Remove mfd parent node at example.
> - Ref to backlight's common.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../leds/backlight/zii,rave-sp-backlight.txt       | 23 --------------
>  .../leds/backlight/zii,rave-sp-backlight.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 23 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

