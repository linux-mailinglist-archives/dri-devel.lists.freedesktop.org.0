Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFDA2E871
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DB210E4F2;
	Mon, 10 Feb 2025 10:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rQqs/zSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B869910E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:02:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09BE85C4936;
 Mon, 10 Feb 2025 10:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2935C4CEE5;
 Mon, 10 Feb 2025 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739181763;
 bh=kAPX7U4HOemMCHpMi6ojF51w0Vel5PxxbwLGLMG+LsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rQqs/zShPLbbCKZnUDqiVh2YXCC0g9uohS3xzZhnklcHYZmsZ/MGIB+l48sn6e+px
 2ItQqbq126z1vWIqCeSbyOI1/tlUZAy95wa9m1tgoXERtu4Y7fYqp+kX7kJ40Dqbxh
 SwbViyJpA8pl1kFoHBDpiaDiDyNYyvysSnd3ZjJDLY1Vs1CnToSH9AUDkZxVCibRFU
 Dcgn3utMB1Ule6/49RTN+SPnOcJZYvgZZ9hyJlg4hiHggC4Ou5zLw/eXOyU/+Yqiyv
 BeczPbox/kscg1ojhF05q1fwj+4Dgi9W1ncBWhfXzpUe+DNJspl2QGhdEUtBNLiURZ
 bMQ0vE3afSXHw==
Date: Mon, 10 Feb 2025 11:02:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 10/13] dt-bindings: display: vop2: describe
 constraint SoC by SoC
Message-ID: <20250210-poised-free-pronghorn-4b7fa9@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064457.11396-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064457.11396-11-andyshrk@163.com>
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

On Thu, Feb 06, 2025 at 02:44:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> As more SoCs variants are introduced, each SoC brings its own
> unique set of constraints, describe this constraints SoC by
> SoC will make things easier.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

