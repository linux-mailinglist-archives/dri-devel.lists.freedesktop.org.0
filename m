Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718ECD2FD1
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 14:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B7710E01F;
	Sat, 20 Dec 2025 13:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="icc8dDOE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJ8ovLE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A0410E01F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 13:37:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBPoxK089284
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 13:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=onVr/ykTPBWcVxEDt3BDI+kt
 /cs0vi1mzT38qepZ9rU=; b=icc8dDOEwl6cht5OL0a3XpXioLWuZT4mCuKAVS6k
 6PHSyDQOsD1g+vKvzTMahzUBvLg3HHZ6sDJ9c9mDnrwuezCbqH8PW6r9jLxPqFwM
 Uy1H0JsJ/hH574xb1A9xiGg6Jb2K5Z+Wy2oDFUX61b41XSBpjI0872spNHCwc0O4
 lkw6GvUo/KtdTVdyaE87bUQ2ON9OYe+l10jMUP+squBxcR+eBrTK22vbTvx2Dw7t
 nrg1fbe2yfyXtK6nICOGyH8QcKt01yIZc9EvNbKdasipwve0GPNzwP5d9Bg6paDk
 JXI9vY/9R8lZxQg+r/V7pcbx9O8nyKzs06AAdkSHGdpT3g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mra8prq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 13:37:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8823f4666abso63318186d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 05:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766237831; x=1766842631;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=onVr/ykTPBWcVxEDt3BDI+kt/cs0vi1mzT38qepZ9rU=;
 b=kJ8ovLE4VIsFKWBH/HwrLtGlFEsDh/Drvt0JbPlVKO5U7MLppHTMiNBfvP5gKvQX1t
 dYbKsaA9nGuVCRsrAm9uUbqJXQdSfnk5wzS3NBAh9+2o1Zw44rKXj00OXZO/WbdKRZgX
 LdRdErId6giSWJedyQv9hH8buq8NVg9wvVdXcJz8eS4OJ8Hpcp2sIP1hgvT77IdCaoGL
 PX6E8DqFeSckJ95JZw4Nzt97dZfYR45OoXltagckbUYzQ3C9SwyMa3ufU3OfY6kZWiBt
 mGhDwRYQZp86Bljk+6H+pzOdv/QcG0MYtnW/tcTH/V3A3nkMhWqrFsxrO5H6DjEgwb3J
 2RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766237831; x=1766842631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onVr/ykTPBWcVxEDt3BDI+kt/cs0vi1mzT38qepZ9rU=;
 b=LzzNemG5SG3KYUf5//0Dg7c7zOxEFnzSOjjVJBIkg7s1EGe9/VZYrKQMnOQxmF7POa
 YvhNGVjM13JIR9aUxH4FH4TtAa3EqCFt6E6UhAO0UTFo9iKYkN4TV3ZP94i6E1Oz6qs+
 h9uL1wAc8AJuRZmII9syikpXlmogIPPE2oQNWuEUwaYC9kLWfsdj9wxDJdBDEgDSHNy8
 yjnSYx8J5EKd73+Bq0D6rfRaeJIxv2sFxxyrzy9jO+P+C+MpMP3imlZrxXuwdDh7bryt
 eolSEFad0ApuE6U5FEKYpa1xaxtwubCn+yLCfxRtaadN+Y0cfdSNERg5ko/OD8nShEAL
 v42g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLHSzDEbO4A/ciZs+mZEP5O0p/o8I5kJdYxR3yQDH3hsPSFDLvdKak8tkVeI7Yyieoqqz9r81NzUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmFNzQ0Gf0VNG3tREDowReGrwt8XvsOPgKE/6LVv8pU7twgdaB
 NmQi/17Wy1tpvS8v102iZwhRnBNwsNtXX/WfVj8PqBRZN6/WM5Ptwt6yaY0uImK/4JECMcyFrTg
 A+NUbTrGFRmrhEl9fH75/fyukhfH4milBGl4+hRZ/5gBC7chHKv7pI12wU7k7bFL4XS8Bnuo=
X-Gm-Gg: AY/fxX7YAdN7N/BwFYvLQKrl0mlDAZXeioHez0z3kEeGVwM3fzcRvgIxDlBvKd/OwdU
 sVkw+ZSuLernW8tsNvUE5DOXfDo+hmnenpriKMc1ZCuB+I6JI4J421q/cm/miwDBtvHMF2U15nN
 7SdLunrdwZq8coNznSQauxhYkeijUL+BOSRr+QTi53f1tZutkS39MlOg6sQn9naJ885LyLeDttp
 jtstv3ZI6h/dSfnXp5Nus8mAAEjhjpbLGxVFHfJtGQrZKsW0rs3zwBKP20w3n+tWtosc7/gUpK2
 UmYhNGITm9XGbnQCkZuIPJKAGbW9fNJHrJXUaoQJBEeqLbpcdg9us3s8IdbJI1F7SiKClEhvSC1
 NWIjyWLwcJOSIYWSYawktGukwxm4QjyFTK/uSEUhUjLy/Z6uwthkKiK9K/+DmERg7ZkIMiumu5t
 PMoEpeKmwrNlwEEqhxdhM5YdA=
X-Received: by 2002:ad4:54c3:0:b0:888:7bac:7a1a with SMTP id
 6a1803df08f44-88d8369ea81mr71771356d6.32.1766237831409; 
 Sat, 20 Dec 2025 05:37:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoJmhc0j1QSHWpqeB1INPb1LxQclfOysI5mjmJBEqKXoqG/hNFTCz3XTo6pOZ9BO/LtyeplA==
X-Received: by 2002:ad4:54c3:0:b0:888:7bac:7a1a with SMTP id
 6a1803df08f44-88d8369ea81mr71770916d6.32.1766237830925; 
 Sat, 20 Dec 2025 05:37:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618d64sm1485257e87.49.2025.12.20.05.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 05:37:10 -0800 (PST)
Date: Sat, 20 Dec 2025 15:37:08 +0200
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
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 ps8830 retimers
Message-ID: <ia3f22isuxflakbyphrpsbobvxgmbrr6rwysh7nasqmvwt4h2m@t2x3f3fmbghh>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
 <20251220-asus_usbc_dp-v3-1-5e244d420d0f@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-asus_usbc_dp-v3-1-5e244d420d0f@hotmail.com>
X-Proofpoint-ORIG-GUID: Ube6aYnp7gWiLF3TLcJjz7PoFf7RjcUs
X-Proofpoint-GUID: Ube6aYnp7gWiLF3TLcJjz7PoFf7RjcUs
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6946a688 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=A7QAhaETn3pxQinkG5gA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDExNiBTYWx0ZWRfX4gQMjQ3alG2w
 PXuJzteHErHaKxW33r3bVSn/OP0x4hMWXA4sezbSZENmmZlv96YUIAJbQiveGYx4uOtEDvJQJ24
 Gm9I0s3q7e4GvA/c07dCOZT9MNMAywG9M1C/ZYiZMk98i0JyT3D4BDFT2awHwRwGR0tcZ1BNVVv
 5FS3DWQHkjCFLlZ8uFBBb+eG8X59pWlrsKbEjXCJ9ZCFRnFt7bvm9q2O+VOSwwF0x7J96tKsJhq
 QTf3DLL5XphUIA98/iKjOxtgq/t4jvGwx2Mi5vUBSr+teBQOQWxZvOrazCPk/zE9tt7EYNXoH/r
 mqKdNOPVbq6o0nvQjCJ4Wcopzc6YXWs58F/S5GYPY1cs6xk3kBhCgaj6oxIGi5+DqNfFtnzeMBQ
 adqtbeAIxNVyo8/mTXSo46y7lro4cQjSBvXzzyebJqMEEm0xmWEI4IZosrEyrEMSLLtT9i4RXcj
 TAnVcC3G0yoHS0Y0QHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200116
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

On Sat, Dec 20, 2025 at 12:38:57PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 has two usb type c ports on the left side, these
> use parade ps8830 retimers like the others, enable them to also enable
> dp altmode
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 310 ++++++++++++++++++++-
>  1 file changed, 302 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
