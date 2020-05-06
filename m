Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C081C7A51
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 21:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8F36E8CE;
	Wed,  6 May 2020 19:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE68B6E8CE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 19:33:56 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id r25so2839134oij.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 12:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RWW3FtYqRLY2smPmY8wcoeQaDQn8dGIqKzfuWpPg+Qw=;
 b=gqT+6tqNXkA/QQzoFKG1qs+atrKDMYy3r9pCZlSkNhEIK5lUpPaxCAciYvQsCX48x/
 6Y3z3up7TJC5IibM/A0er3z1nXiiXREaFWj+VxH3yyhfG+igp4K09fDoRMzl0DUPT9fa
 g5XOAIDwrHfrL3q9eSqoRQQVtuWxRfVmJvCZp4fD2VZyCV8GN6PKCzwQaqDganTbVn/f
 rMBo8sMA5q6OH8hEwDlUjFg7GIoJYHPm3+jvStf8JuPmAjP6GzaeEWeBzZgO/ok0NMdR
 Wt+V6tHULb6Q43a9A0CoNzH9a3URXsNbdyEqIVZIPdjUEd/s829FLmI58CTVIqG2h/kI
 R5Cg==
X-Gm-Message-State: AGi0PuaJLoDvJHjeN01JSlpqOq3FXjr1khh05T2v9kdVTo6r95/6itRl
 Z4oV1P3Fxui1Qvrd6wXdBg==
X-Google-Smtp-Source: APiQypKd4kU6bak2GBtnfCbu10qGsReR/+gbrmh9MTOYL2MpcjvgUyCBKGJ90D8hW5VPYqweChgoAQ==
X-Received: by 2002:a05:6808:b36:: with SMTP id
 t22mr3954129oij.121.1588793635891; 
 Wed, 06 May 2020 12:33:55 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f73sm738750otf.53.2020.05.06.12.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 12:33:55 -0700 (PDT)
Received: (nullmailer pid 13821 invoked by uid 1000);
 Wed, 06 May 2020 19:33:54 -0000
Date: Wed, 6 May 2020 14:33:54 -0500
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Subject: Re: [PATCH 2/4] dt-bindings: display: Add ilitek-9341 binding
Message-ID: <20200506193354.GA12607@bogus>
References: <1588746693-31078-1-git-send-email-dillon.minfei@gmail.com>
 <1588746693-31078-2-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588746693-31078-2-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dillon min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  6 May 2020 14:31:33 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> add ili9341 for stm32f429-disco board
> some hardware resources can be found here
> https://www.st.com/zh/evaluation-tools/32f429idiscovery.html
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  .../bindings/display/panel/ilitek,ili9341.yaml     | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dts:21.13-23: Warning (reg_format): /example-0/display@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: display@0: 'spi-3wire', 'spi-max-frequency' do not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: display@0: compatible: Additional items are not allowed ('ilitek,ili9341' was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: display@0: compatible:0: 'ilitek,ili9341' was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.example.dt.yaml: display@0: compatible: ['stm32f429-disco,ltdc-panel', 'ilitek,ili9341'] is too long

See https://patchwork.ozlabs.org/patch/1284139

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
