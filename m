Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22005791255
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79210E101;
	Mon,  4 Sep 2023 07:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B94610E101
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:36:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DED5BB80690;
 Mon,  4 Sep 2023 07:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4189EC433C7;
 Mon,  4 Sep 2023 07:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812992;
 bh=ifPD/PpcFGy5BkBIW60gH1WfLi6Mtr0jzAX+D89MzQc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=BiPKLKjhSiZaGu/WeyIVG5OopwSw93yvGNubGE+4uxjPw4sUJjAnonnTG2b5hQAn9
 Ija//ja626ZM2/Qu/ROs0As9soVtMgG6fTsqa5IMlBcNo6w2ojLGDF4CWkyyS2pecy
 jnY8b2sKbavQ9rDV77C0tWar2LbH8cL6FpRjpJe/g6GOhHKXkZxcFc2XOvcePOqCWb
 JbV00ePi1e5YnngihYWwDzryeVlfjrSbADy2WqNXCiRHKNoxMId1j6yRRfo6q7Dfga
 G3vQhsYQtqNGjRRSQF52VBXiJzBZGk6Zo8GAh8yQpwsb0XEiF01MCAgpWXgDhjX8mJ
 qTHnQhn8FcRdA==
Message-ID: <26841f583f9527205554a0ae8f75ec8d.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:36:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call
 drm_atomic_helper_shutdown() at shutdown time
In-Reply-To: <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
References: <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, Maxime
 Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:14 -0700, Douglas Anderson wrote:
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
