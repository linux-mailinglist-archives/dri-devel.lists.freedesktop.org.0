Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD6AFAB35
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 07:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6771D10E401;
	Mon,  7 Jul 2025 05:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HiN2X4Ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DBD10E401
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 05:48:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE3E943BAC;
 Mon,  7 Jul 2025 05:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAE0C4CEF5;
 Mon,  7 Jul 2025 05:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751867296;
 bh=z9QN/N6kVsbMUbthlPPWA6t1axlzGJzBvA+FmlSX6dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HiN2X4IbQMeCVFIN1EgzFwjzH6PHJWykCp4CPCcUiCBdjfaR9tKeBzT8JCaMPeEQZ
 UJZLeAFSPfiuwfRZQ8g8epxpxJ+yMgUlqNI2Bk8wEfcOYhS+C8IKLJCi/Q6vQPkj0P
 OhPQoWGI3VBJNpK/XDVosYT4m8BIvCE18EKQX9GuUhyVg6VFroW0SvOg/PD89Fl0qJ
 j+ao529CPlRJLzlT47K6WX8Ste2z/iq+gxO2kBAA7GS6k5tf2j4ZOnu+ENqyqwmafz
 G8JaQMMz/vQL7fFMr6TH7Oc1PmYhLOZHzyc/R1HN7i61XepWAJDxYZsbAkjU0UURcP
 0PvOlaXwIdxMw==
Date: Mon, 7 Jul 2025 07:48:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 03/13] dt-bindings: media: mediatek: add cam-raw binding
Message-ID: <20250707-crazy-loon-of-refinement-feef9e@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-4-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-4-shangyao.lin@mediatek.com>
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

On Mon, Jul 07, 2025 at 09:31:44AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-raw.yaml
>   - Various fixes per review comments

Which fixes? This is way too vague, considering how buggy and poor this
code is. Where was v1 of this?

Best regards,
Krzysztof

