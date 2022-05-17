Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BBF529D85
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 11:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3290210F8D1;
	Tue, 17 May 2022 09:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B478D10F8D1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 09:11:04 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nqtEK-0000za-Qh; Tue, 17 May 2022 11:11:00 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: rockchip: make reg-names
 mandatory for VOP2
Date: Tue, 17 May 2022 11:10:59 +0200
Message-ID: <8064279.T7Z3S40VBb@diego>
In-Reply-To: <c397bff2-b4c0-3f85-e5b9-22f03bc80a2b@linaro.org>
References: <20220511082109.1110043-1-s.hauer@pengutronix.de>
 <6824319.LvFx2qVVIh@phil> <c397bff2-b4c0-3f85-e5b9-22f03bc80a2b@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 17. Mai 2022, 11:02:06 CEST schrieb Krzysztof Kozlowski:
> On 14/05/2022 00:26, Heiko Stuebner wrote:
> > Hi Rob, Krzysztof,
> > 
> > Am Mittwoch, 11. Mai 2022, 10:21:07 CEST schrieb Sascha Hauer:
> >> The VOP2 driver relies on reg-names properties, but these are not
> >> documented. Add the missing documentation, make reg-names mandatory
> >> and increase minItems to 2 as always both register spaces are needed.
> >>
> >> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > 
> > does this look ok now?
> 
> Neither Rob nor me was Cced on original email, so I don't have it in my
> mailbox... I would expect that scripts/get_maintainers.pl is a known tool.

Rob wrote in the past that he's working off of the devicetree-patchwork,
and has reviewed the binding yesterday [0].

But you're right, including all the maintainers get_maintainers.pl suggests
would be better in the future.


[0] https://lore.kernel.org/r/20220516151226.GA2653888-robh@kernel.org


