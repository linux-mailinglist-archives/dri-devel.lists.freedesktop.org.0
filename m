Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991EC79121A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A91310E2B4;
	Mon,  4 Sep 2023 07:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077A010E2B4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:28:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A8A74CE0E2E;
 Mon,  4 Sep 2023 07:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485B6C433C9;
 Mon,  4 Sep 2023 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812487;
 bh=vv1R6EaW7tEtWylwxWVKrsPq//31aiakhEZ4nF2yOtk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=OdVJ9D5h85L1MPnu9JSDK/8+2EPO4I3Z4kY1PMpn+97l/phlhuCh0rRgGQpbrU7S+
 M4jES4FVTInTA2aWcZaO9EI5Cg2d2IUIow+IiL5B86wc0GM0NHIG8J2tRLiLGDvGON
 M0jTxEjwM3tOvltgYidXVTdOhZH7larSXjaunRSL1V+dG05XysCG1zVj7nvUJzMRbX
 uB+49/FrEhNisMhQVcXuENb2+yMolNGv/TyNDpmJKG6YOH2axEgxmPp9qM1TPAAiM0
 +bhFRLomg7rWRNsmB72OuHE1+vhxK5qWd17AbHEgy9AlW2Jt/jEtJOrzOrb76HVKYb
 BNecyVrO3XtBA==
Message-ID: <45638a5a3ccc08a7f55036d15b75b7c3.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:28:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 07/15] drm/tegra: Call drm_atomic_helper_shutdown()
 at shutdown time
In-Reply-To: <20230901164111.RFT.7.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
References: <20230901164111.RFT.7.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, Maxime
 Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org, mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:18 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
