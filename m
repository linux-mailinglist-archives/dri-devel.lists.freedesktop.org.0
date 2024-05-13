Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60778C476E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4838E10E15B;
	Mon, 13 May 2024 19:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OFLD3zCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5110E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 19:19:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE28CCE0EBC;
 Mon, 13 May 2024 19:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EADC2BD11;
 Mon, 13 May 2024 19:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715627985;
 bh=JVhe7vOVUPnlGpP2MxGacJlnQpO7mBINOPZS5hTa6nE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OFLD3zCKW+7SyfyyAhT+WlbUmcVf6rHVLffMn9M4W1jL5pPFUks9tsHFJSAL24Be/
 HQQAbGZECfz5y6c7COeE99YHCfGWczQSHFwH8NSnMKRHgAbTco7AsZnKZP4wAqghyB
 WGEjMAQZ9BlFH1NtW0SS5H0u6uM7SF6yKce0MOG/xpfffu4nPsATZUdcgtvbxpCz4u
 Esdy+GA9UMqYIS/8X8IqnYOBrwtvBxoF6Z+Q8ZbtzKJUplo1OJKaCTFVDjpJrAYEGS
 PGxXT9I/P7f2GZe3PwvrhiYnzJt9WMZV1gD/k1PAdNSjDIo/XAOO83eUmK/CT3gXfo
 P9IFEacMlG8xg==
Date: Mon, 13 May 2024 14:19:43 -0500
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: ti,am65x-dss: Minor Cleanup
Message-ID: <20240513191943.GA2982709-robh@kernel.org>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-2-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511193055.1686149-2-a-bhatia1@ti.com>
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

On Sun, May 12, 2024 at 01:00:52AM +0530, Aradhya Bhatia wrote:
> Reduce tab size from 8 spaces to 4 spaces to make the bindings
> consistent, and easy to expand.

"Re-indent the example" would be more specific than "minor cleanups" in 
the subject.

Otherwise,

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 54 +++++++++----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
