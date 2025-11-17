Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DF3C643A3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253F510E3D4;
	Mon, 17 Nov 2025 12:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF5F/Q7F";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiU78jxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048410E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:59:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHBVugJ3318399
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2wBqwAqowlt5gdoPKzSt8gOue47EZ4DUPa251PXU7Ww=; b=YF5F/Q7Fs+Gxn51b
 5aELFM11Sek0/g+VcneEwqAQ5uwBoYB1sCRfkgFo1GJMYe3ES+HlJ5r8nOTvaEsn
 wdPL7rptXl0TGugVoUqB27zrwCaxQomX9njME1hDWQyo39ufVTdHeuKK/YVr3v+6
 a/71T/IIaP+AyWyNV/nS6rUmFq+wYTu+rjwFT2RDCmuWX666d/ll/4qltCByuMSA
 B+DUJxvyFwc784w6NnzwNnyohFrQhmZmAiMiY0cf9OrfE6X/kPIKJ8X9wrIdf/t1
 InGQLc5q98ug08XnHXZXn2OR4QgGaYc0/85q9MHKM3z+O2uOTbwujcCa9QFQNY2+
 kYrdDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5cs1a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:59:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed5ff5e770so10743511cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763384374; x=1763989174;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2wBqwAqowlt5gdoPKzSt8gOue47EZ4DUPa251PXU7Ww=;
 b=OiU78jxBueF35+YB8RcI/dQTP3+cgzQ3uIUivgmOSUimcDPOr96l4coh2fP061dmGU
 UgMCu3kpehVS5PvwA2e8nYDUOCW4UHVW3kRY7jvS+QBHfqOXjb/m0QIlI/PwT0iUTc0u
 siWKBaQHGGSuB1RT9dIdhlnh+7OopINWfDm9LaXorTw5bG8T2HpmtPJSiWfJFz+Mt9X+
 udoNy1Ih9o5TgzOHm978TQueSlN6ctMYoLU7MmzdkUVvytQMmFvsRWcqG6QhptIGMlv1
 TTMf5UVo6kJEHgxKHDXFZapcLFSw3lJ3lnlpEcoTl0Fe05zhzv/NSu74LabX9+aFRBcU
 aE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763384374; x=1763989174;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2wBqwAqowlt5gdoPKzSt8gOue47EZ4DUPa251PXU7Ww=;
 b=DC/+TMYEqXSANeUGInr6+/xGuw/i4PiZnTkX9YaiuLeeTNNisZoZBXON6+rTHQJpLs
 EhiOHcoaxfE6jb6GqvT/lI1cZnvTCHAy1eyM9G9HPtj7YDvFgNMM0H7ves9PMFw7sit9
 p8BZw7iwfUBxWEmhu4dWUtP0E0K5BX9zKUpof1jrvKC0z9mRvpyvdZ6dPaKD5pSrbGrR
 PmmwBTkl7xl7BTkmAKxo/5ZSVTgto1Ab2nRPt77r5MAHMoKf1lpkM1tECSV4QxsmrhQN
 eF3JLyOd2Bj/F1peAWtGRDffbZ7kQpPesku+GH7JNXOyVsXARXTiWrQYAA0y/v6M96Nf
 V+XQ==
X-Gm-Message-State: AOJu0Yz/XUqiWLUFNRyIj5/e3vLKGsAp5dHmZQKC2GvZTerEPPDqkY87
 +pA4CyBudtlfTCYruXEHMPDac9+p8PxVjFy6C3BD/D5gFt3aWabUI3lCFr6CPD4Je+bmySh3VyI
 oyGaCo0HFSKzGZFKc/oTwpVrHfn3ka72PG6thZoURFRHmOlxiTBoi7wdlS4mXi5FJks86b2A=
X-Gm-Gg: ASbGnct4yOWgdCgFbveJIGDmGvSGkaQ087LWX9KnicoZtTzw2pnuviSxGrmpw3C24NT
 F/CWOzbInU4xJdRm0Hd4Wf1TcNzBYQs+VRg2myqEr1cY9bAJ8ehT8kvlWaaBSsEA09roCVSJ/Ar
 3g4I5ahVW2uYEue8YlpKKZXAHndoPr6A1gwO/+oMODMUBGWcUofl89L6wqxsn5+WwlciON22V5F
 4vrLlCjhXC3F/trVynglySv+T1DDz7aZbOjfYycAqAnl7ti/z03fPrF4+4C5K2ITB+iOpXZxvFn
 ngY/O0731EvElVP689KODb/VFUJtIxuYwH5SwobldJFrxvm2olFv7W9L4WgpG+QytmhPHJt+aw7
 LtmVyYNqR28yLjY55pS15xLait/ukyn2NDeJbSQRgoYE5niGnssc1nT24
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id
 d75a77b69052e-4ee2339a1b0mr23147691cf.2.1763384373748; 
 Mon, 17 Nov 2025 04:59:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMoEnycdD3w70U1NmIvIEUXmP2lG17YpfSEEGfj8P8nU+BACdCGVpPpkv0IHj5+BPfSRPqiA==
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id
 d75a77b69052e-4ee2339a1b0mr23147411cf.2.1763384373244; 
 Mon, 17 Nov 2025 04:59:33 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm1066827766b.15.2025.11.17.04.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:59:32 -0800 (PST)
Message-ID: <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
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
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMCBTYWx0ZWRfX4dz621PPoRoe
 7CTUHl3OtUyptMahBjeK9hXSCCy/ivVuOZbIey4QDkB+Gtz+JQqsx1ky2wEE/OyzlGpapRFc90Q
 Ws+7cPM9eKNDwwKBZz7IkCq1/1QhybsDPQluK/kslndMiABwhaJLTfoX0ICgiGOULnSZrxKi+xM
 nDPjvUH04LM2PiHKOxzJVP3rTnlx4HyBk4ke/EWGStKZUcp+r2k/KUqdvxRtYsnSqx69BVIGHfP
 Vsx1DZqv3PIhwILfQJD3Y5BzwqlyG8Dnjui0h34IFZt7e/H2oxcf+zEwTOC4VZgyjI457oS85eC
 g4tSidTxkAoLC/61RYRtzFaXRA8b8VzEJr1YIVT85jWCCv4EqhqwdgandOu94zqnPEkif2GNxcc
 1G2rtrJJBe1dKO/6VFkef3N9/TPgKw==
X-Proofpoint-GUID: DD5NJYVjVBSwlS8sYNVb_ckxKadIhSsA
X-Proofpoint-ORIG-GUID: DD5NJYVjVBSwlS8sYNVb_ckxKadIhSsA
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691b1c36 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=ucDlCoAaIB5v6D95Jc0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
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
> Add nvmem cells for getting charge control thresholds if they have
> been set previously.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Have you verified that e.g.

connecting the charger
setting the charge threshold
rebooting to windows
rebooting to windows once more for good measure
rebooting to linux

still has the settings persist?

Konrad
