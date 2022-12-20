Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073F6524EC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD73510E098;
	Tue, 20 Dec 2022 16:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D405110E098;
 Tue, 20 Dec 2022 16:49:40 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id k189so11056059oif.7;
 Tue, 20 Dec 2022 08:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xfo0DKmMuO25A+nCHOD0jlMrFZ6CXCqZIybciF03fMk=;
 b=63eMlghTfRZGjd6GTuhlMd4MYEZJ8+jGdBIeK4DMOhA8Evg7nAx5/4IPZV9zYvnxWN
 UxAnwbyLEHVCCXkcSm4udvVyIczrX5gqfK8kCLivDUm+4gJAs4wwYKs1wL54KKBEzaqg
 h9FdpyHaZFoSZmTv7yz+JnzewSPN9rexSRKTpInUEMYOVGJySsmdZDmtTo2RXtsNC7Em
 s8XsD2puTibHkG/uHRpDg1BfNY4tS1MTa0hr5AoNTJyQ+vaIRom0U8qvq3nrx3bhw3wL
 7AOzhe36Sr4T/Znr5ascDSTp19PO4IiuoqHktYsJY3GdC5px11HcY1ipvmRaKrbzvLgy
 6pkg==
X-Gm-Message-State: AFqh2kq8/BIrhSHicFjirufAjDoW5wqMoutELhWMFmmUgkgif2Nv1jX3
 qzNoLzhW9YDH2JBs43vIGx1PqiFdcA==
X-Google-Smtp-Source: AMrXdXtb9dnjg9S/upe3GH/oPYQi1IvGTkfvaKUQWnOl0cMjKRXg+yxj5Ga1ozak5D9lrEdX8QEf5Q==
X-Received: by 2002:a05:6808:200e:b0:35c:2451:59bb with SMTP id
 q14-20020a056808200e00b0035c245159bbmr6658804oiw.20.1671554979988; 
 Tue, 20 Dec 2022 08:49:39 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ec10-20020a056808638a00b0035acd0a6eb2sm5668080oib.41.2022.12.20.08.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 08:49:39 -0800 (PST)
Received: (nullmailer pid 726453 invoked by uid 1000);
 Tue, 20 Dec 2022 16:49:38 -0000
Date: Tue, 20 Dec 2022 10:49:38 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v5 07/21] dt-bindings: msm: dsi-controller-main: Fix
 clock declarations
Message-ID: <167155496351.726025.910828492116114621.robh@kernel.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-8-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220123634.382970-8-bryan.odonoghue@linaro.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, dianders@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, agross@kernel.org, david@ixit.cz,
 swboyd@chromium.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 20 Dec 2022 12:36:20 +0000, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fix this by listing the clock descriptions against the clock names at a
> high level.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>


