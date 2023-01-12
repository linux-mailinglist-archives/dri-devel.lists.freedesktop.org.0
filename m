Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD166855A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 22:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4510E1D3;
	Thu, 12 Jan 2023 21:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7F10E1CB;
 Thu, 12 Jan 2023 21:30:08 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id r205so16334997oib.9;
 Thu, 12 Jan 2023 13:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGDJAlac5FfnEqlyVg+zh7XlFC4ayDXPYpMmXvUUmEs=;
 b=pBZQRAwHRfTtxbPftSF36fuTypZmMzA9hHGggmS7ruj3Hnah5KbPSmHL1Lm0S9phJ7
 a5nW1TgE53LCKMplY8du4CbI6mheD3ByL6PYytoqwNW0dnlSdROmUOSediioFb1vjdjl
 PVy4GwFV8kykuFhAvJ9uwAdMojHJcg5xbBmplmngGinU3GVc4gT6l/Xw8FjOk2PsQHOc
 3K2GhTB4hakXQp2gZMiVu23MqA0+slmsQJEkmgco5yd0cUEbDBVj8JRqhSZdodRbgLCI
 g4aUZd7G25RrH2bTuJSfKM62h43vupZM8s7jalu9ijdvtEjzKzAQ24bc/UBYl841ar6A
 bCug==
X-Gm-Message-State: AFqh2kocwX2O1YPst2/AOzSUsHldyqTMKdH5k0oVnjG3I4kUZCFLp1lJ
 svezHFE4JtgjHG/CsP8ggg==
X-Google-Smtp-Source: AMrXdXsulqDY06Wl7vya3HQU6RgXIwd3IU/V/n5L87+rA8ae+ZBcG9CaZ19DW/c0OBq6zHLD+ugKRA==
X-Received: by 2002:a05:6808:49a:b0:35e:cf1a:9cd0 with SMTP id
 z26-20020a056808049a00b0035ecf1a9cd0mr36993466oid.14.1673559007884; 
 Thu, 12 Jan 2023 13:30:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t17-20020a0568080b3100b0035bd1909a66sm1092343oij.57.2023.01.12.13.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 13:30:07 -0800 (PST)
Received: (nullmailer pid 259006 invoked by uid 1000);
 Thu, 12 Jan 2023 21:30:06 -0000
Date: Thu, 12 Jan 2023 15:30:06 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdss: fix HDMI PHY node
 names
Message-ID: <20230112213006.GA257510-robh@kernel.org>
References: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 06:54:53AM +0200, Dmitry Baryshkov wrote:
> On Qualcomm devices HDMI PHY node names were changed from hdmi-phy to
> phy. Follow this change.

Okay, but foo-phy is generally accepted...

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml          | 6 ------
>  1 file changed, 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
