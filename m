Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902A11F21D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBE56E354;
	Sat, 14 Dec 2019 14:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E101C6E2E5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:44:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 47CD1226B1;
 Fri, 13 Dec 2019 04:44:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 13 Dec 2019 04:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ImxQ1LR0DbrnqW0fDLZsDrM+ZJV
 DueyOIVlxP6rimw0=; b=R6aL2F7SIzNJEmcW5dOZSidpCrJ3FwPs86iRwbcSigB
 a5S62VzMREckC4wiya5jCQialz6B5X1qyeZENkFW9vmI8z3Vr23LHWXD25oPs/2p
 mZ75Fnzdr7l4tv2efMDUtwoih4Wddx+3kK4Q6nQa0YfMC8XXIeTO3tN79Cxc8Q/z
 NAKV93ESYh06MnOFp6NWzR4+2OhedVQFKOPesyYSQvGSwsjnd0CMpgZ2MilHrUQ+
 3HIKVAyhn1T2oRyf5Ie9JgNTYPdA/Qo38Bxw25FDOA63GdOU0hWgkoqGRiRn8b2w
 MftfuL+Fk5aWdqq1Y6szkYabDNzS/yVBNgdveteLR3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ImxQ1L
 R0DbrnqW0fDLZsDrM+ZJVDueyOIVlxP6rimw0=; b=X8rW5bq2/QlZe5HnCu6Wqd
 XdEh22uAjlsE61der+4K0xrXrN33Y4YkPoKCOVDqtVLpkZ9ZgU1LWaqwNQO0RiZP
 TMIDKA74pfOsL7ltj/CPKAcrms3yJ4RxUHHbzK56bekKghqCmbUUnBV/JkXpYcEn
 K99+UsgdU0jUZHFXo//6CcxWnJXUYMgzu2IBGlLM4H+BEfqpwoMJ5WdPkHn1iSf2
 6K16yTYfffC6JUt+VaPgpuCCwo4WSl2/GlDUWUm0ai/g3m1Y/MsuipVaaPxI+Yqr
 xPMuAGuv9Lac9W4BaaoPD1bJcUMpVOeHwFS6iPwqc32Jb3LT7zmjjQtvm7utWGFQ
 ==
X-ME-Sender: <xms:a13zXVtKS7zZ-oS4PYe9WbmxCrAsUwDpv1RhChf7KIpLSVfvGH9InQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:a13zXTLucGaxFKNq4HGP_zV_KU9NH57MIXmQ70aV26qprNKa4ROdeA>
 <xmx:a13zXZC_HGnbG61LwuQA11xoZD_NxED-VduRfYs5RowNsnhNKrSKUw>
 <xmx:a13zXQUt2Rg9qZ6OXcVOhzqN9n7ID1XihVdPH5nltgZY8jC378WJug>
 <xmx:bF3zXV8fzlyXpYCNAhQpH3LvjgxTsw10aJg7eIhOdl9QkBdzvUhbRQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4985030602F1;
 Fri, 13 Dec 2019 04:44:11 -0500 (EST)
Date: Fri, 13 Dec 2019 10:44:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC 3/8] dt-bindings: display: add Unisoc's dpu bindings
Message-ID: <20191213094409.lvvhwtxl4vlkvi6b@gilmour.lan>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-4-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1575966995-13757-4-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: baolin.wang@linaro.org, airlied@linux.ie, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com
Content-Type: multipart/mixed; boundary="===============0951464480=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0951464480==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xmgykvho46e6yds2"
Content-Disposition: inline


--xmgykvho46e6yds2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Dec 10, 2019 at 04:36:30PM +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
>
> DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
> which transfers the image data from a video memory buffer to an internal
> LCD interface.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../devicetree/bindings/display/sprd/dpu.txt       | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.txt
>
> diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.txt b/Documentation/devicetree/bindings/display/sprd/dpu.txt
> new file mode 100644
> index 0000000..25cbf8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/dpu.txt
> @@ -0,0 +1,55 @@
> +Unisoc SoC Display Processor Unit (DPU)
> +============================================================================
> +
> +DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
> +which transfers the image data from a video memory buffer to an internal
> +LCD interface.
> +
> +Required properties:
> +  - compatible: value should be "sprd,display-processor";
> +  - reg: physical base address and length of the DPU registers set.
> +  - interrupts: the interrupt signal from DPU.
> +  - clocks: must include clock specifiers corresponding to entries in the
> +	    clock-names property.
> +  - clock-names: list of clock names sorted in the same order as the clocks
> +                 property.

Same story, this should be a YAML schemas, but here you should
describe what the expected clock-names are, and what clock they
represent.

> +  - dma-coherent: with this property, the dpu driver can allocate large and
> +		  continuous memorys.
> +  - port: a port node with endpoint definitions as defined in document [1].

So only one? Connected to what?

Maxime

--xmgykvho46e6yds2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfNdaQAKCRDj7w1vZxhR
xRZkAQDkkC17ANn/69CaZbSnHiWEbolmYloHcKTq/lk8Qtqd+wEAhPyfDMSoPcf5
jkGbaka5QNRk6dAHQtPx3hk7RtwlXQs=
=jNnp
-----END PGP SIGNATURE-----

--xmgykvho46e6yds2--

--===============0951464480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0951464480==--
