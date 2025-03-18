Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B5EA673DB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79610E479;
	Tue, 18 Mar 2025 12:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUyifBEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F3F10E477
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:26:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8wek6005980
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fn6o9sruIXfwvCI8WMCUouk1
 Y9QTIiAVEqwCsNznX/A=; b=KUyifBEdxAy+bNjktmMLxn1q0cz885B8NnY82uZV
 BXPTBeBzaz+rjyOpCifm8s04bgwGhH6WFTRw031xNMOkFSKCqeivFf/hXTnAECC8
 JCYrzC0pzigFX2h1ZhI3NaZP+ALy0/o+xN7zXMwPzFkpJXpn24todpgOz9XTsHA7
 b5ILmsHdrOVkqjh8ZTf/XfqiytLlM+tvqLqJTGsZHSxIMmeh5xIhHEqykGtP+k9v
 sqCfqI+xO46ERt9zeG2tN9FxJ0/XBrAQp/dcQaKr5WBQYZP2x1UUHmTBAdI3ObQj
 BE6RB5aO7zh4oJtZQGCAjPgpq0d2inE5ox0J7bPeYJ9bqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbtah8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:26:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4765f7bbe1bso96400801cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 05:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300810; x=1742905610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fn6o9sruIXfwvCI8WMCUouk1Y9QTIiAVEqwCsNznX/A=;
 b=QDI0CiJDVu3HCA0rWlh7RJPlsZQslboUP8llGSZIAg4PoZX7RSQ98TkN6nVgOuLEw1
 kBoWYn/sVF9GoRcSe8g0mqzYMuOWk47kurslI9p5myKw4Lq1gj2VmzBDiIGl7Cj9qf26
 RLGSITNQQMQgS6T/EolRAJ9hn2Zg/vv5asEgD6MnYlOlPzFrkd1jQHRZz+DsWR1vcmzU
 erw1KvztKZsddtg+lzqenqtUB1CCq8PzznlpCkhtdX5GSB3qPAQVErEy2eBTsfeOje33
 +9O7LDYxoDmLjOrTTIRIUVlS0aZJzOu6/6Ls73Re8qqcijQqGEm6bMGjtZgDwBzmUliH
 WMkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU05ROFfDUdcJ/GCLIaDgcznmGXQkhXUorcYoUR0wySnbAY/FEqT7aZnYhUyAU6wowJll8XG8Bt78c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEVdfcId9d7UfBW1aFNhjiwc7voSGFNVIVuMrWaQBnDcKh7/Jp
 1SV0VKqQXwiMBt/Y5IX/xTm5JLPvcFRjTwq7Vvx01dcAg+YD0sP2o9feJLMQv08gF8M1dyskBcs
 6B+oenxa9UutgN5azjHRhhekyZ/ueJfIna8EiEInQx2mPhP0iJnEAUSyhdOEIO06+wL0=
X-Gm-Gg: ASbGncs12WB5ts0yEPeVXMiV2UK/mFzDTRF+LoSf+eMt+waYEZ/4MHQFhE3/qtq+HMW
 vaZlN06Jjv+1KVxFomJGkEtU//zuufWuCbrynQO2t0+ENv2beo82AtOcZFk8f9pd6Vz/DUzUAo+
 Rweegb8qLitZkIeiq1B35b5FZYzV8vZOiJNb/CpmLxEHO5U4qHEtPtX4ByXJPYd/rENp2eOy69Z
 qSPf9weqa1QXOhwfQ7oSUHdaZXo0ypdYhKKd2jv1tqloqpZOu3U8mc7/9euxuMS3cf3v+tfMxGB
 zxoBXnhdGG3djEhz0y0o6VhyxGTUydndVR3Rp/IrwdrbeBTmGDhgy6VkaSzLPw71n2ufdYGLvq5
 BUlA=
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id
 d75a77b69052e-476c814a05emr237383491cf.16.1742300810276; 
 Tue, 18 Mar 2025 05:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcR9xUHBK9TFXZWSwLWT2FsKGFofnO2SkdyZ7fM94gEY42uE07dGuuS4gCqZY8gVYIkurgsg==
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id
 d75a77b69052e-476c814a05emr237382801cf.16.1742300809924; 
 Tue, 18 Mar 2025 05:26:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7bee7fsm1638070e87.54.2025.03.18.05.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:26:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
Message-ID: <p4hda4puovabvqnf3unge2rifzu37hgim2k4fnvdpbekhojzq5@cx7j4hrspzdy>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
 <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VwpdDJux8lFTqVSUQ1YxxYtMUqHEQRBe
X-Proofpoint-GUID: VwpdDJux8lFTqVSUQ1YxxYtMUqHEQRBe
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d9668b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=q9XyVQKgEbIbea8yYzIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=524 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092
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

On Tue, Mar 18, 2025 at 01:13:23PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > Use new SoC-specific compatible to the SPS SIC in addition to the
> > "syscon" compatible and rename the node to follow the purpose of it.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -402,8 +402,8 @@ saw3_vreg: regulator {
> >  			};
> >  		};
> >  
> > -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> > -			compatible = "syscon";
> > +		sps_sic_non_secure: interrupt-controller@12100000 {
> 
> The register that the consumer of this points to doesn't seem to exist..

It does, although it is marked as reserved. And this matches msm-3.4:

                .smsm_int.out_bit_pos =  1,
                .smsm_int.out_base = (void __iomem *)MSM_SIC_NON_SECURE_BASE,
                .smsm_int.out_offset = 0x4094,

#define MSM_SIC_NON_SECURE_BASE IOMEM(0xFA600000)
#define MSM_SIC_NON_SECURE_PHYS 0x12100000
#define MSM_SIC_NON_SECURE_SIZE SZ_64K

I don't think anybody tried bringing up dsps on APQ8064 though.

-- 
With best wishes
Dmitry
