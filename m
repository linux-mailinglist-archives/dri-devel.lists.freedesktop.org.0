Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61545CDAEEC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 01:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C210E2DE;
	Wed, 24 Dec 2025 00:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpN6maSq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/sAwqRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFB910E2E8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 00:37:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNLQ25b700995
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 00:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/YAOKhWKH3N+K9qVaMcFeCT/
 m/bw8c2nGx7bTrdKtjQ=; b=NpN6maSqHBF7RVEmVtfCqYcla8mfWT8tuuhwSGex
 5xH78XHdLEQclnttiOQMthgjVM2u23agcnF7foPWo+YGF8Oi8j0nAH2vQSO53+lv
 5Ma/MndSB8xU9Fg/xKM5T8QIIUdU+kEIAXzVJvqTghra6zePSNUlNUbrBhsxTTyZ
 z59Y9ZO8Jn8taN3CV7yQtilK53YEN1s/yUD4BJ0D27HxY/AnSfoq0M1ccHGuLT3J
 LGKJqfOU2vdH0fUJCXeJF2q85TZ+9LRnHUhtBAN/aw5rMu2grSZPJ9SbnSqHMQl8
 tV9sVvKyELEQnpVoLOBblPsI8Qz9NkNc9s5ZZu2nYIhtaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jt43j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 00:37:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed7591799eso132657321cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 16:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766536661; x=1767141461;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/YAOKhWKH3N+K9qVaMcFeCT/m/bw8c2nGx7bTrdKtjQ=;
 b=C/sAwqRuPLeHUSxStsdvM1in4AF1m14Y1Iw5RzYedDf33zOrpgroDRFB75sjcE3IpV
 j3Z+m/uLcsb1FnkRecQSuRhyVQtddqL444zVps6/PgUiJOkDoM17dVZcQY5RYQmMHfDb
 N7WLB801czbPs7ANLpygTQ3fwhWVQugL1Pat2sBHZQOVeSMTggwfap1Som79Nwj+oUi0
 USKtjDTPZNwjYXdxqwkKyJ0Iovr5HK2CTPFYASLvCNXIy/iunLeJ6SJm30RVoZ3Jd7Y7
 Y30npTTVZwx8i0BMb3xftljbfhg4nmvsR2cH2Sn18H8DL0Qf+3h4z3JWPcxDgzlr/2fM
 10IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766536661; x=1767141461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YAOKhWKH3N+K9qVaMcFeCT/m/bw8c2nGx7bTrdKtjQ=;
 b=rXspokrzu6cDi2pXdACxo3MvjNmHU1rYvMNbMao29931Ygsrlx11F+vAWSqECTDYW3
 U4vVn5AZL69uIVwA0IfbleDcTUE6lTkw8+VfTtG0sMoEHsd4b8tJsP46Q2oDaA6Bzs2D
 k1iGmgM3kIK5CIDYVVkGDU4AXM58Xn11dGKElPyam7tda8SHup04vFgaxwnOyoLhODEd
 b2Wk78ki+Qw9MEMiL4BoNjmv7OfpY8I3cVV2z5PvcHJyVKbvPBhjLfqjbmI0uHZeUE1D
 eomqDXZlti+Dpu8BWyOv637GQKiC5yWu8azZnvu9GDmyI6Ztw+dpykuAOyN3s16Cn1yP
 WmDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjk8tIumLO1IePVIgCrf0xm6RUfZsHmJWKAlF55RRIzFgYW3nCQ9JV8V8PxZkzF11hY0kNYW/P52M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAylYnwoeI42q1arg+6G39H3fDH+1O5Rmhdf5QwSoIcbFUqTo8
 EDw4ymT8ORUZIEdyZkJ8Uzy0fCQHtSTp2SY9pADxC4chtxuuppkSbLhKgQnFi+DkfIWJRu8PjHg
 yKuAq4K7X8fLnFkpH8AXA/QSKRToOnUsIdHcPRxnX1n1N+NCLJOLIjo7l+VEXl7UZ8KHPwx4=
X-Gm-Gg: AY/fxX4wQPa4cMsMSvoe6qLTzhe5R9sCWOANyCkx+vi2gvkpzulThuW6Of0DBO7vIcl
 rk08hTKXsTqH26cMHNC9OVvOWjSE8RLQIYALlxx6X5WMZ4UVPi0SCIGKgpuDfIxgcqP5vr8nvNY
 id8YiVgBsywwAkCi5xUgwK8yuLh/bTIACkXVynZzzBxJi3y49yZa4ilrBTRtB0IAqcfADMaMP68
 5mDYDbjqyuN86hTJYBncYvLdKCC5hopxedXzNXNLHYvPE/rGwxRI2XH6qHTH1cOyw/O6i1wP08X
 G7Iu8dCQbyT8obMi9m43F9jWiJfLTwPjSOZtGnVtWwBNKCwjwZ2G4pTOm4QNk8maP16LkCeW8AK
 6ljQ+iI1pUCW3QiiZq4Biu6ooBFPH+PufCrwjT/EgX3fmtYtOMEWp0ZPkSSAi/bxZX+d2Y9IFcs
 HlYjC/YVyQtqezGOKmtbhpwS4=
X-Received: by 2002:a05:622a:418d:b0:4ee:275c:28d7 with SMTP id
 d75a77b69052e-4f4abdd6345mr233834401cf.75.1766536660494; 
 Tue, 23 Dec 2025 16:37:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQYqcQ8RAiUkM6fn5wm/C8SIkuv5CfLdFvlE6k7nnbLNWz1dAHdDImDOJx97hVRvZEtVA3Qw==
X-Received: by 2002:a05:622a:418d:b0:4ee:275c:28d7 with SMTP id
 d75a77b69052e-4f4abdd6345mr233834171cf.75.1766536660002; 
 Tue, 23 Dec 2025 16:37:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861fcccsm4441056e87.85.2025.12.23.16.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 16:37:37 -0800 (PST)
Date: Wed, 24 Dec 2025 02:37:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <vv7o5wuxqcg6jbj3jnzrsk6fmsdmshvq63syutxd3jfxgdkjsv@tunwxas2ebc5>
References: <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
 <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
 <1afebfb7-00aa-4f19-b6c7-dd6fadb83664@oss.qualcomm.com>
 <CAO9ioeXqP5i9hEa-DfrEvK3U-3py9KjdMmWnjzZ9kGd4BPqdYw@mail.gmail.com>
 <9fd21cf7-6576-4091-81ab-a09be6b7579b@oss.qualcomm.com>
 <CAO9ioeXKBD0ab2+FmNnFQozKq_cp+hFwc5B6LtgfEC2FLULUYQ@mail.gmail.com>
 <b01eedc2-24b6-43fd-b729-85eded2d6b34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b01eedc2-24b6-43fd-b729-85eded2d6b34@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwMyBTYWx0ZWRfXzE0/nHHsgX35
 CGSftfRxW6kvWCNrvip3f9QxudXyTO4Ay9gNm0fbZKOLxcxkW1jr8bHGQcpgIH8Xo+UPbWWfNcJ
 gJ2jRwy0ca0ok/BFZRgbUC5ChPCysqfNMmaiBkpQk8xwdyZpwoVpkulM7t9MajN+YjvXGl4/Y0b
 3fOlpn0pcw+j5PDqeDT9k+cMCpVedHHc3zjuzcEcNmEcA1Ej2F2Elcrn4Nmr+wS3oMRLX4u3J6t
 2ZeI3kzHnU/5WB+xsKJ8mE7Q0NB+ZatFkzNM3CxfoIXeAwG75VYlBETaeuzAJH7xSPgsKvaFAlo
 0yLMdXXey2V6JFDQVwh3Roqi9W2FhZirOI+KipcE9i+chGNa9Bil3swblrI1t37QZTKG+vu0LuX
 19tc32GB3tkRzkl35Mkl6bRe3EOZrTNvrDljtBwbKtzwA3BBjLpRdvXHJMyE1FLAVdwfG1WMSHq
 tCKpu4/NUf+ku+59/mQ==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b35d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=uDjLizC7a5IkTmk2YkYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gy8QMrmFWqtWDEwy90_KkqjtTAmz94O4
X-Proofpoint-ORIG-GUID: gy8QMrmFWqtWDEwy90_KkqjtTAmz94O4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240003
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

On Mon, Dec 22, 2025 at 11:59:34PM +0530, Akhil P Oommen wrote:
> On 12/22/2025 4:54 PM, Dmitry Baryshkov wrote:
> > On Mon, 22 Dec 2025 at 12:54, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >>
> >> On 12/22/2025 2:45 PM, Dmitry Baryshkov wrote:
> >>> On Mon, 22 Dec 2025 at 09:19, Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 12/13/2025 12:58 AM, Dmitry Baryshkov wrote:
> >>>>> On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
> >>>>>> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
> >>>>>>>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> >>>>>>>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>>>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> [...]
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> +                        gpu_opp_table: opp-table {
> >>>>>>>>>>>>>>>>>> +                                compatible = "operating-points-v2";
> >>>>>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>>>> +                                opp-845000000 {
> >>>>>>>>>>>>>>>>>> +                                        opp-hz = /bits/ 64 <845000000>;
> >>>>>>>>>>>>>>>>>> +                                        required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>>>>>>>>>>>>> +                                        opp-peak-kBps = <7050000>;
> >>>>>>>>>>>>>>>>>> +                                };
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>>>>>>>>>>>>> or mobile parts specifically?
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>>>>>>>>>>>>> here.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>>>>>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>>>>>>>>>>>>> except the 290Mhz corner. We can remove that one.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>>>>>>>>>>>>> speedbins from the mobile variant until that is supported.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
> >>>>>>>>>>>>>> non-mobile platforms.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> We cannot assume that.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Even if we assume that there is no variation in silicon, the firmware
> >>>>>>>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >>>>>>>>>>>>> wise to use the configuration that is commercialized, especially when it
> >>>>>>>>>>>>> is power related.
> >>>>>>>>>>>>
> >>>>>>>>>>>> How does it affect the speed bins? I'd really prefer if we:
> >>>>>>>>>>>> - describe OPP tables and speed bins here
> >>>>>>>>>>>> - remove speed bins cell for the Auto / IoT boards
> >>>>>>>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
> >>>>>>>>>>>>   declared in the GPU.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> The frequency plan is different between mobile and IoT. Are you
> >>>>>>>>>>> proposing to describe a union of OPP table from both mobile and IoT?
> >>>>>>>>>>
> >>>>>>>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> >>>>>>>>>> has speed bins. How comes we don't have bins for the IoT variant?
> >>>>>>>>>>
> >>>>>>>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> >>>>>>>>>> Auto bins:   0, 177,      156, 136, 105, 73
> >>>>>>>>>>
> >>>>>>>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> >>>>>>>>>> starting from bit 21).
> >>>>>>>>>>
> >>>>>>>>>> Mobile freqs:
> >>>>>>>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 156:             745M, 700M,       550M,       435M,       290M
> >>>>>>>>>> 136:                         650M, 550M,       435M,       290M
> >>>>>>>>>> 105:                                     500M, 435M,       290M
> >>>>>>>>>> 73:                                                  350M, 290M
> >>>>>>>>>>
> >>>>>>>>>> Auto freqs:
> >>>>>>>>>> 0:         845M, 745M, 650M, 500M, 435M
> >>>>>>>>>> 177:       845M, 745M, 650M, 500M, 435M
> >>>>>>>>>> 156:             745M, 650M, 500M, 435M
> >>>>>>>>>> 136:                   650M, 500M, 435M
> >>>>>>>>>> 105:                         500M, 435M
> >>>>>>>>>> 73:                                      350M
> >>>>>>>>>>
> >>>>>>>>>> 290M was a part of the freq table, but later it was removed as "not
> >>>>>>>>>> required", so probably it can be brought back, but I'm not sure how to
> >>>>>>>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> >>>>>>>>>>
> >>>>>>>>>> I'm a bit persistent here because I really want to avoid the situation
> >>>>>>>>>> where we define a bin-less OPP table and later we face binned QCS615
> >>>>>>>>>> chips (which is possible since both SM and SA were binned).
> >>>>>>>>>
> >>>>>>>>> Why is that a problem as long as KMD can handle it without breaking
> >>>>>>>>> backward compatibility?
> >>>>>>>>
> >>>>>>>> I replied too soon. I see your point. Can't we keep separate OPP tables
> >>>>>>>> when that happen? That is neat-er than complicating the driver, isn't it?
> >>>>>>>
> >>>>>>> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> >>>>>>> as a max freq without speed bins. Later some of the chips shipped in
> >>>>>>> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> >>>>>>> MHz. The users end up overclocking those chips, because the DTB doesn't
> >>>>>>> make any difference.
> >>>>>>
> >>>>>> That is unlikely, because the characterization and other similiar
> >>>>>> activities are completed and finalized before ramp up at foundries.
> >>>>>> Nobody likes to RMA tons of chipsets.
> >>>>>>
> >>>>>> Anyway, this hypothetical scenarios is a problem even when we use the
> >>>>>> hard fuse.
> >>>>>
> >>>>> So, are you promising that while there were several characterization
> >>>>> bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
> >>>>> to the max freq?
> >>>>
> >>>> I have cross checked with our Product team. I can confirm that for both
> >>>> internal and external SKUs of Talos IoT currently, there is only a
> >>>> single bin for GPU with Fmax 845Mhz.
> >>>
> >>> Okay. Thanks for the confirmation.
> >>>
> >>> What happens when somebody starts working on a phone using SM6150 SoC
> >>> (e.g. Xiaomi Redmi Note 7 Pro)?
> >>
> >> Update it in a way without disturbing the qcs615-ride.dtb? It is safe if
> >> we add speedbin for Mobile in future, because KMD can correctly handle both.
> > 
> > Corresponding entry in a6xx_catalog.c will receive speed bin
> > information. Will that break compatibility with the existing
> > qcs615-ride.dtb?
> > 
> 
> It won't. KMD will select a bin in OPP table only when a speedbin nvmem
> cell is present. If the nvmem cell is not present, it will ignore the
> speedbin table in the catalog.

I'm not extremely happy (and I'd prefer if we have added GPU bins in
this patchset), but  technically you are correct and it can be done
separately, when somebody will work on those phones.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> -Akhil
> 
> >>
> >>> Likewise, If I understand correctly, QCS615 RIDE aka ADP Air uses an
> >>> auto SKU rather than the IoT one (please correct me if I'm wrong
> >>> here).
> >>>
> >>
> >> AFAIK, IoT variant is QCS615 and Auto variants uses SA6155P chipset.
> >> Both chipsets are functionally same except some fuses.
> > 
> > Ah, ok. I wasn't sure if we are using QCS615 or SA6155P in the Ride devices.
> > 
> 

-- 
With best wishes
Dmitry
