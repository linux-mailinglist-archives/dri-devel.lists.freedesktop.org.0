Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919CC6AA5EB
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 00:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4FB10E78C;
	Fri,  3 Mar 2023 23:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D2410E789;
 Fri,  3 Mar 2023 23:53:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2874B819A2;
 Fri,  3 Mar 2023 23:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4363BC433EF;
 Fri,  3 Mar 2023 23:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677887602;
 bh=f0VZGTA8oOnAaMkfwB2QB6pLFSy4sdHSrlgXIOshidI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pPg3aquMyk8quzI4S98uu90F22x1h3GOUJkYSghdVqGCJWF1TcwvUvWST3RzZWK8w
 rCHK+YOBvoipN8b1QlvOUPK4vO5E/mokaSvQZlqqbSQfxWi4p8/N8sCxNVmAKrrdaq
 L+h0LZD50TpI9OyO6nPzyLw7uPq/6Cx03FTFrpn19RzgmE50c7c89ik0FdARIV8cMi
 B0WVX0zjm5XxcDVW0ukFs/6w+rp0DSh3l+3DzO5WLU6q9CluToYJP5DDIEiJz6y69+
 oV+Adjksmu9f6MgqJwE49S/CHR61kap4SKD/E7xE5SEzkMpjz6rvoI+mZwuszZRkkE
 5pyD+qJFcUj2w==
Date: Fri, 3 Mar 2023 15:53:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment '#'
Message-ID: <20230303155320.5e394431@kernel.org>
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "David S.
 Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  3 Mar 2023 15:42:23 -0600 Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Jakub Kicinski <kuba@kernel.org>
