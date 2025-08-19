Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2170DB2B5E2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 03:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3391510E09B;
	Tue, 19 Aug 2025 01:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="btW3Q6Go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9121210E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:24:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IFAKoA022741
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dmdLF4KW1eFiICY+4ZeOl5FJ
 qXEjQMPENqtFLrW0CqU=; b=btW3Q6GoCg5RsaGSRldv98B0HsbjVBVTgfsPp9lO
 atXtSb7ME1pwAmfsFHA392o3miHbw/orstXDeEUvPL9wc3pEWqBocgA8Mu7wn3/M
 6dQ4mcwann4i6W801aROI6foxVnltb3pbEuLjijVr410ukaKAaWeHaOoCbshORU3
 n2uy+Jzu2itm5ziGYc6UkdTA3yUOlD11KakeSt2XqfbVrZ2WgCY4AxnZ+eCz4Li7
 M6mL+SZZi6crjOBaNGlau2WOtV5HD21MzhTa4zUjQRgiZTQM1qBsdprwuim46jfy
 BBbT3RXbcVarW0Np7O/hj5EOlFjD0UAZa56SHnNMbBCdww==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtewhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:24:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a8b32a6e3so97371766d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755566650; x=1756171450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmdLF4KW1eFiICY+4ZeOl5FJqXEjQMPENqtFLrW0CqU=;
 b=foMgoUUTMzqTzXqeF5P5o1U34BQFkQofBWQD2Ati5p4No3Y5V9I1HWmP2iFPi2gQMr
 Zt8ONF95vyAKc05Lo7KyifDhoaKWrhezJ7HC23Z/NFhr7xzL4JAWdgSgYfMuyn390JXf
 EiV6+b+xIRQ6fl7w8CX0+S19nQmOVi2IWqpogEPMCY6dKj3hWfWKyj5wdwPKfaygGJ53
 yVuQtwuxVt+xviwdanYdxDbzEa+q7hsRNm9KLKGwxK9QlQFdPu4jn4LJWH+ktviEbmvm
 xYGSHwB1MOoveKEt5lf9xD+wPfwlucnxp/9TJkCRHVTPRh3cc0j3JeFkuuUW8A6946gX
 1PkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL/OD/qtimLsXLH0ejOH7zpiVNBOHuyRszDHYDsr2GHvboU5nxQWk5DmJEFnYuW7oga9+KgTytu/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjVfkWGBBC1SUhAWkMqwtSf57qnUWCMXXyhrwUORF+pCppSpYF
 IrCw4Un9ncS9qX+ge662nGSyPtX0k34+UUozE1vhpRx9i6knkYc8lf0bJfFfc3szkWvwNYzW+c9
 DcPXuKJJ1Lne6xPpqA4G0UA1CS//PBGWOezSw6FQfni6XwZyfije+Lt1tFNYC01Mz8wkghMw=
X-Gm-Gg: ASbGncsldIlc3awiEjSeeal+iuTkjHKZoyTVgJMvraCj2QFuXEBgqEfoZff8MMgK4LV
 ShEjUWz8FIU56w1fk9I/2rTFhg0HeQz1F4o20TXJ/7v1Reh69MSiHH9jTA/dxRgS4aAG2ORBits
 XjXW7U9h96YWKh+6S6fZAJy/S6QRWJtaU9htJSfrtFxzaLPsNpPEPcQwzwFJP67RUJv4rpYU+/Q
 x6QC9CAWEUYZCPLF61P4r+gFpTbtBeJJg8Njc/tceH3kjE2sgxnQP1ULsm7n72NQSpoGceFOHcW
 FNxB2+JPxILobieHNf/FDzKJY+fAOrHuHkklB5kEvMZkqrmprTYIF+MR+t6VzTgAEzN0HgDtLds
 o634sKKqS5SWyx1Plv3Bwc0KJlquJVkVKV2h6R2fichvONbcG7S3J
X-Received: by 2002:ad4:5c88:0:b0:709:b92d:e84 with SMTP id
 6a1803df08f44-70c35b748d0mr9519666d6.16.1755566649700; 
 Mon, 18 Aug 2025 18:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGMoeyP+XpKHjrRDIijE6EvbuuoJlGOgnOnsy2Ba3WttV2NVri7TEuVqrOX54DMtuIZmLoDQ==
X-Received: by 2002:ad4:5c88:0:b0:709:b92d:e84 with SMTP id
 6a1803df08f44-70c35b748d0mr9519306d6.16.1755566649212; 
 Mon, 18 Aug 2025 18:24:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351579sm1871216e87.4.2025.08.18.18.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:24:08 -0700 (PDT)
Date: Tue, 19 Aug 2025 04:24:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, s-jain1@ti.com, devarsht@ti.com,
 u-kumar1@ti.com
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
Message-ID: <td7d5mldzdunb4sxs5rxa4tfnvvpolcmpwurcv5ubn47whnqek@azedwe6h3y5r>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818154746.1373656-2-h-shenoy@ti.com>
X-Proofpoint-ORIG-GUID: Hi1Yj1vLs2avEe_fUzvKC67p3W-rzHoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX3YMbwe9hh1n6
 ZV/RwiNpg70XEdnqD9RAAmO9z28NTG8vL7uFkFXm8RcEwDphZ04tauzU8eFCLpenFaS63Jn+6H0
 +T3X2CRJhVZ2mPK4SM7wt8CrENDYnfMVitdoWJGDP95mWIv9fPktb0SbFRZps++gS0hj5dJoneZ
 CwCjbpRY08XlybkCPxWX3T55oLTEqF1i4x1hutgB+X6t+WgzLEzcTSfFTxVXYWPRhTF+bvPRELs
 dnCuppewTplJARJ9DMYdI5h2GZ6ZBTb3vygmDgyzyWgiJOa0LzObQ7bnpZfj6V3cBKhB6ZoBtgV
 EowI4HCs7j6uMEc9MYPvQypIJ3m102Umk3wRKCvJrtkqNWVn9eu9hK8hUA7K7YmfREed6zLE2dw
 wnxd8p91
X-Proofpoint-GUID: Hi1Yj1vLs2avEe_fUzvKC67p3W-rzHoV
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a3d23b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=RF00TdSWAAAA:8 a=sozttTNsAAAA:8 a=YApXqb8GNPtt5Rl-DmUA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=_nx8FpPT0le-2JWwMI5O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On Mon, Aug 18, 2025 at 09:17:44PM +0530, Harikrishna Shenoy wrote:
> Add RPi DSI panel[0] as a valid compatible for simple-panel.
> 
> [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> 
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 1ac1f0219079..65f486f2bc9d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -268,6 +268,8 @@ properties:
>        - rocktech,rk070er9427
>          # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
>        - rocktech,rk043fn48h
> +        # Raspberry, 7" dsi panel
> +      - rpi,7inch-dsi

It's powertip,ph800480t013-idf02

>          # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
>        - samsung,ltl101al01
>          # Samsung Electronics 10.1" WSVGA TFT LCD panel
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
