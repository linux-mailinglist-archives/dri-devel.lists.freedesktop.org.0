Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D0C3ED61
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 08:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5B210EA38;
	Fri,  7 Nov 2025 07:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QhsmOxEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD9010EA38
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 07:58:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7000E6013B;
 Fri,  7 Nov 2025 07:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A34EC116B1;
 Fri,  7 Nov 2025 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762502302;
 bh=uxmerTTcORrb6gRQpPcQTSUxVg+OYTqzzOK67t9Ljfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhsmOxEikENFYBwdf+QqUISutA2BoruiWARHigdan/AxkZTUXkU+ZqsqaU7o1SG1e
 4caM9k/Jj/yL21kTkVVLCEMkgZyfsuCWtTsPJYV7La0A6Uj2AR+Bw+hkxgKzU8IwYW
 m7HaFfbGNI1TQkcDV58H6g12DVxcxD/FicE6z6OUeaXS2WTn4+3zoGnW8LeblQ429o
 Jb/tR0rLSyBEgM7ffHI/dpIaZzmti2MaCugNYKWc20KOKXmXVMGIz7/DVCzF7rvDFk
 KBWJ3n3Y896rujozkrKl7ah6fbj78rDeDkgKu/d20yqim7cxliO1VQjPPn2w4uLuum
 i1O/GVVp9i9NA==
Date: Fri, 7 Nov 2025 08:58:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 louis.chauvet@bootlin.com, 
 aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 4/5] arm64: dts: ti: k3-am62a-main: Add tidss
 clk-ctrl property
Message-ID: <20251107-congenial-quaint-tody-dddcb3@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-5-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-5-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:26PM +0530, Swamil Jain wrote:
> For AM62A, we need to use the newly created clk-ctrl property to
> properly handle data edge sampling configuration. Add them in main
> device tree.
> 
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 9e5b75a4e88e..15a9ee35dbce 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -77,6 +77,12 @@ audio_refclk1: clock-controller@82e4 {
>  			assigned-clock-parents = <&k3_clks 157 18>;
>  			#clock-cells = <0>;
>  		};
> +
> +		dss_clk_ctrl: dss-clk-ctrl@8300 {
> +			compatible = "ti,am625-dss-clk-ctrl", "syscon";
> +			reg = <0x8300 0x4>;

NAK, you just ignored everything which was said.

Best regards,
Krzysztof

