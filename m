Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F7124158
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5426E27F;
	Wed, 18 Dec 2019 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7205589AB9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:25:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B3C5122054;
 Tue, 17 Dec 2019 09:25:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 17 Dec 2019 09:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xvdmnfHNZv30Ef6FOnnJ8H9Zi8E
 B770B5RqgbKD4D+w=; b=WWsN3aZBOPYVIkYEV94BxMJQIdCgwn4RUNVgKdmYQBJ
 RgrFsLclOzRr8kQIpxuLXXM2byqfHoOr5beSfMqhq1lgCVsvEZo6xahWfX0xEUio
 2HxKPAmArSenOwvF4Y8LRcJ3aKVcS0lYIvSpoSARKahleMGpHI2qwBNAJNy8PTrm
 62nnumhCwLk4nrFnjTldu/x21vD8SZl7c1QNyHIReIRNeQ2ROPcpd8Nz7tikC1Gd
 npRixPHCguNtOVLhLklp0Wy7HF3cdG/OjSB3R5JftridyRr/NgTYtyRTTqOux34y
 W8/G4wL7C+QoH4MytqCmZ1UHPjKBd4wSLNeksrIiq7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xvdmnf
 HNZv30Ef6FOnnJ8H9Zi8EB770B5RqgbKD4D+w=; b=CTszcSLKE4BAHvqZeDEZTK
 NDucNsLR5hVTDX+iReOzhSo4hcXjKBJlvLk/ULfTZqYqr1delwC5IkKKD/fOTLSZ
 J9dbX6jT46F2yG6CN19a4jL+E5PDYTIvdOLWDH65IQg4FuBuT/tpU+h0QNtqRHMp
 Zf1MKyJ0EMECtf4i4bcvFUphNyHj9mywNMBjPnEd5p62zVXFuQAhRRl34rYdDaBF
 zyR/ZZxLIaqcBD4VQyEfxYQe7+ZhXLdDjo5Z9rfdWBd5cPXKbLp/+opY2rCCs5F+
 xZi0xmM1JlpcgmnHTx76Xa87MVFGA3WPsFjYufI9gd+ZU67VR+cMp2u/rcSy0zyQ
 ==
X-ME-Sender: <xms:TeX4XWb6v5LChT-ueRjhtrpDSg1iO-zHtiZomQ-lZRXefjPlu-8V0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtjedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
 hushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:TeX4XdH7W9elm3zZAB5GHVEFnnexZAkCdpRqh-xJu_7ouEepp26rkw>
 <xmx:TeX4XcALZq9KYbs22L6KeKKeWivcQ9dKd5qZj50DSljMj3fYp5wocw>
 <xmx:TeX4XWFgem2eIJTTFBaQjn4pM5xvdBwFAOrkJ9HBgvj_1puUnGh9bw>
 <xmx:TeX4XcY5uiS7ikCoyC94bVpfV6_v5Qb36MfhlIbFJ16OQ5T2b42LhA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4DD7C30600B1;
 Tue, 17 Dec 2019 09:25:17 -0500 (EST)
Date: Tue, 17 Dec 2019 15:25:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add binding document
 for Leadtek LTK500HD1829
Message-ID: <20191217142515.uap65rdbjn7oepeg@gilmour.lan>
References: <20191217140949.24280-1-heiko@sntech.de>
 <20191217140949.24280-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217140949.24280-2-heiko@sntech.de>
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 03:09:48PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>
> The LTK500HD1829 is a 5.0" 720x1280 DSI display.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../display/panel/leadtek,ltk500hd1829.yaml   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> new file mode 100644
> index 000000000000..5f6ed75d7598
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#

Same comments here ;)

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
