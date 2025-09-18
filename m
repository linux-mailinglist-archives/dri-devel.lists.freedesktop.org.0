Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30BB82DC8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 06:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C394010E635;
	Thu, 18 Sep 2025 04:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SblFZEZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE88510E635
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 04:14:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3P7tQ014321
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 04:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aCNDmHkvNY9CrJM/mPFO6zJGKSeooOfxAkQ8HJXEz3s=; b=SblFZEZ498279MOz
 Hkw+Et0q6V/VIfMyuduzYbMcR53L3BpndHtO9HOuhb2f4Hw1fLg7919GpnCSZ5fi
 1lkPrHrO9HP3YOujDwG6g27veIL5hvZhaAQdhwGlwI2+qLld0ibftLFTVH8klWGs
 JGRqyDKY/3pbUdGBQGaN7MMCNYv4muGhK+bjdS6Sal9+5+g+iX0ydurZ/n632Hfe
 ChA3MEjRWwPNL9mzdQqP1dHosU8iSu7uVuXKBgj9BrG8LNeUdMjzoRRPuCcRPSwX
 7WDHvKZcSu4bq4XyH+ShQNtsXNeDbvmcPB8/WfYwu6sjb8d/VYOPF19fpvZtoIWt
 B+43Qg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu4vqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 04:14:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b54abd7e048so330900a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 21:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758168861; x=1758773661;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCNDmHkvNY9CrJM/mPFO6zJGKSeooOfxAkQ8HJXEz3s=;
 b=NXzTPgPb7RC62GLJ2QokUz3eySf46YexUTlTnuw3u8ndlKCZViIo0zgUuZ9+X5jHds
 5KxnwrryZ32UxnZGg0GyzJgt6amozJ40Xf67BPW6qTT+jQCR7hcaERyogCYc812PDxW/
 fuXNivsipiCQNJWNqHZAY6HEGS+GfCiB6KYql/MbUd0nW2xFMMCM1qlvBt4gDIgW4N3m
 cSV31VJFj/o/B3AYd2/P39w7eegm257WbjhYR+j0q6+bLz2L6cY0kbEgaMw+fp9zHdeU
 eDmYRe4rbmhR9RZSLG6hSsIgAXuICWy2j79V1h0R1D3tymaY52yqftaZu1aJCO/j+Iz0
 gzzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOoegt7OjJZ0sYc7VLm1n6ecCTwx35a6Ew/E3vjSuWHM1281ytukuen36cDIGUBrN0K7eGmyUg9V8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpQ7N88gLVMpM09+87mQQHz3ZjPfNFq5fQ0J+HePMGj4x/NMc0
 JPRyhIEYiPgFkuF/WiE2u67FbPZ7xwj4JLZzW+Y842xPXy93syuzkT0IEUvKNwmnkGfY9ognixZ
 w61GYk7/U3xanNhqsLIpd5G1YGeptalsrG2PK5gr2EYj2ZdFv83c5CdXKkY0iOoAijdMAkig=
X-Gm-Gg: ASbGncuiOLscYwBA7xrex0QUX+B2qX2z69D2WwZ51HqcCWCz3GeBBqDDU/HAwgYtt4u
 M7XHGsUXXt2BC+rrFRxB8C4DH5bIP+OaUKnnB5IIUZ6bj0xWiQBuQvHKrQiNyiD/6TT20BL1oP7
 mTXstCixbUKxOiPsd8p5FjF5hNcFwYR/+BrKxZuwOCmYslARc64bQXBp0AOkbQi+2H/wEJJ4+Co
 e9/3I4bUHOEdHjofzLolA8NS06/HZbes7OWPw7Zk+10OpH21lrxDcy9N39jhpseourZ9kqfRM3y
 crjqKxuf2bxGMCtN5FLdjbE53T3l4q746M1f43izme43f54hD7Sd9vhcf2EayqWjXLBNVvq1ffn
 /P+Kp/9XA4c27iu6sG1Oh6jI9oyyQmjAAw3Y=
X-Received: by 2002:a05:6a20:914d:b0:243:f5ba:aa82 with SMTP id
 adf61e73a8af0-27aa1e62dd7mr6641637637.30.1758168861319; 
 Wed, 17 Sep 2025 21:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEESmYhA9ZUlRBuUTUXtxNrHCYKFq5Co1XH0AnMN4ttsNfHWhbopdOhRVpdLtRhJpb6K+upXw==
X-Received: by 2002:a05:6a20:914d:b0:243:f5ba:aa82 with SMTP id
 adf61e73a8af0-27aa1e62dd7mr6641593637.30.1758168860852; 
 Wed, 17 Sep 2025 21:14:20 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306061aa5fsm996954a91.6.2025.09.17.21.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 21:14:20 -0700 (PDT)
Message-ID: <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:14:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/d/+mcb/M1FK
 0N1/F1DE28vNwaNsy0QLd5izDJPGWcmzcRZC+m0vOAPbT6uufqtmwEBqXZObPTX2hpZqlrMSBG5
 30uWCggJ6loaIcjSq2ipaBJTJIgbn9mfM40StDeQTwPtQYQDj1w41CyBlTXyyuUpcJN0eJ8JceH
 JxVc4MP01PiRvr9MwTQxdqMYoyebcIc+E0Opmc/eGiopJIT73EljPQhvvb9hzhT4AG23XYlIPCC
 5/pVCsXlmaBL8lPeCDXgEJflzIT8IhEmSU7sHkIHMMlx9mJZUzWPkDTEkStNv1Ag68N0Q8Yo4jk
 cu7hGOBXJMRsuDZmgUkZqIoTRSMoWaWvvenKRawcfN8EzkDmqq9QOxFwwT0a/d7Abv5waoSLHuw
 E9U9MaoS
X-Proofpoint-ORIG-GUID: 2V4QqZgG7r_hvU3LgJNeJ6s2NLZWBMvl
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cb871e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=zVao1zPCBEz49K_-8u8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 2V4QqZgG7r_hvU3LgJNeJ6s2NLZWBMvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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



On 9/18/2025 9:01 AM, Krzysztof Kozlowski wrote:
> On Thu, Sep 11, 2025 at 07:24:03PM +0800, Yongxing Mou wrote:
>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> Patch v11 and still basic issues. I am very dissapointed.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
> 
Hi,
Sorry for the confusion. I did intend to remove the Reviewed-by tag, and 
I mentioned this in the cover letter, but maybe explanation in 
cover-letter was probe not clear at all.

This patch includes three changes:

1.In the displayport-controller compatible property, "items" was changed 
to "contains".
2.Use "qcom,sa8775p-dp" as fallback.

These changes might not be considered significant. So I’ll be more 
careful next time. Thanks~
