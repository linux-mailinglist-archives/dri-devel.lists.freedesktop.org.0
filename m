Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED77AD232
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E051110E213;
	Mon, 25 Sep 2023 07:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3696610E213
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:45:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 413A6CE0EA2;
 Mon, 25 Sep 2023 07:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A379C433CA;
 Mon, 25 Sep 2023 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695627921;
 bh=d5HRu8E3T8PlMucp89AFZaeFnM4xuCGURMulBdsftuc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=AuDrplQfoyK0oYMpRBAWhHQgA4eO3/i7blRD2DiY4zqJpwDHJ8OfudMcercfjTF/G
 qqOkunfDb4A2g3pnsIoDzQcfMPIVCUjF8UJdWsXDm1y2wgmqrzpmz68jQHU1x69Lqr
 +0djr1b3TPFEM6hOM2jjKxXYclpnzMSJEiRcQy4QbuAecDOGjE4WlljnUEARzPanlW
 IwjeQAvLJVmRQ+xbc3AaQga2VR9tS9KYFYHj54nWrI69Z3lgmqhv+gIf2kusfyk1n8
 kDASnZmplaV9PgubXpW67Y9CQY+7qOudbuxneBx/DlwCHsRnhSxOCagrI2SD+y9l4F
 ckFy7PnfeC+Dg==
Message-ID: <50beeef703d81daeb00599b60ecdfa61.mripard@kernel.org>
Date: Mon, 25 Sep 2023 07:45:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 4/7] drm/sun4i: Don't show error for deferred probes.
In-Reply-To: <20230924192604.3262187-5-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-5-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, Maxime
 Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Sep 2023 21:26:01 +0200, Jernej Skrabec wrote:
> Drivers probing in display pipeline can be deferred for many reasons.
> Don't print error for such cases.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
