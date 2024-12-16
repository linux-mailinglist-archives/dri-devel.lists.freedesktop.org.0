Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1949F306B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B437410E07B;
	Mon, 16 Dec 2024 12:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m70PDl/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459F10E07B;
 Mon, 16 Dec 2024 12:22:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C1FFA40F71;
 Mon, 16 Dec 2024 12:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3911EC4CED0;
 Mon, 16 Dec 2024 12:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734351732;
 bh=sYGW3Y9AL8MA15VhtTGbbib77B3Opo62zgWhtdTYfZA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=m70PDl/TWAjAI+Vxqc0pAJX6hqc6n2ri02ds9Cf6X5LllehtHXQfTe2MmasHatDWA
 FtOH6rlfaLdMz/GAPWnsGkDdlVzcjK1up7PKi3obwUC8LJ4n/tJLRiMKqhkmvwctBk
 /ZFrIJZd829Vplc6Q5tzaH1wh/jQiqBUg/wHXqq3Lt5Pwg0HBYVO64PtSeK1kez3k4
 JBD2ZZUcg2FjNsN8jVazDj4XHqBuRSPyLvkh9JnmZCGmxnkmxn5ZDasXNZ7AgFuuZD
 Ityjtr2hwxVLJIfQvX4d7NatMcj9gqGY3af/6XJP7WDbLNDjiqX1UPiLPSBqpsRgbs
 +h88fKZiRINKA==
Message-ID: <b4d45c15bab166910117ced3d8390b89@kernel.org>
Date: Mon, 16 Dec 2024 12:22:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Imre Deak" <imre.deak@intel.com>
Subject: Re: [PATCH v3 09/11] drm/tests: Add tests for
 drm_connector_dynamic_init()/register()
In-Reply-To: <20241211230328.4012496-10-imre.deak@intel.com>
References: <20241211230328.4012496-10-imre.deak@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, "Maxime
 Ripard" <mripard@kernel.org>
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

On Thu, 12 Dec 2024 01:03:26 +0200, Imre Deak wrote:
> Add kunit tests for
> drm_connector_dynamic_init()/drm_connector_dynamic_register() added in
> this patchset.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
