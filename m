Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2EE22F777
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 20:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603E289DCF;
	Mon, 27 Jul 2020 18:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75EC89DCF;
 Mon, 27 Jul 2020 18:13:58 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id t18so13949804ilh.2;
 Mon, 27 Jul 2020 11:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qphSXwUDbDL/STSwZyNfj+0kNYsQNz0+uZs8OU4m+yA=;
 b=IEEpJRJ1Q+61SGdgW9relMJy0PPxl97JOdnMMsJ6KJtm4XRLWi6Ri2C/lct7LQIeq9
 RjtHjMsehEh59wtydBqUclexT2MCs4wFIHl6o54jjtRBx+glj3myKEQY4+LDnpVoo9QJ
 cS+wfdMSfBJ2yvgE85LKwzOuXstaPhDEJVsWgbXAGVMYem92UwzDDiUTsEA5U8KeDVBp
 0987H5P+RPC/bXZ8awEQMCqyMAo0nVKV5Os8grkknb4E6+PMC47gLATMpkL9YGAccnqJ
 WNoCDkpYHO1YyXLXOTEIixkcfLJbj5gdM3Cyw2DPOBd84vbJVcJlbYvduFRuqrj7VHgU
 C2Mw==
X-Gm-Message-State: AOAM530xSE8E50IAwAu3QmscJW22NGBXGMVMSapPklAnmHufkLM2jaTe
 ZaNZHkP7/1Fux2lqH4mPQg==
X-Google-Smtp-Source: ABdhPJxgiypIQYIODHYWAN1gC3+lDaAHwErFKahF6Ut43xD7/abYM0/1Z1iU78NrtHLEqfkyGnVtBQ==
X-Received: by 2002:a05:6e02:1213:: with SMTP id
 a19mr3107446ilq.129.1595873638096; 
 Mon, 27 Jul 2020 11:13:58 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id z68sm1237830ilf.25.2020.07.27.11.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 11:13:57 -0700 (PDT)
Received: (nullmailer pid 638572 invoked by uid 1000);
 Mon, 27 Jul 2020 18:13:52 -0000
Date: Mon, 27 Jul 2020 12:13:52 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
Message-ID: <20200727181352.GB634850@bogus>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-10-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726111215.22361-10-konradybcio@gmail.com>
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Xiaozhe Shi <xiaozhes@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhengbin <zhengbin13@huawei.com>,
 Manu Gautam <mgautam@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Jul 2020 13:12:06 +0200, Konrad Dybcio wrote:
> From: Xiaozhe Shi <xiaozhes@codeaurora.org>
> 
> Add the REVID device driver. The REVID driver will print out the PMIC
> revision at probe time.
> 
> Signed-off-by: Xiaozhe Shi <xiaozhes@codeaurora.org>
> [konradybcio@gmail.com: Fast-forward the driver from kernel 4.14 to 5.8,
> convert binding to yaml]
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../bindings/soc/qcom/qcom,qpnp-revid.yaml    |  38 ++
>  drivers/soc/qcom/Kconfig                      |   9 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/qpnp-revid.c                 | 288 ++++++++++++++
>  include/linux/qpnp/qpnp-revid.h               | 369 ++++++++++++++++++
>  5 files changed, 705 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
>  create mode 100644 drivers/soc/qcom/qpnp-revid.c
>  create mode 100644 include/linux/qpnp/qpnp-revid.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml:  while scanning a block scalar
  in "<unicode string>", line 22, column 18
found a tab character where an indentation space is expected
  in "<unicode string>", line 24, column 1
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1336467

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
