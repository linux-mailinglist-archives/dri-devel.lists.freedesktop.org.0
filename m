Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ECFB1344C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E1610E116;
	Mon, 28 Jul 2025 05:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p8ni+fwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BBA10E116
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 05:50:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A7845C5782;
 Mon, 28 Jul 2025 05:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212E0C4CEF7;
 Mon, 28 Jul 2025 05:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753681818;
 bh=8CHwPyEt/S1za+PezckxZg5kwb5NUOkthcCLJ5YZhuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8ni+fwKypbz/hHH3zuU/6CZN4u9rzX+YbtnJadNc3nnuRh1c75WNOR/Mu1Z/rDsn
 aDNz4LZIX2X2DyKn+ZxjuamfjJVpK4OeEaPNVSGg8AoytnptKC9yg/uy+7rLPRL2XA
 noD2w5P/0aIBFbo6w8iMFr1/PwjphF+BBY+AVLJW0IVCKSWHm3P1nVQhHz2b3pJqZK
 mwrG6RVO76DsYKf/Zf802YNJ1ca122JsMDnp7Utvm451j7hOI+lHbT7wHOidOaRYB7
 faJ6BNldVQ6iD3NH4wblDoIzVB4RuKjCYNQASKpeGgcfbOqgUCSy+WAD9UwSJ7K7cV
 el2L0cK8g6Eeg==
Date: Mon, 28 Jul 2025 07:50:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: display: panel: samsung,atna40ct06:
 document ATNA40CT06
Message-ID: <20250728-daft-refined-sheep-18ce61@kuoka>
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
 <20250727165846.38186-3-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250727165846.38186-3-alex.vinarskis@gmail.com>
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

On Sun, Jul 27, 2025 at 06:50:25PM +0200, Aleksandrs Vinarskis wrote:
> The Samsung ATNA40CT06 panel is a 14" AMOLED eDP panel. It is
> similar to the ATNA33XC20 except that it is larger and has a
> different resolution. It is found in some arm64 laptops, eg.
> Asus Zenbook A14 UX3407QA.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

