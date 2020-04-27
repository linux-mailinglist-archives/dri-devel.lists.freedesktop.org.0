Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF231BB095
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 23:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D1A6E094;
	Mon, 27 Apr 2020 21:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DF96E094
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 21:34:20 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b13so29010910oti.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XRUQCI377Xbc6JD+2krofLmVxxHirS9bA0gL+Jn1x9k=;
 b=dw/pnlhWcezJ08RjCXezzXLSjL0QMJU4+JzE+MP1sxVRQUZvnQbNCMSAiJT4cZ4Gb7
 uNc9Y33P9ti0uCqj8ZGNyTEa0Sj2kOacfeZ1rEDC8YG+9b7PVKa8VGq1YDSz2DCRa/4y
 llGYwLpDeX5745tE6yDg1odC0TgkTg6gVgwgpsc0mziDJhC5WWahoLe7/j9f1E+qOwDO
 tymj2WghNGEcFd1lBUm2iCDrnCMeBmLzvcb0E4ebKghP+Z4tL7E2LesHfQMh1srngQ1z
 p6aiX3yu66UIgeS5eQv/f4mKlbA+gn6ko2+Uot2gPRcdVnAqyl2nhBkmTrf5A4u84nxK
 LNsg==
X-Gm-Message-State: AGi0PuZ2GoU96vAgFVCRc3Yw3zzF4rRqkhAoV2BV1luvaa29YssGUQcb
 YADQ6MB1hjCaxLDoMIh/Hw==
X-Google-Smtp-Source: APiQypJ9mE/BH2D4+sKYproJwZ1HaMb0oGk33+e3IQvAocBe9hWzM892y3UWLh7SWCcD4cf4iNNOaA==
X-Received: by 2002:a9d:51cc:: with SMTP id d12mr18633279oth.70.1588023260003; 
 Mon, 27 Apr 2020 14:34:20 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i196sm587727oib.8.2020.04.27.14.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 14:34:19 -0700 (PDT)
Received: (nullmailer pid 2856 invoked by uid 1000);
 Mon, 27 Apr 2020 21:34:18 -0000
Date: Mon, 27 Apr 2020 16:34:18 -0500
From: Rob Herring <robh@kernel.org>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Add IPK DSI subsystem
 bindings
Message-ID: <20200427213418.GA2156@bogus>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
 <04a657ce78633d82565d3a7ce34a8ab52310ff63.1587992776.git.angelo.ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04a657ce78633d82565d3a7ce34a8ab52310ff63.1587992776.git.angelo.ribeiro@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Joao Pinto <Joao.Pinto@synopsys.com>, David Airlie <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Apr 2020 16:00:33 +0200, Angelo Ribeiro wrote:
> Add dt-bindings for Synopsys DesignWare MIPI DSI Host and VPG (Video
> Pattern Generator) support in the IPK display subsystem.
> 
> The Synopsys DesignWare IPK display video pipeline is composed by a DSI
> controller (snps,dw-ipk-dsi) and a VPG (snps,dw-ipk-vpg) as DPI
> stimulus. Typically is used the Raspberry Pi
> (raspberrypi,7inch-touchscreen-panel) as DSI panel that requires a
> I2C controller (snps,designware-i2c).
> 
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
> Changes since v3:
>   - Fixed dt-binding breaking on `make dt_binding_check`.
> 
> Changes since v2:
>   - Fixed dt-bindings issues, see
>     https://patchwork.ozlabs.org/patch/1260819/.
> ---
>  .../bindings/display/snps,dw-ipk-dsi.yaml          | 159 +++++++++++++++++++++
>  .../bindings/display/snps,dw-ipk-vpg.yaml          |  73 ++++++++++
>  2 files changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: dw-ipk-dsi@2000: compatible: ['snps,dw-ipk-dsi'] is too short

See https://patchwork.ozlabs.org/patch/1277673

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
