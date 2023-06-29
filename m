Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46386742A8F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 18:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F39F10E054;
	Thu, 29 Jun 2023 16:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178310E054;
 Thu, 29 Jun 2023 16:23:16 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-345b231322fso3547865ab.2; 
 Thu, 29 Jun 2023 09:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688055795; x=1690647795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPh8e75fI5DgK1FIHoQuqCb5ZMtTAcx7+QMfAfjXghk=;
 b=Ar0jqnlhXZ/o82QWp4BpglQqr4yoFB8LflqRnXbb6B5RFAjmaBRplIfbVsEsfzZG5F
 oa8a/U56tLYy2/sJUE/JSkPAj4DvNFUMXS5MLkKc+LydaV0XCPNAqNPOYZtpw+5MxD92
 72p2aXeCyNBuldTftflj75LD6beJ+QdBxV4mCJ8XSEHNELTrIsN3k83c0YlyZrQqm/oL
 emPPTo3i558xH+obNuonTYOJVoFiGc8VHBleQEUOpmVgTzFrRE4g/wnRVXueUBoNXmgy
 piDj9JELc0Cj2rwh5uDk9NBywb1I6oZ8qG77me+ohCVIPESvqT8ik9J6GmYF6m5xK3VJ
 bsqw==
X-Gm-Message-State: AC+VfDxgSydSi5Y/4FEqxjGUUK1IV5nZ7FciwwW8gQykmjpvY89y+02D
 AfwPJ7tOYufBPO7ntDGliA==
X-Google-Smtp-Source: ACHHUZ4Kcv1UA5oX8BJmHwp8UVcuaRFAtds/5zfPnZvvG9i/NDjjwMOVlcnm/2bZb+YynlmohRZQUw==
X-Received: by 2002:a92:de50:0:b0:345:d277:18eb with SMTP id
 e16-20020a92de50000000b00345d27718ebmr3614130ilr.30.1688055795161; 
 Thu, 29 Jun 2023 09:23:15 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a92cc47000000b0034255d2d3c5sm4172219ilq.48.2023.06.29.09.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 09:23:14 -0700 (PDT)
Received: (nullmailer pid 3142728 invoked by uid 1000);
 Thu, 29 Jun 2023 16:23:12 -0000
Date: Thu, 29 Jun 2023 10:23:12 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: dsi-controller-main: Allow
 refgen-supply
Message-ID: <168805579134.3142664.11063512171591617294.robh@kernel.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
 <20230628-topic-refgen-v1-3-126e59573eeb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628-topic-refgen-v1-3-126e59573eeb@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 28 Jun 2023 18:29:47 +0200, Konrad Dybcio wrote:
> DSI host needs REFGEN to be enabled (if it's present on a given platform).
> Allow consuming it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

