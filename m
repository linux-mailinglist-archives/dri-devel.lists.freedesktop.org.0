Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318D22F76F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 20:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE4E89798;
	Mon, 27 Jul 2020 18:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333AF89798;
 Mon, 27 Jul 2020 18:13:52 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t18so13949503ilh.2;
 Mon, 27 Jul 2020 11:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FezFginUTy2nglTrBQrbccgUu3m/rgDlVyShBQFXbuM=;
 b=O5QWAI6rCWWpE8Z0eqr10b+m6lZG8RJgESZQNhneUrc539VtJ87a6niCZUFqdN7tjt
 A+0eMkpJQCt7zjRxYYmXikhnEyp/87RaNndgXb5jwVLfXENkfCjJQaSAgTK13gdP97wu
 4KuXZ4/FrSrgj4rOAt64DOQBBrHwnnpWlHX+mLdMC4vCh69WUYIhWv9KCczAvW/cxeZ1
 +5UJoyRisQbjSSta2kGYglxRPG2eCrjQHZJ85IWapO/hNsQFIyg8DjGaMRDPaoesg9zC
 sPxksR/lZHAG8oH9j9HHuvJlVdTbftDZCtSRk5906Fl/kFiqIeMA2Iy7bLGFdEmzrJ1E
 yBMA==
X-Gm-Message-State: AOAM531O+uBsyb1tS9Uh5+uX5s5O16JzodyhEc8euhB9MyHOKNdbzvhn
 Y002FDs2h61QsY+vgY54nQ==
X-Google-Smtp-Source: ABdhPJxcTZ1wWiZQBj6GSHPIlQHm9ClLpwRYBVSWGAnLwaItX6R/lSkREMbAFXVOnxUjPhxCOFMv7g==
X-Received: by 2002:a05:6e02:8e4:: with SMTP id
 n4mr16683067ilt.96.1595873631429; 
 Mon, 27 Jul 2020 11:13:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id c67sm9202464iof.16.2020.07.27.11.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 11:13:50 -0700 (PDT)
Received: (nullmailer pid 638435 invoked by uid 1000);
 Mon, 27 Jul 2020 18:13:46 -0000
Date: Mon, 27 Jul 2020 12:13:46 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
Message-ID: <20200727181346.GA634850@bogus>
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
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 26, 2020 at 01:12:06PM +0200, Konrad Dybcio wrote:
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

Bindings should be a separate patch. checkpatch.pl will tell you this.

>  drivers/soc/qcom/Kconfig                      |   9 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/qpnp-revid.c                 | 288 ++++++++++++++
>  include/linux/qpnp/qpnp-revid.h               | 369 ++++++++++++++++++
>  5 files changed, 705 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
>  create mode 100644 drivers/soc/qcom/qpnp-revid.c
>  create mode 100644 include/linux/qpnp/qpnp-revid.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
