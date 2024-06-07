Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E7A9007E2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 16:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207CA10EC85;
	Fri,  7 Jun 2024 14:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="EVyk/tlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 681 seconds by postgrey-1.36 at gabe;
 Fri, 07 Jun 2024 14:59:16 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC4A10EC85
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0pBBebWaKItSZZvGMg+oo04bl3J9t4F+/w8mYuUg+g8=; b=E
 Vyk/tlt0i/iV9mQcEq11i6SevJJysuk7swmpFjcu8RhPQkRNmczBLfrk8FrjPzuQUzM0dFIphbid4
 HTUyIn0ivC+RYyvkR/DUMzLyYE8tJATa2TN2YPPrzHYPji3zO33H3YMBVE6wboJh3RF310ZpKZf3b
 ZQy2iPGBVe8fwhT5BninUVixCYGJxU9WkxdVsAZDiC+vPkoSvfCH265bKar765G63F0sYSGfXWWHj
 MOg7AR010IIYjXIZNikYdjpko6auijngGej5WjtJ51qttMsYCMCRjuxnLcMs7Pfj8AvCWMkoU1dVY
 oCl7gR84/C0WZWvIvhW+/lQVKGBgpSoHw==;
Received: from [2a01:799:962:4900:815f:3dd0:60d8:6458] (port=56414)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1sFaqc-009Va2-0S;
 Fri, 07 Jun 2024 16:45:42 +0200
Message-ID: <6537508e-8a67-42d0-911a-45e14852f818@tronnes.org>
Date: Fri, 7 Jun 2024 16:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] drm/tiny: panel-mipi-dbi: Support 18 bits per
 color RGB666
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20240604-panel-mipi-dbi-rgb666-v4-0-d7c2bcb9b78d@tronnes.org>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20240604-panel-mipi-dbi-rgb666-v4-0-d7c2bcb9b78d@tronnes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 6/4/24 15:20, Noralf Trønnes via B4 Relay wrote:
> Hi,
> 
> In this version I've fixed up a commit message that I had forgotten to 
> write before sending and improved a struct member name.
> 
> See version 1 of the patchset for the full cover letter.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

Thanks a lot for reviewing the patches, applied to drm-misc-next.

Noralf.

> Changes in v4:
> - Expand the commit message (Dmitry)
> - s/emulation_format/pixel_format/ (Dmitry)
> - Link to v3: https://lore.kernel.org/r/20240603-panel-mipi-dbi-rgb666-v3-0-59ed53ca73da@tronnes.org
> 
> Changes in v3:
> - Added r-b's to patch 1 and 5
> - Link to v2: https://lore.kernel.org/r/20240512-panel-mipi-dbi-rgb666-v2-0-49dd266328a0@tronnes.org
> 
> Changes in v2:
> - binding: Use 'default: r5g6b5' (Rob)
> - Link to v1: https://lore.kernel.org/r/20240507-panel-mipi-dbi-rgb666-v1-0-6799234afa3e@tronnes.org
> 
> ---
> Noralf Trønnes (5):
>       dt-bindings: display: panel: mipi-dbi-spi: Add a pixel format property
>       drm/mipi-dbi: Remove mipi_dbi_machine_little_endian()
>       drm/mipi-dbi: Make bits per word configurable for pixel transfers
>       drm/mipi-dbi: Add support for DRM_FORMAT_RGB888
>       drm/tiny: panel-mipi-dbi: Support the pixel format property
> 
>  .../bindings/display/panel/panel-mipi-dbi-spi.yaml | 30 +++++++++
>  drivers/gpu/drm/drm_mipi_dbi.c                     | 76 +++++++++++++++-------
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c              | 55 +++++++++++++++-
>  include/drm/drm_mipi_dbi.h                         | 10 +++
>  4 files changed, 147 insertions(+), 24 deletions(-)
> ---
> base-commit: 0209df3b4731516fe77638bfc52ba2e9629c67cd
> change-id: 20240405-panel-mipi-dbi-rgb666-4e033787d6c9
> 
> Best regards,
