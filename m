Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8A791222
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C28E10E2B8;
	Mon,  4 Sep 2023 07:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37110E2B7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:29:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 792DCCE0DFD;
 Mon,  4 Sep 2023 07:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09165C433C7;
 Mon,  4 Sep 2023 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812563;
 bh=PRA3H82ybDOf9DJLT4rwNUddGU4EaNl/YQ8Qq5VMpas=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=LTIT8YFdMGqbayYgPki4zmtkGRqZfl2hemY6u9ohRbB8l5I59aHayatsFaFR0A+x/
 llXeb9AWUghAJ0FNIYU1+xGtyZpjItnTyrJQ/mNXg3qGfATOJxT5jiG/xb9VRpnfQo
 /s8CNea5W5+l1hIIUzwiGRP/LW6dDy+YYMlM004tFnKCbBPTaDwoNlrgYIYCWDz6k2
 elcRL8wafAU3rg61Bhao58rC39X9ShVLGrbPNafOzdJwynhWqrxTmPQCs8IC3+nD61
 VLkh3u/7lvFFfVfJHKU8CxCKr8GZgkg+IV7jouvBpLK2ZYuHZEvxcLe2QN0t+za1Vo
 evdPY+82UgGWg==
Message-ID: <5e96e33bae187493e5f765bd7be4f2e2.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:29:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 12/15] drm/gma500: Call
 drm_helper_force_disable_all() at shutdown/remove time
In-Reply-To: <20230901164111.RFT.12.I1be622999c3b23f28f077fc75bb0319396a216e9@changeid>
References: <20230901164111.RFT.12.I1be622999c3b23f28f077fc75bb0319396a216e9@changeid>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:23 -0700, Douglas Anderson wrote:
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown(), or in this case the
> non-atomic equivalent drm_helper_force_disable_all(), at system
> shutdown time and at driver remove time. This is important because
> drm_helper_force_disable_all() will cause panels to get disabled
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
