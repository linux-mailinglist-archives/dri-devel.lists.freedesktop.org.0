Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC89D8560
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 13:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8534710E124;
	Mon, 25 Nov 2024 12:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNLquEGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E038E10E282
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:22:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APBEGGO019168
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lGsgBh8DX/jnU4tUYXMAAVV50pnLwHeeReg1oTVAlu4=; b=UNLquEGoHdX7qF5a
 BpFSsqJ0XeN5kVIEySitp2WQ9UBVp/BFZX9eUrU5HbMPs+f8dg1HLl71sO6yqajS
 ZvfA3cjoGkb5KdooWlqkZ64kMSAN9RH8D8gBuL/9w0MB/cyTBHGIUoKmyI20GLJl
 y7N4Yeo2gzdb8ymmnm/yWLCVhmOWMwlR0enKkSDvcTAIz78g8eAb1OA4J8kdCSk7
 syajxlatH9wixOkEooQOSW//s7etUl4LjZdypeXozwqG4UoQgmbXD7wB6+BxqI4x
 afHIR6A0S5/tdwqL/QIE9HhhpKh8zCtSdO9TcL9lLU5KC5VhzDBZdM6cJxgthWHf
 at2fdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmvw9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:22:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-46698b09335so767731cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 04:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732537359; x=1733142159;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lGsgBh8DX/jnU4tUYXMAAVV50pnLwHeeReg1oTVAlu4=;
 b=l9cUJdnUc6a86WxB2nCcnzu6beNWY3R7L60/TL+yA585lVBv5M3P2ZWLXWjpwYCbGm
 V+h9Ryrt+SF+RqH1Pyym2JMvcTFBgttWTVG2aimhlh74WbY8QLSAapL6SWoIM2QP0AtC
 FQ860gT/W1CbzscBrpZwhkf1iPhq91z08V/KPQsETqMm3mHd+Ccy3TiJNl2XtFlY9pN2
 g6lhkbS9TOQvoO2PsSltLw9lcoQ9XZBanNzehVgqSQ/NOTRpgC9EjoEImyDlyXxqL9Bt
 UdJw3Skag2Ze34m1mEbsJCdPeT5Ho8Cs2r6a/Bs3iz8DdF9xEpAcBxXre6VHzQ4Kvy89
 Q6Iw==
X-Gm-Message-State: AOJu0YyWqJJUCnpnt+9Ub+IT0j1LkPH9d5cFgoDSykCJaW3U3XkM2ere
 fkDea6Gv9FMg2M7hOHAGG54d/wfEIlAJ8KAWgCTnVzKib3xNOUkDC17qWfTLmgVRxhEIohZd+47
 QMPQaR9Y5xVkELdzLTIlj6iKI2THsVCh2y66ajCnkclMRuiSaETsIM4MzrksuABBQIIQ=
X-Gm-Gg: ASbGncvtSZQgFXNAf7gMwcBF58HNC6Vq/M1teCLT4CkahOpPB71w9nvsdA+WufRQu5n
 qHsgAGCv0vaN2oS7YtRLFo7p8xaEtw81hi9UMGZAqAeI6slgCGprIVNAgCPm6sR46zC9m/1J01m
 OGcSxaxlbkZIMl4IBkTh8kMMkdGAiXRIy6yNgc7nCV6kHoZ2AKtjrFuscV0HuWVpbtCcFanlMYv
 EVBSprtXl4SQ2NXif2ci20yq++E8gn+SJCDAF5LVqPej7gBm3alF5zh0/1jGNFDuC++jO/D/nDJ
 TaSjk2VqAJj8mZmLDqifQSCjwlYKdO0=
X-Received: by 2002:ac8:1246:0:b0:466:88ba:2031 with SMTP id
 d75a77b69052e-46688ba2359mr24593581cf.13.1732537359034; 
 Mon, 25 Nov 2024 04:22:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp3cHKk6o39VMe0fU98GsfCHedykBDk3Eeru+jtD6QzHbQvQ5UtCYJJftsXO/hkoFpN8NJWQ==
X-Received: by 2002:ac8:1246:0:b0:466:88ba:2031 with SMTP id
 d75a77b69052e-46688ba2359mr24593201cf.13.1732537358419; 
 Mon, 25 Nov 2024 04:22:38 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d41ae1fsm4042118a12.79.2024.11.25.04.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:22:38 -0800 (PST)
Message-ID: <b13f35be-eeb8-4e29-965e-a7ac3cc4d3bc@oss.qualcomm.com>
Date: Mon, 25 Nov 2024 13:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
To: maud_spierings@hotmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-3-002b723b1920@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241124-asus_qcom_display-v3-3-002b723b1920@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MhcaImhlEmZVbbq18uFta-vmK-L2gDOH
X-Proofpoint-ORIG-GUID: MhcaImhlEmZVbbq18uFta-vmK-L2gDOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=816 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250106
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

On 24.11.2024 11:00 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add the lid switch for the Asus vivobook s15
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
