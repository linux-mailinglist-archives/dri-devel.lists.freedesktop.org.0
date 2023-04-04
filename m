Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF896D5ED2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B82F10E1DB;
	Tue,  4 Apr 2023 11:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16510E696
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 11:18:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B834285D7C;
 Tue,  4 Apr 2023 13:18:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680607094;
 bh=FO3eXq7EHGct7qFcxDmpSM91UHp2BwEThzhWxjdK2nQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zWq9rcA32YG0vQMF0JYp83YpuZ7F+fHK+xdGSRodYLa2t9Sr89sS6Kn3afEsUNnNi
 SmhwpVOC9IhapFX/EYcFRb3ceWJ8OYW+NMhIUikIiHUK2ZdJrYMocALtts7gw/E0du
 EMo79GGUb8Hg9Wz1s8wOgt6Kx5rMKdaR7OP3aVkBpc1S2QQu97ARpdqlFD7Ozd7sKY
 wo12teOSVEMxIiZCGFeu/tvEJkRNjppbIv1Mxejqs7nvJ110VO476EiBC54LbaH5Je
 D8VZZtqNUZ1IRGkozXSZQ1KnzPbu4iK2/mQJXgpZBosWQaHgmc5cEj33sSIWPn8oNZ
 xKGw5PtsZJYkw==
Message-ID: <6b2399cb-38d7-2244-2022-5bf4fd428c86@denx.de>
Date: Tue, 4 Apr 2023 13:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge
 to yaml
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230404023057.510329-1-festevam@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230404023057.510329-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/23 04:30, Fabio Estevam wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Samsung MIPI DSIM bridge can be found on Exynos and NXP's
> i.MX8M Mini/Nano/Plus SoCs.
> 
> Convert exynos_dsim.txt to yaml.
> 
> Used the example node from exynos5433.dtsi instead of the one used in
> the legacy exynos_dsim.txt.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Marek Vasut <marex@denx.de>
