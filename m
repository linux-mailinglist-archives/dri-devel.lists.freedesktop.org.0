Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7CC979FC
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE82510E3FD;
	Mon,  1 Dec 2025 13:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2B6F0tF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrINoufH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E0A10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 13:35:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B16j7l83690423
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Dec 2025 13:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=; b=c2B6F0tFjcrU9BYT
 a0r1Ayf+l2wd9/lm03szYYU5V46n0Hnurl62hO6470Vec56G0gQq+4bziEN/J0FQ
 QB+Me7IsTSwDgOyUgWbkyTd/QenUfVOc3juvb5OiJdb39Gy+ZxpGXo7c/l5hCwa1
 Qu7AMk/JkF9VPbdsmkqgkqoXU8Hlz6JVtQYBIR1mDYDSiqy1grdgYGiUraL8lXm7
 eh/hAGhJITR4wOtigTrQhadCsXa7xyV0SWMaqPTwYG5cp1+D8HHrtj7qiNFTU2r9
 j1PZoIg/brkw6zGai+wXViJa6R87LAIla+QzDAvcgfkaXBf3PPL6it0DINHN3Jg6
 gBvS6A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as614170j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 13:35:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5dfbe140bffso418083137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 05:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764596149; x=1765200949;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=;
 b=UrINoufHQiGse7BDnJh5IaZvFL459Qi7Rb1balwaa9XoecotdbwaM4nJRstZyvm7HJ
 uAtBmEBKvPAe+4G/1Btv2OVMW58+PEoJoO+okagqssqxkJyHrMio8RVSVpeduwS3RpNe
 u8a8fVAzXom4yEOPRRzFwkDR7Ao6Sbejk5mHHGqR37fU+omTKBWQ9jkBoTwuGmFbGHGZ
 nm+BuYi79iGAoRupb4TGtpB4Q5vSAoV7/Yjd0ujIMWVuWDKzI9RBrCwZTZtgyGbo5E/1
 xYjSKARaNVJGflEh6Wz4P81wp8LE/Tk8xL+SManC3iTvpA2upltShcUPAvpZq/eWSu/y
 PeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764596149; x=1765200949;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=;
 b=aAwB9vvFsI9LsWGkMemBDZJJC+n7NGvVw/Qbo7CSCZY8Cww1n/5RqLAR0bW8+0jo0j
 Lb2/iWV97OvzR8QE8FNuT4EQcKZipGjg54sT6/kRxQpuaHb/ghGG9az/wirr5FDRBYKb
 Y/LSkjOukMbHiHFvLNi+L+vuuZsKzTlc10Oqcdl5S76A9LaZcn8uVWpIMW2a4u2o7Qig
 w+OdP9heiwa6Vz3rHceucAmgLiLU4WEXn5+J6VbFGcuvh1mXw/dJyY4riNnF37aJDVEQ
 YUxj2nLqpBeKtA1DE3vk+awOaviNy/XRWDrwvtHmW+C+PFgTY1juc0UCbWygOLGLl1vb
 TF3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzU6p/NncT9pfT4udlz/eFvxB7j5BHRQtYVfPLrpTQ1o1NzxlBU4BDQTjz/LrkmGYotwLhn6oUDs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdmUBfUdq1UK4wW5PoCq1XUgEwaoK1fmEsVeGWauz9CNigraLp
 LjW8Snk2yCIQcjHowz2S9rVXh5YGC5Mh/FhLExd+PeJLKEsx5k2TBUHuma2RAa6zzNQSOqGcZJ4
 qN12d136OMhBL+gVW6iSiRBaJdA/5U3v99+tYqaLtVSICB/AvMZ6B2EKUx39KeQNjgoV7oL4=
X-Gm-Gg: ASbGncv4VcbRCmvzu642t2rLPOvrxNgKNYmVtcJwd43hYqWB7t7W78IJ81Fd7+zMef4
 hU4o6wN3ObHMRUeiTmG6qSElVP18R5vvOj7MW1Gdp2fKZCJ/QAtF95hkG7mW+B1x4CuMgMP7aRQ
 j8JOZ6Cs176GoRuoV4Azp41JAKqXlTkGkTf9+VJ3BLpiouhMKab2HopUwqeZ54RbNc78SkKUPhd
 dZYG3icetf0i8gzzb536rzHXjKnCl8NWtBCyy88OAC7zGNxsyxVrsRAphpBOWpMwVvGdu8mTEwg
 Cxeua+EkBspdYQR1Ke34WLW1Bi35ZHo4maV/m66YNl+c/QVQR6AlrlyujgzjhjJcnux02qYFXL+
 eT3SIEStbSSHYMWJuGjDcLuRrRUa/cgH1C6xLtdgdjju4dCGtvOKs/fm2Xst24I6Pex0=
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id
 ada2fe7eead31-5e1de56cb5emr7410347137.7.1764596149138; 
 Mon, 01 Dec 2025 05:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIEwD4EDN19spY8zdgqRbNhH3BpetN0hw22bq4r1xGtt1Ytiy1Dj8is8Rgsg4LEhNka2bT7g==
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id
 ada2fe7eead31-5e1de56cb5emr7410299137.7.1764596148634; 
 Mon, 01 Dec 2025 05:35:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751035af1sm12781918a12.16.2025.12.01.05.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 05:35:48 -0800 (PST)
Message-ID: <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692d99b6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qKhk4BsYAtMBMWEJztUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HofgyMfvjghXnsDwsNPsSezmcYSw4efQ
X-Proofpoint-ORIG-GUID: HofgyMfvjghXnsDwsNPsSezmcYSw4efQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMSBTYWx0ZWRfX7BUjT0X/nhVe
 RL/0p9Ke5FLaPnpfcH/RwiQem460mG91zgOIBMDgsdzK63eTvKIL9fpnt++My2LuCDfhBz3k21D
 2hlBs8EqG9QvLP2V5oSl244h4AO0eat1+W1rw8Xq8pyxajtW0DfgVUjU+pvorXR7dbW5XFwlDvz
 Mql4LdHovmFXN8zE/R/5QlOYbBOZ3wQx0JkdW0YDYV/LsH6Kjgr1tQ5xN9DN3Fw5MrDnjfAtFnb
 zy7QiuQL8nZmBvaGoF/3OTFBNpeIC4AiV4cjrzHJkZJRcsj2pkjKN4EZ0zyTPHC3a+5DA6108GU
 YFBWEeO0Olxes98H751O3S1qdQ7DQJyOWIj7Y9FyFDOw2m/xjKXb+F4foVMaqLbetp3NTLbwWgJ
 RhNPGFBiJqyR0CsYbcE4UwnHzQG8KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010111
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

On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp1: displayport-controller@2215c000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x2215c000 0x0 0x104>,
> +				      <0x0 0x2215c200 0x0 0x0c0>,
> +				      <0x0 0x2215d000 0x0 0x770>,
> +				      <0x0 0x2215e000 0x0 0x09c>,
> +				      <0x0 0x2215f000 0x0 0x09c>,
> +				      <0x0 0x22160000 0x0 0x09c>,
> +				      <0x0 0x22161000 0x0 0x09c>,
> +				      <0x0 0x22162000 0x0 0x23c>,
> +				      <0x0 0x22163000 0x0 0x23c>;

The last two regions still happen not to exist

https://lore.kernel.org/all/vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m/

Konrad


