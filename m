Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C1C6F7FF9
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 11:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D44E10E5B8;
	Fri,  5 May 2023 09:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B88210E5B8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 09:28:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A967B63CAC;
 Fri,  5 May 2023 09:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E38C433D2;
 Fri,  5 May 2023 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683278914;
 bh=1RAXc0NiBF7f+OxPfJ6Q3iIY0ISS03O5QOmWMYZ+Rxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lp9dhKV7U+yAXz8XoM5uYwnqkHMpOJNX4AafF2rX6XK9yCWv+doTi4UXb7tvPuA10
 KNpEYJcc5CUUlgK03TE5D+xnA6DFAISKGJiyGMQ1fIpHDx0WtWbMiILEi9dCKltMfE
 56Za1I3RJr7hcZUswM+W3tU6MFowUECKSjxGFMjKiu79cHbLzMhQu5pfyeCN2+3JP9
 e1kWLDtSmwvSBYQ1amkgCeE+wBlNORJn4wpB/ZX/9DneqFgbaNLwEn5mmAucnMZ1cr
 lDtHvKC5USXt8j2jaM4vXqNiPYskuLsmL2dzeUEZQbIx4sswbzPYNHvVjz8f6Y2FF7
 Z2swNdODgi6JA==
Date: Fri, 5 May 2023 14:58:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Message-ID: <ZFTMPWp8LhwA9uHz@matsya>
References: <20230414122253.3171524-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>
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
Cc: kishon@kernel.org, chunkuang.hu@kernel.org, granquet@baylibre.com,
 linux-phy@lists.infradead.org, llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14-04-23, 08:22, Tom Rix wrote:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>   'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (ret)
>             ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.

I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
usage in pll_calc"
-- 
~Vinod
