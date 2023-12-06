Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC81807B25
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F43B10E7B1;
	Wed,  6 Dec 2023 22:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141E110E7B1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 22:09:59 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6d9d209c9bbso187395a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 14:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701900598; x=1702505398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5voz9BTYRdOtmgbdqyjcVx1JeyFg2wnR/i9iwhCVW8=;
 b=flhJpRPH8pm5pTAQnImAQevasALUA1RzCONor1R88AUwCpqcq8R/qYnmpcVgJ1FF+R
 yxDIKqf/xCEmDm8Rce0RJrAwO+c0RV317JQdTBaWwD/Hbn0nZFYhl/RXyrYO8A2LQjpK
 tLD2+aLmn5xz00xLNNk4lLGlzzgD5L35q20NpC9uuWC/w4yo3oIYOtBxbg7PJH53faeE
 bEnDpzaq90fUBjuhB9U1sEJj3tpoCKuxevBk1Mf4AthL3JyPjjCyAjl7Vy4uxkumad4o
 Kfp7VezMvnsVDaZY4/HPIqLLs3WE+rMxxXNDP+CDmzDnzy+vnSuZYrsEy3hVp2xMP9hf
 PLww==
X-Gm-Message-State: AOJu0YwxqXUB98nSP46u/k2srnDt4c8Ylm0+vTN6hs1gmXcyH9tUob/t
 hIan/D9Ca9mKlvCieGRmUMvNtVEh/Q==
X-Google-Smtp-Source: AGHT+IF6i0d4TFeQUP3gi7+cJMf7xA6Un72NKclc95eMXFGufDalvvDJ1hcAkhLMqTQX6btyaum9fg==
X-Received: by 2002:a05:6830:61c:b0:6d9:d6f9:35cf with SMTP id
 w28-20020a056830061c00b006d9d6f935cfmr370786oti.4.1701900598064; 
 Wed, 06 Dec 2023 14:09:58 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a14-20020a9d74ce000000b006d9c94d9b84sm130257otl.41.2023.12.06.14.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 14:09:57 -0800 (PST)
Received: (nullmailer pid 3430257 invoked by uid 1000);
 Wed, 06 Dec 2023 22:09:56 -0000
Date: Wed, 6 Dec 2023 16:09:56 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: adi,adv75xx: Document
 #sound-dai-cells
Message-ID: <170190059530.3430170.348137386728263154.robh@kernel.org>
References: <20231206093643.2198562-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206093643.2198562-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, aford173@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 06 Dec 2023 06:36:43 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> When using audio from ADV7533 or ADV7535 and describing the audio
> card via simple-audio-card, the '#sound-dai-cells' needs to be passed.
> 
> Document the '#sound-dai-cells' property to fix the following
> dt-schema warning:
> 
> imx8mn-beacon-kit.dtb: hdmi@3d: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Acked-by: Adam Ford <aford173@gmail.com>
> ---
> Changes since v1:
> - Also pass '$ref: /schemas/sound/dai-common.yaml#' (Krzysztof).
> 
>  .../devicetree/bindings/display/bridge/adi,adv7533.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!

