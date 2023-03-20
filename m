Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E376C0DB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 10:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5123E891BA;
	Mon, 20 Mar 2023 09:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D17891BA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:53:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20AE7612DA;
 Mon, 20 Mar 2023 09:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C00C43339;
 Mon, 20 Mar 2023 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679305994;
 bh=D5BHlxKKNnfm+orqjuQfYDNb8O0fSKI6DJrwJTX1coU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i34lSCHJ2lij3k41ZH5uuH6oo6pHBkmRvOPrjx02c7BH6CocKB+wa7IxPrKrNvjnM
 TizekFABjr4+eWsky5fM6vzJb5MGiX2QYLeEDA2UdcsyIwOiKR8tb0ffAjc3GxuGah
 MemgsnBWBLyfNOBXa1MgHllkt48Jtz4mg4/Ev0sMf8uUheVXS6OsjLRsp+2afUKoNd
 qA0kvzNr/XewrfUZR0Kr3Y+ZBct6crcUb7s5DK6HNT6dH2ZlWQ/YONuX495AjAoUAF
 YyJIyfCef2gmBkDGw23ZBNaMpLgRrNVsh3oVGoVc+qlQSTvxR/Z8c6pQUnNQEUc+/F
 jYJQyr3frYcnQ==
From: rfoss@kernel.org
To: ndesaulniers@google.com, jernej.skrabec@gmail.com, nathan@kernel.org,
 jonas@kwiboo.se, Tom Rix <trix@redhat.com>,
 Laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 neil.armstrong@linaro.org, airlied@gmail.com, andrzej.hajda@intel.com
Subject: Re: [PATCH] gpu: drm: bridge: sii9234: remove unused
 bridge_to_sii9234 function
Date: Mon, 20 Mar 2023 10:52:38 +0100
Message-Id: <167930590639.1131145.3012560086575195897.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318002321.1675181-1-trix@redhat.com>
References: <20230318002321.1675181-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: llvm@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Fri, 17 Mar 2023 20:23:21 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/gpu/drm/bridge/sii9234.c:870:31: error:
>   unused function 'bridge_to_sii9234' [-Werror,-Wunused-function]
> static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
>                               ^
> This static function is not used, so remove it.
> 
> [...]

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234 function
      commit: 5327469ec4c07977e1d824badadd2628fcd04e85



Rob

