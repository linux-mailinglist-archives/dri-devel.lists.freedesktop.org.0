Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A201FBE556F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F7310E34D;
	Thu, 16 Oct 2025 20:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HY3ukzu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4166110E34D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:13:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GFqmU9016853
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BVqwkBK7C+4usBpdqeZOce1X
 iXkyQyUXbdkjEjS/bvA=; b=HY3ukzu+mNfhq+d/Pav+sgGVuIBjQ2C0Xa5fFe4m
 RoVC2bd+U7S7UezPZ+2AeaAstaYXsDQM0yhWD8nM3fxwMhGP+nb6zOrYt4PNrjaU
 pLYvuQqICD6pu6gLAajfBAX41NUM9t6yrlBTHWdLs5cCyo6PbYrCWurmgInHZRdB
 ThVV6saOvhr1g3uzrrYXu2hsi0j4zbiTkDgby0JX6GbojHGsMxNTAvw+2U+uezM1
 oM4Pz0mgkR3/gkBtyJFMTs2FeX7Kwgi/wk6cP4UhzS1TVF358V4+P2R+xR6RmeA0
 2eQf8/JcjdyAqfUngA4CUyPqLWZctf2TGVWvXkpYEq/Y5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtek5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:13:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88f3c733d98so453853185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760645616; x=1761250416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVqwkBK7C+4usBpdqeZOce1XiXkyQyUXbdkjEjS/bvA=;
 b=qRarhOmPlOzXWVQk4sV/11V2lQgIIe/Z/8Af//XDgktxGfrMD2wkSKi/zSEpxsPr+D
 8o7FkkC7UZhTlgK6uC+XOzebf4yz331bcT+VcBhr1HD+5C311PfmVTo9JwPCG0O2IrRe
 ZdPPwpYFsuNWp6Ts8pEI0+zCwaRSK5mHNVtf1pTF2WYSCXdTuevlS49BaQ5hQp/FVGMX
 sHEkFmN1KTEDdx+4k+6QrvHnYxWGI1QjHt79i5m7jVKelPu/5ZBgIauWV09hiCQF2Ask
 0yiIr6rf+a3SX31nli9spJNC+9Hca6WGg6fNpTXPlE1xFEiKNa4wJry1Ofae718sp7Wy
 W0+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQdkjGh1KuPn35Iz0zfMB+8YTWFMpPSVV6LFS599gZja81U+XQCF0F5bk3C4kbjsfIcfa0xR9ySSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFNnJ49X6Ptru/WdYg6CmlIvN6vKXhANAwPdSH/vfk8VRC375s
 r+ywWJaKFtn+4qtXb9nlpRE4kAzpivjlAOx+afHayQeDaX9TSlsEkb4pcDcriDx5PH0HS+Gza24
 jFASkZcQTSpEJaqe35pvb6TXdbhy9ZXLrlnf3VHYvKUkW2M7I2+Yznhx4s3AwHRFpYPhUndA=
X-Gm-Gg: ASbGnculuWCMEVjt0zZa90XDwrYzjJRus4P2NVVAkTLX388ndY1NV7h6Qb92ukOHqbd
 hF/hduQRqUjS9RLRedHWX9q6sRd7SawgPr/0FNiDRZb3I1kXRXjL89x6vQ75rEtluTrfNKibNvx
 tfoZPloljTJDcA6b+vRTbP6w2gpq4ZOwejW1ByclQxy2cahFKmbX5D5pg6DZ92Rs9V5KGY0Np7z
 uOFGBVLG7fSa7j/mmbVhJkCgPvEbXhDuNu3LN7Mam6+FkwqceCY141rZTtJj2D2kS4t44gC6LG8
 KbzNzzXi+oJ2RRsaM0iaaAC2bEuxAjE6+SEo/82hEiEh0lQKf71CkTDFMoK0X+w7KlHAuc+9Nqv
 DUrEtOfJQ9Y07ohRc/mV4VDHpQ2RznROt2dWxnRYuPCN1hOZ7rn6+vY09/kvUDgsb16FEUDVHyO
 ewvi4UyUro3N8=
X-Received: by 2002:ac8:5790:0:b0:4d5:eedd:688d with SMTP id
 d75a77b69052e-4e890fdfa5amr71048581cf.30.1760645616398; 
 Thu, 16 Oct 2025 13:13:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxGdezOd1qF+LssL/Y7iPaJQpkE4Smw0fe36efmwylumTn5FP8jrXp4xfot/RsukELYTcXfw==
X-Received: by 2002:ac8:5790:0:b0:4d5:eedd:688d with SMTP id
 d75a77b69052e-4e890fdfa5amr71048241cf.30.1760645615972; 
 Thu, 16 Oct 2025 13:13:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088563a48sm7309026e87.83.2025.10.16.13.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 13:13:35 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:13:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sdm845-oneplus: Implement panel
 sleep pinctrl
Message-ID: <f5guyszcggcjnsp52uwexw3gfbcb5vakpydcr2g5blpblsgg44@qzx23rn6ycco>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-6-ce0f3566b903@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-6-ce0f3566b903@ixit.cz>
X-Proofpoint-ORIG-GUID: u5p-FQOIeiMhnt9xGCdxvAJRkosNt-3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX0UcpBG7Rh1vL
 5f2GgUtgl0+AZMkxAyi+aPKp2xXC33KVLajLDnpaW8oaV5ZBIy5/8b6jfqm57oKwk1gxXVlgo9A
 7W6e2Iv0DzrwxymYDU9N8cnV+iQdbyvsro2fGJNOpOQ/2tCLstqRLGJ1OvwDXcPbMuUq4avEhAq
 YOHZyUHKiN8oEZXAt2kS216aL2Abu2kWTqluJ+fqi/TpU70ijDwASgEWsyGNW74J9an/vuN607m
 d5siIRTK9atlSJJ91nIKAlF2ingw9ontw0M+9AN+MChfPWDzGVqvP1tfrTsELCgI3Q1DPtoXZFu
 ytmRNfxUF9whdK0Vx80W+fM371jBX0O4PlBj3iGg5FOvtojErsorhI5/BgDc0d1yBN2//AwEPBu
 /IVzjMSzfA4SfkIpWxF6gMo/JvvWCw==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f151f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WaRAvzN972V7znxJzTQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: u5p-FQOIeiMhnt9xGCdxvAJRkosNt-3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
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

On Thu, Oct 16, 2025 at 06:17:01PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We can DSI pin from 8mA to 2mA while suspend, do it.
> 
> In theory, should give us extra 2 hours of idle battery life.
> 
> cosmetic: sort pinctrl properties.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
