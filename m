Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7C160D07
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345316E8A2;
	Mon, 17 Feb 2020 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944146E85C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1581707435; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAiS2jYAHYbz6sUAhqIh9UKM3iu7+r/pmnppfM3rHqU=;
 b=WobT/OnZYAUEs4Nc4TOqp4Sm2qflko6z2DkafPikKQfBhoVoo6BfWn2869RvoI2nZ2tQ4M
 oY8BydVknWqKe23bED7frFgMlFN1x5HAX1JetPw6nwg66ZG9JB7SjW/khkD/XRQKOxtFgL
 4i+rs4o33F2wkh0B70Sr7PyXN5lfuv8=
Date: Fri, 14 Feb 2020 16:10:15 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 03/12] MIPS: CI20: defconfig: configure for supporting
 modules
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1581707415.3.7@crapouillou.net>
In-Reply-To: <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
 <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Boddie <paul@boddie.org.uk>, Kees Cook <keescook@chromium.org>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Patches 03-12 only touch the same two files - ci20.dts and =

ci20_defconfig.

Unless someone strongly disagrees, I'd suggest to squash all patches =

that touch each file together (except the ones with a Fixes tag), I =

don't think we really need that much granularity here.

-Paul


Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> Not all drivers need to be compiled into the kernel.
> Support building and loading of kernel modules.
> =

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/configs/ci20_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/arch/mips/configs/ci20_defconfig =

> b/arch/mips/configs/ci20_defconfig
> index be41df2a81fb..e0d3c9d4c2ae 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -1,4 +1,5 @@
>  # CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_MODULES=3Dy
>  CONFIG_KERNEL_XZ=3Dy
>  CONFIG_SYSVIPC=3Dy
>  CONFIG_POSIX_MQUEUE=3Dy
> --
> 2.23.0
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
