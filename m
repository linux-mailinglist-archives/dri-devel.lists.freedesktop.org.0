Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F415863D88A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D781410E477;
	Wed, 30 Nov 2022 14:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2230F10E477
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:53:16 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 n42-20020a4a956d000000b004a047b3964fso1791038ooi.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=REIiF+IHKEdfg19HkfHRcF1uyzuS1Xm7d1N/QWRQLpo=;
 b=z606LfHgbi/zA2MR6hIjN41L220fYAIapFeE8um8HtZ4rGlFjfEnjsIZA2Nf22swcJ
 iQdAWb9x+jiuu/jrwgiByjszM9tJxlRiMy4ngDGJ20ocW5JmwdOPdCbZ8R/gqPvRRa75
 wMUd8X09DnG5xBXdGpI6mNnPLc+BAqdB1mozdoNYITAk9jeMyGIHr7IJQTa+dvZ1a2ZH
 wnLMzX3Pulb+If9Rq4Pv52AA8cYQRP73+ICTJqUdngwJHac1NneXl0Jpj0sFBJZ3j3tQ
 33P8rbpIa6khASKqswEexJyKRhewcXN8mwM8enQfGH2JyT8pdhTzMd48l8wQ34TrMpAR
 9a+A==
X-Gm-Message-State: ANoB5pkfjf1XwvRzlZN0fkbGruXMijtp0+ukbJLRKn5pfuse3vNQwBM0
 vvzQynBx8rMj+MhnGNLXmQ==
X-Google-Smtp-Source: AA0mqf4A3UKt5YjqsiMHmLTVVhMRJco14AAte09ey1sJuWNn1ZlD5n7GKJ9dP52ZCNcCttoEfxEJUg==
X-Received: by 2002:a4a:52c3:0:b0:480:8a5d:5962 with SMTP id
 d186-20020a4a52c3000000b004808a5d5962mr26343923oob.29.1669819995163; 
 Wed, 30 Nov 2022 06:53:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i9-20020a9d6249000000b00668953207b2sm961986otk.80.2022.11.30.06.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 06:53:14 -0800 (PST)
Received: (nullmailer pid 2148056 invoked by uid 1000);
 Wed, 30 Nov 2022 14:53:13 -0000
Date: Wed, 30 Nov 2022 08:53:13 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] dt-bindings: display: Convert fsl,imx-fb.txt to
 dt-schema
Message-ID: <166981984923.2144677.14979016393841570972.robh@kernel.org>
References: <20221129180414.2729091-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221129180414.2729091-1-u.kleine-koenig@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 29 Nov 2022 19:04:14 +0100, Uwe Kleine-König wrote:
> Compared to the txt description this adds clocks and clock-names to
> match reality.
> 
> Note that fsl,imx-lcdc was picked as the new name as this is the actual
> hardware's name. There will be a new binding implementing the saner drm
> concept that is supposed to supersede this legacy fb binding
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes since v1, sent with Message-Id:
>  - mention clock stuff being added (Philipp)
>  - dropped some quotes (Rob)
>  - fix specification of compatible
>    (I kept claiming though that imx21 isn't compatible to imx1. While
>    that might be true, I don't have an i.MX1 to check the details and
>    currently the imx*.dtsi don't claim that compatibility.)
> 
> I tried to implement the suggestion by Rob to formalize the display
> binding. But I learned that this doesn't change how the display property
> is formalized in the fsl,imx-lcdc.yaml (which is just a phandle without
> means to specify that it should point to a node which fulfills a certain
> binding.)
> 
> Best regards
> Uwe
> 
>  .../bindings/display/imx/fsl,imx-fb.txt       |  57 ----------
>  .../bindings/display/imx/fsl,imx-lcdc.yaml    | 102 ++++++++++++++++++
>  2 files changed, 102 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> 

Applied, thanks!
