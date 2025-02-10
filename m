Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5075A2E8D5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D0510E149;
	Mon, 10 Feb 2025 10:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fWMzrev0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6D610E149
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:16:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14FDE5C49B0;
 Mon, 10 Feb 2025 10:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D65FC4CED1;
 Mon, 10 Feb 2025 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739182577;
 bh=khZXx91+JHrmsBYXqnk7JQrqQDlRf4NzWNK9wU6n4+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fWMzrev0ggNe8eoKxQm+U1lbahltBJjAXKVSz/smDpUzkkhIZu2twI3+LjaIm5Wpx
 0HnIZn0mk9dvUBzzuL5HHSE5oKNNB3GxpvK3+6G6H0RrhK3bQ+rzl9oZA98TA7xNdX
 r5/q4zsjLxeY8RvBn9fYDFymdlylfGoL0mM6B0Yzai09jXYu2G01ZchIUHTGjhS3c5
 zMNNEjBZHE5DBUrVNdlsc9ib//rQ+ttRF7BfgH33Lxloas7VtSW+372K80bQoI/6lb
 WUV9z4ndnF1tUbfBIbk+7vFG5I9xkKPvO5Uliho2y0h6425omirpy2OUaOHraCnVXY
 1e5I32uXrLYSw==
Date: Mon, 10 Feb 2025 11:16:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, sam@ravnborg.org, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible
 for the panels KD110N11-51IE and 2082109QFH040022-50E
Message-ID: <20250210-rampant-uncovered-buzzard-c96e31@krzk-bin>
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
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

On Sat, Feb 08, 2025 at 06:53:24PM +0800, Langyan Ye wrote:
> Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
> STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
> add the compatible to the hx83102 bindings file.

Your subject does not fit at all at any reasonable limit. Keep it
simple:
Add KD110N11-51IE and 2082109QFH040022-50E

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

