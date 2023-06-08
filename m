Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED27288E0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 21:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E5610E148;
	Thu,  8 Jun 2023 19:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380D10E148
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 19:43:40 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-777ac791935so46004939f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 12:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686253419; x=1688845419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7U0zTc24ytGGzlyel1Af7i7P3XOznRaJPq/P7jBwwD4=;
 b=U/JQuJFiE5Lilp/A22Wkx90PShuAXSz1Hpi8+NpX/uX1/f5kH/7lv07URJs8pg4BMm
 RT0GZjiLnZP3EH+jc7SkMHMqWlInSkULJc/HJRu6ua9igdexmdjypPtr0VTQDSI+Lhnb
 poRxBBTIo1jCleQ1YAACX9SU1hEAmfgz/rczWLOZoTf43cIdFYtGBY5aJKr0zcCoMBUU
 lv/kYO42inPqKRQL0rSBRfCOz6cGBe8/zFGmenGPgVg958DBG+UaIfGLF0zQXXKVSfjh
 ZuLBIK1x0WQ2+T76Jk6DgZCgEDvJYjNDnOcOqE6z0TcndxTDPbSPyNQON4r33Jpqkt06
 ++mA==
X-Gm-Message-State: AC+VfDxegkw/7iP1AidHP3EGxLvwkdIEiVsrWn5HMbuYgIPsC+lJvIZH
 tafI1SYjtv+Qw4/G0IFHSA==
X-Google-Smtp-Source: ACHHUZ54Jwao0CPoPCS4+xl//513zcQj8+ClMRRpaFOyEBKjv879tBuFbVNST9e1frlYL5+vlHfg5Q==
X-Received: by 2002:a6b:7614:0:b0:779:c221:eb6c with SMTP id
 g20-20020a6b7614000000b00779c221eb6cmr6984169iom.19.1686253419023; 
 Thu, 08 Jun 2023 12:43:39 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a02a493000000b0041a9e657035sm471429jam.48.2023.06.08.12.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 12:43:38 -0700 (PDT)
Received: (nullmailer pid 3284394 invoked by uid 1000);
 Thu, 08 Jun 2023 19:43:35 -0000
Date: Thu, 8 Jun 2023 13:43:35 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH RFC 07/10] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M Display-IC
Message-ID: <168625341521.3284336.6842644080474323088.robh@kernel.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-7-541c341d6bee@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521-drm-panels-sony-v1-7-541c341d6bee@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 21 May 2023 23:23:09 +0200, Marijn Suijten wrote:
> Document the SOFEF06-M Display-IC and 1080x2520 panel found in the Sony
> Xperia 5 II (6.1").
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,sofef03-m.yaml  | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

