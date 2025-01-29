Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287AA2181F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 08:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A947910E74E;
	Wed, 29 Jan 2025 07:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E4EfT3Ub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF5810E74E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 07:30:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EFE8DA402AE;
 Wed, 29 Jan 2025 07:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B43FC4CED3;
 Wed, 29 Jan 2025 07:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738135805;
 bh=YP70k3CuKOov2UxqgnQYgL5HUHj0EryZS8nauAe2jjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E4EfT3UbNbTuywP7/eWQWkq9G1EmPjDzLGf+l/fPzYmwz7ipoY3s25dKEfMgMYoiU
 iPxUqFxFMhxzmN+hmKnGnRRNXQB1J5TkayoVCdixsAGt/3/B8mqzGIDQTer/Kp6qnb
 Hi+f/CEIIDhACy/LfW/w7IwYpsV/Bd+2PhHVS6bWg0aLyG0OnZwDrafhQ9svsiu8hQ
 nfvt0HmzBZH97DHv3hqCodcMO/qzfPbudlzAPuG8DQydryTz/Mg7Y6YhLpZs+KkUKs
 shUny9WTbVOLVJ9ZOeMUUhBlviZFLVqorJNsG4gf9kgGBjg3TBKpJOvkSFe90Lv7Kr
 /H04vnOdkwVkg==
Date: Wed, 29 Jan 2025 08:30:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 03/18] dt-bindings: firmware: thead,th1520: Add
 support for firmware node
Message-ID: <20250129-marten-of-incredible-gallantry-604baa@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194829eucas1p279fb146417854b28366378793087694a@eucas1p2.samsung.com>
 <20250128194816.2185326-4-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-4-m.wilczynski@samsung.com>
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

On Tue, Jan 28, 2025 at 08:48:01PM +0100, Michal Wilczynski wrote:
> The kernel communicates with the E902 core through the mailbox
> transport using AON firmware protocol. Add dt-bindings to document it
> the dt node.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/firmware/thead,th1520-aon.yaml   | 53 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

