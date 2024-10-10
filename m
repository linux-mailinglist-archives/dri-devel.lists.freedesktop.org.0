Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFA998FD4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 20:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBA510E103;
	Thu, 10 Oct 2024 18:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W09yPTrs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D77710E103
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:24:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 680955C4D75;
 Thu, 10 Oct 2024 18:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9EFC4CEC5;
 Thu, 10 Oct 2024 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728584664;
 bh=LXWRpUCFEW0Rx04S04rSJW8bkwD7Sr+8cSNN1CAscBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W09yPTrsAR0lHYNUF/tBo+WwwUzmSF3X/IPDGqlWqiO7J5dM9dmuHlI8bv8C30/NJ
 W3wRi4K5Y4dEfXG7JJQgL5s91rSZtBQM/xooGHy6CLEVXDJudAeToRi0/2LSU9A/Ym
 zyTJYO55nf/irDzKi+8GceKbR5rmjS1+ziMG+Ymr9dgRSKWpdwN3uuiLlAYjnr9TGb
 WNzqgARb+3h8JGXwcQt7nceDb7BMKPSrXXch7fIZi/SPu3tZcR0YIS2aKY/8nN3tcb
 RhRuFtxc+PshCMxIAif3BUwwY6nlO3CtGk0G2K7PDOURkcNJQ8JMaeycZG3PZT68HN
 P9CtfTVDaWkrQ==
Date: Thu, 10 Oct 2024 13:24:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-leds@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jingoo Han <jingoohan1@gmail.com>, linux-input@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: input: convert
 zii,rave-sp-pwrbutton.txt to yaml
Message-ID: <172858466263.2206934.3878201862515578388.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-1-0ab730607422@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-1-0ab730607422@nxp.com>
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


On Thu, 10 Oct 2024 11:42:38 -0400, Frank Li wrote:
> Convert device tree binding doc zii,rave-sp-pwrbutton.txt to yaml format.
> Additional changes:
> - add ref to input.yaml.
> - remove mfd node in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 -------------
>  .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 22 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

