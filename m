Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF357289C4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6412010E613;
	Thu,  8 Jun 2023 21:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CA810E613;
 Thu,  8 Jun 2023 21:00:19 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-77ac2eb07a3so50351539f.2; 
 Thu, 08 Jun 2023 14:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686258018; x=1688850018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJ6xGaMCtOtduGN8pKzDZZjENVHQCmzv4T9O+RDTdsk=;
 b=HwcfV+aj239s4XQeQbIP7husSYQj4uQUy+RzqswTn3AUhmRX1+AU2U8qFNftr93Dil
 U510CwLKK89tgWisDEzt2Z8mPjhlXXaiIo7gk+yvWnqM77FDICA+roYeKaobr6iCKLH2
 LVBeo6xjs2pPNOcoulyqC76NynLk/WZZKAJOZmpvRixXd6BqHkkdT1pmxdR3qcMNoNPK
 EB6LaMOPwgXwDaF47kzDi7UNe18mBEFR1CBFAayDEmYwhK40aqjlHmUUaQwWf43W/IHE
 WJlJ57sqISv8wemX3zoecnD3MgktZwrmOGZozTa1ek+41oHvktpBD8krGjbXNYFZL+JV
 K5ag==
X-Gm-Message-State: AC+VfDw91Zr1mvwQXPDq8FW4+c50DdqDyBwpZS1fIPb7i9L0Kbja877j
 ar/LUJBdgiBhRvjBCpdjeA==
X-Google-Smtp-Source: ACHHUZ7AyoffTQ3fi18lH+On2UmZysv1D8RdGu0Kp9eqI3ISi1ouvwHH/Odbc68BBCL+6r74PMk24w==
X-Received: by 2002:a05:6602:3311:b0:774:8d9f:e3e2 with SMTP id
 b17-20020a056602331100b007748d9fe3e2mr8171020ioz.17.1686258018474; 
 Thu, 08 Jun 2023 14:00:18 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a5ec103000000b00763699c3d02sm625027iol.0.2023.06.08.14.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 14:00:17 -0700 (PDT)
Received: (nullmailer pid 3436092 invoked by uid 1000);
 Thu, 08 Jun 2023 21:00:15 -0000
Date: Thu, 8 Jun 2023 15:00:15 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 01/18] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Message-ID: <168625801365.3436024.3812799547428239987.robh@kernel.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
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
 Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 29 May 2023 15:52:20 +0200, Konrad Dybcio wrote:
> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
> we'd normally assign to the GMU as if they were a part of the GMU, even
> though they are not". It's a (good) software representation of the GMU_CX
> and GMU_GX register spaces within the GPUSS that helps us programatically
> treat these de-facto GMU-less parts in a way that's very similar to their
> GMU-equipped cousins, massively saving up on code duplication.
> 
> The "wrapper" register space was specifically designed to mimic the layout
> of a real GMU, though it rather obviously does not have the M3 core et al.
> 
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins. Account
> for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 61 ++++++++++++++++++----
>  1 file changed, 52 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

