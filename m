Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8D6CD3301
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 17:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724AF10E065;
	Sat, 20 Dec 2025 16:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="isXmb/JW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUbMuzy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9861810E065
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:03:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKFr6hi4177959
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nEe/G3RZ+2mNhyGb/G1hjG3b
 iVKdP1NzTBrwas1MgEA=; b=isXmb/JW3s2npdBibjmnjnCfDvDYEWpsS1KCaBxt
 OZwRwpcc69hB03fast7eSKaGqL/SuwTgpYkG29Ov5bSVGEOZSsuS3Rol4+vsPq4/
 b2dGqQ7UkV1IcPaR1BB1NjldA2YDEA23JlfqrEzhINZkFw83NReV5kSy0qy++iDo
 XGSVZZEYp1HWN6pLW0JvZubKwITYfnMwxbY+SV66FvMb+YqBScyzleY/mOe49Aj+
 /eKAOODRCjCRIV68ZmGA+dFDgWPYDRJSe0vHPZn1VhXhOrKlq9w+zm7NDtZadvsv
 2Cpd98i1cl2RrGciVdVcZ6+Wi2Zrrg0OGwyKr3x+1OIZDA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrwrx68-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:03:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a39993e5fso63785056d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 08:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766246586; x=1766851386;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nEe/G3RZ+2mNhyGb/G1hjG3biVKdP1NzTBrwas1MgEA=;
 b=cUbMuzy7E731CE6KdOT0kQQbaj4mlxfw0ZcN04T6qSyvKDsVcGPO2motw+8J0KA+xC
 1pNcsARMCHz97MvMTS6cSalXpH7xTDJugEoHY9r4X01nP4js6H5X52rOj3HgCb9NHJt1
 SGf6iGZsDItMVL0pxXaI1RMSQxdjWVOlMrpCNlXpJ2IeXHFOsTaIl5THv0BVgNwOFVTC
 tH41zwn+a6TKK+TOBye8NDRkIWWrE3o6b206yaQ29d5gDGl24Lo07Y4me1U3Xb9O249l
 97IAlvQfxz5KCKf9d1CmfV95WcF+uq9VnY6QamlVIoGEhSDCJm9k6CG5a0neO7xUrVm1
 zulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766246586; x=1766851386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nEe/G3RZ+2mNhyGb/G1hjG3biVKdP1NzTBrwas1MgEA=;
 b=hc0kxDfeU1y+HumJFp1y+s6DTT5YdP06O+/RDTZA71R0/fNumu38IKkHGYyBkF7yn2
 27g9Ixxn3U/Kt1SV/zP45zvbkgICvmG5KaYdJPci6hx6nwfEBDaqYBldts15XuiJWcjr
 EwexcQwLj9g1EmZ0z8XCyNu65RUIsnqPE57gyTZy/1LwfStB76Fwf1Z9hzYpBvAj5QzZ
 vHWPjo8vaX13umnyCHunnH1ZU6QCVMW62bxIlbU9optr5GLXPyJ5stXVijZbbJFIfwFZ
 tG/i6Rud2Yybf3y7srEYtQ6ApU9eAUkqzvKT69Do0tert4wBu9BVoDZ7Va7ynj5uBA/O
 eZLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtOEsOItYY2auz8np+EZt58sK2r9ug6TS0gpYryQyJRWmBQhSNIhMDDXEC8l5Cwnk7alxf2Za+l24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1hSDPIml3Ivjtjis+XffrUsd7DjFxpVPffCSPuNjATGnIktaM
 trOaAZ9OJlASIDhCL9/+306nUKqS7kfL/Lned3QA0K2eSg5PY/o0SYdXHRx2fxKYrYaDF2+D5Ea
 x1mUXJ6QA0G/Z8yBlzTXeyGOL+659OiXI19bB3r8Sow2kGQj6RuUZFsGbcL/8/R6lfd282WQ=
X-Gm-Gg: AY/fxX5Q4jEtJMimAB4/fsi+6YLeMqFPGt95KjZPOhBSraeY02WYscRxR2RLxn3kd4I
 2vG4QH1Z92sdQL3fNmEWgv23Yb5ZFEJ5f9w88m5r3ur2KjuqlIVnsncS6UnWiPugT5El+Bx76Xs
 wZny+usqbZ1+kMqUPVbj4qTJ2S8bwaUCk2KatOQ5bbzFsH/ssqVM4/Dhd5bAUrBDMwmAPWhEHK2
 y9JzppCY2kdzjN6Gdyp/mmiF/a80vLmJWC8q86cQnpRAHDTpFXyrhX2nwD1r/yplREelir5koxV
 BNSH7mq3FNmS7DLPxiBBosZyLpQibIKox+KBBb4ONABtBLZtwEow4JyxPS1+e7fF8kL94inTvGt
 vzRbB6/40dHeT9QXF9sbkQRzk8PqrC/2v+lmKUw+Gr+71+AbhDVOIDYCDbfpVILaNK1PTmdei4m
 Mmg69Y4yUizyNzMv0dyKEDgc4=
X-Received: by 2002:a05:6214:3f8f:b0:882:3f45:c819 with SMTP id
 6a1803df08f44-88d86960f48mr103830276d6.53.1766246585774; 
 Sat, 20 Dec 2025 08:03:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSevMYpZwQbwXFYn8G7B/YELQOrg2fZ39XC7g8Q5HD92V1itWIz5rn1u0pqyZfwMhTLY677g==
X-Received: by 2002:a05:6214:3f8f:b0:882:3f45:c819 with SMTP id
 6a1803df08f44-88d86960f48mr103829506d6.53.1766246585153; 
 Sat, 20 Dec 2025 08:03:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f4e4sm1578227e87.83.2025.12.20.08.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:03:04 -0800 (PST)
Date: Sat, 20 Dec 2025 18:03:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI
 port
Message-ID: <tdloe6zcjf6fj2unm3lxhgsgewwctxjyv7sxzvmfpqnhpnorm3@4jf7x7febu7v>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
 <20251220-asus_usbc_dp-v3-2-5e244d420d0f@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-asus_usbc_dp-v3-2-5e244d420d0f@hotmail.com>
X-Proofpoint-GUID: L9ty0l4p7fUsiyIr6eL6H8ITSasIMC5G
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6946c8ba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=Bm6uNJzs0lXfCfon9C4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEzOSBTYWx0ZWRfX3SWkCyeiTe+n
 el8yxmo6rYwPswJ4sM86xHYkCHvztHUy+DtcwGCNvuJZ4ptJkYFYfsvNJOA7c6xTn7nTQg5ndAG
 hz0q7rr22zn3pY1EH0AM8/5VHMPHhSzA9OzVvncwBr2ulbIY35JTn7g9Ua1/XlmhCVKHQXyWUn9
 mEKfPgYv70eu/5V8dTRGSEjgkHWJAhebR0frOlfS/ENqTmaS4PVWOL6Uq4kuQ2JRXnp5b+jNVld
 t+JtEhRIvlrcf0IbuHgBFMbyVa2V/InMiM2LvJbKJFykQo9Yhke941tK9m/H4Vnui/1mDM1Fhed
 5/hBJYIwWLGvU5qElDO/2kJheQr8Qr0QVXwRbRPy4Yt88KaUzeKBQpW3a+NKkDCfs8CVJzUES+M
 mjgOYwKg4lLzEn7dSNZTEcp2pMYOeiH9+SZcwpCNIriHBtDa9KT5GPCLuNLzmx7jl9xLN0G5BKF
 ZmJjpluJULBNXDpSm/w==
X-Proofpoint-ORIG-GUID: L9ty0l4p7fUsiyIr6eL6H8ITSasIMC5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200139
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

On Sat, Dec 20, 2025 at 12:38:58PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable the HDMI port on left side of the laptop.
> 
> The display signal is routed through a simple Displayport to HDMI
> bridge.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
