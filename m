Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9ABB1344A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 07:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBABB10E0F5;
	Mon, 28 Jul 2025 05:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bOUYjt8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCC310E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 05:50:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0ECFEA52934;
 Mon, 28 Jul 2025 05:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C827C4CEE7;
 Mon, 28 Jul 2025 05:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753681807;
 bh=3oQdTpRQlTah4kbX+B+OQ9gdwk9tbQ+jJV6punq6onA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bOUYjt8SggU9iPP7HvVYAP7PwW0QrLqXvJwEVhXktAInlw1/my5pGZPjADYeFbEvq
 8wapevw20DCajENqXLGKaLg/ufnh4C9Lkyb7bKFj9C+4FouxF9MmyMDlIMEb5AUJXC
 rzglSxa94DTVlikOHwGbptTfPQOP7lNfSda992LY8DQrCyAP1UG+/VtUhaH/8uLI/w
 I9fVZcTeBXhKATdQcLgbP49G5TxSe4nC6P1aET4tlAciAJg0fqzQPrFUPrymCXnFHc
 GIVHDaN9V4IOQJuNFrWUcP1gzVpvxc2+0wyPIXph9qhjn0taB2n4sq9U4sXa3tD95V
 QqMUl7JvUIhGw==
Date: Mon, 28 Jul 2025 07:50:05 +0200
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
Subject: Re: [PATCH v1 1/3] dt-bindings: display: panel: samsung,atna40cu11:
 document ATNA40CU11
Message-ID: <20250728-perky-bulky-rhino-8d834a@kuoka>
References: <20250727165846.38186-1-alex.vinarskis@gmail.com>
 <20250727165846.38186-2-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250727165846.38186-2-alex.vinarskis@gmail.com>
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

On Sun, Jul 27, 2025 at 06:50:24PM +0200, Aleksandrs Vinarskis wrote:
> The Samsung ATNA40CU11 panel is a 14" AMOLED eDP panel. It is
> similar to the ATNA33XC20 except that it is larger and has a
> different resolution. It is found in some arm64 laptops, eg.
> Asus Zenbook A14 UX3407RA.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

