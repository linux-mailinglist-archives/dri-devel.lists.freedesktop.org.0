Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC9BD893A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6EB10E588;
	Tue, 14 Oct 2025 09:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNOVm7Nn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9389610E588
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:53:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87JPl030974
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F0bffc/XzD9MvQE2h6D3BwBGaZfZTTXTRLHrFoBclpY=; b=HNOVm7NnkRJjzTul
 4m27bq5RnHkIE3pKfuThw6zYZRcYVwqQJ4GLjTZ2Vp7Km/aUk7yILUKO3HKu9+qI
 u0cfEd2rMsLDqe2JzDWL7AVj9HtcYNfQ2VBGAQXvVckTmyn37lKPPKEfy03646At
 0Mc2Z4WC03US4WqVvLrAUKMLsAG8zZ/5cYEn8t9e/95ZWXFlxhi4v0gKmYUI3sD5
 mVhFvSwg17f3htGliHI27DkfXtPkzQjWL7TO786c3ZfsHkQ0RbazZPMW2o7k6lw8
 XILciNaxVBqsFMNLYQlvfjbMdgxQZR+xsRmAUrB0boAsouwPJUFz+zFGv5swGZC9
 Bo604A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0qynd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:53:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8649a8dbff8so226590085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 02:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760435579; x=1761040379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F0bffc/XzD9MvQE2h6D3BwBGaZfZTTXTRLHrFoBclpY=;
 b=RKPCnb3wF0bQgiQw1RGSvvrIWU5gkm12OxQJUXphPEga4nZycU62OHI7q0pHfThjqN
 NDB8Fub8LicxJ9Ge95UpZWd9G1ARliPAqyISsTxxUMyMU6IMojn+vU2Sd6sF0wgZGsDC
 +P/xQp2kyYC1m+AzePvc9vdefbrpC3iM4uSW6dEzVmJmYLHvdcoXezckKsU4RWb3iK1R
 Q/kgW0N+8XvOnpOtZ8j8MXLwdCXSN5cwXRNsWXBgapI+/dlBy/6qVVw1oSF7WWW85ZE7
 6yZmaZ0boRtK87nCIbqOeU+ItAuxsckexKnHUV3iDqy0X/W7JzcRFzlJWAV/EJk9cZXF
 NokA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkB09P2ho+HUlUPcL+RGdZ+PEbBiCGUbe2OBdAdAbFDlmivb6pzpB7c6sKWH28/y24HNvfVvRRrjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzODnPrPCa5HJzL+7lvloh/kJJJI8RXbGkdrp4ik+gKrqvkGNjr
 3/bTgjfLK0WY9TKNroj5d57mKJsF0eh+D/7+wb0xz0UnTBD5xG8hkYPTwHlmLVWurZsj664x7WM
 Ooo3QlLj63zUESvAS1QdNj9qQ8g2OEVIWrS+EwoJuyOI3r73tIBQPR6oODG7KhOWJGByf0/0=
X-Gm-Gg: ASbGncuED4AEK6v9aRBXa0ON8JYHwDVyNVPu7amZ9ZDZoSaFd2NBdwznHS/1lqJVGDb
 qAEPrKKD0oOB1hXYbkv0FnJZAM1LYu99Q9ed8S5I6R6nXn5kW8flRDxstRf01qsOPstXpEJ5pOq
 QkgN7zcdNsA+wqvndVOI/as+2IwlN+cNvMGQTaPRawzIKDMw2dNAGqdT25xMxFOjE87xPKBAoOq
 jbohaoyfXJlP7SxPTu8P5Qs9zOAtMvyhD+YtJX5bg+3ar4kBuHNtXD9TbVJ9U7l+k3W25Uh8h0r
 C8dXRlJjAKz6A0J/iLaNcz/K3InYQJihaoDK8JuEEGTWvSEuR40ukA4kKUxmmG+R9N3BoyJHcWV
 sRyXbWs1KSs2fPXllJ2o3Vg==
X-Received: by 2002:a05:620a:7012:b0:862:bd48:923e with SMTP id
 af79cd13be357-88352d9a2c4mr2163599185a.4.1760435578878; 
 Tue, 14 Oct 2025 02:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnUhF01Zofq6EjRpw5993//+lfD9xui8peDVWDyOkLe4ZPEIW0HfK9WyJ8gfgXNrAo6KOw/g==
X-Received: by 2002:a05:620a:7012:b0:862:bd48:923e with SMTP id
 af79cd13be357-88352d9a2c4mr2163596985a.4.1760435578438; 
 Tue, 14 Oct 2025 02:52:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d65ccfe0sm1114443466b.25.2025.10.14.02.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 02:52:57 -0700 (PDT)
Message-ID: <509e9902-2f74-484f-b5ca-e1605a221004@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX06qlBmNrE98d
 janAn2yKQTsXt1E3raMh619YyhvafEyxoNH/Sv2LmtUxBeIka+OKiE/5WSe5Wq1WZs7rgJfWYUi
 2Sd/e+JpfmOSkItdc08FlgTWgNOb7tAd75iX/rmcImJkl6BsxLB/G9YLkW5h477sqvvxlJBKdAs
 HzkEBpzfHGSjK0Y3JWsCL6SExnUAuWJ+/E4CAvTsOijVAxLExHfE+B6IGYuFyFGg65G3/aL8brB
 r91mu6HIr2tDr0iCo2YkbnyWCTA12V71RhycwX/ZL6ttRvdHdnqmVPJHQJk8q/sniCKN4EpOC9H
 YVBayab7qh1yVE7wiuX09zgyf/3EevXG1noWxHbKIL2bjPsNR7kmB3hpfJAsXsrcQC6d9LFEF4+
 S7WvKN5VPcrFQxrrkG4KZuTTGtym/w==
X-Proofpoint-GUID: tKb11H1oVJjNn3G9_-GGpqerzc0K4QTq
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ee1d7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-JAsjFMKCY2WfoXnbYkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tKb11H1oVJjNn3G9_-GGpqerzc0K4QTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/14/25 11:42 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings
> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

subject: "qcom:" -> "qcom: qcs615-ride:"

[...]

> +&mdss_dp0_out {
> +	data-lanes = <3 2 0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;

No 8100?

Konrad
