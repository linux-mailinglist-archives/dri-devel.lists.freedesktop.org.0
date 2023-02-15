Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE26984E6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 20:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2308A10E29D;
	Wed, 15 Feb 2023 19:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0E010E29D;
 Wed, 15 Feb 2023 19:47:16 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-16e353ce458so6741388fac.9; 
 Wed, 15 Feb 2023 11:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCKB1GmkGqKzi3qlguY0d4xIlc4o+GKLU2+qn3OriIQ=;
 b=Aj6TbRXLU6JoLp4nx/2ZluN2PGnCjPngnSt9T5jqImfs77lAYU/w+YIH/nqJZyhkbe
 TWB8mCN95/9wFuNV3ETolv10uOA3eWcGfe4rvh6P8RLc4FCkSGB17HTDSDAPKxeLgydW
 juoj2/MrOKlvk4NjJa4IfPu6uWpxIoK8aZpiRgSy/8FUb7rQPnUkm2S8ObQeMwSnW8/F
 CeU8iFcHjKvSOuPok6WGW4YBY42Iam5o3PrVCHMip7Xvysc6NSEfP0k1csM3eQ0NiSfx
 znLYPg7YxCExKJv9/e0NdZONDMnLvVVebqJgF6SopFSg+2CHHAefDtfWymxOwY0WBDHB
 anaQ==
X-Gm-Message-State: AO0yUKXETVq5b1N9LkKEwpwCyeiKfpvRLDvcIQOMVNddRgMPl8Cpkzbo
 viv1XfmxGgiH0fQGrDdCcQ==
X-Google-Smtp-Source: AK7set/45g0dj5NpkqKQXm1LuueV/uADXZWsrn5BZINkMVUBQzApudSM6llLVEsgK+O7dxyuyZrhUg==
X-Received: by 2002:a05:6870:80cb:b0:16d:d644:fadf with SMTP id
 r11-20020a05687080cb00b0016dd644fadfmr1729552oab.43.1676490435121; 
 Wed, 15 Feb 2023 11:47:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dw43-20020a056870772b00b0016e0779de32sm3538928oab.1.2023.02.15.11.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:47:14 -0800 (PST)
Received: (nullmailer pid 458641 invoked by uid 1000);
 Wed, 15 Feb 2023 19:47:13 -0000
Date: Wed, 15 Feb 2023 13:47:13 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 8/9] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
Message-ID: <167649043339.458588.13199640844936490270.robh@kernel.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-9-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213121012.1768296-9-konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 agross@kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 13 Feb 2023 13:10:11 +0100, Konrad Dybcio wrote:
> Add a compatible for the DSI on SM6115.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

