Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461555788F8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 19:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A78C10EF19;
	Mon, 18 Jul 2022 17:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDB310E12F;
 Mon, 18 Jul 2022 17:56:07 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id h16so6413748ila.2;
 Mon, 18 Jul 2022 10:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I/MwKhACUJLQ65w/8jKbJC5ad8kKFA2yw8hzpGalkIY=;
 b=yB0aSnNTs1oWiFV6VRMZ9DYCt2wyShVyyVm8DeE7ir1DqIrwihiARznPoT1Oh7w9AZ
 k8in/r99K/CsI0nMeDK0sfzfmWRhwt6s8OUIJ6/f4Sxttd+iY6Z9dX0nIqZgh51rOGM+
 vuo+cGmr3vPvS9AS4htfgxCaIFqwCKrJ4D0EzQBD436CurBNbYysA8L+3BXkJs8Ez3U1
 0arzzgwC7Wd2g74MP9Lg8Rair68dm/aQqlF4wWV9dSQ6zUVmb/B+kIWoQxDA3YroO6In
 +lcOy67P/okA82ourkDhUli3DZ9lMiNqQSclKPEtoG2AADrI4N/RYXysOAuv46A82LFU
 xSIw==
X-Gm-Message-State: AJIora+X/t6ckCv80muYwjfvKybzTt/qBTw+V8rv3MXCtg+j1qB5OhSR
 XOtELuaM6oRg9Cd526EJOg==
X-Google-Smtp-Source: AGRyM1tJ+f0CvbcrUje9rTcnR7svY3bdB2y2kaIvrbLzEehGWhODRuZe/y+ZBNT7p6Y19UZcaPyAUA==
X-Received: by 2002:a92:b706:0:b0:2dc:c7e3:63fb with SMTP id
 k6-20020a92b706000000b002dcc7e363fbmr7913615ili.170.1658166966737; 
 Mon, 18 Jul 2022 10:56:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 q204-20020a6b2ad5000000b0067b876ed5e2sm6254416ioq.23.2022.07.18.10.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:56:06 -0700 (PDT)
Received: (nullmailer pid 3248238 invoked by uid 1000);
 Mon, 18 Jul 2022 17:56:04 -0000
Date: Mon, 18 Jul 2022 11:56:04 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display/msm: move qcom, sc7180-mdss
 schema to mdss.yaml
Message-ID: <20220718175604.GA3248180-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:35 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  45 +++++-
>  2 files changed, 80 insertions(+), 114 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
