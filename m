Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE16643519
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 20:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9019A10E295;
	Mon,  5 Dec 2022 19:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA38910E295;
 Mon,  5 Dec 2022 19:59:05 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-1447c7aa004so6607697fac.11; 
 Mon, 05 Dec 2022 11:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEAnu7uzdyKxi6uACyBWEuDTuRvgDtHrA+B4q7yunNI=;
 b=uCoNxAuJOa3PEHXu3Dcv2SERavpLvGrKr07OOW9hhXJ3FkZ1pfEmF0yvq1/zoU+imO
 QG7kIqCKHv0GE2qjVMUHbZl29t7zY3ZN7D5AhrbVIu6kErUGvW0LEiYz3owwN5m9kIJH
 KC+3/srnonmDFHJUr5EOMF9VoUf99uYvDzvQ/qZqKVLVwDG5IjjFE37aygsU2IOxl/0/
 OL7B2cd9tG8Im8aO8IB/dYY63NRFm6D5iIW+oi18vV25JvKxilQ1dLHuR6Y7GTFMARG5
 PzdI0nOC2RSymYdMpFWAztnowLtp14xN5CvXRn4kmxJ8cigM6pf+zpvWl7O46GTARK5/
 Op6g==
X-Gm-Message-State: ANoB5pmOQ5gjpOSTh8cg+Lw5P94a0BGVdqQbf93zWimOrgsOj2NfVvNO
 jT1HsWtN2gIKMGwl081DLA==
X-Google-Smtp-Source: AA0mqf7fMiFCbI8Ep2v3J4RDnUbCcrXNHnij3aDhkcB8B5lNYqwmPndSfV/2xe9bU+mWpxxsCJnq7w==
X-Received: by 2002:a05:6870:9a8c:b0:144:9227:7292 with SMTP id
 hp12-20020a0568709a8c00b0014492277292mr3959634oab.10.1670270343555; 
 Mon, 05 Dec 2022 11:59:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c14-20020a9d784e000000b0066e83a74b99sm5256954otm.35.2022.12.05.11.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 11:59:03 -0800 (PST)
Received: (nullmailer pid 2494946 invoked by uid 1000);
 Mon, 05 Dec 2022 19:59:02 -0000
Date: Mon, 5 Dec 2022 13:59:02 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 05/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Message-ID: <167027034166.2494886.3657636401660788311.robh@kernel.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-6-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125123638.823261-6-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robh+dt@kernel.org,
 agross@kernel.org, david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 25 Nov 2022 12:36:25 +0000, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 152 ++++++++++++++++--
>  1 file changed, 142 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
