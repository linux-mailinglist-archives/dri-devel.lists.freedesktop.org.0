Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CDBA2F667
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 19:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F610E5DF;
	Mon, 10 Feb 2025 18:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZ8VZDR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EC810E5DE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:06:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AANcKM013667
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vsjL/2KQY+Tev80gGOdQzFfbqYML6F7kNzyKYY9Wvfw=; b=IZ8VZDR0CIuH+dBG
 IW5QDMs0sSSLlyg3ckN1hgm5l19f7ipfAdDgFGD34EfKqyleqLXH7dGl3bZSXw0U
 Ll/CbvSVZQEPJq1ALTj4ylk58ww3uIikws0fxnubaZb982CIdJmipo5HEMXYkH3Z
 h2aUOoH/kMBQ8hpFhB/XdqPDVDd9hm//2P6qrISnyRHGyzk3G2tp2FAuwDsmV5mA
 cF4C/1JE5phAS8Iyle+c/HIOGb0GRd1SM0God3vmH3nOE2MBhvmDfVCWXAo4pPzw
 v2UHe701mDGamnq5vVYNDCdQkBFVGytBOSP9Smi0ryares2PWKd1+qSaAuBtVqej
 vG/QXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyn690-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 18:06:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e45cd4145bso3909996d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739210776; x=1739815576;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vsjL/2KQY+Tev80gGOdQzFfbqYML6F7kNzyKYY9Wvfw=;
 b=KFakZPXCZ+X7xfj8NZDj/JzMy/ICpuZbrOheIa28u/urilnEXNd4OfalmnMBxHnUKX
 WGFKlWsouXmOEAll05BOfZZkZuVnxaX6Z/Xcil83HcsmIMBkGHeQyHgHo73QrpFmd1LJ
 Zl4lR3YKMoGlZU93t8KwUy0wX7Tw4qnBw1JxdDYiWsjrpEBswlem++j7oPCS0wqkm+vV
 VUypxXtI69kokBjJB30ybTKwS01pmoXEwEM2/zKIFLB5JsrW/b1CicXQfSBv7A9AG841
 1nIJbgddM16xOIxLFWPJmh19aQVznBLeQbIfCqdYKCtkYkCXVFjwbhEgYmWklcXuuUxi
 mCZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP0IfdsXlH5vdSRZqiG8sYr0T3koUBwXhjL5hjtpicTR5dxSJwkQR8Cnc8eSDF6MPxh5uvZ+/NZIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz8p5DDkWMb3ze75APiU9IOmJLMvD6t7g3ojXb2/nRAML04npL
 3oCxlfrWLSgJa7lz0is+ATUDQUQig7gdDX+M/cmjRhGYHNUXXz6lqy8/RsF/MncJD2wsa0thyYk
 d7ykkKrkFIkMNmIfn91ZGqUsrp0sPoWk1vmaxASPfyVhsGvOSAlq1RSGS+/WVlYL2G28=
X-Gm-Gg: ASbGncsFzjG+O63GSM1Tsub7gwhF3OZWBLVOR97/Tne8H+fdnJmwKjKVi6BnO2345bp
 HB8skrk69JsTqax81T4XFVDU66lqkso5XpK5+z0JlFc5eVDE8YepcBf2A8CH/vjqYBJzovt7Kya
 iax+lPl4EolAdrGxyDbhjoCwTld1Fze3So4Fhv/KV2novDCG3mWtCm6j42MrY9b/rwcF5vMKA0R
 P7Bis1Wu+mI3xRAzqZBQ+f/Tzdh6sSHaortEq0lTu0ByqDcJKw9w5qCbq0jukdxv3ceKtBU5dhm
 +FcKqiaQMXvoNoF28xAApo22vtmBckTSI6HwdfqcKnx14y+5YaghotQ0EuE=
X-Received: by 2002:a05:622a:58cd:b0:471:8bb2:ed1c with SMTP id
 d75a77b69052e-4718bb2ee8dmr38878591cf.1.1739210776178; 
 Mon, 10 Feb 2025 10:06:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQImmhmYCSQ+3nx9vW9Eev/sQYH6OwLcUExc6r6y7vYhFCtuQNRA2EBYx0mjRH4bAXUukGjA==
X-Received: by 2002:a05:622a:58cd:b0:471:8bb2:ed1c with SMTP id
 d75a77b69052e-4718bb2ee8dmr38878371cf.1.1739210775838; 
 Mon, 10 Feb 2025 10:06:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7d7f0a47dsm35109166b.31.2025.02.10.10.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 10:06:15 -0800 (PST)
Message-ID: <c21d1ea2-9116-4e7d-a1d6-2717d0e772bf@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:06:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD
 GPIO
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-16-6224568ed87f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uNl3Psm2lI5hlLbSPy-7XPZmA07-sPiZ
X-Proofpoint-GUID: uNl3Psm2lI5hlLbSPy-7XPZmA07-sPiZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=754
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100147
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

On 9.02.2025 6:05 AM, Dmitry Baryshkov wrote:
> There is no need to specify separate HPD gpio for the HDMI block. Use
> built-in HPD in order to detect if the monitor is plugged or not.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
