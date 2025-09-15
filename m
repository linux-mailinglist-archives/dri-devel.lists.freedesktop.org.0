Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14580B5702F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 08:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61110E2B7;
	Mon, 15 Sep 2025 06:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSQ7m4bJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BDE10E2B7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 06:26:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EKZlTM031237
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 06:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p3cqF/An1AZjw8JVOz9xUECjqoR0vI9WU1IXWZyL7Ro=; b=aSQ7m4bJjFzNFsE9
 VSYPcz4xcmtaJlDYhC2EqGRUm5ndV0GtZ5ZBeFj1LG8f21dM4HFUVcP/Qazs4L45
 XQxVIPundh+0tP7/APebYUPMFWTcQxN9OVcP1byjVF1P5Uh8pRvGWO7EUqQxkE0N
 pT/lfc/eZPD91lpJhu5PqogW9Ekn8y2aszHjn8LEVB1C4Xf8eGX1j4d6LCX9fDty
 NFDaIUaSlsixlxtqVNaCN/c0k4rS9pH6tcKJgMdDT/49vF7p/a+BvSarI08jOi/O
 2mww+i6wAEfLN9bvaRDrLHZG/EhSq/ICZPPgbGmCXUhw/pgg1rA35kABR+uRmVN3
 M75Hjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv3s6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 06:26:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4fb9dfc94cso959834a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 23:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757917583; x=1758522383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p3cqF/An1AZjw8JVOz9xUECjqoR0vI9WU1IXWZyL7Ro=;
 b=b+3sAiytY1U+IrYbN5ODGoUYx7oKxL5x0LqqayIbeXkF24uepnYw2U0fbLefcDCWRr
 zEGcxpTW3hnAn6Z8i7eSU8utl8a1BL0ZWq7N8gA7HaCXSoAVFuEhp/ZhrY9DH7ha0/rl
 WrVjQVpnXApu6aCddNB6wK80p+2xBVdwH79FHXJBTTr80CVFR2eMvyCM94w6AGHcpkTI
 TO3ZtuDSyRmMg6QU19ukPggQWUwwrBIfNZBhHbr8E75G2EMa4UZ5YmGGJOAiPJHFtdce
 2woR5prY84Q5SOqGeBulq/jArNXaFD5ATYl30V2Dr1JofFQVZCl+ZUPosQNEAp62d8wK
 2LWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCiweqvvNxiBI4jIVpYUuqzgfeRiNeFiyNiYPOXz/zQLg2ExYHDDbJpbcsFfFWoj0YEcUCu1PWZSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrRi8PJZa0qgQ5h93imEliPwVCZYegwT3A0VVP8v79L9Dv2NDv
 vet/RnJqaUTMOmd62w1D10FNVEAIGCJ98g9R6fGbUZPgOde0D5x+pUle6KhP4ARk+I8h2TJ0iEo
 a82HAeWxnsY2pmal5YzLZ0PcAUBQg4LQiHp/slIPPLwrqyYvZDTZprPAdcVA4QFV/bEk1ag4=
X-Gm-Gg: ASbGncsFEJy7HPL0/MLoDUBR6AQKcU1iL9zVODooM4XAa6H3gljDDBj+mN3W1JsWJIT
 aP3ilyQRNo/btJRBKACdK5PR9oESbswybK90orDZuqKSJj2cAS7ElFAU2D86Ai4Favfh598GyRR
 dvA2y4LQpmMXW4WdN/39Cy6K6C7jGhE6sVkWcY7O7KLfKQqFjScCHiJAyqtj2K8yb5HvA548gvd
 QSd/8pCUnbohQURjEEdxDnbLiErEbkEntLEATuAdh3iSvOfVFgM0IWvzUrjajVZ2FA9E18XlSU8
 jyk/rGo62dCWmwBnFtXt994vt2Bm4NLbjQrYpYULjgB//IKc1LT4L7JRvr6TqHQvpZ1QbuWQAHx
 BNsttA2Ut+aLPwZhazjqM3VCl4VKWeuTbb1U=
X-Received: by 2002:a05:6a00:a96:b0:774:2286:361 with SMTP id
 d2e1a72fcca58-77612060f79mr6738235b3a.1.1757917583119; 
 Sun, 14 Sep 2025 23:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnsuQAVbn2atzfG9WWx0sSeaLKGnzB1+E9spf7myo63WZ+ZUpm7ftykU++CRXawOnpXfnInw==
X-Received: by 2002:a05:6a00:a96:b0:774:2286:361 with SMTP id
 d2e1a72fcca58-77612060f79mr6738214b3a.1.1757917582644; 
 Sun, 14 Sep 2025 23:26:22 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607b347f8sm12075678b3a.82.2025.09.14.23.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 23:26:22 -0700 (PDT)
Message-ID: <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 14:26:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c7b190 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=olEU9l-643s81VMgE3sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: OktBVnv6obxu2ACli0Ppg_i2mR2ELXSi
X-Proofpoint-GUID: OktBVnv6obxu2ACli0Ppg_i2mR2ELXSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfXxtgMrgG8vEv7
 dIT5/6LCdgQei9hurpsKBHXcnXrWIprCjZ9W7W1/V9tYj89zpd6a4rnh6n5QqCXIO7Ioa7vT8/Y
 THlx1q8WB3V6Rb27rP/sqZJZGXCKTrv7KabAMXEnsBBjzvPQO6ewYxfD4rJOCAvIQbGrjwxvbQL
 4VnsYQQV2plEM4j1djEcn9FnbjTl6hTXEYxjF0GB8UKysJxtrK1UWM+cTlenp4f5E+Bjdcwv3tb
 M2OPn1GAmVHa3QzvmkHEZ8zCyUdX2MWYEfKYv+s/+e5e7wzWkROkrjFaC/HwmIbql/vTttO9OjM
 EW8FNB6vRlQ3FPo+vm0vhosQgKuSrgKFppimAWm34LheS8uvVoiZvKCxsvWFUicwiko1I5nOTMz
 ghsFwleO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017
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


On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>>>> potential issues if SM8350 support evolves in the future.
>>> The controller is exactly the same as the one present on SM8150. HBR3 is
>>> a property of the PHY.
>>
>> Ok, will update commit msg.
> Please red my response again. What does it says to you wrt bindings?
>

Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
previously familiar with how fallback compatibility is defined in the
bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
fine to drop the driver patch ([2/2])?

Here’s the updated commit message for [1/2], does it match your expectation?
'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
compatible to sm8350-dp for consistency with existing bindings and to ensure
correct matching and future clarity.'

Thanks again for your guidance.

