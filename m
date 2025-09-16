Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CEB59363
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C1F10E7A3;
	Tue, 16 Sep 2025 10:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD6gwrt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6010E799
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:22:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA1PF9012281
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dsUOBXT5fPZdjovhyA0wRCif
 VQsPU7vYwfY5SFsZzbo=; b=oD6gwrt7ciUJllEv81O9W7uKYMyG/zXIQnn6C1OG
 cY40DALBKYR5oWNLzLIHdoRJaoio5HW2upCbuR9IQaVQB6FBE07CA7AL7JWS0xIP
 5FZM/24W6bQB4b6Qccb53Nmw0JxexMzmBSafkcOKvXaDOwJseDpFNb38qrvAtvtl
 6B3VwIAyPmIlsTBQU9StRYXs2ZcZoOcYtRWBPQppRv2KFGTeYelqvMYlfkXxWYRk
 vHFjJ/n2f5+dikPZdYooBZyeoZHas2qU8HU8V32XCGtjy3TzzDejvsLEidZnpUoE
 2wa9JQKkrNqLjLeZZX4orM6xbOo6pkkD4zRsoWBEZTP8WA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12m5gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:22:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7fc5584a2e5so1702533785a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758018164; x=1758622964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dsUOBXT5fPZdjovhyA0wRCifVQsPU7vYwfY5SFsZzbo=;
 b=JHdQJ6Ctrog5EqZiCKn/ClqnDXfvkiSM0/bt8NAYkHLoT+rluJdNV1OCQaeLBlS/qZ
 0rSvQAOkJGvMjPe6A4BDhPANdrpmLcsJCgKKgD6TFJkAY5I5K83KgasG9RL0x1s5Lou6
 AQ0ta5eWvh6hFHU5iZJOeLw8GAfzzwLv8RzhRuz9ywMTaWY1MqvxSM8NVnJk+RpNjLDb
 UWhkoyz6nwGz0YezAk3C95NHlE3CxR8kO2UKJXVgfMMginaVE2wyqxBtG10Who1Rv+6P
 w36hsA+OtuIrEh6LLUkU3d9yo/ACGwIQJ3bN4HDCeS0vQmC3LBOkQ+/MPH8LLnmu3MYE
 Av8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8q0QV+QvTaWfOrBCew9khCcTTOPSyg7OP2WhuBgZvsYzSnBCR1Cq0wEYWCWC//pklHQLzgqeg+80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ2NVjnE3D5pUYghse9zUMNWGwdMHaL1m4Msolq1sVIPBLdCL8
 /HQhDPWuaubasVnBHjT2ZGu8cluYPsoRH8W/z7pO3avoFkpGZYVirFrW9ZO0CtN8t4u5F9mhRq7
 1hpyFbYkZDjQUMr7nZZWviNfZmUntYB4aP9DNN882CJ1QJ7R5ru8Mr7l4QUNMvjGMxsc5W54=
X-Gm-Gg: ASbGncs4SerJB21muXxQ0En12qIeOOuwy9mn13xCD5VWQo9VQ7DaMKasNBgoun6N3C8
 ST+MmfO1jICsgGiMYKH+ETdT0tktR+M8lPxo/CSykLXdP6sAN1IO/Sv/Wb5dLXX3ncqOuCLpZUe
 1XhzRac1EWcVOQ+CcghUthHUczwWQxuASh7mIWv/SFlhVMx0zfJvakqcCd/Olek9wmnNpAvb/R/
 Ot8Wj3jFmOWUwCFzvAvNS837xukCg4pFo0vIhH4ZbzM6qUhH1g1W6Hr4MhtHnwtnmyMNI8c0F9P
 KmBaDcYY5XXJTaoNTRxiid7ljE0rdsFbJHyFmxE05AuoJDUP9e9syII8uKTsWU70/L2sCMuzZ/s
 L3+Pc2wz8eR6aXJBv3H4xPh0BtBT5/yK9M5PPpFqNRKorf7NVdUev
X-Received: by 2002:ac8:7d0f:0:b0:4ab:7f61:4339 with SMTP id
 d75a77b69052e-4b77d043018mr173775281cf.31.1758018163939; 
 Tue, 16 Sep 2025 03:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmt1N76y524zCMYAdzsEX4rsQJe+HhKzBcwZrhZwRUGHsN/sSmGe8IqeLhMm02zuV2vMtz1w==
X-Received: by 2002:ac8:7d0f:0:b0:4ab:7f61:4339 with SMTP id
 d75a77b69052e-4b77d043018mr173774961cf.31.1758018163402; 
 Tue, 16 Sep 2025 03:22:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a31cf5sm4237309e87.137.2025.09.16.03.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:22:42 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:22:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hiyq9lRqawd2gzTblTOAk9bJs7xV9SbU
X-Proofpoint-GUID: hiyq9lRqawd2gzTblTOAk9bJs7xV9SbU
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c93a75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hSxh5nLx1FgLBnIhuNEA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfXzERh4f6tWjBH
 /Q3mNhSIq3v6fF+3jV1ynUFDvqDcrz2a0v+z/1z2ISfEGEdGcvUemsEYca6ZO86wulnQGFqQA7u
 iXgKXk7SKzaeT3D7M0zu3nH5BQDBu7OkPvTj/WLn02U8ASt1m6iJztgn5mqEAUXtuJMxnRR75sD
 XZiecVaHgGg9hgtlraG14ADCSa2u0Xg8WTihx80ANXXFfRU+gGgslwt7yeN9eNZuePmO4zT0Xt0
 11zewYu+4mtcHFsWnVPQynBNZhzs62j6vYxbRIDjtGvAPk3Sux66anOM9eWc4Oomb3qpStB6IIx
 Hy97j5GueTodDgLXqIgmLxrSy2aQ8SLc/wn4dmLyVg1aO3ASu3o3OBQ+tQ590lhEOZnzwDgIMQc
 bnXXKdwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
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

On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
> for consistency with existing bindings and to ensure correct matching and
> future clarity.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> This series splits the SM6150 dp-controller definition from the
> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> 
> The devicetree modification for DisplayPort on SM6150 will be provided
> in a future patch.
> ---
> Changes in v2:
> - Update commit message and binding with fallback configuration. [Dmitry]
> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> +              - qcom,sm6150-dp


In the review to the previos iteration I think I was a bit explicit:
"qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
agree to it. Now you didn't implemet that. Why?

>                - qcom,sm7150-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
> 
> ---
> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
> 
> Best regards,
> -- 
> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
