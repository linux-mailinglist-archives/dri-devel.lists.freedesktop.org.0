Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657A6EE7B8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 20:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A062E10E509;
	Tue, 25 Apr 2023 18:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A8110E509
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 18:49:27 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-549d9c2935fso1056850eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 11:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682448566; x=1685040566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rHmR4Qsjqoa48btsGXrh3RZ/bVlluGDvo9DlMJv65rY=;
 b=LG2DPhtv9golNui4ntWFgF2Hf9uwBQKsdNH0QUjdjpVZwsLb9QpAKnDfybmB3JrKD1
 JoH1MXdiXKeIUuNH+HtLIVIrh01Xtx+Gw3pIPPDx0cybSjEPlwVKU84VQKIc4tsxrG5D
 x5ib2vyqZogCOW7QAGd1DS7mH8qkqcnfjw1uyOJg/d3I9igSOCwmV7Q1gDqbe7aN65iX
 qew4/SZVcRsKTSBNEV1Dvpd8J9/Zg4+Lr/xJk2I59ON1AijUDKfLSO0SSG8guw95VUBP
 5DSJzriCXMKyMK7ZVXgq21umpx52UkigEyTNEaTEURQ1E8uYNnc5G8ACZfIhwXEEuWdj
 n8oQ==
X-Gm-Message-State: AAQBX9ep2dr9IttILHlXJgrvm99XIlg6wlP9+iOy7WRPoOUy70Kp6y0N
 XHAOgfI9nDZZTatOt097GeHxe4L15g==
X-Google-Smtp-Source: AKy350YvGuIditQzAj7OJfnQwyAGgcpTjKiJnQkwrKj4jn0Coz5+UcgUbeZXcM0pjNMOTVfiLVXv2A==
X-Received: by 2002:a4a:d749:0:b0:547:6481:799 with SMTP id
 h9-20020a4ad749000000b0054764810799mr6353560oot.8.1682448566469; 
 Tue, 25 Apr 2023 11:49:26 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b5-20020a056870d50500b0017b21991355sm5440434oan.20.2023.04.25.11.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:49:26 -0700 (PDT)
Received: (nullmailer pid 2073438 invoked by uid 1000);
 Tue, 25 Apr 2023 18:49:24 -0000
Date: Tue, 25 Apr 2023 13:49:24 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2 02/13] dt-bindings: display: st7789v: add Inanbo
 T28CP45TN89
Message-ID: <168244856451.2073379.1600632526272371970.robh@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
 <20230422205012.2464933-3-sre@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422205012.2464933-3-sre@kernel.org>
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
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 22 Apr 2023 22:50:01 +0200, Sebastian Reichel wrote:
> Add compatible value for Inanbo t28cp45tn89 and make reset GPIO non
> mandatory, since it might not be connected to the CPU.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml  | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

