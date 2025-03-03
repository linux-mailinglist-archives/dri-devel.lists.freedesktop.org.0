Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF4A4C13E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6010E40A;
	Mon,  3 Mar 2025 13:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dv5Qnutq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43BA10E40A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:06:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35BCB5C03DF;
 Mon,  3 Mar 2025 13:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966F3C4CED6;
 Mon,  3 Mar 2025 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741007169;
 bh=U7M2Y7GgfOD5FgmP0/yeWr/zLGKqkQ7WQ1NWRxr7fog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dv5QnutqMhY/XAsekkSXJrY0588QyXsYiwaE4fbDhCSBEv8wYviT7sFDWqcwMkMvG
 5WYxCeIKo+vzFS0/MRNQ7D0vi4xByN+gsxwykOE5AwjiXKyC0ra2FSNTEJy4h0Exmu
 koOMNTwS60k2KkGXB3XuJkif9Ehyr7jog06uaxGZoWS9Q67Td6sVlkQYxllVDhPiWU
 4GsK0KohBvshnKe6WFRTqV4SEA75XO0T60eMzJvdiijxHp6M/Dm1kF5RUUJgJ0eMu3
 PTKXmwFIgGZMn5S93JhvdKJyK1sjOMqrp1lSNoh/cO3zHTFw1fZ7h0eFNI4VwYn+v+
 jULFpATjJI67A==
Date: Mon, 3 Mar 2025 07:06:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add hothmi vendor
 prefix
Message-ID: <174100716718.1436781.17169517427487760851.robh@kernel.org>
References: <20250226112552.52494-1-kikuchan98@gmail.com>
 <20250226112552.52494-2-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226112552.52494-2-kikuchan98@gmail.com>
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


On Wed, 26 Feb 2025 20:25:48 +0900, Hironori KIKUCHI wrote:
> Add prefix for Hotdisplay Technology Co.Ltd
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

