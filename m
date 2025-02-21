Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C06A40346
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 00:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C5210E0B1;
	Fri, 21 Feb 2025 23:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tgvJqDQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D63810E0B1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 23:04:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E45116831F;
 Fri, 21 Feb 2025 23:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F20C4CED6;
 Fri, 21 Feb 2025 23:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740179079;
 bh=TD01oMs/cT4X0Fy2SpIRvb3nsE0dn+rUszo1Uxi/EQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tgvJqDQdtUNY39WPOqVS0RcbLiV6KR6BcEFsD26sDIRauIw7lst3emjdm7zbEwCY6
 n4xAfwbp/icn7AafbN1reijfR+ChYIQh3r3QzKKEaDqlN2ypBeRkWq8guD8YVAN9ZN
 t1IoLIqNAjSv4PPZpO4dy11dFfjku+Bs76eBWlunAVpjZkBStElkKlu/oRc7qX+Mi2
 FrEbRtbn5f0kQzLVDFyExrinB1rKTbbr/Y3jwE9yU6AxX+63LGhBLy7psl/UP4PZyZ
 6ooYaar6fKyRn7oYwb5w7kqkpucekupVCgrqVG8IcQjYvW1pvousLuZoc5/fBtwwVc
 /M5VE/EtMmlaQ==
Date: Fri, 21 Feb 2025 17:04:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <rfoss@kernel.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindigs: display: extend the LVDS codec with
 Triple 10-BIT LVDS Transmitter
Message-ID: <174017907686.233693.6584851812411863603.robh@kernel.org>
References: <20250220094456.32818-1-clamor95@gmail.com>
 <20250220094456.32818-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220094456.32818-2-clamor95@gmail.com>
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


On Thu, 20 Feb 2025 11:44:54 +0200, Svyatoslav Ryhel wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> LVDS transmitter used in the Microsoft Surface RT.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

