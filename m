Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F1589AFC8
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 10:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531F710FA6D;
	Sun,  7 Apr 2024 08:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SsYhQ30R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AF510FA6D;
 Sun,  7 Apr 2024 08:49:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76F7ECE0303;
 Sun,  7 Apr 2024 08:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B894CC433F1;
 Sun,  7 Apr 2024 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712479777;
 bh=9GexqZRzYwWDDWeEy+/lg6I4B9teFNss+7Iws8stJWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SsYhQ30RiNQ08UMek5dA4CNyvVWLNNLOpkEsyduifmK1Tj4XpLRA7LVTj2YkBDZXm
 N7VzP2/DszZcWNJWdLmA2CqdSWEXTAzNUlTq/TSjEANRYJ434Df6+129CUqRDVP7DN
 eBOQTNlDk9lZRGjvjHo3mMxetTDsvzrvfl8qiJ2t5enPne6X3kTA5g9tJCFUIAEElV
 d1W9EScb9v5p2WyGdUSWR27nfRbEus4VWc/L5Dn5ww2OmyxQpNBk77r/x9HroCKCu8
 HJrvhoBs1p93fhFJek+k3PGtGkmy8k13ooNYdNqrwGRCebsszSc95EsJ0gTn4Z5ycQ
 tOkkQIJjbsJxQ==
Date: Sun, 7 Apr 2024 09:49:29 +0100
From: Simon Horman <horms@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:SFC NETWORK DRIVER" <netdev@vger.kernel.org>,
 "open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 10/14] sfc: falcon: Make I2C terminology more inclusive
Message-ID: <20240407084929.GX26556@kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-11-eahariha@linux.microsoft.com>
 <20240402082951.GG26556@kernel.org>
 <cd983b4d-70dc-47b8-96cd-55bba39eb892@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd983b4d-70dc-47b8-96cd-55bba39eb892@linux.microsoft.com>
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

On Thu, Apr 04, 2024 at 12:17:26PM -0700, Easwar Hariharan wrote:
> On 4/2/2024 1:29 AM, Simon Horman wrote:
> > On Fri, Mar 29, 2024 at 05:00:34PM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> >> with more appropriate terms. Inspired by and following on to Wolfram's
> >> series to fix drivers/i2c/[1], fix the terminology for users of
> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> >> in the specification.
> >>
> >> Compile tested, no functionality changes intended
> >>
> >> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> >>
> >> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> 
> 
> Thank you, Simon, for reviewing. I believe that we are settling on controller/target
> terminology from feedback on the other drivers in this series. Would you want to re-review
> v1 with that change, or should I add you R-B in v1 despite the change?

Thanks for asking,

either way is fine by me.
