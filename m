Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D4234C2D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 22:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981316E047;
	Fri, 31 Jul 2020 20:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F92C6E040;
 Fri, 31 Jul 2020 20:26:06 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q75so24742050iod.1;
 Fri, 31 Jul 2020 13:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BGJ0cV6tlcyXT1xqGGOkGIW3JZcU+nzmQwF+b4XNxkk=;
 b=OekTvHyEiEcVx57+l08uzPVb5zzLX2t20hl4MbSOL22YnvuwCq7rXeBp6Dr8Mn6t2c
 f7/dBMU5fxv+OjLV96Kg61859f2AqR92VHtXEMOppUzpxrT97ibODOEfs85Oy7biWxdn
 oc5JD1pwy/+UWdL86ef2dPq6eM2e9+O5fv2vkColWVsdPN0qPBh3Be2uWLlMz+m4aGI7
 2FXAcodYlVBDGbZpeiB9GVYVjowkqhOX+yxpieABPVPnOZSWaG2qRQn3F8wENdhc2jwi
 WRwkrpe8pwZvRMfTkSoeE319tXzu0FcNfoCI4/SUaVpaM0Mm9MzNdo7b93ucekJv3hDT
 XpNA==
X-Gm-Message-State: AOAM533NNqg5T6LPPfGivOdEhA5+wEkzRnELj+cpTc3RnD3uuyBvxgdL
 M7AS2NBcqrk23u4ZdqVtHw==
X-Google-Smtp-Source: ABdhPJwE1oeviUbVjkAV9WCXrw2poWOORAGd9woxfUZAaudtQVnqWHqszu63PdcS8I49J5RJfronOg==
X-Received: by 2002:a02:6009:: with SMTP id i9mr6756397jac.78.1596227165611;
 Fri, 31 Jul 2020 13:26:05 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id n1sm5322084ilo.68.2020.07.31.13.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 13:26:04 -0700 (PDT)
Received: (nullmailer pid 722926 invoked by uid 1000);
 Fri, 31 Jul 2020 20:26:00 -0000
Date: Fri, 31 Jul 2020 14:26:00 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 2/9] phy: qcom-qusb2: Add support for SDM630/660
Message-ID: <20200731202600.GA722818@bogus>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726111215.22361-3-konradybcio@gmail.com>
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
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, zhengbin <zhengbin13@huawei.com>,
 Manu Gautam <mgautam@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Jul 2020 13:11:59 +0200, Konrad Dybcio wrote:
> QUSB on these SoCs actually uses *almost* the same
> configuration that msm8996 does, so we can reuse
> the phy_cfg from there with just a single change
> (se clock scheme).
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
