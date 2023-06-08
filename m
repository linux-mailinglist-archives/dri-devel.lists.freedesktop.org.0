Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026387289BE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 22:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D77A10E087;
	Thu,  8 Jun 2023 20:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDD210E087;
 Thu,  8 Jun 2023 20:58:52 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-33b1da9a8acso4884475ab.3; 
 Thu, 08 Jun 2023 13:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686257931; x=1688849931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FMvGYAzuZRfNH9ntpuhSoq2QKXt57EC2toGT1Yc+LQ=;
 b=RV2k5pDfTY0ZYIxoqDoSO1pu/adbKnwqvIO7/0oblKdv6Ho1SoJbCsfvSjC6msaFlR
 PSejtDaB4xMnrYyK+fnmgW/98XAsUY/MKWzfZBTONykqsCQ22y+UI3K6wDNvTCot8kpW
 xIbnMt1fjaY/ZWNGuNjMhOi8mGcqQHxwDuEa126PVq4ItL4L/dwK6J7djYJPOrq7eYPI
 ieHSZ4YGYExnRWAcroX0Hsjq/8Qk89m/bzlqR4WihzvCV3wBJyoRqca8h1+UO4WOyAYU
 IIq3EkxkboKVJE8vk0k0s5L4enmKAs3iN+pBx6JQwkzu1wGKqvtIf3A4ThE8lUC3qVSV
 obZQ==
X-Gm-Message-State: AC+VfDxsBxoe/z8N6LR5dYVnYO4lNCYfS/s9gH0z5m+cm/yapgpfqrxU
 /W1UL8FWEApzRKNqUHiURg==
X-Google-Smtp-Source: ACHHUZ5ulKJE2NEgESnPWkXHIhgORYjMch54tcncszW51gmLv2NwnUQflJQQonqUZB/1nKyGzK2X8A==
X-Received: by 2002:a92:cc01:0:b0:33c:b80e:4599 with SMTP id
 s1-20020a92cc01000000b0033cb80e4599mr11532791ilp.9.1686257931638; 
 Thu, 08 Jun 2023 13:58:51 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a92d6cc000000b0033bea7559ffsm630717ilp.53.2023.06.08.13.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 13:58:50 -0700 (PDT)
Received: (nullmailer pid 3434522 invoked by uid 1000);
 Thu, 08 Jun 2023 20:58:48 -0000
Date: Thu, 8 Jun 2023 14:58:48 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 01/18] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Message-ID: <20230608205848.GA3424883-robh@kernel.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
 <20230530122652.lct6tk6zseny6gxl@krzk-bin>
 <1ceeb56e-3efd-6858-358a-bd1976c625b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ceeb56e-3efd-6858-358a-bd1976c625b1@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 30, 2023 at 03:35:09PM +0200, Konrad Dybcio wrote:
> 
> 
> On 30.05.2023 14:26, Krzysztof Kozlowski wrote:
> > On Mon, 29 May 2023 15:52:20 +0200, Konrad Dybcio wrote:
> >> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
> >> we'd normally assign to the GMU as if they were a part of the GMU, even
> >> though they are not". It's a (good) software representation of the GMU_CX
> >> and GMU_GX register spaces within the GPUSS that helps us programatically
> >> treat these de-facto GMU-less parts in a way that's very similar to their
> >> GMU-equipped cousins, massively saving up on code duplication.
> >>
> >> The "wrapper" register space was specifically designed to mimic the layout
> >> of a real GMU, though it rather obviously does not have the M3 core et al.
> >>
> >> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> >> specified under the GPU node, just like their older cousins. Account
> >> for that.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  .../devicetree/bindings/display/msm/gpu.yaml       | 61 ++++++++++++++++++----
> >>  1 file changed, 52 insertions(+), 9 deletions(-)
> >>
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> I think it'd be beneficial if the bot diffed the output of checks pre-
> and post- patch.

Fix all the warnings and it will. ;) Care to donate h/w to run the build 
twice every time?

Really what I care about on these is when I keep getting changes to a 
schema and the list of warnings remains long and not getting fixed.

This case was less than useful with just the oneOf warning.

Rob
