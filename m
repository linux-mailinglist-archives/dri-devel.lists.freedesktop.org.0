Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE66C0D49B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 12:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2D310E07F;
	Mon, 27 Oct 2025 11:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3XNqeZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3363F10E07F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:52:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R7K7Yx2059558
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MBKzjZaWWFsbgsj3/CgK2NUT
 dutBHRTWeINDHOpYMbw=; b=J3XNqeZlhxkCJvGfLJNTlPaBfV9/CW2HtblJjmTw
 wRroR/5jC4L6SPeM6hu8dYCPr1YG1PXcthaPvEdK2Jo4qWv81iMEJj6NPj5fG+n3
 jdoYOH5HUR2Bh5T6y1joAqTgpaC2Fh1g/Gl3j/FIxQn+RM7vZI0rXXiWyxaln6f5
 8g35D0fOza4qFPToCFXn8QLjTnpjb+EpY25xi/g8/21RKwhhy6pk/ODcOG6WoCIA
 tTkUkE/QT0GgW64m+E2bhl/mlL62BRgFJLym3vufLyOiYHwfEMlgUNyjIVp4qNiF
 gELwQnCsr1HALvmHLuBcD51VX1h/0tj8VhDV4tLukeR+ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p8qy8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:52:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e892acc0b3so151284681cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 04:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761565947; x=1762170747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBKzjZaWWFsbgsj3/CgK2NUTdutBHRTWeINDHOpYMbw=;
 b=EImF0/SAaSDfg+SzrxDlxsouv+Ex0ebxng3RokkBgm06JNzYlItZkQ1Gthq5YjgdlE
 DiYKwzJamRTqyPJb1e8F4JUfUMLoXvoTyisvvJKSl7qukRu/wxgt3kQ2HEIMhvVWRC0H
 u8zMkmpxUlQ3Q3ia6M7ZYLLRhR5Z5qlIBrIxF/qfmAgE0+0+auLo2G6+gM5zoE2MTsSl
 3a4HlNKie6053MOLrTc796DCyLgSgPr9udlADzlSiB5pD/JXFz9xx+WmY3E9cqr5z/vA
 4O6Bglfc4o6CWMkn4P1gvXwt+OD/IMgMGObll/PIDlywoPPaFOtRCQOk6I25MawlI8cE
 xOVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzgNhXOZI3p7sn4EPX/lKsIhSWWuhYFKafiNO2Dv6pNtvyx+NMbq3oFyq9/niZWsOQ2YU+mnHx4MM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv9taDfSPmXjWm+xynsgVI7yxdSuuyibMoeX6Lfb23tctIpIAY
 FS9t+/lmMNvVwT7zNoUaL3fWF48rcN5PcdpaVsEkBvgv4fNe96CLT4+DMaCzN1gXv5AzcYdjrlK
 LyeUKZfMx8eqa3piOmtx3tzbiaRI6+MTh4/+TlS/X9BptBZ1WHyUroGgj7cSo0y99IYfv8gc=
X-Gm-Gg: ASbGnctyyoRf79zLgU2UDVytTgsRjjzIyg7xDO7Uz57wh/jdHWuB3gw1EheoF30IKcp
 8py/7y14lZQ3iKeXK+nbCb/MI+dCnqc/Vdk4d9uy00/89QQaoifu3NWjW545cHDolWc1CzDayYr
 woBhOkXlWSSeDvw0Mh0XvEs6Smx9yGZXH+TvCMLvlEE74R0d9d82OYC9Z/mjUlOE2bk1OznbfgN
 oIZAx+vxh/C/IKqfCxrAgm7xaVTCPlav9zwZ1MCwPR2oyMPwjPzJg0qW01nAIrlJvwpc2wIcXqO
 5MT6IYHu17oOl6EpnP+YPc3dKpObwb7/lQ3J1ntysWG8IMhWe4L1hc15t5aA6zJPLCnxU7Xfi6w
 qjtlafOGqvDSDsPO9FeYHq2JRxHSthuf6SBZGsD9Zlk4kMT1tFcTOe/PkOBdAFoZN20z1EJGbqK
 D0N3tzQOCYwNbr
X-Received: by 2002:a05:622a:1920:b0:4b7:a62d:ef6f with SMTP id
 d75a77b69052e-4e89d3a4691mr416787371cf.64.1761565947291; 
 Mon, 27 Oct 2025 04:52:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGavpCWYKjWaaA8w0dxfApMsNHDEaRffgbBB7gQqEAsTlkalhABoijtu8cBYGS8qrORyH9nbw==
X-Received: by 2002:a05:622a:1920:b0:4b7:a62d:ef6f with SMTP id
 d75a77b69052e-4e89d3a4691mr416786941cf.64.1761565946775; 
 Mon, 27 Oct 2025 04:52:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41c3csm2271056e87.15.2025.10.27.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:52:25 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:52:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
 <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
 <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
 <rkuihu3pmhexeahfch6j7bvwn5rn4ecccbhamluh7fas5qgaup@av2foeiwmcz3>
 <8a6861a0-f546-475b-907c-65b691d1d340@kernel.org>
 <cwuecyparlinhtdqckff7vdqpkio2kk7dwemzfao6qkhnuzhul@mfyqdphfvbdg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cwuecyparlinhtdqckff7vdqpkio2kk7dwemzfao6qkhnuzhul@mfyqdphfvbdg>
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff5cfc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=CcKo3yaoeUO6NfmZTnEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfXxlVf9qKk7SmQ
 wF8eVil3d4wCxHRSq2pPrJTX7BVWr1DleTX8zor8iiBdz6sJCuPoUGT6hdcoM746nXoDX0osboO
 Ndf3JW49Ceeqq3Yxk2l75zN/pZkpFMVlDSBW7CUPc4WICInJu1Lg8we6ShdeBixYfLShfYub+pe
 xuJ3YkxivrH5CAKw5uB2cx5YCQeuPztr549qJlF8hI05mvbeuqheHZ5VFKEqSogXjuYKbgT0lb4
 +CMbB/NoR+i6mI9SRyfRxsKens6eqoq9MERfO8l5OxiUC5vyDAVcv1yX4GJA7/HCWMa3qpSCGsS
 Eqbn4NQ8OMCoKTvk2IkCdpxVVZ6zJFMukHss85dBhWF0C9+W70BVYE6oEFEdP9SD/dEwd3uECsR
 D+Kz31oHJeReuveCKZ5805LIlrJZrA==
X-Proofpoint-ORIG-GUID: KKDLHYKHsFZMA761xODBadGbo9tmeq6r
X-Proofpoint-GUID: KKDLHYKHsFZMA761xODBadGbo9tmeq6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270111
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

On Wed, Oct 08, 2025 at 10:40:39PM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 07, 2025 at 03:43:56PM +0900, Krzysztof Kozlowski wrote:
> > On 27/09/2025 08:26, Dmitry Baryshkov wrote:
> > > On Fri, Sep 19, 2025 at 01:34:39PM +0900, Krzysztof Kozlowski wrote:
> > >> On 18/09/2025 13:14, Yongxing Mou wrote:
> > >>>
> > > process in other patchsets and in my understanding on how to describe
> > > the particular hardware block. The changes were reflected in the
> > > changelog. If you plan to review this patchset once you get back from
> > > your vacation, that's fine. If you don't plan to, I can ask Yongxing to
> > > send v20 just for that number.
> > 
> > Solution for me could be to ignore Qualcomm patches till they reach some
> > sort of maturity.
> > 
> > I am not planning to review this patch, because:
> > 1. I already reviewed it, so not really necessary, but even if I wanted:
> > 2. It is gone from my inbox...
> 
> So... Should it be resent to get it back to your inbox or should
> Yongxing just restore your tag on the grounds that the changes were not
> significant enough to drop it?

Granted the lack of response, Yongxing, please send the new iteration of
the patchset.

-- 
With best wishes
Dmitry
