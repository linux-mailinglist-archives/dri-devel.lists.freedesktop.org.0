Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A037739510
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 04:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6464310E3A5;
	Thu, 22 Jun 2023 02:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D6010E391;
 Thu, 22 Jun 2023 02:00:52 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-341c14e495fso31726005ab.0; 
 Wed, 21 Jun 2023 19:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399251; x=1689991251;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBXEfv4Yrn77qP/MYPvp3SEav3PapGrc9nExUoKa+q4=;
 b=jPY9Se7ZE15o30yGK2cZti5xS5noBoTyge3qqCg/3IcR3/qIUoKaJiKP5nge5bPfNn
 ClJKxq9rrXho33K4FzTT2JgMdPx3pFRW6I2w2VEYGKF3h4s7IckdduqI8SXisyW9aP8w
 Wi1judwpZBjZEq5p3IJTvys1ZMoLxvkXWZAL5v+bBiU/3QcIfdjbH5kbXoXGFFLE6Qm2
 RLxLgBFTsoSKB3ScfIOHtvWOigPaDntCfWD7N8Kwig0cBq8FR2W8gWX9mjBWBmWxvC7e
 KowkZEqiuRGU7C/b3MfIVdasHlVXPSismobyf7AE3OvuI+92evEiONpbsu8ZfB1kapz+
 5DPw==
X-Gm-Message-State: AC+VfDzhfhico18cPJedcwFaRWw+Z0lM+3wdaoJJL/Hfj4HSmhZDRbdC
 nIh1Y2vdmMJd//C8g0utPw==
X-Google-Smtp-Source: ACHHUZ4LjlN2f3BpdV6OS0nUzSrKIpexflZ3GCFR2u9mVTl6o2I45TcjN3WnmY9ZnCdbw80O88zXjg==
X-Received: by 2002:a05:6e02:4d2:b0:340:b569:aec1 with SMTP id
 f18-20020a056e0204d200b00340b569aec1mr15521666ils.28.1687399251132; 
 Wed, 21 Jun 2023 19:00:51 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a92d9cd000000b0033b2a123254sm1670712ilq.61.2023.06.21.19.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 19:00:50 -0700 (PDT)
Received: (nullmailer pid 55180 invoked by uid 1000);
 Thu, 22 Jun 2023 02:00:48 -0000
Date: Wed, 21 Jun 2023 20:00:48 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings: display: msm: sm8550-mdss: document
 displayport controller subnode
Message-ID: <168739924746.55132.18209927857725642853.robh@kernel.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-3-8bf386b373eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-3-8bf386b373eb@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 21 Jun 2023 11:26:27 +0200, Neil Armstrong wrote:
> Document the optional document displayport controller subnode
> of the SM8550 MDSS.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

