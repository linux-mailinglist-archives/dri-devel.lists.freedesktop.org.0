Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31461969489
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A1010E357;
	Tue,  3 Sep 2024 07:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p6lOhmw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A70410E411
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:03:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87ABBA41469;
 Tue,  3 Sep 2024 07:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2930DC4CEC5;
 Tue,  3 Sep 2024 07:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725347030;
 bh=M8yZOI4ljHQtAYuyJ+dk09AFSTWeKdrHCSuAWizWcPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6lOhmw6WTmLY2AT5+w2ujvjMJOinl3VUX//mjFmq2SVoyAlrl4wUHtuTq8toYaGd
 yG8v4YiuP1xtTX/QqqxFaLCMytY2BDvaQsiRqeVitmK8lpDOLZaMW9oIRVgMClMduI
 uaXE2q8ZGNXIj6kGH6fHbs/TCWMkNAFg1/06IOHgyBFxH/PZM8dmdbISA6KAJBRYFa
 jAoC3K59Gfw8zkNuh/Ec5P2ojs/VS2takBXlJXRb70xUZp6TQL15i+61c/cVDAcZ9+
 iAtOiHXVO+xZ2YmBcxX3rJ1EN3egG9TCtfwXuhM8sGc2GyFji/w5RN/HrjCUzJFzcM
 1gw+5w67M6ISA==
Date: Tue, 3 Sep 2024 09:03:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com,
 hsinyi@google.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
Message-ID: <semedgkhyuapu6c3lpinqqm5iuu6aabhjlr7txran3xnlcupwq@qm6baypqa6oy>
References: <20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240902125502.1844374-3-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902125502.1844374-3-cengjianeng@huaqin.corp-partner.google.com>
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

On Mon, Sep 02, 2024 at 08:55:02PM +0800, Jianeng Ceng wrote:
> MT8186 ponyta, known as huaqin custom lable, is a
> MT8186 based laptop. It is based on the "corsola" design.
> It includes LTE, touchpad combinations.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>  .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 24 ++++++++++
>  .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
>  .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++

This does not even build... never tested.

Best regards,
Krzysztof

