Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222A80C3E8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58D010E36C;
	Mon, 11 Dec 2023 09:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C27910E36C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:02:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 495A461047;
 Mon, 11 Dec 2023 09:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72055C433C9;
 Mon, 11 Dec 2023 09:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702285320;
 bh=3MIDGMg0DaLWUv6RyZ5Wp/wkaZERzjzt0+cUWZ37u4Y=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fKjoJBhouqj6xZ8DXecBW6mjCEZcnD2IjP6ySCfwfwk+rjtps7mGto1WTW3r+PnUC
 A419caE2Z7j2TO/01gKp4dHW77oxRuzEwD1g/PpVIP96PpZkNoVXw7VgJvT7dLGWMk
 Mv/3E4SBSP1eG28ABNoFpAatuFmDICUrE94ZcA8ZzzZIaMylsQQeZFIDPmO524WeW7
 kRwHPGwIwBscOWsW/hyIep2S6cAuz+FJKUYkLD6dRSu+QuP9+gK5tLxvS34KS5SUJQ
 Pt+1yUxgaEkeFHIOQpJ7qtRpYIMzdSNdJTyrClyFiJ8zCq2EKRjQd4qUEDV/LrcxAB
 N9wnodkuczA1Q==
Message-ID: <5fe1989eabc5b07faa4d8cafec29a61c@kernel.org>
Date: Mon, 11 Dec 2023 09:01:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Marek Vasut" <marex@denx.de>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add AUO G156HAN04.0 LVDS
 display support
In-Reply-To: <20231209063714.1381913-2-marex@denx.de>
References: <20231209063714.1381913-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liu
 Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Elmar Albert <ealbert@data-modul.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Dec 2023 07:37:00 +0100, Marek Vasut wrote:
> From: Elmar Albert <ealbert@data-modul.com>
> 
> G156HAN04.0 is a Color Active Matrix Liquid Crystal Display composed of
> a TFT LCD panel, a driver circuit, and LED backlight system. The screen
> format is intended to support the 16:9 FHD, 1920(H) x 1080(V) screen
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
