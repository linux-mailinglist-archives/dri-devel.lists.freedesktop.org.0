Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AECAEB08E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46B510E711;
	Fri, 27 Jun 2025 07:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DKO0CNfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F73D10E711
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:51:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7469D5C6846;
 Fri, 27 Jun 2025 07:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3A6C4CEE3;
 Fri, 27 Jun 2025 07:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751010703;
 bh=HGb1vMXe32XsSHfWcRtFI+ZGqVxo4y7L193Fa0hYiy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DKO0CNfZ4IXFHB5zuTVdQuBwCskytFKoc6N8r8vNLZFAqnx4ojvWhjHPE6Q3RFPEv
 CUirkN7UIYP5clNMpKUH9RifG9a6dZwNFJDG9oXLGc5+3a2HdZFGxzvHkLtTeR3Uf8
 7EdEoAf0fv6EIjk2A43+zc5oHt9qCkYeH6I7GOY2qC/WirVh1XrX3saKJmgF2P35+/
 J56GaDz5V32iFERE+wVSF8rBiTDm3xLdBA90XoZ61J5iBHRnuVH7hJiiVlXdDybmNr
 XmOXBv4R0dEAsF1zlYk2Orz6r5gEGjhdFY8xv15MuOTuy9JTi54Qr9cUSR6yy9rB5p
 SINPkyZn08ojw==
Date: Fri, 27 Jun 2025 09:51:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
Message-ID: <20250627-garrulous-cuddly-flamingo-b4ebcf@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
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

On Fri, Jun 27, 2025 at 02:02:37PM +0900, Inki Dae wrote:
> 2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21,=
 Kaustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
> >
> > Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> > - May optionally require an IOMMU to initialize a display region.
> > - May require a port connection to another block, say an MIC or a DSI
> >   master.
> >
> > Document these bindings in the devicetree schema.
>=20
> Applied.

Please wait for DT review, giving us few hours is not enough. Please
drop the patchset, needs fixes.

Best regards,
Krzysztof

