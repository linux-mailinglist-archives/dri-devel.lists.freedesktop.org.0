Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30561969473
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AE110E34B;
	Tue,  3 Sep 2024 07:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SR2tuWx0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FC610E34B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:01:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0DF6BA409F2;
 Tue,  3 Sep 2024 07:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32B8C4CEC5;
 Tue,  3 Sep 2024 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725346911;
 bh=PF81La/Nmxb900Q+rRwuTwsXTBfvX2KbOjEq2mtCfSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SR2tuWx0wps7Wxw0vdnVhG61v7p5F6UB7mpl+HxT/xUaCBzo1Cd5v4xj70wVq92mT
 dsP2QU+z+ra60yPyUxR/eJ0u4GLbnWxa2LN1aZtHj9dbpLWNqeaOfj2kvooF7hYBwN
 DGvYncSdBYKriAk6Aijw0JNJAzrEuPWf+eq6LUE0uDlJzngmeQ04VFKfRMGnTKcp2D
 9YlKfGAroNAjoQAecMy7YxJHKgNmf3/5JK0NQAaerqfYtQ11WEbYiJS48Mr1T+aQAq
 +SVxVvmpf49asrCWZ85TrmeObR2kssGHrVgDD2Iw4FNnihafOYXWISOj/737AJd0wL
 EQ2xHAZevNjng==
Date: Tue, 3 Sep 2024 09:01:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com,
 hsinyi@google.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Message-ID: <winiurki2vvkzgrembzbdxem3msqfxo632tlqtaju6ggafnxmt@r4wakh4lvxat>
References: <20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com>
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

On Tue, Sep 03, 2024 at 02:16:01PM +0800, Jianeng Ceng wrote:
> This is v2 of the MT8186 Chromebook device tree series.
> 

Where is the changelog? Why do you send the same patch as v2?

Best regards,
Krzysztof

