Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FD197FD4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 17:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EC56E14D;
	Mon, 30 Mar 2020 15:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21646E429
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 15:38:49 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id n13so8888213ilm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 08:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kjvQ/aX+nqXYP/8xlPBLanrss6H0Kukdfj5oOHWtkGI=;
 b=ncf+x6Ue6HLIspe+yjMIkr4BPUbp4h+DoJB06xNZMlM5p80Q+wva/Wyq7sy7dH259x
 rMuRAA717taxtaFwb+om5X2ANDleGHNC2x/NbJjGOUSVeOawpSEIANVjcjjgMqQGwRAw
 zgx4d3vWpcCNAFpQPHRPh8D9MmUqJuZdd9BjHtSdJIz14qyEIBvy2k7MDFyXQQxo3HQ7
 8JIdvwhjV1P5nnBRggCkGAxDs5rH1TZmE0tFZwWGbq6RG2J00Qmby9n975UEvcV52fHj
 qovX04ltW6Sabk3wpC1FsXr79/vMO4vl/DxDoXA3EOnk4pTwm2ItYjJWvOCBvtgiCARf
 Bgmw==
X-Gm-Message-State: ANhLgQ28e2eSWoaMbsnEq8F2/2jfoDkcyxfjDHp4U/hpG7XLkvICnRxb
 5cPEVtH6sjUHYdmQH1MStA==
X-Google-Smtp-Source: ADFU+vub9x8UsaNR5rZlhFtYZGuK9nLpiz/UHXGujrMmTJO3dB/kG0f8isqdsyg/WtZalr/2pwB4Bw==
X-Received: by 2002:a92:d7cc:: with SMTP id g12mr12180998ilq.260.1585582729078; 
 Mon, 30 Mar 2020 08:38:49 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id k16sm4958078ila.38.2020.03.30.08.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 08:38:48 -0700 (PDT)
Received: (nullmailer pid 19882 invoked by uid 1000);
 Mon, 30 Mar 2020 15:38:46 -0000
Date: Mon, 30 Mar 2020 09:38:46 -0600
From: Rob Herring <robh@kernel.org>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: Add IPK DSI subsystem bindings
Message-ID: <20200330153846.GA19314@bogus>
References: <cover.1585067507.git.angelo.ribeiro@synopsys.com>
 <0bc20739facfa519296defe2a367774a7b5a355d.1585067507.git.angelo.ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0bc20739facfa519296defe2a367774a7b5a355d.1585067507.git.angelo.ribeiro@synopsys.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Mar 2020 18:18:19 +0100, Angelo Ribeiro wrote:
> Add dt-bindings for Synopsys DesignWare MIPI DSI Host and VPG (Video
> Pattern Generator) support in the IPK display subsystem.
> 
> The Synopsys DesignWare IPK display video pipeline is composed by a DSI
> controller (snps,dw-ipk-dsi) and a VPG (snps,dw-ipk-vpg) as DPI
> stimulus. Typically is used the Raspberry Pi
> (raspberrypi,7inch-touchscreen-panel) as DSI panel that requires a
> I2C controller (snps,designware-i2c).
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>  .../bindings/display/snps,dw-ipk-dsi.yaml          | 163 +++++++++++++++++++++
>  .../bindings/display/snps,dw-ipk-vpg.yaml          |  77 ++++++++++
>  2 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml: properties:reg:minItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml: properties:reg:maxItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml: properties:resets:minItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml: properties:resets:maxItems: False schema does not allow 2
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1260819

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
