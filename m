Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977D0A9A514
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987AB10E090;
	Thu, 24 Apr 2025 07:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iR53X055";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A80210E090
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745481547;
 bh=EkRGMXV61mxS1Jr+5BweoZLfS5HQIMfM2iHDQZfDtgs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iR53X055QzTaG7CuxiPOpdr/6nFMLEZ9Um8oMTyaTdS5eibjpOq0Ol+tKricl9S1F
 uqncnA0BBgwBns1Dcwl61zFvyjPHwMAj3OCc/5QMFAGKoFgCmlY9G+R/n7FOdfGrO7
 SaMIJWYEGJdCILI7NQb/WTbQjjFA9jkvGp5Vkmo3Q9I4W0wTIR/+7sbuPwz3OrgrpV
 Jq++GRuR6cyfv9zfbabX2h479qabjzFxZMy78tLqqPwFoo2UpVYmvLnb+0lbnYCtXe
 6VFj0Kb2v8qjpDn63hzB+UMn8sPBDWdOO5sK4k6kfUc4tVPldTIg3GapwCpphg33OS
 4O2lGkPLCNMAA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CA15217E0C96;
 Thu, 24 Apr 2025 09:59:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, dianders@google.com, 
 hsinyi@google.com, matthias.bgg@gmail.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v11 0/2]
Message-Id: <174548154674.22041.7217055615854393236.b4-ty@collabora.com>
Date: Thu, 24 Apr 2025 09:59:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 24 Apr 2025 09:08:48 +0800, Jianeng Ceng wrote:
> This is v11 of the MT8186 Chromebook device tree series.
> 

Applied to v6.15-next/dts64, thanks!

[1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
      commit: ce8ec1f8c8b363c2511332c909d06df7ae01f1b3
[2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
      commit: ed34944cc3bc5602c1151effdb6aced9f2f992a6

Cheers,
Angelo


