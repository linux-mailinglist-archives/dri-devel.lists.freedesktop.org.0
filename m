Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BF63FC96
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 01:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5A110E696;
	Fri,  2 Dec 2022 00:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420A810E696
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 00:11:18 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 cn2-20020a056830658200b0066c74617e3dso2021219otb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 16:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zGq1WNX8Tw/ZC1WhR0e9GI27emRflXnQa00eSJUvyNA=;
 b=XneBxUJ7a42gardvkVyHhfKr/DnOhVcvywscsLwQKExslIqOGFprd7uBmeEfGpGI++
 HKUqR6HIK02Xa/0EvB6G5wnnu0pdk72dkZb7e/ZaljQ+At/m5R4aeSa6LgiAx3eFRQ5V
 LHQoqRcH1DFZ1exGBCTo0CZaGY7KSmeqfToOBemfG1a20d3Amjm3TuwS2j/7xbT2JDY/
 Ol1KBZgFovQEONuoTDIIZ/rF6hscO0RMcsvHHbAzBINPFxXoGnKoEyWs2tNdWRlAwGuH
 TwEz92VqR8JJ7Khpeh9xIsmV45B5XjBR4ddLqUwY/P6iA/HfvIdpnR5t8X7L3pO33VZQ
 WN0g==
X-Gm-Message-State: ANoB5pmDbyEishnxpLH66kb9+I0pLXI/ayKLDf1sRUP5Vn2Ig9ssOxzp
 1tH+xWcJigi79Yo14MW69w==
X-Google-Smtp-Source: AA0mqf4o+fnjDBcjQQyria01GTLlxp+FNl8ndgi9chbNkyUgWIvyVqEL1opVmYQWA1/2b3VIDGPCxQ==
X-Received: by 2002:a05:6830:2a0a:b0:66c:3703:f04e with SMTP id
 y10-20020a0568302a0a00b0066c3703f04emr34665718otu.287.1669939877279; 
 Thu, 01 Dec 2022 16:11:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j24-20020a544818000000b00354932bae03sm2427124oij.10.2022.12.01.16.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 16:11:16 -0800 (PST)
Received: (nullmailer pid 1741058 invoked by uid 1000);
 Fri, 02 Dec 2022 00:11:16 -0000
Date: Thu, 1 Dec 2022 18:11:16 -0600
From: Rob Herring <robh@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: mipi-dbi-spi: Add
 io-supply
Message-ID: <166993987552.1741002.2270540744689432336.robh@kernel.org>
References: <20221201160245.2093816-1-otto.pflueger@abscue.de>
 <20221201160245.2093816-4-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201160245.2093816-4-otto.pflueger@abscue.de>
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
Cc: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?q?=2C?=devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 01 Dec 2022 17:02:45 +0100, Otto Pflüger wrote:
> Add documentation for the new io-supply property, which specifies the
> regulator for the I/O voltage supply on platforms where the panel
> panel power and I/O supplies are separate.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  .../bindings/display/panel/panel-mipi-dbi-spi.yaml        | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
