Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF2B53309
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F87710EB23;
	Thu, 11 Sep 2025 13:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VS3/UwzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48F710EB23
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAjLh5026270
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=020/RT6M8DeqQ4FFLCQkWPxS
 sOM8wzuUhGEMVMCrtzI=; b=VS3/UwzJ4nickQEaH5W6omM0qT27Bne6pWdxtKvY
 kva9j9VxgRpFn3uQn34RfmeypiurpoZPuM4p0SkcaDMU4DzvL7o2Drdm1nVzjeiJ
 w88hamHlP+heFznlo51J2bXy/PZllEaiU9ZAo5E6ejCQqbPxw98E3aSjyrgZxshh
 CcYCwNKOktm9ln+zF0vZluDiGFko6m7v/UjLrIKfaodCN68zRCbMZg4uLrTnFo/2
 kfs1sB1z7EERQyIQtEO5OElUl2SfXEnGAY5VH0ZW00ipKDOZS7kppLlHjd80kOHw
 qGDGPXe6Nrx5U8lj+iLF+ghDo9tYIrzCRQBupCRMvTbAng==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h2pru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:02:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-53b17534b75so910484e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595735; x=1758200535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=020/RT6M8DeqQ4FFLCQkWPxSsOM8wzuUhGEMVMCrtzI=;
 b=gFOei+xhF2oMpHxfM6JM0d4UaI/46bMwbCgKWed+AS/e6+jcYUL/YiwrTHMvGxzr2A
 fD3kJlVgrrShae95sb/jZU95JV9FnppQ26ivIPri0BRlTVM57LvkPLGMJh7rltNB5zsl
 OFeVLd6R3lX9S9r9qXem+16/Lht59F+kjhjODLlHq7B9KlZvhBYrcDSsb36sHv51TNz5
 xCJC4QUdoKtA9O72xkByah3X2WdvvBuioDlw8c1BqqcxjyWd5jePthWoD9qehNQ98yjF
 QdTm3Yeajm8SUJE5+fH85qt3JP9DcxKLeRlOAOiS6TlS+bhJsoBVAbS68HayiDjC0eyJ
 GzJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG0B25hfVdKevpZ0W7E/cNrsoQoBwzGizdRJE8OoUy3o3uD+EIEH0DmLLfv6pDy2KDUC2OP0Zc2Iw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbjgucRcYjStBeMFTmoaV5n/9uJJw5GujhWQoJ9dDjlzNKW1bI
 IcxklcFzTK+ljmGFYbkT0HDex+FPdxTNEwaAknFISlzYmv+ODek1/Me4mnc0JJdvpsy6eRFmQB1
 6/+fV86PmC0dk5SurBjdaR6/36MOEo5yWSJYrOdeX8JkzmoeIa0USLJxT6j84bQ545okwcJA=
X-Gm-Gg: ASbGncu/krTEIwA+zEKcIVEAMgW4WsxWq70hpJOccqVsNzIS5S8vSYXvBd9UDaXBjwx
 aVy6OUCKjqOno6s/dgsfwf5v80Ppf3UhJxDUYQanxEDz4oG3/u8gK5pYMMsbVyIkDIA+CmrQBqA
 enVzVy3qDFgFbwU71uEMXAHa+u2XuXg8kv4HdqAkui4g5VSQS5MU+Wqt1pr5u1hMhwJmSOjHQ9v
 mryx7vGzkKWiDmVCnBLymeNfP9pvJ9kJGwHu2y4JWCkbm1MCdg4rsEBxRsArqQpX57cvr2SuL4F
 JFkFfWQI9EPcAmX0VQGEW9XRe5Eyi/8k1/pmRznm3cpIFC3JRK/sBzPVJp1tvb68EWnHKHawPux
 zLe4sEa+mMMIi3v8qUTxdUJLs8MKWo3MhJhNu6mk9UDdRDerso3eR
X-Received: by 2002:a05:6122:d02:b0:545:d9d2:a832 with SMTP id
 71dfb90a1353d-5472aeed8f7mr6420468e0c.7.1757595711823; 
 Thu, 11 Sep 2025 06:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfU5T4Be/8d1NB+n++SlGmSCbRAol8EPaMIXQXmGdUJfhc5omkFmwE++S+Snmx64VOIIOiNQ==
X-Received: by 2002:a05:6122:d02:b0:545:d9d2:a832 with SMTP id
 71dfb90a1353d-5472aeed8f7mr6417135e0c.7.1757595692924; 
 Thu, 11 Sep 2025 06:01:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a32f66sm398785e87.138.2025.09.11.06.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:01:31 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:01:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
X-Proofpoint-ORIG-GUID: sIzSPPQYHx5lt6so0rsSiViOqwYzy9s-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX3skXk56Nl2Ln
 L5fOkH7dHEStPbqdSI1m9UtcgpyK5CEjP11Kv5A2DedUD0Ci+nw9XcV8+XB/whI3ceL7FSpQGnF
 aqN5LHd1V4BZ4hrGlqE++qlwOFGyQ4E5k9rt2ykSUO48r6DRbfgaKlT/YE0c32MLcLZ1cIXfmHj
 sv7TJb9rGM4eQzaSTJY1ehuArKqEZaVBiXgmvXn8nr1am6nvo5j5PQd9PLQqehT1rDTCxMKnJv+
 jhadQlBlRaIH6xGtHBb855HKhAq4fLfSAMyTluYtMyP+E4PQIyWMUhH8pZq4vCnrSROT5pDjlhZ
 7FMTK2zJAEF5dtgmTYx91NSjgV7nKIYiAwhKPYTZGh5MeJ7rrA7qAM1puT1br+JexYKCywQCzZR
 BYAACpyF
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c2c858 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=yi07AWGtMeMy8SJ1qNsA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sIzSPPQYHx5lt6so0rsSiViOqwYzy9s-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> There are 4 controllers and their base addresses and layouts differ,
> therefore being incompatible with all previous platforms.

... and it's a new core revision.

BTW: any additional clocks or regions for DP?

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

-- 
With best wishes
Dmitry
