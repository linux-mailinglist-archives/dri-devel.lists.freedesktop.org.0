Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1A98A3A2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4991610E06F;
	Mon, 30 Sep 2024 12:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SRw13xnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD82110E06F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 12:55:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C42F5A41D24;
 Mon, 30 Sep 2024 12:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10451C4CEC7;
 Mon, 30 Sep 2024 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727700952;
 bh=ZkOKTBg9HnSwyIfJv2ogItEM8FFlmo+OKiYh3SAC7U8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SRw13xnuw+GY/oTpMMLYex91TBeZlHGX85pOz/s/gVvAXqfLYa6Op1RXKGV+EMkjk
 2JkZVuQziXKWpQScqt6uS6K2OdW6CYsfVQRcEvI9PyUsv1XA3lIcxRYyFKEDG8WcKk
 ahb5v9oUG+rKFGZcEeOjKSvkMRwwvq5TjK08zEYHU9RMC6kGu57/ORbLWOKyKSqDZq
 JURLm80xE/cvdCr6HR+HBXv35relSbuKywtLj6XaAT8HbLk1Es01+mj9DQXVj2/Sku
 pkWnmgrzNe/Nlsv0b1OtoE/QpKeGnWL8koNtHTvrqt9ulqDA7gZgu8r9N+I+7ymtVN
 XsMwnlQSaDvZQ==
From: Lee Jones <lee@kernel.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Liao Chen <liaochen4@huawei.com>
Cc: linux-kernel@vger.kernel.org, lujianhua000@gmail.com, lee@kernel.org, 
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
In-Reply-To: <20240820121628.42321-1-liaochen4@huawei.com>
References: <20240820121628.42321-1-liaochen4@huawei.com>
Subject: Re: (subset) [PATCH -next] backlight: ktz8866: fix module autoloading
Message-Id: <172770095080.460970.7941679869764996013.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 13:55:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Tue, 20 Aug 2024 12:16:28 +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> 

Applied, thanks!

[1/1] backlight: ktz8866: fix module autoloading
      commit: 2d3553b76ecaf23c98f3070a2db8d08906be37b8

--
Lee Jones [李琼斯]

