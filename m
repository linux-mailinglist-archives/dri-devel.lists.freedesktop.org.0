Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B965E11F245
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6402F6E384;
	Sat, 14 Dec 2019 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949816E2E5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:42:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 50400226F2;
 Fri, 13 Dec 2019 04:42:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 13 Dec 2019 04:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=efSLo1ioRmF/f6oNEX/AdyV5w6C
 Kaeb925GBxZ1IFkE=; b=dmSZQE7luPBV3T7VSXXb4VEZoSLHWXls6egM7ESgcq4
 R1Q5pNYJ/SK4j3F8HUwDDHyKazoaDFWneUyZtz4BPWuRrFo2KyS0/NdtXKbrBdAd
 y9aXJav/zNMX7o1vKy+bwzsWIUHCPQdZihxOXoGazho/gX5+Oh9+ryZcsgjlbfE8
 cDzOcupNU6s9sekP2HDNZ1xKGpAvAABxBa/9GE0aEXmbpWS5Hif8LfMDxc0Tb+zf
 ilhdOljkMTcW33NCtycbh+OiJ5zp7n1XeARcSI2SP5q1B66SzenF/M3BzO0cjLG0
 oMUcPjTHMbQdtkxgtus7JMJUY1wmsgHe7RZQxfYU98w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=efSLo1
 ioRmF/f6oNEX/AdyV5w6CKaeb925GBxZ1IFkE=; b=ELxQvu6l1AeghcqfTvEk72
 saYoo8e8zPVBAALuB5ARkzxQaT6c2BPeAw7UkDH+bwfYPnyh4tNTFH7ZGfL5z8Xz
 qrEiaPc91At5JFL4eGEg7E7u2G/uvmhcxAqIsuk0K8C2gJ6M6cdq40+RJgdaIaVq
 CmyeU1SqzHxGOgxo8k4Bs/S3DwhUYBgQbYGVuhM8aVgSXAnD6RU1sHH0WqsVZX61
 HI5yPzqV2UZFTMtbZrs1hTMSFWwSztO5d3OHaLT/v3/HyGUqL5lFwlRn4HFT4RmQ
 G5b8bVBqwYElYIpw3ihUnqRH8Pm6NgaPso1XdAi5fb4HFMummAWBfj7lUJAsVlRw
 ==
X-ME-Sender: <xms:91zzXUaI_NeYL298GYbyRLDqAYP2KQFySu2uEaYDYbURyXfyN5ANdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:91zzXZHMCQseKT_xL8Ewy-P6nBT8l1khzgScL6DZN58ri4bCu9Q9Qw>
 <xmx:91zzXeSgA9RFN6DuAbCCrt0RhE1A7MLpjZt6lKENV8gLjv4ZbjRKrg>
 <xmx:91zzXWt3SaK8MaKhFqQKlSpBuZMPxkG04lmWcLbjsSx9xqFdo0NwKA>
 <xmx:-FzzXYmgIn-xsojpoeIrvAsfB4YQe96vyKBY1ruii52lnRTdSYnHdg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3256F8005C;
 Fri, 13 Dec 2019 04:42:15 -0500 (EST)
Date: Fri, 13 Dec 2019 10:42:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC 1/8] dt-bindings: display: add Unisoc's drm master
 bindings
Message-ID: <20191213094213.5eetnprhwolssdbp@gilmour.lan>
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-2-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1575966995-13757-2-git-send-email-kevin3.tang@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0374978534=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0374978534==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ydjubsryd27sfjsx"
Content-Disposition: inline


--ydjubsryd27sfjsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Dec 10, 2019 at 04:36:28PM +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
>
> The Unisoc DRM master device is a virtual device needed to list all
> DPU devices or other display interface nodes that comprise the
> graphics subsystem
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  Documentation/devicetree/bindings/display/sprd/drm.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.txt
>
> diff --git a/Documentation/devicetree/bindings/display/sprd/drm.txt b/Documentation/devicetree/bindings/display/sprd/drm.txt
> new file mode 100644
> index 0000000..7327b9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/drm.txt
> @@ -0,0 +1,18 @@
> +Unisoc DRM master device
> +================================
> +
> +The Unisoc DRM master device is a virtual device needed to list all
> +DPU devices or other display interface nodes that comprise the
> +graphics subsystem.
> +
> +Required properties:
> +- compatible: Should be "sprd,display-subsystem"
> +- ports: Should contain a list of phandles pointing to display interface port
> +  of DPU devices.
> +
> +example:
> +
> +display-subsystem {
> +	compatible = "sprd,display-subsystem";
> +	ports = <&dpu_out>;
> +};

You should be using YAML schemas to describe your bindings nowadays.

Also, I'm not sure about how the display engine (and its component) is
going to be integrated into the SoCs, but usually have the name of the
first SoC to use it is a good practice in the case where there's a
second generation of display engine coming up in the future.

Maxime

--ydjubsryd27sfjsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfNc9QAKCRDj7w1vZxhR
xWjCAP9+RHPQU7IQY7UgNoGRVTC9xxrprwGFIvhh+jpm/mA2CwD/a/yUzjPw2Pim
8CJuodPMEdclpB4AlTUXTO2caVatRQ8=
=8l90
-----END PGP SIGNATURE-----

--ydjubsryd27sfjsx--

--===============0374978534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0374978534==--
