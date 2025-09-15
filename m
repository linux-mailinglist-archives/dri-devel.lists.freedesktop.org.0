Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9BB56DB0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD68C10E271;
	Mon, 15 Sep 2025 01:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxpcoiT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA5E10E271
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:00:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E9OUAr004205
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yqfHnDEOnUdvEnKTky9oFQEnKcCdVMPVRKAhxqjE5l8=; b=OxpcoiT4hM+IRFi7
 bb6Fi9SXD6Seu0hGf8gqbpPvTbnhR54ccyNBLgEsGN2kWQ5TGy0FycY9D6j72HiT
 XaUYOypQsYYOd6GGFeOwSA7FOKDquOE7AlC9hsIIya92+yHZeXpDQ8uT9xvP835g
 1DQZFTx3qYU3qgZ+c71zKGHp5zXX+W1EhpDQiRzyGZryZPO6HCE8NccvHxD5HUL0
 b1/dnyyekBkzFiz8cPfdR36xJnJl3x50U/l/25TrGIJLOB4DqFGk8zP92G90DgwV
 LgIMd/vvxCrmokP/GpyYtKjezPwJbVq2k4yh6FUK60WxUAXp5kCN6ohpZMqlBaPQ
 mfCJ2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma32ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:00:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5fb1f057fso53100101cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757898028; x=1758502828;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqfHnDEOnUdvEnKTky9oFQEnKcCdVMPVRKAhxqjE5l8=;
 b=W8q7F8Kk1p3WKuvBLYu1FpxEooBGukoAf6+Bz+TFtsBL+ZnOUIohHvz1p3XEDG2ZRK
 HuOHoccYosbXz8ZTU/NoPnZvgN5/4+/6uPBLS/q4KwezzQnvi3MvKSFkviiwJLG1euWM
 c2gakzEycFzGfLB7ExWeE+G0IypE8mwxZPxImkxQOeuDj2dwLFbtuC6SOyF1TkaexegS
 AkfaLUzzyHNP5k4kjfcrP8cnn3CpOQaflQ6Ufl+LRUssDQj7iZAf1OFHwi2exNg1hHFd
 HXSso+PN8Fxa1Ogtndvtg8JHLkEoRJd/xXgoPDJKQJyEWsSTHWijSiaaoVMEotxGtfrf
 lWuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQFqwDZ2BUr2/fOZ3yM+3TKiEP/94TyVA5aj2wwwOtTyFASMwujZPQlqL+BKWRd1doZkBiGGYidxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5NDKbWjNMLZVjkp48NWUYhFW19KxYdRQmLcj4rGzpuulTeoEJ
 nvclp7aEB6bg1cWydOa3DfFv8EoPkZ1GEMU1Us2YmUM6kNRT9QGwYdsy+wYIc3bW0RvhcuR8d6Y
 2yuWMJfRGUygJuxfF049Afr8aOHsPRRftHz4EyrFBlJm4cN9fuvXLTbciACGivUZgpSLpJV0=
X-Gm-Gg: ASbGncvki6YX5AFo5W1ufhT0IY7aBr0wrO6450DctDdBj9IDQbkgpVk+gvBd1CmMYWW
 0wX8MqC72swL1/qhaOLo3KwKOWViF67AukAVpM6cdcoTQPfqPAigDKY38J9iQLv603M+LWEW4ip
 ZPCNoEnNEae0cwIbE3zPDSO8Adi9bySWWCrw4n40b46ok/kY+Jc8r4YAaYvsCcoqN1yB3o2mD1H
 ZPCoCTOGM3Em/5zyCBoUfFDOXQIvWQvQGxCLcxbuxd2LOHAkEKGpQwUNHsshvUnC6R9AcY4080n
 2J0tD/zJvLUMUt31r975DKFu1uv4Sp8bXQk/u7xLK14KRkdBHJnbpKVt7mChuc/7GeyTpYSUmXA
 BX2jRGMuJsIQtPgpyX/Zm1tdlW6rcFootlxsdLzj5JljeOTMkFvCR
X-Received: by 2002:a05:622a:15d4:b0:4b4:9062:69a4 with SMTP id
 d75a77b69052e-4b77d018f7cmr125417801cf.35.1757898027827; 
 Sun, 14 Sep 2025 18:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQoKXTfHUZm4ewMDtxrD3cLgoJBG5H4zVtX42N1as3HFiF8AaH1mekFLSfDZC/KfKVIHKxMQ==
X-Received: by 2002:a05:622a:15d4:b0:4b4:9062:69a4 with SMTP id
 d75a77b69052e-4b77d018f7cmr125417221cf.35.1757898027212; 
 Sun, 14 Sep 2025 18:00:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b628bsm3230962e87.15.2025.09.14.18.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:00:25 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:00:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: Add innolux,
 n133hse-ea1 and nlt, nl12880bc20-spwg-24
Message-ID: <ufmwjrlnaq6tucfpqishzvdpgsxartxgohjrgyr4eccahb5jrc@5ausrm3osivb>
References: <20250912185159.1118209-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912185159.1118209-1-Frank.Li@nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX4VtqjFloUyGv
 FW3fltQwS+jmz3h22wS1wMbEmm2O0cCWOSbEHVKPbisdsHx3EUkdy6uQkVFR5uuNmEr/NWG5SSV
 bQf2AyyhcuqImx9QRRGPOp8DdndlpeShfNDs2KBvskiebz2IDU/bbo8XO+uh31GzHd3nMwYYiIz
 BTKfKZZd7YBRQOXq9TKAYfr1gQI9zXq67c6t4OOPRRE5j4ecqUDC6Lt8NJSuM6N00HvxmbyvKJj
 fnDeu42NfjFD8hZUuXUfw3A3tU7Pa1ieca7+7SdOW5WB9hRFqZ+lITTd+RdK6AntNfGZo0uB8Zx
 9VJqdFzWVYM+IB40IHf3aTdvzm7duaIloaOkLH0WFhGO8c3/40FDhXg37kzTdoaekC+Udnfv5F6
 8ZIXBpGU
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c7652c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=CqteVLWsAxVuTjZik0AA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: psInUGfUNqlFH2oeek1ztmSb90CHIslv
X-Proofpoint-GUID: psInUGfUNqlFH2oeek1ztmSb90CHIslv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
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

On Fri, Sep 12, 2025 at 02:51:59PM -0400, Frank Li wrote:
> Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
> 12.1" WXGA (1280 x 800) LVDS TFT LCD panel.
> 

And no driver bits?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 48344ce74a6e7..742ec6033b724 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -180,6 +180,8 @@ properties:
>        - innolux,g121xce-l01
>          # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
>        - innolux,g156hce-l01
> +        # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
> +      - innolux,n133hse-ea1
>          # InnoLux 15.6" WXGA TFT LCD panel
>        - innolux,n156bge-l21
>          # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
> @@ -230,6 +232,8 @@ properties:
>        - netron-dy,e231732
>          # Newhaven Display International 480 x 272 TFT LCD panel
>        - newhaven,nhd-4.3-480272ef-atxl
> +        # NLT Technologies, Ltd. 12.1" WXGA (1280 x 800O LVDS TFT LCD panel
> +      - nlt,nl12880bc20-spwg-24
>          # NLT Technologies, Ltd. 15.6" WXGA (1366×768) LVDS TFT LCD panel
>        - nlt,nl13676bc25-03f
>          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
