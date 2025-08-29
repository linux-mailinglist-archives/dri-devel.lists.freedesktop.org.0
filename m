Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CFBB3B3A2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90B710EB4F;
	Fri, 29 Aug 2025 06:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OXIUtayT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595CD10EB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:49:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B0CCA60054;
 Fri, 29 Aug 2025 06:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C218FC4CEF0;
 Fri, 29 Aug 2025 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756450147;
 bh=6bcq9zt/NpRi6mq0YCfI9xt2nKhZqME42o36Ib3lF88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OXIUtayTen7s+65e3ZLlV7vTinbyBakYn6QvCkaqfAeDXk0k/IWDP9Uh0GNjICUft
 hZa0x+AVGTHCO5eqCNyoZLUr5LBsKcYK6smjyga8RrVd4+a5mhtih5gkavL1YPx64Z
 QO4nBYgDI7f13f+RIJBh4JaOhj9W+FMgw/t9fgbHYdEeMSt4jmf7Ke75wozmNh8Sti
 lWan1m7trIAx855hlbdP+LFdZl6ht58VQL5XieW0yXVsBxYY+3rFAIIokwPEC/cMMl
 BN33hu09n1FFHpsRpz6opSZopeW0PfroWFzpiZZppgg3espuV+aGFV5W+wdXCRUbSL
 NAsvSIxKld4pA==
Date: Fri, 29 Aug 2025 08:49:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Chen <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 05/19] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Message-ID: <20250829-little-independent-slug-2465c8@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-6-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828080855.3502514-6-paul-pl.chen@mediatek.com>
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

On Thu, Aug 28, 2025 at 04:07:00PM +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> MediaTek display overlap output processor, namely OVL_OUTPROC
> or OUTPROC,handles the post-stage of pixel processing in the
> overlapping procedure.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>

NAK,

Never tested.

Best regards,
Krzysztof

