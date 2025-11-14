Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1DC5DF5B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 16:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DEE10EAB6;
	Fri, 14 Nov 2025 15:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="hyQRb5Dr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Fri, 14 Nov 2025 15:45:09 UTC
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407A110EABE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 15:45:09 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id C416D1FB01;
 Fri, 14 Nov 2025 16:39:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1763134769;
 bh=+n2jQLHIbyJVzOQ1DnRlrFwOMqiMdgedNP4TIuFj/1I=; h=From:To:Subject;
 b=hyQRb5Dr8omzynZ/UcQGIUjOD5CmwshBN5J1diwKAYRPdKWZyfIjzOojSh0vnUq4P
 eVs9OsFmCmzGshrgXSyIAlI5orR1p/Fa+AvrgZp5jtHGI5+KmD4y2cGx9wJexvhrtB
 9shN/XS0szeEfNWbRFVbso5fsSshimK+kqczg8V4ZCuyP/MwvmbhQTS59C6+V2Vs9U
 sjYRZTMZh4ub0G1d0b4FSvELEafxcQVNWvr2NYwlpcga1r+noqEGgdpfh19WrTiTWy
 nRprAUly5TCBZONokq6+0ZgjIQMwgFExSVVJHjNcGDGlSG3GNBLgJBBudjnhqhweZo
 DmCfPsZYHdLew==
Date: Fri, 14 Nov 2025 16:39:25 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, aradhya.bhatia@linux.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, praneeth@ti.com,
 h-shenoy@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 2/3] drm/tidss: Power up attached PM domains on probe
Message-ID: <20251114153925.GA62911@francesco-nb>
References: <20251114064336.3683731-1-s-jain1@ti.com>
 <20251114064336.3683731-3-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114064336.3683731-3-s-jain1@ti.com>
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

Hello Swamil,
thanks for the patch.

On Fri, Nov 14, 2025 at 12:13:35PM +0530, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Some SoC's such as AM62P have dedicated power domains
> for OLDI which need to be powered on separately along
> with display controller.
> 
> So during driver probe, power up all attached PM domains
> enumerated in devicetree node for DSS.
> 
> This also prepares base to add display support for AM62P.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> [j-choudhary@ti.com: fix PM call sequence causing kernel crash in OLDI]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

you need to add your signed-off-by at the end

Francesco

