Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A71B77937C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 17:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DE710E6AA;
	Fri, 11 Aug 2023 15:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A0710E6AA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 15:49:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C0C566601;
 Fri, 11 Aug 2023 15:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EAEC433C7;
 Fri, 11 Aug 2023 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691768947;
 bh=HFSuChC49w6nabt+nxfBzErUssKeJ9LDoQh9jdgPbEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DvzH50v1+E7Uu4vImDoYHqvF+GAWEChbMQhofNG0xvVf3y7feiK0o9efQclKPdEey
 almszqXw7hvmZsgz+ZOtBZExFisKp0MAPqJ8FQsusxhEyIjM+1nLqde3odEW8TSX1A
 VTN5O8bjvziywxBtBtB8lrQA0zx0+2WNZEXey5sLHOekckUjwaaMBllkURznGeKBkn
 ri4rQcZtq9X1eA8Z6rSRKeqNWvJ3u2/r5UJzewAgbnXxphoIbGKPogfRZBnQvFFPvs
 r5I523qPywsYbmUBG9vBdwVWmJ+aUcUMhjPdPocBiGbwWaYx8ZuWakX7jjxcTPCsxd
 uHg2cbyxhShgQ==
Received: (nullmailer pid 3520409 invoked by uid 1000);
 Fri, 11 Aug 2023 15:49:03 -0000
Date: Fri, 11 Aug 2023 09:49:03 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/6] dt-bindings: trivial-devices: Remove national,lm75
Message-ID: <169176894187.3520330.14434038424194995552.robh@kernel.org>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
 <20230810144451.1459985-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810144451.1459985-2-alexander.stein@ew.tq-group.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Aug 2023 16:44:46 +0200, Alexander Stein wrote:
> Starting with commit 3e37c9d48f7a ("dt-bindings: hwmon: Convert lm75
> bindings to yaml") 'national,lm75' has it's own dedicated (YAML) binding.
> If kept in this file device specific properties as 'vs-supply' are
> considered excessive. Remove compatible here so it can be checked with
> more specific binding.
> arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: sensor@48: 'vs-supply' does not
> match any of the regexes: 'pinctrl-[0-9]+'
>   From schema: Documentation/devicetree/bindings/trivial-devices.yaml
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Applied, thanks!

