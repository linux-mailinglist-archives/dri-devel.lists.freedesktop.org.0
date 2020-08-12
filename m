Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC6242D6D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 18:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904DB6E0AD;
	Wed, 12 Aug 2020 16:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751C6E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 16:37:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D5F79E7;
 Wed, 12 Aug 2020 18:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597250228;
 bh=QmJA0vmDc6NASV0Rz2czWAKrP/6tjXSocfENCDTPmtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMNRsLkztTjvknOfpJVv319ZRKiwiZKRWyWr9mvqNpnY/wY6+YB6PEIDkNBq9ulvx
 LP7DCimL6MNyQO4cPPM5BeoElihJPmqiCZ/BFYkhd30JptlqsU+QgRQEctUv+cVvco
 RmWbqUOPAj0RWQ2G9i/z+i2DpDw4gvOfSTmCCh+k=
Date: Wed, 12 Aug 2020 19:36:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU
 clocks
Message-ID: <20200812163654.GT6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

Thank you for the patch.

On Wed, Aug 12, 2020 at 03:02:17PM +0100, Lad Prabhakar wrote:
> Setup up the required clocks for the DU to be functional.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
> index cdbe527e9340..12f9242e263b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
> @@ -24,3 +24,14 @@
>  		reg = <0x5 0x00000000 0x0 0x80000000>;
>  	};
>  };
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 721>,
> +		 <&versaclock5 1>,
> +		 <&x302_clk>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.3",
> +		      "dclkin.0", "dclkin.1", "dclkin.3";

I have no reason to doubt this is correct, but I also can't assess that
as I don't have access to the schematics.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +};

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
