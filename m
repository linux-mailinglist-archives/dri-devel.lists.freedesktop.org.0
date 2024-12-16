Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA2C9F3070
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BDF10E606;
	Mon, 16 Dec 2024 12:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pWLm3E/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184510E5F4;
 Mon, 16 Dec 2024 12:22:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3C915C611E;
 Mon, 16 Dec 2024 12:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCCDC4CED3;
 Mon, 16 Dec 2024 12:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734351739;
 bh=OAQ2a41bv7yzDLrikPLnhGovWZXJRJqmvYcRrpraqV0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=pWLm3E/vI7ndd6xcDjcnnDqM6RxFTMslgVMT1U74yeIBfo2JFs02ab+QxTZXSDDlv
 BRdbK/cAQlghTTWTDmX8uE/M0bagjrxsyoKNar0RXmfMx+MGkWrGdXjBF69VgnxRis
 Y8Pq9NzgPoQwBnTcXe4jyoEk3UYjQvWdfoFwUhG5BlDsIwfg68vciYSzTUhVNbZrnr
 lr5FPPeFNSrT3t/rZLZ7hahI+G0dhvBm51dDuoqXcBFb8ezWs8U6UbwP3z8r05IOoH
 DdxuzXnztAgn7Zbw1Bzk6Hk8J+bUq5HubnMAX0D2MXvbRsvJzoX+JFHTfbjETJP6Z4
 Tkk0xVN0T5sJA==
Message-ID: <4dad98ac82672bbea27f22962d8e5b03@kernel.org>
Date: Mon, 16 Dec 2024 12:22:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Imre Deak" <imre.deak@intel.com>
Subject: Re: [PATCH v3 01/11] drm/connector: Add a way to init/add a
 connector in separate steps
In-Reply-To: <20241211230328.4012496-2-imre.deak@intel.com>
References: <20241211230328.4012496-2-imre.deak@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, "Jani
 Nikula" <jani.nikula@intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, "Simona Vetter" <simona@ffwll.ch>
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

On Thu, 12 Dec 2024 01:03:18 +0200, Imre Deak wrote:
> Atm when the connector is added to the drm_mode_config::connector_list,
> the connector may not be fully initialized yet. This is not a problem
> for static connectors initialized/added during driver loading, for which
> the driver ensures that look-ups via the above list are not possible
> until all the connector and other required state is fully initialized
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
