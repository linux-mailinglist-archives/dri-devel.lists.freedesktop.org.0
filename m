Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF9984268
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5805310E68F;
	Tue, 24 Sep 2024 09:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sFyUFJiC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060FA10E68F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2D7BA40DA8;
 Tue, 24 Sep 2024 09:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE78C4CEC4;
 Tue, 24 Sep 2024 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727170866;
 bh=9R/JeGA/tbNjcHBGgjfglgjkxBOJ7el7zfZvshWkQt4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=sFyUFJiCVY1kqIuviL6F3RbN0r5ajQexdKXFZ4FrXsYJ5Ib7D5KIV+K1IfS8nr7mm
 KZ+i+JKLl4cAu6BzG2uIP04AeKaMIMKZ80f+hbdNLpEhIU+uTz9qrnPY/KRB7JV9vr
 PPilUygYW0bcjG1o1JMC8fcUpAcLAhLq2Qy11dH6H+a06sBcX8nUKe/MYXcXX3wKn/
 yRONaDRJnBj2NSzWG05c0r9ZT19i6inklpqkzW9bpH8mQODa+1IvCeXXi8iEo2Vf2+
 ME4xo9WrjExQ8kJ1bwyBWvjPj/AFNxS/d9YzEU3qzkstE4zxuLyYqa8dLN3R1lUZ56
 tz/wJLeObopaQ==
Message-ID: <5c67dc9b6c0ef3942e933b4a0f7bb605@kernel.org>
Date: Tue, 24 Sep 2024 09:41:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sandor Yu" <Sandor.yu@nxp.com>
Subject: Re: [PATCH v17 2/8] phy: Add HDMI configuration options
In-Reply-To: <c9c0c1c2e156731a46ffe0cfa3529e6f0e6a1e5f.1727159906.git.Sandor.yu@nxp.com>
References: <c9c0c1c2e156731a46ffe0cfa3529e6f0e6a1e5f.1727159906.git.Sandor.yu@nxp.com>
Cc: Laurent.pinchart@ideasonboard.com, Sandor.yu@nxp.com, airlied@gmail.com,
 alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org, neil.armstrong@linaro.org, oliver.brown@nxp.com,
 robh+dt@kernel.org, s.hauer@pengutronix.de, sam@ravnborg.org,
 shawnguo@kernel.org, vkoul@kernel.org, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Tue, 24 Sep 2024 15:36:47 +0800, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
