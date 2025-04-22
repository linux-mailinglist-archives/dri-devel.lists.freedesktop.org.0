Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C77A96B31
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 14:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B914D10E593;
	Tue, 22 Apr 2025 12:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mqv1fjn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDA10E593
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 12:57:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7965F614B1;
 Tue, 22 Apr 2025 12:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D928BC4CEE9;
 Tue, 22 Apr 2025 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745326661;
 bh=7dlh5sTBdRuZ2Bg+8MdaehXxpA2cWo7MIUoF0rEuoXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mqv1fjn/sGIynYcLQiHgIZiXFjkpMvcV4tZpjEBCL8wiiS1iMlpRR9I1MI6taju/U
 9DUumBe6znBGQvPSZguVS9Cbl6rJzUyX7EeHSHmSvmnEci83aIb1ogEhq5/PQQgp8j
 rX2ucOVfK+ahR1iHSlai5QSQkmmsFwvBVyPlubnnao3pFXYD8ziH/e5v4cGotdt/Ru
 lzT4tqiyagrTvEpVExNaovg7YCnpHSWqDWKSSJLr4fogd08+NJMTZkVSMWHvVCcS3v
 l30mKitkCTHXdmPXRuq9WpN3SlENZfDTE9VfbpS12ffNRCGeiWrzXQXnuRb4QlfAcy
 Lw/QXtpRGt9Sg==
Date: Tue, 22 Apr 2025 07:57:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl,tcon.txt to
 yaml format
Message-ID: <174532665835.964068.3642003641817141709.robh@kernel.org>
References: <20250417151134.3569837-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417151134.3569837-1-Frank.Li@nxp.com>
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


On Thu, 17 Apr 2025 11:11:33 -0400, Frank Li wrote:
> Convert fsl,tcon.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/display/fsl,tcon.txt  | 17 --------
>  .../bindings/display/fsl,vf610-tcon.yaml      | 43 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 44 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/fsl,tcon.txt
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
> 

Applied, thanks!

