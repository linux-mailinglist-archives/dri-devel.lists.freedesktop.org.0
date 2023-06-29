Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7F74299E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 17:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8979010E18E;
	Thu, 29 Jun 2023 15:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549B210E18E;
 Thu, 29 Jun 2023 15:27:49 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-783698a37beso34058239f.0; 
 Thu, 29 Jun 2023 08:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688052468; x=1690644468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZR9sZh+9bjHT/NeBWN3KSD8INZ5F1XGNWsIgo61+bw=;
 b=abOdShnig4F4jroBwPOcXiG1WJz4IHltGIptbaOegYyCUvhtf2hK9hIb/6bOfqpRSL
 nZcKkJgIwBRABRa0RDOzZai0p09fcIhNkZs4UQ2E8rg+9fCIrOxEnrFK6Aafq1pAb7W/
 U4HJvoHRIpzT5BY3W2OQsr5XIDyzpcMXYxAxQad2jjnk1R1OdJpdUmfjcyawkGcjdjp2
 pxL6MHM7qikKfdLiYko41wnu47S8J6NmFkoYLF/TvEPGF2YeM7D5oC72MiahqvhUlOAS
 9hSzDN9LKyqL1Kf0wVaUFsKlaLaNc44Lqn9bxhFmJjiNs8AIP9CVirgldyc6nb3lH5i4
 ZHgQ==
X-Gm-Message-State: AC+VfDy5NBw7LbLJR2XtHIdLkozSVU8z/ZJyKJtpstPmqOA0/DTSmc2o
 daj3NEcHlAVYfuG2MosMeA==
X-Google-Smtp-Source: ACHHUZ4KLxkCInEQQQCS9qmNAEIF532E5Hd6Y2pqUoJrYe3Vdsqc/jeuYEguX546tpcpPckCkDYkiA==
X-Received: by 2002:a05:6602:424e:b0:775:5f74:f4c7 with SMTP id
 cc14-20020a056602424e00b007755f74f4c7mr42469927iob.17.1688052468076; 
 Thu, 29 Jun 2023 08:27:48 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a02878a000000b00428722c1c51sm3875373jai.32.2023.06.29.08.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 08:27:47 -0700 (PDT)
Received: (nullmailer pid 3066583 invoked by uid 1000);
 Thu, 29 Jun 2023 15:27:44 -0000
Date: Thu, 29 Jun 2023 09:27:44 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 03/15] dt-bindings: clock: qcom, dispcc-sm6125: Require
 GCC PLL0 DIV clock
Message-ID: <168805246390.3066499.7212254924681716912.robh@kernel.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-3-03e430a2078c@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-sm6125-dpu-v2-3-03e430a2078c@somainline.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 27 Jun 2023 22:14:18 +0200, Marijn Suijten wrote:
> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
> be passed from DT, and should be required by the bindings.
> 
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

