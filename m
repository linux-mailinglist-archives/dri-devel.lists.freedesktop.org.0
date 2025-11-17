Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1CC64388
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716A910E3D0;
	Mon, 17 Nov 2025 12:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ec71H1bi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES0k6ZKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0360010E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:58:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHBgwwI3040394
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8spAh8QNxCgY7oAIc47unleOf4zNEJucX6DkSxfwz/w=; b=ec71H1biUeJNSiVp
 0mpJKbliv59z5ymVBJVkn1Qr4Jn07Opz8g/xCSzlMhrkocU+AA69Dmw9diFFbdCs
 T1Ky/YmB9tgJjyWob12fMuwH7uERMtDx0GNbZeBqojnMLRjW6r1bATuQO4VnzXZQ
 mp/4encYjq9IE8lljNfcD/SGXF1CqkpxBIyP72nPjlJW/m/BL+iFj9QNq/ocQwWR
 uCa6+pTafmh5I6iqWPCTxXi2BX5d3i0kDMEgwrFFXbhWFiE/QM9p/flKJuwbnmRC
 ndJ4LXHH8dwVawb2+Zee8VwhPACrs1sPu0jMLCIITAZfsE+jAk0ngCArf3qHrwu1
 GoAeVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh04s1q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:58:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed83a05863so17073301cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 04:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763384302; x=1763989102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8spAh8QNxCgY7oAIc47unleOf4zNEJucX6DkSxfwz/w=;
 b=ES0k6ZKaPstutJU8KQhCBGO7Vpbm2IFdXkwKpc9xF5s0Tog+6A89kAsKAOUeD6F+28
 4+9laCiJBdnsDsrQ/WT4d00IWBoe+ERo5Dkqtptcervf06vixZLUgVArzRXQOM8j3ehB
 r/pjmpo36yHeNLzCQr2FHlXbvmIrpHrlE7VJRzitfBmUe3LTsvjIojZJurdPknOHdf32
 1Y3V3PdvyZizDo/OsfesOEJxVQX9AZx7EKc/z8O2aUGoO8SPzZyXZzBerB28mLac3ZKZ
 TdtIRjqeSMRC8jiGNv4H65fZa+5gI/uOhnFVektP3K09Q2fhXSXN2BPCmTfEwNnt4THM
 vxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763384302; x=1763989102;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8spAh8QNxCgY7oAIc47unleOf4zNEJucX6DkSxfwz/w=;
 b=kO3kO9GEiSDmpaQU4Ujr25YR9DFPaW9uJ+MUNyjN3anOi+zcPjYuLPpuYyUfSHbfh6
 vCCawP+jmRM5pH6QpWIH3Hv2l1uvFF4XrHyEcfKxvL4igN3tJYMlfWuvjNJj26ilQMhl
 mNBxDr1h85hSYt2IjwSQL4X+n9GnPnWOWHM/yA41ObFZAZ12k1zQk45+g6uc7oGVLCSs
 T+NLFIm/hllQDGH2b9pbMvm1R4J6H5SQ+nj/YV2/m+4cYBmf2jumrvU2IRi4FL6TraCZ
 XsDlbsGUlCNQePwUcWPndBsiShAaD+hlczDDdKBmxmp13H7yqivLGLSC9DeEkEVTvMQG
 7XiA==
X-Gm-Message-State: AOJu0YzzHHX/drIQfDnMK9uCsXGxtjPiPQ4xBFxoeMore6qYqUo3v6lT
 nOebN+qTdqoXmSdZ7pM/hvSXmaePavFNAfflwhutUwg+eBPZSXEdVq9j14cshchB0K8XwLglqK9
 ADfvQ42RrNB27vy8cNvFLKsUFNmcnKjmqabm6SXwgwfrx/wKuHeUtXOaUr32QUihPDOyViNg=
X-Gm-Gg: ASbGncvlAnG7hieOpfUpfA8lwChihNVFELSVNntjx9rdO2PBCdFX+87ERn/wTVzFW7W
 XXEIugMD7J0K0zvlopK2izwqiClboWaVV04AzE2A9uf2jikW80mos1YIlEbnIGXjn4G0AA1gmsr
 OdF7alDda35Fn5EsQYR6fLGNbgRHxjYJM+wKihk9fxSDSYjWVSOtnzJJniGSWtE6tptyVEfnfxd
 AvFW1EGqTRVHKX+DxhmZf82tUp1pQ/iwMRHdyEe2B/dudKgSyLVc89dR4yJjNCdow0Pmy9Pas+z
 dHNKsajzZ/06G/LG831/LLaNut+QGcnJ26lI36XKP7yHvwg7xkfJJJdTaqe06y5T35r1rvuof11
 mEHoUzOgv4nPTLyORMj1gsJ2H92Trz68jrYcTtM+yodKb04lQTy5SuNm4
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4ee087ee1c8mr54870351cf.8.1763384302473; 
 Mon, 17 Nov 2025 04:58:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIuOszFQnEdTG6xywYiSMgCVRX7PV/UsWoBbUQgI2HNhYueQciRMR7ZQumion8Vv8iYdd1bA==
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4ee087ee1c8mr54870091cf.8.1763384302086; 
 Mon, 17 Nov 2025 04:58:22 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed9d38sm1086600966b.67.2025.11.17.04.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:58:21 -0800 (PST)
Message-ID: <5a0c9cf9-6f93-4216-8f98-7a492dd20f51@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 ps8830 retimers
To: maud_spierings@hotmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-3-cc8f51136c9f@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-3-cc8f51136c9f@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691b1bef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8
 a=ucDlCoAaIB5v6D95Jc0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ObCOfO6ojGDAis4OxjYFaUKFILoSlKoP
X-Proofpoint-ORIG-GUID: ObCOfO6ojGDAis4OxjYFaUKFILoSlKoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMCBTYWx0ZWRfX1m0JlpCLiERe
 kOiZc4HOkncW8jaFTLngvwHh5QXnTCjyn7bzuyv1ddtvKhPcPSU7GRgShyKxB781vJcYtNat3DD
 OqNR1a5BXli0gwnPhqOI4WIoQ0rKpAdg6p97o6ZWcWjYD7GsOqH1w/eQvTDh0iUoqsCPsqeHc8F
 sjSh5Y1XumQaPTt9L5NTK+Hrb8Sef1Y1EJFTzmVZGbmYnJn0msImL1Zg+c8MWG0SMyEXR5vC/61
 lMsPDyEfqeZhB5k/9YaSC9JBX5f1rm0eWHDZTMk0o1inbX2jZhdFx4kT4eu/R1AxylczutgJuJR
 2q8SWabfur3Bo96NkaxMSOuHNXGPlRVFRqr4s4Gm+0dNwv3MEadQZBBmNQBRZDjVXhaaYf9s048
 jAbWjd3qiKl6QKQaB0eP4jyMyqxJWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170110
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

On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 has two usb type c ports on the left side, these
> use parade ps8830 retimers like the others, enable them to also enable
> dp altmode
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
