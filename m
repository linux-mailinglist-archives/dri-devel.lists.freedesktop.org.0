Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128A81BFE5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 22:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C8210E6FF;
	Thu, 21 Dec 2023 21:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA49810E6FF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 21:09:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9DED619E8;
 Thu, 21 Dec 2023 21:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3008C433C7;
 Thu, 21 Dec 2023 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703192997;
 bh=MOv2Ps6cE6dmQApM5Rwy2jg3rccLNITICS9IRnMhXiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u3z+8wD2mqTIkYTCtx608pczUdMSijGLS9F+KeWgjLDVZMfQMcFcYrOae2STvxjk0
 HC4DSuqXpyk0LAHxlS/YjGIBqM//J9GNOIZeAo7SuEm3wxokvThk6ezw6vIc+IWOq9
 BKMkhyRTTZZqjTrhbzfO2psZGghVzz4DHCIClhnNZUVKtJ497UKJSuM155QP/rUBna
 ntpmZ4cWXusPyJrN+jvsV/Z+6bF6aHziDSEHVZS29rQzKWAV7CUSTSkRCK7J5i9C6L
 vxtWSK4XgYEypvadURNqgTzwga2DJsAWB0MJmdGzWzrCvGUbzAaCZwDuBCpQf8g5qw
 ugthze1lpuTBA==
Received: (nullmailer pid 98899 invoked by uid 1000);
 Thu, 21 Dec 2023 21:09:54 -0000
Date: Thu, 21 Dec 2023 15:09:54 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH RESEND v1 1/8] dt-bindings: panel: lvds: Append
 edt,etml0700z9ndha in panel-lvds
Message-ID: <170319299428.98837.13859133240448825226.robh@kernel.org>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-2-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221124339.420119-2-raphael.gallais-pou@foss.st.com>
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 21 Dec 2023 13:43:32 +0100, Raphael Gallais-Pou wrote:
> List EDT ETML0700Z9NDHA in the LVDS panel enumeration.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

