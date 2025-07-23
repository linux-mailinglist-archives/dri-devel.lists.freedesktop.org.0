Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F1B0E978
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 06:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A9110E32A;
	Wed, 23 Jul 2025 04:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h7soUqhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34D810E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:12:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 229AF459EC;
 Wed, 23 Jul 2025 04:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01C4C4CEE7;
 Wed, 23 Jul 2025 04:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753243961;
 bh=eVTqUw0f7/1nbbH+ENzIvcMr4jRuFi04bWinogCv0LU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h7soUqhS33sWbErFUno1ZIAuuM4oKiJqTr3uQC1Gr/8lfj/V5e899lLDMvCx1qvZ+
 P2BC+xDPIlyDS8C/d2a2zMC4CC+Y30mNeHmSdUYQos+1omuWpjNhZSLU84nbCCwQHm
 mFEK/pmAeezYduQBC4+ru667WR9ynBv0x5TtKyqlekWOJqCm4dA/UWBmK7GvbgpAIf
 CwC41H7A+7D30R+UVbRtZKI126fuk+ZsqKLhtQEcOI/umfWc5IVN19giVe13jCDg8V
 P1uQMJaxTP+zWhdvenr8cAdhEVefHxtnjuXjSAayTErQ+UxuHcIBhy4/PlGYxe9aG5
 eR4ScutldhOjg==
Date: Tue, 22 Jul 2025 23:12:40 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: display: imx: convert fsl,dcu.txt
 to yaml format
Message-ID: <20250723041240.GA1085293-robh@kernel.org>
References: <20250616182439.1989840-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616182439.1989840-1-Frank.Li@nxp.com>
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

On Mon, Jun 16, 2025 at 02:24:38PM -0400, Frank Li wrote:
> Convert fsl,dcu.txt to yaml format.
> 
> Additional changes:
> - remove label in example.
> - change node to display-controller in example.
> - use 32bit address in example.
> - add interrupts property.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Stefan Agner <stefan@agner.ch>
> ---
> Change from v1 to v2
> - add Reviewed-by: Stefan Agner <stefan@agner.ch> review tag
> - add interrupt
> ---
>  .../devicetree/bindings/display/fsl,dcu.txt   | 34 ---------
>  .../bindings/display/fsl,ls1021a-dcu.yaml     | 71 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 72 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/fsl,dcu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml

Applied, thanks.

Rob
