Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A447CA42DEC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2605E10E3FB;
	Mon, 24 Feb 2025 20:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RV1Cbumd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFF310E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:34:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDE616112C;
 Mon, 24 Feb 2025 20:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71810C4CED6;
 Mon, 24 Feb 2025 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740429258;
 bh=Dz1zijiLC2wKcMtXQyblBiBq7f6O6T+gxysG03w1iWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RV1Cbumd8WV24tBKgQ5qqJ8TiYzFAliX+O20CmNduxhAJakvOuDpScQfCFfPnLE75
 0NsM+C90r2KyfKW8KyHOR/Xc7FgYWgYw9QMYRVsmh3DMZL05qWmYqMp7FcX9GY/xPu
 +cbykTKspAKorz8aB4Y4zyF04hyVn6sQSw+LHFnk1UVYTtMJKkm1+pFbI1fVP6JKLN
 iTDk0LUgEFxBXZVXdocEYsQEhM8ZmHkZ3+M/VT87q6hzEeJK4eZmyFP4ZEY4psp90t
 SnMkZTXbOWYdQiI8IO4W7sYK1DcpamtMcu2eguZsEKzdWdVHvqASvuJTIltEEAx0Yj
 nYUhMzZxfrPOw==
Date: Mon, 24 Feb 2025 14:34:16 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/14] dt-bindings: vendor-prefixes: add GOcontroll
Message-ID: <20250224203416.GA4048823-robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-4-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-4-5ccbbf613543@gocontroll.com>
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

On Mon, Feb 24, 2025 at 02:50:54PM +0100, Maud Spierings wrote:
> GOcontroll produces embedded linux systems and IO modules to use in
> these sytems, add its a prefix.

s/sytems/systems/
s/ a / /


> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
