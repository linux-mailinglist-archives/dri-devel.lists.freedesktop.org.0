Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D977AC3019
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 17:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B6110E087;
	Sat, 24 May 2025 15:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bF9sn1Ne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E200710E087
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 15:21:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OBdIH5020754
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 15:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nMycBBOQkD6yGLEg4dkgiJz5
 jZsjA/1T0M1HIP25/Us=; b=bF9sn1Ne8KEfOqmWubGcKSmj9OQgwJKoqu/LQbDB
 dRwW+3nnWo/zijqRaiwh69xBREtO/+TNIv4goKwhSU2jAv8XcSOqonCGnHaVsIVJ
 Q+DrfaM+tM56RFQQu10KYgtrqLpUneVOSu6rmv8fVABIqI3IDLxOKnjIJj3u4ypb
 jvjqVXAob54c/GRhV3vAvxWADr+WAhHVu6hHRetguoBsDD9VMtWKyIZ/wxHk28VR
 dBkOsiX+3OdQvplCm386PXL7m6wrTvchTs1kZqV1RxbDP0TAZEpzX5pnZsNQVEwM
 I0DMM5sNfNUMdJfSkM2hP7MfpMg1KimLP1lRAfakQE2yiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8rrsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 15:21:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8d8f77d4fso14075686d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 08:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748100109; x=1748704909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMycBBOQkD6yGLEg4dkgiJz5jZsjA/1T0M1HIP25/Us=;
 b=PViLk4CDmDJjOWlu38zc8fAI6JSBTDRNNtkDYoDB3L2ph7O/WnXpu1Ag6PdLVEYhCR
 2JGZnD2u5Z3Gi8XHKhTa7cf1Ya3zv5SAmu+uh8Qpiki5GDUmCjPArODRT5UPuI4eulDL
 f0cFzUpnMDQmUtEt3w6Vw1ffyErrubxXZ8arjBKOXwIpFXbMQS/zz26pXquZfenj9pjK
 6xMtt3ZvdFmOH/dck1GcPm34lvB38+XIr49QnfHG9yBBxVBRDV/GJxGw4S9f5OLfrsQS
 iFhw4Bf8oA3umADhnLZQaEUqgh0sNxpy+6JrjGBKH6tIsBlpCOpmfssixvzpL6wmY7Yh
 ymAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGNDry6ZxpFrmjni7JE4OYGVA7mDTSop5kCYf5led4hoPS6jQweOXJKUqg+44h2Naxz7V2p+2bg6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ08QqqwupEVL6dpvTdZQJVOKfvfg0xAnwjpw4WvgBu+24q0/+
 JTVMJ7pHxuunyWzQW4ONqzL3V+Dxp5b4BSvS7lIUp/IymVl2+yaVf38A/TfkTRQS/MVqFobwSF1
 vDdIOjukYChos3yon+h/VNsdBXayCFIGl2A8nMLnp1lRIuu2zuKk0+wJOKJ/NPfZBG8TX2bE=
X-Gm-Gg: ASbGnctXZm0a9plyzhQZcoX3pFH9674gKXM+T9RmPVsUSubVlLJzdWERnmbPj6nH1I3
 wufCdTYZl63HD9WL3vFUNs2kZUFZpp8pOJd/Cc4j/pwt8gfhF7YT7yE6Vrn00KOwEoSx8kPjos7
 q/7PpS6AMxgMQjv8xcdGRpCek8tNgcQmognkJkrR7FoB2zKtimtEP88vZ7IqORRrOGudwmNKLoW
 +I5PCn9+sgGC5EIiZhV22iFcJ3TklGe9oYO32srxnT9o0TgN80ugpvATH4+lAiY5VhKoE6D3IHl
 pzmRbV7kngTaBdhIyMg6rHG0W9bG+S/fe2n1TGosTOMYtWG0kijbjCmtK2NyHh/CnW4il3t59w0
 =
X-Received: by 2002:a0c:f10f:0:b0:6fa:a0ac:8d5b with SMTP id
 6a1803df08f44-6faa0ac906dmr20503996d6.3.1748100109259; 
 Sat, 24 May 2025 08:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Pn2GzOxsJUXYoGR0GlXygQmdCVrUA/w4oZdQ/mWB8Ob79GsyWPh6gfazt5HkB8buuEfwjA==
X-Received: by 2002:a0c:f10f:0:b0:6fa:a0ac:8d5b with SMTP id
 6a1803df08f44-6faa0ac906dmr20503726d6.3.1748100108878; 
 Sat, 24 May 2025 08:21:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702f462sm4369553e87.209.2025.05.24.08.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 08:21:47 -0700 (PDT)
Date: Sat, 24 May 2025 18:21:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 3/5] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Message-ID: <mhgbarjaql2h3tknjem2sia6zpkkbswcriw4k7shjcz3sh4ylr@tsgig42plqob>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-3-2c1e6018d3f0@oldschoolsolutions.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v4-3-2c1e6018d3f0@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6831e40e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=z0tmLejc3Eo1JMKNyZQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: yjo1LBlivqXOCNvugL7BVOuAkGtMQFx7
X-Proofpoint-GUID: yjo1LBlivqXOCNvugL7BVOuAkGtMQFx7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDEzOSBTYWx0ZWRfX6O8Fg2ajHCf/
 VckgYjMPtIOEsgdayk0+Q2uQndpomjAhKmo5c9464lwxovwsQ9dIlN28/JzlauHPQ/HkTo79JuP
 rt3tS89thy5QUu9/0qPs3GFT77Ti2sqI3RXPqZ/cW6WbsCSED/usJ5vVLWXnCBcUQ8UJN/sUAA0
 e1QLDLRtA4pgZzW8LJQV7gvRKxvSEQqUsK3tBvxEfVdLDQgG+HpjrryV0D6jgO/qbJXaaXuBPN3
 xWICQfLHNWSKeHF+joKKimpCNnqdAhbLK6V9+NVdAO+heRNzOhYuu05tHLBlGg4hynRGHQHlnnT
 4GdA/SJBxCFvF6VSZPYa69nhmdrGhGGuYyMDMY6I9m3Nu9QP1iWfz9EnM/90aKFJ5en5BH+ySZp
 M22v1oK6YzW6ffucOZYEPGpVw+h0FxZLZR8YZ5nDMcQApR7Y9vREhUmYpsEfWG5WU7yFQg2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240139
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

On Sat, May 24, 2025 at 01:48:38PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
> usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
> to be controlled for PM.
> 
> Add the support for this device for the power supply.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 2 ++
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 1048e3912068ced166c76838cf7306d86e192fe4..17b1f345b6b65bf25e68e77b0a345936825e1d04 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -569,6 +569,7 @@ static struct platform_driver onboard_dev_driver = {
>  #define VENDOR_ID_TI		0x0451
>  #define VENDOR_ID_VIA		0x2109
>  #define VENDOR_ID_XMOS		0x20B1
> +#define VENDOR_ID_BISON		0x5986

The list seems sorted alphabetically. Please follow the lead.

>  
>  /*
>   * Returns the onboard_dev platform device that is associated with the USB
> @@ -677,6 +678,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
> +	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */

This one too.

>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index e017b8e22f936be66da73789abb4f620e6af4d6a..816d9ce71eaddc7ab0cb4517558dd44a591d6c28 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -115,6 +115,13 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
>  	.is_hub = false,
>  };
>  
> +static const struct onboard_dev_pdata bison_intcamera_data = {
> +	.reset_us = 1000,
> +	.num_supplies = 1,
> +	.supply_names = { "vdd" },
> +	.is_hub = false,
> +};
> +
>  static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
>  	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
> @@ -144,6 +151,7 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
>  	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
>  	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
> +	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },

And these two.

>  	{}
>  };
>  
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry
