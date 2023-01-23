Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A7678976
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 22:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503EC10E58C;
	Mon, 23 Jan 2023 21:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B1310E58C;
 Mon, 23 Jan 2023 21:22:30 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id v17so11566509oie.5;
 Mon, 23 Jan 2023 13:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=km5MHBFg3WaIEODkOycCfdgVcNvfUAMbE+78TwtWGJk=;
 b=wwD+dl9pdtTL7x4RfeztWnaIbFcoxMbCfQbTXbFysEPLjK1YxmhbVqOlnz11y1Ahoq
 gvnIkpi/usltIugOYhLmYHtfJvkurjFnyHSG5mGr0I3r1k1KqJCaTI++lEvpXzdAJdrH
 1JqhXNrHOqEmd+4DYHLjAHxjGpTx4xGndM7eitaNXHPZNYydUCZeSmaKiwYTnO4nWRHz
 ufoK5iD8PmI0STQaUX3VSbcGp1LI8AgAkn16spAQaoMVXZ+gpCafKtWtElGHQcV/7awJ
 Ar1/m0t/7UvKoPhxb6KJIogJlMBGuPVvSMLTlcu1QFgZ7tClWQuIQDuIASW198mpQeZ+
 oGyA==
X-Gm-Message-State: AFqh2kqNL+3cFHkq9P5CJ263OAPWGuYrLBm1TvDyXiCdWTDHPWFqbGx6
 l8YZG8PKB4thkEpYzMJLvw==
X-Google-Smtp-Source: AMrXdXuZaYIcuyOxhHXh9+FUI61XRC36OTfJwV9ek7v/xiD+F6Kk/85rE89xiM1B8FaUhRAbqKN3wQ==
X-Received: by 2002:aca:1a19:0:b0:363:acf4:7f3f with SMTP id
 a25-20020aca1a19000000b00363acf47f3fmr11030730oia.16.1674508949227; 
 Mon, 23 Jan 2023 13:22:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i11-20020aca2b0b000000b00369a721732asm189207oik.41.2023.01.23.13.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 13:22:28 -0800 (PST)
Received: (nullmailer pid 2662050 invoked by uid 1000);
 Mon, 23 Jan 2023 21:22:28 -0000
Date: Mon, 23 Jan 2023 15:22:28 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: phy: qcom,hdmi-phy-other: mark it as
 clock provider
Message-ID: <167450894751.2661990.692858765334564400.robh@kernel.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119132219.2479775-3-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 19 Jan 2023 15:22:15 +0200, Dmitry Baryshkov wrote:
> Eventually all HDMI PHYs are going to provide the HDMI PLL clock to the
> MMCC. Add #clock-cells property required to provide the HDMI PLL clock to
> other devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,hdmi-phy-other.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
