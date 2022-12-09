Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851CA648A16
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 22:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1054C10E057;
	Fri,  9 Dec 2022 21:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2E110E057
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 21:32:24 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 z14-20020a9d65ce000000b0067059c25facso3579472oth.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 13:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXUif5e59SXbS4ZVXjasOFVg8LGqYqJhBBmQt/Ekbr4=;
 b=qwlzdRs9HT9n6Llzkqq5za7+ZqicBK5FZuWiUyUHlRbuVBCq1KoFCdgRLjXUCPFOuw
 DE+IXtspW2c3gYH7vZBHncqY+ryZj8O/wsjmryShHA54FiKQgcRtLKiw8pvfcXICVOQg
 Wgd0f5tQvhVQS4uacR1n4tBjvbBsiO2jqMNmhapjXlz6EnjEDZScZauOZ9WVSk8UG2E5
 RNeDg02YaolZJdOTNfHpaPaGp3cbJGgaVMlIpd3oKq10nPP5b9ikwVlf68vp6Iy/SEwj
 zu+C+DDnSodwImpZCbQOgG5A51er6gDFqJ0oB3hmjjNZOtrR+3DTDsPbvMrmBsvEDbwU
 u13A==
X-Gm-Message-State: ANoB5pljVISGwhZErBirZ7mH1y38DF+QaJslBdFUY+HPTUcD3Fd3f1GZ
 YDhQq5CliGHI4i4qe0Izdg==
X-Google-Smtp-Source: AA0mqf5wT/8wkhk4uJ4lkX6HXdEFjCt39r1ji6QLYrsb4qByaS9GHRkSegVYNULG3OV2rh0FyjHKYA==
X-Received: by 2002:a05:6830:11d9:b0:670:74de:ed3e with SMTP id
 v25-20020a05683011d900b0067074deed3emr3377591otq.16.1670621543461; 
 Fri, 09 Dec 2022 13:32:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w7-20020a9d5a87000000b0066c49ce8b77sm1012144oth.77.2022.12.09.13.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 13:32:22 -0800 (PST)
Received: (nullmailer pid 3882278 invoked by uid 1000);
 Fri, 09 Dec 2022 21:32:22 -0000
Date: Fri, 9 Dec 2022 15:32:22 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: lcdif: Fix constraints for imx8mp
Message-ID: <167062154068.3882174.8931883659376870009.robh@kernel.org>
References: <20221208140840.3227035-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208140840.3227035-1-alexander.stein@ew.tq-group.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 08 Dec 2022 15:08:40 +0100, Alexander Stein wrote:
> i.MX8MP uses 3 clocks, so soften the restrictions for clocks & clock-names.
> This SoC requires a power-domain for this peripheral to use. Add it as
> a required property.
> 
> Fixes: f5419cb0743f ("dt-bindings: lcdif: Add compatible for i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Removed power-domains minItems: 1 constraint
> 
> Changes in v2:
> * Squash both patches into one
> * Split the conditionals from fsl,imx6sx-lcdif
> * Mark power-domains as required for fsl,imx8mp-lcdif
> * Ignored the A-b & R-b due to reorganization
> 
>  .../bindings/display/fsl,lcdif.yaml           | 29 ++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 

Applied, thanks!
