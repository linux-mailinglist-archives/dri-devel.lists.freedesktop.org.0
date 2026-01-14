Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609DD2138F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 21:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77FD10E692;
	Wed, 14 Jan 2026 20:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pZ+BRXKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972DA10E692
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 20:51:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 51D3543A5D;
 Wed, 14 Jan 2026 20:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182EAC4CEF7;
 Wed, 14 Jan 2026 20:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768423896;
 bh=dwL47rYgTdWjH2R9TONSAhn5UmSu6UH5MGZCn6Mj7KM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pZ+BRXKTkbWWaLyq4wWKeIIyjyEvlnSYP1AyEi0okhBLvkruc56wx94x5hQ/dL++t
 J+F3kX2fQdga3hsjc3ddvDYmVgce6C//rbGgAOZt0A5B2cC4cbgdm+vzBuBx9k5qfT
 xORbUo5FFff8Dh2ZavSCYzkllYCEyj85N/mY3QIF+wZ+scQHH/V/RuBaxkchGTTXz6
 OlIpeP6UVrLQJ5FCf0gGZe9UXrUYRJSGtksUuzPOSgje0DFx40WD9rjMHZ3g3s/INJ
 dB0CXdoigNscXM8Fv5DNbhSWsxEoDiKAl/iw7uRM2sPC1THyKQJKIda0ODI6jx+j3m
 v0oj0sP3vdzkg==
Date: Wed, 14 Jan 2026 14:51:35 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: thierry.reding@gmail.com, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 dianders@chromium.org, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de, jesszhan0024@gmail.com
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Move FriendlyElec
 HD702E to eDP
Message-ID: <176842389446.3188655.18330903813710913313.robh@kernel.org>
References: <cover.1767111804.git.robin.murphy@arm.com>
 <80a68e706e869aadbdea228b207a5df52bbfd7b2.1767111807.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80a68e706e869aadbdea228b207a5df52bbfd7b2.1767111807.git.robin.murphy@arm.com>
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


On Tue, 30 Dec 2025 17:20:31 +0000, Robin Murphy wrote:
> The "E" alludes to the fact that FriendlyElec's HD702E is actually an
> eDP panel - move its compatible to the appropriate binding doc.
> 
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../devicetree/bindings/display/panel/panel-edp-legacy.yaml     | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

