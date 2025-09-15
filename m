Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CFB5844F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3977F10E52C;
	Mon, 15 Sep 2025 18:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlTSAvuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250E410E52E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:15:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEUU40027131
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x6f1ur2OAuyG3gVnkNaf1NXHoDMPmNFiXyxlSHSLCAk=; b=WlTSAvuPyp4e7Tkd
 RHWpwRQ+NGYn1GZlknsNRNDJgrayongGvBjQO4e5BBSYxcgfB87mXvohwQ/LYA+G
 7rER5gMgpoGlBgBg3EGNERiIJD9eS3Di8J064nEtwL2cRYD/XRCqrIqUq4JoyjR0
 6FT5MYRUDv1Xia0r/Ap6X/xvxSPwCkqsA+UlFEsRFziL8NtHJkHDp3rL/JunWitA
 AmseY09Ilq0RqWy2av445dxcNu8lGoD+OnDLRjCH+6Lnix603ic9EB8CPeoHi2HZ
 98cNlKt74EMBTC9tpK1QMs/9i6GVS0aNHQ8duPzSrRWEezVfjbhx2phWIzM8fzeI
 4OA7Lg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072p0k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:15:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b548745115so114591241cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757960136; x=1758564936;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x6f1ur2OAuyG3gVnkNaf1NXHoDMPmNFiXyxlSHSLCAk=;
 b=wq433Zx3EEgpm5odwNzisNwKgjzowWNSkP+CIGJfz8cRviL1QBuIDf3SQIgbjq90AU
 4+RD0sQyAl3qkooTtt2VCrKyHqHy8+eVZhpGjvi6l6JLCJKlQcryZd8EgDhIOqJfiMZ1
 p7wi3oe8zMRuzH8G+AU+dOp59txpBnCHXiLVwaqsA1mOkFk2XbccU0pLc+jouB5Nxn/u
 CAUAa6Ma5kr03S4iN/eC2QfubTHY2vYGwHgrPfSE3JdgNH4g+aa56Ud+kaxTbnLK8jDM
 bTtJgpFm0J+73ybqsE0/R0wCsxQKzzo7mppiYwQ9rHYVgztEgznUu48rGF/hZMtjBgdd
 MYwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1T3Xx08L5nn5iFhidN+Xo8kXKcnyRU9CKY6sSFkfY8twlQxjpW+pFFp+tccqc56ORQ5kKU0i0clA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSMVQm63Wy6oDS+DtIL28Ks7pKsuWQRXYC6krpr2szSjLEa3AK
 cDfm/HpcO64ACrpnfjUls8v6Rcs9iY5jIhw+tDFmtRYI5tfB2Lh3U/zFI4kOrz3N1f7Mvhwq3gu
 /cvKpGAH7v22b+Pyf/8cg5n5RjkiYagaFfvhodIJqsIHsPXQT23HKnBPQ91mXaxKwZumO2X8=
X-Gm-Gg: ASbGnctzxg70wG29OkoY0aPewOtaSXnY6bayXJWFBLrnBfWogrMY7usErisPuFTAcJt
 cOU6wNwht37VeBNS5xMy55h045Uo50NeNGrcPiwi3rxZsUhChwkUMIR/kDTie8SpmWbADLiSLpd
 rdKsXKw3B1znUBX0DfSSLqkuuQJiZTRhthblfcBavddZY0t5SA6n+Kez2aOXetL4GUS5LnFh9G9
 Q9gc9Ny/39eT18JdgsiWqYA9tw5UD3hafZUCsxYXXLa3Gav8L/8BpmrOwpbY7niSJyhdifBEyEp
 R7sPSEW0NPhwuMTJTk/Sk845WXRPCWRZz2rjUwvkLu87lKYFqXS0IAGrDCMxOqMVVl3hVC3V/wV
 p36QY9JI0gznkpA6g8QrLxoBtL7lhPJ+JroeHvSMh2N/dAbUAeO1/
X-Received: by 2002:a05:622a:8c14:b0:4b6:3d70:8810 with SMTP id
 d75a77b69052e-4b63d7088e2mr175507121cf.22.1757960135024; 
 Mon, 15 Sep 2025 11:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUuro1SmpPEADogZffdM7l1FjPktoEHc4t8tIvDkL3K5P/oGNVhE55NqVHm7z5YEMGTHbndg==
X-Received: by 2002:a05:622a:8c14:b0:4b6:3d70:8810 with SMTP id
 d75a77b69052e-4b63d7088e2mr175506541cf.22.1757960134479; 
 Mon, 15 Sep 2025 11:15:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5d20df19sm3772762e87.48.2025.09.15.11.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:15:33 -0700 (PDT)
Date: Mon, 15 Sep 2025 21:15:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: display: simple: Add
 innolux,n133hse-ea1 and nlt,nl12880bc20-spwg-24
Message-ID: <l7ycmuoktaamk7kaurt757ihk5jifruoe6fq42aejpb7t6ljv2@26gtcl65s34v>
References: <20250915155123.3250823-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915155123.3250823-1-Frank.Li@nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX2GHw4P4V8lU1
 HnHUpjIwk9r0xir4jFiepPHyNiplW7CYc1ZH2KmeJb9rnRFERhuOkpPp1gLMh/khlvR1pif4A1I
 MP6SgxY4yBy/4Ej4/ujFsMDnaRUUDRqH5VOFZW6OsnhrhPH6rikgUjDo1JnX2EUY5DGsBje+L/L
 PlEl5zZJQqoW63NYvVKuG2Z/ofPWhzzYVze25nh5F4gbKV31GkImjB3e2y5nltVrYzyiJZKMJnn
 iQYbAtaolVQH1Exjp0mCzBp3Qj3M9FU5xJqm10ixet0pPuhhlBRBCLxqExOjur2vMM8gvUwEp5W
 sdwzneqkco5SUdt2EvgSQKWxHpYGJGWX6urkgRud6fCOD1gIPJmPzZbThbR0drU/YsAcpO4EvJW
 p3CEpImX
X-Proofpoint-GUID: tBo6zOHPhyAIVSgGFCXas_EzFF3nwF0t
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c857c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=XQU3RipaE_N5LczM4VUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: tBo6zOHPhyAIVSgGFCXas_EzFF3nwF0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 15, 2025 at 11:51:23AM -0400, Frank Li wrote:
> Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
> 12.1" WXGA (1280 x 800) LVDS TFT LCD panel.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: /panel: failed to match any schema with compatible: ['innolux,n133hse-ea1']
> arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /lvds0-panel: failed to match any schema with compatible: ['nlt,nl12880bc20-spwg-24']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - update commit message to show fix CHECK_DTBS warnings.
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 48344ce74a6e7..77a5d20a8b0d9 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -180,6 +180,8 @@ properties:
>        - innolux,g121xce-l01
>          # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
>        - innolux,g156hce-l01
> +        # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
> +      - innolux,n133hse-ea1

For the reference: https://lore.kernel.org/dri-devel/20200509111834.26335-3-srk@48.io/

>          # InnoLux 15.6" WXGA TFT LCD panel
>        - innolux,n156bge-l21
>          # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
> @@ -230,6 +232,8 @@ properties:
>        - netron-dy,e231732
>          # Newhaven Display International 480 x 272 TFT LCD panel
>        - newhaven,nhd-4.3-480272ef-atxl
> +        # NLT Technologies, Ltd. 12.1" WXGA (1280 x 800) LVDS TFT LCD panel
> +      - nlt,nl12880bc20-spwg-24

For the reference: https://lore.kernel.org/dri-devel/1507721021-28174-8-git-send-email-LW@KARO-electronics.de/

>          # NLT Technologies, Ltd. 15.6" WXGA (1366×768) LVDS TFT LCD panel
>        - nlt,nl13676bc25-03f
>          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
