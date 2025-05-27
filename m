Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28324AC5B99
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 22:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1713F10E197;
	Tue, 27 May 2025 20:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsuwHtTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF57D10E197
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:49:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RC9p4Z003591
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=; b=UsuwHtTT+19r7X8+
 9xmaaZgI+E0BIU70xalEcDbNCLUWA3zODGfnv3/ro6F7QXVxsRWDTWwby1mIIJfB
 W8z2bntkGEeR9PFuJqqDMH8dlrAKdVUw3qxjFFb7O3+F98T+bWjAh4Lo/WqA8gj5
 Ymffg0F32lHihXoT7GeEg3BRyPZu3RX70+mdjrzLjgji3SKwywfI7V6RDMuUWHpP
 mWhc8g6vUvxkgPjIMvMfEXVvLpnVcuQI2qNMFUHlKJAEHQgo+yn6w/111Xgrpv8S
 ARkHdfBTbl8Y2ByIpLAcep8iN4/qLAK91a8pqvU4NgKeovig8qb5MvcwvKY7fvSV
 N//IMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wge6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:49:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c76062c513so98984985a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 13:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748378983; x=1748983783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=;
 b=BuGKMP82BSfqOoZz4r9XATVFkdqya1jadLlxf6txOMBX3zC7pyOe2KgB+uAgK5h73E
 BA/s2LTxmxrDiggWmKnlEQrTObFO0BnT7IwPk7LzmPiwh9oawL8ip+6sFU57+5NqIKpo
 U7I6DbeIcfH9apH6E4DUWw5Ds+Ua9b/xCs6I87/NUjlhHocfF1uhaHyqSpBwY1rX49dD
 n9rfBVxOU1LaVeKb/9Ss+g3rxhxeRshs/0kx/BbqnczKZ+QMVRwmwA0fIcaOB2KPuJyY
 txr9Nxb4kk7gfYfS0xQPnOvSdfWC+OHu9juCKXLX8Scf35UxIqp7BKuVXMeLI4n34e0l
 2nNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbidtPdVt81vYyr++dlf5QPn7C+9TB3UCBQd+o/8pzrrExMu7k6RTx3ZQsryykxYVCkk7JS1VtMLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYnqwAzwCPwMx3lRx+E+83H4QjiW1q7Mlh2TXNmfLm4AHAESif
 SAXJt462c12YG/YFpuGceHECGvObz1koAHyc33VWF8iuaANJgf+W8BnAjl+g7kxZUh1vJH4qHHu
 AwBUZ6YrnL4UtVH9pn/0qHzKohiDD1auWx1bXB4XuIgCP7qOZa1hHoZoOPO76M4KwXEIcCa4=
X-Gm-Gg: ASbGncsGSI/M+jZCIKQmgcXcjHeVg6BadhMrLWP6o3odeGc/q62fnmi4+CWQ0968NXx
 RrAvfc8zMqSfNyopmJCYsX/p8y+Fq4zktgcaJcXjevr1Nz44YxEtd77vu4eFQ1lDl7ilLO3xdeU
 sJGWDWNbi7wjQkpau7LB0AGCUap0CdZMFDNmZgbpUW/izAA+kyq9D9Fxd4XN2hKWSD7vlujLfxT
 B1w5iQ8VsShXBzuo3KVlPbEk4HXB9+EwKWV1nL9ffiXtA1NQcidch+a+sLlq2a8kTNzYtD3bbEL
 6RLqpLU47vLxbD6xnuZqna9Wavz1MECmtI7wWRs5sQCPjqORc01W2F4ZW78nSUhjug==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id
 af79cd13be357-7ceecb95729mr796618285a.3.1748378982911; 
 Tue, 27 May 2025 13:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Ja5XuujBwuUP9ccKnyssxrFJe/lbLz9Lqf/caKcpdJ8XAsoYbJmo6SDfbvW/t6c1zMYunQ==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id
 af79cd13be357-7ceecb95729mr796615885a.3.1748378982465; 
 Tue, 27 May 2025 13:49:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad89f2508b7sm8518366b.132.2025.05.27.13.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 13:49:41 -0700 (PDT)
Message-ID: <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
Date: Tue, 27 May 2025 22:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68362567 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=OAqA0DyV7igbTOjjZJsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xjjjHIonhTMGTVGpMVy3TEYvA152VBvB
X-Proofpoint-GUID: xjjjHIonhTMGTVGpMVy3TEYvA152VBvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NiBTYWx0ZWRfX8X1t8xft7TcN
 yjDYboK792DxbCJ8MJPQDDnHixfJN3ur/w/6giKkQQHpwRH2Ir1ybYgqOjZSaNbPVZjQ/OaWTSN
 4csSCv+8Wzf2SOT5E+7k4fkShtKLxowJxhR7wedgrzeQbEOE2DLrMJwvxcJ+k3Rp1luLRE9T2fc
 rLQwLZ87/05ewVQccDkCOyA6sjWdCAFQkutN8lnrEB/dn3Zfz8vXopRPh25gkKFlKQNBg4/XaYP
 GW6UnAAt57/bxFkUbDqvrpW2Iirc6q9U7Z8+eStboT55iFysWadiLCNVjCrDWnqFSk5ljfh+/Yb
 YK7HS7gkX9GHJKlR+O7dn1accoPWJVSXG9vQDPgbG51mWGhD03bMERbYVcSotbrFcQSdyjZ+Ve8
 RiGn/ZErZgpZ9r0URNb582T2fu85W2wBL2elInryIIXYT7Vi0CriGzRAvw5l6+aXi8+uYDw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270176
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

On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>
>>
>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>
>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>> when the link training #2 first attempt fails. This approach enhances
>>>> compatibility, particularly addressing issues caused by certain hub
>>>> configurations.
>>>
>>> Please reference corresponding part of the standard, describing this lowering.
>>>
>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
> 
> Anything in DP 2.1?
> 
>> - All devices shall support TPS1 and TPS2
>> - HDR2-capable devices shall support TPS3
>> - HDR3-capable devices shall support TPS4
>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
> 
> Any other driver doing such TPS lowering? Or maybe we should be
> selecting TPS3 for HBR2-only devices?

Bump, this patch looks interesting and I'd like to see it revisited if
it's correct

Konrad
